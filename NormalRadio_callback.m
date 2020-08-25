function NormalRadio_callback(o,e)
    global state hSlider GrayWindowWidth hGWD;
    f = get(o,'parent');
    normal_radio = findobj(f,'tag','normal_radio');
    test_radio = findobj(f,'tag','test_radio');
    state = get(normal_radio,'value');
    state = ~state;
    set(test_radio,'value',state);
    
    delete(hSlider);
    delete(hGWD);
    if state 
        hSlider = uicontrol('parent',f,'style','slider','string','»Ò¶È´°¿Ú(ÏñËØxÏñËØ)',...
            'pos',[50,10,200,15],'tag','slider','value',GrayWindowWidth,'Min',1,...
            'Max',100,'SliderStep',[0.01,0.01],'callback',@(o,e)GWDSlider_callback(o,e),...
            'tag','GWDSlider');
        hGWD = uicontrol('parent',f,'style','edit','string',num2str(uint8(GrayWindowWidth)),'pos',[255,10,30,20],...
            'tag','GWD','callback',@(o,e)GrayWindowWidth_callback(o,e));
    end
    
end

