function TEMP_DeleteRelativePathAndExtensionForPCDB(filein, fileout)
    inchar = fileread(filein);
    out = strrep(strrep(inchar, 'image\', ''), '.JPG', '');
    
    fout = fopen(fileout, 'wb');
    fwrite(fout, out);
    fclose(fout);
end

