local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_StackRouter_0 = require(l_CorePackages_0.Packages.RoactNavigation).StackRouter;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceActions);
return function(v5, v6) --[[ Line: 16 ]]
    -- upvalues: v3 (copy), v4 (copy), l_StackRouter_0 (copy)
    local v9 = v3.Dictionary.join(v6 or {}, {
        getCustomActionCreators = function(_, _) --[[ Line: 18 ]] --[[ Name: getCustomActionCreators ]]
            -- upvalues: v4 (ref)
            return {
                clearScreens = v4.clearScreens
            };
        end
    });
    local v10 = l_StackRouter_0(v5, v9);
    local l_getStateForAction_0 = v10.getStateForAction;
    v10.getStateForAction = function(v12, v13) --[[ Line: 28 ]] --[[ Name: getStateForAction ]]
        -- upvalues: v4 (ref), v3 (ref), l_getStateForAction_0 (copy)
        if v12.type == v4.ClearScreens then
            local v14 = v3.List.toSet(v12.routeNames);
            local v16 = v3.List.filter(v13.routes, function(v15) --[[ Line: 31 ]]
                -- upvalues: v14 (copy)
                return not v14[v15.routeName];
            end);
            return (v3.Dictionary.join(v13, {
                routes = v16, 
                index = #v16
            }));
        else
            return l_getStateForAction_0(v12, v13);
        end;
    end;
    return v10;
end;