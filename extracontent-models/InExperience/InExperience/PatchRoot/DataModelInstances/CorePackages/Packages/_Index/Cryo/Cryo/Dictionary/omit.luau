return function(v0, ...) --[[ Line: 6 ]] --[[ Name: omit ]]
    local v1 = table.clone(v0);
    for _, v3 in {
        ...
    } do
        v1[v3] = nil;
    end;
    return v1;
end;