local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v5.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v5.AvatarRoute.Hooks.useAvatarRoute;
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v8.Core.Style.useStyle;
local l_useSelectionCursor_0 = v8.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v8.App.SelectionImage.CursorKind;
local l_IconSize_0 = v8.App.Constant.IconSize;
local l_Interactable_0 = v8.Core.Control.Interactable;
local v14 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v14.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v14.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateQuickButtonsToGlobalAutoFocus;
local v18 = UDim.new(0, 8);
local v19 = UDim.new(0, v18.Offset - (44 - l_IconSize_0.Regular) / 2);
local l_AvatarHeadShot_0 = l_Constants_0.RbxthumbTypes.AvatarHeadShot;
local v21 = {
    [l_AvatarScreen_0.AvatarEditor] = true, 
    [l_AvatarScreen_0.Catalog] = true, 
    [l_AvatarScreen_0.MySharedAvatars] = true
};
local function _(v22, v23) --[[ Line: 57 ]] --[[ Name: isVisible ]]
    -- upvalues: v21 (copy)
    return v21[v23.opaque.name] ~= nil and not v22.isUIFullView and not v22.isSceneFullView;
end;
return (v1.forwardRef(function(v25, v26) --[[ Line: 64 ]]
    -- upvalues: l_useStyle_0 (copy), l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), l_useSelector_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_AvatarHeadShot_0 (copy), v1 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 (copy), v2 (copy), v21 (copy), v18 (copy), l_Interactable_0 (copy), l_IconSize_0 (copy), v19 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v28 = l_useAvatarRoute_0();
    local v29 = l_useNavigation_0();
    local v31 = l_useSelector_0(function(v30) --[[ Line: 70 ]]
        return v30.Navigation.history;
    end);
    local v32 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    local v34 = l_useSelector_0(function(v33) --[[ Line: 74 ]]
        return v33.LocalUserId;
    end);
    local v35 = l_getRbxthumbWithTypeSizeAndOptions_0(v34, l_AvatarHeadShot_0, 150);
    local v37 = v1.useCallback(function() --[[ Line: 81 ]]
        -- upvalues: v28 (copy), v31 (copy), v29 (copy), l_AvatarScreen_0 (ref)
        local v36 = {
            prevNavPage = v28.opaque.name, 
            prevNavHistory = v31
        };
        v29.navigate(l_AvatarScreen_0.ProfilePictureEditorEmotes, v36);
    end, {
        v29, 
        v28, 
        v31
    });
    return v1.createElement(l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 and "Frame" or v2.Focusable.Frame, {
        Size = UDim2.fromOffset(44, 44), 
        BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
        Visible = v21[v28.opaque.name] ~= nil and not v25.isUIFullView and not v25.isSceneFullView, 
        LayoutOrder = v25.layoutOrder, 
        NextSelectionUp = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v25.NextSelectionUp, 
        NextSelectionDown = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v25.NextSelectionDown, 
        NextSelectionLeft = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v25.NextSelectionLeft, 
        NextSelectionRight = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v25.NextSelectionRight, 
        ref = v26
    }, {
        Corner = v1.createElement("UICorner", {
            CornerRadius = v18
        }), 
        Button = v1.createElement(if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then l_Interactable_0 else v2.Focusable[l_Interactable_0], {
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(l_IconSize_0.Regular, l_IconSize_0.Regular), 
            BackgroundTransparency = 1, 
            Image = v35, 
            ZIndex = 2, 
            SelectionImageObject = v32, 
            [v1.Event.Activated] = v37
        }, {
            Corner = v1.createElement("UICorner", {
                CornerRadius = v19
            })
        })
    });
end));