local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Navigation);
local v4 = require(l_script_FirstAncestor_0.Lib.SafeAppStorageService);
local v5 = require(l_Parent_0.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v5.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v5.AvatarRoute.Hooks.useAvatarRoute;
local l_useNavigation_0 = v3.useNavigation;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useIsSpatial_0 = require(l_Parent_0.Responsive).useIsSpatial;
local v11 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXEnhancedAvatarHeadsFtuxUseMemStorage_0 = v11.FFlagAXEnhancedAvatarHeadsFtuxUseMemStorage;
local l_FIntAXEnhancedAvatarHeadsFtuxDelay_0 = v11.FIntAXEnhancedAvatarHeadsFtuxDelay;
local l_FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss_0 = v11.FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss;
local function v16(v15) --[[ Line: 26 ]]
    return v15.ScreenSize;
end;
return function() --[[ Line: 30 ]] --[[ Name: useEnhancedAvatarHeadsFtux ]]
    -- upvalues: l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), l_useSelector_0 (copy), v16 (copy), v2 (copy), v4 (copy), l_FFlagAXEnhancedAvatarHeadsFtuxUseMemStorage_0 (copy), l_FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss_0 (copy), l_useIsSpatial_0 (copy), l_AvatarScreen_0 (copy), l_FIntAXEnhancedAvatarHeadsFtuxDelay_0 (copy)
    local v17 = l_useNavigation_0();
    local v18 = l_useAvatarRoute_0();
    local v19 = l_useSelector_0(v16);
    local v20 = v2.useMemo(function() --[[ Line: 35 ]]
        -- upvalues: v18 (copy)
        return v18 and v18.opaque and v18.opaque.name;
    end, {
        v18
    });
    local v21 = v2.useCallback(function() --[[ Line: 39 ]]
        -- upvalues: v4 (ref), l_FFlagAXEnhancedAvatarHeadsFtuxUseMemStorage_0 (ref)
        return v4.getItem("AXEnhancedAvatarHeadsFtux", l_FFlagAXEnhancedAvatarHeadsFtuxUseMemStorage_0);
    end, {});
    local v22 = v2.useCallback(function() --[[ Line: 43 ]]
        -- upvalues: v4 (ref), l_FFlagAXEnhancedAvatarHeadsFtuxUseMemStorage_0 (ref)
        v4.setItem("AXEnhancedAvatarHeadsFtux", "true", l_FFlagAXEnhancedAvatarHeadsFtuxUseMemStorage_0);
        v4.flush();
    end, {});
    local v23 = if l_FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss_0 then l_useIsSpatial_0() else false;
    v2.useEffect(function() --[[ Line: 51 ]]
        -- upvalues: l_FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss_0 (ref), v23 (copy), v21 (copy), v20 (copy), l_AvatarScreen_0 (ref), l_FIntAXEnhancedAvatarHeadsFtuxDelay_0 (ref), v17 (copy), v19 (copy), v22 (copy)
        if l_FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss_0 and v23 then
            return;
        elseif v21() == "true" then
            return;
        elseif v20 ~= l_AvatarScreen_0.AvatarEditor then
            return;
        else
            local v24 = task.delay(l_FIntAXEnhancedAvatarHeadsFtuxDelay_0 / 1000, function() --[[ Line: 66 ]]
                -- upvalues: v17 (ref), l_AvatarScreen_0 (ref), v19 (ref), v22 (ref)
                v17.navigate(l_AvatarScreen_0.EnhancedAvatarHeadsFtuxPrompt, {
                    screenSize = v19, 
                    onConfirm = function() --[[ Line: 69 ]] --[[ Name: onConfirm ]]
                        -- upvalues: v22 (ref)
                        v22();
                    end
                });
            end);
            return function() --[[ Line: 75 ]]
                -- upvalues: v24 (copy)
                if v24 then
                    task.cancel(v24);
                end;
            end;
        end;
    end, {
        v21, 
        v22, 
        v20, 
        v19, 
        v17, 
        if l_FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss_0 then v23 else nil
    });
end;