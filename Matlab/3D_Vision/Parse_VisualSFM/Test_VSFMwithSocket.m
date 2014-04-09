

echotcpip('on',9999) 
        t = tcpip('localhost',9999); 
        fopen(t)
        %%
        fprintf(t, '33045 C:\Hongsheng\The_Photos\Odum_indoor\test.txt');
        st = fread(t, 30);
        char(st(:)')
        
%         fwrite(t,'33045', 'sync') 
       
        fclose(t);
        delete(t)
        echotcpip('off')