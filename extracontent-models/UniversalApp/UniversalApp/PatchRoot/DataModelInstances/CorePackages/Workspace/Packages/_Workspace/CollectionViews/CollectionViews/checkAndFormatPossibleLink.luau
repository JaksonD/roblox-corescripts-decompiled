return function(v0, v1, v2, v3, v4) --[[ Line: 7 ]] --[[ Name: checkAndFormatPossibleLink ]]
    if v0 == nil or v0 == "" or typeof(v0) ~= "string" then
        return false, v0;
    else
        assert(v0 ~= nil, "Text can't be nil");
        assert(typeof(v0) == "string", "Text must be a string");
        local v5 = v1 or "{linkStart}";
        local v6 = v2 or "{linkEnd}";
        local v7 = v3 or "<u><b>";
        local v8 = v4 or "</b></u>";
        local v9 = false;
        if string.find(v0, v5) ~= nil then
            v9 = string.find(v0, v6) ~= nil;
        end;
        if v9 then
            return v9, (string.gsub(v0, v5, v7):gsub(v6, v8));
        else
            return v9, v0;
        end;
    end;
end;