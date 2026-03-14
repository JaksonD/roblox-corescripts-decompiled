local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Enum.NativePurchaseProductTypeEnum);
local v4 = require(l_Modules_0.LuaApp.Enum.NativePurchaseStatus);
local v5 = require(l_Modules_0.LuaApp.Actions.SetUserMembershipType);
local v6 = require(l_Modules_0.LuaApp.Actions.SetNativePurchaseResult);
local _ = require(l_Modules_0.LuaApp.Models.PremiumFeaturesApi.IAPProduct);
local v8 = require(l_Modules_0.LuaApp.Thunks.PollRobuxBalance);
local _ = function(v9, v10) --[[ Line: 12 ]] --[[ Name: hasPackage ]]
    for _, v12 in pairs(v9) do
        if v12.mobileProductId == v10 then
            return true;
        end;
    end;
    return false;
end;
return function(v14, v15, v16) --[[ Line: 21 ]]
    -- upvalues: v4 (copy), v6 (copy), v3 (copy), v5 (copy), l_RunService_0 (copy), v8 (copy)
    return function(v17) --[[ Line: 22 ]]
        -- upvalues: v16 (copy), v4 (ref), v6 (ref), v15 (copy), v3 (ref), v5 (ref), l_RunService_0 (ref), v8 (ref), v14 (copy)
        local v18 = false;
        local v19 = v17:getState();
        local l_LocalUserId_0 = v19.LocalUserId;
        local v21 = v19.UserRobux[v19.LocalUserId];
        local l_NativePurchase_0 = v19.NativePurchase;
        if v16 == v4.Failed or v16 == v4.Pending then
            return v17:dispatch(v6(v15, v4.Failed));
        elseif l_NativePurchase_0.productType == v3.Subscription then
            return v17:dispatch(v6(v15, v4.Success));
        else
            local l_Subscriptions_0 = v19.IAPProducts.Subscriptions;
            local l_v15_0 = v15;
            local v25;
            for _, v27 in pairs(l_Subscriptions_0) do
                if v27.mobileProductId == l_v15_0 then
                    v25 = true;
                    v18 = true;
                end;
                if v18 then
                    break;
                end;
            end;
            if not v18 then
                v25 = false;
            end;
            v18 = false;
            if v25 then
                v17:dispatch(v5(l_LocalUserId_0, Enum.MembershipType.Premium));
                return v17:dispatch(v6(v15, v4.Success));
            else
                v17:dispatch(v6(v15, v4.Polling));
                if l_RunService_0:IsStudio() then
                    return v17:dispatch(v6(v15, v4.Success));
                else
                    return v17:dispatch(v8(v14, tostring(l_LocalUserId_0), v21, function(v28) --[[ Line: 54 ]]
                        -- upvalues: v21 (copy), v4 (ref), v17 (copy), v6 (ref), v15 (ref)
                        local v29 = v28 ~= v21 and v4.Success or v4.Failed;
                        return v17:dispatch(v6(v15, v29));
                    end)):catch(function() --[[ Line: 59 ]]
                        -- upvalues: v17 (copy), v6 (ref), v15 (ref), v4 (ref)
                        return v17:dispatch(v6(v15, v4.Failed));
                    end);
                end;
            end;
        end;
    end;
end;