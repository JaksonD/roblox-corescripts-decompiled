local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useLocalUserId;
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_Button_0 = v7.App.Button.Button;
local l_StyledTextLabel_0 = v7.App.Text.StyledTextLabel;
local v10 = require(l_CorePackages_0.Packages.Foundation);
local l_Text_0 = v10.Text;
local l_getIconRichText_0 = v10.Utility.getIconRichText;
local l_Enums_0 = v10.Enums;
local v14 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v15 = require(l_Modules_0.LuaApp.Actions.Subscription.SetSubscriptionStatuses);
local v16 = require(l_Modules_0.LuaApp.Components.Subscription.MoreMenu);
local v17 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v18 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v19 = require(l_Modules_0.LuaApp.Http.Requests.EconomyAPI.PostReportSubscription);
local v20 = require(l_Modules_0.LuaApp.Thunks.Subscription.NavigateDownToSubscriptionPurchase);
local v21 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v22 = require(l_CorePackages_0.Workspace.Packages.EdpStoreAnalytics);
local l_Constants_0 = v22.Constants;
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging);
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableDevSubsInRobux);
local v26 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt);
local v27 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local l_ProductPurchaseSurface_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite).Enums.ProductPurchaseSurface;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local _ = require(l_Modules_0.LuaApp.Models.SubscriptionApi.SubscriptionProductInfoModel);
return function(v31) --[[ Line: 67 ]] --[[ Name: SubscriptionTile ]]
    -- upvalues: v2 (copy), l_useDesignTokens_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v25 (copy), l_useLocalUserId_0 (copy), v18 (copy), v21 (copy), v19 (copy), v14 (copy), v17 (copy), v27 (copy), v26 (copy), v15 (copy), l_ProductPurchaseSurface_0 (copy), v24 (copy), v22 (copy), l_Constants_0 (copy), v20 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), l_StyledTextLabel_0 (copy), l_Text_0 (copy), l_getIconRichText_0 (copy), l_Enums_0 (copy), l_Button_0 (copy), v16 (copy)
    local v32, v33 = v2.useState(0);
    local v34, v35 = v2.useState(0);
    local v36 = l_useDesignTokens_0();
    local l_Semantic_0 = v36.Semantic;
    local l_Subheader_0 = l_Semantic_0.Typography.Subheader;
    local l_CaptionBody_0 = l_Semantic_0.Typography.CaptionBody;
    local l_Color_0 = l_Semantic_0.Color;
    local l_Medium_0 = l_Semantic_0.Radius.Medium;
    local l_XLarge_0 = l_Semantic_0.Icon.Size.XLarge;
    local l_Global_0 = v36.Global;
    local l_Size_450_0 = l_Global_0.Size_450;
    local l_Space_300_0 = l_Global_0.Space_300;
    local l_Space_300_1 = l_Global_0.Space_300;
    local l_Space_150_0 = l_Global_0.Space_150;
    local l_Space_150_1 = l_Global_0.Space_150;
    local l_LineHeight_0 = l_Subheader_0.LineHeight;
    local l_LineHeight_1 = l_CaptionBody_0.LineHeight;
    local l_FontSize_0 = l_Subheader_0.FontSize;
    local l_FontSize_1 = l_CaptionBody_0.FontSize;
    local v53 = l_LineHeight_0 * l_FontSize_0;
    local v54 = v53 * 2;
    local v55 = l_LineHeight_1 * l_FontSize_1;
    local l_subscriptionProduct_0 = v31.subscriptionProduct;
    local l_thumbnailString_0 = v31.thumbnailString;
    local l_isSubscribed_0 = v31.isSubscribed;
    local v59 = l_useDispatch_0();
    local v60 = l_useLocalization_0({
        subscribed = "Feature.Subscription.Text.Subscribed", 
        pricePerMonth = {
            "Feature.Subscription.Email.PricePerMonthLabel"; 
            purchasePrice = l_subscriptionProduct_0.displayPrice
        }, 
        pricePerMonthRobux = if v25() and l_subscriptionProduct_0.priceInRobux ~= nil then {
            "Feature.Subscription.Email.PricePerMonthLabel"; 
            purchasePrice = tostring(l_subscriptionProduct_0.priceInRobux)
        } else nil, 
        seeMore = "Feature.Subscription.Action.SeeMore", 
        reportSubscription = "Feature.Subscription.Action.ReportSubscription", 
        reportSubscriptionSubmitted = "Feature.Subscription.Message.ReportSubmitted", 
        somethingIsWrong = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        subscribe = "Feature.Subscription.Action.Subscribe"
    });
    local v61 = if l_isSubscribed_0 then v60.subscribed else v60.pricePerMonth;
    local v62 = if l_isSubscribed_0 then v60.subscribed else v60.subscribe;
    local v63 = v25() and l_subscriptionProduct_0.priceInRobux ~= nil and l_subscriptionProduct_0.priceInRobux > 0;
    local v64, v65 = v2.useState(false);
    local v66 = l_useLocalUserId_0();
    local v67 = v18(v21);
    local v70 = {
        {
            text = v60.reportSubscription, 
            onActivated = function() --[[ Line: 136 ]] --[[ Name: onActivated ]]
                -- upvalues: v19 (ref), v67 (copy), l_subscriptionProduct_0 (copy), v66 (copy), v59 (copy), v14 (ref), v60 (copy), v17 (ref), v65 (copy)
                v19(v67, l_subscriptionProduct_0.subscriptionTargetKey, v66):andThen(function(_) --[[ Line: 138 ]]
                    -- upvalues: v59 (ref), v14 (ref), v60 (ref), v17 (ref)
                    v59(v14({
                        toastMessage = v60.reportSubscriptionSubmitted, 
                        isLocalized = true, 
                        toastType = v17.SuccessConfirmation
                    }));
                end, function(_) --[[ Line: 145 ]]
                    -- upvalues: v59 (ref), v14 (ref), v60 (ref), v17 (ref)
                    v59(v14({
                        toastMessage = v60.somethingIsWrong, 
                        isLocalized = true, 
                        toastType = v17.NetworkingError
                    }));
                end);
                v65(false);
            end, 
            fontStyle = {
                Font = l_CaptionBody_0.Font, 
                RelativeSize = 0.625, 
                RelativeMinSize = 0.625
            }, 
            textOnlyPadding = l_Space_150_0
        }
    };
    local v72 = v2.useCallback(function() --[[ Line: 160 ]]
        -- upvalues: v59 (copy), v27 (ref), v26 (ref), l_subscriptionProduct_0 (copy), v63 (copy), v15 (ref), l_ProductPurchaseSurface_0 (ref)
        local function v71() --[[ Line: 161 ]] --[[ Name: onFlowComplete ]]
            -- upvalues: v59 (ref), v27 (ref)
            v59(v27());
        end;
        v59(v26({
            productPayload = {
                kind = "DeveloperSubscription", 
                subscriptionId = l_subscriptionProduct_0.subscriptionTargetKey, 
                name = l_subscriptionProduct_0.name, 
                expectedPrice = l_subscriptionProduct_0.priceInRobux or 0, 
                iconImageAssetId = l_subscriptionProduct_0.iconImageAssetId, 
                isSubscriptionInRobux = v63, 
                displayPrice = if not v63 then l_subscriptionProduct_0.displayPrice else nil
            }, 
            purchaseCallbacks = {
                onFlowComplete = v71, 
                onPurchaseSuccess = function() --[[ Line: 177 ]] --[[ Name: onPurchaseSuccess ]]
                    -- upvalues: v59 (ref), v15 (ref), l_subscriptionProduct_0 (ref)
                    v59(v15({
                        [l_subscriptionProduct_0.subscriptionTargetKey] = {
                            isSubscribed = true, 
                            isRenewing = true
                        }
                    }));
                end
            }, 
            purchaseAnalyticsMetadata = {
                surface = l_ProductPurchaseSurface_0.EDP, 
                productUniverseId = l_subscriptionProduct_0.subscriptionProviderId
            }
        }));
    end, {
        l_subscriptionProduct_0, 
        v63
    });
    local v73 = v2.useCallback(function() --[[ Line: 193 ]]
        -- upvalues: v24 (ref), v22 (ref), l_Constants_0 (ref), l_subscriptionProduct_0 (copy), v59 (copy), v20 (ref), l_thumbnailString_0 (copy), l_isSubscribed_0 (copy), v31 (copy)
        if v24() then
            v22.EdpStoreAnalyticsLogger.logEvent(l_Constants_0.StoreEnums.ActionType.PurchaseAttemptClick, l_Constants_0.StoreEnums.ProductType.Subscriptions, l_Constants_0.StoreEnums.LocationType.Store, tonumber(l_subscriptionProduct_0.subscriptionProviderId), nil, (tostring(l_subscriptionProduct_0.subscriptionTargetKey)));
        end;
        v59(v20(l_subscriptionProduct_0, l_thumbnailString_0, l_isSubscribed_0, v31.creatorName, v31.creatorVerified));
    end, {
        l_subscriptionProduct_0, 
        l_thumbnailString_0, 
        l_isSubscribed_0
    });
    local v74 = v2.useCallback(function() --[[ Line: 215 ]]
        -- upvalues: l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), v72 (copy), v73 (copy)
        if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then
            v72();
            return;
        else
            v73();
            return;
        end;
    end, {
        v73, 
        v72
    });
    if v25() then
        local v75 = if v63 then v60.pricePerMonthRobux else v60.pricePerMonth;
        return v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = l_Color_0.BackgroundUi.Default.Color3, 
            BackgroundTransparency = l_Color_0.BackgroundUi.Default.Transparency
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 0), 
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12)
            }), 
            UICorners = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            TileContent = v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 12)
                }), 
                TopSection = v2.createElement("TextButton", {
                    Size = UDim2.new(1, 0, 0, 72), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Text = "", 
                    AutoButtonColor = false, 
                    LayoutOrder = 0, 
                    [v2.Event.Activated] = v73
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        Padding = UDim.new(0, 12), 
                        VerticalAlignment = Enum.VerticalAlignment.Top
                    }), 
                    Thumbnail = v2.createElement("ImageLabel", {
                        Size = UDim2.fromOffset(72, 72), 
                        BackgroundTransparency = 1, 
                        Image = l_thumbnailString_0, 
                        LayoutOrder = 0
                    }, {
                        UICorners = v2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        })
                    }), 
                    TextContent = v2.createElement("Frame", {
                        Size = UDim2.new(1, -84, 1, 0), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        [v2.Change.AbsoluteSize] = function(v76) --[[ Line: 281 ]]
                            -- upvalues: v33 (copy)
                            v33(v76.AbsoluteSize.X);
                        end
                    }, {
                        UIListLayout = v2.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical, 
                            Padding = UDim.new(0, 6)
                        }), 
                        SubscriptionTitle = v2.createElement(l_StyledTextLabel_0, {
                            maxSize = Vector2.new(v32, v53), 
                            fontStyle = l_Subheader_0, 
                            colorStyle = l_Color_0.Text.Emphasis, 
                            fluidSizing = false, 
                            richText = false, 
                            textWrapped = false, 
                            lineHeight = l_Subheader_0.LineHeight, 
                            textTruncate = Enum.TextTruncate.AtEnd, 
                            text = l_subscriptionProduct_0.name, 
                            layoutOrder = 0, 
                            onAbsoluteSizeChange = function(v77) --[[ Line: 301 ]] --[[ Name: onAbsoluteSizeChange ]]
                                -- upvalues: v35 (copy), v53 (copy)
                                v35(v77.AbsoluteSize.Y / v53);
                            end
                        }), 
                        Description = v2.createElement(l_StyledTextLabel_0, {
                            maxSize = Vector2.new(v32, v55), 
                            fontStyle = l_CaptionBody_0, 
                            colorStyle = l_Color_0.Text.Muted, 
                            fluidSizing = false, 
                            richText = false, 
                            textWrapped = false, 
                            textTruncate = Enum.TextTruncate.AtEnd, 
                            lineHeight = l_CaptionBody_0.LineHeight, 
                            text = l_subscriptionProduct_0.description, 
                            layoutOrder = 1
                        }), 
                        PriceText = v2.createElement(l_Text_0, {
                            Text = if v63 then l_getIconRichText_0(l_Enums_0.IconName.Robux) .. " " .. v75 else v75, 
                            RichText = v63, 
                            tag = "auto-xy content-emphasis text-body-medium", 
                            LayoutOrder = 2
                        })
                    })
                }), 
                SubscribeButton = v2.createElement(l_Button_0, {
                    size = UDim2.new(1, 0, 0, 32), 
                    text = v62, 
                    isDisabled = l_isSubscribed_0, 
                    onActivated = v74, 
                    layoutOrder = 1
                })
            })
        });
    else
        return v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = l_Color_0.BackgroundUi.Default.Color3, 
            BackgroundTransparency = l_Color_0.BackgroundUi.Default.Transparency
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_Space_300_1), 
                PaddingBottom = UDim.new(0, l_Space_300_1), 
                PaddingLeft = UDim.new(0, l_Space_300_1), 
                PaddingRight = UDim.new(0, l_Space_300_1)
            }), 
            UICorners = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, l_Medium_0)
            }), 
            TileContent = v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, l_Space_150_1)
                }), 
                SubscriptionInfoFrame = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 128), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 0
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        Padding = UDim.new(0, l_Space_300_0)
                    }), 
                    Thumbnail = v2.createElement("ImageLabel", {
                        Size = UDim2.fromOffset(l_XLarge_0, l_XLarge_0), 
                        BackgroundTransparency = 1, 
                        Image = l_thumbnailString_0
                    }, {
                        UICorners = v2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, l_Medium_0)
                        })
                    }), 
                    TextContent = v2.createElement("Frame", {
                        Size = UDim2.new(1, -l_XLarge_0 - l_Space_300_0, 0, 0), 
                        BackgroundTransparency = 1, 
                        [v2.Change.AbsoluteSize] = function(v78) --[[ Line: 385 ]]
                            -- upvalues: v33 (copy)
                            v33(v78.AbsoluteSize.X);
                        end
                    }, {
                        UIListLayout = v2.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical, 
                            Padding = UDim.new(0, l_Space_150_0)
                        }), 
                        SubscriptionTitle = v2.createElement(l_StyledTextLabel_0, {
                            maxSize = Vector2.new(v32, v54), 
                            fontStyle = l_Subheader_0, 
                            colorStyle = l_Color_0.Text.Emphasis, 
                            fluidSizing = false, 
                            richText = false, 
                            textWrapped = true, 
                            lineHeight = l_Subheader_0.LineHeight, 
                            textTruncate = Enum.TextTruncate.AtEnd, 
                            text = l_subscriptionProduct_0.name, 
                            layoutOrder = 0, 
                            onAbsoluteSizeChange = function(v79) --[[ Line: 406 ]] --[[ Name: onAbsoluteSizeChange ]]
                                -- upvalues: v35 (copy), v53 (copy)
                                v35(v79.AbsoluteSize.Y / v53);
                            end
                        }), 
                        Description = v2.createElement(l_StyledTextLabel_0, {
                            maxSize = Vector2.new(v32, v55 * (5 - v34)), 
                            fontStyle = l_CaptionBody_0, 
                            colorStyle = l_Color_0.Text.Emphasis, 
                            fluidSizing = false, 
                            richText = false, 
                            textWrapped = true, 
                            textTruncate = Enum.TextTruncate.AtEnd, 
                            lineHeight = l_CaptionBody_0.LineHeight, 
                            text = l_subscriptionProduct_0.description, 
                            layoutOrder = 1
                        }), 
                        SeeMore = v2.createElement("TextButton", {
                            Size = UDim2.new(1, 0, 0, 0), 
                            Text = v60.seeMore, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            BackgroundTransparency = 1, 
                            TextColor3 = l_Color_0.Text.Emphasis.Color, 
                            TextSize = l_CaptionBody_0.FontSize, 
                            Font = l_CaptionBody_0.Font, 
                            LayoutOrder = 2, 
                            [v2.Event.Activated] = v73
                        })
                    })
                }), 
                PurchaseButton = v2.createElement(l_Button_0, {
                    size = UDim2.new(1, 0, 0, l_Size_450_0), 
                    text = v61, 
                    isDisabled = l_isSubscribed_0, 
                    onActivated = v74, 
                    layoutOrder = 1
                })
            }), 
            MoreMenuButton = v2.createElement(v16, {
                screenSize = v31.screenSize, 
                buttonProps = v70, 
                showMenu = v64, 
                onDismiss = function() --[[ Line: 453 ]] --[[ Name: onDismiss ]]
                    -- upvalues: v65 (copy)
                    v65(false);
                end, 
                onActivated = function() --[[ Line: 456 ]] --[[ Name: onActivated ]]
                    -- upvalues: v65 (copy), v64 (copy)
                    v65(not v64);
                end
            })
        });
    end;
end;