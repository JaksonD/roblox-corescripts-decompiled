local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancelSubscriptionApp");
local v1 = require(l_script_FirstAncestor_0.NetworkRequests.getUserSubscriptionDetails);
local v2 = require(l_script_FirstAncestor_0.Store.Actions.CancelSubscriptionRequested);
local v3 = require(l_script_FirstAncestor_0.Store.Actions.CancelSubscriptionStarted);
local v4 = require(l_script_FirstAncestor_0.Store.Actions.CancelSubscriptionFailed);
local v5 = require(l_script_FirstAncestor_0.Enums.ErrorStateEnum);
local l_LocalizationService_0 = game:GetService("LocalizationService");
return function(v7, v8) --[[ Line: 9 ]] --[[ Name: InitiateCancelUserSubscriptionFlow ]]
    -- upvalues: v2 (copy), l_LocalizationService_0 (copy), v5 (copy), v1 (copy), v3 (copy), v4 (copy)
    return function(v9) --[[ Line: 10 ]]
        -- upvalues: v2 (ref), v8 (copy), l_LocalizationService_0 (ref), v5 (ref), v1 (ref), v7 (copy), v3 (ref), v4 (ref)
        v9:dispatch(v2(v8));
        local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
        local l_ErrorCancelling_0 = v5.ErrorCancelling;
        return v1(v7, v8):andThen(function(v12) --[[ Line: 16 ]]
            -- upvalues: l_RobloxLocaleId_0 (copy), v9 (copy), v3 (ref), v8 (ref), l_ErrorCancelling_0 (ref), v5 (ref), v4 (ref)
            if v12.SubscriptionState == Enum.SubscriptionState.SubscribedWillRenew or v12.SubscriptionState == Enum.SubscriptionState.SubscribedRenewalPaymentPending then
                local v13 = v12.NextRenewTime:FormatLocalTime("LL", l_RobloxLocaleId_0);
                v9:dispatch(v3(v8, v13));
                return;
            else
                if v12.SubscriptionState == Enum.SubscriptionState.NeverSubscribed or v12.SubscriptionState == Enum.SubscriptionState.Expired then
                    l_ErrorCancelling_0 = v5.Unsubscribed;
                elseif v12.SubscriptionState == Enum.SubscriptionState.SubscribedWillNotRenew then
                    l_ErrorCancelling_0 = v5.Expiring;
                end;
                v9:dispatch(v4(l_ErrorCancelling_0, v8));
                return;
            end;
        end):catch(function(_) --[[ Line: 35 ]]
            -- upvalues: v9 (copy), v4 (ref), v5 (ref), v8 (ref)
            v9:dispatch(v4(v5.ErrorCancelling, v8));
        end);
    end;
end;