local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local _ = require(l_script_FirstAncestor_0.Stores.createTransferStore);
local v2 = require(l_script_FirstAncestor_0.NetworkRequests.initiateTransferRequest);
local v3 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.Models.InitiateTransferModel);
local _ = require(l_script_FirstAncestor_0.Models.ErrorTransferModel);
local v6 = require(l_script_FirstAncestor_0.Enums.FailureReason);
local v7 = require(l_script_FirstAncestor_0.Actions.Send.handleTransferError);
local v8 = require(l_script_FirstAncestor_0.Actions.Send.handleTransferBlock);
local v9 = require(l_script_FirstAncestor_0.Actions.Send.setTransferPromptState);
local v10 = require(l_script_FirstAncestor_0.Enums.TransferRetryOrigin);
local v11 = require(l_script_FirstAncestor_0.Events.CurrencyTransferTelemetry);
local v12 = require(l_script_FirstAncestor_0.Utils.logCurrencyTransferCounter);
return function(v13) --[[ Line: 19 ]] --[[ Name: initiateTransfer ]]
    -- upvalues: v3 (copy), v2 (copy), v9 (copy), v12 (copy), v11 (copy), v6 (copy), v8 (copy), v10 (copy), v7 (copy)
    local l_setPromptState_0 = v13.setPromptState;
    local l_setTransferRequestId_0 = v13.setTransferRequestId;
    local l_setRobuxBalanceAmount_0 = v13.setRobuxBalanceAmount;
    local l_setBalanceReceivedFromApi_0 = v13.setBalanceReceivedFromApi;
    local l_setUserRelationshipDetail_0 = v13.setUserRelationshipDetail;
    local l_setRecipient_0 = v13.setRecipient;
    local l_setSender_0 = v13.setSender;
    local v21 = v13.getRecipientUserId(false);
    l_setPromptState_0(v3.TransferRequested);
    local v22 = {
        recipientId = v21
    };
    local v23 = v13.getTransferOrigination();
    if v23 then
        v22.transferOrigination = v23;
    end;
    v2(v22):andThen(function(v24) --[[ Line: 38 ]]
        -- upvalues: v9 (ref), v13 (copy), v3 (ref), l_setTransferRequestId_0 (copy), l_setRobuxBalanceAmount_0 (copy), l_setBalanceReceivedFromApi_0 (copy), l_setUserRelationshipDetail_0 (copy), l_setRecipient_0 (copy), l_setSender_0 (copy), v12 (ref), v11 (ref)
        v9(v13, v3.TransferStarted);
        if v24 and v24.transferRequestId and v24.robuxTransfer then
            l_setTransferRequestId_0(v24.transferRequestId);
            l_setRobuxBalanceAmount_0(v24.senderRobuxBalance);
            l_setBalanceReceivedFromApi_0(true);
            l_setUserRelationshipDetail_0(v24.userRelationshipDetail);
            l_setRecipient_0(v24.robuxTransfer.recipient);
            l_setSender_0(v24.robuxTransfer.sender);
            v9(v13, v3.TransferInput);
            v12(v13, v11.CurrencyTransferInitiateSucceededCounter);
        end;
    end):catch(function(v25) --[[ Line: 55 ]]
        -- upvalues: v12 (ref), v13 (copy), v11 (ref), v6 (ref), v8 (ref), v10 (ref), v7 (ref)
        v12(v13, v11.CurrencyTransferInitiateFailedCounter);
        if typeof(v25) == "table" and v25.errorMessage then
            if v25.failureReason == v6.AmpRecourseAvailable and v25.ampRecourseActions and v25.ampFeatureCheck then
                v8(v13, v25.ampRecourseActions, v25.ampFeatureCheck, v10.InitiateTransfer);
                return;
            else
                v7(v13, v25);
                return;
            end;
        else
            v7(v13, nil);
            return;
        end;
    end);
end;