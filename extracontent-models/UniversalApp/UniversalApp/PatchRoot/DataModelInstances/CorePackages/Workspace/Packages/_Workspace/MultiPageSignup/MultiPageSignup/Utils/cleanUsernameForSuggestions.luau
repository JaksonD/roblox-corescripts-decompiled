cleanUsernameForSuggestions = function(v0) --[[ Line: 1 ]] --[[ Name: cleanUsernameForSuggestions ]]
    local v1 = v0:gsub("[^%w_]", "");
    if string.sub(v1, 1, 1) == "_" then
        v1 = v1:sub(2);
    end;
    if string.sub(v1, -1) == "_" then
        v1 = v1:sub(1, -2);
    end;
    local v2 = string.find(v1, "_");
    if v2 and v2 < #v1 then
        v1 = v1:sub(1, v2) .. string.gsub(v1:sub(v2 + 1), "_", "");
    end;
    if #v1 >= 20 then
        v1 = v1:sub(1, 18);
    end;
    return v1;
end;
return cleanUsernameForSuggestions;