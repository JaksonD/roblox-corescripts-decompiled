local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v2 = require(l_script_FirstAncestor_0.Models.Conversation);
local function _(v3, v4, v5) --[[ Line: 10 ]] --[[ Name: set ]]
    if v3[v4] == v5 then
        return v3;
    else
        local v6 = table.clone(v3);
        v6[v4] = v5;
        return v6;
    end;
end;
local function v14(v8, v9, v10) --[[ Line: 22 ]] --[[ Name: updateConversationMessages ]]
    local v11 = {};
    for v12, v13 in v8[v10]:CreateIterator() do
        if not v9[v10]:Get(v12) then
            table.insert(v11, v13);
        end;
    end;
    if #v11 > 0 then
        v9[v10] = v9[v10]:Insert(table.unpack(v11));
    end;
end;
local function _(v15, v16, v17) --[[ Line: 40 ]] --[[ Name: updateConversationField ]]
    if v16[v17] == nil then
        v16[v17] = v15[v17];
    end;
end;
return function(v19, v20) --[[ Line: 50 ]] --[[ Name: updateConversationToState ]]
    -- upvalues: v2 (copy), v14 (copy)
    if v20.conversationType == v2.Type.ONE_TO_ONE_CONVERSATION then
        local v21 = v2.IdForFakeOneOnOne(v20.participants);
        if v19[v21] ~= nil and v19[v21] ~= v20 then
            local l_v19_0 = v19;
            if l_v19_0[v21] == nil then
                v19 = l_v19_0;
            else
                local v23 = table.clone(l_v19_0);
                v23[v21] = nil;
                v19 = v23;
            end;
        end;
    end;
    local l_v19_1 = v19;
    local l_id_0 = v20.id;
    local v26;
    if l_v19_1[l_id_0] == v20 then
        v26 = l_v19_1;
    else
        local v27 = table.clone(l_v19_1);
        v27[l_id_0] = v20;
        v26 = v27;
    end;
    l_v19_1 = v19[v20.id];
    l_id_0 = v26[v20.id];
    if l_id_0 and l_v19_1 then
        v14(l_v19_1, l_id_0, "messages");
        v14(l_v19_1, l_id_0, "sendingMessages");
        if l_id_0.previousCursor == nil then
            l_id_0.previousCursor = l_v19_1.previousCursor;
        end;
        if l_id_0.nextCursor == nil then
            l_id_0.nextCursor = l_v19_1.nextCursor;
        end;
        if l_id_0.fetchedOldestMessage == nil then
            l_id_0.fetchedOldestMessage = l_v19_1.fetchedOldestMessage;
        end;
    end;
    return v26;
end;