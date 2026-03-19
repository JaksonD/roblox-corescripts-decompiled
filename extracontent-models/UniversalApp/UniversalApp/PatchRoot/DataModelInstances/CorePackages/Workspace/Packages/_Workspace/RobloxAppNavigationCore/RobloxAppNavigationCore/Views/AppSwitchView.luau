local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigationCore").Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.Navigation);
local v3 = require(script.Parent.AppCard);
return function(v4) --[[ Line: 21 ]] --[[ Name: AppSwitchView ]]
    -- upvalues: v1 (copy), v3 (copy)
    local l_descriptors_0 = v4.descriptors;
    local l_state_0 = v4.navigation.state;
    local l_key_0 = l_state_0.routes[l_state_0.index].key;
    local v8 = {};
    for v9, v10 in l_descriptors_0 do
        v8[v9] = v1.createElement(v3, {
            isActive = v9 == l_key_0, 
            descriptor = v10, 
            screenProps = v4.screenProps, 
            isVisible = v9 == l_key_0
        });
    end;
    return v1.createElement(v1.Fragment, nil, v8);
end;