function getfile
    global img hImage OriginalImage;

    [filename, filepath] = uigetfile('*.jpg;*.bmp;*.png;*.jpeg');
    fprintf('\n����ͼ���С�����\n');
    file = fullfile(filepath,filename);
    img = imread(file);
    hImage = imshow(img);
    OriginalImage = img;
    fprintf('\n����ͼƬ���\n');
end