function component = pwm_generator(parent, vis)
    component = struct;
    component.page_name = "Generator PWM";
    component.box = uipanel(parent.box);

    component.box.Layout.Row = [1 10];
    component.box.Layout.Column = [3 10];
    component.box.Visible = vis;

    component.label = uilabel(component.box, "Text", "Pwm generator", "Position", [20 20 100 20]);
end