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
    JoinLists = function(...) --[[ Line: 29 ]] --[[ Name: JoinLists ]]
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
    Set = function(v10, v11, v12) --[[ Line: 47 ]] --[[ Name: Set ]]
        local v13 = table.clone(v10);
        v13[v11] = v12;
        return v13;
    end, 
    Append = function(v14, ...) --[[ Line: 56 ]] --[[ Name: Append ]]
        local v15 = {};
        local v16 = #v14;
        for v17 = 1, v16 do
            v15[v17] = v14[v17];
        end;
        for v18 = 1, select("#", ...) do
            v15[v16 + v18] = select(v18, ...);
        end;
        return v15;
    end, 
    RemoveFromDictionary = function(v19, ...) --[[ Line: 74 ]] --[[ Name: RemoveFromDictionary ]]
        local v20 = {};
        for v21, v22 in pairs(v19) do
            local v23 = false;
            for v24 = 1, select("#", ...) do
                if v21 == select(v24, ...) then
                    v23 = true;
                    break;
                end;
            end;
            if not v23 then
                v20[v21] = v22;
            end;
        end;
        return v20;
    end, 
    RemoveFromList = function(v25, v26) --[[ Line: 96 ]] --[[ Name: RemoveFromList ]]
        local v27 = {};
        for v28 = 1, #v25 do
            if v28 ~= v26 then
                table.insert(v27, v25[v28]);
            end;
        end;
        return v27;
    end, 
    RemoveRangeFromList = function(v29, v30, v31) --[[ Line: 111 ]] --[[ Name: RemoveRangeFromList ]]
        local v32 = {};
        for v33 = 1, #v29 do
            if v33 < v30 or v30 + v31 <= v33 then
                table.insert(v32, v29[v33]);
            end;
        end;
        return v32;
    end, 
    RemoveValueFromList = function(v34, v35) --[[ Line: 126 ]] --[[ Name: RemoveValueFromList ]]
        local v36 = {};
        for v37 = 1, #v34 do
            if v34[v37] ~= v35 then
                table.insert(v36, v34[v37]);
            end;
        end;
        return v36;
    end
};