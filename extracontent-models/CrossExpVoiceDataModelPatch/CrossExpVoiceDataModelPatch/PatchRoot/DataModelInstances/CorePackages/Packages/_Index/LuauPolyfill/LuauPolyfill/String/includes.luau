local v0 = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])";
return function(v1, v2, v3) --[[ Line: 6 ]] --[[ Name: includes ]]
    -- upvalues: v0 (copy)
    local v4, v5 = utf8.len(v1);
    assert(v4 ~= nil, ("string `%s` has an invalid byte at position %s"):format(v1, (tostring(v5))));
    if v4 == 0 then
        return false;
    elseif #v2 == 0 then
        return true;
    else
        local v6 = 1;
        if v3 ~= nil then
            v6 = tonumber(v3) or 1;
            if v4 < v6 then
                return false;
            end;
        end;
        if v6 < 1 then
            v6 = 1;
        end;
        local v7 = utf8.offset(v1, v6);
        local v8 = v2:gsub(v0, "%%%1");
        local v9, _ = string.find(v1, v8, v7);
        return v9 ~= nil;
    end;
end;