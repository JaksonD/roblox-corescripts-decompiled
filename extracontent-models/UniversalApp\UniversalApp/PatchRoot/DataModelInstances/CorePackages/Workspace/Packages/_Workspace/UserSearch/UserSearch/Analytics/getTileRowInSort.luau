return function(v0, v1, v2) --[[ Line: 1 ]]
    if not v0 or not v1 or not v2 or v2 == 0 then
        return nil;
    else
        return v1 + math.ceil(v0 / v2) - 1;
    end;
end;