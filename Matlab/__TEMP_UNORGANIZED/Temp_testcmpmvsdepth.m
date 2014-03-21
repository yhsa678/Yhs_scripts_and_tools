[data, dims] = CMPMVS_ReadBinFileZlib('00002_depthMap.bin');
% [data, dims] = CMPMVS_ReadBinFile('00000depths.bin');
% [data, dims] = CMPMVS_ReadBinFile('00000depthsTcamsLimits.bin');
% [data, dims] = CMPMVS_ReadBinFile('00000tcams.bin');

%%

for k = 1:23
    close all
    CMPMVS_ShowDepthBinZlib(sprintf('%05d_depthMap.bin', k), sprintf('%05d._c.png', k));
    pause
end

%%

dep = reshape(data, [3456 5184]);
lmin = min(min(dep(dep~=-1)));
lmax = max(max(dep));
figure, imagesc(dep, [lmin, lmax])

%%

l1 = ListCertainFormatFilesInAFolder(pwd, '.jpg')
l1q = [l1(25:53)]
CopyListFilesToFolder(l1q, '00_r', true, '%05d')