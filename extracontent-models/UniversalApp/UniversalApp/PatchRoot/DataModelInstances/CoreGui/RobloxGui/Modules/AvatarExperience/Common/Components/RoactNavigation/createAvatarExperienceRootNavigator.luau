local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.RoactNavigation);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_StackRouter_0 = v1.StackRouter;
local l_AvatarRootNavigationAction_0 = v3.Enums.AvatarRootNavigationAction;
local l_CustomGetStateForAction_0 = v3.Enums.CustomGetStateForAction;
return function(v7, v8) --[[ Line: 24 ]]
    -- upvalues: v2 (copy), l_AvatarRootNavigationAction_0 (copy), l_StackRouter_0 (copy), l_CustomGetStateForAction_0 (copy)
    local v11 = v2.Dictionary.join(v8 or {}, {
        getCustomActionCreators = function(_, _) --[[ Line: 26 ]] --[[ Name: getCustomActionCreators ]]
            -- upvalues: l_AvatarRootNavigationAction_0 (ref)
            return table.clone(l_AvatarRootNavigationAction_0);
        end
    });
    local v12 = l_StackRouter_0(v7, v11);
    local v13 = {};
    setmetatable(v13, {
        __mode = "v"
    });
    local l_getStateForAction_0 = v12.getStateForAction;
    v12.getStateForAction = function(v15, v16) --[[ Line: 37 ]] --[[ Name: getStateForAction ]]
        -- upvalues: l_AvatarRootNavigationAction_0 (ref), l_CustomGetStateForAction_0 (ref), v13 (copy), l_getStateForAction_0 (copy)
        if v15.type == l_AvatarRootNavigationAction_0.RegisterCustomGetStateForAction then
            if l_CustomGetStateForAction_0.HandlerId[v15.handlerId] then
                v13[v15.handlerId] = v15.handler;
            else
                warn((("Invalid custom getStateForAction handler id: %*"):format(v15.handlerId)));
            end;
            return l_getStateForAction_0(v15, v16);
        elseif v15.type == l_AvatarRootNavigationAction_0.DeregisterCustomGetStateForAction then
            v13[v15.handlerId] = nil;
            return l_getStateForAction_0(v15, v16);
        else
            for _, v18 in l_CustomGetStateForAction_0.Ordering do
                local v19 = v13[v18];
                if v19 then
                    local v20, v21 = v19(v15, v16);
                    if v20 then
                        return v21;
                    end;
                end;
            end;
            return l_getStateForAction_0(v15, v16);
        end;
    end;
    return v12;
end;