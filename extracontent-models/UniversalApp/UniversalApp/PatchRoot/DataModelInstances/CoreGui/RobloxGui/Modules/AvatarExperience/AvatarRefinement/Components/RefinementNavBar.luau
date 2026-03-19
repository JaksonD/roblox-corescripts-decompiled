local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.RoactNavigation);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local v8 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceHeadRefinement);
local l_Focusable_0 = v5.Focusable;
local l_IconButton_0 = v7.App.Button.IconButton;
local l_Images_0 = v7.App.ImageSet.Images;
local l_useStyle_0 = v7.Core.Style.useStyle;
local l_withNavigationFocus_0 = v6.withNavigationFocus;
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local v17 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_selectColorAdjustmentButtonColor_0 = v17.State.Selectors.selectColorAdjustmentButtonColor;
local l_ColorGradientCircle_0 = v17.Components.ColorGradientCircle;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v22 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v24 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Services.Analytics);
local v25 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Thunks.SendRefinementAnalytics);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_FFlagAXCustomizeMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport;
local l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP;
local l_HeadRefinementEntryButton_0 = v10.Components.HeadRefinementEntryButton;
local l_IconSize_0 = v7.App.Constant.IconSize;
local v31 = l_Images_0["icons/menu/clothing/hats_on"];
local v32 = l_Images_0["icons/menu/clothing/hats_off"];
local v33 = l_Images_0["icons/menu/transform-small"];
local v34 = l_Images_0["icons/menu/clothing/clothing_on"];
local v35 = l_Images_0["icons/menu/clothing/clothing_off"];
local v36 = if l_FFlagAXCustomizeMakeupSupport_0 then l_Images_0["icons/menu/clothing/eyelash_on"] else nil;
local v37 = if l_FFlagAXCustomizeMakeupSupport_0 then l_Images_0["icons/menu/clothing/eyelash_off"] else nil;
local function v39(v38) --[[ Line: 71 ]] --[[ Name: selectIsPortrait ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy)
    return v38.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
end;
local function v41(v40) --[[ Line: 76 ]] --[[ Name: selectTopbarHeight ]]
    return v40.TopBar.topBarHeight;
end;
local v69 = l_withNavigationFocus_0((v21(function(v42) --[[ Line: 80 ]] --[[ Name: RefinementEntryButton ]]
    -- upvalues: v3 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), l_useDispatch_0 (copy), v22 (copy), v24 (copy), v25 (copy), l_AvatarScreen_0 (copy), l_useSelector_0 (copy), v39 (copy), v41 (copy), l_selectColorAdjustmentButtonColor_0 (copy), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (copy), v8 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_ColorGradientCircle_0 (copy), v33 (copy), v31 (copy), v32 (copy), l_Focusable_0 (copy), v4 (copy), l_HeadRefinementEntryButton_0 (copy), v34 (copy), v35 (copy), v36 (copy), v37 (copy)
    local v43 = v3.useRef(nil);
    local v44 = if l_FFlagAXCustomizeMakeupSupport_0 then v3.useRef(nil) else nil;
    local v45 = v3.useRef(nil);
    local v46 = v3.useRef(nil);
    local v47 = v3.useRef(nil);
    local v48 = l_useStyle_0();
    local v49 = l_useTokens_0();
    local l_Theme_0 = v48.Theme;
    local v51 = l_useDispatch_0();
    local v52 = v22(v24);
    local v53 = v3.useCallback(function() --[[ Line: 93 ]]
        -- upvalues: v51 (copy), v25 (ref), v52 (copy), v42 (copy), l_AvatarScreen_0 (ref)
        v51(v25(v52.avatarAARefineNavigationTap));
        v42.navigation.navigate(l_AvatarScreen_0.AccessoryAdjustment);
    end, {
        v42.navigation, 
        v52
    });
    local v54 = v3.useCallback(function() --[[ Line: 98 ]]
        -- upvalues: v42 (copy), l_AvatarScreen_0 (ref)
        v42.navigation.navigate(l_AvatarScreen_0.ColorAdjustment);
    end, {
        v42.navigation
    });
    local v55 = v3.useCallback(function() --[[ Line: 102 ]]
        -- upvalues: v51 (copy), v25 (ref), v52 (copy), v42 (copy), l_AvatarScreen_0 (ref)
        v51(v25(v52.avatarLCRefineNavigationTap));
        v42.navigation.navigate(l_AvatarScreen_0.LayeredClothingSort);
    end, {
        v42.navigation, 
        v52
    });
    local v56 = if l_FFlagAXCustomizeMakeupSupport_0 then v3.useCallback(function() --[[ Line: 108 ]]
        -- upvalues: v51 (copy), v25 (ref), v52 (copy), v42 (copy), l_AvatarScreen_0 (ref)
        v51(v25(v52.avatarLayeredMakeupNavigationTap));
        v42.navigation.navigate(l_AvatarScreen_0.LayeredMakeupSort);
    end, {
        v42.navigation, 
        v52
    }) else nil;
    local v57 = v3.useCallback(function() --[[ Line: 114 ]]
        -- upvalues: v42 (copy), l_AvatarScreen_0 (ref)
        v42.navigation.navigate(l_AvatarScreen_0.HeadRefinement);
    end, {
        v42.navigation
    });
    local v58 = l_useSelector_0(v39);
    local v59 = l_useSelector_0(v41);
    local v60 = l_useSelector_0(l_selectColorAdjustmentButtonColor_0);
    local v61 = v58 and 24 or 88;
    local v62 = v42.avatarRoute.opaque.name == l_AvatarScreen_0.AccessoryAdjustment;
    local v63 = v42.avatarRoute.opaque.name == l_AvatarScreen_0.LayeredClothingSort;
    local v64 = if l_FFlagAXCustomizeMakeupSupport_0 then v42.avatarRoute.opaque.name == l_AvatarScreen_0.LayeredMakeupSort else nil;
    local v65 = v42.avatarRoute.opaque.name == l_AvatarScreen_0.HeadRefinement;
    local v66 = if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then v8.readTestVariable(l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.EnabledForUser) else nil;
    local v67 = v3.createElement(l_IconButton_0, {
        position = UDim2.fromScale(0.5, 0.5), 
        anchorPoint = Vector2.new(0.5, 0.5), 
        layoutOrder = 4, 
        showBackground = true, 
        iconSize = l_IconSize_0.Medium, 
        onActivated = v54, 
        buttonRef = v47, 
        NextSelectionUp = v45
    }, {
        Color = v3.createElement(l_ColorGradientCircle_0, {
            Size = UDim2.fromOffset(v49.Size.Size_700, v49.Size.Size_700), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Colors = {
                v60
            }
        })
    });
    local v68 = v3.createElement(l_IconButton_0, {
        position = UDim2.fromScale(0.5, 0.5), 
        anchorPoint = Vector2.new(0.5, 0.5), 
        layoutOrder = l_FFlagAXCustomizeMakeupSupport_0 and 3 or 2, 
        showBackground = true, 
        icon = if v66 then v33 else if v62 then v31 else v32, 
        iconSize = l_IconSize_0.Medium, 
        iconColor3 = if v62 then l_Theme_0.IconEmphasis.Color else l_Theme_0.IconDefault.Color, 
        iconTransparency = if v62 then l_Theme_0.IconEmphasis.Transparency else l_Theme_0.IconDefault.Transparency, 
        onActivated = v53, 
        buttonRef = v45, 
        NextSelectionUp = if l_FFlagAXCustomizeMakeupSupport_0 then v44 else v43, 
        NextSelectionDown = v47
    });
    return v3.createElement(l_Focusable_0.Frame, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = UDim2.new(0, v61, 0, v59 + 4), 
        BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
        ZIndex = 2, 
        [v4.Ref] = v42.defaultChildRef, 
        defaultChild = v46, 
        NextSelectionUp = v42.NextSelectionUp, 
        NextSelectionRight = v42.NextSelectionRight
    }, {
        Corner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        UIListLayout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 16)
        }), 
        UIPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 8), 
            PaddingBottom = UDim.new(0, 8), 
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8)
        }), 
        HeadRefinementEntryButton = v3.createElement(l_Focusable_0[l_HeadRefinementEntryButton_0], {
            isSelected = v65, 
            onActivated = v57, 
            buttonRef = v46, 
            NextSelectionDown = v43
        }), 
        LCSort = v3.createElement(l_IconButton_0, {
            position = UDim2.fromScale(0.5, 0.5), 
            anchorPoint = Vector2.new(0.5, 0.5), 
            icon = if v63 then v34 else v35, 
            iconColor3 = if v63 then l_Theme_0.IconEmphasis.Color else l_Theme_0.IconDefault.Color, 
            iconTransparency = if v63 then l_Theme_0.IconEmphasis.Transparency else l_Theme_0.IconDefault.Transparency, 
            layoutOrder = 1, 
            iconSize = l_IconSize_0.Medium, 
            onActivated = v55, 
            showBackground = true, 
            buttonRef = v43, 
            NextSelectionDown = if l_FFlagAXCustomizeMakeupSupport_0 then v44 else v45, 
            NextSelectionUp = v46
        }), 
        AccessoryAdjustment = v68, 
        MakeupSort = if l_FFlagAXCustomizeMakeupSupport_0 then v3.createElement(l_IconButton_0, {
            position = UDim2.fromScale(0.5, 0.5), 
            anchorPoint = Vector2.new(0.5, 0.5), 
            icon = if v64 then v36 else v37, 
            iconColor3 = if v64 then l_Theme_0.IconEmphasis.Color else l_Theme_0.IconDefault.Color, 
            iconTransparency = if v64 then l_Theme_0.IconEmphasis.Transparency else l_Theme_0.IconDefault.Transparency, 
            layoutOrder = l_FFlagAXCustomizeMakeupSupport_0 and 2 or 3, 
            iconSize = l_IconSize_0.Medium, 
            onActivated = v56, 
            showBackground = true, 
            buttonRef = v44, 
            NextSelectionDown = v45, 
            NextSelectionUp = if l_FFlagAXCustomizeMakeupSupport_0 then v43 else v46
        }) else nil, 
        ColorAdjustment = v67
    });
end)));
return v3.forwardRef(function(v70, v71) --[[ Line: 255 ]]
    -- upvalues: v3 (copy), v69 (ref), v2 (copy)
    return v3.createElement(v69, v2.Dictionary.join(v70, {
        defaultChildRef = v71
    }));
end);