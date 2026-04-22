local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v4 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v5 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v6 = game:DefineFastFlag("AXSettingsTileFocusRefFix", false);
local l_FFlagAXFixFocusGuiObjectFocusRef_0 = v1.FFlagAXFixFocusGuiObjectFocusRef;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local l_SlotBasedEditorAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics;
return function(v13, v14) --[[ Line: 28 ]] --[[ Name: useSettingsTileProps ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), v5 (copy), v4 (copy), v2 (copy), l_FFlagAXFixFocusGuiObjectFocusRef_0 (copy), v6 (copy), l_SlotBasedEditorAnalytics_0 (copy), l_AvatarScreen_0 (copy), l_NavigateWithLock_0 (copy)
    local v15 = l_useNavigation_0();
    local v16 = l_useDispatch_0();
    local v17 = v5.useFocusGuiObject();
    local v18 = v4.usePreferredInput();
    local v19 = v2.useCallback(function() --[[ Line: 34 ]]
        -- upvalues: v18 (copy), v4 (ref), l_FFlagAXFixFocusGuiObjectFocusRef_0 (ref), v17 (copy), v14 (copy), v6 (ref)
        if v18 == v4.Input.Directional then
            if l_FFlagAXFixFocusGuiObjectFocusRef_0 then
                v17(v14.current);
                return;
            else
                v17(if v6 then v14.current else v14);
            end;
        end;
    end, {
        v18, 
        v17
    });
    local v21 = v2.useCallback(function() --[[ Line: 44 ]]
        -- upvalues: l_SlotBasedEditorAnalytics_0 (ref), v14 (copy), v15 (copy), l_AvatarScreen_0 (ref), v19 (copy)
        l_SlotBasedEditorAnalytics_0.trackSettingsTileClick();
        if v14.current then
            local v20 = v14.current.AbsolutePosition + v14.current.AbsoluteSize * Vector2.new(0.5, 0.5);
            v15.navigate(l_AvatarScreen_0.CreateOrUpdateOutfitMenu, {
                saveTilePosition = v20, 
                onOverlayClosed = v19
            });
        end;
    end, {
        v15, 
        v19
    });
    local v22 = v2.useCallback(function() --[[ Line: 55 ]]
        -- upvalues: v14 (copy), v16 (copy), l_NavigateWithLock_0 (ref), v21 (copy)
        if v14.current then
            v16(l_NavigateWithLock_0(v21));
        end;
    end, {
        v16, 
        v21
    });
    return {
        index = v13.index, 
        itemWidth = v13.itemWidth, 
        onActivated = v22, 
        squareAspectRatio = v13.squareAspectRatio
    };
end;