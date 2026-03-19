local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v4 = require(script.Parent.Parent.parseNewConversationResponse);
return function(v5, v6, v7, v8) --[[ Line: 16 ]]
    -- upvalues: v2 (copy), v4 (copy)
    return function(v9) --[[ Line: 22 ]]
        -- upvalues: v2 (ref), v5 (copy), v6 (copy), v4 (ref), v7 (copy), v8 (copy)
        return v9:dispatch(v2.rodux.CreateConversation.API(v5, v6)):andThen(function(v10) --[[ Line: 25 ]]
            -- upvalues: v4 (ref), v7 (ref), v8 (ref)
            return v4(v10.responseBody.conversations and v10.responseBody.conversations[1], v7, v8);
        end);
    end;
end;