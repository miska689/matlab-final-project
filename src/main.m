addpath(genpath(pwd));

json_text = fileread("config.json");

json_data = jsondecode(json_text);

run_app(json_data);