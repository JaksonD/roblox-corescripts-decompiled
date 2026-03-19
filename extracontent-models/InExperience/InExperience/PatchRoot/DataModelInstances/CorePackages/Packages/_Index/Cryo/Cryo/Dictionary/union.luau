return function(v0, v1) --[[ Line: 2 ]] --[[ Name: union ]]
    local v2 = table.clone(v0);
    for v3, v4 in v1 do
        v2[v3] = v4;
    end;
    return v2;
end;