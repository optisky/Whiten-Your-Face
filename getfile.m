function getfile
    global img hImage OriginalImage;

    [filename, filepath] = uigetfile('*.jpg;*.bmp;*.png;*.jpeg');
    fprintf('\n载入图像中···\n');
    file = fullfile(filepath,filename);
    img = imread(file);
    hImage = imshow(img);
    OriginalImage = img;
    fprintf('\n载入图片完成\n');
end