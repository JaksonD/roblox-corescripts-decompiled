local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Navigation);
local l_getCurrentRouteState_0 = v2.getCurrentRouteState;
local _ = require(l_script_FirstAncestor_0.types);
local l_getLegacyRouteFromRoactNavigationState_0 = require(l_script_FirstAncestor_0.Utils).getLegacyRouteFromRoactNavigationState;
local l_createMockStackState_0 = v2.TestUtils.createMockStackState;
local l_createMockScreenState_0 = v2.TestUtils.createMockScreenState;
local function v9(v8) --[[ Line: 18 ]] --[[ Name: createMockReducerStateFromRouteState ]]
    -- upvalues: l_getLegacyRouteFromRoactNavigationState_0 (copy), l_getCurrentRouteState_0 (copy)
    return {
        history = {
            (l_getLegacyRouteFromRoactNavigationState_0(v8))
        }, 
        currentRoute = l_getCurrentRouteState_0({
            state = v8
        }), 
        roactNavigationState = v8, 
        lockNavigationActions = false, 
        backNavigationDisableCounter = 0
    };
end;
local function v14(v10) --[[ Line: 31 ]] --[[ Name: createMockRouteStateFromPages ]]
    -- upvalues: l_createMockScreenState_0 (copy), l_createMockStackState_0 (copy)
    local v11 = {};
    for _, v13 in v10 do
        table.insert(v11, l_createMockScreenState_0(v13.name, v13));
    end;
    return l_createMockStackState_0("StackRouterRoot", v11);
end;
return {
    createMockReducerStateFromRouteState = v9, 
    createMockRouteStateFromPages = v14, 
    createMockNavigationState = function(...) --[[ Line: 39 ]] --[[ Name: createMockNavigationState ]]
        -- upvalues: v14 (copy), v9 (copy)
        local v15 = {};
        for _, v17 in {
            ...
        } do
            table.insert(v15, {
                name = v17
            });
        end;
        local v18 = v14(v15);
        return (v9(v18));
    end, 
    createMockStackState = l_createMockStackState_0, 
    createMockSwitchState = v2.TestUtils.createMockSwitchState, 
    createMockScreenState = l_createMockScreenState_0
};