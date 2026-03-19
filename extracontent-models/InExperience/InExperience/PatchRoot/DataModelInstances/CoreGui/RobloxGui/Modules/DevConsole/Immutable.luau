return {
    JoinDictionaries = function(...) --[[ Line: 10 ]] --[[ Name: JoinDictionaries ]]
        local v0 = {};
        for v1 = 1, select("#", ...) do
            local v2 = select(v1, ...);
            for v3, v4 in pairs(v2) do
                v0[v3] = v4;
            end;
        end;
        return v0;
    end, 
    JoinLists = function(...) --[[ Line: 26 ]] --[[ Name: JoinLists ]]
        local v5 = {};
        for v6 = 1, select("#", ...) do
            local v7 = select(v6, ...);
            local v8 = #v5;
            for v9 = 1, #v7 do
                v5[v8 + v9] = v7[v9];
            end;
        end;
        return v5;
    end, 
    Set = function(v10, v11, v12) --[[ Line: 44 ]] --[[ Name: Set ]]
        local v13 = {};
        for v14, v15 in pairs(v10) do
            v13[v14] = v15;
        end;
        v13[v11] = v12;
        return v13;
    end, 
    Append = function(v16, ...) --[[ Line: 59 ]] --[[ Name: Append ]]
        local v17 = {};
        local v18 = #v16;
        for v19 = 1, v18 do
            v17[v19] = v16[v19];
        end;
        for v20 = 1, select("#", ...) do
            v17[v18 + v20] = select(v20, ...);
        end;
        return v17;
    end, 
    RemoveFromDictionary = function(v21, ...) --[[ Line: 77 ]] --[[ Name: RemoveFromDictionary ]]
        local v22 = {};
        for v23, v24 in pairs(v21) do
            local v25 = false;
            for v26 = 1, select("#", ...) do
                if v23 == select(v26, ...) then
                    v25 = true;
                    break;
                end;
            end;
            if not v25 then
                v22[v23] = v24;
            end;
        end;
        return v22;
    end, 
    RemoveFromList = function(v27, v28) --[[ Line: 99 ]] --[[ Name: RemoveFromList ]]
        local v29 = {};
        for v30 = 1, #v27 do
            if v30 ~= v28 then
                table.insert(v29, v27[v30]);
            end;
        end;
        return v29;
    end, 
    RemoveRangeFromList = function(v31, v32, v33) --[[ Line: 114 ]] --[[ Name: RemoveRangeFromList ]]
        local v34 = {};
        for v35 = 1, #v31 do
            if v35 < v32 or v32 + v33 <= v35 then
                table.insert(v34, v31[v35]);
            end;
        end;
        return v34;
    end, 
    RemoveValueFromList = function(v36, v37) --[[ Line: 129 ]] --[[ Name: RemoveValueFromList ]]
        local v38 = {};
        for v39 = 1, #v36 do
            if v36[v39] ~= v37 then
                table.insert(v38, v36[v39]);
            end;
        end;
        return v38;
    end
};