local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CoreGui_0.RobloxGui.Modules.LuaApp.Thunks.Subscription.PerformRobuxSubscriptionPurchase);
local v4 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v7 = require(l_Modules_0.LuaApp.AppPage);
local v8 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v10 = require(l_Modules_0.LuaApp.Actions.Subscription.SetSubscriptionStatuses);
local v11 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v12 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v13 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v14 = require(l_Modules_0.LuaApp.Thunks.Subscription.PerformSubscriptionPurchase);
local v15 = require(script.Parent.SubscriptionPurchaseOverlay);
local _ = require(l_Modules_0.LuaApp.Models.SubscriptionApi.SubscriptionProductInfoModel);
local v17 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableDevSubsInRobux);
local v18 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVpcSettingsForInAppSubscriptionPurchase);
return function(v19) --[[ Line: 40 ]] --[[ Name: SubscriptionPurchaseContainer ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), v11 (copy), v12 (copy), v13 (copy), v17 (copy), v4 (copy), v15 (copy), v3 (copy), v10 (copy), v18 (copy), v9 (copy), v7 (copy), v8 (copy), v14 (copy)
    local v20 = l_useDispatch_0();
    local v21 = l_useNavigation_0();
    local v22 = v11(v12);
    local v23 = v11(v13);
    if v17() and v19.subscriptionPurchaseProductInfo.priceInRobux ~= nil and v19.subscriptionPurchaseProductInfo.priceInRobux > 0 then
        return v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            SubscriptionPurchaseOverlay = v4.createElement(v15, {
                subscriptionPurchaseProductInfo = v19.subscriptionPurchaseProductInfo, 
                thumbnailString = v19.thumbnailString, 
                isSubscribed = v19.isSubscribed, 
                isRobuxSubscription = true, 
                shouldUseNewModalDesign = v17(), 
                creatorName = v19.creatorName, 
                creatorVerified = v19.creatorVerified, 
                promptSubscriptionPurchase = function(v24, v25) --[[ Line: 63 ]] --[[ Name: promptSubscriptionPurchase ]]
                    -- upvalues: v3 (ref), v23 (copy)
                    return v3(v23, v24, v25);
                end, 
                endPurchase = function() --[[ Line: 67 ]] --[[ Name: endPurchase ]]
                    -- upvalues: v21 (copy)
                    v21.goBack();
                end, 
                onPurchaseSuccess = function() --[[ Line: 71 ]] --[[ Name: onPurchaseSuccess ]]
                    -- upvalues: v20 (copy), v10 (ref), v19 (copy), v21 (copy)
                    v20(v10({
                        [v19.subscriptionPurchaseProductInfo.subscriptionTargetKey] = {
                            isSubscribed = true, 
                            isRenewing = true
                        }
                    }));
                    v21.goBack();
                end, 
                openSettingsPage = v18() and function() --[[ Line: 82 ]]
                    -- upvalues: v20 (copy), v9 (ref), v7 (ref), v8 (ref)
                    v20(v9({
                        name = v7.SettingsSubPage, 
                        detail = v8.static.settings.billing(), 
                        extraProps = {
                            titleKey = "Feature.AccountSettings.Heading.Tab.Spending"
                        }
                    }));
                end or nil, 
                onAnalyticEvent = function(v26, v27, v28) --[[ Line: 93 ]] --[[ Name: onAnalyticEvent ]]
                    -- upvalues: v22 (copy)
                    v22:sendEventDeferred(v26, v27, v28);
                end
            })
        });
    else
        return v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            SubscriptionPurchaseOverlay = v4.createElement(v15, {
                subscriptionPurchaseProductInfo = v19.subscriptionPurchaseProductInfo, 
                thumbnailString = v19.thumbnailString, 
                isSubscribed = v19.isSubscribed, 
                shouldUseNewModalDesign = v17(), 
                creatorName = v19.creatorName, 
                creatorVerified = v19.creatorVerified, 
                promptSubscriptionPurchase = function(v29) --[[ Line: 112 ]] --[[ Name: promptSubscriptionPurchase ]]
                    -- upvalues: v14 (ref)
                    return v14(v29);
                end, 
                endPurchase = function() --[[ Line: 116 ]] --[[ Name: endPurchase ]]
                    -- upvalues: v21 (copy)
                    v21.goBack();
                end, 
                onPurchaseSuccess = function() --[[ Line: 120 ]] --[[ Name: onPurchaseSuccess ]]
                    -- upvalues: v20 (copy), v10 (ref), v19 (copy), v21 (copy)
                    v20(v10({
                        [v19.subscriptionPurchaseProductInfo.subscriptionTargetKey] = {
                            isSubscribed = true, 
                            isRenewing = true
                        }
                    }));
                    v21.goBack();
                end, 
                openSettingsPage = v18() and function() --[[ Line: 131 ]]
                    -- upvalues: v20 (copy), v9 (ref), v7 (ref), v8 (ref)
                    v20(v9({
                        name = v7.SettingsSubPage, 
                        detail = v8.static.settings.billing(), 
                        extraProps = {
                            titleKey = "Feature.AccountSettings.Heading.Tab.Spending"
                        }
                    }));
                end or nil, 
                onAnalyticEvent = function(v30, v31, v32) --[[ Line: 142 ]] --[[ Name: onAnalyticEvent ]]
                    -- upvalues: v22 (copy)
                    v22:sendEventDeferred(v30, v31, v32);
                end
            })
        });
    end;
end;