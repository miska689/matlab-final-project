function component = pwm_panel(parent, params)
    component = struct;

    component.out_graph = uiaxes(parent.box);
    component.out_graph.Layout.Row = [1 5];
    component.out_graph.Layout.Column = [1 4];

    component.out_graph2 = uiaxes(parent.box);
    component.out_graph2.Layout.Row = [1 5];
    component.out_graph2.Layout.Column = [6 10];

    component.panel_box = uipanel(parent.box, "Title", "Generator PWM");
    component.panel_box.Layout.Row = [6 10];
    component.panel_box.Layout.Column = [1 10];


    component.box = uigridlayout(component.panel_box, [10 10]);
    component.box.BackgroundColor = "white";

    fields = {
        struct("type", "numeric", "name", "P", "text", "Potentiometer Value", "value", 3000, "format", "%.2f Ω"),
        struct("type", "numeric", "name", "C", "text", "Condensator value", "value", 1e-6, "format", "%.6f F"),
        struct("type", "numeric", "name", "V", "text", "V_in", "value", 9, "format", "%.2f V"),
        struct("type", "numeric", "name", "T", "text", "Oscillation Period", "value", 0.01, "format", "%.6f s"),
        struct("type", "slider", "name", "P_S", "text", "Potentiometer cursor", "value", 0.5, "limits", [0 1])
    };

    component.form = form(component, struct("form_size", {{[2 8], [6 10]}}, "fields", {fields}, "updateFn", @updateGraph));

    component.img = uiimage(component.box, 'ImageSource', "src/assets/images/circuit.png");
    component.img.Layout.Row = [1 10];
    component.img.Layout.Column = [1 4];

    updateGraph(component.form, component);

    function updateGraph(component, parent)
        data = generate_signal(component.data.P, component.data.P_S, component.data.C, component.data.V, component.data.T);

        cla(parent.out_graph, 'reset');
        cla(parent.out_graph2, 'reset');

        plot(parent.out_graph, data.t, data.V_C, data.t, data.signal, "LineWidth", 2);
        plot(parent.out_graph2, data.t, data.out, "LineWidth", 2);

        parent.out_graph.XLabel.String = "Time [ms]";
        parent.out_graph.YLabel.String = "Voltage [V]";
        parent.out_graph.Title.String = "PWM Signal";
        parent.out_graph.YGrid = "on";
        parent.out_graph.XGrid = "on";
        parent.out_graph.GridColor = [0.5, 0.5, 0.5];
        parent.out_graph.GridAlpha = 0.3;

        parent.out_graph2.YLim = [-2, data.V + 2];
        parent.out_graph2.XLabel.String = "Time [ms]";
        parent.out_graph2.YLabel.String = "Voltage [V]";
        parent.out_graph2.Title.String = "PWM Signal";
        parent.out_graph2.YGrid = "on";
        parent.out_graph2.XGrid = "on";
        parent.out_graph2.GridColor = [0.5, 0.5, 0.5];
        parent.out_graph2.GridAlpha = 0.3;
    end
end
