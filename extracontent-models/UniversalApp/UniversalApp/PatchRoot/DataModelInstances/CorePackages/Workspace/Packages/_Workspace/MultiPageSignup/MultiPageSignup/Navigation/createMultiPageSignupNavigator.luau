local l_Parent_0 = script:FindFirstAncestor("MultiPageSignup").Parent;
local v1 = require(l_Parent_0.RoactNavigation);
local _ = require(l_Parent_0.Navigation);
local _ = require(l_Parent_0.UserActivationFramework);
return function(v4, v5, v6) --[[ Line: 10 ]] --[[ Name: createMultiPageSignupNavigator ]]
    -- upvalues: v1 (copy)
    if v6 then
        return v1.createRobloxStackNavigator(v4, {
            initialRouteName = v5, 
            keepVisitedScreensMounted = true, 
            renderUnderlyingPage = true, 
            defaultNavigationOptions = {
                overlayTransparency = 1
            }, 
            mode = v1.StackPresentationStyle.Default, 
            backBehavior = v1.BackBehavior.History
        });
    else
        return v1.createRobloxSwitchNavigator(v4, {
            initialRouteName = v5, 
            keepVisitedScreensMounted = true, 
            backBehavior = v1.BackBehavior.History
        });
    end;
end;