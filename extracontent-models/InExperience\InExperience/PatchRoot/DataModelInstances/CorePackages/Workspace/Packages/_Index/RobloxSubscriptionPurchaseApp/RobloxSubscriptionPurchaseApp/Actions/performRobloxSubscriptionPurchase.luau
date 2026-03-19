local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v4 = require(l_script_FirstAncestor_0.Utils.getSubscriptionPurchaseUrl);
local v5 = require(l_script_FirstAncestor_0.Utils.WebViewServiceWrapper);
local v6 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v7 = require(l_script_FirstAncestor_0.Constants);
local _ = require(l_script_FirstAncestor_0.Models.GetRobloxSubscriptionProductsModel);
local v9 = require(l_script_FirstAncestor_0.Actions.completeRobloxSubscriptionUpsellFlow);
local v10 = require(l_script_FirstAncestor_0.Events.RobloxSubscriptionUpsellTelemetry);
local v11 = require(l_script_FirstAncestor_0.Utils.logRobloxSubscriptionUpsellCounter);
local function _(v12) --[[ Line: 23 ]] --[[ Name: getPaymentProviderForPlatform ]]
    if v12 == Enum.Platform.IOS then
        return "AppleAppStore";
    elseif v12 == Enum.Platform.Android then
        return "GooglePlayStore";
    else
        return "Unknown";
    end;
end;
performRobloxSubscriptionPurchase = function() --[[ Line: 33 ]] --[[ Name: performRobloxSubscriptionPurchase ]]
    -- upvalues: v3 (copy), l_UserInputService_0 (copy), v6 (copy), v5 (copy), v4 (copy), v7 (copy), v9 (copy), l_MarketplaceService_0 (copy), v11 (copy), v10 (copy)
    local v14 = v3.get();
    local v15 = v14.getRobloxSubscriptionProductId();
    local v16 = v14.getPaymentSessionId();
    if v15 == nil then
        return;
    else
        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
        local v18 = true;
        if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
            v18 = true;
            if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.OSX then
                v18 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Linux;
            end;
        end;
        if v18 then
            v14.setIsNativePurchase(false);
            v14.setDidTryPurchasing(true);
            v14.setPromptState(v6.SubscriptionPurchaseUIReady);
            v5.new({
                url = v4(v15, v16), 
                title = v7.ROBLOX_SUBSCRIPTION_PRODUCT_NAME, 
                closeCallback = function() --[[ Line: 56 ]] --[[ Name: closeCallback ]]
                    -- upvalues: v9 (ref)
                    v9();
                end, 
                onOpenCallback = function() --[[ Line: 61 ]] --[[ Name: onOpenCallback ]]
                    -- upvalues: v14 (copy), v6 (ref)
                    v14.setPromptState(v6.SubscriptionPurchaseInProgress);
                end
            }):open();
            return;
        else
            v14.setPromptState(v6.SubscriptionPurchaseInProgress);
            local v19 = l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS and "AppleAppStore" or l_l_UserInputService_0_Platform_0 == Enum.Platform.Android and "GooglePlayStore" or "Unknown";
            v14.setIsNativePurchase(true);
            local l_status_0, _ = pcall(function() --[[ Line: 74 ]]
                -- upvalues: l_MarketplaceService_0 (ref), v7 (ref), v15 (copy), v19 (copy), v16 (copy)
                l_MarketplaceService_0:PerformSubscriptionPurchaseV3Async(v7.ROBLOX_SUBSCRIPTION_PRODUCT_TYPE, v15, v19, v16);
            end);
            if not l_status_0 then
                v11(v10.RobloxSubscriptionUpsellPurchaseFailedCounter);
            end;
            return;
        end;
    end;
end;
return performRobloxSubscriptionPurchase;