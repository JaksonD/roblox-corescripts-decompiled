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
local v13 = require(l_CorePackages_0.Packages.UIBlox);
local l_HeaderBar_0 = v13.App.Bar.HeaderBar;
local l_withStyle_0 = v13.Style.withStyle;
local l_Images_0 = v13.App.ImageSet.Images;
local v17 = l_Images_0["component_assets/circle_17"];
local v18 = v3.PureComponent:extend("NavOverlayPageContainer");
v18.validateProps = v5.strictInterface({
    headerBarProps = v5.strictInterface({
        title = v5.string, 
        renderLeft = v5.optional(v5.callback), 
        renderRight = v5.optional(v5.callback)
    }), 
    onDismiss = v5.callback, 
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
v18.renderWithProviders = function(v19, v20) --[[ Line: 68 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v17 (copy), l_Images_0 (copy), v3 (copy), l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v8 (copy), v7 (copy), l_HeaderBar_0 (copy), v2 (copy)
    local l_Theme_0 = v20.Theme;
    local l_globalGuiInset_0 = v19.props.globalGuiInset;
    local l_BackgroundDefault_0 = l_Theme_0.BackgroundDefault;
    local v24 = {};
    if not v19.props.isPortrait then
        l_BackgroundDefault_0 = l_Theme_0.BackgroundMuted;
        local l_ImageRectSize_0 = v17.ImageRectSize;
        local l_ImageRectOffset_0 = v17.ImageRectOffset;
        local l_X_0 = l_ImageRectSize_0.X;
        local v28 = l_X_0 / 2;
        v24 = {
            BackgroundTransparency = 1, 
            Image = v17.Image, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceScale = 1 / l_Images_0.ImagesResolutionScale, 
            SliceCenter = Rect.new(v28 - 1, v28 - 1, v28 + 1, v28), 
            ImageRectSize = Vector2.new(l_X_0, v28), 
            ImageRectOffset = l_ImageRectOffset_0, 
            ImageTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            ImageColor3 = l_Theme_0.BackgroundDefault.Color
        };
    end;
    local v29 = l_globalGuiInset_0.bottom > 0;
    local l_statusBarHeight_0 = v19.props.statusBarHeight;
    local l_designTokens_0 = v19.props.designTokens;
    local v32 = if l_designTokens_0 then l_designTokens_0.bottomPadding else 0;
    return v3.createElement("TextButton", {
        BackgroundColor3 = l_Theme_0.Overlay.Color, 
        BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 1), 
        Text = "", 
        AutoButtonColor = false, 
        [v3.Ref] = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then v19.props.forwardRef else nil, 
        [v3.Event.Activated] = v19.props.onDismiss, 
        Selectable = if not l_FFlagAXMigrateAXToGlobalAutofocus_0 or v19.props.onDismiss then nil else false
    }, {
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.createElement(v8, {
            focusController = v19.props.focusController, 
            captureFocusOnMount = true
        }), 
        NavOverlayContainer = v3.createElement(v7, {}, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            StatusBarBackground = v3.createElement("TextButton", {
                BackgroundColor3 = l_BackgroundDefault_0.Color, 
                BackgroundTransparency = v19.props.isPortrait and l_BackgroundDefault_0.Transparency or 1, 
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
                HeaderBar = v3.createElement(l_HeaderBar_0, v2.Dictionary.join(v19.props.headerBarProps, {
                    backgroundTransparency = 1, 
                    barHeight = 44
                }))
            }), 
            ContentsFrame = v3.createElement("ImageButton", v2.Dictionary.join({
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                Position = UDim2.fromOffset(0, 44), 
                Size = UDim2.new(1, 0, 1, -(44 + l_statusBarHeight_0) + v32), 
                ClipsDescendants = true, 
                AutoButtonColor = false, 
                LayoutOrder = 3
            }, v24), v19.props[v3.Children]), 
            BottomInsetBackground = v29 and v3.createElement("TextButton", {
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
v18.render = function(v33) --[[ Line: 198 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v34) --[[ Line: 199 ]]
        -- upvalues: v33 (copy)
        return v33:renderWithProviders(v34);
    end);
end;
local function v37(v35, _) --[[ Line: 204 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v9 (copy)
    return {
        globalGuiInset = v35.GlobalGuiInset, 
        isPortrait = v9(v35), 
        statusBarHeight = v35.TopBar.statusBarHeight
    };
end;
v18 = v11(v18);
return v4.connect(v37, nil)(v18);