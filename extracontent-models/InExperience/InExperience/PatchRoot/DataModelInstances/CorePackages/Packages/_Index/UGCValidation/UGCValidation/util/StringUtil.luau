return {
    keysToString = function(v0, v1, v2) --[[ Line: 7 ]] --[[ Name: keysToString ]]
        local v3 = {};
        for v4 in v0 do
            table.insert(v3, (tostring(v4)));
        end;
        if v2 then
            table.sort(v3);
        end;
        return table.concat(v3, v1);
    end
};