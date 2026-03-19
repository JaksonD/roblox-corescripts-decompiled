local l_CommerceService_0 = game:GetService("CommerceService");
local l_Parent_0 = script:FindFirstAncestor("CommercePurchaseApp").Parent;
local v2 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_Parent_0.ToastRodux);
local l_ToastType_0 = v5.Enums.ToastType;
local l_SetCurrentToastMessage_0 = v5.Actions.SetCurrentToastMessage;
return function() --[[ Line: 13 ]] --[[ Name: useBenefitStatusReceivedListenerEffect ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_CommerceService_0 (copy), l_ToastType_0 (copy), l_SetCurrentToastMessage_0 (copy)
    local v8 = l_useDispatch_0();
    local v9 = l_useLocalization_0({
        granted = "CoreScripts.CommercePurchasePrompt.SuccessToast.Granted", 
        pending = "CoreScripts.CommercePurchasePrompt.SuccessToast.GrantPending"
    });
    v2.useEffect(function() --[[ Line: 19 ]]
        -- upvalues: v8 (copy), l_CommerceService_0 (ref), l_ToastType_0 (ref), v9 (copy), l_SetCurrentToastMessage_0 (ref)
        local v10 = nil;
        if v8 then
            v10 = l_CommerceService_0.BenefitStatusReceived:Connect(function(v11) --[[ Line: 22 ]]
                -- upvalues: l_ToastType_0 (ref), v9 (ref), v8 (ref), l_SetCurrentToastMessage_0 (ref)
                local v12 = if v11 then {
                    toastType = l_ToastType_0.SuccessConfirmation, 
                    toastTitle = v9.granted
                } else {
                    toastType = l_ToastType_0.NetworkingError, 
                    toastTitle = v9.pending
                };
                v8(l_SetCurrentToastMessage_0(v12));
            end);
        end;
        return function() --[[ Line: 29 ]]
            -- upvalues: v10 (ref)
            if v10 then
                v10:Disconnect();
                v10 = nil;
            end;
        end;
    end, {
        v8, 
        v9
    });
end;