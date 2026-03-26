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
return function(v11) --[[ Line: 17 ]] --[[ Name: initiateTransfer ]]
    -- upvalues: v3 (copy), v2 (copy), v9 (copy), v6 (copy), v8 (copy), v10 (copy), v7 (copy)
    local l_setPromptState_0 = v11.setPromptState;
    local l_setTransferRequestId_0 = v11.setTransferRequestId;
    local l_setRobuxBalanceAmount_0 = v11.setRobuxBalanceAmount;
    local l_setBalanceReceivedFromApi_0 = v11.setBalanceReceivedFromApi;
    local l_setUserRelationshipDetail_0 = v11.setUserRelationshipDetail;
    local l_setRecipient_0 = v11.setRecipient;
    local l_setSender_0 = v11.setSender;
    local v19 = v11.getRecipientUserId(false);
    l_setPromptState_0(v3.TransferRequested);
    local v20 = {
        recipientId = v19
    };
    local v21 = v11.getTransferOrigination();
    if v21 then
        v20.transferOrigination = v21;
    end;
    v2(v20):andThen(function(v22) --[[ Line: 36 ]]
        -- upvalues: v9 (ref), v11 (copy), v3 (ref), l_setTransferRequestId_0 (copy), l_setRobuxBalanceAmount_0 (copy), l_setBalanceReceivedFromApi_0 (copy), l_setUserRelationshipDetail_0 (copy), l_setRecipient_0 (copy), l_setSender_0 (copy)
        v9(v11, v3.TransferStarted);
        if v22 and v22.transferRequestId and v22.robuxTransfer then
            l_setTransferRequestId_0(v22.transferRequestId);
            l_setRobuxBalanceAmount_0(v22.senderRobuxBalance);
            l_setBalanceReceivedFromApi_0(true);
            l_setUserRelationshipDetail_0(v22.userRelationshipDetail);
            l_setRecipient_0(v22.robuxTransfer.recipient);
            l_setSender_0(v22.robuxTransfer.sender);
            v9(v11, v3.TransferInput);
        end;
    end):catch(function(v23) --[[ Line: 49 ]]
        -- upvalues: v6 (ref), v8 (ref), v11 (copy), v10 (ref), v7 (ref)
        if typeof(v23) == "table" and v23.errorMessage then
            if v23.failureReason == v6.AmpRecourseAvailable and v23.ampRecourseActions and v23.ampFeatureCheck then
                v8(v11, v23.ampRecourseActions, v23.ampFeatureCheck, v10.InitiateTransfer);
                return;
            else
                v7(v11, v23);
                return;
            end;
        else
            v7(v11, nil);
            return;
        end;
    end);
end;