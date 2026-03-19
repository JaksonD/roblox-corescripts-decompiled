local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(script.Parent.processConversations);
local v4 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v5 = require(l_script_FirstAncestor_0.Logger);
return function(v6) --[[ Line: 15 ]]
    -- upvalues: v5 (copy), v2 (copy), v3 (copy), v4 (copy)
    return function(v7) --[[ Line: 16 ]]
        -- upvalues: v5 (ref), v6 (copy), v2 (ref), v3 (ref), v4 (ref)
        v5:info("Fetching latest conversation details for conversationId: {}", v6);
        return v7:dispatch(v2.rodux.GetConversationDetails.API(v6)):andThen(function(v8) --[[ Line: 20 ]]
            -- upvalues: v7 (copy), v3 (ref), v4 (ref)
            local l_responseBody_0 = v8.responseBody;
            assert(l_responseBody_0.conversations and #l_responseBody_0.conversations == 1, "Expected exactly one conversation in response body");
            v7:dispatch(v3(l_responseBody_0.conversations));
            return v4.fromChannelsApi(l_responseBody_0.conversations[1]);
        end):catch(function(v10) --[[ Line: 31 ]]
            -- upvalues: v5 (ref)
            v5:warning("Failure in fetchLatestConversationDetails, Status: " .. tostring(v10));
        end);
    end;
end;