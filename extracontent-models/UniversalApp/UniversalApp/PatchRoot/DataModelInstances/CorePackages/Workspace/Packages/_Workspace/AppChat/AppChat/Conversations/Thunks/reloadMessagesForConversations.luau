local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Promise);
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v5 = require(l_script_FirstAncestor_0.Conversations.Actions.ReloadedMessagesForConversations);
local v6 = require(l_script_FirstAncestor_0.Conversations.Thunks.multiGetConversationDetails);
return function(v7) --[[ Line: 10 ]] --[[ Name: reloadMessagesForConversations ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy), v6 (copy)
    return function(v8) --[[ Line: 11 ]]
        -- upvalues: v2 (ref), v7 (copy), v3 (ref), v5 (ref), v6 (ref)
        local l_Conversations_0 = v8:getState().ChatAppReducer.Conversations;
        local v12 = v2.List.filter(v7, function(v10) --[[ Line: 15 ]]
            -- upvalues: l_Conversations_0 (copy)
            local v11 = l_Conversations_0[v10];
            if v11 and v11.source == "channels" then
                return true;
            else
                return false;
            end;
        end);
        if #v12 == 0 then
            return v3.resolve();
        else
            v8:dispatch(v5(v12));
            return v8:dispatch(v6(v12));
        end;
    end;
end;