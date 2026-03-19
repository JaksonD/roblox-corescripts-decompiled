local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceControlBar);
local v6 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v7 = require(l_Modules_0.LuaApp.Components.TopBar.Utils.selectTopBarHeight);
local l_useTokens_0 = v4.Hooks.useTokens;
local l_useAvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_AdvancedCustomizationControlBar_0 = v5.AdvancedCustomizationControlBar;
local l_UndoRedoBar_0 = v5.UndoRedoBar;
local v13 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXHideUndoRedoOnLayeredPages_0 = v13.FFlagAXHideUndoRedoOnLayeredPages;
local l_FFlagAXResetAvatarButton_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXResetAvatarButton;
return v3.memo(v3.forwardRef(function(v17, v18) --[[ Line: 36 ]] --[[ Name: RefinementControlBar ]]
    -- upvalues: l_useTokens_0 (copy), l_useAvatarRoute_0 (copy), l_useSelector_0 (copy), v6 (copy), v7 (copy), v3 (copy), v4 (copy), l_AdvancedCustomizationControlBar_0 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy), l_FFlagAXResetAvatarButton_0 (copy), l_FFlagAXHideUndoRedoOnLayeredPages_0 (copy), l_UndoRedoBar_0 (copy)
    local v19 = l_useTokens_0();
    local v20 = l_useAvatarRoute_0();
    local v21 = l_useSelector_0(v6);
    local v22 = l_useSelector_0(v7);
    return v3.createElement(v4.View, {
        tag = "auto-xy col gap-medium", 
        ref = v18, 
        Position = if v21 then UDim2.fromOffset(v19.Size.Size_500, v22) else UDim2.new(0, v19.Size.Size_700, 0, v22 + v19.Size.Size_500), 
        NextSelectionUp = v17.NextSelectionUp, 
        NextSelectionDown = v17.NextSelectionDown, 
        NextSelectionLeft = v17.NextSelectionLeft, 
        NextSelectionRight = v17.NextSelectionRight, 
        ZIndex = 2
    }, {
        AdvancedCustomizationControlBar = v3.createElement(l_AdvancedCustomizationControlBar_0, {
            avatarRoute = v20, 
            LayoutOrder = 1
        }), 
        UndoRedoBar = if not l_FFlagAXRootSlotBasedEditorFlag_0 or l_FFlagAXResetAvatarButton_0 or l_FFlagAXHideUndoRedoOnLayeredPages_0 and v17.hideUndoRedo then nil else v3.createElement(l_UndoRedoBar_0, {
            direction = "vertical", 
            LayoutOrder = 2
        })
    });
end));