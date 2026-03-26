local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local _ = require(l_script_FirstAncestor_0.Stores.createTransferStore);
local v2 = require(l_script_FirstAncestor_0.NetworkRequests.getTransferRequestByIdRequest);
local v3 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.Enums.TransferRetryOrigin);
return function(v5, v6, v7, v8) --[[ Line: 10 ]] --[[ Name: handleReceiveBlock ]]
    -- upvalues: v3 (copy), v2 (copy)
    local l_setPromptState_0 = v5.setPromptState;
    local l_setAmpRecourseActions_0 = v5.setAmpRecourseActions;
    local l_setAmpFeatureCheck_0 = v5.setAmpFeatureCheck;
    local l_setTransferRetryOrigin_0 = v5.setTransferRetryOrigin;
    local l_setSender_0 = v5.setSender;
    local l_getSender_0 = v5.getSender;
    local l_getTransferRequestId_0 = v5.getTransferRequestId;
    local function _() --[[ Line: 24 ]] --[[ Name: applyBlockState ]]
        -- upvalues: v6 (copy), l_setAmpRecourseActions_0 (copy), v7 (copy), l_setAmpFeatureCheck_0 (copy), v8 (copy), l_setTransferRetryOrigin_0 (copy), l_setPromptState_0 (copy), v3 (ref)
        if v6 then
            l_setAmpRecourseActions_0(v6);
        end;
        if v7 then
            l_setAmpFeatureCheck_0(v7);
        end;
        if v8 then
            l_setTransferRetryOrigin_0(v8);
        end;
        l_setPromptState_0(v3.ReceiveBlocked);
    end;
    if l_getSender_0(false) then
        if v6 then
            l_setAmpRecourseActions_0(v6);
        end;
        if v7 then
            l_setAmpFeatureCheck_0(v7);
        end;
        if v8 then
            l_setTransferRetryOrigin_0(v8);
        end;
        l_setPromptState_0(v3.ReceiveBlocked);
        return;
    else
        local v17 = l_getTransferRequestId_0(false);
        if not v17 then
            if v6 then
                l_setAmpRecourseActions_0(v6);
            end;
            if v7 then
                l_setAmpFeatureCheck_0(v7);
            end;
            if v8 then
                l_setTransferRetryOrigin_0(v8);
            end;
            l_setPromptState_0(v3.ReceiveBlocked);
            return;
        else
            v2({
                transferRequestId = v17
            }):andThen(function(v18) --[[ Line: 49 ]]
                -- upvalues: l_setSender_0 (copy), v6 (copy), l_setAmpRecourseActions_0 (copy), v7 (copy), l_setAmpFeatureCheck_0 (copy), v8 (copy), l_setTransferRetryOrigin_0 (copy), l_setPromptState_0 (copy), v3 (ref)
                if v18 and v18.transfer and v18.transfer.sender then
                    l_setSender_0(v18.transfer.sender);
                end;
                if v6 then
                    l_setAmpRecourseActions_0(v6);
                end;
                if v7 then
                    l_setAmpFeatureCheck_0(v7);
                end;
                if v8 then
                    l_setTransferRetryOrigin_0(v8);
                end;
                l_setPromptState_0(v3.ReceiveBlocked);
            end):catch(function() --[[ Line: 55 ]]
                -- upvalues: v6 (copy), l_setAmpRecourseActions_0 (copy), v7 (copy), l_setAmpFeatureCheck_0 (copy), v8 (copy), l_setTransferRetryOrigin_0 (copy), l_setPromptState_0 (copy), v3 (ref)
                if v6 then
                    l_setAmpRecourseActions_0(v6);
                end;
                if v7 then
                    l_setAmpFeatureCheck_0(v7);
                end;
                if v8 then
                    l_setTransferRetryOrigin_0(v8);
                end;
                l_setPromptState_0(v3.ReceiveBlocked);
            end);
            return;
        end;
    end;
end;