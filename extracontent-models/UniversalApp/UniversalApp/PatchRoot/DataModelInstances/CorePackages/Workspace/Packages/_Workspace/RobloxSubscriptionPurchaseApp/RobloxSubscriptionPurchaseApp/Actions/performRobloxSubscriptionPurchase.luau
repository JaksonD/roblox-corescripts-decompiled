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
local v10 = require(l_script_FirstAncestor_0.Actions.transitionToError);
local v11 = require(l_script_FirstAncestor_0.Enums.ErrorReason);
local v12 = require(l_script_FirstAncestor_0.Events.RobloxSubscriptionUpsellTelemetry);
local v13 = require(l_script_FirstAncestor_0.Utils.logRobloxSubscriptionUpsellCounter);
local function _(v14) --[[ Line: 26 ]] --[[ Name: getPaymentProviderForPlatform ]]
    if v14 == Enum.Platform.IOS then
        return "AppleAppStore";
    elseif v14 == Enum.Platform.Android then
        return "GooglePlayStore";
    else
        return "Unknown";
    end;
end;
performRobloxSubscriptionPurchase = function() --[[ Line: 36 ]] --[[ Name: performRobloxSubscriptionPurchase ]]
    -- upvalues: v3 (copy), l_UserInputService_0 (copy), v6 (copy), v5 (copy), v4 (copy), v7 (copy), v9 (copy), l_MarketplaceService_0 (copy), v10 (copy), v11 (copy), v13 (copy), v12 (copy)
    local v16 = v3.get();
    local v17 = v16.getRobloxSubscriptionProductId();
    local v18 = v16.getPaymentSessionId();
    if v17 == nil then
        return;
    else
        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
        local v20 = true;
        if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
            v20 = true;
            if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.OSX then
                v20 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Linux;
            end;
        end;
        if v20 then
            v16.setIsNativePurchase(false);
            v16.setPromptState(v6.SubscriptionPurchaseUIReady);
            v5.new({
                url = v4(v17, v18), 
                title = v7.ROBLOX_SUBSCRIPTION_PRODUCT_NAME, 
                closeCallback = function() --[[ Line: 58 ]] --[[ Name: closeCallback ]]
                    -- upvalues: v16 (copy), v9 (ref)
                    v16.setDidTryPurchasing(true);
                    v9();
                end, 
                onOpenCallback = function() --[[ Line: 64 ]] --[[ Name: onOpenCallback ]]
                    -- upvalues: v16 (copy), v6 (ref)
                    v16.setPromptState(v6.SubscriptionPurchaseInProgress);
                end
            }):open();
            return;
        else
            v16.setPromptState(v6.SubscriptionPurchaseInProgress);
            local v21 = l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS and "AppleAppStore" or l_l_UserInputService_0_Platform_0 == Enum.Platform.Android and "GooglePlayStore" or "Unknown";
            v16.setIsNativePurchase(true);
            local l_status_0, _ = pcall(function() --[[ Line: 77 ]]
                -- upvalues: l_MarketplaceService_0 (ref), v7 (ref), v17 (copy), v21 (copy), v18 (copy)
                l_MarketplaceService_0:PerformSubscriptionPurchaseV3Async(v7.ROBLOX_SUBSCRIPTION_PRODUCT_TYPE, v17, v21, v18);
            end);
            if not l_status_0 then
                v10(v11.GenericError, "performRobloxSubscriptionPurchase");
                v13(v12.RobloxSubscriptionUpsellPurchaseFailedCounter);
            end;
            return;
        end;
    end;
end;
return performRobloxSubscriptionPurchase;