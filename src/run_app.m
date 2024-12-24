function component = run_app(json_data)
    component = struct;

    screen_size = get(0, 'ScreenSize');

    component.name = json_data.name;
    component.version = json_data.version;
    component.author = json_data.author;
    component.size = json_data.size;

    center =...
        [(screen_size(3) - component.size.width)/2, (screen_size(4) - component.size.height)/2];

    component.figure =...
        uifigure('Name', component.name, 'Position', [center, component.size.width, component.size.height]);

    component.box =...
        uigridlayout(component.figure, [10, 10]);

    component.navbar = navbar(component);
end