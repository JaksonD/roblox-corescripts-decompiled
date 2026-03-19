local function v2(v0, v1) --[[ Line: 1 ]] --[[ Name: defaultCompareFn ]]
    return v0.value < v1.value;
end;
return function(v3, v4) --[[ Line: 5 ]] --[[ Name: sortTableByValue ]]
    -- upvalues: v2 (copy)
    local v5 = {};
    local v6 = v4 or v2;
    for v7, v8 in v3 do
        table.insert(v5, {
            key = v7, 
            value = v8
        });
    end;
    table.sort(v5, v6);
    return v5;
end;