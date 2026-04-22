return function(v0, v1, v2) --[[ Line: 3 ]]
    local l_TextSource_0 = v0.TextSource;
    if not l_TextSource_0 then
        return false;
    elseif v2 and l_TextSource_0.UserId == v2 then
        return false;
    else
        local v4 = string.lower(l_TextSource_0.Username or "");
        local v5 = string.lower(l_TextSource_0.DisplayName or "");
        return v4 ~= "" and v1.isUsernameMuted(v4) or v5 ~= "" and v1.isDisplayNameMuted(v5);
    end;
end;