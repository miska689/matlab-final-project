function component = home_app(parent, vis)
    component = struct;
    component.page_name = "Acasa";
    component.box = uipanel(parent.box);

    component.box.Layout.Row = [1 10];
    component.box.Layout.Column = [3 10];
    component.box.Visible = vis;

    component.label = uilabel(component.box, "Text", "Home", "Position", [20 20 100 20]);
end