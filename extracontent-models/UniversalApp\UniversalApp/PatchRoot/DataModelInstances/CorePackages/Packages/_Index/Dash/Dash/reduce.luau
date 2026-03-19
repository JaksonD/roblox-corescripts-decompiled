return function(v0, v1, v2) --[[ Line: 14 ]] --[[ Name: reduce ]]
    local l_v2_0 = v2;
    for v4, v5 in v0 do
        l_v2_0 = v1(l_v2_0, v5, v4);
    end;
    return l_v2_0;
end;