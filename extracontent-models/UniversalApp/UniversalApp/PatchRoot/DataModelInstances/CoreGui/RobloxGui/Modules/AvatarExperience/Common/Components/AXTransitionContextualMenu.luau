local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_Focusable_0 = v6.Focusable;
local l_BaseMenu_0 = v5.App.Menu.BaseMenu;
local l_withStyle_0 = v5.Style.withStyle;
local l_Images_0 = v5.App.ImageSet.Images;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v15 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Services.Analytics);
local v16 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v16.Enums.AvatarScreen;
local l_AvatarRoute_0 = v16.AvatarRoute.AvatarRoute;
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.NavOverlayContainer);
local l_FFlagAXMigrateTitleDropDownInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateTitleDropDownInputBindingsToFocusNavigation;
local v25 = l_Images_0["icons/menu/customize"];
local v26 = l_Images_0["icons/menu/shop"];
local v27 = l_Images_0["icons/menu/profilepicture"];
local v28 = v2.PureComponent:extend("AXTransitionContextualMenu");
v28.validateProps = v4.strictInterface({
    defaultChildRef = v4.optional(v4.table), 
    onOverlayClosed = v4.optional(v4.callback), 
    focusController = v4.optional(v4.table), 
    navigation = v4.table, 
    avatarRoute = l_AvatarRoute_0.Interface, 
    screenSize = v4.Vector2, 
    globalGuiInset = v4.strictInterface({
        left = v4.integer, 
        top = v4.integer, 
        right = v4.integer, 
        bottom = v4.integer
    }), 
    topBarHeight = v4.number, 
    avatarAnalytics = v4.table, 
    catalogAnalytics = v4.table, 
    profilePictureEditorAnalytics = v4.table, 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    [v2.Ref] = v4.optional(v4.table), 
    inputBindings = v4.optional(v4.table)
});
v28.getOpaquePage = function(v29) --[[ Line: 76 ]] --[[ Name: getOpaquePage ]]
    return v29.props.avatarRoute.opaque.name;
end;
v28.init = function(v30) --[[ Line: 80 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_AvatarScreen_0 (copy), v22 (copy)
    local v31, v32 = v2.createBinding(UDim2.fromScale(1, 1));
    v30.contextMenuSize = v31;
    v30.updateContextMenuSize = v32;
    v30.onAbsoluteSizeChanged = function(v33) --[[ Line: 83 ]]
        -- upvalues: v30 (copy)
        if v33.AbsoluteSize.X > 640 then
            local v34 = UDim2.new(0, 350, 1, 0);
            v30.updateContextMenuSize(v34);
            return;
        else
            v30.updateContextMenuSize(UDim2.fromScale(1, 1));
            return;
        end;
    end;
    v30.goToAvatarEditorPage = function() --[[ Line: 93 ]]
        -- upvalues: v30 (copy), l_AvatarScreen_0 (ref), v22 (ref)
        if v30:getOpaquePage() ~= l_AvatarScreen_0.AvatarEditor then
            v22.navigateFromOverlay(v30.props.navigation, l_AvatarScreen_0.AvatarEditor);
            v30.props.avatarAnalytics.catalogToAvatarButton();
        end;
    end;
    v30.goToCatalogPage = function() --[[ Line: 101 ]]
        -- upvalues: v30 (copy), l_AvatarScreen_0 (ref), v22 (ref)
        if v30:getOpaquePage() ~= l_AvatarScreen_0.Catalog then
            v22.navigateFromOverlay(v30.props.navigation, l_AvatarScreen_0.Catalog);
            v30.props.catalogAnalytics.avatarToCatalogButton();
        end;
    end;
    v30.goToProfilePictureEditorPage = function() --[[ Line: 109 ]]
        -- upvalues: v30 (copy), l_AvatarScreen_0 (ref), v22 (ref)
        if v30:getOpaquePage() ~= l_AvatarScreen_0.ProfilePictureEditorEmotes then
            v22.navigateFromOverlay(v30.props.navigation, l_AvatarScreen_0.ProfilePictureEditorEmotes);
        end;
        v30.props.profilePictureEditorAnalytics.profilePictureEditorButton();
    end;
    v30.onDismiss = function() --[[ Line: 116 ]]
        -- upvalues: v22 (ref), v30 (copy)
        v22.closeOverlay(v30.props.navigation);
    end;
end;
v28.render = function(v35) --[[ Line: 121 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy)
    return l_withStyle_0(function(v36) --[[ Line: 122 ]]
        -- upvalues: l_withLocalization_0 (ref), v35 (copy)
        return l_withLocalization_0({
            customizeText = "Feature.Catalog.Action.Customize", 
            shopText = "Feature.Avatar.Action.Marketplace", 
            profilePictureEditorText = "Feature.Avatar.Action.EditProfilePicture"
        })(function(v37) --[[ Line: 127 ]]
            -- upvalues: v35 (ref), v36 (copy)
            return v35:renderWithProviders(v36, v37);
        end);
    end);
end;
v28.renderWithProviders = function(v38, v39, v40) --[[ Line: 133 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v2 (copy), v23 (copy), l_FFlagAXMigrateTitleDropDownInputBindingsToFocusNavigation_0 (copy), l_Focusable_0 (copy), l_BaseMenu_0 (copy), v25 (copy), l_AvatarScreen_0 (copy), v26 (copy), v27 (copy)
    local l_Theme_0 = v39.Theme;
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, {
        Background = v2.createElement("TextButton", {
            ZIndex = 1, 
            Text = "", 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
            AutoButtonColor = false, 
            Position = UDim2.fromOffset(-v38.props.globalGuiInset.left, -v38.props.globalGuiInset.top), 
            Size = UDim2.fromOffset(v38.props.screenSize.X, v38.props.screenSize.Y), 
            [v2.Event.Activated] = v38.onDismiss
        }), 
        Container = v2.createElement(v23, {
            ZIndex = 2, 
            onAbsoluteSizeChanged = v38.onAbsoluteSizeChanged
        }, {
            SizeFrame = v2.createElement(l_FFlagAXMigrateTitleDropDownInputBindingsToFocusNavigation_0 and "Frame" or l_Focusable_0.Frame, {
                BackgroundTransparency = 1, 
                Size = v38.contextMenuSize, 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.fromScale(0.5, 0), 
                [v2.Ref] = v38.props.defaultChildRef
            }, {
                Menu = v2.createElement(l_BaseMenu_0, {
                    anchorPoint = Vector2.new(0.5, 0), 
                    position = UDim2.new(0.5, 0, 0, v38.props.topBarHeight), 
                    buttonProps = {
                        {
                            icon = v25, 
                            text = v40.customizeText, 
                            onActivated = v38.goToAvatarEditorPage, 
                            selected = v38:getOpaquePage() == l_AvatarScreen_0.AvatarEditor
                        }, 
                        {
                            icon = v26, 
                            text = v40.shopText, 
                            onActivated = v38.goToCatalogPage, 
                            selected = v38:getOpaquePage() == l_AvatarScreen_0.Catalog
                        }, 
                        {
                            icon = v27, 
                            text = v40.profilePictureEditorText, 
                            onActivated = v38.goToProfilePictureEditorPage, 
                            selected = v38:getOpaquePage() == l_AvatarScreen_0.ProfilePictureEditorEmotes
                        }
                    }
                })
            })
        })
    });
end;
v28 = v3.connect(function(v42, _) --[[ Line: 198 ]]
    return {
        screenSize = v42.ScreenSize, 
        topBarHeight = v42.TopBar.topBarHeight, 
        globalGuiInset = v42.GlobalGuiInset
    };
end, nil)(v28);
return (v19((v21((v20((l_RoactServices_0.connect({
    avatarAnalytics = v13, 
    catalogAnalytics = v14, 
    profilePictureEditorAnalytics = v15
})(v28))))))));