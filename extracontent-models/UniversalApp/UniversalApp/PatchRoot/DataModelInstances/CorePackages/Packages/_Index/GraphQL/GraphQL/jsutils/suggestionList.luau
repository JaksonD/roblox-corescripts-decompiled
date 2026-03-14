local l_Parent_0 = script.Parent.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_naturalCompare_0 = require(script.Parent.naturalCompare).naturalCompare;
local v3 = {};
local function v16(v4, v5) --[[ Line: 34 ]] --[[ Name: suggestionList ]]
    -- upvalues: v3 (copy), l_Object_0 (copy), l_naturalCompare_0 (copy)
    local v6 = {};
    local v7 = v3.new(v4);
    local v8 = math.floor(v4:len() * 0.4) + 1;
    for v9 = 1, #v5 do
        local v10 = v5[v9];
        local v11 = v7:measure(v10, v8);
        if v11 ~= nil then
            v6[v10] = v11;
        end;
    end;
    local v12 = l_Object_0.keys(v6);
    table.sort(v12, function(v13, v14) --[[ Line: 49 ]]
        -- upvalues: v6 (copy), l_naturalCompare_0 (ref)
        local v15 = v6[v13] - v6[v14];
        if v15 ~= 0 then
            return v15 < 0;
        else
            return l_naturalCompare_0(v13, v14) < 0;
        end;
    end);
    return v12;
end;
local v17 = nil;
v3.__index = v3;
v3.new = function(v18) --[[ Line: 78 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v17 (ref)
    local v19 = setmetatable({}, v3);
    v19._input = v18;
    v19._inputLowerCase = v18:lower();
    v19._inputArray = v17(v19._inputLowerCase);
    local v20 = v18:len();
    v19._rows = {
        table.create(v20 + 1, 0), 
        table.create(v20 + 1, 0), 
        table.create(v20 + 1, 0)
    };
    return v19;
end;
v3.measure = function(v21, v22, v23) --[[ Line: 93 ]] --[[ Name: measure ]]
    -- upvalues: v17 (ref)
    if v21._input == v22 then
        return 0;
    else
        local v24 = v22:lower();
        if v21._inputLowerCase == v24 then
            return 1;
        else
            local v25 = v17(v24);
            local l__inputArray_0 = v21._inputArray;
            if #v25 < #l__inputArray_0 then
                local l_v25_0 = v25;
                v25 = l__inputArray_0;
                l__inputArray_0 = l_v25_0;
            end;
            local v28 = #v25;
            local v29 = #l__inputArray_0;
            if v23 < v28 - v29 then
                return nil;
            else
                local l__rows_0 = v21._rows;
                for v31 = 0, v29 do
                    l__rows_0[1][v31 + 1] = v31;
                end;
                for v32 = 1, v28 do
                    local v33 = l__rows_0[(v32 - 1) % 3 + 1];
                    local v34 = l__rows_0[v32 % 3 + 1];
                    v34[1] = v32;
                    local l_v32_0 = v32;
                    for v36 = 1, v29 do
                        local v37 = v25[v32] == l__inputArray_0[v36] and 0 or 1;
                        local v38 = math.min(v33[v36 + 1] + 1, v34[v36] + 1, v33[v36] + v37);
                        if v32 > 1 and v36 > 1 and v25[v32] == l__inputArray_0[v36 - 1] and v25[v32 - 1] == l__inputArray_0[v36] then
                            v38 = math.min(v38, l__rows_0[(v32 - 2) % 3 + 1][v36 - 1] + 1);
                        end;
                        if v38 < l_v32_0 then
                            l_v32_0 = v38;
                        end;
                        v34[v36 + 1] = v38;
                    end;
                    if v23 < l_v32_0 then
                        return nil;
                    end;
                end;
                local v39 = l__rows_0[v28 % 3 + 1][v29 + 1];
                if v39 <= v23 then
                    return v39;
                else
                    return nil;
                end;
            end;
        end;
    end;
end;
v17 = function(v40) --[[ Line: 168 ]] --[[ Name: stringToArray ]]
    local v41 = v40:len();
    local v42 = {};
    for v43 = 1, v41 do
        v42[v43] = v40:byte(v43);
    end;
    return v42;
end;
return {
    suggestionList = v16
};