local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v5 = require(l_Parent_0.LuauPolyfill);
local l_clearTimeout_0 = v5.clearTimeout;
local l_setTimeout_0 = v5.setTimeout;
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local v9 = require(l_script_FirstAncestor_0.Logger);
local v10 = require(l_script_FirstAncestor_0.Hooks.useRecordModalSequenceResponseForConversation);
local l_FFlagAppChatEnableDoubleOptIn_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableDoubleOptIn;
return function(v12) --[[ Line: 26 ]] --[[ Name: useRecordModalSeenWithDelay ]]
    -- upvalues: l_useDispatch_0 (copy), v3 (copy), v10 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy), v2 (copy), l_StatusCodes_0 (copy), v9 (copy), l_setTimeout_0 (copy), l_clearTimeout_0 (copy)
    local v13 = l_useDispatch_0();
    local v14, v15 = v3.useState(false);
    local v16 = v10(v12.conversationId);
    v3.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: v15 (copy)
        v15(false);
    end, {
        v12.modalSequence, 
        v12.modalId, 
        v12.conversationId, 
        if l_FFlagAppChatEnableDoubleOptIn_0 then v12.modalVariant else nil
    });
    local v17 = v12.canRecordAction and not v14 and v12.actionToRecord and v12.modalSequence and v12.modalId;
    if l_FFlagAppChatEnableDoubleOptIn_0 then
        v17 = v12.canRecordAction and not v14 and v12.actionToRecord and v12.modalSequence and (v12.modalId or v12.modalVariant);
    end;
    local v21 = v3.useCallback(function() --[[ Line: 56 ]]
        -- upvalues: v12 (copy), v16 (copy), v13 (copy), v2 (ref), l_StatusCodes_0 (ref), v15 (copy), v9 (ref)
        local l_actionToRecord_0 = v12.actionToRecord;
        (if v12.conversationId then v16(l_actionToRecord_0, v12.modalSequence, v12.modalId, v12.modalVariant) else v13(v2.rodux.RecordModalSequenceResponse.API(l_actionToRecord_0, v12.modalSequence, v12.modalId))):andThen(function(v19) --[[ Line: 74 ]]
            -- upvalues: l_StatusCodes_0 (ref), v15 (ref)
            if v19 and v19.responseCode == l_StatusCodes_0.OK then
                v15(true);
            end;
        end):catch(function(v20) --[[ Line: 79 ]]
            -- upvalues: v9 (ref), v12 (ref)
            v9:warning((("Error in %* %* -> RecordModalSequenceResponse seen: %*"):format(v12.modalSequence, v12.modalId, (tostring(v20)))));
        end);
    end, {
        v13, 
        v12.actionToRecord, 
        v12.modalId, 
        v12.modalSequence, 
        v12.conversationId, 
        v16
    });
    v3.useEffect(function() --[[ Line: 97 ]]
        -- upvalues: v17 (ref), v12 (copy), l_setTimeout_0 (ref), v21 (copy), l_clearTimeout_0 (ref)
        local v22 = nil;
        if v17 then
            if v12.delayMs and v12.delayMs > 0 then
                v22 = l_setTimeout_0(v21, v12.delayMs);
            else
                v21();
            end;
        end;
        return function() --[[ Line: 106 ]]
            -- upvalues: v22 (ref), l_clearTimeout_0 (ref)
            if v22 then
                l_clearTimeout_0(v22);
            end;
        end;
    end, {
        v12.delayMs, 
        v21, 
        v17
    });
end;