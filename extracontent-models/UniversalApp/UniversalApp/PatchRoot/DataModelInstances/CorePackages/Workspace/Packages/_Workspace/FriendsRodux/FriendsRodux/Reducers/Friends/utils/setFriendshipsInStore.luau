local l_Parent_0 = script:FindFirstAncestor("FriendsRodux").Parent;
local v1 = require(l_Parent_0.llama);
local v2 = require(script.Parent.addUser);
local v3 = require(script.Parent.removeUser);
difference = function(v4, v5) --[[ Line: 8 ]] --[[ Name: difference ]]
    local v6 = {};
    for _, v8 in pairs(v4) do
        v6[v8] = true;
    end;
    for _, v10 in pairs(v5) do
        v6[v10] = nil;
    end;
    local v11 = {};
    local v12 = 0;
    for _, v14 in pairs(v4) do
        if v6[v14] then
            v12 = v12 + 1;
            v11[v12] = v14;
        end;
    end;
    return v11;
end;
return function(v15, v16) --[[ Line: 33 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local v17 = tostring(v16.namedIds.users);
    local v18 = v15[v17] or {};
    local v20 = v1.List.map(v1.Dictionary.values(v16.responseBody.data), function(v19) --[[ Line: 37 ]]
        return (tostring(v19.id));
    end);
    local v21 = difference(v20, v18);
    local v22 = difference(v18, v20);
    for _, v24 in pairs(v21) do
        v15 = v1.Dictionary.join(v15, {
            [v17] = v2(v15[v17], v24), 
            [v24] = v2(v15[v24], v17)
        });
    end;
    for _, v26 in pairs(v22) do
        v15 = v1.Dictionary.join(v15, {
            [v17] = v3(v15[v17], v26), 
            [v26] = v3(v15[v26], v17)
        });
    end;
    for v27, v28 in pairs(v15) do
        if v1.isEmpty(v28) then
            v15[v27] = nil;
        end;
    end;
    return v15;
end;