local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local _ = require(l_script_FirstAncestor_0.Stores.createTransferStore);
local v2 = require(l_script_FirstAncestor_0.NetworkRequests.acceptTransferRequest);
local v3 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.Models.AcceptTransferModel);
local _ = require(l_script_FirstAncestor_0.Models.ErrorTransferModel);
local v6 = require(l_script_FirstAncestor_0.Enums.FailureReason);
local v7 = require(l_script_FirstAncestor_0.Actions.Receive.handleReceiveSuccess);
local v8 = require(l_script_FirstAncestor_0.Actions.Receive.handleReceiveError);
local v9 = require(l_script_FirstAncestor_0.Actions.Receive.handleReceiveBlock);
local v10 = require(l_script_FirstAncestor_0.Enums.TransferRetryOrigin);
local v11 = require(l_script_FirstAncestor_0.Events.CurrencyTransferTelemetry);
local v12 = require(l_script_FirstAncestor_0.Utils.logCurrencyTransferCounter);
return function(v13) --[[ Line: 20 ]] --[[ Name: acceptTransfer ]]
    -- upvalues: v12 (copy), v11 (copy), v8 (copy), v3 (copy), v2 (copy), v7 (copy), v6 (copy), v9 (copy), v10 (copy)
    local l_setPromptState_0 = v13.setPromptState;
    local l_setRobuxTransfer_0 = v13.setRobuxTransfer;
    local v16 = v13.getTransferRequestId(false);
    if not v16 then
        v12(v13, v11.CurrencyTransferAcceptFailedCounter);
        v8(v13, nil);
        return;
    else
        l_setPromptState_0(v3.ReceiveRequested);
        local v17 = {
            transferRequestId = v16
        };
        v12(v13, v11.CurrencyTransferAcceptAttemptedCounter);
        return v2(v17):andThen(function(v18) --[[ Line: 41 ]]
            -- upvalues: l_setPromptState_0 (copy), v3 (ref), l_setRobuxTransfer_0 (copy), v12 (ref), v13 (copy), v11 (ref), v7 (ref), v8 (ref)
            l_setPromptState_0(v3.ReceiveStarted);
            if v18 and v18.robuxTransfer then
                l_setRobuxTransfer_0(v18.robuxTransfer);
                v12(v13, v11.CurrencyTransferAcceptSucceededCounter);
                v7(v13);
                return;
            else
                v12(v13, v11.CurrencyTransferAcceptFailedCounter);
                v8(v13, nil);
                return;
            end;
        end):catch(function(v19) --[[ Line: 57 ]]
            -- upvalues: v12 (ref), v13 (copy), v11 (ref), v6 (ref), v9 (ref), v10 (ref), v8 (ref)
            v12(v13, v11.CurrencyTransferAcceptFailedCounter);
            if typeof(v19) == "table" and v19.errorMessage then
                if v19.failureReason == v6.AmpRecourseAvailable and v19.ampRecourseActions and v19.ampFeatureCheck then
                    v9(v13, v19.ampRecourseActions, v19.ampFeatureCheck, v10.AcceptTransfer);
                    return;
                else
                    v8(v13, v19);
                    return;
                end;
            else
                v8(v13, nil);
                return;
            end;
        end);
    end;
end;