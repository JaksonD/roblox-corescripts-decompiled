local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = v2.Component:extend("App");
v5.render = function(v6) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    local l_count_0 = v6.props.count;
    local l_onClick_0 = v6.props.onClick;
    return v2.createElement("ScreenGui", nil, {
        Label = v2.createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            Text = "Count: " .. tostring(l_count_0), 
            TextSize = 48, 
            AutoButtonColor = false, 
            [v2.Event.Activated] = l_onClick_0
        })
    });
end;
v5 = v4.connect(function(v9, _) --[[ Line: 40 ]]
    return {
        count = v9.count
    };
end, function(v11) --[[ Line: 44 ]]
    print("hello?");
    return {
        onClick = function() --[[ Line: 47 ]] --[[ Name: onClick ]]
            -- upvalues: v11 (copy)
            v11({
                type = "increment"
            });
        end
    };
end)(v5);
local function v14(v12, v13) --[[ Line: 61 ]] --[[ Name: reducer ]]
    v12 = v12 or {
        count = 0
    };
    if v13.type == "increment" then
        return {
            count = v12.count + 1
        };
    else
        return v12;
    end;
end;
return function() --[[ Line: 76 ]]
    -- upvalues: v3 (copy), v14 (copy), v2 (copy), v4 (copy), v5 (ref), l_CoreGui_0 (copy)
    local v15 = v3.Store.new(v14);
    local v16 = v2.createElement(v4.StoreProvider, {
        store = v15
    }, {
        App = v2.createElement(v5)
    });
    v2.mount(v16, l_CoreGui_0, "Roact-demo-rodux");
end;