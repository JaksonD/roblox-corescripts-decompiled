return {
    TableConcat = function(v0, v1) --[[ Line: 12 ]] --[[ Name: TableConcat ]]
        for v2 = 1, #v1 do
            v0[#v0 + 1] = v1[v2];
        end;
        return v0;
    end, 
    SortByName = function(v3) --[[ Line: 21 ]] --[[ Name: SortByName ]]
        table.sort(v3, function(v4, v5) --[[ Line: 22 ]] --[[ Name: compareInstanceNames ]]
            return v4.Name < v5.Name;
        end);
        return v3;
    end
};