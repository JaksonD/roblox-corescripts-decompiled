local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v5.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v5.AvatarRoute.Hooks.useAvatarRoute;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v9.Core.Style.useStyle;
local l_useSelectionCursor_0 = v9.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v9.App.SelectionImage.CursorKind;
local l_IconSize_0 = v9.App.Constant.IconSize;
local l_Interactable_0 = v9.Core.Control.Interactable;
local v15 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v15.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v15.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateQuickButtonsToGlobalAutoFocus;
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local v20 = UDim.new(0, 8);
local v21 = UDim.new(0, v20.Offset - (44 - l_IconSize_0.Regular) / 2);
local l_AvatarHeadShot_0 = l_Constants_0.RbxthumbTypes.AvatarHeadShot;
local v23 = {
    [l_AvatarScreen_0.AvatarEditor] = true, 
    [l_AvatarScreen_0.Catalog] = true, 
    [l_AvatarScreen_0.MySharedAvatars] = true
};
local function _(v24, v25) --[[ Line: 59 ]] --[[ Name: isVisible ]]
    -- upvalues: v23 (copy)
    return v23[v25.opaque.name] ~= nil and not v24.isUIFullView and not v24.isSceneFullView;
end;
return (v1.forwardRef(function(v27, v28) --[[ Line: 66 ]]
    -- upvalues: l_useStyle_0 (copy), l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), l_useSelector_0 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_AvatarHeadShot_0 (copy), v1 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 (copy), v2 (copy), v23 (copy), v20 (copy), l_Interactable_0 (copy), l_IconSize_0 (copy), v21 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v30 = l_useAvatarRoute_0();
    local v31 = l_useNavigation_0();
    local v33 = l_useSelector_0(function(v32) --[[ Line: 72 ]]
        -- upvalues: l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref)
        if l_FFlagUseNavigationSelectors_0 then
            return (l_Selectors_0.selectLegacyHistory(v32));
        else
            return v32.Navigation.history;
        end;
    end);
    local v34 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    local v36 = l_useSelector_0(function(v35) --[[ Line: 78 ]]
        return v35.LocalUserId;
    end);
    local v37 = l_getRbxthumbWithTypeSizeAndOptions_0(v36, l_AvatarHeadShot_0, 150);
    local v39 = v1.useCallback(function() --[[ Line: 85 ]]
        -- upvalues: v30 (copy), v33 (copy), v31 (copy), l_AvatarScreen_0 (ref)
        local v38 = {
            prevNavPage = v30.opaque.name, 
            prevNavHistory = v33
        };
        v31.navigate(l_AvatarScreen_0.ProfilePictureEditorEmotes, v38);
    end, {
        v31, 
        v30, 
        v33
    });
    return v1.createElement(l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 and "Frame" or v2.Focusable.Frame, {
        Size = UDim2.fromOffset(44, 44), 
        BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
        Visible = v23[v30.opaque.name] ~= nil and not v27.isUIFullView and not v27.isSceneFullView, 
        LayoutOrder = v27.layoutOrder, 
        NextSelectionUp = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v27.NextSelectionUp, 
        NextSelectionDown = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v27.NextSelectionDown, 
        NextSelectionLeft = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v27.NextSelectionLeft, 
        NextSelectionRight = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v27.NextSelectionRight, 
        ref = v28
    }, {
        Corner = v1.createElement("UICorner", {
            CornerRadius = v20
        }), 
        Button = v1.createElement(if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then l_Interactable_0 else v2.Focusable[l_Interactable_0], {
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(l_IconSize_0.Regular, l_IconSize_0.Regular), 
            BackgroundTransparency = 1, 
            Image = v37, 
            ZIndex = 2, 
            SelectionImageObject = v34, 
            [v1.Event.Activated] = v39
        }, {
            Corner = v1.createElement("UICorner", {
                CornerRadius = v21
            })
        })
    });
end));