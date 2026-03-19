return function(v0) --[[ Line: 2 ]]
    return (v0:gsub("+", " "):gsub("%%(%x%x)", function(v1) --[[ Line: 3 ]]
        return (string.char((tonumber(v1, 16))));
    end));
end;