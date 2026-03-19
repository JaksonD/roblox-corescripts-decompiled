return function(v0) --[[ Line: 1 ]]
    if not v0 or v0 == "" then
        return false;
    else
        assert(v0, "");
        local v1 = string.find(v0, "^%+*[%d%-%s%.%(%)]+$") ~= nil;
        local v2 = #v0:gsub("[^%d]", "") >= 6;
        return v1 and v2;
    end;
end;