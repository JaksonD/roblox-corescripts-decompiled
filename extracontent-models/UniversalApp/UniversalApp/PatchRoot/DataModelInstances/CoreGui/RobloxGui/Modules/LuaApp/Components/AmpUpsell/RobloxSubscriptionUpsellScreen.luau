local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Workspace.Packages.RobloxSubscriptionPurchaseApp);
local l_RobloxSubscriptionFlowCompleteReason_0 = v2.RobloxSubscriptionFlowCompleteReason;
local l_SurfaceName_0 = v2.SurfaceName;
local l_SurfaceContext_0 = v2.SurfaceContext;
return function(v6) --[[ Line: 21 ]]
    -- upvalues: v1 (copy), v2 (copy), l_RobloxSubscriptionFlowCompleteReason_0 (copy), l_SurfaceName_0 (copy), l_SurfaceContext_0 (copy)
    v1.useEffect(function() --[[ Line: 22 ]]
        -- upvalues: v2 (ref), v6 (copy), l_RobloxSubscriptionFlowCompleteReason_0 (ref), l_SurfaceName_0 (ref), l_SurfaceContext_0 (ref)
        local v8 = v2.initiateRobloxSubscriptionPurchase(v6.purchaseUIOptions, {
            onFlowComplete = function(v7) --[[ Line: 26 ]] --[[ Name: onFlowComplete ]]
                -- upvalues: l_RobloxSubscriptionFlowCompleteReason_0 (ref), v6 (ref)
                if v7 == l_RobloxSubscriptionFlowCompleteReason_0.UpsellPurchaseSucceeded then
                    if v6.onSuccess then
                        v6.onSuccess();
                        return;
                    end;
                elseif v7 == l_RobloxSubscriptionFlowCompleteReason_0.UpsellPurchaseFailed then
                    if v6.onFailure then
                        v6.onFailure();
                        return;
                    elseif v6.onCancel then
                        v6.onCancel();
                        return;
                    end;
                elseif v6.onCancel then
                    v6.onCancel();
                end;
            end
        }, nil, v6.surfaceName or l_SurfaceName_0.Unspecified, v6.surfaceContext or l_SurfaceContext_0.Unspecified);
        return function() --[[ Line: 51 ]]
            -- upvalues: v8 (copy)
            if v8 then
                v8();
            end;
        end;
    end, {});
    return v1.createElement(v1.Fragment, {});
end;