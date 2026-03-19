local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.AppPage);
local v3 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local _ = require(l_Modules_0.LuaApp.Models.SubscriptionApi.SubscriptionProductInfoModel);
local v5 = require(l_CorePackages_0.Workspace.Packages.EdpStoreAnalytics);
local l_Constants_0 = v5.Constants;
local v7 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging);
local v8 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableDevSubsInRobux);
return function(v9, v10, v11, v12, v13) --[[ Line: 15 ]]
    -- upvalues: v7 (copy), v5 (copy), l_Constants_0 (copy), v3 (copy), v2 (copy), v8 (copy)
    if v7() then
        v5.EdpStoreAnalyticsLogger.logEvent(l_Constants_0.StoreEnums.ActionType.ItemClick, l_Constants_0.StoreEnums.ProductType.Subscriptions, l_Constants_0.StoreEnums.LocationType.Store, tonumber(v9.subscriptionProviderId), tonumber(v9.subscriptionTargetKey), (tostring(v9.subscriptionTargetKey)));
    end;
    return function(v14) --[[ Line: 32 ]]
        -- upvalues: v3 (ref), v2 (ref), v9 (copy), v10 (copy), v11 (copy), v8 (ref), v12 (copy), v13 (copy)
        v14:dispatch(v3({
            name = v2.SubscriptionPurchase, 
            detail = "", 
            extraProps = {
                subscriptionPurchaseProductInfo = v9, 
                thumbnailString = v10, 
                isSubScribed = v11, 
                isSubscribed = v8() and v11, 
                creatorName = v12, 
                creatorVerified = v13
            }
        }));
    end;
end;