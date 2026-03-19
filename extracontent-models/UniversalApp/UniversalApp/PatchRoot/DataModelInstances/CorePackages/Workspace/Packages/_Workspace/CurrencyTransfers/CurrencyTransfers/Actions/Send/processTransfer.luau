local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local _ = require(l_script_FirstAncestor_0.Stores.createTransferStore);
local v2 = require(l_script_FirstAncestor_0.NetworkRequests.processTransferRequest);
local v3 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.Models.ProcessTransferModel);
local _ = require(l_script_FirstAncestor_0.Models.ErrorTransferModel);
local v6 = require(l_script_FirstAncestor_0.Enums.FailureReason);
local v7 = require(l_script_FirstAncestor_0.Actions.Send.handleTransferSuccess);
local v8 = require(l_script_FirstAncestor_0.Actions.Send.handleTransferError);
local v9 = require(l_script_FirstAncestor_0.Actions.Send.handleTransferBlock);
local v10 = require(l_script_FirstAncestor_0.Enums.TransferRetryOrigin);
return function(v11, v12) --[[ Line: 17 ]] --[[ Name: processTransfer ]]
    -- upvalues: v8 (copy), v3 (copy), v2 (copy), v7 (copy), v6 (copy), v9 (copy), v10 (copy)
    local l_setPromptState_0 = v11.setPromptState;
    local v14 = v11.getTransferRequestId(false);
    if not v14 then
        v8(v11);
        return;
    else
        l_setPromptState_0(v3.TransferProcessing);
        local v15 = {
            transferRequestId = v14, 
            robuxAmount = v12
        };
        return v2(v15):andThen(function(v16) --[[ Line: 37 ]]
            -- upvalues: v7 (ref), v11 (copy), v8 (ref)
            if v16 and v16.success then
                v7(v11);
                return;
            else
                v8(v11);
                return;
            end;
        end):catch(function(v17) --[[ Line: 44 ]]
            -- upvalues: v6 (ref), v9 (ref), v11 (copy), v10 (ref), v8 (ref)
            if typeof(v17) == "table" and v17.errorMessage then
                if v17.failureReason == v6.AmpRecourseAvailable and v17.ampRecourseActions and v17.ampFeatureCheck then
                    v9(v11, v17.ampRecourseActions, v17.ampFeatureCheck, v10.ProcessTransfer);
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