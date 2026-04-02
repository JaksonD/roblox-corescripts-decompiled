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
local v14 = require(l_Modules_0.LuaApp.Thunks.Economy.FetchExperienceStoreProducts);
local v15 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v16 = require(l_Modules_0.LuaApp.Actions.Subscription.SetSubscriptionStatuses);
local v17 = require(l_Modules_0.LuaApp.Components.Subscription.MoreMenu);
local v18 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v19 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v20 = require(l_Modules_0.LuaApp.Http.Requests.EconomyAPI.PostReportSubscription);
local v21 = require(l_Modules_0.LuaApp.Thunks.Subscription.NavigateDownToSubscriptionPurchase);
local v22 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v23 = require(l_CorePackages_0.Workspace.Packages.EdpStoreAnalytics);
local l_Constants_0 = v23.Constants;
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging);
local v26 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableDevSubsInRobux);
local v27 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt);
local v28 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local l_ProductPurchaseSurface_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite).Enums.ProductPurchaseSurface;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local l_FFlagIntegrateDiscountsWithEDP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagIntegrateDiscountsWithEDP;
local _ = require(l_Modules_0.LuaApp.Models.SubscriptionApi.SubscriptionProductInfoModel);
return function(v33) --[[ Line: 70 ]] --[[ Name: SubscriptionTile ]]
    -- upvalues: v2 (copy), l_useDesignTokens_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v26 (copy), l_useLocalUserId_0 (copy), v19 (copy), v22 (copy), v20 (copy), v15 (copy), v18 (copy), v28 (copy), v27 (copy), v16 (copy), l_FFlagIntegrateDiscountsWithEDP_0 (copy), v14 (copy), l_ProductPurchaseSurface_0 (copy), v25 (copy), v23 (copy), l_Constants_0 (copy), v21 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), l_StyledTextLabel_0 (copy), l_Text_0 (copy), l_getIconRichText_0 (copy), l_Enums_0 (copy), l_Button_0 (copy), v17 (copy)
    local v34, v35 = v2.useState(0);
    local v36, v37 = v2.useState(0);
    local v38 = l_useDesignTokens_0();
    local l_Semantic_0 = v38.Semantic;
    local l_Subheader_0 = l_Semantic_0.Typography.Subheader;
    local l_CaptionBody_0 = l_Semantic_0.Typography.CaptionBody;
    local l_Color_0 = l_Semantic_0.Color;
    local l_Medium_0 = l_Semantic_0.Radius.Medium;
    local l_XLarge_0 = l_Semantic_0.Icon.Size.XLarge;
    local l_Global_0 = v38.Global;
    local l_Size_450_0 = l_Global_0.Size_450;
    local l_Space_300_0 = l_Global_0.Space_300;
    local l_Space_300_1 = l_Global_0.Space_300;
    local l_Space_150_0 = l_Global_0.Space_150;
    local l_Space_150_1 = l_Global_0.Space_150;
    local l_LineHeight_0 = l_Subheader_0.LineHeight;
    local l_LineHeight_1 = l_CaptionBody_0.LineHeight;
    local l_FontSize_0 = l_Subheader_0.FontSize;
    local l_FontSize_1 = l_CaptionBody_0.FontSize;
    local v55 = l_LineHeight_0 * l_FontSize_0;
    local v56 = v55 * 2;
    local v57 = l_LineHeight_1 * l_FontSize_1;
    local l_subscriptionProduct_0 = v33.subscriptionProduct;
    local l_thumbnailString_0 = v33.thumbnailString;
    local l_isSubscribed_0 = v33.isSubscribed;
    local v61 = l_useDispatch_0();
    local v62 = l_useLocalization_0({
        subscribed = "Feature.Subscription.Text.Subscribed", 
        pricePerMonth = {
            "Feature.Subscription.Email.PricePerMonthLabel"; 
            purchasePrice = l_subscriptionProduct_0.displayPrice
        }, 
        pricePerMonthRobux = if v26() and l_subscriptionProduct_0.priceInRobux ~= nil then {
            "Feature.Subscription.Email.PricePerMonthLabel"; 
            purchasePrice = tostring(l_subscriptionProduct_0.priceInRobux)
        } else nil, 
        seeMore = "Feature.Subscription.Action.SeeMore", 
        reportSubscription = "Feature.Subscription.Action.ReportSubscription", 
        reportSubscriptionSubmitted = "Feature.Subscription.Message.ReportSubmitted", 
        somethingIsWrong = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        subscribe = "Feature.Subscription.Action.Subscribe"
    });
    local v63 = if l_isSubscribed_0 then v62.subscribed else v62.pricePerMonth;
    local v64 = if l_isSubscribed_0 then v62.subscribed else v62.subscribe;
    local v65 = v26() and l_subscriptionProduct_0.priceInRobux ~= nil and l_subscriptionProduct_0.priceInRobux > 0;
    local v66, v67 = v2.useState(false);
    local v68 = l_useLocalUserId_0();
    local v69 = v19(v22);
    local v72 = {
        {
            text = v62.reportSubscription, 
            onActivated = function() --[[ Line: 139 ]] --[[ Name: onActivated ]]
                -- upvalues: v20 (ref), v69 (copy), l_subscriptionProduct_0 (copy), v68 (copy), v61 (copy), v15 (ref), v62 (copy), v18 (ref), v67 (copy)
                v20(v69, l_subscriptionProduct_0.subscriptionTargetKey, v68):andThen(function(_) --[[ Line: 141 ]]
                    -- upvalues: v61 (ref), v15 (ref), v62 (ref), v18 (ref)
                    v61(v15({
                        toastMessage = v62.reportSubscriptionSubmitted, 
                        isLocalized = true, 
                        toastType = v18.SuccessConfirmation
                    }));
                end, function(_) --[[ Line: 148 ]]
                    -- upvalues: v61 (ref), v15 (ref), v62 (ref), v18 (ref)
                    v61(v15({
                        toastMessage = v62.somethingIsWrong, 
                        isLocalized = true, 
                        toastType = v18.NetworkingError
                    }));
                end);
                v67(false);
            end, 
            fontStyle = {
                Font = l_CaptionBody_0.Font, 
                RelativeSize = 0.625, 
                RelativeMinSize = 0.625
            }, 
            textOnlyPadding = l_Space_150_0
        }
    };
    local v74 = v2.useCallback(function() --[[ Line: 163 ]]
        -- upvalues: v61 (copy), v28 (ref), v27 (ref), l_subscriptionProduct_0 (copy), v65 (copy), v16 (ref), l_FFlagIntegrateDiscountsWithEDP_0 (ref), v14 (ref), v69 (copy), l_ProductPurchaseSurface_0 (ref)
        local function v73() --[[ Line: 164 ]] --[[ Name: onFlowComplete ]]
            -- upvalues: v61 (ref), v28 (ref)
            v61(v28());
        end;
        v61(v27({
            productPayload = {
                kind = "DeveloperSubscription", 
                subscriptionId = l_subscriptionProduct_0.subscriptionTargetKey, 
                name = l_subscriptionProduct_0.name, 
                expectedPrice = l_subscriptionProduct_0.priceInRobux or 0, 
                iconImageAssetId = l_subscriptionProduct_0.iconImageAssetId, 
                isSubscriptionInRobux = v65, 
                displayPrice = if not v65 then l_subscriptionProduct_0.displayPrice else nil
            }, 
            purchaseCallbacks = {
                onFlowComplete = v73, 
                onPurchaseSuccess = function() --[[ Line: 180 ]] --[[ Name: onPurchaseSuccess ]]
                    -- upvalues: v61 (ref), v16 (ref), l_subscriptionProduct_0 (ref)
                    v61(v16({
                        [l_subscriptionProduct_0.subscriptionTargetKey] = {
                            isSubscribed = true, 
                            isRenewing = true
                        }
                    }));
                end, 
                onRobloxSubscriptionUpsellSuccess = l_FFlagIntegrateDiscountsWithEDP_0 and function() --[[ Line: 189 ]]
                    -- upvalues: v61 (ref), v14 (ref), v69 (ref), l_subscriptionProduct_0 (ref)
                    v61(v14(v69, l_subscriptionProduct_0.subscriptionProviderId));
                end or nil
            }, 
            purchaseAnalyticsMetadata = {
                surface = l_ProductPurchaseSurface_0.EDP, 
                productUniverseId = l_subscriptionProduct_0.subscriptionProviderId
            }
        }));
    end, {
        l_subscriptionProduct_0, 
        v65
    });
    local v75 = v2.useCallback(function() --[[ Line: 201 ]]
        -- upvalues: v25 (ref), v23 (ref), l_Constants_0 (ref), l_subscriptionProduct_0 (copy), v61 (copy), v21 (ref), l_thumbnailString_0 (copy), l_isSubscribed_0 (copy), v33 (copy)
        if v25() then
            v23.EdpStoreAnalyticsLogger.logEvent(l_Constants_0.StoreEnums.ActionType.PurchaseAttemptClick, l_Constants_0.StoreEnums.ProductType.Subscriptions, l_Constants_0.StoreEnums.LocationType.Store, tonumber(l_subscriptionProduct_0.subscriptionProviderId), nil, (tostring(l_subscriptionProduct_0.subscriptionTargetKey)));
        end;
        v61(v21(l_subscriptionProduct_0, l_thumbnailString_0, l_isSubscribed_0, v33.creatorName, v33.creatorVerified));
    end, {
        l_subscriptionProduct_0, 
        l_thumbnailString_0, 
        l_isSubscribed_0
    });
    local v76 = v2.useCallback(function() --[[ Line: 223 ]]
        -- upvalues: l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), v74 (copy), v75 (copy)
        if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then
            v74();
            return;
        else
            v75();
            return;
        end;
    end, {
        v75, 
        v74
    });
    if v26() then
        local v77 = if v65 then v62.pricePerMonthRobux else v62.pricePerMonth;
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
                    [v2.Event.Activated] = v75
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
                        [v2.Change.AbsoluteSize] = function(v78) --[[ Line: 289 ]]
                            -- upvalues: v35 (copy)
                            v35(v78.AbsoluteSize.X);
                        end
                    }, {
                        UIListLayout = v2.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical, 
                            Padding = UDim.new(0, 6)
                        }), 
                        SubscriptionTitle = v2.createElement(l_StyledTextLabel_0, {
                            maxSize = Vector2.new(v34, v55), 
                            fontStyle = l_Subheader_0, 
                            colorStyle = l_Color_0.Text.Emphasis, 
                            fluidSizing = false, 
                            richText = false, 
                            textWrapped = false, 
                            lineHeight = l_Subheader_0.LineHeight, 
                            textTruncate = Enum.TextTruncate.AtEnd, 
                            text = l_subscriptionProduct_0.name, 
                            layoutOrder = 0, 
                            onAbsoluteSizeChange = function(v79) --[[ Line: 309 ]] --[[ Name: onAbsoluteSizeChange ]]
                                -- upvalues: v37 (copy), v55 (copy)
                                v37(v79.AbsoluteSize.Y / v55);
                            end
                        }), 
                        Description = v2.createElement(l_StyledTextLabel_0, {
                            maxSize = Vector2.new(v34, v57), 
                            fontStyle = l_CaptionBody_0, 
                            colorStyle = l_Color_0.Text.Muted, 
                            fluidSizing = false, 
                            richText = false, 
                            textWrapped = true, 
                            textTruncate = Enum.TextTruncate.AtEnd, 
                            lineHeight = l_CaptionBody_0.LineHeight, 
                            text = l_subscriptionProduct_0.description, 
                            layoutOrder = 1
                        }), 
                        PriceText = v2.createElement(l_Text_0, {
                            Text = if v65 then l_getIconRichText_0(l_Enums_0.IconName.Robux) .. " " .. v77 else v77, 
                            RichText = v65, 
                            tag = "auto-xy content-emphasis text-body-medium", 
                            LayoutOrder = 2
                        })
                    })
                }), 
                SubscribeButton = v2.createElement(l_Button_0, {
                    size = UDim2.new(1, 0, 0, 32), 
                    text = v64, 
                    isDisabled = l_isSubscribed_0, 
                    onActivated = v76, 
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
                        [v2.Change.AbsoluteSize] = function(v80) --[[ Line: 393 ]]
                            -- upvalues: v35 (copy)
                            v35(v80.AbsoluteSize.X);
                        end
                    }, {
                        UIListLayout = v2.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical, 
                            Padding = UDim.new(0, l_Space_150_0)
                        }), 
                        SubscriptionTitle = v2.createElement(l_StyledTextLabel_0, {
                            maxSize = Vector2.new(v34, v56), 
                            fontStyle = l_Subheader_0, 
                            colorStyle = l_Color_0.Text.Emphasis, 
                            fluidSizing = false, 
                            richText = false, 
                            textWrapped = true, 
                            lineHeight = l_Subheader_0.LineHeight, 
                            textTruncate = Enum.TextTruncate.AtEnd, 
                            text = l_subscriptionProduct_0.name, 
                            layoutOrder = 0, 
                            onAbsoluteSizeChange = function(v81) --[[ Line: 414 ]] --[[ Name: onAbsoluteSizeChange ]]
                                -- upvalues: v37 (copy), v55 (copy)
                                v37(v81.AbsoluteSize.Y / v55);
                            end
                        }), 
                        Description = v2.createElement(l_StyledTextLabel_0, {
                            maxSize = Vector2.new(v34, v57 * (5 - v36)), 
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
                            Text = v62.seeMore, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            BackgroundTransparency = 1, 
                            TextColor3 = l_Color_0.Text.Emphasis.Color, 
                            TextSize = l_CaptionBody_0.FontSize, 
                            Font = l_CaptionBody_0.Font, 
                            LayoutOrder = 2, 
                            [v2.Event.Activated] = v75
                        })
                    })
                }), 
                PurchaseButton = v2.createElement(l_Button_0, {
                    size = UDim2.new(1, 0, 0, l_Size_450_0), 
                    text = v63, 
                    isDisabled = l_isSubscribed_0, 
                    onActivated = v76, 
                    layoutOrder = 1
                })
            }), 
            MoreMenuButton = v2.createElement(v17, {
                screenSize = v33.screenSize, 
                buttonProps = v72, 
                showMenu = v66, 
                onDismiss = function() --[[ Line: 461 ]] --[[ Name: onDismiss ]]
                    -- upvalues: v67 (copy)
                    v67(false);
                end, 
                onActivated = function() --[[ Line: 464 ]] --[[ Name: onActivated ]]
                    -- upvalues: v67 (copy), v66 (copy)
                    v67(not v66);
                end
            })
        });
    end;
end;