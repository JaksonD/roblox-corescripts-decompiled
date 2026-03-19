local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.tutils);
local v5 = require(l_Modules_0.LuaApp.mutedError);
local v6 = require(l_Modules_0.LuaApp.Actions.ApplySetNavigationLocked);
local v7 = require(l_Modules_0.LuaApp.Actions.SetBackNavigationDisabled);
local v8 = require(l_Modules_0.LuaApp.Actions.ApplyRoactNavigationHistory);
local v9 = require(l_Modules_0.LuaApp.FlagSettings);
local v10 = require(l_Modules_0.LuaApp.Constants);
local l_getCurrentRouteState_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).getCurrentRouteState;
local l_GetFFlagLuaAppRefactorSelectRoute_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppRefactorSelectRoute;
local v13 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux);
local l_getLegacyPageFromRoactNavigationRoute_0 = v13.Utils.getLegacyPageFromRoactNavigationRoute;
local l_FFlagAppIaHomeSubTab_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAppIaHomeSubTab;
local function _() --[[ Line: 26 ]] --[[ Name: getDefaultRoactNavigationState ]]
    -- upvalues: v9 (copy)
    return {
        routeName = v9.GetDefaultAppPage(), 
        key = v9.GetDefaultAppPage()
    };
end;
local function v17() --[[ Line: 34 ]] --[[ Name: getDefaultRouteState ]]
    -- upvalues: v9 (copy)
    return {
        routeName = v9.GetDefaultAppPage(), 
        key = v9.GetDefaultAppPage(), 
        name = v9.GetDefaultAppPage(), 
        rnKey = v9.GetDefaultAppPage()
    };
end;
local function _() --[[ Line: 43 ]] --[[ Name: getDefaultRoute ]]
    -- upvalues: v17 (copy)
    return {
        (v17())
    };
end;
return v2.createReducer({
    history = {
        {
            (v17())
        }
    }, 
    currentRoute = v17(), 
    lockNavigationActions = false, 
    backNavigationDisableCounter = 0, 
    roactNavigationState = if l_GetFFlagLuaAppRefactorSelectRoute_0() then {
        routeName = v9.GetDefaultAppPage(), 
        key = v9.GetDefaultAppPage()
    } else nil
}, {
    [v8.name] = function(v19, v20) --[[ Line: 54 ]]
        -- upvalues: v3 (copy), v5 (copy), v4 (copy), v10 (copy), l_FFlagAppIaHomeSubTab_0 (copy), v13 (copy), l_GetFFlagLuaAppRefactorSelectRoute_0 (copy), l_getLegacyPageFromRoactNavigationRoute_0 (copy), v17 (copy), l_getCurrentRouteState_0 (copy)
        local l_navigationState_0 = v20.navigationState;
        if not l_navigationState_0 or not l_navigationState_0.routes or not l_navigationState_0.index then
            local l_v19_0 = v19;
            if v19.lockNavigationActions then
                l_v19_0 = v3.Dictionary.join(v19, {
                    lockNavigationActions = false
                });
            end;
            v5("Roact Navigation state is not complete in action: " .. v4.toString(v20));
            return l_v19_0;
        else
            local v23 = {};
            for v24 = 1, l_navigationState_0.index do
                local v25 = l_navigationState_0.routes[v24];
                if v25.routeName == v10.TempRnSwitchNavigatorName then
                    v25 = v25.routes[v25.index];
                end;
                if l_FFlagAppIaHomeSubTab_0 and v25.routeName == v13.Constants.HomeContainerName then
                    v25 = v25.routes[v25.index];
                end;
                local v26 = if l_GetFFlagLuaAppRefactorSelectRoute_0() then l_getLegacyPageFromRoactNavigationRoute_0(v25) else v3.Dictionary.join(v25.params or {}, {
                    name = v25.routeName, 
                    rnKey = v25.key
                });
                table.insert(v23, v3.List.join(v23[v24 - 1] or {}, {
                    v26
                }));
            end;
            if #v23 == 0 then
                v5("RN computed history is empty for action: " .. v4.toString(v20));
                v23 = {
                    {
                        (v17())
                    }
                };
            end;
            local v27 = l_getCurrentRouteState_0({
                state = v20.navigationState
            }) or v17();
            if not l_GetFFlagLuaAppRefactorSelectRoute_0() then
                v27.name = v27.routeName;
                v27.rnKey = v27.key;
            end;
            return v3.Dictionary.join(v19, {
                currentRoute = v27, 
                history = v23, 
                lockNavigationActions = l_navigationState_0.isTransitioning or false, 
                roactNavigationState = table.clone(v20.navigationState)
            });
        end;
    end, 
    [v6.name] = function(v28, v29) --[[ Line: 118 ]]
        -- upvalues: v3 (copy)
        if v28.lockNavigationActions == v29.locked then
            return v28;
        else
            return (v3.Dictionary.join(v28, {
                lockNavigationActions = v29.locked or false
            }));
        end;
    end, 
    [v7.name] = function(v30, v31) --[[ Line: 129 ]]
        -- upvalues: v3 (copy)
        local v32 = v31.disabled and v30.backNavigationDisableCounter + 1 or math.max(v30.backNavigationDisableCounter - 1, 0);
        return v3.Dictionary.join(v30, {
            backNavigationDisableCounter = v32
        });
    end
});