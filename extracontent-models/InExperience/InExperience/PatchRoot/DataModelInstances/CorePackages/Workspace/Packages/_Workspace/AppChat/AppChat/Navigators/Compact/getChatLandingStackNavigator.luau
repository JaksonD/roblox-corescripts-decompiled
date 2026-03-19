local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactNavigation);
local v3 = require(script.Parent.chatLandingStackNavigatorScreens);
local v4 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatDisableAbsorbInputSelectable);
local function v5() --[[ Line: 10 ]] --[[ Name: instantTransitionConfig ]]
    return {
        transitionSpec = {
            frequency = 1000000, 
            dampingRatio = 1
        }
    };
end;
return function(v6) --[[ Line: 19 ]] --[[ Name: getChatLandingStackNavigator ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy)
    return v2.createRobloxStackNavigator(v3, {
        defaultNavigationOptions = if v4 then {
            absorbInputSelectable = false
        } else nil, 
        transitionConfig = if v6 then v5 else nil
    });
end;