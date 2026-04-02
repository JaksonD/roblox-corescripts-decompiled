local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local _ = require(l_script_FirstAncestor_0.Stores.createTransferStore);
local v2 = require(l_script_FirstAncestor_0.NetworkRequests.getTransferRequestByIdRequest);
local v3 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.Enums.TransferRetryOrigin);
local v5 = require(l_script_FirstAncestor_0.Events.CurrencyTransferTelemetry);
local v6 = require(l_script_FirstAncestor_0.Utils.logCurrencyTransferCounter);
return function(v7, v8, v9, v10) --[[ Line: 12 ]] --[[ Name: handleReceiveBlock ]]
    -- upvalues: v6 (copy), v5 (copy), v3 (copy), v2 (copy)
    local l_setPromptState_0 = v7.setPromptState;
    local l_setAmpRecourseActions_0 = v7.setAmpRecourseActions;
    local l_setAmpFeatureCheck_0 = v7.setAmpFeatureCheck;
    local l_setTransferRetryOrigin_0 = v7.setTransferRetryOrigin;
    local l_setSender_0 = v7.setSender;
    local l_getSender_0 = v7.getSender;
    local l_getTransferRequestId_0 = v7.getTransferRequestId;
    local function _() --[[ Line: 26 ]] --[[ Name: applyBlockState ]]
        -- upvalues: v6 (ref), v7 (copy), v5 (ref), v8 (copy), l_setAmpRecourseActions_0 (copy), v9 (copy), l_setAmpFeatureCheck_0 (copy), v10 (copy), l_setTransferRetryOrigin_0 (copy), l_setPromptState_0 (copy), v3 (ref)
        v6(v7, v5.CurrencyTransferAmpRecourseRequiredCounter);
        if v8 then
            l_setAmpRecourseActions_0(v8);
        end;
        if v9 then
            l_setAmpFeatureCheck_0(v9);
        end;
        if v10 then
            l_setTransferRetryOrigin_0(v10);
        end;
        l_setPromptState_0(v3.ReceiveBlocked);
    end;
    if l_getSender_0(false) then
        v6(v7, v5.CurrencyTransferAmpRecourseRequiredCounter);
        if v8 then
            l_setAmpRecourseActions_0(v8);
        end;
        if v9 then
            l_setAmpFeatureCheck_0(v9);
        end;
        if v10 then
            l_setTransferRetryOrigin_0(v10);
        end;
        l_setPromptState_0(v3.ReceiveBlocked);
        return;
    else
        local v19 = l_getTransferRequestId_0(false);
        if not v19 then
            v6(v7, v5.CurrencyTransferAmpRecourseRequiredCounter);
            if v8 then
                l_setAmpRecourseActions_0(v8);
            end;
            if v9 then
                l_setAmpFeatureCheck_0(v9);
            end;
            if v10 then
                l_setTransferRetryOrigin_0(v10);
            end;
            l_setPromptState_0(v3.ReceiveBlocked);
            return;
        else
            v2({
                transferRequestId = v19
            }):andThen(function(v20) --[[ Line: 52 ]]
                -- upvalues: l_setSender_0 (copy), v6 (ref), v7 (copy), v5 (ref), v8 (copy), l_setAmpRecourseActions_0 (copy), v9 (copy), l_setAmpFeatureCheck_0 (copy), v10 (copy), l_setTransferRetryOrigin_0 (copy), l_setPromptState_0 (copy), v3 (ref)
                if v20 and v20.transfer and v20.transfer.sender then
                    l_setSender_0(v20.transfer.sender);
                end;
                v6(v7, v5.CurrencyTransferAmpRecourseRequiredCounter);
                if v8 then
                    l_setAmpRecourseActions_0(v8);
                end;
                if v9 then
                    l_setAmpFeatureCheck_0(v9);
                end;
                if v10 then
                    l_setTransferRetryOrigin_0(v10);
                end;
                l_setPromptState_0(v3.ReceiveBlocked);
            end):catch(function() --[[ Line: 58 ]]
                -- upvalues: v6 (ref), v7 (copy), v5 (ref), v8 (copy), l_setAmpRecourseActions_0 (copy), v9 (copy), l_setAmpFeatureCheck_0 (copy), v10 (copy), l_setTransferRetryOrigin_0 (copy), l_setPromptState_0 (copy), v3 (ref)
                v6(v7, v5.CurrencyTransferAmpRecourseRequiredCounter);
                if v8 then
                    l_setAmpRecourseActions_0(v8);
                end;
                if v9 then
                    l_setAmpFeatureCheck_0(v9);
                end;
                if v10 then
                    l_setTransferRetryOrigin_0(v10);
                end;
                l_setPromptState_0(v3.ReceiveBlocked);
            end);
            return;
        end;
    end;
end;