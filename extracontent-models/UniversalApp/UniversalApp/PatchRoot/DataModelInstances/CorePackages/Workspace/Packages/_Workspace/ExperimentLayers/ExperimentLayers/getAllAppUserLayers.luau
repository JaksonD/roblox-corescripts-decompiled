local l_Parent_0 = script:FindFirstAncestor("ExperimentLayers").Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(script.Parent.AppUserLayers);
local v3 = game:DefineFastString("IxpNewLayersForRegistration", "");
local function v8(v4, v5) --[[ Line: 21 ]] --[[ Name: findNextKey ]]
    if not v4[v5] then
        v4[v5] = true;
        return v5;
    else
        for v6 = 2, 100 do
            local v7 = v5 .. "_" .. v6;
            if not v4[v7] then
                v4[v7] = true;
                return v7;
            end;
        end;
        error("Exceeded max index for next key search: " .. v5);
        return;
    end;
end;
return function(v9) --[[ Line: 37 ]] --[[ Name: getAllAppUserLayers ]]
    -- upvalues: v3 (copy), v2 (copy), v1 (copy), v8 (copy)
    local v10 = v9 or v3;
    if #v10 == 0 then
        return v2;
    else
        local v11 = v1.copy(v2);
        local v12 = {};
        local v13 = {};
        for v14, v15 in v11 do
            v12[v14] = true;
            v13[v15] = true;
        end;
        local v16 = string.split(v10, ",");
        for _, v18 in (v1.map(v16, v1.trim)) do
            if not v13[v18] then
                v13[v18] = true;
                v11[v8(v12, v18)] = v18;
            end;
        end;
        return v11;
    end;
end;