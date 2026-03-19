local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v8 = require(l_CorePackages_0.Packages.AvatarExperienceDeps);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v9.Enums.AvatarScreen;
local l_AvatarRoute_0 = v9.AvatarRoute.AvatarRoute;
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v15 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_RoactFitComponents_0 = v8.RoactFitComponents;
local l_FitFrameOnAxis_0 = l_RoactFitComponents_0.FitFrameOnAxis;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_Images_0 = v5.App.ImageSet.Images;
local l_BaseMenu_0 = v5.App.Menu.BaseMenu;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v5.Style.withStyle;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v24 = require(l_Modules_0.LuaApp.Context.withTopBarSearchSignal);
local v25 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v26 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v27 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetEntryPage);
local v28 = require(l_Modules_0.LuaApp.AppPage);
local v29 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v30 = l_Images_0["component_assets/circle_17"];
local v31 = l_Images_0["icons/menu/customize"];
local v32 = l_Images_0["icons/menu/shop"];
local v33 = l_Images_0["icons/menu/profilepicture"];
local v34 = l_Images_0["icons/common/settings"];
local v35 = l_Images_0["icons/common/search"];
local v36 = l_Images_0["icons/actions/adjust"];
local v37 = l_Images_0["icons/common/goldrobux"];
local v38 = l_Images_0["icons/navigation/close"];
local v39 = v2.PureComponent:extend("AvatarExperienceQuickMenu");
v39.validateProps = v6.strictInterface({
    onOverlayClosed = v6.optional(v6.callback), 
    defaultChildRef = v6.optional(v6.table), 
    focusController = v6.optional(v6.table), 
    manageOutfitsEnabled = v6.boolean, 
    isAvatarEditorSceneFullView = v6.boolean, 
    isCatalogSceneFullView = v6.boolean, 
    isProfilePictureEditorEmotesSceneFullView = v6.boolean, 
    isMySharedAvatarSceneFullView = v6.boolean, 
    purchaseRobux = v6.callback, 
    setEntryPage = v6.callback, 
    avatarExperienceAnalytics = v6.table, 
    navigation = v6.table, 
    avatarRoute = l_AvatarRoute_0.Interface
});
v39.init = function(v40) --[[ Line: 78 ]] --[[ Name: init ]]
    -- upvalues: v14 (copy), l_AvatarScreen_0 (copy), v2 (copy)
    v40.onActivatedShop = function() --[[ Line: 79 ]]
        -- upvalues: v14 (ref), v40 (copy), l_AvatarScreen_0 (ref)
        v14.navigateFromOverlay(v40.props.navigation, l_AvatarScreen_0.Catalog);
    end;
    v40.onActivatedEditProfilePicture = function() --[[ Line: 83 ]]
        -- upvalues: v14 (ref), v40 (copy), l_AvatarScreen_0 (ref)
        v14.navigateFromOverlay(v40.props.navigation, l_AvatarScreen_0.ProfilePictureEditorEmotes, {
            prevNavPage = v40.props.avatarRoute.opaque.name
        });
    end;
    v40.onActivatedManage = function() --[[ Line: 89 ]]
        -- upvalues: v14 (ref), v40 (copy), l_AvatarScreen_0 (ref)
        v14.navigateFromOverlay(v40.props.navigation, l_AvatarScreen_0.ManageOutfitPage);
    end;
    v40.onActivatedCustomizeAvatar = function() --[[ Line: 93 ]]
        -- upvalues: v14 (ref), v40 (copy), l_AvatarScreen_0 (ref)
        v14.navigateFromOverlay(v40.props.navigation, l_AvatarScreen_0.AvatarEditor);
    end;
    v40.onActivatedRefinement = function() --[[ Line: 97 ]]
        -- upvalues: v40 (copy), v14 (ref), l_AvatarScreen_0 (ref)
        v40.props.setEntryPage(v40.props.avatarRoute.opaque.name);
        v14.navigateFromOverlay(v40.props.navigation, l_AvatarScreen_0.LayeredClothingSort);
    end;
    v40.onActivatedBuyRobux = function() --[[ Line: 102 ]]
        -- upvalues: v40 (copy)
        v40.closePrompt();
        v40.props.purchaseRobux();
    end;
    v40.closePrompt = function() --[[ Line: 107 ]]
        -- upvalues: v14 (ref), v40 (copy)
        v14.closeOverlay(v40.props.navigation);
    end;
    local v41, v42 = v2.createBinding(UDim2.fromScale(0.35, 0.5));
    v40.sizeBinding = v41;
    v40.updateSizeBinding = v42;
    v40.onContentSizeChanged = function(v43) --[[ Line: 113 ]]
        -- upvalues: v40 (copy)
        local l_Y_0 = v43.AbsoluteContentSize.Y;
        v40.updateSizeBinding(UDim2.new(0.35, 0, 0, l_Y_0));
    end;
end;
v39.gatherElements = function(v45, v46, v47) --[[ Line: 119 ]] --[[ Name: gatherElements ]]
    -- upvalues: l_AvatarScreen_0 (copy), v31 (copy), v32 (copy), v33 (copy), v34 (copy), v35 (copy), v36 (copy), v37 (copy), v38 (copy)
    local v48 = {};
    local l_name_0 = v45.props.avatarRoute.opaque.name;
    if l_name_0 == l_AvatarScreen_0.AvatarExperienceLandingPage or l_name_0 == l_AvatarScreen_0.Catalog or l_name_0 == l_AvatarScreen_0.ProfilePictureEditorEmotes then
        table.insert(v48, {
            icon = v31, 
            text = v46.customizeAvatar, 
            onActivated = v45.onActivatedCustomizeAvatar
        });
    end;
    if l_name_0 == l_AvatarScreen_0.AvatarExperienceLandingPage or l_name_0 == l_AvatarScreen_0.AvatarEditor or l_name_0 == l_AvatarScreen_0.MySharedAvatars or l_name_0 == l_AvatarScreen_0.ProfilePictureEditorEmotes then
        table.insert(v48, {
            icon = v32, 
            text = v46.shop, 
            onActivated = v45.onActivatedShop
        });
    end;
    if l_name_0 == l_AvatarScreen_0.AvatarExperienceLandingPage or l_name_0 == l_AvatarScreen_0.AvatarEditor or l_name_0 == l_AvatarScreen_0.Catalog then
        table.insert(v48, {
            icon = v33, 
            text = v46.editProfilePicture, 
            onActivated = v45.onActivatedEditProfilePicture
        });
    end;
    if v45.props.manageOutfitsEnabled and l_name_0 == l_AvatarScreen_0.AvatarEditor then
        table.insert(v48, {
            icon = v34, 
            text = v46.manage, 
            onActivated = v45.onActivatedManage
        });
    end;
    local v50 = v45.props.isAvatarEditorSceneFullView or v45.props.isMySharedAvatarSceneFullView or v45.props.isCatalogSceneFullView or v45.props.isProfilePictureEditorEmotesSceneFullView;
    if l_name_0 == l_AvatarScreen_0.Catalog and not v50 then
        table.insert(v48, {
            icon = v35, 
            text = v46.search, 
            onActivated = function() --[[ Line: 184 ]] --[[ Name: onActivated ]]
                -- upvalues: v45 (copy), v47 (copy), l_name_0 (copy)
                v45.closePrompt();
                v47:fire(l_name_0);
            end
        });
    end;
    table.insert(v48, {
        icon = v36, 
        text = v46.avatarAdjustment, 
        onActivated = v45.onActivatedRefinement
    });
    table.insert(v48, {
        icon = v37, 
        text = v46.buyRobux, 
        onActivated = v45.onActivatedBuyRobux
    });
    table.insert(v48, {
        icon = v38, 
        text = v46.cancel, 
        onActivated = v45.closePrompt
    });
    return v48;
end;
v39.renderWithProviders = function(v51, v52, v53, v54) --[[ Line: 212 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_AvatarScreen_0 (copy), v2 (copy), l_Focusable_0 (copy), l_ImageSetLabel_0 (copy), v30 (copy), l_FitFrameOnAxis_0 (copy), l_FitTextLabel_0 (copy), l_BaseMenu_0 (copy)
    local l_Font_0 = v53.Font;
    local l_Theme_0 = v53.Theme;
    local l_Font_1 = l_Font_0.Header1.Font;
    local v58 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
    local v59 = v51:gatherElements(v52, v54);
    local l_name_1 = v51.props.avatarRoute.current.name;
    local v61 = nil;
    v61 = if l_name_1 == l_AvatarScreen_0.AvatarExperienceLandingPage then v52.avatarOptions else if l_name_1 == l_AvatarScreen_0.AvatarEditor then v52.customizeOptions else v52.shopOptions;
    return v2.createElement(l_Focusable_0[l_ImageSetLabel_0], {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = v51.sizeBinding, 
        Position = UDim2.fromScale(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = v30, 
        ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
        ImageTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(8, 8, 9, 9), 
        [v2.Ref] = v51.props.defaultChildRef
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 20), 
            [v2.Change.AbsoluteContentSize] = v51.onContentSizeChanged
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 20)
        }), 
        TextContainer = v2.createElement(l_FitFrameOnAxis_0, {
            axis = l_FitFrameOnAxis_0.Axis.Both, 
            margin = {
                top = 0, 
                bottom = 0, 
                left = 20, 
                right = 0
            }, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            TitleText = v2.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                Text = v61, 
                Font = l_Font_1, 
                TextSize = v58, 
                BackgroundTransparency = 1, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency
            })
        }), 
        BaseMenu = v2.createElement(l_BaseMenu_0, {
            buttonProps = v59, 
            layoutOrder = 2, 
            topElementRounded = false
        })
    });
end;
v39.render = function(v62) --[[ Line: 282 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy), v24 (copy)
    return l_withLocalization_0({
        avatarOptions = "Feature.Avatar.Label.QuickMenuLandingPageTitle", 
        shopOptions = "Feature.Catalog.Label.QuickMenuMarketplaceTitle", 
        customizeOptions = "Feature.Avatar.Label.QuickMenuCustomizeTitle", 
        shop = "Feature.Avatar.Action.Marketplace", 
        manage = "Feature.Avatar.Label.ManageItems", 
        customizeAvatar = "Feature.Catalog.Label.CustomizeAvatar", 
        editProfilePicture = "Feature.Avatar.Action.EditProfilePicture", 
        search = "Feature.Catalog.Label.Search", 
        buyRobux = "Feature.Catalog.Label.BuyRobux", 
        cancel = "Feature.Catalog.Action.Cancel", 
        avatarAdjustment = "Feature.Avatar.Label.AvatarAdjustment"
    })(function(v63) --[[ Line: 295 ]]
        -- upvalues: l_withStyle_0 (ref), v24 (ref), v62 (copy)
        return l_withStyle_0(function(v64) --[[ Line: 296 ]]
            -- upvalues: v24 (ref), v62 (ref), v63 (copy)
            return v24(function(v65) --[[ Line: 297 ]]
                -- upvalues: v62 (ref), v63 (ref), v64 (copy)
                return v62:renderWithProviders(v63, v64, v65);
            end);
        end);
    end);
end;
v39 = v3.connect(function(v66, _) --[[ Line: 304 ]]
    -- upvalues: v15 (copy), l_AvatarScreen_0 (copy), v25 (copy)
    local v68 = v15.getAvatarEditorCategoryInfoFromState(v66);
    local v69 = v66.AvatarExperience.Common.FullView[l_AvatarScreen_0.ProfilePictureEditorEmotes] == v25.SceneFullView;
    return {
        manageOutfitsEnabled = v68.ManageOutfitsEnabled == true, 
        isAvatarEditorSceneFullView = v66.AvatarExperience.Common.FullView[l_AvatarScreen_0.AvatarEditor] == v25.SceneFullView, 
        isCatalogSceneFullView = v66.AvatarExperience.Common.FullView[l_AvatarScreen_0.Catalog] == v25.SceneFullView, 
        isProfilePictureEditorEmotesSceneFullView = v69, 
        isMySharedAvatarSceneFullView = v66.AvatarExperience.Common.FullView[l_AvatarScreen_0.MySharedAvatars] == v25.SceneFullView
    };
end, function(v70) --[[ Line: 320 ]]
    -- upvalues: v29 (copy), v28 (copy), v27 (copy)
    return {
        purchaseRobux = function() --[[ Line: 322 ]] --[[ Name: purchaseRobux ]]
            -- upvalues: v70 (copy), v29 (ref), v28 (ref)
            v70(v29({
                name = v28.PurchaseRobux
            }));
        end, 
        setEntryPage = function(v71) --[[ Line: 327 ]] --[[ Name: setEntryPage ]]
            -- upvalues: v70 (copy), v27 (ref)
            v70(v27(v71));
        end
    };
end)(v39);
return (v12((v13((l_RoactServices_0.connect({
    avatarExperienceAnalytics = v26
})(v39))))));