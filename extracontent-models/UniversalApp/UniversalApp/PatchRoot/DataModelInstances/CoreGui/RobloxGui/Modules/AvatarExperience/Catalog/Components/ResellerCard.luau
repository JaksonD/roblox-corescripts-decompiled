local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local v10 = require(l_CorePackages_0.Packages.AvatarExperienceDeps);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_withSelectionCursorProvider_0 = v9.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v9.App.SelectionImage.CursorKind;
local v14 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_RoactFitComponents_0 = v10.RoactFitComponents;
local l_FitFrameOnAxis_0 = l_RoactFitComponents_0.FitFrameOnAxis;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_Images_0 = v9.App.ImageSet.Images;
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = v9.Core.ImageSet.ImageSetButton;
local v24 = require(l_Modules_0.LuaApp.AppPage);
local v25 = require(l_Modules_0.LuaApp.Constants);
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v28 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v29 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local v31 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v31.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v31.Utils.getRbxthumbWithTypeSizeAndOptions;
local v34 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus and game:DefineFastFlag("AXMigrateResellersCardToAutofocus", false);
local v35 = game:DefineFastFlag("AXResellersCardShouldRespectWebViewAvailability", false);
local l_withStyle_0 = v9.Style.withStyle;
local l_AVATAR_PLACEHOLDER_IMAGE_0 = v25.AVATAR_PLACEHOLDER_IMAGE;
local v38 = l_Images_0["component_assets/circle_17"];
local v39 = nil;
local l_ImageRectSize_0 = v38.ImageRectSize;
local v41 = 8 * l_Images_0.ImagesResolutionScale;
local v42 = 8 * l_Images_0.ImagesResolutionScale;
v39 = Rect.new(v41, v42, l_ImageRectSize_0.x - v41, l_ImageRectSize_0.y - v42);
l_ImageRectSize_0 = l_Images_0["icons/status/item/limited"];
v41 = l_Images_0["icons/common/robux"];
v42 = l_Constants_0.RbxthumbTypes.AvatarHeadShot;
local v43 = v3.PureComponent:extend("ResellerCard");
v43.init = function(v44) --[[ Line: 95 ]] --[[ Name: init ]]
    -- upvalues: v24 (copy), v29 (copy), l_AvatarScreen_0 (copy), v27 (copy), v34 (copy)
    v44.viewProfile = function() --[[ Line: 96 ]]
        -- upvalues: v44 (copy), v24 (ref), v29 (ref)
        v44.props.navigateDown({
            name = v24.GenericWebPage, 
            detail = v29.user.profile({
                userId = v44.props.sellerId
            }), 
            extraProps = {
                titleKey = "CommonUI.Features.Label.Profile"
            }
        });
    end;
    v44.openPurchasePrompt = function() --[[ Line: 108 ]]
        -- upvalues: v44 (copy), l_AvatarScreen_0 (ref)
        local l_userRobux_0 = v44.props.userRobux;
        local l_itemId_0 = v44.props.itemId;
        local l_itemType_0 = v44.props.itemType;
        local l_productId_0 = v44.props.productId;
        local l_itemPrice_0 = v44.props.itemPrice;
        local l_sellerId_0 = v44.props.sellerId;
        local l_sellerName_0 = v44.props.sellerName;
        local l_userAssetId_0 = v44.props.userAssetId;
        local l_collectibleInstanceId_0 = v44.props.collectibleInstanceId;
        local l_navigation_0 = v44.props.navigation;
        local v55 = v44.onOverlayClosed();
        local v56 = l_navigation_0.getParam("fromContentFeed");
        local v57 = l_navigation_0.getParam("fromProfile");
        if l_itemPrice_0 and l_userRobux_0 and l_itemPrice_0 <= l_userRobux_0 then
            l_navigation_0.navigate(l_AvatarScreen_0.PurchaseCatalogItem, {
                itemId = l_itemId_0, 
                itemType = l_itemType_0, 
                productId = l_productId_0, 
                priceInRobux = l_itemPrice_0, 
                sellerId = l_sellerId_0, 
                sellerName = l_sellerName_0, 
                userAssetId = l_userAssetId_0, 
                collectibleInstanceId = l_collectibleInstanceId_0, 
                onOverlayClosed = v55, 
                fromProfile = v57, 
                fromContentFeed = v56
            });
            return;
        else
            l_navigation_0.navigate(l_AvatarScreen_0.InsufficientRobuxPrompt, {
                onOverlayClosed = v55
            });
            return;
        end;
    end;
    v44.onOverlayClosed = function() --[[ Line: 144 ]]
        -- upvalues: v27 (ref), v34 (ref), v44 (copy)
        return function() --[[ Line: 145 ]]
            -- upvalues: v27 (ref), v34 (ref), v44 (ref)
            v27("ResellerCard");
            if not v34 then
                v44.props.focusController.captureFocus();
            end;
        end;
    end;
end;
v43.render = function(v58) --[[ Line: 154 ]] --[[ Name: render ]]
    -- upvalues: l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v42 (copy), l_NumberLocalization_0 (copy), l_withSelectionCursorProvider_0 (copy), v3 (copy), l_FitFrameVertical_0 (copy), l_RoactFitComponents_0 (copy), v35 (copy), l_ImageSetLabel_0 (copy), l_AVATAR_PLACEHOLDER_IMAGE_0 (copy), l_FitFrameOnAxis_0 (copy), v14 (copy), v38 (copy), v39 (ref), l_ImageRectSize_0 (copy), l_FitTextLabel_0 (copy), v34 (copy), l_ImageSetButton_0 (copy), l_Focusable_0 (copy), l_CursorKind_0 (copy), v41 (copy), l_withStyle_0 (copy)
    local l_serialNumber_0 = v58.props.serialNumber;
    local l_sellerId_1 = v58.props.sellerId;
    local l_sellerName_1 = v58.props.sellerName;
    local l_itemPrice_1 = v58.props.itemPrice;
    local l_LayoutOrder_0 = v58.props.LayoutOrder;
    local l_localization_0 = v58.props.localization;
    local v65 = l_getRbxthumbWithTypeSizeAndOptions_0(l_sellerId_1, v42, 48);
    return l_withStyle_0(function(v66) --[[ Line: 164 ]]
        -- upvalues: l_itemPrice_1 (copy), l_NumberLocalization_0 (ref), l_localization_0 (copy), l_withSelectionCursorProvider_0 (ref), v3 (ref), l_FitFrameVertical_0 (ref), l_RoactFitComponents_0 (ref), l_LayoutOrder_0 (copy), v35 (ref), v58 (copy), l_serialNumber_0 (copy), l_ImageSetLabel_0 (ref), v65 (copy), l_AVATAR_PLACEHOLDER_IMAGE_0 (ref), l_FitFrameOnAxis_0 (ref), v14 (ref), l_sellerName_1 (copy), v38 (ref), v39 (ref), l_ImageRectSize_0 (ref), l_FitTextLabel_0 (ref), v34 (ref), l_ImageSetButton_0 (ref), l_Focusable_0 (ref), l_CursorKind_0 (ref), v41 (ref)
        local l_Theme_0 = v66.Theme;
        local l_Font_0 = v66.Font;
        local l_Color_0 = l_Theme_0.BackgroundDefault.Color;
        local l_Footer_0 = l_Font_0.Footer;
        local v71 = l_Footer_0.RelativeSize * l_Font_0.BaseSize;
        local v72 = string.format("%.0f", l_itemPrice_1);
        local v73 = l_NumberLocalization_0.localize(v72, l_localization_0:GetLocale());
        return l_withSelectionCursorProvider_0(function(v74) --[[ Line: 176 ]]
            -- upvalues: v3 (ref), l_FitFrameVertical_0 (ref), l_RoactFitComponents_0 (ref), l_LayoutOrder_0 (ref), l_Theme_0 (copy), v35 (ref), v58 (ref), l_serialNumber_0 (ref), l_ImageSetLabel_0 (ref), v65 (ref), l_AVATAR_PLACEHOLDER_IMAGE_0 (ref), l_Color_0 (copy), l_FitFrameOnAxis_0 (ref), v14 (ref), l_Font_0 (copy), l_sellerName_1 (ref), v38 (ref), v39 (ref), v71 (copy), l_ImageRectSize_0 (ref), l_FitTextLabel_0 (ref), l_Footer_0 (copy), v34 (ref), l_ImageSetButton_0 (ref), l_Focusable_0 (ref), l_CursorKind_0 (ref), v41 (ref), v73 (copy)
            return v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 8), 
                margin = l_RoactFitComponents_0.Rect.rectangle(24, 0), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                LayoutOrder = l_LayoutOrder_0, 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color
            }, {
                ProfileButton = v3.createElement(l_FitFrameVertical_0, {
                    width = UDim.new(1, 0), 
                    onActivated = if v35 then if v58.props.isWebViewSupported then v58.viewProfile else nil else v58.viewProfile, 
                    Selectable = if v35 then v58.props.isWebViewSupported else nil, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    UserAndStatsFrame = v3.createElement(l_FitFrameVertical_0, {
                        width = UDim.new(1, 0), 
                        contentPadding = UDim.new(0, 12), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = l_serialNumber_0 and Enum.VerticalAlignment.Bottom or Enum.VerticalAlignment.Center, 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.new(0.5, 0, 0, 0), 
                        BackgroundTransparency = 1
                    }, {
                        UserThumbnail = v3.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(0, 48, 0, 48), 
                            BackgroundTransparency = 1, 
                            Image = v65 or l_AVATAR_PLACEHOLDER_IMAGE_0, 
                            LayoutOrder = 1
                        }, {
                            MaskFrame = v3.createElement(l_ImageSetLabel_0, {
                                Size = UDim2.new(1, 0, 1, 0), 
                                BackgroundTransparency = 1, 
                                Image = "rbxasset://textures/ui/LuaApp/graphic/profilemask.png", 
                                ImageColor3 = l_Color_0
                            })
                        }), 
                        SerialAndUsernameFrame = v3.createElement(l_FitFrameOnAxis_0, {
                            axis = l_FitFrameOnAxis_0.Axis.Both, 
                            contentPadding = UDim.new(0, 3), 
                            FillDirection = Enum.FillDirection.Vertical, 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 2
                        }, {
                            Username = v3.createElement(v14.EmojiWrapper, {
                                emoji = if v58.props.sellerHasVerifiedBadge then v14.emoji.verified else ""
                            }, {
                                UsernameLabel = v3.createElement("TextLabel", {
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    BackgroundTransparency = 1, 
                                    Font = l_Font_0.Header2.Font, 
                                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                                    TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
                                    Text = l_sellerName_1, 
                                    LayoutOrder = 1
                                })
                            }), 
                            SerialNumberLabel = l_serialNumber_0 and v3.createElement(l_FitFrameOnAxis_0, {
                                axis = l_FitFrameOnAxis_0.Axis.Both, 
                                contentPadding = UDim.new(0, 1), 
                                margin = l_RoactFitComponents_0.Rect.square(4), 
                                FillDirection = Enum.FillDirection.Horizontal, 
                                VerticalAlignment = Enum.VerticalAlignment.Center, 
                                ImageSet = v38, 
                                BackgroundTransparency = 1, 
                                ImageColor3 = l_Theme_0.UIDefault.Color, 
                                ImageTransparency = l_Theme_0.UIDefault.Transparency, 
                                ScaleType = Enum.ScaleType.Slice, 
                                SliceCenter = v39, 
                                LayoutOrder = 2
                            }, {
                                LimitedIcon = v3.createElement(l_ImageSetLabel_0, {
                                    Size = UDim2.new(0, v71, 0, v71), 
                                    BackgroundTransparency = 1, 
                                    Image = l_ImageRectSize_0, 
                                    ImageColor3 = l_Theme_0.TextEmphasis.Color, 
                                    LayoutOrder = 1
                                }), 
                                SerialNumberText = v3.createElement(l_FitTextLabel_0, {
                                    width = l_FitTextLabel_0.Width.FitToText, 
                                    Size = UDim2.new(0, 0, 0, v71), 
                                    BackgroundTransparency = 1, 
                                    Font = l_Footer_0.Font, 
                                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                                    TextSize = v71, 
                                    Text = "#" .. l_serialNumber_0, 
                                    LayoutOrder = 2
                                })
                            })
                        })
                    })
                }), 
                BuyButton = v3.createElement(if v34 then l_ImageSetButton_0 else l_Focusable_0[l_ImageSetButton_0], {
                    Size = UDim2.new(1, 0, 0, 44), 
                    BackgroundTransparency = 1, 
                    Image = v38, 
                    ImageColor3 = l_Theme_0.ContextualPrimaryDefault.Color, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 9, 9), 
                    LayoutOrder = 2, 
                    SelectionImageObject = v74(l_CursorKind_0.RoundedRectNoInset), 
                    [v3.Event.Activated] = v58.openPurchasePrompt
                }, {
                    PriceFrame = v3.createElement(l_FitFrameOnAxis_0, {
                        axis = l_FitFrameOnAxis_0.Axis.Both, 
                        contentPadding = UDim.new(0, 4), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        BackgroundTransparency = 1
                    }, {
                        RobuxIcon = v3.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(0, 25, 0, 25), 
                            BackgroundTransparency = 1, 
                            Image = v41, 
                            ImageColor3 = l_Theme_0.ContextualPrimaryContent.Color, 
                            ImageTransparency = l_Theme_0.ContextualPrimaryContent.Transparency, 
                            LayoutOrder = 1
                        }), 
                        Price = v3.createElement(l_FitTextLabel_0, {
                            width = l_FitTextLabel_0.Width.FitToText, 
                            BackgroundTransparency = 1, 
                            Font = l_Font_0.Header2.Font, 
                            TextColor3 = l_Theme_0.ContextualPrimaryContent.Color, 
                            TextTransparency = l_Theme_0.ContextualPrimaryContent.Transparency, 
                            TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
                            Text = v73, 
                            LayoutOrder = 2
                        })
                    })
                })
            });
        end);
    end);
end;
local v77 = function(v75) --[[ Line: 341 ]]
    -- upvalues: v28 (copy)
    return {
        navigateDown = function(v76) --[[ Line: 343 ]] --[[ Name: navigateDown ]]
            -- upvalues: v75 (copy), v28 (ref)
            v75(v28(v76));
        end
    };
end or nil;
v43 = v5.connect(function(v78, v79) --[[ Line: 349 ]] --[[ Name: mapStateToProps ]]
    local v80 = v78.Users[v79.sellerId];
    local l_LocalUserId_0 = v78.LocalUserId;
    return {
        userRobux = v78.UserRobux[l_LocalUserId_0], 
        userName = v80 and v80.name
    };
end, v77)(v43);
v43 = l_withNavigation_0((l_RoactServices_0.connect({
    localization = v7
})(v43)));
if v35 then
    return function(v82) --[[ Line: 368 ]]
        -- upvalues: l_useAppPolicy_0 (copy), v4 (copy), v43 (ref)
        local v84 = l_useAppPolicy_0(function(v83) --[[ Line: 369 ]]
            return v83.getWebViewSupport();
        end);
        local v85 = table.clone(v82);
        v82.isWebViewSupported = v84;
        return v4.createElement(v43, v85);
    end;
else
    return v43;
end;