local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Promise);
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v5 = require(l_script_FirstAncestor_0.Conversations.Actions.ReloadedMessagesForConversations);
local v6 = require(l_script_FirstAncestor_0.Conversations.Thunks.multiGetConversationDetails);
local v7 = game:DefineFastFlag("AppChatReloadMessagesForEmptyConversation", false);
return function(v8) --[[ Line: 12 ]] --[[ Name: reloadMessagesForConversations ]]
    -- upvalues: v2 (copy), v7 (copy), v3 (copy), v5 (copy), v6 (copy)
    return function(v9) --[[ Line: 13 ]]
        -- upvalues: v2 (ref), v8 (copy), v7 (ref), v3 (ref), v5 (ref), v6 (ref)
        local l_Conversations_0 = v9:getState().ChatAppReducer.Conversations;
        local v13 = v2.List.filter(v8, function(v11) --[[ Line: 17 ]]
            -- upvalues: l_Conversations_0 (copy), v7 (ref)
            local v12 = l_Conversations_0[v11];
            if v12 and v12.source == "channels" and (v7 or v12.messages and v12.messages.Length and v12.messages:Length() > 0) then
                return true;
            else
                return false;
            end;
        end);
        if #v13 == 0 then
            return v3.resolve();
        else
            v9:dispatch(v5(v13));
            return v9:dispatch(v6(v13));
        end;
    end;
end;