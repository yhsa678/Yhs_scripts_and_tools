fout = fopen('view.txt', 'w');
for k = 1:numel(cam);
    rx = [1 0 0 3.14];
    rmx = vrrotvec2mat(rx);

    r = cam(k).R;
    ori = vrrotmat2vec(r'*rmx');
    pos = cam(k).pos;

    fprintf(fout, 'Viewpoint {\r\n');
    fprintf(fout, 'position %.6f %.6f %.6f\r\n', pos(1), pos(2), pos(3));
    fprintf(fout, 'orientation %.6f %.6f %.6f %.6f\r\n', ori(1), ori(2), ori(3), ori(4));
    [~, fname, ~] = fileparts(cam(k).filepath);
    fprintf(fout, 'description "%s"\r\n', fname);
    fprintf(fout, '}\r\n');
end

fclose(fout);