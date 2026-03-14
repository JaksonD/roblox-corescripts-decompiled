local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(l_Parent_0.ReactIs);
local function _(v3) --[[ Line: 7 ]] --[[ Name: isTableNotBinding ]]
    -- upvalues: v2 (copy)
    local v4 = false;
    if type(v3) == "table" then
        v4 = not v2.isBinding(v3);
    end;
    return v4;
end;
local function v6(v7, v8) --[[ Line: 11 ]] --[[ Name: deepJoin ]]
    -- upvalues: v2 (copy), v6 (copy)
    local v9 = table.clone(v7);
    for v10, v11 in v8 do
        local v12 = false;
        if type(v11) == "table" then
            v12 = not v2.isBinding(v11);
        end;
        if v12 then
            local v13 = v9[v10];
            v12 = false;
            if type(v13) == "table" then
                v12 = not v2.isBinding(v13);
            end;
            if v12 then
                v9[v10] = v6(v9[v10], v11);
                continue;
            end;
        end;
        v9[v10] = v11;
    end;
    return v9;
end;
return function(v14, v15) --[[ Line: 23 ]] --[[ Name: withDefaults ]]
    -- upvalues: v6 (copy), v1 (copy)
    local v16 = {};
    if type(v14) == "table" and type(v15) == "table" then
        for v17, _ in v15 do
            v16[v17] = v14[v17];
        end;
    end;
    local v19 = v6(v15, v16);
    return (v1.union(v14, v19));
end;