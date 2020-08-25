function GrayWindowWidth_callback(o,e)
    global GrayWindowWidth hSlider state;
    f = get(o,'parent');
    gwd = findobj(f,'tag','GWD');
    GrayWindowWidth = str2double(get(gwd,'string'));
    delete(hSlider);
    if state 
        hSlider = uicontrol('parent',f,'style','slider','string','»Ò¶È´°¿Ú(ÏñËØxÏñËØ)',...
            'pos',[50,10,200,15],'tag','slider','value',GrayWindowWidth,'Min',1,...
            'Max',100,'SliderStep',[0.01,0.01],'callback',@(o,e)GWDSlider_callback(o,e),...
            'tag','GWDSlider');
    end
end