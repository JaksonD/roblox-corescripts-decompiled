local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_script_FirstAncestor_0.Conversations.Actions.RemovedConversation);
local v5 = require(l_Parent_0.AppChatNetworking);
local l_FFlagGroupOSAGetConversationParticipants_0 = require(l_script_FirstAncestor_0.Flags).FFlagGroupOSAGetConversationParticipants;
return v3.createReducer({}, {
    [v5.rodux.GetConversationsParticipantsMetadata.Succeeded.name] = function(v7, v8) --[[ Line: 26 ]]
        -- upvalues: l_FFlagGroupOSAGetConversationParticipants_0 (copy), v2 (copy)
        for v9, v10 in v8.responseBody.conversation_participants_metadata do
            local v11 = {};
            for v12, v13 in v10.participants_metadata do
                local v14 = {
                    isPending = v13.is_pending
                };
                if l_FFlagGroupOSAGetConversationParticipants_0 then
                    v14.isBlocked = v13.is_blocked;
                    v14.isInviter = v13.is_inviter;
                    v14.isInvited = v13.is_invited;
                end;
                v11[v12] = v14;
            end;
            v7 = v2.Dictionary.join(v7, {
                [v9] = v11
            });
        end;
        return v7;
    end, 
    [v4.name] = function(v15, v16) --[[ Line: 50 ]]
        -- upvalues: v2 (copy)
        local l_conversationId_0 = v16.conversationId;
        if not l_conversationId_0 then
            return v15;
        else
            return v2.Dictionary.join(v15, {
                [l_conversationId_0] = v2.None
            });
        end;
    end
});