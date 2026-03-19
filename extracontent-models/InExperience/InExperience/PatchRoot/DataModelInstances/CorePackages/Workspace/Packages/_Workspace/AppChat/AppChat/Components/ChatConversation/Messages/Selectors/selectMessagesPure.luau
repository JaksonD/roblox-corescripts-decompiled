local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Components.ChatConversation.Utils.messageSortPredicate);
local v5 = require(l_script_FirstAncestor_0.Components.ChatConversation.Utils.filterForLinksWithPolicy);
local v6 = require(l_script_FirstAncestor_0.Conversations.populateMessageWithState);
local _ = require(l_Parent_0.AppChatNetworking);
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatHandleAgeChange);
return function(v9, v10) --[[ Line: 85 ]] --[[ Name: selectMessagesPure ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v8 (copy)
    local l_conversation_0 = v9.conversation;
    if not l_conversation_0 then
        return {
            itemList = {}, 
            previousMessagesState = v10.previousMessagesState, 
            previousSendingMessagesState = v10.previousSendingMessagesState, 
            previousMessagesResult = v10.previousMessagesResult
        };
    else
        local l_messages_0 = l_conversation_0.messages;
        local l_sendingMessages_0 = l_conversation_0.sendingMessages;
        local l_conversationId_0 = v9.conversationId;
        local v15 = v10.previousMessagesState[l_conversationId_0];
        local v16 = v10.previousSendingMessagesState[l_conversationId_0];
        local v17 = v10.previousMessagesResult[l_conversationId_0];
        if not l_messages_0 then
            return {
                itemList = v17 or {}, 
                previousMessagesState = v10.previousMessagesState, 
                previousSendingMessagesState = v10.previousSendingMessagesState, 
                previousMessagesResult = v10.previousMessagesResult
            };
        elseif l_messages_0 == v15 and l_sendingMessages_0 == v16 then
            return {
                itemList = v17 or {}, 
                previousMessagesState = v10.previousMessagesState, 
                previousSendingMessagesState = v10.previousSendingMessagesState, 
                previousMessagesResult = v10.previousMessagesResult
            };
        else
            local v18 = v2(l_messages_0, "values");
            local v19 = if l_sendingMessages_0 then v2(l_sendingMessages_0, "values") else {};
            v18 = v3.Dictionary.join(v18, v19);
            local v20 = v3.List.sort(v3.Dictionary.values(v18), v4);
            local v21 = {};
            local v22 = table.clone(v17 or {});
            local v23 = if #v22 > 0 and v22[#v22].sent then v22[#v22].sent:GetUnixTimestamp() else 1e999;
            local v24 = if #v22 > 0 and v22[#v22].id then v22[#v22].id else "";
            local v25 = 0;
            for v26, v27 in v20 do
                local v28 = not not v19[v27.id];
                local v29 = v5(v27);
                for v30, v31 in v29 do
                    local v32 = v29[v30 + 1] or v20[v26 + 1];
                    local v33 = {
                        Users = v9.Users, 
                        LocalUserId = v9.localUserId
                    };
                    local v34 = v6(v33, v31, v27.id, l_conversation_0, v21[#v21], v28, v32);
                    local _ = nil;
                    if not (v34.sent and v34.sent:GetUnixTimestamp() < v23 or if v34.sent then v34.sent:GetUnixTimestamp() == v23 and (v24 == "" or if v34.id then v24 < v34.id else false) else false) then
                        v25 = v25 + 1;
                    end;
                    v34.stable_key = ("%*_%*"):format(v34.stableKey or v34.messageId, v30);
                    table.insert(v21, v34);
                end;
            end;
            if not v8 and v25 < #v22 then
                return {
                    itemList = v17 or {}, 
                    previousMessagesState = v10.previousMessagesState, 
                    previousSendingMessagesState = v10.previousSendingMessagesState, 
                    previousMessagesResult = v10.previousMessagesResult
                };
            else
                local v36 = table.clone(v10.previousMessagesState);
                local v37 = table.clone(v10.previousSendingMessagesState);
                local v38 = table.clone(v10.previousMessagesResult);
                v36[l_conversationId_0] = l_messages_0;
                v37[l_conversationId_0] = l_sendingMessages_0;
                v38[l_conversationId_0] = v3.List.reverse(v21);
                return {
                    itemList = v38[l_conversationId_0], 
                    previousMessagesState = v36, 
                    previousSendingMessagesState = v37, 
                    previousMessagesResult = v38
                };
            end;
        end;
    end;
end;