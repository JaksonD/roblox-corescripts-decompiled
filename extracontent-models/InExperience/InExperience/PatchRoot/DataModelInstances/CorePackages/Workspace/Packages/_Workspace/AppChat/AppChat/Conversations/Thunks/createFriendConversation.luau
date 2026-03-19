local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v2 = require(script.Parent.createConversation);
local v3 = require(l_script_FirstAncestor_0.Conversations.getOtherParticipants);
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v5 = require(l_script_FirstAncestor_0.Conversations.Actions.FriendConversationCreated);
return function(v6, v7) --[[ Line: 9 ]] --[[ Name: createFriendConversation ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy), v5 (copy)
    return function(v8) --[[ Line: 10 ]]
        -- upvalues: v6 (copy), v1 (ref), v3 (ref), v2 (ref), v7 (copy), v5 (ref)
        local v9 = v8:getState();
        local v10 = v9.ChatAppReducer.Conversations[v6];
        if not v10 then
            v1:error("Could not find friendConversationId {} in store state. Unable to create converstation.", v6);
            return;
        else
            local v11 = v3(v10, v9.LocalUserId);
            if #v11 > 1 then
                v1:error("friendConversationId {} has more than 2 participants. Unable to create one-to-one conversation.", v6);
                return;
            else
                local v12 = tostring(v11[1]);
                return v8:dispatch(v2("one_to_one", {
                    v12
                }, v7, "userSentMessageToFriendPlaceholder")):tap(function(v13) --[[ Line: 41 ]]
                    -- upvalues: v8 (copy), v5 (ref), v6 (ref)
                    v8:dispatch(v5({
                        newConversationId = v13.id, 
                        oldFriendConversationId = v6
                    }));
                end);
            end;
        end;
    end;
end;