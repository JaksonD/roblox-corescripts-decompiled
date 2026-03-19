return function(v0) --[[ Line: 4 ]] --[[ Name: splitByNewlines ]]
    local v1 = {};
    for v2 in string.gmatch(v0, "[^\n]+") do
        local v3 = string.match(v2, "^%s*(.-)%s*$");
        if v3 and v3 ~= "" then
            table.insert(v1, v3);
        end;
    end;
    return v1;
end;