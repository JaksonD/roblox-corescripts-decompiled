return function(v0, v1, v2) --[[ Line: 3 ]] --[[ Name: PlayerSearchPredicate ]]
    if v0 == nil or v0 == "" then
        return true;
    else
        if v2 then
            local v3 = utf8.nfdnormalize(v2);
            local v4 = utf8.nfdnormalize(v0);
            if string.find(v3:lower(), v4:lower(), 1, true) ~= nil then
                return true;
            end;
        end;
        return string.find(v1:lower(), v0:lower(), 1, true) ~= nil;
    end;
end;