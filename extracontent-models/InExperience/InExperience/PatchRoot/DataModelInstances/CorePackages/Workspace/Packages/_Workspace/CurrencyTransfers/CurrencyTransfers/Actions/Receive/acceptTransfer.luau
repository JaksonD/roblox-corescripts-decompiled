local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SharedFlags);
local _ = require(l_script_FirstAncestor_0.Stores.createTransferStore);
local v4 = require(l_script_FirstAncestor_0.NetworkRequests.acceptTransferRequest);
local v5 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.Models.AcceptTransferModel);
local _ = require(l_script_FirstAncestor_0.Models.ErrorTransferModel);
local v8 = require(l_script_FirstAncestor_0.Enums.FailureReason);
local v9 = require(l_script_FirstAncestor_0.Actions.Receive.handleReceiveSuccess);
local v10 = require(l_script_FirstAncestor_0.Actions.Receive.handleReceiveError);
local v11 = require(l_script_FirstAncestor_0.Actions.Receive.handleReceiveBlock);
local v12 = require(l_script_FirstAncestor_0.Enums.TransferRetryOrigin);
local v13 = require(l_script_FirstAncestor_0.Events.CurrencyTransferTelemetry);
local v14 = require(l_script_FirstAncestor_0.Enums.RobuxTransferFlowEventName);
local v15 = require(l_script_FirstAncestor_0.Utils.logCurrencyTransferCounter);
local v16 = require(l_script_FirstAncestor_0.Utils.logRobuxTransferFlowEvent);
return function(v17) --[[ Line: 25 ]] --[[ Name: acceptTransfer ]]
    -- upvalues: v15 (copy), v13 (copy), v2 (copy), v16 (copy), v14 (copy), v10 (copy), v5 (copy), v4 (copy), v9 (copy), v8 (copy), v11 (copy), v12 (copy)
    local l_setPromptState_0 = v17.setPromptState;
    local l_setRobuxTransfer_0 = v17.setRobuxTransfer;
    local l_setIsAlreadyAccepted_0 = v17.setIsAlreadyAccepted;
    local v21 = v17.getTransferRequestId(false);
    if not v21 then
        v15(v17, v13.CurrencyTransferAcceptFailedCounter);
        if v2.FFlagEnableRobuxTransferFlowEventIngest then
            v16(v17, v14.accept_failed);
        end;
        v10(v17, nil);
        return;
    else
        l_setPromptState_0(v5.ReceiveRequested);
        local v22 = {
            transferRequestId = v21
        };
        v15(v17, v13.CurrencyTransferAcceptAttemptedCounter);
        if v2.FFlagEnableRobuxTransferFlowEventIngest then
            v16(v17, v14.accept_attempted);
        end;
        return v4(v22):andThen(function(v23) --[[ Line: 53 ]]
            -- upvalues: l_setPromptState_0 (copy), v5 (ref), l_setRobuxTransfer_0 (copy), l_setIsAlreadyAccepted_0 (copy), v15 (ref), v17 (copy), v13 (ref), v2 (ref), v16 (ref), v14 (ref), v9 (ref), v10 (ref)
            l_setPromptState_0(v5.ReceiveStarted);
            if v23 and v23.robuxTransfer then
                l_setRobuxTransfer_0(v23.robuxTransfer);
                l_setIsAlreadyAccepted_0(v23.isAlreadyAccepted == true);
                v15(v17, v13.CurrencyTransferAcceptSucceededCounter);
                if v2.FFlagEnableRobuxTransferFlowEventIngest then
                    v16(v17, v14.accept_succeeded);
                end;
                v9(v17);
                return;
            else
                v15(v17, v13.CurrencyTransferAcceptFailedCounter);
                if v2.FFlagEnableRobuxTransferFlowEventIngest then
                    v16(v17, v14.accept_failed);
                end;
                v10(v17, nil);
                return;
            end;
        end):catch(function(v24) --[[ Line: 75 ]]
            -- upvalues: v15 (ref), v17 (copy), v13 (ref), v2 (ref), v16 (ref), v14 (ref), v8 (ref), v11 (ref), v12 (ref), v10 (ref)
            v15(v17, v13.CurrencyTransferAcceptFailedCounter);
            if v2.FFlagEnableRobuxTransferFlowEventIngest then
                v16(v17, v14.accept_failed);
            end;
            if typeof(v24) == "table" and v24.errorMessage then
                if v24.failureReason == v8.AmpRecourseAvailable and v24.ampRecourseActions and v24.ampFeatureCheck then
                    v11(v17, v24.ampRecourseActions, v24.ampFeatureCheck, v12.AcceptTransfer);
                    return;
                else
                    v10(v17, v24);
                    return;
                end;
            else
                v10(v17, nil);
                return;
            end;
        end);
    end;
end;