ModelName = 'New_South';
list = ListCertainFormatFilesInAFolder([pwd '\image'], 'jpg')

WriteListFilepathAsAFile('load_images_list.txt', list, [ModelName '\image\'] );

WriteListFilepathAsAFile('load_sift_img_list.txt', list, [ModelName '\image\']);
WriteListFilepathAsAFile('load_sift_list.txt', list, [ModelName '\image\'], '.sift');

WriteListFilepathAsAFile('load_depthmap_list.txt', list, [ModelName '\dense\depth-000\'], '-best-depth-cg.jpg');
WriteListFilepathAsAFile('load_depthmap_list.txt', list, [ModelName '\dense\depth-000\'], '.jpg');
