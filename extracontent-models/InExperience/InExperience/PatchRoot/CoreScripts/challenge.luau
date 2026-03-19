local v0, v1 = ...;
arg0 = v0;
arg1 = v1;
v0 = function(v2, v3) --[[ Line: 6 ]] --[[ Name: x1 ]]
    return v2 + v3;
end;
v1 = function(v4, v5) --[[ Line: 7 ]] --[[ Name: x2 ]]
    return v4 - v5;
end;
local function v8(v6, v7) --[[ Line: 8 ]] --[[ Name: x3 ]]
    return v7 - v6;
end;
local function v11(v9, v10) --[[ Line: 9 ]] --[[ Name: x4 ]]
    return (tonumber(tostring(v10 % 1000) .. tostring((math.abs(v9 % 1000)))));
end;
local function v14(v12, v13) --[[ Line: 10 ]] --[[ Name: x5 ]]
    return (tonumber(tostring(v13 % 1337) .. tostring((math.abs(v12 % 1337)))));
end;
local function v17(v15, v16) --[[ Line: 11 ]] --[[ Name: x6 ]]
    return v15 % 1000 * (v16 % 1000);
end;
local function v20(v18, v19) --[[ Line: 12 ]] --[[ Name: x7 ]]
    return v18 % 1337 * (v19 % 1337);
end;
local function v25(v21, v22) --[[ Line: 13 ]] --[[ Name: x8 ]]
    local v23 = v21 + v22;
    local v24 = v21 - v22;
    return v23 % 1000 * (v24 % 1000);
end;
local v26 = {
    1, 
    2, 
    3, 
    4, 
    5, 
    6, 
    7, 
    8
};
local v27 = Random.new(5);
for _ = 1, 32 do
    local v29 = v27:NextInteger(1, 8);
    local v30 = v27:NextInteger(1, 8);
    local v31 = v26[v29];
    v26[v29] = v26[v30];
    v26[v30] = v31;
end;
local v32 = {
    [v26[1]] = v0, 
    [v26[2]] = v1, 
    [v26[3]] = v8, 
    [v26[4]] = v11, 
    [v26[5]] = v14, 
    [v26[6]] = v17, 
    [v26[7]] = v20, 
    [v26[8]] = v25
};
return ((function(v33, v34) --[[ Line: 35 ]] --[[ Name: x9 ]]
    -- upvalues: v32 (copy)
    local v35 = 393;
    local v36 = 1;
    for _ = 1, 16 do
        v35 = (v35 + v32[math.abs(v34 + v35 + v36) % 8 + 1](v35 + v33, v34)) % 10000000;
        v36 = v36 + 1;
    end;
    return v35;
end)(arg0, arg1));