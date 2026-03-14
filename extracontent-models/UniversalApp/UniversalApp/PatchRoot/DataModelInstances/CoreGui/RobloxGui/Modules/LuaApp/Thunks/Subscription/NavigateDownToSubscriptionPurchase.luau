local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.AppPage);
local v3 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local _ = require(l_Modules_0.LuaApp.Models.SubscriptionApi.SubscriptionProductInfoModel);
local v5 = require(l_CorePackages_0.Workspace.Packages.EdpStoreAnalytics);
local l_Constants_0 = v5.Constants;
local v7 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging);
return function(v8, v9, v10, v11, v12) --[[ Line: 14 ]]
    -- upvalues: v7 (copy), v5 (copy), l_Constants_0 (copy), v3 (copy), v2 (copy)
    if v7() then
        v5.EdpStoreAnalyticsLogger.logEvent(l_Constants_0.StoreEnums.ActionType.ItemClick, l_Constants_0.StoreEnums.ProductType.Subscriptions, l_Constants_0.StoreEnums.LocationType.Store, tonumber(v8.subscriptionProviderId), tonumber(v8.subscriptionTargetKey), (tostring(v8.subscriptionTargetKey)));
    end;
    return function(v13) --[[ Line: 31 ]]
        -- upvalues: v3 (ref), v2 (ref), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy)
        v13:dispatch(v3({
            name = v2.SubscriptionPurchase, 
            detail = "", 
            extraProps = {
                subscriptionPurchaseProductInfo = v8, 
                thumbnailString = v9, 
                isSubScribed = v10, 
                creatorName = v11, 
                creatorVerified = v12
            }
        }));
    end;
end;