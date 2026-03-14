local v0 = game:DefineFastFlag("ImmutableJoinDictionariesUseTableClone", false);
return {
    JoinDictionaries = function(...) --[[ Line: 12 ]] --[[ Name: JoinDictionaries ]]
        -- upvalues: v0 (copy)
        local v1 = select("#", ...);
        if v0 and v1 > 0 then
            local v2 = table.clone(select(1, ...));
            for v3 = 2, v1 do
                for v4, v5 in (select(v3, ...)) do
                    v2[v4] = v5;
                end;
            end;
            return v2;
        else
            local v6 = {};
            for v7 = 1, v1 do
                local v8 = select(v7, ...);
                for v9, v10 in pairs(v8) do
                    v6[v9] = v10;
                end;
            end;
            return v6;
        end;
    end, 
    JoinLists = function(...) --[[ Line: 44 ]] --[[ Name: JoinLists ]]
        local v11 = {};
        for v12 = 1, select("#", ...) do
            local v13 = select(v12, ...);
            local v14 = #v11;
            for v15 = 1, #v13 do
                v11[v14 + v15] = v13[v15];
            end;
        end;
        return v11;
    end, 
    Set = function(v16, v17, v18) --[[ Line: 62 ]] --[[ Name: Set ]]
        local v19 = table.clone(v16);
        v19[v17] = v18;
        return v19;
    end, 
    Append = function(v20, ...) --[[ Line: 71 ]] --[[ Name: Append ]]
        local v21 = {};
        local v22 = #v20;
        for v23 = 1, v22 do
            v21[v23] = v20[v23];
        end;
        for v24 = 1, select("#", ...) do
            v21[v22 + v24] = select(v24, ...);
        end;
        return v21;
    end, 
    RemoveFromDictionary = function(v25, ...) --[[ Line: 89 ]] --[[ Name: RemoveFromDictionary ]]
        local v26 = {};
        for v27, v28 in pairs(v25) do
            local v29 = false;
            for v30 = 1, select("#", ...) do
                if v27 == select(v30, ...) then
                    v29 = true;
                    break;
                end;
            end;
            if not v29 then
                v26[v27] = v28;
            end;
        end;
        return v26;
    end, 
    RemoveFromList = function(v31, v32) --[[ Line: 111 ]] --[[ Name: RemoveFromList ]]
        local v33 = {};
        for v34 = 1, #v31 do
            if v34 ~= v32 then
                table.insert(v33, v31[v34]);
            end;
        end;
        return v33;
    end, 
    RemoveRangeFromList = function(v35, v36, v37) --[[ Line: 126 ]] --[[ Name: RemoveRangeFromList ]]
        local v38 = {};
        for v39 = 1, #v35 do
            if v39 < v36 or v36 + v37 <= v39 then
                table.insert(v38, v35[v39]);
            end;
        end;
        return v38;
    end, 
    RemoveValueFromList = function(v40, v41) --[[ Line: 141 ]] --[[ Name: RemoveValueFromList ]]
        local v42 = {};
        for v43 = 1, #v40 do
            if v40[v43] ~= v41 then
                table.insert(v42, v40[v43]);
            end;
        end;
        return v42;
    end
};