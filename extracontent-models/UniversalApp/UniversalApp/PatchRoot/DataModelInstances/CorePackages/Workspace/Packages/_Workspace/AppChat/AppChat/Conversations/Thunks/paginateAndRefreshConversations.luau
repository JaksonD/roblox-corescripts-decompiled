local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v4 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v5 = require(l_script_FirstAncestor_0.Conversations.hasConversationChanged);
local v6 = require(l_script_FirstAncestor_0.Conversations.getShouldRefetchMessages);
local v7 = require(l_script_FirstAncestor_0.Logger):new("paginateAndRefreshConversations");
local v8 = require(l_script_FirstAncestor_0.Conversations.Thunks.paginateForNewerMessages);
local function v9(v10) --[[ Line: 27 ]] --[[ Name: paginateAndRefreshConversations ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy)
    return function(v11) --[[ Line: 28 ]]
        -- upvalues: v2 (ref), v10 (copy), v3 (ref), v4 (ref), v5 (ref), v6 (ref), v7 (ref), v8 (ref), v9 (ref)
        local v12 = v11:getState();
        return v11:dispatch(v2.rodux.GetUserConversations.API(v10)):andThen(function(v13) --[[ Line: 35 ]]
            -- upvalues: v3 (ref), v12 (copy), v4 (ref), v5 (ref), v6 (ref), v7 (ref), v11 (copy), v8 (ref), v9 (ref)
            for _, v15 in v13.responseBody.conversations do
                local v16 = v3(v12, (("ChatAppReducer.Conversations.%*"):format((tostring(v15.id)))));
                local v17 = v4.fromChannelsApi(v15);
                if v5({
                    new = v17, 
                    existing = v16
                }) then
                    if v6({
                        new = v17, 
                        existing = v16
                    }) then
                        v7:debug("Fetching missing messages for conversation: {}", v17.id);
                        v11:dispatch(v8(v17));
                    end;
                else
                    return;
                end;
            end;
            local l_next_cursor_0 = v13.responseBody.next_cursor;
            if l_next_cursor_0 and l_next_cursor_0 ~= "" and typeof(l_next_cursor_0) == "string" then
                return v11:dispatch(v9(l_next_cursor_0));
            else
                return;
            end;
        end):catch(function(v19) --[[ Line: 63 ]]
            warn("Failure in paginateAndRefreshConversations: ", (tostring(v19)));
            return v19;
        end);
    end;
end;
return function() --[[ Line: 70 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy)
    return function(v20) --[[ Line: 71 ]]
        -- upvalues: v2 (ref), v3 (ref), v4 (ref), v5 (ref), v6 (ref), v7 (ref), v8 (ref), v9 (ref)
        local v21 = nil;
        return v20:dispatch(function(v22) --[[ Line: 28 ]]
            -- upvalues: v2 (ref), v21 (copy), v3 (ref), v4 (ref), v5 (ref), v6 (ref), v7 (ref), v8 (ref), v9 (ref)
            local v23 = v22:getState();
            return v22:dispatch(v2.rodux.GetUserConversations.API(v21)):andThen(function(v24) --[[ Line: 35 ]]
                -- upvalues: v3 (ref), v23 (copy), v4 (ref), v5 (ref), v6 (ref), v7 (ref), v22 (copy), v8 (ref), v9 (ref)
                for _, v26 in v24.responseBody.conversations do
                    local v27 = v3(v23, (("ChatAppReducer.Conversations.%*"):format((tostring(v26.id)))));
                    local v28 = v4.fromChannelsApi(v26);
                    if v5({
                        new = v28, 
                        existing = v27
                    }) then
                        if v6({
                            new = v28, 
                            existing = v27
                        }) then
                            v7:debug("Fetching missing messages for conversation: {}", v28.id);
                            v22:dispatch(v8(v28));
                        end;
                    else
                        return;
                    end;
                end;
                local l_next_cursor_1 = v24.responseBody.next_cursor;
                if l_next_cursor_1 and l_next_cursor_1 ~= "" and typeof(l_next_cursor_1) == "string" then
                    return v22:dispatch(v9(l_next_cursor_1));
                else
                    return;
                end;
            end):catch(function(v30) --[[ Line: 63 ]]
                warn("Failure in paginateAndRefreshConversations: ", (tostring(v30)));
                return v30;
            end);
        end);
    end;
end;