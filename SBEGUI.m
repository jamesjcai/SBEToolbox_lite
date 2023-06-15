function varargout = SBEGUI(varargin)
% SBEGUI M-network for SBEGUI.fig
%      SBEGUI, by itself, creates a new SBEGUI or raises the existing
%      singleton*.
%
%      H = SBEGUI returns the handle to a new SBEGUI or the handle to
%      the existing singleton*.
%
%      SBEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SBEGUI.M with the given input arguments.
%
%      SBEGUI('Property','Value',...) creates a new SBEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SBEGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SBEGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Statistics menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SBEGUI

% Last Modified by GUIDE v2.5 26-May-2015 13:55:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SBEGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SBEGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before SBEGUI is made visible.
function SBEGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SBEGUI (see VARARGIN)

% Choose default command line output for SBEGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% sbeguiolddir=pwd;
sbepath=fileparts(which(mfilename));
addpath([sbepath,filesep,'bgl']);
%cdsbe;
SetMenuStatus(handles);
movegui(hObject, 'center');

% UIWAIT makes SBEGUI wait for user response (see UIRESUME)
% uiwait(handles.SBEToolboxGUI);


% --- Outputs from this function are returned to the command line.
function varargout = SBEGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Network_Callback(hObject, eventdata, handles)
% hObject    handle to Network (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SetMenuStatus(handles);

% --------------------------------------------------------------------
function Statistics_Callback(hObject, eventdata, handles)
% hObject    handle to Statistics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SetMenuStatus(handles);

% --------------------------------------------------------------------
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SetMenuStatus(handles);

% --------------------------------------------------------------------
function NetworkOpenMATFile_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkOpenMATFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
[sbeG,sbeNode]=opensbematfile;
SetMenuStatus(handles);



% --------------------------------------------------------------------
function NetworkExit_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkExit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%global sbeG aln pgeversionstr;
%aln=[];
%cd(pgeguiolddir);
clear global sbeG sbeNode
%warning on all
close;


% --------------------------------------------------------------------
function HelpHelpContents_Callback(hObject, eventdata, handles)
% hObject    handle to HelpHelpContents (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpwin sbetoolbox;



% --------------------------------------------------------------------
function StatCentralityBetweenness_Callback(hObject, eventdata, handles)
% hObject    handle to StatCentralityBetweenness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
data=betweenness_centrality(double(sparse(sbeG)));
n=num_vertices(sbeG);
data=data./((n-2)*(n-1));
i_dispheader('Betweenness Centrality');
for k=1:size(sbeG,1)
    fprintf('Node%d\t%s\t%f\n',k,sbeNode{k},data(k));
end
i_dispfooter;
i_conditionalexportresult(handles,data,sbeNode);


%BC=betweenness_centrality(double(sparse(sbeG)));
%assignin('base','lastans',BC);
%fprintf('BETWEENESS CENTRALITY (BC) OF EACH NODE\n');
%fprintf('BC of a node u is the sum of delta (s,t,u) for all s,t in V\n');
%fprintf('Delta(s,t,u) is the ratio of all geodesics between s and t which run through u.\n');
%fprintf('Therefore, BC(u) reflects how often the node u lies on the geodesics between the other nodes of the network\n');
%fprintf('BC'' is the standardized BC\n');
%fprintf('BC  range: 0 < BC < 4851 (Number of pairs of nodes excluding i)\n');
%fprintf('BC'' range: 0 < BC''< 1  (C'' is 1 when the node falls on all geodesics)\n');
%fprintf('\n');
%fprintf('Node	BC		BC''        %%BC\n');
%n=num_vertices(sbeG);
%x=nchoosek(n-1,2)*2;
%y=sum(BC);
%for k=1:size(sbeG,1)
%    fprintf('%d\t%s\t%5.2f\t%5.7f\t%5.2f\n',k,sbeNode{k},BC(k),BC(k)./x,100*BC(k)./y);
%end

%{
%1	83.4842		0.0172097		0.856248
%2	5.81591		0.00119891		0.0596503
%3	82.1821		0.0169413		0.842893
%4	23.4891		0.00484211		0.240913
%5	113.762		0.0234513		1.16679
%6	182.835		0.0376902		1.87523
%7	246.416		0.050797		2.52734
%100	53.5779		0.0110447		0.549516
%
% Node 31 has the maximum BC value: 457.296
%
% Node 15 has the minimum BC value: 0
%
%There are 0 different Betweeness Centrality classes.
%
%GROUP BETWEENESS CENTRALISATION (GBC)
%
%GBC = 0.0599798
%}

%fprintf('\nGBC range: 0 < GBC < 1\n'); fprintf('GBC = 0, when all the
%nodes have exactly the same betweeness index.\n'); fprintf('GBC = 1, when
%one node falls on all other geodesics between all the remaining (N-1)
%nodes. This is exactly the situation realised by a star graph.\n');
%fprintf('(Wasserman & Faust, formula 5.13, p. 192)\n');


% --------------------------------------------------------------------
function StatCentralityCurrentInformationFlow_Callback(hObject, eventdata, handles)
% hObject    handle to StatCentralityCurrentInformationFlow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
[rawdata,data]=current_info_flow(sbeG,1,true);
i_dispheader('Current Information Flow (Missiuro et al 2009)');
for k=1:size(sbeG,1)
    fprintf('Node%d\t%s\t%f\n',k,sbeNode{k},data(k));
end
i_dispfooter;
i_conditionalexportresult(handles,data,sbeNode);

% --------------------------------------------------------------------
function StatClusteringCoefficient_Callback(hObject, eventdata, handles)
% hObject    handle to StatClusteringCoefficient (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
data=clustering_coefficients(double(sparse(sbeG)));
i_dispheader('Clustering Coefficient [CLUSTERING_COEFFICIENTS.m]');
for k=1:size(sbeG,1)
    fprintf('Node%d\t%s\t%f\n',k,sbeNode{k},data(k));
end
i_dispfooter;
i_conditionalexportresult(handles,data,sbeNode);


function i_conditionalexportresult(handles,data,nodename)
    if (i_WantToExport(handles)),
        %filename=tempname;
        writeattribute2tab(data,nodename);
        %edit(filename);
    end
    if (i_WantToCopy(handles)),
        selection = questdlg('Do you want to copy result into clipboard?',...
                             'Pressing Yes will clear memory',...
                             'Yes','No','No');
        switch selection,
           case 'Yes',
            num2clip(data);
           otherwise
            % do nothing
        end
    end
    if (i_WantToAssign(handles))
        export2wsdlg({'Assign node list to variable named:',...
                      'Assign result to variable named:'},...
                      {'sbeNode','sbeOut'},{nodename,data},...
                      'Save to Workspace');
    end



% --------------------------------------------------------------------
function Edit_Callback(hObject, eventdata, handles)
% hObject    handle to Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SetMenuStatus(handles);

% --------------------------------------------------------------------
function Layout_Callback(hObject, eventdata, handles)
% hObject    handle to Layout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SetMenuStatus(handles);

% --------------------------------------------------------------------
function HelpDemo_Callback(hObject, eventdata, handles)
% hObject    handle to HelpDemo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SetMenuStatus(handles);

% --------------------------------------------------------------------
function StatNetworkSummary_Callback(hObject, eventdata, handles)
% hObject    handle to StatNetworkSummary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG;
%[y]=issymnet(sbeG);
%fprintf('Is symmetric: %d\n',y);

i_dispheader('Network Summary');
viewnetinfo(sbeG);
fprintf('Average Distance: %.3f\n',graph_meandist(sbeG));
[Diam,Rad]=graph_diameter(sbeG);
fprintf('Diameter: %d\n',Diam);
fprintf('Radius: %d\n',Rad);
fprintf('Efficiency: %.3f\n',graph_efficiency(sbeG));
i_dispfooter; 

% --------------------------------------------------------------------
function StatDistanceBtw2Nodes_Callback(hObject, eventdata, handles)
% hObject    handle to StatDistanceBtw2Nodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG
   prompt={'Number of vertices:','Probability of each edge:'};
   def={'1','2'};
   dlgTitle='Graph Distance';
   lineNo=1;
   answer=inputdlg(prompt,dlgTitle,lineNo,def);
   if ~(isempty(answer)),
       n1=str2double(answer{1});
       n2=str2double(answer{2});
       %D=shortest_paths(double(sparse(sbeG)),n1);
       D=shortest_paths(double(sparse(sbeG)),n1,struct('target',n2));
       fprintf('Graph Distance: %d\n',D(n2));
   end
assignin('base','lastans',D(n2));


% --------------------------------------------------------------------
function StatGraphAverageDistance_Callback(hObject, eventdata, handles)
% hObject    handle to StatGraphAverageDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG
[out]=graph_meandist(sbeG);
i_dispheader('Average Graph Distance [GRAPH_MEANDIST.m]')
fprintf('%f\n', out);
i_dispfooter;
assignin('base','lastans',out);


% --------------------------------------------------------------------
function StatGraphDiameter_Callback(hObject, eventdata, handles)
% hObject    handle to StatGraphDiameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG
[out]=graph_diameter(sbeG);
i_dispheader('Graph Diameter [GRAPH_DIAMETER.m]')
fprintf('%f\n', out);
i_dispfooter;
assignin('base','lastans',out);



% --------------------------------------------------------------------
function ViewDistanceMatrix_Callback(hObject, eventdata, handles)
% hObject    handle to ViewDistanceMatrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG
[D]=all_shortest_paths(double(sparse(sbeG)));
%printdistmat(D,sbeNode)
figure;
imagesc(D);
axis square
x=gray; x=x(end:-1:1,:);
colormap(x);
colorbar
assignin('base','lastans',D);

% --------------------------------------------------------------------
function NetworkNew_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkNew (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
graph_gui;
SetMenuStatus(handles);

% --------------------------------------------------------------------
function ViewAdjacencyMatrix_Callback(hObject, eventdata, handles)
% hObject    handle to ViewAdjacencyMatrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG
figure;
%spy(sbeG)
dispadjmat(sbeG);
viewnetinfo(sbeG);


% --------------------------------------------------------------------
function NetworkClose_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkClose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
sbeG=[]; sbeNode=[];
clear global sbeG sbeNode
SetMenuStatus(handles);


% --------------------------------------------------------------------
function StatCentralityInDegree_Callback(hObject, eventdata, handles)
% hObject    handle to StatCentralityInDegree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
n=num_vertices(sbeG);
data=sum(sbeG,2);
data2=data./(n-1);
i_dispheader('Degree Centrality');
    fprintf('Node\tName\tk/(n-1)\tk\n');
    fprintf('------------------------------------------\n');
for k=1:size(sbeG,1)
    fprintf('Node%d\t%s\t%f\t%d\n',k,sbeNode{k},data2(k),data(k));
end
i_dispfooter;
i_conditionalexportresult(handles,data,sbeNode);


% --------------------------------------------------------------------
function StatCentralityCloseness_Callback(hObject, eventdata, handles)
% hObject    handle to StatCentralityCloseness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
data=closeness_centrality(sbeG);
i_dispheader('Closness Centrality');
for k=1:size(sbeG,1)
    fprintf('Node%d\t%s\t%f\n',k,sbeNode{k},data(k));
end
i_dispfooter;
i_conditionalexportresult(handles,data,sbeNode);


%{
% CLOSENESS CENTRALITY (CC) OF EACH NODE
% CC(u) is the invert sum of the distances of node u from all other nodes.
% CC' is the standardized CC
% CC  range:  0 < C < 0.111111
% CC' range:  0 < C'< 1
%
% Node	CC		CC'		%CC
% 1	0.0588235		0.529412		10.0202
% 2	0.0588235		0.529412		10.0202
% 3	0.0714286		0.642857		12.1674
% 4	0.0714286		0.642857		12.1674
% 5	0.0555556		0.5		9.46351
% 6	0.0666667		0.6		11.3562
% 7	0.0555556		0.5		9.46351
% 8	0.0666667		0.6		11.3562
% 9	0.047619		0.428571		8.11158
% 10	0.0344828		0.310345		5.8739
%
% Node 3 has the maximum ACC value (std): 0.642857
%
% Node 10 has the minimum ACC value (std): 0.310345
%
% There are 0 different Closeness Centrality classes.
%
% GROUP CLOSENESS CENTRALISATION (GCC)
%
% GCC = -1.07883
%
% GCC range: 0 < GCC < 1
% GCC = 0, when the lengths of the geodesics are all equal (i.e. a complete or a circle graph).
% GCC = 1, when one node has geodesics of length 1 to all the other nodes, and the other nodes have geodesics of length 2 to the remaining (N-2) nodes. This is exactly the situation realised by a star graph.
% (Wasserman & Faust, formula 5.9, p. 187)
%
% This measure focuses on how close a node is to all
% the other nodes in the set of nodes. The idea is that a node
% is central if it can quickly interact with all others
% (Wasserman & Faust, p. 181)
%}


% --------------------------------------------------------------------
function NetworkCreate_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkCreate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function NetworkCreateSmallWorld_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkCreateSmallWorld (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
   prompt={'Number of nodes:','Number of links a new node can make:'};
   def={'300','1'};
   dlgTitle='Generate Samll-world Network';
   lineNo=1;
   answer=inputdlg(prompt,dlgTitle,lineNo,def);
   if ~(isempty(answer)),
       n=str2double(answer{1});
       p=str2double(answer{2});       
        [sbeG,sbeNode]=randnet_sw(n,p);
   end
   viewnetinfo(sbeG,sbeNode);
SetMenuStatus(handles)



% --------------------------------------------------------------------
function NetworkCreateErdosRenyi_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkCreateErdosRenyi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
   prompt={'Number of vertices:','Probability of each edge:'};
   def={'100','0.05'};
   dlgTitle='Generate Random Network';
   lineNo=1;
   answer=inputdlg(prompt,dlgTitle,lineNo,def);
   if ~(isempty(answer)),
       n=str2double(answer{1});
       p=str2double(answer{2});
       [sbeG,sbeNode]=randnet_er(n,p);
   end
   viewnetinfo(sbeG,sbeNode);
SetMenuStatus(handles)

% --------------------------------------------------------------------
function NetworkCreateRingLattice_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkCreateRingLattice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function NetworkCreateSameDegree_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkCreateSameDegree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function EditAddEdge_Callback(hObject, eventdata, handles)
% hObject    handle to EditAddEdge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG
xy=fruchterman_reingold_force_directed_layout(double(sparse(sbeG)));
graph_gui(sbeG,xy);


% --------------------------------------------------------------------
function EditRemoveEdge_Callback(hObject, eventdata, handles)
% hObject    handle to EditRemoveEdge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function EditSymmetrizeAdjacencyMatrix_Callback(hObject, eventdata, handles)
% hObject    handle to EditSymmetrizeAdjacencyMatrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode sbeG_ori sbeNode_ori
if issymnet(sbeG)
    set(hObject,'enable','off');
end
if ~issymnet(sbeG)
    sbeG_ori=sbeG;
    sbeNode_ori=sbeNode;
    [sbeG]=sbe_symmetrize_adjacency(sbeG);
    msgbox('Adjacency matrix (sbeG) has been symmetrized.','help');
end

% --------------------------------------------------------------------
function EditAddNode_Callback(hObject, eventdata, handles)
% hObject    handle to EditAddNode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG
xy=fruchterman_reingold_force_directed_layout(double(sparse(sbeG)));
graph_gui(sbeG,xy);

% --------------------------------------------------------------------
function EditRemoveNode_Callback(hObject, eventdata, handles)
% hObject    handle to EditRemoveNode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
      [n1,b] = listdlg('Name','Select a node','PromptString','Select a node to remove:',...
                       'SelectionMode','single',...
                       'ListString',sbeNode);
if b
      if n1>num_vertices(sbeG)
          errordlg(sprintf('Index exceeds matrix dimensions %d',num_vertices(sbeG)));
       else
           %i_dispheader('Information of Node')
           %fprintf('Node %d: %s\n', n1, sbeNode{n1});
        selection = questdlg('Remove or Disconnect Node?',...
                             'Remove Node',...
                             'Remove','Disconnect','Cancel','Remove');
                         switch selection
                             case 'Remove'
                                 sbeG(n1,:)=[];
                                 sbeG(:,n1)=[];
                                 sbeNode(n1)=[];
                             case 'Disconnect'
                                 sbeG(n1,:)=false;
                                 sbeG(:,n1)=false;
                             otherwise
                                 return;
                         end
           
           %fprintf('Number of neighbor nodes: %d\n', numel(idx));
           %fprintf('%s,', sbeNode{idx(1:end-1)});
           %fprintf('%s\n', sbeNode{idx(end)});
           %i_dispfooter;
           
       end
end


% --------------------------------------------------------------------
function HelpWebsite_Callback(hObject, eventdata, handles)
% hObject    handle to HelpWebsite (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    web('http://bioinformatics.org/sbetoolbox/','-browser')
catch ME
    errordlg('Unable to access SBEToolbox website')
    rethrow(ME)
end


% --------------------------------------------------------------------
function HelpCheckLatest_Callback(hObject, eventdata, handles)
% hObject    handle to HelpCheckLatest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function HelpCitation_Callback(hObject, eventdata, handles)
% hObject    handle to HelpCitation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function HelpAbout_Callback(hObject, eventdata, handles)
% hObject    handle to HelpAbout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pgeversionstr='0.1';
info{1}='';
info{2}='SBEToolbox - Systems Biology & Evolution Toolbox';
info{3}='';
info{4}=['Version ',pgeversionstr];
info{5}='';
info{6}='Author: James J. Cai';
info{7}='';
info{8}='Copyright 2009-2010  All Rights Reserved (Since 06/14/2009)';
info{9}='';
info{10}='Please reference this software when using as part of';
info{11}='research.';
info{12} ='';
helpdlg(info,'About');


% --------------------------------------------------------------------
function NetworkImport_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkImport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function NetworkExport_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkExport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function NetworkExportAdjecencyMatrix_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkExportAdjecencyMatrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG
writeadjmat2mat(sbeG);

% --------------------------------------------------------------------
function NetworkExportNodeAttributes_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkExportNodeAttributes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function NetworkExportEdgeAttributes_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkExportEdgeAttributes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function NetworkImportNodeAttributes_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkImportNodeAttributes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function NetworkImportEdgeAttributes_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkImportEdgeAttributes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function NetworkAssignGlobalVariablesToWorkSpace_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkAssignGlobalVariablesToWorkSpace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
    try
    if ~isempty(sbeG),
        %assignin('base','sbeG', sbeG);
        %assignin('base','sbeNode', sbeNode);
        %helpdlg('Adjecency matrix and info has been assigned as sbeG and sbeNode',...
        %        'Assign varibles into workspace')
            export2wsdlg({'Assign adjecency matrix to variable named:',...
                          'Assign node list to variable named:'},...
                          {'sbeG','sbeNode'},{sbeG,sbeNode},...
                          'Save to Workspace');
    else
        warndlg('Adjecency matrix is empty.','Save to Workspace')
    end
catch ME
  errordlg('Assign Adjacency Matrix Error')
  rethrow(ME)
end


% --------------------------------------------------------------------
function LayoutRandom_Callback(hObject, eventdata, handles)
% hObject    handle to LayoutRandom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
xy=random_graph_layout(sbeG);
figure;
plotnet(sbeG,xy,sbeNode);


% --------------------------------------------------------------------
function EditExtractSubnetworkAroundNode_Callback(hObject, eventdata, handles)
% hObject    handle to EditExtractSubnetworkAroundNode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode sbeG_ori sbeNode_ori

      [n1,b] = listdlg('PromptString','Select a node:',...
                       'SelectionMode','single',...
                       'ListString',sbeNode);
if b
      if n1>num_vertices(sbeG)
          errordlg(sprintf('Index exceeds matrix dimensions %d',num_vertices(sbeG)));
       else
           i_dispheader(sprintf('Subnetwork around selected Node: %d (%s)',n1,sbeNode{n1}));
           sbeG_ori=sbeG;
           sbeNode_ori=sbeNode;
           prompt={'Index of node:','Graph distance cutoff:'};
           def={sprintf('%d',n1),'2'};
           dlgTitle='Node and cutoff';
           lineNo=1;
           answer=inputdlg(prompt,dlgTitle,lineNo,def);
           if ~(isempty(answer)),
               nodeid=str2double(answer{1});
               distcutoff=str2double(answer{2});
               [sbeG,sbeNode]=extractnode(sbeG,sbeNode,nodeid,distcutoff);
               viewnetinfo(sbeG);
           end
           i_dispfooter;
      end
end

% --------------------------------------------------------------------
function EditRestoreNetwork_Callback(hObject, eventdata, handles)
% hObject    handle to EditRestoreNetwork (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode sbeG_ori sbeNode_ori
sbeG=sbeG_ori;
sbeNode=sbeNode_ori;
disp('Network restored!');
sbeG_ori=[]; sbeNode_ori=[];
clear global sbeG_ori sbeNode_ori
viewnetinfo(sbeG);


% --------------------------------------------------------------------
function EditBrowseNodeList_Callback(hObject, eventdata, handles)
% hObject    handle to EditBrowseNodeList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
      [n1,b] = listdlg('Name','Nodes in network',...
                       'PromptString','Select a node for details:',...
                       'SelectionMode','single',...
                       'ListString',sbeNode);
if b
      if n1>num_vertices(sbeG)
          errordlg(sprintf('Index exceeds matrix dimensions %d',num_vertices(sbeG)));
       else
           i_dispheader('Information of Node')
           fprintf('Node %d: %s\n', n1, sbeNode{n1});
           idx=find(sbeG(n1,:));
           if ~isempty(idx)
               fprintf('Number of neighbor nodes: %d\nList of neighbor nodes: ',...
                       numel(idx));
               fprintf('%s,', sbeNode{idx(1:end-1)});
               fprintf('%s\n', sbeNode{idx(end)});
           else
               fprintf('Number of neighbor nodes: 0\n');
           end
           i_dispfooter;
       end
end



% --------------------------------------------------------------------
function LayoutCircle_Callback(hObject, eventdata, handles)
% hObject    handle to LayoutCircle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
[xy]=circle_layout(sbeG);
figure;
plotnet(sbeG,xy,sbeNode);


% --------------------------------------------------------------------
function LayoutFruchtermanReingold_Callback(hObject, eventdata, handles)
% hObject    handle to LayoutFruchtermanReingold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
   prompt={'Iterations:'};
   def={'100'};
   dlgTitle='Layout Options';
   lineNo=1;
   answer=inputdlg(prompt,dlgTitle,lineNo,def);
   if ~(isempty(answer)),
       n1=str2double(answer{1});
       if n1<1
          errordlg('Invalid Iterations');
       else
           try
            xy=fruchterman_reingold_force_directed_layout(double(sparse(sbeG)),'iterations',n1);
           catch ME
            errordlg(ME.identifier);
            return;
           end
            figure;
            plotnet(sbeG,xy,sbeNode);
           assignin('base','lastans',xy);
       end
   end




% --------------------------------------------------------------------
function LayoutGursoyAtun_Callback(hObject, eventdata, handles)
% hObject    handle to LayoutGursoyAtun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
try
    xy=gursoy_atun_layout(double(sparse(sbeG)));
catch ME
    errordlg(ME.identifier);
    return;
end       
figure;
plotnet(sbeG,xy,sbeNode);


% --------------------------------------------------------------------
function LayoutKamadaKawaiSpring_Callback(hObject, eventdata, handles)
% hObject    handle to LayoutKamadaKawaiSpring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
try
    xy=kamada_kawai_spring_layout(double(sparse(sbeG)));
catch ME
    errordlg(ME.identifier);
    return;
end
figure;
plotnet(sbeG,xy,sbeNode);


% --------------------------------------------------------------------
function ViewPowerLawDegreeDistribution_Callback(hObject, eventdata, handles)
% hObject    handle to ViewPowerLawDegreeDistribution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG
figure;
try
    PL_Equation = powerlawplot(single(sbeG));
    assignin('base','lastans',PL_Equation);
catch exception
    %rethrow(exception);
    errordlg(exception.message)
end


% --------------------------------------------------------------------
function NetworkOpenTABFile_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkOpenTABFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
[sbeG,sbeNode]=readtab2sbe;
SetMenuStatus(handles);

% --------------------------------------------------------------------
function NetworkOpenSIFFile_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkOpenSIFFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
[sbeG,sbeNode]=readsif2sbe;
SetMenuStatus(handles);

% --------------------------------------------------------------------
function NetworkOpenPajekFile_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkOpenPajekFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SetMenuStatus(handles);

% --------------------------------------------------------------------
function NetworkImportAdjecencyMatrix_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkImportAdjecencyMatrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function NetworkSaveAsTABFile_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkSaveAsTABFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
writesbe2tab(sbeG,sbeNode);

% --------------------------------------------------------------------
function NetworkSaveAsSIFFile_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkSaveAsSIFFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
writesbe2sif(sbeG,sbeNode);

% --------------------------------------------------------------------
function NetworkSaveAsPajekNetFile_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkSaveAsPajekNetFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
%writesbe2pajek(sbeG,sbeNode);
writesbe2pajek(sbeG,sbeNode,[],false);

% --------------------------------------------------------------------
function NetworkSaveMATFile_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkSaveMATFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
writesbe2mat(sbeG,sbeNode);


% --------------------------------------------------------------------
function EditExtractSubnetworkAroundEdge_Callback(hObject, eventdata, handles)
% hObject    handle to EditExtractSubnetworkAroundEdge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode sbeG_ori sbeNode_ori
   sbeG_ori=sbeG;
   sbeNode_ori=sbeNode;
   prompt={'Index of node 1:','Index of node 2:','Graph distance cutoff:'};
   def={'1','2','1'};
   dlgTitle='Nodes and cutoff';
   lineNo=1;
   answer=inputdlg(prompt,dlgTitle,lineNo,def);
   if ~(isempty(answer)),
       nodeid1=str2double(answer{1});
       nodeid2=str2double(answer{2});
       distcutoff=str2double(answer{3});
       [sbeG,idx]=extractedge(nodeid1,nodeid2,sbeG,distcutoff);
       sbeNode=sbeNode(idx);
       viewnetinfo(sbeG);
   end


% --------------------------------------------------------------------
function EditDisplayNodesList_Callback(hObject, eventdata, handles)
% hObject    handle to EditDisplayNodesList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeNode
i_dispheader('List of Nodes')
for k=1:numel(sbeNode)
    fprintf('%d\t%s\n',k,sbeNode{k});
end
i_dispfooter;



% --------------------------------------------------------------------
function EditIncludeExcludeNodes_Callback(hObject, eventdata, handles)
% hObject    handle to EditIncludeExcludeNodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode sbeG_ori sbeNode_ori
[s,v] = choosebox('Name','Pick node(s)','PromptString',...
    'Nodes available:','SelectString','Selected nodes:',...
    'ListString',sbeNode');
if (v==1)
        sbeG_ori=sbeG;
        sbeNode_ori=sbeNode;
        idx=setdiff(1:num_vertices(sbeG),s);
        sbeG(idx,:)=[];
        sbeG(:,idx)=[];
	    sbeNode=sbeNode(s);
else
    return;
end;

% --------------------------------------------------------------------
function LayoutIteration_Callback(hObject, eventdata, handles)
% hObject    handle to LayoutIteration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(hObject,'checked'),'on')
    set(hObject,'checked','off')
else
    set(hObject,'checked','on')
end
guidata(hObject, handles);

% --------------------------------------------------------------------
% handles    structure with handles and user data (see GUIDATA)
function [yes]=i_WantToIteration(handles)
if strcmp(get(handles.LayoutIteration,'checked'),'on')
    yes=true;
else
    yes=false;
end


% --------------------------------------------------------------------
function StatsGraphEfficiency_Callback(hObject, eventdata, handles)
% hObject    handle to StatsGraphEfficiency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG
[out]=graph_efficiency(sbeG);
 i_dispheader('Network Efficiency (Latora & Marchiori 2001) [GRAPH_EFFICIENCY.m]')
 fprintf('%f\n', out);
 i_dispfooter;
 assignin('base','lastans',out);


%{
--------------------------------------------------------------------
function EditFindNode_Callback(hObject, eventdata, handles)
% hObject    handle to EditFindNode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode

	ButtonName=questdlg('Find by name or index?', ...
			    'Select key', ...
			    'Name','Index','Name');
    answer=[];
	switch ButtonName,
	    case 'Index',
            prompt={'Index of node:'};
            def={'1'};
            dlgTitle='Find Node';
            lineNo=1;
            answer=inputdlg(prompt,dlgTitle,lineNo,def);
            n1=str2double(answer{1});
            assignin('base','lastans',sbeNode{n1});
        case 'Name'
            prompt={'Name of node:'};
            def={'Node1'};
            dlgTitle='Find Node';
            lineNo=1;
            answer=inputdlg(prompt,dlgTitle,lineNo,def);
            [y1,n1]=ismember(answer{1},sbeNode);
            assignin('base','lastans',n1);
            if ~y1
                msgbox('Not find');
                return;
            end
        otherwise
            msgbox('Not find');
            return;
    end

   if ~(isempty(answer)),
       if n1>num_vertices(sbeG)
          errordlg(sprintf('Index exceeds matrix dimensions %d',num_vertices(sbeG)));
       else
           i_dispheader('Information of Node')
           fprintf('Node %d: %s\n', n1, sbeNode{n1});
           idx=find(sbeG(n1,:));
           fprintf('Number of neighbor nodes: %d\n', numel(idx));
           fprintf('%s,', sbeNode{idx(1:end-1)});
           fprintf('%s\n', sbeNode{idx(end)});
           i_dispfooter;
       end
   end
%}


% --------------------------------------------------------------------
function NetworkSaveAsPajekPajFile_Callback(hObject, eventdata, handles)
% hObject    handle to NetworkSaveAsPajekPajFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
%writesbe2pajek(sbeG,sbeNode);
      [n1,b] = listdlg('PromptString','Select a node:',...
                      'SelectionMode','single',...
                      'ListString',sbeNode);
if b
      if n1>num_vertices(sbeG)
          errordlg(sprintf('Index exceeds matrix dimensions %d',num_vertices(sbeG)));
      else
           sbePartition=zeros(1,num_vertices(sbeG));
           sbePartition(n1)=1;
           writesbe2pajek(sbeG,sbeNode,sbePartition,true);
       end
end


% --------------------------------------------------------------------
function EditViewNetworkProtovis_Callback(hObject, eventdata, handles)
% hObject    handle to EditViewNetworkProtovis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
viewnetprotovis(sbeG,sbeNode);

% --------------------------------------------------------------------
function EditViewNetworkCytoscape_Callback(hObject, eventdata, handles)
% hObject    handle to EditViewNetworkCytoscape (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
cytoscaperun(sbeG,sbeNode);


% --------------------------------------------------------------------
function View_Callback(hObject, eventdata, handles)
% hObject    handle to View (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SetMenuStatus(handles);


% --------------------------------------------------------------------
function WantToExportResultFile_Callback(hObject, eventdata, handles)
% hObject    handle to WantToExportResultFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(hObject,'checked'),'on')
    set(hObject,'checked','off')
else
    set(hObject,'checked','on')
    msgbox('Result will be saved into a file.','Save Result into File','help');
end
guidata(hObject, handles);

% --------------------------------------------------------------------
% handles    structure with handles and user data (see GUIDATA)
function [yes]=i_WantToExport(handles)
if strcmp(get(handles.WantToExportResultFile,'checked'),'on')
    yes=true;
else
    yes=false;
end

%function i_exportres(data,nodename)
%if nargin<2
%   for i = 1:length(data)
%      nodename{i} = sprintf('Node%s',i);
%   end
%end
%writeattribute2tab(data,nodename);


% --------------------------------------------------------------------
function WantToExportResultToClipboard_Callback(hObject, eventdata, handles)
% hObject    handle to WantToExportResultToClipboard (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(hObject,'checked'),'on')
    set(hObject,'checked','off')
else
    set(hObject,'checked','on')
    msgbox('Result will be copied into clipboard.','Copy Result into Clipboard','help');
end
guidata(hObject, handles);


function [yes]=i_WantToCopy(handles)
if strcmp(get(handles.WantToExportResultToClipboard,'checked'),'on')
    yes=true;
else
    yes=false;
end


% --------------------------------------------------------------------
function WantToExportResultToWS_Callback(hObject, eventdata, handles)
% hObject    handle to WantToExportResultToWS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(hObject,'checked'),'on')
    set(hObject,'checked','off')
else
    set(hObject,'checked','on')
    msgbox('Result will be assigned into workspace as varible SBEOUT.',...
           'Export Result to Workspace','help');
end
guidata(hObject, handles);


function [yes]=i_WantToAssign(handles)
if strcmp(get(handles.WantToExportResultToWS,'checked'),'on')
    yes=1;
else
    yes=0;
end


% --------------------------------------------------------------------
function StatCentralityBridging_Callback(hObject, eventdata, handles)
% hObject    handle to StatCentralityBridging (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
data=bridging_centrality(sbeG);
i_dispheader('Bridging Centrality');
for k=1:size(sbeG,1)
    fprintf('Node%d\t%s\t%f\n',k,sbeNode{k},data(k));
end
i_dispfooter;
i_conditionalexportresult(handles,data,sbeNode);


function SetMenuStatus(handles)
global sbeG

%{
allhandles = [handles.Network,...
handles.Statistics,...
handles.Help,...
handles.NetworkOpenMATFile,...
handles.NetworkExit,...
handles.HelpHelpContents,...
handles.StatCentralityBetweenness,...
handles.StatCentralityCurrentInformationFlow,...
handles.StatClusteringCoefficient,...
handles.Edit,...
handles.Layout,...
handles.HelpDemo,...
handles.StatNetworkSummary,...
handles.StatDistanceBtw2Nodes,...
handles.StatGraphAverageDistance,...
handles.ViewDistanceMatrix,...
handles.StatGraphDiameter,...
handles.NetworkNew,...
handles.ViewAdjacencyMatrix,...
handles.NetworkClose,...
handles.StatCentralityInDegree,...
handles.StatCentralityCloseness,...
handles.StatCentralityEccentricity,...
handles.NetworkCreate,...
handles.NetworkCreateSmallWorld,...
handles.NetworkCreateErdosRenyi,...
handles.NetworkCreateRingLattice,...
handles.NetworkCreateSameDegree,...
handles.EditAddEdge,...
handles.EditRemoveEdge,...
handles.EditSymmetrizeAdjacencyMatrix,...
handles.EditAddNode,...
handles.EditRemoveNode,...
handles.HelpWebsite,...
handles.HelpCheckLatest,...
handles.HelpCitation,...
handles.HelpAbout,...
handles.NetworkImport,...
handles.NetworkExport,...
handles.NetworkExportAdjecencyMatrix,...
handles.NetworkExportNodeAttributes,...
handles.NetworkExportEdgeAttributes,...
handles.NetworkImportNodeAttributes,...
handles.NetworkImportEdgeAttributes,...
handles.NetworkAssignGlobalVariablesToWorkSpace,...
handles.LayoutRandom,...
handles.EditExtractSubnetworkAroundNode,...
handles.EditRestoreNetwork,...
handles.EditBrowseNodeList,...
handles.LayoutCircle,...
handles.LayoutFruchtermanReingold,...
handles.LayoutGursoyAtun,...
handles.LayoutKamadaKawaiSpring,...
handles.ViewPowerLawDegreeDistribution,...
handles.NetworkOpenTABFile,...
handles.NetworkOpenSIFFile,...
handles.NetworkOpenPajekFile,...
handles.NetworkImportAdjecencyMatrix,...
handles.NetworkSaveAsTABFile,...
handles.NetworkSaveAsSIFFile,...
handles.NetworkSaveAsPajekNetFile,...
handles.NetworkSaveMATFile,...
handles.EditExtractSubnetworkAroundEdge,...
handles.EditDisplayNodesList,...
handles.EditIncludeExcludeNodes,...
handles.LayoutIteration,...
handles.StatsGraphEfficiency,...
handles.EditFindNode,...
handles.NetworkSaveAsPajekPajFile,...
handles.EditViewNetworkProtovis,...
handles.EditViewNetworkCytoscape,...
handles.View,...
handles.WantToExportResultFile,...
handles.WantToExportResultToClipboard,...
handles.WantToExportResultToWS,...
handles.StatCentrlityDeltaEfficiency,...
handles.StatCentralityTopological];
%}

cannotbeempty = [
        handles.EditAddEdge,...
        handles.EditAddNode,...
        handles.EditBrowseNodeList,...
        handles.EditExtractSubnetworkAroundEdge,...
        handles.EditExtractSubnetworkAroundNode,...        
        handles.EditIncludeExcludeNodes,...
        handles.EditRemoveEdge,...
        handles.EditRemoveNode,...
        handles.EditRestoreNetwork,...
        handles.EditSymmetrizeAdjacencyMatrix,...
        handles.ViewAdjacencyMatrix,...
        handles.EditViewNetworkCytoscape,...
        handles.EditViewNetworkProtovis,...
        handles.EditViewNetworkSigma,...
        handles.EditDisplayNodesList,...
        handles.LayoutCircle,...
        handles.LayoutTreeRing,...
        handles.LayoutFruchtermanReingold,...
        handles.LayoutGursoyAtun,...
        handles.LayoutIteration,...
        handles.LayoutKamadaKawaiSpring,...
        handles.LayoutRandom,...
        handles.NetworkAssignGlobalVariablesToWorkSpace,...
        handles.NetworkClose,...
        handles.NetworkExport,...
        handles.NetworkExportAdjecencyMatrix,...
        handles.NetworkExportEdgeAttributes,...
        handles.NetworkExportNodeAttributes,...
        handles.NetworkImport,...
        handles.NetworkImportAdjecencyMatrix,...
        handles.NetworkImportEdgeAttributes,...
        handles.NetworkImportNodeAttributes,...
        handles.NetworkSaveAsPajekNetFile,...
        handles.NetworkSaveAsPajekPajFile,...
        handles.NetworkSaveAsSIFFile,...
        handles.NetworkSaveAsTABFile,...
        handles.NetworkSaveMATFile,...
        handles.StatGraphAverageDistance,...
        handles.StatsGraphClusteringCoefficient,...
        handles.StatCentralityBetweenness,...
        handles.StatCentralityBridging,...
        handles.StatCentralityCloseness,...
        handles.StatCentralityCurrentInformationFlow,...
        handles.StatCentralityEccentricity,...
        handles.StatCentralityInDegree,...
        handles.StatCentrlityDelta,...
        handles.StatClusteringCoefficient,...
        handles.StatBrokeringCoefficient,...
        handles.StatGraphDiameter,...
        handles.ViewDistanceMatrix,...
        handles.StatDistanceBtw2Nodes,...
        handles.StatNetworkSummary,...
        handles.ViewPowerLawDegreeDistribution,...
        handles.StatsGraphEfficiency,...
        handles.WantToExportResultToWS,...
        handles.WantToExportResultToClipboard,...
        handles.WantToExportResultFile];
if (isempty(sbeG)),
    set(cannotbeempty,'enable','off');    
else
    set(cannotbeempty,'enable','on');
    if issymnet(sbeG)
        set(handles.EditSymmetrizeAdjacencyMatrix,'enable','off');
    end
end


% --------------------------------------------------------------------
function StatBrokeringCoefficient_Callback(hObject, eventdata, handles)
% hObject    handle to StatBrokeringCoefficient (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
data=brokering_coefficient(sbeG);
i_dispheader('Brokering Coefficient');
for k=1:size(sbeG,1)
    fprintf('Node%d\t%s\t%f\n',k,sbeNode{k},data(k));
end
i_dispfooter;
i_conditionalexportresult(handles,data,sbeNode);


% --------------------------------------------------------------------
function StatCentrlityDelta_Callback(hObject, eventdata, handles)
% hObject    handle to StatCentrlityDelta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function StatCentralityEccentricity_Callback(hObject, eventdata, handles)
% hObject    handle to StatCentralityEccentricity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
data=eccentricity_centrality(sbeG);
i_dispheader('Eccentricity Centrality');
for k=1:size(sbeG,1)
    fprintf('Node%d\t%s\t%f\n',k,sbeNode{k},data(k));
end
i_dispfooter;
i_conditionalexportresult(handles,data,sbeNode);


% --------------------------------------------------------------------
function StatCentrlityDeltaMeanDist_Callback(hObject, eventdata, handles)
% hObject    handle to StatCentrlityDeltaMeanDist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
data=delta_centrality(sbeG,@graph_meandist,true);
i_dispheader('Delta Centrality (@graph_meandist)');
for k=1:size(sbeG,1)
    fprintf('Node%d\t%s\t%f\n',k,sbeNode{k},data(k));
end
i_dispfooter;
i_conditionalexportresult(handles,data,sbeNode);


% --------------------------------------------------------------------
function StatCentrlityDeltaDiameter_Callback(hObject, eventdata, handles)
% hObject    handle to StatCentrlityDeltaDiameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
data=delta_centrality(sbeG,@graph_diameter,true);
i_dispheader('Delta Centrality (@graph_diameter)');
for k=1:size(sbeG,1)
    fprintf('Node%d\t%s\t%f\n',k,sbeNode{k},data(k));
end
i_dispfooter;
i_conditionalexportresult(handles,data,sbeNode);


% --------------------------------------------------------------------
function StatCentrlityDeltaEfficiency_Callback(hObject, eventdata, handles)
% hObject    handle to StatCentrlityDeltaEfficiency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
data=delta_centrality(sbeG,@graph_efficiency,true);
i_dispheader('Delta Centrality (@graph_efficiency)');
for k=1:size(sbeG,1)
    fprintf('Node%d\t%s\t%f\n',k,sbeNode{k},data(k));
end
i_dispfooter;
i_conditionalexportresult(handles,data,sbeNode);


% --------------------------------------------------------------------
function LayoutTreeRing_Callback(hObject, eventdata, handles)
% hObject    handle to LayoutTreeRing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode
n=num_vertices(sbeG);
   prompt={'Number of nodes in center:'};
   def={sprintf('%d',max([1,round(n./5)]))};
   dlgTitle='Tree Ring Layout Setup';
   lineNo=1;
   answer=inputdlg(prompt,dlgTitle,lineNo,def);
   if ~(isempty(answer)),
       n_center=str2double(answer{1});
       if ~(n_center>n)
        [xy]=treering_layout(sbeG,n_center);
        figure;
        plotnet(sbeG,xy,sbeNode);
       else
           errordlg('N_CENTER needs to be >=1 and <=N')
       end
   end


% --------------------------------------------------------------------
function StatsGraphClusteringCoefficient_Callback(hObject, eventdata, handles)
% hObject    handle to StatsGraphClusteringCoefficient (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG
[out1,out2]=graph_clustercoeff(sbeG);
 i_dispheader('Network Clustering Coefficient [GRAPH_CLUSTERCOEFF.m]')
 fprintf('Method 1: %f\n', out1);
 fprintf('Method 2: %f\n', out2);
 i_dispfooter;
 assignin('base','lastans',[out1 out2]);


% --------------------------------------------------------------------
function EditViewNetworkSigma_Callback(hObject, eventdata, handles)
% hObject    handle to EditViewNetworkSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbeG sbeNode

[s,v] = listdlg('PromptString','Select a layout method:',...
    'SelectionMode','single',...
    'ListString',{'fruchterman_reingold_force','gursoy_atun',...
    'kamada_kawai','circle'});

if isempty(s), return; end
if v==1
    switch s
        case 1
            xy=fruchterman_reingold_force_directed_layout(double(sparse(sbeG)));
        case 2
            xy=gursoy_atun_layout(double(sparse(sbeG)));            
        case 3
            xy=kamada_kawai_spring_layout(double(sparse(sbeG)));    
        case 4
            [xy]=circle_layout(sbeG);
    end
else
    xy=[];
end

try
    sigmajsrun(sbeG,sbeNode,xy);
catch exception
    errordlg(exception.message);
end


% --------------------------------------------------------------------
function clusteringAlgorithms_Callback(hObject, eventdata, handles)
% hObject    handle to clusteringAlgorithms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ModuleClusterOne_Callback(hObject, eventdata, handles)
% hObject    handle to ModuleClusterOne (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ModuleMCODE_Callback(hObject, eventdata, handles)
% hObject    handle to ModuleMCODE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function MCLVanDongen2000_Callback(hObject, eventdata, handles)
% hObject    handle to MCLVanDongen2000 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function LocalAverageConnectivity_Callback(hObject, eventdata, handles)
% hObject    handle to LocalAverageConnectivity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CoreNumber_Callback(hObject, eventdata, handles)
% hObject    handle to CoreNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ExtractLargestConnectedNetwork_Callback(hObject, eventdata, handles)
% hObject    handle to ExtractLargestConnectedNetwork (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global sbeG sbeNode 
[sbeG,idx] = largest_component(sbeG);
sbeNode=sbeNode(idx);

 