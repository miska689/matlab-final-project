function component = pwm_generator(parent, vis)
    component = struct;
    component.page_name = "Generator PWM";
    component.box = uigridlayout(parent.box, [10 10]);

    component.box.Layout.Row = [1 10];
    component.box.Layout.Column = [3 10];
    component.box.Visible = vis;

    component.pwm_panel = pwm_panel(component, struct());
end

