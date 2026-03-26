local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v5 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v6 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v7 = game:DefineFastFlag("AXSettingsTileFocusRefFix", false);
local l_FFlagAXFixFocusGuiObjectFocusRef_0 = v2.FFlagAXFixFocusGuiObjectFocusRef;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v12 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local l_SlotBasedEditorAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics;
return function(v14, v15) --[[ Line: 29 ]] --[[ Name: useSettingsTileProps ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), v6 (copy), v5 (copy), v3 (copy), l_FFlagAXFixFocusGuiObjectFocusRef_0 (copy), v7 (copy), l_SlotBasedEditorAnalytics_0 (copy), l_AvatarScreen_0 (copy), v12 (copy)
    local v16 = l_useNavigation_0();
    local v17 = l_useDispatch_0();
    local v18 = v6.useFocusGuiObject();
    local v19 = v5.usePreferredInput();
    local v20 = v3.useCallback(function() --[[ Line: 35 ]]
        -- upvalues: v19 (copy), v5 (ref), l_FFlagAXFixFocusGuiObjectFocusRef_0 (ref), v18 (copy), v15 (copy), v7 (ref)
        if v19 == v5.Input.Directional then
            if l_FFlagAXFixFocusGuiObjectFocusRef_0 then
                v18(v15.current);
                return;
            else
                v18(if v7 then v15.current else v15);
            end;
        end;
    end, {
        v19, 
        v18
    });
    local v22 = v3.useCallback(function() --[[ Line: 45 ]]
        -- upvalues: l_SlotBasedEditorAnalytics_0 (ref), v15 (copy), v16 (copy), l_AvatarScreen_0 (ref), v20 (copy)
        l_SlotBasedEditorAnalytics_0.trackSettingsTileClick();
        if v15.current then
            local v21 = v15.current.AbsolutePosition + v15.current.AbsoluteSize * Vector2.new(0.5, 0.5);
            v16.navigate(l_AvatarScreen_0.CreateOrUpdateOutfitMenu, {
                saveTilePosition = v21, 
                onOverlayClosed = v20
            });
        end;
    end, {
        v16, 
        v20
    });
    local v23 = v3.useCallback(function() --[[ Line: 56 ]]
        -- upvalues: v15 (copy), v17 (copy), v12 (ref), v22 (copy)
        if v15.current then
            v17(v12(v22));
        end;
    end, {
        v17, 
        v22
    });
    return {
        index = v14.index, 
        itemWidth = v14.itemWidth, 
        onActivated = v23, 
        squareAspectRatio = v14.squareAspectRatio
    };
end;