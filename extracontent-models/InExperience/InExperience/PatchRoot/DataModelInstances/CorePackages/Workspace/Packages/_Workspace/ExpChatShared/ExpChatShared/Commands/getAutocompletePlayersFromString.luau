local l_Parent_0 = script:FindFirstAncestor("ExpChatShared").Parent;
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_List_0 = require(l_Parent_0.llama).List;
return function(v3, v4) --[[ Line: 12 ]] --[[ Name: getAutocompletePlayersFromString ]]
    -- upvalues: l_Dictionary_0 (copy), l_List_0 (copy)
    local v5 = {};
    v4 = string.lower(v4);
    if string.sub(v4, 1, 1) == "@" then
        local v6 = string.sub(v4, 2);
        v5 = l_Dictionary_0.values(l_Dictionary_0.filter(v3.byUsername, function(_, v8) --[[ Line: 17 ]]
            -- upvalues: v6 (copy)
            return string.find(v8, "^" .. v6) ~= nil;
        end));
    else
        local l_v4_0 = v4;
        local v12 = l_Dictionary_0.filter(v3.byDisplayName, function(_, v11) --[[ Line: 22 ]]
            -- upvalues: l_v4_0 (copy)
            return string.find(v11, "^" .. l_v4_0) ~= nil;
        end);
        for _, v14 in pairs(v12) do
            for _, v16 in ipairs(v14) do
                table.insert(v5, v16);
            end;
        end;
    end;
    return l_List_0.map(v5, function(v17) --[[ Line: 33 ]]
        -- upvalues: v3 (copy)
        return v3.byUserId[tostring(v17)];
    end);
end;