local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.t);
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_Focusable_0 = v5.Focusable;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v10.Style.withStyle;
local l_Images_0 = v10.App.ImageSet.Images;
local l_ImageSetLabel_0 = v10.Core.ImageSet.ImageSetLabel;
local v14 = require(l_CorePackages_0.Packages.Cryo);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Constants);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v21 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v22 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils);
local v23 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneInteractionFrame);
local v25 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v26 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v28 = require(l_Modules_0.AvatarExperience.Common.Context.AppliedDescription.useAppliedDescriptionValueContext);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v31 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Components.RefinementNavBar);
local v32 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.VerticalDrawer);
local v33 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v34 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v35 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Components.RefinementControlBar);
local v36 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXMigrateAdjustAccessoryViewToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAdjustAccessoryViewToFocusNavigation;
local v39 = l_Images_0["icons/menu/about_large"];
local v40 = v3.PureComponent:extend("AccessoryAdjustmentPage");
v40.validateProps = v6.strictInterface({
    tokens = if l_FFlagAXMigrateAdjustAccessoryViewToFocusNavigation_0 then v6.table else nil, 
    fullView = v6.userdata, 
    isPortrait = v6.boolean, 
    setFullView = v6.callback, 
    noAccessoriesEquipped = v6.boolean, 
    avatarExperienceAnalytics = v6.table, 
    avatarRoute = v6.table, 
    navigation = v6.table
});
v40.init = function(v41) --[[ Line: 80 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v5 (copy), v3 (copy), v34 (copy), v23 (copy)
    v41.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.createFocusController();
    v41.verticalDrawerRef = v3.createRef();
    v41.topBarRef = v3.createRef();
    v41.adjustmentButtonRef = v3.createRef();
    v41.refinementNavBarRef = v3.createRef();
    v41.props.setFullView(v41.props.avatarExperienceAnalytics, v34.SceneFullView);
    v41.backButtonComponent = v23.makeBackButton(function() --[[ Line: 88 ]]
        -- upvalues: v41 (copy)
        v41.props.navigation.pop();
    end);
end;
v40.renderTopBar = function(v42) --[[ Line: 93 ]] --[[ Name: renderTopBar ]]
    -- upvalues: l_withLocalization_0 (copy), v3 (copy), v23 (copy)
    local l_isPortrait_0 = v42.props.isPortrait;
    return l_withLocalization_0({
        titleText = "Feature.Avatar.Heading.AccessoryAdjustmentTitle"
    })(function(v44) --[[ Line: 98 ]]
        -- upvalues: v3 (ref), v23 (ref), v42 (copy), l_isPortrait_0 (copy)
        return v3.createElement(v23.Container, {
            titleText = v44.titleText, 
            NextSelectionDown = v42.adjustmentButtonRef, 
            transparentBackground = true, 
            hideSiteMessageBanner = l_isPortrait_0, 
            leftItem = v42.backButtonComponent, 
            ref = v42.topBarRef
        });
    end);
end;
v40.renderWithProviders = function(v45, v46, v47) --[[ Line: 110 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v3 (copy), v24 (copy), v36 (copy), v35 (copy), v31 (copy), v32 (copy), v19 (copy), l_FFlagAXMigrateAdjustAccessoryViewToFocusNavigation_0 (copy), l_ImageSetLabel_0 (copy), v39 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v33 (copy), l_Focusable_0 (copy)
    local l_Font_0 = v46.Font;
    local l_Theme_0 = v46.Theme;
    local v50 = {
        SceneInteractionFrame = v3.createElement(v24), 
        TopBar = v45:renderTopBar(), 
        RefinementNavBar = v3.createElement(if v36() then v35 else v31, {
            NextSelectionRight = v45.verticalDrawerRef, 
            NextSelectionUp = v45.topBarRef, 
            ref = v45.refinementNavBarRef
        }), 
        VerticalDrawer = if not v45.props.noAccessoriesEquipped then v3.createElement(v32, {
            ref = v45.verticalDrawerRef, 
            NextSelectionLeft = v45.refinementNavBarRef
        }) else nil, 
        NoAccessoriesWarning = if v45.props.noAccessoriesEquipped then v3.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, v19.NoItem.BottomPadding), 
            Size = UDim2.new(1, 0, 0, 100), 
            BackgroundTransparency = 1
        }, {
            Label = v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromScale(0, 0), 
                Text = v47.noAccessoriesText, 
                Font = l_Font_0.CaptionHeader.Font, 
                TextSize = if l_FFlagAXMigrateAdjustAccessoryViewToFocusNavigation_0 then v45.props.tokens.Typography.BodyMedium.FontSize else v19.NoItem.TextSize, 
                TextColor3 = l_Theme_0.IconEmphasis.Color, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, {
                Icon = v3.createElement(l_ImageSetLabel_0, {
                    Image = v39, 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, -2, 0.5, 0), 
                    Size = UDim2.fromOffset(v19.NoItem.IconSize, v19.NoItem.IconSize), 
                    ImageColor3 = l_Theme_0.IconEmphasis.Color
                })
            })
        }) else nil, 
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.createElement(v33, {
            focusController = v45.focusController, 
            captureFocusOnMount = true
        })
    };
    return v3.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v45.focusController, 
        defaultChild = v45.verticalDrawerRef, 
        ZIndex = 2
    }, v50);
end;
v40.render = function(v51) --[[ Line: 181 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy)
    return l_withStyle_0(function(v52) --[[ Line: 182 ]]
        -- upvalues: l_withLocalization_0 (ref), v51 (copy)
        return l_withLocalization_0({
            noAccessoriesText = "Feature.Avatar.Message.NoAccessoriesEquipped"
        })(function(v53) --[[ Line: 185 ]]
            -- upvalues: v51 (ref), v52 (copy)
            return v51:renderWithProviders(v52, v53);
        end);
    end);
end;
v40 = v4.connect(function(v54, _) --[[ Line: 191 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v26 (copy), l_AvatarScreen_0 (copy)
    return {
        isPortrait = v54.DeviceOrientation == l_DeviceOrientationMode_0.Portrait, 
        fullView = v26(v54, l_AvatarScreen_0.AccessoryAdjustment)
    };
end, function(v56) --[[ Line: 200 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v25 (copy), l_AvatarScreen_0 (copy)
    return {
        setFullView = function(v57, v58) --[[ Line: 202 ]] --[[ Name: setFullView ]]
            -- upvalues: v56 (copy), v25 (ref), l_AvatarScreen_0 (ref)
            v56(v25(v57, l_AvatarScreen_0.AccessoryAdjustment, v58));
        end
    };
end)(v40);
v40 = v17((l_RoactServices_0.connect({
    avatarExperienceAnalytics = v21
})(v40)));
local function v60(v59) --[[ Line: 216 ]] --[[ Name: selectAllowedAATypes ]]
    -- upvalues: v20 (copy)
    return v59.AvatarExperience.AvatarEditor.AvatarSettings[v20.AvatarSettings.accessoryRefinementTypes];
end;
return function(v61) --[[ Line: 220 ]]
    -- upvalues: v28 (copy), l_FFlagAXMigrateAdjustAccessoryViewToFocusNavigation_0 (copy), l_useTokens_0 (copy), v14 (copy), l_useSelector_0 (copy), v60 (copy), v22 (copy), v2 (copy), v40 (ref)
    local v62 = v28().appliedDescriptionBinding:getValue();
    if l_FFlagAXMigrateAdjustAccessoryViewToFocusNavigation_0 then
        local v63 = l_useTokens_0();
        v61 = v14.Dictionary.join(v61, {
            tokens = v63
        });
    end;
    if v62 then
        local v64 = l_useSelector_0(v60);
        local v65 = v22.getAdjustableAccessories(v62, v64);
        v61 = v14.Dictionary.join(v61, {
            noAccessoriesEquipped = v14.isEmpty(v65)
        });
    end;
    return v2.createElement(v40, v61);
end;