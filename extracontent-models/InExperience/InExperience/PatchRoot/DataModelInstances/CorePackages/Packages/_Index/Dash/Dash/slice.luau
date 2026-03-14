local l_insert_0 = table.insert;
return function(v1, v2, v3) --[[ Line: 19 ]] --[[ Name: slice ]]
    -- upvalues: l_insert_0 (copy)
    local v4 = {};
    local v5 = v2 or 1;
    local v6 = v3 or #v1;
    if v5 < 0 then
        v5 = #v1 + v5;
    end;
    if v6 and v6 < 0 then
        v6 = #v1 + v6;
    end;
    for v7 = v5, v6 do
        l_insert_0(v4, v1[v7]);
    end;
    return v4;
end;