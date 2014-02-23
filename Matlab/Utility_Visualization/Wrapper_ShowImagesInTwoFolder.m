function Wrapper_ShowImagesInTwoFolder(imFolder1, imFolder2, fmt)
    % a wapper show images of two folders side by side 
    iml1 = ListCertainFormatFilesInAFolder(imFolder1, fmt);
    iml2 = ListCertainFormatFilesInAFolder(imFolder2, fmt);
    
    BatchShowImageListSideBySide(iml1, iml2);
end