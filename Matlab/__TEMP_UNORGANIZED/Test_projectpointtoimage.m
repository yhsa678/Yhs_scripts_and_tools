%%
tic
[cam, p3d] = ReadNVM('bi.nvm');
toc

tic
[c, p, v] = read_nvm_and_image_dimensions('bi.nvm', [pwd '\image']);
toc

%%

cam(1)