return function(v0, v1, v2) --[[ Line: 13 ]] --[[ Name: getOrSet ]]
    if v0[v1] == nil then
        v0[v1] = v2(v0, v1);
    end;
    return v0[v1];
end;