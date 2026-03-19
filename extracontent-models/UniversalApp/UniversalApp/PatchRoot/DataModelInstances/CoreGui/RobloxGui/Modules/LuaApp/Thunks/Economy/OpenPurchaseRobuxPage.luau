local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.AppPage);
local v3 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v4 = require(l_Modules_0.LuaApp.Thunks.Economy.NavigateDownToExternalVngShop);
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v6 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v7 = require(l_Modules_0.LuaApp.Util.getPaymentPlatform);
local v8 = require(l_Modules_0.LuaApp.Enum.PaymentPlatform);
return function(v9, v10, v11) --[[ Line: 13 ]]
    -- upvalues: v7 (copy), l_getAppFeaturePolicies_0 (copy), v8 (copy), v6 (copy), v4 (copy), v3 (copy), v2 (copy)
    return function(v12) --[[ Line: 14 ]]
        -- upvalues: v7 (ref), l_getAppFeaturePolicies_0 (ref), v8 (ref), v6 (ref), v4 (ref), v9 (copy), v10 (copy), v3 (ref), v2 (ref), v11 (copy)
        local v13 = v7();
        if l_getAppFeaturePolicies_0().getRedirectBuyRobuxToVNG() and v13 == v8.Web then
            v12:dispatch(v6(function() --[[ Line: 18 ]]
                -- upvalues: v12 (copy), v4 (ref), v9 (ref), v10 (ref)
                v12:dispatch(v4(v9, v10));
            end));
            return;
        else
            v12:dispatch(v3({
                name = v2.PurchaseRobux, 
                extraProps = {
                    analyticId = v11
                }
            }));
            return;
        end;
    end;
end;