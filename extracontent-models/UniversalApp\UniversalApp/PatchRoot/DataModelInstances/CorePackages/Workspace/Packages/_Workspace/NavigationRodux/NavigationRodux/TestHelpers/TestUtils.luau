local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Navigation);
local l_getCurrentRouteState_0 = v2.getCurrentRouteState;
local _ = require(l_script_FirstAncestor_0.types);
local l_getLegacyRouteFromRoactNavigationState_0 = require(l_script_FirstAncestor_0.Utils).getLegacyRouteFromRoactNavigationState;
return {
    createMockReducerStateFromRouteState = function(v6) --[[ Line: 15 ]] --[[ Name: createMockReducerStateFromRouteState ]]
        -- upvalues: l_getLegacyRouteFromRoactNavigationState_0 (copy), l_getCurrentRouteState_0 (copy)
        return {
            history = {
                (l_getLegacyRouteFromRoactNavigationState_0(v6))
            }, 
            currentRoute = l_getCurrentRouteState_0({
                state = v6
            }), 
            roactNavigationState = v6, 
            lockNavigationActions = false, 
            backNavigationDisableCounter = 0
        };
    end, 
    createMockStackState = v2.TestUtils.createMockStackState, 
    createMockSwitchState = v2.TestUtils.createMockSwitchState, 
    createMockScreenState = v2.TestUtils.createMockScreenState
};