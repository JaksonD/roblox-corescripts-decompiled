local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation;
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.NavOverlayContainer);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v9 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.with10ftUIPadding);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixGamepadNavigationOnOutfitManagement;
local v14 = require(l_CorePackages_0.Packages.UIBlox);
local l_HeaderBar_0 = v14.App.Bar.HeaderBar;
local l_withStyle_0 = v14.Style.withStyle;
local l_Images_0 = v14.App.ImageSet.Images;
local v18 = l_Images_0["component_assets/circle_17"];
local v19 = v3.PureComponent:extend("NavOverlayPageContainer");
v19.validateProps = v5.strictInterface({
    headerBarProps = v5.strictInterface({
        title = v5.string, 
        renderLeft = v5.optional(v5.callback), 
        renderRight = v5.optional(v5.callback)
    }), 
    onDismiss = if l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 then v5.optional(v5.callback) else v5.callback, 
    ZIndex = v5.optional(v5.integer), 
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.table, 
    [v3.Children] = v5.table, 
    globalGuiInset = v5.strictInterface({
        left = v5.integer, 
        top = v5.integer, 
        right = v5.integer, 
        bottom = v5.integer
    }), 
    isPortrait = v5.boolean, 
    statusBarHeight = v5.number, 
    designTokens = v5.any, 
    forwardRef = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then v5.optional(v5.union(v5.callback, v5.table)) else nil
});
v19.renderWithProviders = function(v20, v21) --[[ Line: 71 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v18 (copy), l_Images_0 (copy), v3 (copy), l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v8 (copy), v7 (copy), l_HeaderBar_0 (copy), v2 (copy)
    local l_Theme_0 = v21.Theme;
    local l_globalGuiInset_0 = v20.props.globalGuiInset;
    local l_BackgroundDefault_0 = l_Theme_0.BackgroundDefault;
    local v25 = {};
    if not v20.props.isPortrait then
        l_BackgroundDefault_0 = l_Theme_0.BackgroundMuted;
        local l_ImageRectSize_0 = v18.ImageRectSize;
        local l_ImageRectOffset_0 = v18.ImageRectOffset;
        local l_X_0 = l_ImageRectSize_0.X;
        local v29 = l_X_0 / 2;
        v25 = {
            BackgroundTransparency = 1, 
            Image = v18.Image, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceScale = 1 / l_Images_0.ImagesResolutionScale, 
            SliceCenter = Rect.new(v29 - 1, v29 - 1, v29 + 1, v29), 
            ImageRectSize = Vector2.new(l_X_0, v29), 
            ImageRectOffset = l_ImageRectOffset_0, 
            ImageTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            ImageColor3 = l_Theme_0.BackgroundDefault.Color
        };
    end;
    local v30 = l_globalGuiInset_0.bottom > 0;
    local l_statusBarHeight_0 = v20.props.statusBarHeight;
    local l_designTokens_0 = v20.props.designTokens;
    local v33 = if l_designTokens_0 then l_designTokens_0.bottomPadding else 0;
    return v3.createElement("TextButton", {
        BackgroundColor3 = l_Theme_0.Overlay.Color, 
        BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 1), 
        Text = "", 
        AutoButtonColor = false, 
        [v3.Ref] = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then v20.props.forwardRef else nil, 
        [v3.Event.Activated] = v20.props.onDismiss, 
        Selectable = if not l_FFlagAXMigrateAXToGlobalAutofocus_0 or v20.props.onDismiss then nil else false
    }, {
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.createElement(v8, {
            focusController = v20.props.focusController, 
            captureFocusOnMount = true
        }), 
        NavOverlayContainer = v3.createElement(v7, {}, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            StatusBarBackground = v3.createElement("TextButton", {
                BackgroundColor3 = l_BackgroundDefault_0.Color, 
                BackgroundTransparency = v20.props.isPortrait and l_BackgroundDefault_0.Transparency or 1, 
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, l_statusBarHeight_0), 
                Text = "", 
                BorderSizePixel = 0, 
                AutoButtonColor = false, 
                Selectable = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil
            }), 
            HeaderBarBackground = v3.createElement("TextButton", {
                BackgroundColor3 = l_BackgroundDefault_0.Color, 
                BackgroundTransparency = l_BackgroundDefault_0.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 44), 
                Text = "", 
                AutoButtonColor = false, 
                LayoutOrder = 2, 
                Selectable = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil
            }, {
                HeaderBar = v3.createElement(l_HeaderBar_0, v2.Dictionary.join(v20.props.headerBarProps, {
                    backgroundTransparency = 1, 
                    barHeight = 44
                }))
            }), 
            ContentsFrame = v3.createElement("ImageButton", v2.Dictionary.join({
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                Position = UDim2.fromOffset(0, 44), 
                Size = UDim2.new(1, 0, 1, -(44 + l_statusBarHeight_0) + v33), 
                ClipsDescendants = true, 
                AutoButtonColor = false, 
                LayoutOrder = 3
            }, v25), v20.props[v3.Children]), 
            BottomInsetBackground = v30 and v3.createElement("TextButton", {
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, l_globalGuiInset_0.bottom), 
                Text = "", 
                ZIndex = 3, 
                AutoButtonColor = false, 
                LayoutOrder = 4, 
                Selectable = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil
            })
        })
    });
end;
v19.render = function(v34) --[[ Line: 201 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v35) --[[ Line: 202 ]]
        -- upvalues: v34 (copy)
        return v34:renderWithProviders(v35);
    end);
end;
local function v38(v36, _) --[[ Line: 207 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v9 (copy)
    return {
        globalGuiInset = v36.GlobalGuiInset, 
        isPortrait = v9(v36), 
        statusBarHeight = v36.TopBar.statusBarHeight
    };
end;
v19 = v11(v19);
return v4.connect(v38, nil)(v19);