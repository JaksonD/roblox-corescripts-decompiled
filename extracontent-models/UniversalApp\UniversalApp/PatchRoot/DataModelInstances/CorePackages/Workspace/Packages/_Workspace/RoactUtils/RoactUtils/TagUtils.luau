return {
    combineReactTags = function(...) --[[ Line: 15 ]] --[[ Name: combineReactTags ]]
        local v0 = table.pack(...);
        local v1 = {};
        for v2 = 1, v0.n do
            local v3 = v0[v2];
            if v3 and v3 ~= "" then
                table.insert(v1, v3);
            end;
        end;
        if #v1 > 0 then
            return (table.concat(v1, " "));
        else
            return nil;
        end;
    end
};