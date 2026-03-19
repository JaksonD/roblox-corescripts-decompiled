local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v2 = require(l_script_FirstAncestor_0.Conversations.populateConversationWithState);
local function v5(v3, v4) --[[ Line: 7 ]] --[[ Name: conversationSortPredicate ]]
    if v3.unixTime and v4.unixTime then
        return v3.unixTime > v4.unixTime;
    elseif not v3.unixTime and not v4.unixTime then
        return string.lower(v3.title) < string.lower(v4.title);
    else
        return (v3.unixTime or v4.unixTime) == v3.unixTime;
    end;
end;
local v6 = nil;
local v7 = nil;
return function(v8) --[[ Line: 19 ]]
    -- upvalues: v1 (copy), v6 (ref), v7 (ref), v2 (copy), v5 (copy)
    local v9 = v1(v8, "ChatAppReducer.Conversations");
    if not v9 then
        return {};
    else
        local v10 = v1(v8, "ChatAppReducer.ConversationsAsync.latestMessagesIsFetching");
        if v9 == v6 then
            return v7;
        elseif v10 and v7 then
            return v7;
        else
            local v11 = {};
            for _, v13 in pairs(v9) do
                table.insert(v11, (v2(v8, v13)));
            end;
            table.sort(v11, v5);
            v6 = v9;
            v7 = v11;
            return v11;
        end;
    end;
end;