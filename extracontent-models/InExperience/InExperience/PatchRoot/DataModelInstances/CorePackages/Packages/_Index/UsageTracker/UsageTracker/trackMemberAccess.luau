local l_Parent_0 = script:FindFirstAncestor("UsageTracker").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(script.Parent.isReactComponent);
local v3 = require(script.Parent.UsageGraph);
return function(v4, v5, v6) --[[ Line: 11 ]] --[[ Name: trackMemberAccess ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    local v7 = {};
    local v8 = {};
    local v9 = v6 or v2;
    local function v10(v11, v12) --[[ Line: 17 ]] --[[ Name: wrap ]]
        -- upvalues: v9 (copy), v7 (copy), v8 (copy), v10 (copy), v1 (ref)
        local v13 = {};
        local v14 = {};
        for v15, v16 in v12 do
            if v15 ~= "__index" and typeof(v15) == "string" then
                local v17 = v11 .. "." .. v15;
                if v9(v16) then
                    v7[v17] = {};
                    v13[v15] = v16;
                elseif typeof(v16) == "table" and not v8[v16] then
                    v14[v15] = v10(v17, v16);
                else
                    v14[v15] = v16;
                end;
                v8[v16] = true;
            end;
        end;
        return (setmetatable(v14, {
            __index = function(_, v19) --[[ Line: 41 ]] --[[ Name: __index ]]
                -- upvalues: v13 (copy), v14 (copy), v11 (copy), v7 (ref), v1 (ref)
                local v20 = v13[v19];
                if not v20 then
                    return (rawget(v14, v19));
                else
                    local v21 = v11 .. "." .. v19;
                    local v22, v23 = debug.info(2, "sl");
                    v7[v21] = v1.List.join(v7[v21], {
                        {
                            dmPath = v22, 
                            lineNumber = v23
                        }
                    });
                    return v20;
                end;
            end
        }));
    end;
    local v24 = v10(v4, v5);
    v24[v3.UsageGraphKey] = v7;
    return v24;
end;