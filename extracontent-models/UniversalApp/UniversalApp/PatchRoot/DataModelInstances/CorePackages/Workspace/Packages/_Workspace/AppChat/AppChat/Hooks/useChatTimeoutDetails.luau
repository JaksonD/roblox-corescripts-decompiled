local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.installReducer.ChatTimeouts);
local v3 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v6 = require(l_script_FirstAncestor_0.Utils.getDeepValue2);
local v7 = require(l_Parent_0.LuauPolyfill);
local l_clearTimeout_0 = v7.clearTimeout;
local l_setTimeout_0 = v7.setTimeout;
local v10 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v11 = require(l_script_FirstAncestor_0.Conversations.Actions.CurrentConversationTimeoutEnded);
return function(v12) --[[ Line: 20 ]] --[[ Name: useChatTimeoutDetails ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v6 (copy), v10 (copy), v3 (copy), l_setTimeout_0 (copy), v11 (copy), l_clearTimeout_0 (copy)
    local l_conversationId_0 = v12.conversationId;
    local v14 = l_useDispatch_0();
    local v16 = l_useSelector_0(function(v15) --[[ Line: 23 ]]
        -- upvalues: v6 (ref), l_conversationId_0 (copy)
        return {
            userTimeout = v6(v15, "ChatAppReducer.ChatTimeouts.userTimeout"), 
            conversationTimeout = v6(v15, (("ChatAppReducer.ChatTimeouts.byConversationId.%*"):format(l_conversationId_0)))
        };
    end);
    local l_UnixTimestamp_0 = DateTime.now().UnixTimestamp;
    local v18 = v16.userTimeout and v16.userTimeout.endTimestamp or 0;
    local v19 = v16.conversationTimeout and v16.conversationTimeout.endTimestamp or 0;
    local v20 = math.max(v18, v19);
    local v21 = false;
    if l_UnixTimestamp_0 < v20 then
        v21 = v12.conversationModerationType ~= v10.ModerationType.TrustedComms;
    end;
    local v22 = if v18 < v19 then v16.conversationTimeout and v16.conversationTimeout.decisionEventId else v16.userTimeout and v16.userTimeout.decisionEventId;
    local v23 = if v18 < v19 then v16.conversationTimeout and v16.conversationTimeout.duration else v16.userTimeout and v16.userTimeout.duration;
    v3.useEffect(function() --[[ Line: 44 ]]
        -- upvalues: v21 (copy), l_setTimeout_0 (ref), v14 (copy), v11 (ref), l_conversationId_0 (copy), v20 (copy), l_UnixTimestamp_0 (copy), l_clearTimeout_0 (ref)
        local v24 = nil;
        if v21 then
            v24 = l_setTimeout_0(function() --[[ Line: 47 ]]
                -- upvalues: v14 (ref), v11 (ref), l_conversationId_0 (ref)
                v14(v11(l_conversationId_0));
            end, (v20 - l_UnixTimestamp_0 + 1) * 1000);
        end;
        return function() --[[ Line: 51 ]]
            -- upvalues: v24 (ref), l_clearTimeout_0 (ref)
            if v24 then
                l_clearTimeout_0(v24);
            end;
        end;
    end, {
        v21, 
        v20, 
        v12.conversationId
    });
    return {
        isTimedOut = v21, 
        timeoutEndTimestamp = v20, 
        decisionEventId = v22, 
        duration = v23
    };
end;