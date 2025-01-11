function component = navbar(parent)
    component = struct;
    component.html = uihtml(parent.figure, 'Position', [0, 0, 260, parent.size.height]);
    component.html.HTMLSource = fullfile(pwd, 'src', 'assets', 'html', 'navbar', 'navbar.html');
    component.html.HTMLEventReceivedFcn = @displayWindow;

    % Pages
    % TODO: Page's content
    %   -- Documentation
    %   -- Cirucits 0nline
    %   -- PWM Generator
    %   -- Home
    pages = {
        documentation(parent, "off"),
        circuits_online(parent, "off"),
        pwm_generator(parent, "off"),
        home_app(parent, "on")
    };


    function displayWindow(src,event)
        name = event.HTMLEventName;
        if strcmp(name,'ChangeWindow')
            window = event.HTMLEventData;

            for i=1:length(pages)
                if strcmp(window, pages{i}.page_name)
                    pages{i}.box.Visible = "on";
                else
                    pages{i}.box.Visible = "off";
                end
            end
        end
    end
end