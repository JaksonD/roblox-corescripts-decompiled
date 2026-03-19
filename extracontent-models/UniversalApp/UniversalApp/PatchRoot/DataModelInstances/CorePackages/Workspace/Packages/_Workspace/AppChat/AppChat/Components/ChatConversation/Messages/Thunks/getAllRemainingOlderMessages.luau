local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_script_FirstAncestor_0.Http.RoduxNetworking);
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v6 = require(l_script_FirstAncestor_0.Components.ChatConversation.Utils.getNewestWithNilPreviousMessageId);
local v7 = game:DefineFastInt("AppChatMessageFetchRetryDelayMs", 500);
local function v8(v9, v10, v11, v12, v13) --[[ Line: 15 ]] --[[ Name: fetchNextBatch ]]
    -- upvalues: v5 (copy), v4 (copy), v2 (copy), v3 (copy), v7 (copy), v8 (copy), v6 (copy)
    if v12 <= v13 then
        v5:info("Max depth reached ({}), stopping recursive message fetching", v13);
        return v4.resolve();
    else
        local l_ChatAppReducer_0 = v9:getState().ChatAppReducer;
        if not l_ChatAppReducer_0 or not l_ChatAppReducer_0.Conversations then
            v5:info("No conversations in state, stopping recursive message fetching");
            return v4.resolve();
        else
            local v15 = l_ChatAppReducer_0.Conversations[v11];
            if not v15 then
                v5:info("Conversation not found, stopping recursive message fetching");
                return v4.resolve();
            elseif v15.fetchedOldestMessage then
                v5:info("Already fetched oldest message, stopping recursive message fetching");
                return v4.resolve();
            elseif v2.rodux.GetOlderMessages.getStatus(v9:getState(), v11) == v3.Enum.NetworkStatus.Fetching then
                v5:info("Messages are currently being fetched, waiting before trying again");
                return v4.delay(v7 / 1000):andThen(function() --[[ Line: 51 ]]
                    -- upvalues: v8 (ref), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy)
                    return v8(v9, v10, v11, v12, v13);
                end);
            else
                local v16 = v6(v15.messages);
                v5:info("Fetching batch {} of older messages for conversation {}", v13, v11);
                return v9:dispatch(v10(v11, v16, v15.nextCursor)):andThen(function() --[[ Line: 61 ]]
                    -- upvalues: v5 (ref), v13 (copy), v8 (ref), v9 (copy), v10 (copy), v11 (copy), v12 (copy)
                    v5:info("Fetched batch {}, continuing to fetch next batch", v13);
                    return v8(v9, v10, v11, v12, v13 + 1);
                end);
            end;
        end;
    end;
end;
return function(v17, v18, v19) --[[ Line: 67 ]]
    -- upvalues: v5 (copy), v8 (copy), v4 (copy)
    v5:info("Starting to fetch all remaining older messages for conversation {}", v18);
    return function(v20) --[[ Line: 69 ]]
        -- upvalues: v8 (ref), v17 (copy), v18 (copy), v19 (copy), v5 (ref), v4 (ref)
        return v8(v20, v17, v18, v19, 0):catch(function(v21) --[[ Line: 70 ]]
            -- upvalues: v5 (ref), v4 (ref)
            v5:warning("Error fetching all remaining older messages: {}", v21);
            return v4.reject(v21);
        end);
    end;
end;