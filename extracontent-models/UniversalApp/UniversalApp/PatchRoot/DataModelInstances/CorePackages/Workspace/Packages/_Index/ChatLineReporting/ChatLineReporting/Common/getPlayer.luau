return function(v0, v1) --[[ Line: 11 ]] --[[ Name: getPlayer ]]
    for _, v3 in pairs(v0) do
        if v3.userId == v1 then
            return v3;
        end;
    end;
    return nil;
end;