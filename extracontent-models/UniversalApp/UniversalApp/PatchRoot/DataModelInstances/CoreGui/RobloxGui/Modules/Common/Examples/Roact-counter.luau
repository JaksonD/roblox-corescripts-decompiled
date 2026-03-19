local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local function v5(v3) --[[ Line: 10 ]] --[[ Name: TickLabel ]]
    -- upvalues: v2 (copy)
    local l_value_0 = v3.value;
    return v2.createElement("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0), 
        Text = ("Current tick is %d!"):format(l_value_0), 
        TextSize = 48
    });
end;
local v6 = v2.Component:extend("App");
v6.init = function(v7) --[[ Line: 22 ]] --[[ Name: init ]]
    v7.running = false;
    v7.state = {
        count = 0
    };
end;
v6.render = function(v8) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v5 (copy)
    return v2.createElement("ScreenGui", {
        Name = "Roact-demo-counter"
    }, {
        Count = v2.createElement(v5, {
            value = v8.state.count
        })
    });
end;
v6.didMount = function(v9) --[[ Line: 43 ]] --[[ Name: didMount ]]
    spawn(function() --[[ Line: 47 ]]
        -- upvalues: v9 (copy)
        v9.running = true;
        while v9.running do
            v9:setState({
                count = v9.state.count + 1
            });
            wait(1);
        end;
    end);
end;
v6.willUnmount = function(v10) --[[ Line: 63 ]] --[[ Name: willUnmount ]]
    v10.running = false;
end;
return function() --[[ Line: 69 ]]
    -- upvalues: v2 (copy), v6 (copy), l_CoreGui_0 (copy)
    v2.mount(v2.createElement(v6), l_CoreGui_0, "Roact-counter");
end;