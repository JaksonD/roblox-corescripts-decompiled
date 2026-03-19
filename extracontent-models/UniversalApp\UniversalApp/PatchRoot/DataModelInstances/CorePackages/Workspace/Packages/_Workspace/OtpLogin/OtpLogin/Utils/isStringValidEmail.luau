return function(v0) --[[ Line: 1 ]]
    if not v0 or v0 == "" then
        return false;
    else
        assert(v0, "");
        return string.find(v0, "^.+@.+%..+$") ~= nil;
    end;
end;