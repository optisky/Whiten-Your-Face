function save_image(o,e)

    f = get(o,'parent');
    global img;
    name = findobj(f,'tag','name');
    filename = get(name,'string');
    path = uigetdir;
    file = fullfile(path,filename);
    imwrite(img,strcat(file,'.jpg'),'JPG');
    
end
