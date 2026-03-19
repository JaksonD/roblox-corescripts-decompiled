local l_insert_0 = table.insert;
return function(v1, v2) --[[ Line: 10 ]] --[[ Name: splitOn ]]
    -- upvalues: l_insert_0 (copy)
    local v3 = {};
    local v4 = {};
    local v5 = 1;
    if not v2 then
        for v6 = 1, #v1 do
            l_insert_0(v3, v1:sub(v6, v6));
        end;
        return v3;
    else
        local v7, v8 = v1:find(v2, v5);
        while v7 do
            l_insert_0(v4, v1:sub(v7, v8));
            l_insert_0(v3, v1:sub(v5, v7 - 1));
            v5 = v8 + 1;
            local v9, v10 = v1:find(v2, v5);
            v7 = v9;
            v8 = v10;
        end;
        l_insert_0(v3, v1:sub(v5));
        return v3, v4;
    end;
end;