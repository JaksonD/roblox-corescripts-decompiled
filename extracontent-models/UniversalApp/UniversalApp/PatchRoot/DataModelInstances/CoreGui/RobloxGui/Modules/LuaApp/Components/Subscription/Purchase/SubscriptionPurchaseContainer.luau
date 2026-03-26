local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v5 = require(l_Modules_0.LuaApp.AppPage);
local v6 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v7 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v8 = require(l_Modules_0.LuaApp.Actions.Subscription.SetSubscriptionStatuses);
local v9 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v10 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v11 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v12 = require(l_Modules_0.LuaApp.Thunks.Subscription.PerformSubscriptionPurchase);
local v13 = require(script.Parent.SubscriptionPurchaseOverlay);
local _ = require(l_Modules_0.LuaApp.Models.SubscriptionApi.SubscriptionProductInfoModel);
local v15 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableDevSubsInRobux);
local v16 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVpcSettingsForInAppSubscriptionPurchase);
local v17 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt);
local v18 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local l_ProductPurchaseSurface_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite).Enums.ProductPurchaseSurface;
local v20 = require(l_Modules_0.LuaApp.Promise);
return function(v21) --[[ Line: 44 ]] --[[ Name: SubscriptionPurchaseContainer ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), v9 (copy), v10 (copy), v11 (copy), v15 (copy), v2 (copy), v13 (copy), v17 (copy), v18 (copy), v8 (copy), l_ProductPurchaseSurface_0 (copy), v20 (copy), v16 (copy), v7 (copy), v5 (copy), v6 (copy), v12 (copy)
    local v22 = l_useDispatch_0();
    local v23 = l_useNavigation_0();
    local v24 = v9(v10);
    local _ = v9(v11);
    local v26 = v15() and v21.subscriptionPurchaseProductInfo.priceInRobux ~= nil and v21.subscriptionPurchaseProductInfo.priceInRobux > 0;
    if v15() then
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            SubscriptionPurchaseOverlay = v2.createElement(v13, {
                subscriptionPurchaseProductInfo = v21.subscriptionPurchaseProductInfo, 
                thumbnailString = v21.thumbnailString, 
                isSubscribed = v21.isSubscribed, 
                isRobuxSubscription = v26, 
                shouldUseNewModalDesign = v15(), 
                creatorName = v21.creatorName, 
                creatorVerified = v21.creatorVerified, 
                promptSubscriptionPurchase = function(_, _) --[[ Line: 67 ]] --[[ Name: promptSubscriptionPurchase ]]
                    -- upvalues: v22 (copy), v17 (ref), v21 (copy), v26 (copy), v18 (ref), v8 (ref), l_ProductPurchaseSurface_0 (ref), v20 (ref)
                    v22(v17({
                        productPayload = {
                            kind = "DeveloperSubscription", 
                            subscriptionId = v21.subscriptionPurchaseProductInfo.subscriptionTargetKey, 
                            name = v21.subscriptionPurchaseProductInfo.name, 
                            expectedPrice = v21.subscriptionPurchaseProductInfo.priceInRobux or 0, 
                            iconImageAssetId = v21.subscriptionPurchaseProductInfo.iconImageAssetId, 
                            isSubscriptionInRobux = v26, 
                            displayPrice = v21.subscriptionPurchaseProductInfo.displayPrice
                        }, 
                        purchaseCallbacks = {
                            onFlowComplete = function() --[[ Line: 79 ]] --[[ Name: onFlowComplete ]]
                                -- upvalues: v22 (ref), v18 (ref)
                                v22(v18());
                            end, 
                            onPurchaseSuccess = function() --[[ Line: 82 ]] --[[ Name: onPurchaseSuccess ]]
                                -- upvalues: v22 (ref), v8 (ref), v21 (ref)
                                v22(v8({
                                    [v21.subscriptionPurchaseProductInfo.subscriptionTargetKey] = {
                                        isSubscribed = true, 
                                        isRenewing = true
                                    }
                                }));
                            end
                        }, 
                        purchaseAnalyticsMetadata = {
                            surface = l_ProductPurchaseSurface_0.EDP, 
                            productUniverseId = v21.subscriptionPurchaseProductInfo.subscriptionProviderId
                        }
                    }));
                    return v20.new(function() --[[ Line: 96 ]]

                    end);
                end, 
                endPurchase = function() --[[ Line: 99 ]] --[[ Name: endPurchase ]]
                    -- upvalues: v23 (copy)
                    v23.goBack();
                end, 
                onPurchaseSuccess = function() --[[ Line: 103 ]] --[[ Name: onPurchaseSuccess ]]
                    -- upvalues: v22 (copy), v8 (ref), v21 (copy), v23 (copy)
                    v22(v8({
                        [v21.subscriptionPurchaseProductInfo.subscriptionTargetKey] = {
                            isSubscribed = true, 
                            isRenewing = true
                        }
                    }));
                    v23.goBack();
                end, 
                openSettingsPage = v16() and function() --[[ Line: 114 ]]
                    -- upvalues: v22 (copy), v7 (ref), v5 (ref), v6 (ref)
                    v22(v7({
                        name = v5.SettingsSubPage, 
                        detail = v6.static.settings.billing(), 
                        extraProps = {
                            titleKey = "Feature.AccountSettings.Heading.Tab.Spending"
                        }
                    }));
                end or nil, 
                onAnalyticEvent = function(v29, v30, v31) --[[ Line: 125 ]] --[[ Name: onAnalyticEvent ]]
                    -- upvalues: v24 (copy)
                    v24:sendEventDeferred(v29, v30, v31);
                end
            })
        });
    else
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            SubscriptionPurchaseOverlay = v2.createElement(v13, {
                subscriptionPurchaseProductInfo = v21.subscriptionPurchaseProductInfo, 
                thumbnailString = v21.thumbnailString, 
                isSubscribed = v21.isSubscribed, 
                shouldUseNewModalDesign = v15(), 
                creatorName = v21.creatorName, 
                creatorVerified = v21.creatorVerified, 
                promptSubscriptionPurchase = function(v32) --[[ Line: 144 ]] --[[ Name: promptSubscriptionPurchase ]]
                    -- upvalues: v12 (ref)
                    return v12(v32);
                end, 
                endPurchase = function() --[[ Line: 148 ]] --[[ Name: endPurchase ]]
                    -- upvalues: v23 (copy)
                    v23.goBack();
                end, 
                onPurchaseSuccess = function() --[[ Line: 152 ]] --[[ Name: onPurchaseSuccess ]]
                    -- upvalues: v22 (copy), v8 (ref), v21 (copy), v23 (copy)
                    v22(v8({
                        [v21.subscriptionPurchaseProductInfo.subscriptionTargetKey] = {
                            isSubscribed = true, 
                            isRenewing = true
                        }
                    }));
                    v23.goBack();
                end, 
                openSettingsPage = v16() and function() --[[ Line: 163 ]]
                    -- upvalues: v22 (copy), v7 (ref), v5 (ref), v6 (ref)
                    v22(v7({
                        name = v5.SettingsSubPage, 
                        detail = v6.static.settings.billing(), 
                        extraProps = {
                            titleKey = "Feature.AccountSettings.Heading.Tab.Spending"
                        }
                    }));
                end or nil, 
                onAnalyticEvent = function(v33, v34, v35) --[[ Line: 174 ]] --[[ Name: onAnalyticEvent ]]
                    -- upvalues: v24 (copy)
                    v24:sendEventDeferred(v33, v34, v35);
                end
            })
        });
    end;
end;