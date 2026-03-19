local l_insert_0 = table.insert;
return function(v1) --[[ Line: 9 ]] --[[ Name: reverse ]]
    -- upvalues: l_insert_0 (copy)
    local v2 = {};
    for v3 = #v1, 1, -1 do
        l_insert_0(v2, v1[v3]);
    end;
    return v2;
end;