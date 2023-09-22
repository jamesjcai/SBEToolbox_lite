cd Y:\GScaleDatasets\interactome
[x, y] = textread('genepairint.txt', '%d%d');
[genelist, id] = textread('genelistid.txt', '%s%d');
cd Y:\GScaleDatasets\interactome\infoflow

G = false(length(genelist));
for k = 1:length(x)
    G(x(k), y(k)) = true;
    G(y(k), x(k)) = true;
end

%%

aaa = current_info_flow(G);


fid = fopen('genenetworkpropt4.txt', 'w');
for k = 1:length(genelist)
    fprintf(fid, '%s\t%f\n', genelist{k}, aaa(k));
end
fclose(fid);
