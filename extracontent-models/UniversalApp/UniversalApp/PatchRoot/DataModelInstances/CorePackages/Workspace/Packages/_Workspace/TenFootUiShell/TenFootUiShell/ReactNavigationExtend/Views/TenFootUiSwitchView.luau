local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ReactNavigationExtend_0 = l_script_FirstAncestor_0.ReactNavigationExtend;
local v3 = require(l_Parent_0.React);
local _ = require(l_Parent_0.TenFootUiCommon);
local v5 = require(l_ReactNavigationExtend_0.Views.Cards.TenFootUiSwitchViewCard);
local _ = require(l_Parent_0.Navigation);
local function v11(v7) --[[ Line: 15 ]] --[[ Name: useTabIndeces ]]
    -- upvalues: v3 (copy)
    local v8, v9 = v3.useState({
        current = v7, 
        previous = v7
    });
    v3.useEffect(function() --[[ Line: 21 ]]
        -- upvalues: v9 (copy), v7 (copy)
        v9(function(v10) --[[ Line: 22 ]]
            -- upvalues: v7 (ref)
            if v7 ~= v10.current then
                return {
                    current = v7, 
                    previous = v10.current
                };
            else
                return v10;
            end;
        end);
    end, {
        v7
    });
    return v8.current, v8.previous;
end;
return function(v12) --[[ Line: 45 ]] --[[ Name: TenFootUiSwitchView ]]
    -- upvalues: v11 (copy), v3 (copy), v5 (copy)
    local l_descriptors_0 = v12.descriptors;
    local l_navigation_0 = v12.navigation;
    local l_state_0 = l_navigation_0.state;
    local l_key_0 = l_state_0.routes[l_state_0.index].key;
    local l_index_0 = l_state_0.index;
    local v18, v19 = v11(l_index_0);
    local v20 = {};
    for v21, v22 in l_descriptors_0 do
        v20[v21] = v3.createElement(v5, {
            descriptor = v22, 
            screenProps = v12.screenProps, 
            navigation = l_navigation_0, 
            isActiveTab = v21 == l_key_0, 
            currentTabIndex = v18, 
            previousTabIndex = v19
        });
    end;
    return v3.createElement(v3.Fragment, nil, v20);
end;