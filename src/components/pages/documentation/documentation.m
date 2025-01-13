function component = documentation(parent, vis)
    component = struct;
    component.page_name = "Documentatie";
    component.box = uihtml(parent.box);
    component.box.HTMLSource = fullfile(pwd, 'src', 'components', 'pages', 'documentation', 'documentation.html');
    component.box.Layout.Row = [1 10];
    component.box.Layout.Column = [3 10];
    component.box.Visible = vis;

end