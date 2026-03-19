local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v4 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v5 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v9 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local l_SlotBasedEditorAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics;
return function(v11, v12) --[[ Line: 24 ]] --[[ Name: useSettingsTileProps ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), v5 (copy), v4 (copy), v2 (copy), l_SlotBasedEditorAnalytics_0 (copy), l_AvatarScreen_0 (copy), v9 (copy)
    local v13 = l_useNavigation_0();
    local v14 = l_useDispatch_0();
    local v15 = v5.useFocusGuiObject();
    local v16 = v4.usePreferredInput();
    local v17 = v2.useCallback(function() --[[ Line: 30 ]]
        -- upvalues: v16 (copy), v4 (ref), v15 (copy), v12 (copy)
        if v16 == v4.Input.Directional then
            v15(v12);
        end;
    end, {
        v16, 
        v15
    });
    local v19 = v2.useCallback(function() --[[ Line: 36 ]]
        -- upvalues: l_SlotBasedEditorAnalytics_0 (ref), v12 (copy), v13 (copy), l_AvatarScreen_0 (ref), v17 (copy)
        l_SlotBasedEditorAnalytics_0.trackSettingsTileClick();
        if v12.current then
            local v18 = v12.current.AbsolutePosition + v12.current.AbsoluteSize * Vector2.new(0.5, 0.5);
            v13.navigate(l_AvatarScreen_0.CreateOrUpdateOutfitMenu, {
                saveTilePosition = v18, 
                onOverlayClosed = v17
            });
        end;
    end, {
        v13, 
        v17
    });
    local v20 = v2.useCallback(function() --[[ Line: 47 ]]
        -- upvalues: v12 (copy), v14 (copy), v9 (ref), v19 (copy)
        if v12.current then
            v14(v9(v19));
        end;
    end, {
        v14, 
        v19
    });
    return {
        index = v11.index, 
        itemWidth = v11.itemWidth, 
        onActivated = v20, 
        squareAspectRatio = v11.squareAspectRatio
    };
end;