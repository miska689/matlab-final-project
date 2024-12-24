function component = home_app(parent, vis)
    component = struct;
    component.page_name = "Home";
    component.box = uihtml(parent.box);
    component.box.HTMLSource = fullfile(pwd, 'src', 'assets', 'html', 'home.html');
    component.box.Layout.Row = [1 10];
    component.box.Layout.Column = [3 10];
    component.box.Visible = vis;

end