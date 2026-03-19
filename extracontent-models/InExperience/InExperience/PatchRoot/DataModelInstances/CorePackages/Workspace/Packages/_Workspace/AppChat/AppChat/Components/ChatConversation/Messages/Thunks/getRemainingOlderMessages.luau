local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_script_FirstAncestor_0.Http.RoduxNetworking);
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v6 = require(l_script_FirstAncestor_0.Components.ChatConversation.Utils.getNewestWithNilPreviousMessageId);
return function(v7, v8) --[[ Line: 11 ]]
    -- upvalues: v5 (copy), v4 (copy), v2 (copy), v3 (copy), v6 (copy)
    v5:info("Maybe getting older messages for {}", v8);
    return function(v9) --[[ Line: 13 ]]
        -- upvalues: v4 (ref), v8 (copy), v2 (ref), v3 (ref), v5 (ref), v6 (ref), v7 (copy)
        local l_ChatAppReducer_0 = v9:getState().ChatAppReducer;
        if not l_ChatAppReducer_0 or not l_ChatAppReducer_0.Conversations then
            return v4.resolve();
        else
            local v11 = l_ChatAppReducer_0.Conversations[v8];
            local v12 = v2.rodux.GetOlderMessages.getStatus(v9:getState(), v8) == v3.Enum.NetworkStatus.Fetching;
            if not v11 then
                v5:info("Canceling since conversation id {} is not in local state", v8);
                return v4.resolve();
            elseif v12 then
                v5:info("Canceling since we are already fetching older messages for conversation id {}", v8);
                return v4.resolve();
            elseif v11.fetchedOldestMessage then
                v5:info("Canceling since we have already fetched the oldest message for conversation id {}", v8);
                return v4.resolve();
            else
                local v13 = v6(v11.messages);
                return v7(v8, v13, v11.nextCursor);
            end;
        end;
    end;
end;