local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v4 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v5 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v6 = game:DefineFastFlag("AXSettingsTileFocusRefFix", false);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v10 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local l_SlotBasedEditorAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics;
return function(v12, v13) --[[ Line: 26 ]] --[[ Name: useSettingsTileProps ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), v5 (copy), v4 (copy), v2 (copy), v6 (copy), l_SlotBasedEditorAnalytics_0 (copy), l_AvatarScreen_0 (copy), v10 (copy)
    local v14 = l_useNavigation_0();
    local v15 = l_useDispatch_0();
    local v16 = v5.useFocusGuiObject();
    local v17 = v4.usePreferredInput();
    local v18 = v2.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: v17 (copy), v4 (ref), v16 (copy), v6 (ref), v13 (copy)
        if v17 == v4.Input.Directional then
            v16(if v6 then v13.current else v13);
        end;
    end, {
        v17, 
        v16
    });
    local v20 = v2.useCallback(function() --[[ Line: 38 ]]
        -- upvalues: l_SlotBasedEditorAnalytics_0 (ref), v13 (copy), v14 (copy), l_AvatarScreen_0 (ref), v18 (copy)
        l_SlotBasedEditorAnalytics_0.trackSettingsTileClick();
        if v13.current then
            local v19 = v13.current.AbsolutePosition + v13.current.AbsoluteSize * Vector2.new(0.5, 0.5);
            v14.navigate(l_AvatarScreen_0.CreateOrUpdateOutfitMenu, {
                saveTilePosition = v19, 
                onOverlayClosed = v18
            });
        end;
    end, {
        v14, 
        v18
    });
    local v21 = v2.useCallback(function() --[[ Line: 49 ]]
        -- upvalues: v13 (copy), v15 (copy), v10 (ref), v20 (copy)
        if v13.current then
            v15(v10(v20));
        end;
    end, {
        v15, 
        v20
    });
    return {
        index = v12.index, 
        itemWidth = v12.itemWidth, 
        onActivated = v21, 
        squareAspectRatio = v12.squareAspectRatio
    };
end;