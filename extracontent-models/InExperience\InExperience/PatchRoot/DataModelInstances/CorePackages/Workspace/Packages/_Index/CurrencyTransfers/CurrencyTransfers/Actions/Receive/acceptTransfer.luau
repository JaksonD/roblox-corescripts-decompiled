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
return function(v11) --[[ Line: 18 ]] --[[ Name: acceptTransfer ]]
    -- upvalues: v8 (copy), v3 (copy), v2 (copy), v7 (copy), v6 (copy), v9 (copy), v10 (copy)
    local l_setPromptState_0 = v11.setPromptState;
    local l_setRobuxTransfer_0 = v11.setRobuxTransfer;
    local v14 = v11.getTransferRequestId(false);
    if not v14 then
        v8(v11, nil);
        return;
    else
        l_setPromptState_0(v3.ReceiveRequested);
        local v15 = {
            transferRequestId = v14
        };
        return v2(v15):andThen(function(v16) --[[ Line: 36 ]]
            -- upvalues: l_setPromptState_0 (copy), v3 (ref), l_setRobuxTransfer_0 (copy), v7 (ref), v11 (copy), v8 (ref)
            l_setPromptState_0(v3.ReceiveStarted);
            if v16 and v16.robuxTransfer then
                l_setRobuxTransfer_0(v16.robuxTransfer);
                v7(v11);
                return;
            else
                v8(v11, nil);
                return;
            end;
        end):catch(function(v17) --[[ Line: 47 ]]
            -- upvalues: v6 (ref), v9 (ref), v11 (copy), v10 (ref), v8 (ref)
            if typeof(v17) == "table" and v17.errorMessage then
                if v17.failureReason == v6.AmpRecourseAvailable and v17.ampRecourseActions and v17.ampFeatureCheck then
                    v9(v11, v17.ampRecourseActions, v17.ampFeatureCheck, v10.AcceptTransfer);
                    return;
                else
                    v8(v11, v17);
                    return;
                end;
            else
                v8(v11, nil);
                return;
            end;
        end);
    end;
end;