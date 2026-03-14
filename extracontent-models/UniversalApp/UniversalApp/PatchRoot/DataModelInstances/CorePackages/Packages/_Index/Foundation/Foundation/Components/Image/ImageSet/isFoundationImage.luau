return function(v0) --[[ Line: 1 ]] --[[ Name: isFoundationImage ]]
    local v1 = false;
    if v0 ~= nil then
        v1 = false;
        if v0 ~= "" then
            v1 = v0:match("^%w+://.*$") == nil;
        end;
    end;
    return v1;
end;