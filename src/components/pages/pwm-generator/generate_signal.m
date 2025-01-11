function data = generate_signal(P, P_S, C, V, T)
    data = struct;

    data.P = P; % Pontentiometer value
    data.P_S = P_S; % Pontentiometer state
    data.C = C; % Condensator value
    data.V = V; % V_in
    data.T = T; % Period

    data.R1 = data.P * data.P_S; % R1 value
    data.R2 = data.P - data.R1;  % R2 value

    data.t = linspace(0, data.T, 1000); % Time vector

    data.tau = data.R1 * data.C; % Tau value

    data.signal = zeros(size(data.t)); % Signal vector
    state = 1; % State of the signal

    data.V_C = zeros(size(data.t)); % Condestaor voltage vector
    for i = 2:length(data.t)
        if state
            data.V_C(i) =...
                data.V_C(i-1) + (data.V - data.V_C(i-1)) * (1 - exp(-(data.t(i)-data.t(i-1))/data.tau)); % HIGH
        else
            data.V_C(i) = data.V_C(i-1) * exp(-(data.t(i)-data.t(i-1))/data.tau); % LOW
        end

        if data.V_C(i) > data.V * 2/3
            data.tau = data.R2 * data.C;
            state = 0;
        elseif data.V_C(i) < data.V / 3
            data.tau = data.R1 * data.C;
            state = 1;
        end

        data.signal(i) = state;
    end
end