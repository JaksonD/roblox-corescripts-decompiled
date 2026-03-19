local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.util.FloatVector);
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4, v5) --[[ Line: 24 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v6 = setmetatable({}, v2);
    if v3 and #v3 > 0 then
        local v7 = v3[1];
        for _, v9 in v3 do
            if not v7:checkCompatible(v9) then
                error("initial simplex has vectors that are not compatible");
            end;
        end;
    else
        error("must provide an initial simplex");
    end;
    v6.simplex = {};
    for _, v11 in v3 do
        table.insert(v6.simplex, v1.new(v11));
    end;
    v6.objectFunction = v4;
    v6.terminateFunction = v5;
    return v6;
end;
v2.evaluate = function(v12) --[[ Line: 51 ]] --[[ Name: evaluate ]]
    -- upvalues: v1 (copy)
    local v13 = false;
    local l_simplex_0 = v12.simplex;
    local v15 = {};
    local function _(v16) --[[ Line: 55 ]]
        -- upvalues: v15 (ref), v12 (copy)
        local v17 = v15[v16];
        if not v17 then
            v17 = v12.objectFunction(v16);
            v15[v16] = v17;
        end;
        return v17;
    end;
    local v19 = 0;
    while not v12.terminateFunction(l_simplex_0, v19) do
        v15 = {};
        table.sort(l_simplex_0, function(v20, v21) --[[ Line: 68 ]]
            -- upvalues: v15 (ref), v12 (copy)
            local v22 = v15[v20];
            if not v22 then
                v22 = v12.objectFunction(v20);
                v15[v20] = v22;
            end;
            local l_v22_0 = v22;
            local v24 = v15[v21];
            if not v24 then
                v24 = v12.objectFunction(v21);
                v15[v21] = v24;
            end;
            return l_v22_0 < v24;
        end);
        local v25 = l_simplex_0[#l_simplex_0];
        local v26 = {};
        for _ = 1, l_simplex_0[1]:getSize() do
            table.insert(v26, 0);
        end;
        local v28 = v1.new(v26);
        for v29 = 1, #l_simplex_0 - 1 do
            v28 = v28 + l_simplex_0[v29];
        end;
        local v30 = v28 / (#l_simplex_0 - 1) - v25;
        local v31 = v25 + v30 * 2;
        local v32 = v15[v31];
        if not v32 then
            v32 = v12.objectFunction(v31);
            v15[v31] = v32;
        end;
        local l_v32_0 = v32;
        local v34 = l_simplex_0[1];
        local v35 = v15[v34];
        if not v35 then
            v35 = v12.objectFunction(v34);
            v15[v34] = v35;
        end;
        if v35 < l_v32_0 then
            v34 = l_simplex_0[#l_simplex_0 - 1];
            v35 = v15[v34];
            if not v35 then
                v35 = v12.objectFunction(v34);
                v15[v34] = v35;
            end;
            if l_v32_0 < v35 then
                l_simplex_0[#l_simplex_0] = v31;
                v13 = true;
            end;
        end;
        if not v13 then
            v34 = l_simplex_0[1];
            v35 = v15[v34];
            if not v35 then
                v35 = v12.objectFunction(v34);
                v15[v34] = v35;
            end;
            if l_v32_0 < v35 then
                v32 = v31 + v30;
                v35 = v15[v32];
                if not v35 then
                    v35 = v12.objectFunction(v32);
                    v15[v32] = v35;
                end;
                if v35 < l_v32_0 then
                    l_simplex_0[#l_simplex_0] = v32;
                else
                    l_simplex_0[#l_simplex_0] = v31;
                end;
            else
                v32 = v25 + v30 * 0.5;
                v34 = v25 + v30 * 1.5;
                v35 = nil;
                local v36 = v15[v32];
                if not v36 then
                    v36 = v12.objectFunction(v32);
                    v15[v32] = v36;
                end;
                local l_v36_0 = v36;
                local v38 = v15[v34];
                if not v38 then
                    v38 = v12.objectFunction(v34);
                    v15[v34] = v38;
                end;
                v35 = if l_v36_0 < v38 then v32 else v34;
                v36 = v35;
                v38 = v15[v36];
                if not v38 then
                    v38 = v12.objectFunction(v36);
                    v15[v36] = v38;
                end;
                l_v36_0 = v38;
                v38 = l_simplex_0[#l_simplex_0 - 1];
                local v39 = v15[v38];
                if not v39 then
                    v39 = v12.objectFunction(v38);
                    v15[v38] = v39;
                end;
                if l_v36_0 < v39 then
                    l_simplex_0[#l_simplex_0] = v35;
                else
                    for v40 = 1, #l_simplex_0 do
                        l_simplex_0[v40] = (l_simplex_0[v40] - l_simplex_0[1]) * 0.8 + l_simplex_0[1];
                    end;
                end;
            end;
        end;
        v13 = false;
        v19 = v19 + 1;
    end;
end;
v2.calculateMaxLengthBetweenVertices = function(v41) --[[ Line: 122 ]] --[[ Name: calculateMaxLengthBetweenVertices ]]
    local v42 = 0;
    for v43 = 1, #v41 - 1 do
        for v44 = v43 + 1, #v41 do
            v42 = math.max(v42, ((v41[v44] - v41[v43]):magnitude()));
        end;
    end;
    return v42;
end;
return v2;