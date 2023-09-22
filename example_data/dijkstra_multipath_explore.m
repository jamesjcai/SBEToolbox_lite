function [mindists, optimal_paths_nodes] = dijkstra_multipath_explore(node1, distance_matrix)
% dijkstra_multipath_explore.m
%
% Created by Patrycja Missiuro {patrycja@mit.edu}, Whitehead Institute,
% Date: March 2006
% Copyright: Massachusetts Institute of Technology / Whitehead Institute,
% Cambridge, MA
%
% Inputs:
% node1 - start node to expand out of
% distance_matrix - matrix size n by n, with 0 at the diagonal, symmetric
% wrt diagonal because distance(i,j) == distance(j,i), if a node is NOT
% connected with another node, distance is zero
%
% Outputs: mindists - minimal distances between node1 and all other
% nodes, array of mindists
% optimal_paths - cellarray of cellarrays of one or more paths that correspond to the minimal
% distance, node indexes going from node1 to nodeN, NOT including
% node1/nodeN

% optimal_paths can be 1 or more paths that are shortest, all should be
% same length - although not necessarily the same number of nodes b/c edge
% weights can differ
optimal_paths_nodes = {};
open_list = node1;
closed_list = [];

% mindists - n length column vector containing distances to start for all
% nodes
mindists = inf(size(distance_matrix, 1), 1);
mindists(node1) = 0;
% cellarray of parents since nodes may have multiple parents
parents{node1} = 0;
% match all neighbors of this node
[dists, indxs] = find(distance_matrix(node1, :) ~= 0);
mindists(indxs, 1) = dists;
% initialize the parent node of all the nodes next to start node
for indx = indxs
    parents{indx} = node1;
end;

% while the open list is not empty
while ~isempty(open_list)
    [g_current_node, id_current_node_idx] = min(mindists(open_list, 1));
    % id_current_node holds the index of the node with the lowest distance
    id_current_node = open_list(id_current_node_idx);
    % extracting the current node out of open_list
    open_list = setdiff(open_list, id_current_node);

    % find successors of this node, and their distances from the node,
    % arranged from the closest to the furthest away
    [current_successors, distances] = get_successors_increasing(id_current_node, distance_matrix);

    for curr_succ_id = 1:length(current_successors)
        % set up successor data [g parent_id] where g = current node g +
        % successor dist
        temporary_successor_data(1) = g_current_node + distances(curr_succ_id);
        temporary_successor_data(2) = id_current_node;
        successor_id = current_successors(curr_succ_id);
        % find the successor in the open_list
        indx_in_the_open = find(open_list == successor_id);
        if ~isempty(indx_in_the_open) % if the successor is already in the open list
            if (length(indx_in_the_open) > 1)
                error('warning in the open!');
            end;
            if (temporary_successor_data(1) > mindists(successor_id)) % the current successor is worse
                continue;
            end;
        end;
        indx_in_the_closed = find(closed_list == successor_id);
        if ~isempty(indx_in_the_closed) % if the successor is already in the closed list
            if (length(indx_in_the_closed) > 1)
                error('warning in closed!');
            end;
            if (temporary_successor_data(1) > mindists(successor_id)) % the current successor is worse
                continue;
            end;
            % remove the node from the closed_list
            closed_list = closed_list(find(closed_list ~= successor_id));
        end;
        if isempty(indx_in_the_open)
            open_list = [open_list, successor_id];
        end;
        % assign the distance
        mindists(successor_id) = temporary_successor_data(1);
        % assign the parents
        % if the distance is better, we replace the parents, if not, we add
        % the new node
        if (temporary_successor_data(1) < mindists(successor_id))
            parents{successor_id} = temporary_successor_data(2);
        elseif (temporary_successor_data(1) == mindists(successor_id))
            if (size(parents, 2) >= successor_id)
                parents{successor_id} = union(parents{successor_id}, temporary_successor_data(2));
            else
                parents{successor_id} = temporary_successor_data(2);
            end;
        end;
    end;
    if ~isempty(find(closed_list == id_current_node)) % the current node is in the closed list already, which shouldn't happen normally!
        error('double entry in the closed list');
    end;
    % add to the closed list
    closed_list = [closed_list, id_current_node];
end;

for id_node = node1 + 1:size(distance_matrix, 2)
    [path, optimal_paths] = get_all_paths(id_node, parents, [], {});
    for path_id = 1:size(optimal_paths, 2)
        optimal_paths{path_id} = optimal_paths{path_id}(2:end - 1);
    end;
    optimal_paths_nodes{id_node} = optimal_paths;
end;

    function [path, opt_paths] = get_all_paths(node_id, parents, path, opt_paths)

        if (node_id == 0)
            opt_paths{end+1} = path;
            return;
        end;
        if (size(parents, 2) < node_id)
            return;
        end;
        path = [node_id, path];
        for parent_id = parents{node_id}
            [pathu, newpaths] = get_all_paths(parent_id, parents, path, {});
            for newpath_id = 1:size(newpaths, 2)
                opt_paths{end+1} = newpaths{newpath_id};
            end;
        end;


            function [successors, distances] = get_successors_increasing(id, distance_matrix)
                % finds successors from the closest to the furthest away
                [distances, neighbors] = sort(distance_matrix(id, :));
                idx_neighbors = find(distances ~= 0);
                successors = neighbors(idx_neighbors);
                distances = distances(idx_neighbors);
