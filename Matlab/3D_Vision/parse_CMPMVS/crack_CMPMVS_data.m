fin = fopen('SGM_00000_scale2_step3_idDepthMap.bin');
tmp = fread(fin, 3, 'int')
sz = tmp(2);
num = tmp(3);
% ch = fread(fin, , 'uchar');
x = fread(fin, 10, 'int')

fclose(fin);
%%
136909-12
6291456/174592
%%
% 12299048/6291456

3072*2048 ;% = 6291456
6291456/1572864 ; % = 4
% 12895204 - 12895192 ; % = 12 = 3*4
12299060 - 12299048 ; % = 12 = 3*4

% %%
% fin = fopen('00002_op.bin');
% num = fread(fin, 1, 'int');
% x = fread(fin, num*7, 'float');
% x = reshape(x, [7, num]);
% 
% 
% fclose(fin);
% 
% %%
% (43628-4) / 1558
% (35424-4) / 1265

%%

% fin = fopen('SGM_00000_scale2_step3_idDepthMap.bin');
fin = fopen('00000depths.bin');
x = fread(fin, 3, 'int')
num = x(3);

tmp = fread(fin, num, 'uint8=>uint8');
y = zlibdecode(tmp);

fclose(fin);

%%
% 698368/349184
698368/174592
%%
q = typecast(y, 'int16');
w = reshape(q, [512 341])';
figure, imagesc(w), colorbar, axis equal, axis tight;
colormap(jet)

%%
q = typecast(y, 'single');
q(end-10:end)
