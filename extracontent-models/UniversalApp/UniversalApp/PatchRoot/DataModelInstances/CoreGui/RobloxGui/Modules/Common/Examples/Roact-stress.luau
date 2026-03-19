local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = v3.Component:extend("Node");
v4.render = function(v5) --[[ Line: 12 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy)
    local l_x_0 = v5.props.x;
    local l_y_0 = v5.props.y;
    local v8 = v5.props.time + l_x_0 / 10 + l_y_0 / 10;
    return v3.createElement("Frame", {
        Size = UDim2.new(0, 10, 0, 10), 
        Position = UDim2.new(0, 10 * l_x_0, 0, 10 * l_y_0), 
        BackgroundColor3 = Color3.new(math.sin(v8) * 0.5 + 0.5, 0.5, 0.5)
    });
end;
local v9 = v3.Component:extend("App");
v9.init = function(v10) --[[ Line: 28 ]] --[[ Name: init ]]
    v10.state = {
        time = tick()
    };
end;
v9.render = function(v11) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v4 (copy)
    local l_time_0 = v11.state.time;
    local v13 = {};
    local v14 = 0;
    for v15 = 0, 49 do
        for v16 = 0, 49 do
            v14 = v14 + 1;
            v13[v14] = v3.createElement(v4, {
                x = v15, 
                y = v16, 
                time = l_time_0
            });
        end;
    end;
    return v3.createElement("ScreenGui", nil, v13);
end;
v9.didMount = function(v17) --[[ Line: 53 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy)
    l_RunService_0.Stepped:Connect(function() --[[ Line: 54 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            time = tick()
        });
    end);
end;
return function() --[[ Line: 61 ]]
    -- upvalues: v3 (copy), v9 (copy), l_CoreGui_0 (copy)
    v3.mount(v3.createElement(v9), l_CoreGui_0);
end;