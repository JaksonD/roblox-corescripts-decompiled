local l_CoreGui_0 = game:GetService("CoreGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_withTooltip_0 = v6.App.Dialog.TooltipV2.withTooltip;
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetButton_0 = v6.Core.ImageSet.ImageSetButton;
local l_Focusable_0 = v7.Focusable;
local l_TooltipOrientation_0 = v6.App.Dialog.Enum.TooltipOrientation;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v15 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v16 = require(l_Modules_0.AvatarExperience.AvatarRefinement.HeadRefinement.Hooks.useHeadRefinementEntryTooltip);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local l_withNavigationFocus_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigationFocus;
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local l_useSelectionCursor_0 = v6.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v6.App.SelectionImage.CursorKind;
local l_IconSize_0 = v6.App.Constant.IconSize;
local v24 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Services.Analytics);
local v25 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Thunks.NavigateIntoRefinementPage);
local v26 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateQuickButtonsToGlobalAutoFocus;
local v28 = l_Images_0["icons/actions/adjust"];
local function _(v29) --[[ Line: 64 ]] --[[ Name: isVisible ]]
    -- upvalues: v26 (copy)
    return (v26.isAvatarSceneButtonsVisible(v29.avatarRoute, v29.isFocused, v29.isUIFullView, v29.isSceneFullView, v29.navigation));
end;
local v48 = l_withNavigationFocus_0((v20(function(v31) --[[ Line: 75 ]] --[[ Name: RefinementEntryButton ]]
    -- upvalues: l_useDispatch_0 (copy), l_useStyle_0 (copy), l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 (copy), v4 (copy), v15 (copy), v24 (copy), l_useIsSpatial_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), l_useLocalization_0 (copy), v16 (copy), v26 (copy), v25 (copy), l_ImageSetButton_0 (copy), l_Focusable_0 (copy), l_IconSize_0 (copy), v28 (copy), v5 (copy), l_withTooltip_0 (copy), l_TooltipOrientation_0 (copy), l_CoreGui_0 (copy)
    local v32 = l_useDispatch_0();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v34 = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v4.useRef(nil);
    local l_forwardRef_0 = v31.forwardRef;
    local v36 = v15(v24);
    local v37 = l_useIsSpatial_0();
    local v38 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    local v39 = l_useLocalization_0({
        headRefinementTooltip = "Feature.Avatar.Label.HeadRefinement.Adjust.Tooltip"
    });
    local v40, v41 = v16({
        avatarRoute = v31.avatarRoute, 
        shouldBeVisible = v26.isAvatarSceneButtonsVisible(v31.avatarRoute, v31.isFocused, v31.isUIFullView, v31.isSceneFullView, v31.navigation)
    });
    local v42 = v4.useCallback(function() --[[ Line: 95 ]]
        -- upvalues: v40 (copy), v41 (copy), v32 (copy), v25 (ref), v31 (copy), v36 (copy)
        if v40 and v41 then
            v41({
                saveDismissTime = true
            });
        end;
        v32(v25(v31.navigation, v31.avatarRoute, v36));
    end, {
        v31.navigation, 
        v31.avatarRoute, 
        v36, 
        v41, 
        v40
    });
    local function v45(v43, v44) --[[ Line: 116 ]] --[[ Name: renderImageSetButton ]]
        -- upvalues: v4 (ref), l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 (ref), l_ImageSetButton_0 (ref), l_Focusable_0 (ref), l_IconSize_0 (ref), v28 (ref), l_Theme_0 (copy), v42 (copy), v5 (ref), v34 (copy), v31 (copy), v38 (copy)
        return v4.createElement(if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then l_ImageSetButton_0 else l_Focusable_0[l_ImageSetButton_0], {
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(l_IconSize_0.Regular, l_IconSize_0.Regular), 
            BackgroundTransparency = 1, 
            Image = v28, 
            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
            ImageTransparency = 0, 
            [v4.Event.Activated] = v42, 
            [v5.Change.AbsoluteSize] = v43, 
            [v5.Change.AbsolutePosition] = v44, 
            [v5.Ref] = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v34, 
            NextSelectionLeft = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v31.NextSelectionLeft, 
            NextSelectionDown = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v31.NextSelectionDown, 
            NextSelectionUp = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v31.NextSelectionUp, 
            SelectionImageObject = v38
        });
    end;
    local function v47() --[[ Line: 146 ]] --[[ Name: renderImageSetButtonWithHeadRefinementTooltip ]]
        -- upvalues: l_withTooltip_0 (ref), v39 (copy), l_TooltipOrientation_0 (ref), l_CoreGui_0 (ref), v40 (copy), v45 (copy)
        return l_withTooltip_0({
            bodyText = v39.headRefinementTooltip, 
            useLargeDropShadow = true
        }, {
            preferredOrientation = l_TooltipOrientation_0.Right, 
            guiTarget = l_CoreGui_0, 
            active = v40
        }, function(v46) --[[ Line: 154 ]]
            -- upvalues: v45 (ref)
            return v45(v46, v46);
        end);
    end;
    return v4.createElement(l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 and "Frame" or l_Focusable_0.Frame, {
        Size = UDim2.fromOffset(44, 44), 
        Visible = v26.isAvatarSceneButtonsVisible(v31.avatarRoute, v31.isFocused, v31.isUIFullView, v31.isSceneFullView, v31.navigation), 
        BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
        LayoutOrder = v31.layoutOrder, 
        [v5.Ref] = l_forwardRef_0, 
        defaultChild = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v34
    }, {
        Corner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Image = if not v37 then v47() else v4.createElement(if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then l_ImageSetButton_0 else l_Focusable_0[l_ImageSetButton_0], {
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(l_IconSize_0.Regular, l_IconSize_0.Regular), 
            BackgroundTransparency = 1, 
            Image = v28, 
            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
            ImageTransparency = 0, 
            ZIndex = 2, 
            [v4.Event.Activated] = v42, 
            [v5.Ref] = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v34, 
            NextSelectionLeft = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v31.NextSelectionLeft, 
            SelectionImageObject = v38
        })
    });
end)));
return v5.forwardRef(function(v49, v50) --[[ Line: 199 ]]
    -- upvalues: v5 (copy), v48 (ref), v3 (copy)
    return v5.createElement(v48, v3.Dictionary.join(v49, {
        forwardRef = v50
    }));
end);