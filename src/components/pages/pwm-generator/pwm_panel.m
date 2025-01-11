function component = pwm_panel(parent, params)
    component = struct;

    component.panel_box = uipanel(parent.box, "Title", "Generator PWM");
    component.panel_box.Layout.Row = [6 10];
    component.panel_box.Layout.Column = [1 10];

    component.box = uigridlayout(component.panel_box, [10 10]);

    component.out_graph = uiaxes(parent.box);
    component.out_graph.Layout.Row = [1 5];
    component.out_graph.Layout.Column = [1 4];

    fields = {
        struct("name", "P", "text", "Potentiometer Value", "value", 3000, "format", "%.2f Ω"),
        struct("name", "C", "text", "Condensator value", "value", 1e-6, "format", "%.6f F"),
        struct("name", "V", "text", "V_in", "value", 9, "format", "%.2f V"),
        struct("name", "T", "text", "Oscillation Period", "value", 0.01, "format", "%.6f s")
    };

    component.form = form(component, struct("form_size", {{[1 5], [1 4]}}, "fields", {fields}, "updateFn", @updateGraph));

    function updateGraph(component, parent)
        data = generate_signal(component.data.P, 0.5, component.data.C, component.data.V, component.data.T);

        plot(parent.out_graph, data.t, data.V_C, "LineWidth", 2);
        parent.out_graph.XLabel.String = "Time [ms]";
        parent.out_graph.YLabel.String = "Voltage [V]";
        parent.out_graph.Title.String = "PWM Signal";
    end
end
