local l_script_FirstAncestor_0 = script:FindFirstAncestor("CommercePurchaseApp");
local l_CommerceService_0 = game:GetService("CommerceService");
local v2 = require(l_script_FirstAncestor_0.Store.Actions.CommercePurchaseFailed);
local v3 = require(l_script_FirstAncestor_0.Store.Actions.CommercePurchaseStarted);
local v4 = require(l_script_FirstAncestor_0.Store.Actions.CommercePurchaseCheckout);
local v5 = require(l_script_FirstAncestor_0.Store.Actions.CommercePurchaseEnded);
local v6 = require(l_script_FirstAncestor_0.Enums.ErrorCodeEnum);
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagAddCommerceErrors);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v9 = require(l_Parent_0.ToastRodux);
local l_ToastType_0 = v9.Enums.ToastType;
local l_SetCurrentToastMessage_0 = v9.Actions.SetCurrentToastMessage;
local function v13(v12) --[[ Line: 16 ]] --[[ Name: convertErrorMessageToErrorCode ]]
    -- upvalues: v7 (copy), v6 (copy)
    if v7 then
        if v12 == "DeviceTypeNotAllowed" or v12 == "PurchasePlatformNotSupported" then
            return v6.DeviceNotSupported;
        elseif v12 == "UniverseNotAllowed" or v12 == "ProductContentModerated" or v12 == "ProductNotFound" then
            return v6.NotPurchasable;
        elseif v12 == "UserNotAllowed" or v12 == "AccountCountryNotSupported" or v12 == "UserAgeNotAllowed" then
            return v6.AccountNotSupported;
        else
            return v6.Generic;
        end;
    elseif v12 == "NotPurchasable" then
        return v6.NotPurchasable;
    else
        return v6.Generic;
    end;
end;
local function v18(v14, v15, v16) --[[ Line: 44 ]] --[[ Name: handleError ]]
    -- upvalues: v13 (copy), v6 (copy), l_SetCurrentToastMessage_0 (copy), l_ToastType_0 (copy), v5 (copy), v2 (copy)
    local v17 = v13(v14);
    if v17 == v6.Generic then
        v15:dispatch(l_SetCurrentToastMessage_0({
            toastType = l_ToastType_0.NetworkingError, 
            toastTitle = v16
        }));
        v15:dispatch(v5());
        return;
    else
        v15:dispatch(v2(v17));
        return;
    end;
end;
return function(v19, v20) --[[ Line: 58 ]] --[[ Name: InitiateCommercePurchaseFlow ]]
    -- upvalues: v3 (copy), l_CommerceService_0 (copy), v4 (copy), v18 (copy)
    return function(v21) --[[ Line: 59 ]]
        -- upvalues: v3 (ref), v19 (copy), l_CommerceService_0 (ref), v4 (ref), v18 (ref), v20 (copy)
        v21:dispatch(v3(v19));
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 61 ]]
            -- upvalues: l_CommerceService_0 (ref), v19 (ref)
            return l_CommerceService_0:PrepareCommerceProductPurchase(v19);
        end);
        if l_status_0 then
            v21:dispatch(v4(l_result_0.CheckoutSessionId));
            return;
        else
            v18(l_result_0, v21, v20);
            return;
        end;
    end;
end;