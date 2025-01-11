function component = form(parent, params)
    component = struct;

    component.panel = uipanel(parent.box);
    component.panel.Layout.Row = params.form_size{1};
    component.panel.Layout.Column = params.form_size{2};

    component.box = uigridlayout(component.panel, [length(params.fields) 2]);

    component.editfields = {};
    component.data = struct;

    for i = 1:length(params.fields)
        field = params.fields{i};

        label = uilabel(component.box, "Text", field.text);
        label.Layout.Row = i;
        label.Layout.Column = 1;

        component.editfields{i} =...
            uieditfield(component.box, "numeric", "Value", field.value, "ValueDisplayFormat", field.format);
        component.editfields{i}.Layout.Row = i;
        component.editfields{i}.Layout.Column = 2;
        component.data.(field.name) = component.editfields{i}.Value;
    end

    for i = 1:length(params.fields)
        field = params.fields{i};
        component.editfields{i}.ValueChangedFcn = @(src, ~) changeFieldsCallBalk(field.name, src, params.updateFn, parent);
    end

    function changeFieldsCallBalk(name, field, updataFn, parent)
        component.data.(name) = field.Value;
        updataFn(component, parent);
    end
end
