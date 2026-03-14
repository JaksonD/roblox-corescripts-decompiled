return function(v0, v1) --[[ Line: 1 ]]
    return function(v2) --[[ Line: 2 ]]
        -- upvalues: v1 (copy), v0 (copy)
        local v3 = v2:getState();
        if v3.ChatAppReducer.ConversationsAsync.oldestConversationIsFetched then
            return;
        else
            local v4 = 0;
            for _, _ in pairs(v3.ChatAppReducer.Conversations) do
                v4 = v4 + 1;
            end;
            local v7 = math.floor(v4 / v1);
            v0(v7 + 1);
            return;
        end;
    end;
end;