local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = nil;
pcall(function() --[[ Line: 9 ]]
    -- upvalues: v6 (ref)
    v6 = game:GetService("PlatformService");
end);
local v7 = require(l_Modules_0.LuaApp.AppPage);
local v8 = require(l_Modules_0.LuaApp.Enum.PaymentPlatform);
local v9 = require(l_Modules_0.LuaApp.Enum.NativePurchaseStatus);
local v10 = require(l_Modules_0.LuaApp.Actions.SetNativePurchaseResult);
local v11 = require(l_Modules_0.LuaApp.Thunks.NativePurchaseComplete);
local v12 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v13 = require(l_Modules_0.LuaApp.Util.getPaymentPlatform);
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v15 = require(l_Modules_0.LuaApp.Thunks.Economy.OpenPurchaseRobuxPage);
local l_DesktopUpsellExperiment_0 = require(l_CorePackages_0.Workspace.Packages.IAPExperience).Utility.DesktopUpsellExperiment;
return function(v17, v18, v19, v20) --[[ Line: 27 ]]
    -- upvalues: v10 (copy), v9 (copy), l_RunService_0 (copy), v11 (copy), v13 (copy), v8 (copy), l_getAppFeaturePolicies_0 (copy), v15 (copy), l_DesktopUpsellExperiment_0 (copy), v12 (copy), v7 (copy), v6 (ref), l_MarketplaceService_0 (copy), l_Players_0 (copy)
    return function(v21) --[[ Line: 28 ]]
        -- upvalues: v10 (ref), v18 (copy), v9 (ref), l_RunService_0 (ref), v11 (ref), v17 (copy), v13 (ref), v8 (ref), l_getAppFeaturePolicies_0 (ref), v15 (ref), l_DesktopUpsellExperiment_0 (ref), v12 (ref), v7 (ref), v19 (copy), v20 (copy), v6 (ref), l_MarketplaceService_0 (ref), l_Players_0 (ref)
        v21:dispatch(v10(v18, v9.Pending));
        if l_RunService_0:IsStudio() then
            delay(3, function() --[[ Line: 33 ]]
                -- upvalues: v21 (copy), v11 (ref), v17 (ref), v18 (ref), v9 (ref)
                v21:dispatch(v11(v17, v18, v9.Success));
            end);
            return;
        else
            local v22 = v13();
            if v22 == v8.Web then
                if l_getAppFeaturePolicies_0().getRedirectBuyRobuxToVNG() then
                    return v21:dispatch(v15(function() --[[ Line: 42 ]]
                        -- upvalues: v21 (copy), v11 (ref), v17 (ref), v18 (ref), v9 (ref)
                        return v21:dispatch(v11(v17, v18, v9.Polling));
                    end, v17));
                elseif l_DesktopUpsellExperiment_0.getVariant() == l_DesktopUpsellExperiment_0.variants.OpenRobuxStore then
                    return v21:dispatch(v12({
                        name = v7.PurchaseRobux, 
                        detail = v19, 
                        extraProps = {
                            analyticId = v20, 
                            productId = v19
                        }
                    }));
                else
                    return v21:dispatch(v12({
                        name = v7.Payment, 
                        detail = v19, 
                        extraProps = {
                            analyticId = v20
                        }
                    }));
                end;
            elseif v22 == v8.Xbox then
                local v23 = nil;
                local v24 = nil;
                local v25 = nil;
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 72 ]]
                    -- upvalues: v23 (ref), v6 (ref), v18 (ref)
                    v23 = v6:BeginPlatformStorePurchase(v18);
                end);
                v24 = l_status_0;
                v25 = l_result_0;
                l_status_0 = v9.Failed;
                if v24 and v23 == 0 then
                    l_status_0 = v9.Success;
                end;
                return v21:dispatch(v11(v17, v18, l_status_0));
            elseif game:GetEngineFeature("NativePurchaseWithLocalPlayer") then
                return l_MarketplaceService_0:PromptNativePurchaseWithLocalPlayer(v18);
            else
                return l_MarketplaceService_0:PromptNativePurchase(l_Players_0.LocalPlayer, v18);
            end;
        end;
    end;
end;