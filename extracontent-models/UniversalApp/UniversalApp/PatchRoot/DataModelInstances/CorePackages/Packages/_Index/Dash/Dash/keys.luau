local l_insert_0 = table.insert;
return function(v1) --[[ Line: 12 ]] --[[ Name: keys ]]
    -- upvalues: l_insert_0 (copy)
    local v2 = {};
    for v3, _ in v1 do
        l_insert_0(v2, v3);
    end;
    return v2;
end;