local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_script_FirstAncestor_0.Logger):new("AppChat.paginateForNewerMessages");
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v5 = game:DefineFastInt("AppChatNewMessageFetchMaxDepth", 10);
local function _(v6, v7) --[[ Line: 18 ]] --[[ Name: isMessageAlreadyInConversation ]]
    return v6.messages:Get(v7) ~= nil;
end;
local function v9(v10, v11, v12) --[[ Line: 23 ]] --[[ Name: fetchOlderMessages ]]
    -- upvalues: v5 (copy), v3 (copy), v2 (copy), v9 (copy)
    return function(v13) --[[ Line: 30 ]]
        -- upvalues: v12 (copy), v5 (ref), v3 (ref), v11 (copy), v10 (copy), v2 (ref), v9 (ref)
        if v5 <= v12 then
            v3:warning("Reached max depth {} of fetching new messages", v5);
            return;
        else
            local l_responseBody_0 = v11.responseBody;
            if not l_responseBody_0 then
                return;
            else
                local l_messages_0 = l_responseBody_0.messages;
                local v16 = l_messages_0 and #l_messages_0 > 0 and l_messages_0[#l_messages_0].id or nil;
                if v16 == nil then
                    v3:warning("No messages in response");
                    return;
                else
                    assert(v16, "FFlagLuauTinyControlFlowAnalysis");
                    local v17 = l_responseBody_0.next_cursor and l_responseBody_0.next_cursor ~= "" and l_responseBody_0.next_cursor or nil;
                    if v17 == nil then
                        v3:debug("No more messages to fetch");
                        return;
                    elseif v10.messages:Get(v16) ~= nil then
                        v3:debug("Last message already in conversation, we've caught up");
                        return;
                    else
                        v3:trace("Fetching for the next page of messages using cursor: {}", v17);
                        return v13:dispatch(v2.rodux.GetOlderMessages.API(v10.id, v17)):andThen(function(v18) --[[ Line: 66 ]]
                            -- upvalues: v13 (copy), v9 (ref), v10 (ref), v12 (ref)
                            return v13:dispatch(v9(v10, v18, v12 + 1));
                        end):catch(function(v19) --[[ Line: 69 ]]
                            -- upvalues: v3 (ref)
                            v3:warning("AppChatNetworking failure in fetchOlderMessages of refreshing new messages: {}", v19);
                        end);
                    end;
                end;
            end;
        end;
    end;
end;
return function(v20) --[[ Line: 75 ]]
    -- upvalues: v3 (copy), v2 (copy), v5 (copy), v9 (copy)
    return function(v21) --[[ Line: 76 ]]
        -- upvalues: v3 (ref), v20 (copy), v2 (ref), v5 (ref), v9 (ref)
        v3:info("Starting to fetch newest messages for conversation: {}", v20.id);
        return v21:dispatch(v2.rodux.GetOlderMessages.API(v20.id, nil)):andThen(function(v22) --[[ Line: 82 ]]
            -- upvalues: v21 (copy), v20 (ref), v5 (ref), v3 (ref), v2 (ref), v9 (ref)
            local l_v21_0 = v21;
            local l_v20_0 = v20;
            local v25 = 0;
            return l_v21_0:dispatch(function(v26) --[[ Line: 30 ]]
                -- upvalues: v25 (copy), v5 (ref), v3 (ref), v22 (copy), l_v20_0 (copy), v2 (ref), v9 (ref)
                if v5 <= v25 then
                    v3:warning("Reached max depth {} of fetching new messages", v5);
                    return;
                else
                    local l_responseBody_1 = v22.responseBody;
                    if not l_responseBody_1 then
                        return;
                    else
                        local l_messages_1 = l_responseBody_1.messages;
                        local v29 = l_messages_1 and #l_messages_1 > 0 and l_messages_1[#l_messages_1].id or nil;
                        if v29 == nil then
                            v3:warning("No messages in response");
                            return;
                        else
                            assert(v29, "FFlagLuauTinyControlFlowAnalysis");
                            local v30 = l_responseBody_1.next_cursor and l_responseBody_1.next_cursor ~= "" and l_responseBody_1.next_cursor or nil;
                            if v30 == nil then
                                v3:debug("No more messages to fetch");
                                return;
                            elseif l_v20_0.messages:Get(v29) ~= nil then
                                v3:debug("Last message already in conversation, we've caught up");
                                return;
                            else
                                v3:trace("Fetching for the next page of messages using cursor: {}", v30);
                                return v26:dispatch(v2.rodux.GetOlderMessages.API(l_v20_0.id, v30)):andThen(function(v31) --[[ Line: 66 ]]
                                    -- upvalues: v26 (copy), v9 (ref), l_v20_0 (ref), v25 (ref)
                                    return v26:dispatch(v9(l_v20_0, v31, v25 + 1));
                                end):catch(function(v32) --[[ Line: 69 ]]
                                    -- upvalues: v3 (ref)
                                    v3:warning("AppChatNetworking failure in fetchOlderMessages of refreshing new messages: {}", v32);
                                end);
                            end;
                        end;
                    end;
                end;
            end);
        end):catch(function(v33) --[[ Line: 85 ]]
            -- upvalues: v3 (ref)
            v3:warning("AppChatNetworking failure in refreshing first batch of new messages: {}", v33);
        end);
    end;
end;