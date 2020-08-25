function ImageEquiv
    
    fprintf('\n直方图均衡处理中···\n');
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
    fprintf('\n直方图均衡完成\n');
end