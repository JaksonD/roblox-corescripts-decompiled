local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_script_FirstAncestor_0.Conversations.Actions.RemovedConversation);
local v5 = require(l_script_FirstAncestor_0.Conversations.Actions.CurrentConversationTimeoutEnded);
local v6 = require(l_Parent_0.AppChatNetworking);
local v7 = {
    userTimeout = {}, 
    byConversationId = {}
};
local function v12(v8) --[[ Line: 33 ]] --[[ Name: serializeChatTimeoutRange ]]
    local v9 = DateTime.now();
    local l_UnixTimestamp_0 = (DateTime.fromIsoDate(v8.start_time) or v9).UnixTimestamp;
    local l_UnixTimestamp_1 = (DateTime.fromIsoDate(v8.end_time) or v9).UnixTimestamp;
    return {
        endTimestamp = math.clamp(v9.UnixTimestamp + v8.time_remaining, -17987443200, 253402300799), 
        decisionEventId = v8.decision_event_id, 
        duration = math.clamp(l_UnixTimestamp_1 - l_UnixTimestamp_0, 0, 253402300799)
    };
end;
return (v3.createReducer(v7, {
    [v6.rodux.GetChatModerationStatuses.Succeeded.name] = function(v13, v14) --[[ Line: 45 ]]
        -- upvalues: v12 (copy), v2 (copy)
        local l_responseBody_0 = v14.responseBody;
        if l_responseBody_0.user_timeout_range then
            local v16 = v12(l_responseBody_0.user_timeout_range);
            v13 = v2.Dictionary.join(v13, {
                userTimeout = v16
            });
        end;
        if l_responseBody_0.conversation_timeout_ranges then
            for _, v18 in l_responseBody_0.conversation_timeout_ranges do
                local l_id_0 = v18.id;
                local v20 = v12(v18.timeout_range);
                v13 = v2.Dictionary.join(v13, {
                    byConversationId = v2.Dictionary.join(v13.byConversationId, {
                        [l_id_0] = v20
                    })
                });
            end;
        end;
        return v13;
    end, 
    [v4.name] = function(v21, v22) --[[ Line: 66 ]]
        -- upvalues: v2 (copy)
        local l_conversationId_0 = v22.conversationId;
        return v2.Dictionary.join(v21, {
            byConversationId = v2.Dictionary.join(v21.byConversationId, {
                [l_conversationId_0] = v2.None
            })
        });
    end, 
    [v5.name] = function(v24, v25) --[[ Line: 74 ]]
        -- upvalues: v2 (copy)
        local l_v24_0 = v24;
        local l_UnixTimestamp_2 = DateTime.now().UnixTimestamp;
        if v24.userTimeout and v24.userTimeout.endTimestamp and v24.userTimeout.endTimestamp < l_UnixTimestamp_2 then
            l_v24_0 = v2.Dictionary.join(l_v24_0, {
                userTimeout = {}
            });
        end;
        local l_conversationId_1 = v25.conversationId;
        if not v24.byConversationId[l_conversationId_1] or not v24.byConversationId[l_conversationId_1].endTimestamp or l_UnixTimestamp_2 <= v24.byConversationId[l_conversationId_1].endTimestamp then
            return l_v24_0;
        else
            return v2.Dictionary.join(l_v24_0, {
                byConversationId = v2.Dictionary.join(l_v24_0.byConversationId, {
                    [l_conversationId_1] = v2.None
                })
            });
        end;
    end
}));