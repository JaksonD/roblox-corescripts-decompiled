local function v6(v0) --[[ Line: 5 ]] --[[ Name: deduplicateBodyColor3s ]]
    local v1 = {};
    local v2 = {};
    for _, v4 in v0 do
        local v5 = tostring(v4);
        if not v2[v5] then
            table.insert(v1, v4);
            v2[v5] = true;
        end;
    end;
    return v1;
end;
return function(v7) --[[ Line: 23 ]] --[[ Name: generateColorSequence ]]
    -- upvalues: v6 (copy)
    local v8 = v6(v7);
    local v9 = #v8;
    if v9 == 1 then
        local v10 = v8[1];
        return ColorSequence.new(v10, v10);
    else
        local v11 = {};
        local v12 = 1 / (v9 - 1 + 1.6);
        for v13, v14 in v8 do
            local v15 = nil;
            v15 = v13 == 1 and 0 or v13 == v9 and 1 or (v13 - 1 + 0.8) * v12;
            table.insert(v11, ColorSequenceKeypoint.new(v15, v14));
        end;
        return ColorSequence.new(v11);
    end;
end;