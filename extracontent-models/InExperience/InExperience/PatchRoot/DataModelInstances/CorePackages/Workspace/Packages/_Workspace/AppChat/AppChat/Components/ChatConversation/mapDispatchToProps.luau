local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Messages_0 = script.Parent.Messages;
local v3 = require(l_Messages_0.NetworkRequests.getOlderMessages);
local v4 = require(l_Messages_0.NetworkRequests.markConversationAsRead);
local v5 = require(l_Messages_0.Thunks.sendTextMessage);
local v6 = require(l_Messages_0.Thunks.getRemainingOlderMessages);
local v7 = require(l_Messages_0.NetworkRequests.updateTypingStatus);
local v8 = require(l_script_FirstAncestor_0.Conversations.Thunks.createFriendConversation);
local v9 = require(l_script_FirstAncestor_0.Logger);
local v10 = require(l_Parent_0.AppChatNetworking);
return function(v11) --[[ Line: 16 ]]
    -- upvalues: v3 (copy), v6 (copy), v5 (copy), v8 (copy), v4 (copy), v7 (copy), v10 (copy), v9 (copy)
    local function v16(v12, v13, v14, _) --[[ Line: 17 ]]
        -- upvalues: v11 (copy), v3 (ref)
        return v11(v3(v12, v13, v14));
    end;
    return {
        getOlderMessages = function(v17, _) --[[ Line: 22 ]] --[[ Name: getOlderMessages ]]
            -- upvalues: v11 (copy), v6 (ref), v16 (copy)
            return v11(v6(v16, v17));
        end, 
        sendMessage = function(v19, v20, v21) --[[ Line: 25 ]] --[[ Name: sendMessage ]]
            -- upvalues: v11 (copy), v5 (ref)
            return v11(v5(v19, v20, v21));
        end, 
        createFriendConversation = function(v22, v23) --[[ Line: 28 ]] --[[ Name: createFriendConversation ]]
            -- upvalues: v11 (copy), v8 (ref)
            return v11(v8(v22, v23));
        end, 
        markConversationAsRead = function(v24) --[[ Line: 31 ]] --[[ Name: markConversationAsRead ]]
            -- upvalues: v11 (copy), v4 (ref)
            v11(v4(v24));
        end, 
        postTypingStatus = function(v25, _) --[[ Line: 34 ]] --[[ Name: postTypingStatus ]]
            -- upvalues: v11 (copy), v7 (ref)
            return v11(v7(v25));
        end, 
        getUnreadConversationCount = function() --[[ Line: 39 ]] --[[ Name: getUnreadConversationCount ]]
            -- upvalues: v11 (copy), v10 (ref), v9 (ref)
            return v11(v10.rodux.GetConversationMetadata.API()):catch(function(v27) --[[ Line: 40 ]]
                -- upvalues: v9 (ref)
                v9:error((("Failure in GetConversationMetadata. Error: %*"):format((tostring(v27)))));
            end);
        end
    };
end;