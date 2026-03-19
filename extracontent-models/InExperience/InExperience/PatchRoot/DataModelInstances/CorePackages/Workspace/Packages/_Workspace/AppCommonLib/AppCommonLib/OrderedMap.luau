local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2, ...) --[[ Line: 51 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v3 = {
        keys = {}, 
        values = {}, 
        getId = v1, 
        sortPredicate = v2
    };
    setmetatable(v3, v0);
    v0._InsertInPlace(v3, ...);
    return v3;
end;
v0.Get = function(v4, v5) --[[ Line: 69 ]] --[[ Name: Get ]]
    return v4.values[v5];
end;
v0.GetByIndex = function(v6, v7) --[[ Line: 76 ]] --[[ Name: GetByIndex ]]
    local v8 = v6.keys[v7];
    if v8 == nil then
        return nil;
    else
        return v6.values[v8];
    end;
end;
v0.GetIds = function(v9) --[[ Line: 89 ]] --[[ Name: GetIds ]]
    return v9.keys;
end;
v0.Length = function(v10) --[[ Line: 96 ]] --[[ Name: Length ]]
    return #v10.keys;
end;
v0.Delete = function(v11, ...) --[[ Line: 109 ]] --[[ Name: Delete ]]
    -- upvalues: v0 (copy)
    local v12 = v0.new(v11.getId, v11.sortPredicate);
    local v13 = select("#", ...);
    for v14, v15 in pairs(v11.values) do
        v12.values[v14] = v15;
    end;
    for v16 = 1, v13 do
        local v17 = select(v16, ...);
        v12.values[v17] = nil;
    end;
    for _, v19 in ipairs(v11.keys) do
        if v12.values[v19] ~= nil then
            v12.keys[#v12.keys + 1] = v19;
        end;
    end;
    return v12;
end;
v0.Insert = function(v20, ...) --[[ Line: 143 ]] --[[ Name: Insert ]]
    -- upvalues: v0 (copy)
    local v21 = v20:_Copy();
    v0._InsertInPlace(v21, ...);
    return v21;
end;
v0.First = function(v22) --[[ Line: 154 ]] --[[ Name: First ]]
    if v22.keys[1] then
        return v22:Get(v22.keys[1]);
    else
        return nil;
    end;
end;
v0.Last = function(v23) --[[ Line: 164 ]] --[[ Name: Last ]]
    local v24 = #v23.keys;
    if v23.keys[v24] then
        return v23:Get(v23.keys[v24]);
    else
        return nil;
    end;
end;
v0.CreateIterator = function(v25) --[[ Line: 181 ]] --[[ Name: CreateIterator ]]
    local v26 = 0;
    local v27 = #v25.keys;
    return function() --[[ Line: 186 ]]
        -- upvalues: v26 (ref), v27 (copy), v25 (copy)
        v26 = v26 + 1;
        if v26 <= v27 then
            local v28 = v25.keys[v26];
            return v28, v25.values[v28], v26;
        else
            return nil, nil, nil;
        end;
    end;
end;
v0.CreateReverseIterator = function(v29) --[[ Line: 206 ]] --[[ Name: CreateReverseIterator ]]
    local v30 = #v29.keys + 1;
    return function() --[[ Line: 210 ]]
        -- upvalues: v30 (ref), v29 (copy)
        v30 = v30 - 1;
        if v30 > 0 then
            local v31 = v29.keys[v30];
            return v31, v29.values[v31], v30;
        else
            return nil, nil, nil;
        end;
    end;
end;
v0.Map = function(v32, v33) --[[ Line: 233 ]] --[[ Name: Map ]]
    -- upvalues: v0 (copy)
    local v34 = v0.new(v32.getId, v32.sortPredicate);
    for v35, v36 in v32:CreateIterator() do
        v34:_InsertInPlaceUnsorted(v33(v36, v35));
    end;
    v34:_Sort();
    return v34;
end;
v0.Merge = function(v37, ...) --[[ Line: 260 ]] --[[ Name: Merge ]]
    local v38 = nil;
    for v39 = 1, select("#", ...) do
        local v40 = select(v39, ...);
        if v40:Length() > 0 then
            if not v38 then
                v38 = v37:_Copy();
            end;
            for _, v42 in v40:CreateIterator() do
                v38:_InsertInPlaceUnsorted(v42);
            end;
        end;
    end;
    if v38 then
        v38:_Sort();
        return v38;
    else
        return v37;
    end;
end;
v0._Copy = function(v43) --[[ Line: 289 ]] --[[ Name: _Copy ]]
    -- upvalues: v0 (copy)
    local v44 = v0.new(v43.getId, v43.sortPredicate);
    for v45, v46 in ipairs(v43.keys) do
        v44.keys[v45] = v46;
    end;
    for v47, v48 in pairs(v43.values) do
        v44.values[v47] = v48;
    end;
    return v44;
end;
v0._InsertInPlaceUnsorted = function(v49, ...) --[[ Line: 309 ]] --[[ Name: _InsertInPlaceUnsorted ]]
    for v50 = 1, select("#", ...) do
        local v51 = select(v50, ...);
        local v52 = v49.getId(v51);
        if not v49.values[v52] then
            table.insert(v49.keys, v52);
        end;
        v49.values[v52] = v51;
    end;
end;
v0._Sort = function(v53) --[[ Line: 328 ]] --[[ Name: _Sort ]]
    table.sort(v53.keys, function(v54, v55) --[[ Line: 329 ]]
        -- upvalues: v53 (copy)
        local v56 = v53.values[v54];
        local v57 = v53.values[v55];
        return v53.sortPredicate(v56, v57);
    end);
end;
v0._InsertInPlace = function(v58, ...) --[[ Line: 342 ]] --[[ Name: _InsertInPlace ]]
    v58:_InsertInPlaceUnsorted(...);
    v58:_Sort();
end;
return v0;