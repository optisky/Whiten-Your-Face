function ImageEquiv
    
    fprintf('\nֱ��ͼ���⴦���С�����\n');
    global img hImage;
    if size(img,3) == 1
        img = histeq(img);
    end
    if size(img,3) == 3
        hsi = rgb2hsi(img);
        hsi(:,:,3) = histeq(hsi(:,:,3));
        img = uint8(255*hsi2rgb(hsi));
    end
    delete(hImage);
    hImage = imshow(img);
    fprintf('\nֱ��ͼ�������\n');
end