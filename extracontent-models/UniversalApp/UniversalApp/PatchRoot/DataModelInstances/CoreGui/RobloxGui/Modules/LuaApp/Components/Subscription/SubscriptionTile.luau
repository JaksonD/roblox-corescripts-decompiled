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
local v10 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v11 = require(l_Modules_0.LuaApp.Components.Subscription.MoreMenu);
local v12 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v13 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v14 = require(l_Modules_0.LuaApp.Http.Requests.EconomyAPI.PostReportSubscription);
local v15 = require(l_Modules_0.LuaApp.Thunks.Subscription.NavigateDownToSubscriptionPurchase);
local v16 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v17 = require(l_CorePackages_0.Workspace.Packages.EdpStoreAnalytics);
local l_Constants_0 = v17.Constants;
local v19 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging);
local v20 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableDevSubsInRobux);
local v21 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt);
local v22 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local l_ProductPurchaseSurface_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite).Enums.ProductPurchaseSurface;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local _ = require(l_Modules_0.LuaApp.Models.SubscriptionApi.SubscriptionProductInfoModel);
return function(v26) --[[ Line: 61 ]] --[[ Name: SubscriptionTile ]]
    -- upvalues: v2 (copy), l_useDesignTokens_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v20 (copy), l_useLocalUserId_0 (copy), v13 (copy), v16 (copy), v14 (copy), v10 (copy), v12 (copy), v22 (copy), v21 (copy), l_ProductPurchaseSurface_0 (copy), v19 (copy), v17 (copy), l_Constants_0 (copy), v15 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), l_StyledTextLabel_0 (copy), l_Button_0 (copy), v11 (copy)
    local v27, v28 = v2.useState(0);
    local v29, v30 = v2.useState(0);
    local v31 = l_useDesignTokens_0();
    local l_Semantic_0 = v31.Semantic;
    local l_Subheader_0 = l_Semantic_0.Typography.Subheader;
    local l_CaptionBody_0 = l_Semantic_0.Typography.CaptionBody;
    local l_Color_0 = l_Semantic_0.Color;
    local l_Medium_0 = l_Semantic_0.Radius.Medium;
    local l_XLarge_0 = l_Semantic_0.Icon.Size.XLarge;
    local l_Global_0 = v31.Global;
    local l_Size_450_0 = l_Global_0.Size_450;
    local l_Space_300_0 = l_Global_0.Space_300;
    local l_Space_300_1 = l_Global_0.Space_300;
    local l_Space_150_0 = l_Global_0.Space_150;
    local l_Space_150_1 = l_Global_0.Space_150;
    local l_LineHeight_0 = l_Subheader_0.LineHeight;
    local l_LineHeight_1 = l_CaptionBody_0.LineHeight;
    local l_FontSize_0 = l_Subheader_0.FontSize;
    local l_FontSize_1 = l_CaptionBody_0.FontSize;
    local v48 = l_LineHeight_0 * l_FontSize_0;
    local v49 = v48 * 2;
    local v50 = l_LineHeight_1 * l_FontSize_1;
    local l_subscriptionProduct_0 = v26.subscriptionProduct;
    local l_thumbnailString_0 = v26.thumbnailString;
    local l_isSubscribed_0 = v26.isSubscribed;
    local v54 = l_useDispatch_0();
    local v55 = l_useLocalization_0({
        subscribed = "Feature.Subscription.Text.Subscribed", 
        pricePerMonth = {
            "Feature.Subscription.Email.PricePerMonthLabel"; 
            purchasePrice = l_subscriptionProduct_0.displayPrice
        }, 
        pricePerMonthRobux = if v20() and l_subscriptionProduct_0.priceInRobux ~= nil then {
            "Feature.Subscription.Email.PricePerMonthLabel"; 
            purchasePrice = tostring(l_subscriptionProduct_0.priceInRobux)
        } else nil, 
        seeMore = "Feature.Subscription.Action.SeeMore", 
        reportSubscription = "Feature.Subscription.Action.ReportSubscription", 
        reportSubscriptionSubmitted = "Feature.Subscription.Message.ReportSubmitted", 
        somethingIsWrong = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        subscribe = "Feature.Subscription.Action.Subscribe"
    });
    local v56 = if l_isSubscribed_0 then v55.subscribed else v55.pricePerMonth;
    local v57 = if l_isSubscribed_0 then v55.subscribed else v55.subscribe;
    local v58 = v20() and l_subscriptionProduct_0.priceInRobux ~= nil and l_subscriptionProduct_0.priceInRobux > 0;
    local v59, v60 = v2.useState(false);
    local v61 = l_useLocalUserId_0();
    local v62 = v13(v16);
    local v65 = {
        {
            text = v55.reportSubscription, 
            onActivated = function() --[[ Line: 130 ]] --[[ Name: onActivated ]]
                -- upvalues: v14 (ref), v62 (copy), l_subscriptionProduct_0 (copy), v61 (copy), v54 (copy), v10 (ref), v55 (copy), v12 (ref), v60 (copy)
                v14(v62, l_subscriptionProduct_0.subscriptionTargetKey, v61):andThen(function(_) --[[ Line: 132 ]]
                    -- upvalues: v54 (ref), v10 (ref), v55 (ref), v12 (ref)
                    v54(v10({
                        toastMessage = v55.reportSubscriptionSubmitted, 
                        isLocalized = true, 
                        toastType = v12.SuccessConfirmation
                    }));
                end, function(_) --[[ Line: 139 ]]
                    -- upvalues: v54 (ref), v10 (ref), v55 (ref), v12 (ref)
                    v54(v10({
                        toastMessage = v55.somethingIsWrong, 
                        isLocalized = true, 
                        toastType = v12.NetworkingError
                    }));
                end);
                v60(false);
            end, 
            fontStyle = {
                Font = l_CaptionBody_0.Font, 
                RelativeSize = 0.625, 
                RelativeMinSize = 0.625
            }, 
            textOnlyPadding = l_Space_150_0
        }
    };
    local v67 = v2.useCallback(function() --[[ Line: 154 ]]
        -- upvalues: v54 (copy), v22 (ref), v21 (ref), l_subscriptionProduct_0 (copy), v58 (copy), l_ProductPurchaseSurface_0 (ref)
        local function v66() --[[ Line: 155 ]] --[[ Name: onFlowComplete ]]
            -- upvalues: v54 (ref), v22 (ref)
            v54(v22());
        end;
        v54(v21({
            productPayload = {
                kind = "DeveloperSubscription", 
                subscriptionId = l_subscriptionProduct_0.subscriptionTargetKey, 
                name = l_subscriptionProduct_0.name, 
                expectedPrice = l_subscriptionProduct_0.priceInRobux or 0, 
                iconImageAssetId = l_subscriptionProduct_0.iconImageAssetId, 
                isSubscriptionInRobux = v58, 
                displayPrice = if not v58 then l_subscriptionProduct_0.displayPrice else nil
            }, 
            purchaseCallbacks = {
                onFlowComplete = v66
            }, 
            purchaseAnalyticsMetadata = {
                surface = l_ProductPurchaseSurface_0.EDP, 
                productUniverseId = l_subscriptionProduct_0.subscriptionProviderId
            }
        }));
    end, {
        l_subscriptionProduct_0, 
        v58
    });
    local v68 = v2.useCallback(function() --[[ Line: 179 ]]
        -- upvalues: v19 (ref), v17 (ref), l_Constants_0 (ref), l_subscriptionProduct_0 (copy), v54 (copy), v15 (ref), l_thumbnailString_0 (copy), l_isSubscribed_0 (copy), v26 (copy)
        if v19() then
            v17.EdpStoreAnalyticsLogger.logEvent(l_Constants_0.StoreEnums.ActionType.PurchaseAttemptClick, l_Constants_0.StoreEnums.ProductType.Subscriptions, l_Constants_0.StoreEnums.LocationType.Store, tonumber(l_subscriptionProduct_0.subscriptionProviderId), nil, (tostring(l_subscriptionProduct_0.subscriptionTargetKey)));
        end;
        v54(v15(l_subscriptionProduct_0, l_thumbnailString_0, l_isSubscribed_0, v26.creatorName, v26.creatorVerified));
    end, {
        l_subscriptionProduct_0, 
        l_thumbnailString_0, 
        l_isSubscribed_0
    });
    local v69 = v2.useCallback(function() --[[ Line: 201 ]]
        -- upvalues: l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), v67 (copy), v68 (copy)
        if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then
            v67();
            return;
        else
            v68();
            return;
        end;
    end, {
        v68, 
        v67
    });
    if v20() then
        local v70 = if v58 then v55.pricePerMonthRobux else v55.pricePerMonth;
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
                    [v2.Event.Activated] = v68
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
                        [v2.Change.AbsoluteSize] = function(v71) --[[ Line: 267 ]]
                            -- upvalues: v28 (copy)
                            v28(v71.AbsoluteSize.X);
                        end
                    }, {
                        UIListLayout = v2.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical, 
                            Padding = UDim.new(0, 6)
                        }), 
                        SubscriptionTitle = v2.createElement(l_StyledTextLabel_0, {
                            maxSize = Vector2.new(v27, v49), 
                            fontStyle = l_Subheader_0, 
                            colorStyle = l_Color_0.Text.Emphasis, 
                            fluidSizing = false, 
                            richText = false, 
                            textWrapped = true, 
                            lineHeight = l_Subheader_0.LineHeight, 
                            textTruncate = Enum.TextTruncate.AtEnd, 
                            text = l_subscriptionProduct_0.name, 
                            layoutOrder = 0, 
                            onAbsoluteSizeChange = function(v72) --[[ Line: 287 ]] --[[ Name: onAbsoluteSizeChange ]]
                                -- upvalues: v30 (copy), v48 (copy)
                                v30(v72.AbsoluteSize.Y / v48);
                            end
                        }), 
                        Description = v2.createElement(l_StyledTextLabel_0, {
                            maxSize = Vector2.new(v27, v50), 
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
                        PriceText = v2.createElement(l_StyledTextLabel_0, {
                            maxSize = Vector2.new(v27, l_FontSize_1 * l_LineHeight_1), 
                            fontStyle = l_CaptionBody_0, 
                            colorStyle = l_Color_0.Text.Muted, 
                            fluidSizing = false, 
                            richText = false, 
                            textWrapped = false, 
                            text = v70, 
                            layoutOrder = 2
                        })
                    })
                }), 
                SubscribeButton = v2.createElement(l_Button_0, {
                    size = UDim2.new(1, 0, 0, 32), 
                    text = v57, 
                    isDisabled = l_isSubscribed_0, 
                    onActivated = v69, 
                    layoutOrder = 1
                })
            }), 
            MoreMenuButton = v2.createElement(v11, {
                screenSize = v26.screenSize, 
                buttonProps = v65, 
                showMenu = v59, 
                onDismiss = function() --[[ Line: 328 ]] --[[ Name: onDismiss ]]
                    -- upvalues: v60 (copy)
                    v60(false);
                end, 
                onActivated = function() --[[ Line: 331 ]] --[[ Name: onActivated ]]
                    -- upvalues: v60 (copy), v59 (copy)
                    v60(not v59);
                end
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
                        [v2.Change.AbsoluteSize] = function(v73) --[[ Line: 384 ]]
                            -- upvalues: v28 (copy)
                            v28(v73.AbsoluteSize.X);
                        end
                    }, {
                        UIListLayout = v2.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical, 
                            Padding = UDim.new(0, l_Space_150_0)
                        }), 
                        SubscriptionTitle = v2.createElement(l_StyledTextLabel_0, {
                            maxSize = Vector2.new(v27, v49), 
                            fontStyle = l_Subheader_0, 
                            colorStyle = l_Color_0.Text.Emphasis, 
                            fluidSizing = false, 
                            richText = false, 
                            textWrapped = true, 
                            lineHeight = l_Subheader_0.LineHeight, 
                            textTruncate = Enum.TextTruncate.AtEnd, 
                            text = l_subscriptionProduct_0.name, 
                            layoutOrder = 0, 
                            onAbsoluteSizeChange = function(v74) --[[ Line: 405 ]] --[[ Name: onAbsoluteSizeChange ]]
                                -- upvalues: v30 (copy), v48 (copy)
                                v30(v74.AbsoluteSize.Y / v48);
                            end
                        }), 
                        Description = v2.createElement(l_StyledTextLabel_0, {
                            maxSize = Vector2.new(v27, v50 * (5 - v29)), 
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
                            Text = v55.seeMore, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            BackgroundTransparency = 1, 
                            TextColor3 = l_Color_0.Text.Emphasis.Color, 
                            TextSize = l_CaptionBody_0.FontSize, 
                            Font = l_CaptionBody_0.Font, 
                            LayoutOrder = 2, 
                            [v2.Event.Activated] = v68
                        })
                    })
                }), 
                PurchaseButton = v2.createElement(l_Button_0, {
                    size = UDim2.new(1, 0, 0, l_Size_450_0), 
                    text = v56, 
                    isDisabled = l_isSubscribed_0, 
                    onActivated = v69, 
                    layoutOrder = 1
                })
            }), 
            MoreMenuButton = v2.createElement(v11, {
                screenSize = v26.screenSize, 
                buttonProps = v65, 
                showMenu = v59, 
                onDismiss = function() --[[ Line: 452 ]] --[[ Name: onDismiss ]]
                    -- upvalues: v60 (copy)
                    v60(false);
                end, 
                onActivated = function() --[[ Line: 455 ]] --[[ Name: onActivated ]]
                    -- upvalues: v60 (copy), v59 (copy)
                    v60(not v59);
                end
            })
        });
    end;
end;