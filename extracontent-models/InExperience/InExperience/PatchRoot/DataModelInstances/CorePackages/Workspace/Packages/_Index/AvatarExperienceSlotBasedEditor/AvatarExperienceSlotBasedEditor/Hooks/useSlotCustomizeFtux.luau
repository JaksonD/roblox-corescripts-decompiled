local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_script_FirstAncestor_0.Context.useSlotBasedEditorContext);
local v5 = require(l_script_FirstAncestor_0.Enums.ScreenLayout);
local v6 = require(l_Parent_0.Navigation);
local v7 = require(l_Parent_0.AXCommon);
local l_SlotBasedEditorAnalytics_0 = require(l_Parent_0.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics;
local l_SafeAppStorageService_0 = v7.Lib.SafeAppStorageService;
local v10 = require(l_Parent_0.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v10.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v10.AvatarRoute.Hooks.useAvatarRoute;
local l_useNavigation_0 = v6.useNavigation;
local l_selectIsFullView_0 = v7.State.Selectors.selectIsFullView;
local l_useIsSpatial_0 = require(l_Parent_0.Responsive).useIsSpatial;
local l_MenuItemEnum_0 = require(l_Parent_0.AXControlBar).Enums.MenuItemEnum;
local v17 = game:DefineFastFlag("AXSlotBasedEditorCustomizeFtuxUseMemStorage2", false);
local v18 = game:DefineFastInt("AXSlotBasedEditorCustomizeFtuxDelay2", 3000) / 1000;
local v19 = game:DefineFastInt("AXSlotBasedEditorAvatarSwitcherFtuxDelay2", 1000) / 1000;
local v20 = {
    INIT = "", 
    AVATAR_FOCUS_ICON = "AVATAR_FOCUS_ICON", 
    PROFILE_REDIRECT = "PROFILE_REDIRECT", 
    FINISHED = "FINISHED"
};
local function v22(v21) --[[ Line: 42 ]]
    return v21.ScreenSize;
end;
return function(v23) --[[ Line: 48 ]] --[[ Name: useSlotCustomizeFtux ]]
    -- upvalues: l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v4 (copy), l_useSelector_0 (copy), v22 (copy), l_useIsSpatial_0 (copy), v2 (copy), l_selectIsFullView_0 (copy), l_SafeAppStorageService_0 (copy), v17 (copy), v20 (copy), l_AvatarScreen_0 (copy), v5 (copy), v18 (copy), l_SlotBasedEditorAnalytics_0 (copy), v19 (copy), l_MenuItemEnum_0 (copy)
    local v24 = l_useNavigation_0();
    local v25 = l_useAvatarRoute_0();
    local v26 = v4();
    local v27 = v26 and v26.screenLayout;
    local v28 = l_useSelector_0(v22);
    local v29 = not l_useIsSpatial_0();
    local v30 = v2.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v25 (copy)
        return v25 and v25.opaque and v25.opaque.name;
    end, {
        v25
    });
    local v32 = v2.useCallback(function(v31) --[[ Line: 60 ]]
        -- upvalues: l_selectIsFullView_0 (ref), v30 (copy)
        return l_selectIsFullView_0(v31, v30);
    end, {
        v30
    });
    local v33 = l_useSelector_0(v32);
    local v34 = v2.useMemo(function() --[[ Line: 66 ]]
        -- upvalues: v23 (copy), v33 (copy)
        return v23(v33);
    end, {
        v33
    });
    local v35 = v2.useCallback(function() --[[ Line: 70 ]]
        -- upvalues: l_SafeAppStorageService_0 (ref), v17 (ref)
        return (l_SafeAppStorageService_0.getItem("AXSlotBasedEditorCustomizeFtux", v17));
    end, {});
    local v37 = v2.useCallback(function(v36) --[[ Line: 76 ]]
        -- upvalues: l_SafeAppStorageService_0 (ref), v17 (ref)
        l_SafeAppStorageService_0.setItem("AXSlotBasedEditorCustomizeFtux", v36, v17);
        l_SafeAppStorageService_0.flush();
    end, {});
    v2.useEffect(function() --[[ Line: 81 ]]
        -- upvalues: v35 (copy), v20 (ref), v30 (copy), l_AvatarScreen_0 (ref), v29 (copy), v34 (copy), v27 (copy), v5 (ref), v18 (ref), v24 (copy), v28 (copy), v37 (copy), l_SlotBasedEditorAnalytics_0 (ref), v19 (ref)
        local v38 = v35();
        local v39 = nil;
        if v38 == v20.INIT and v30 == l_AvatarScreen_0.AvatarEditor and v29 and v34 and (v27 == v5.LandscapeSplit or v27 == v5.PortraitSlots) then
            v39 = task.delay(v18, function() --[[ Line: 99 ]]
                -- upvalues: v24 (ref), l_AvatarScreen_0 (ref), v28 (ref), v37 (ref), v20 (ref), l_SlotBasedEditorAnalytics_0 (ref)
                v24.navigate(l_AvatarScreen_0.SlotsCustomizeFtuxPrompt, {
                    screenSize = v28, 
                    onConfirm = function() --[[ Line: 102 ]] --[[ Name: onConfirm ]]
                        -- upvalues: v37 (ref), v20 (ref), l_SlotBasedEditorAnalytics_0 (ref)
                        v37(v20.AVATAR_FOCUS_ICON);
                        l_SlotBasedEditorAnalytics_0.trackSlotsCustomizeFtuxPrompt();
                    end
                });
            end);
        elseif v38 == v20.AVATAR_FOCUS_ICON and v30 == l_AvatarScreen_0.AvatarSwitcher and v29 and v34 then
            v39 = task.delay(v19, function() --[[ Line: 122 ]]
                -- upvalues: v37 (ref), v20 (ref), v24 (ref), l_AvatarScreen_0 (ref), v28 (ref), l_SlotBasedEditorAnalytics_0 (ref)
                v37(v20.PROFILE_REDIRECT);
                v24.navigate(l_AvatarScreen_0.SlotsAvatarSwitcherFtuxPrompt, {
                    screenSize = v28, 
                    onConfirm = function() --[[ Line: 126 ]] --[[ Name: onConfirm ]]
                        -- upvalues: v37 (ref), v20 (ref), l_SlotBasedEditorAnalytics_0 (ref)
                        v37(v20.FINISHED);
                        l_SlotBasedEditorAnalytics_0.trackSlotsAvatarSwitcherFtuxPrompt();
                    end
                });
            end);
        end;
        return function() --[[ Line: 134 ]]
            -- upvalues: v39 (ref)
            if v39 then
                task.cancel(v39);
            end;
        end;
    end, {
        v35, 
        v37, 
        v30, 
        v34, 
        v27
    });
    local v40 = {};
    local v41 = false;
    if v35() == v20.AVATAR_FOCUS_ICON then
        v41 = v30 == l_AvatarScreen_0.AvatarEditor;
    end;
    v40.enabled = v41;
    v40.menuItemId = l_MenuItemEnum_0.Main.AvatarSwitcher;
    return v40;
end;