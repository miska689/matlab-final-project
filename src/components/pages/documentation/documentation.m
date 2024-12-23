function component = documentation(parent, vis)
    component = struct;
    component.page_name = "Documentatie";
    component.box = uipanel(parent.box);
    component.box.Layout.Row = [1 10];
    component.box.Layout.Column = [3 10];
    component.box.Visible = vis;

    component.label = uilabel(component.box, "Text", "Hello World!", "Position", [20 20 100 20]);
end