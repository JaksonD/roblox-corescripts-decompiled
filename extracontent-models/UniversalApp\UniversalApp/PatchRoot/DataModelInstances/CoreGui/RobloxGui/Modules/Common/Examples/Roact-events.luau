local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = v2.Component:extend("App");
v3.render = function(_) --[[ Line: 8 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    return v2.createElement("ScreenGui", {}, {
        Button = v2.createElement("TextButton", {
            Size = UDim2.new(0.5, 0, 0.5, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            [v2.Event.Activated] = function(_) --[[ Line: 18 ]]
                print("The button was clicked!");
            end
        })
    });
end;
return function() --[[ Line: 25 ]]
    -- upvalues: v2 (copy), v3 (copy), l_CoreGui_0 (copy)
    local v6 = v2.createElement(v3);
    v2.mount(v6, l_CoreGui_0, "Roact-events");
end;