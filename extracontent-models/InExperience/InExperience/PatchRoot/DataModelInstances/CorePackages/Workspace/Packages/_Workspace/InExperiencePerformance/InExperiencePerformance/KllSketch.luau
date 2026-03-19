local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        levels = {
            table.create(v1)
        }, 
        weightedSketch = {
            weightTuples = {}, 
            totalWeight = 0, 
            cached = false
        }, 
        maxSize = if v1 % 2 == 0 then v1 else v1 - 1
    }, v0));
end;
v0.insert = function(v2, v3) --[[ Line: 36 ]] --[[ Name: insert ]]
    v2.weightedSketch.cached = false;
    local l_levels_0 = v2.levels;
    table.insert(l_levels_0[1], v3);
    for v5, v6 in l_levels_0 do
        if #v6 >= v2.maxSize then
            compressWeightedKll(l_levels_0, v5);
        end;
    end;
end;
compressWeightedKll = function(v7, v8) --[[ Line: 51 ]] --[[ Name: compressWeightedKll ]]
    local v9 = v7[v8];
    table.sort(v9);
    local v10 = table.create(#v9 // 2);
    for v11 = 1, #v9, 2 do
        table.insert(v10, v9[math.random(2) - 1 + v11]);
    end;
    if v8 == #v7 then
        table.insert(v7, v10);
    else
        table.move(v10, 1, #v10, #v7[v8 + 1] + 1, v7[v8 + 1]);
    end;
    table.clear(v7[v8]);
end;
v0.generateWeightedSketch = function(v12) --[[ Line: 77 ]] --[[ Name: generateWeightedSketch ]]
    local v13 = {};
    local v14 = 1;
    local v15 = 0;
    for _, v17 in v12.levels do
        for _, v19 in v17 do
            table.insert(v13, {
                value = v19, 
                weight = v14
            });
            v15 = v15 + v14;
        end;
        v14 = v14 * 2;
    end;
    table.sort(v13, function(v20, v21) --[[ Line: 94 ]]
        return v20.value < v21.value;
    end);
    v12.weightedSketch = {
        weightTuples = v13, 
        totalWeight = v15, 
        cached = true
    };
end;
v0.getPercentile = function(v22, v23) --[[ Line: 106 ]] --[[ Name: getPercentile ]]
    if not v22.weightedSketch.cached then
        v22:generateWeightedSketch();
    end;
    if #v22.weightedSketch.weightTuples > 0 then
        local v24 = math.floor(v23 / 100 * v22.weightedSketch.totalWeight);
        local v25 = 0;
        for _, v27 in v22.weightedSketch.weightTuples do
            v25 = v25 + v27.weight;
            if v24 <= v25 then
                return v27.value;
            end;
        end;
    end;
    return 0;
end;
return v0;