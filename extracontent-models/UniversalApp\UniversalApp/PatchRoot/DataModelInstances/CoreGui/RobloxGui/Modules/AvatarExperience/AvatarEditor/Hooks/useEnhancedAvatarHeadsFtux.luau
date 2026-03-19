local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.Navigation);
local l_SafeAppStorageService_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Lib.SafeAppStorageService;
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v5.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v5.AvatarRoute.Hooks.useAvatarRoute;
local l_useNavigation_0 = v3.useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v10 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnhancedAvatarHeadsFtuxUseMemStorage);
local v11 = require(l_Modules_0.AvatarExperience.Flags.FIntAXEnhancedAvatarHeadsFtuxDelay);
local function v13(v12) --[[ Line: 24 ]]
    return v12.ScreenSize;
end;
return function() --[[ Line: 28 ]] --[[ Name: useEnhancedAvatarHeadsFtux ]]
    -- upvalues: l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), l_useSelector_0 (copy), v13 (copy), v2 (copy), l_SafeAppStorageService_0 (copy), v10 (copy), l_AvatarScreen_0 (copy), v11 (copy)
    local v14 = l_useNavigation_0();
    local v15 = l_useAvatarRoute_0();
    local v16 = l_useSelector_0(v13);
    local v17 = v2.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: v15 (copy)
        return v15 and v15.opaque and v15.opaque.name;
    end, {
        v15
    });
    local v18 = v2.useCallback(function() --[[ Line: 37 ]]
        -- upvalues: l_SafeAppStorageService_0 (ref), v10 (ref)
        return l_SafeAppStorageService_0.getItem("AXEnhancedAvatarHeadsFtux", v10);
    end, {});
    local v19 = v2.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: l_SafeAppStorageService_0 (ref), v10 (ref)
        l_SafeAppStorageService_0.setItem("AXEnhancedAvatarHeadsFtux", "true", v10);
        l_SafeAppStorageService_0.flush();
    end, {});
    v2.useEffect(function() --[[ Line: 46 ]]
        -- upvalues: v18 (copy), v17 (copy), l_AvatarScreen_0 (ref), v11 (ref), v14 (copy), v16 (copy), v19 (copy)
        if v18() == "true" then
            return;
        elseif v17 ~= l_AvatarScreen_0.AvatarEditor then
            return;
        else
            local v20 = task.delay(v11 / 1000, function() --[[ Line: 57 ]]
                -- upvalues: v14 (ref), l_AvatarScreen_0 (ref), v16 (ref), v19 (ref)
                v14.navigate(l_AvatarScreen_0.EnhancedAvatarHeadsFtuxPrompt, {
                    screenSize = v16, 
                    onConfirm = function() --[[ Line: 60 ]] --[[ Name: onConfirm ]]
                        -- upvalues: v19 (ref)
                        v19();
                    end
                });
            end);
            return function() --[[ Line: 66 ]]
                -- upvalues: v20 (copy)
                if v20 then
                    task.cancel(v20);
                end;
            end;
        end;
    end, {
        v18, 
        v19, 
        v17, 
        v16, 
        v14
    });
end;