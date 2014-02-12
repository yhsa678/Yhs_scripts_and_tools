trainRatio = 0.9;
img = 'image_MSRC';
label = 'label_MSRC';

di = dir(img);
di(1:2) = [];
dl = dir(label);
dl(1:2) = [];

len = length(di);
seq = randperm(len);

fim = fopen('train_img_list.txt', 'w');
fla = fopen('train_label_list.txt', 'w');

for k = 1:len
    if k/len > 0.9
        break;
    end
    fprintf(fim, '%s\n', fullfile(img, di(seq(k)).name));
    fprintf(fla, '%s\n', fullfile(label, dl(seq(k)).name));
end
fclose(fim);
fclose(fla);

fim = fopen('test_img_list.txt', 'w');
fla = fopen('test_label_list.txt', 'w');
while k <= len
    fprintf(fim, '%s\n', fullfile(img, di(seq(k)).name));
    fprintf(fla, '%s\n', fullfile(label, dl(seq(k)).name));
    k = k+1;
end
fclose(fim);
fclose(fla);
