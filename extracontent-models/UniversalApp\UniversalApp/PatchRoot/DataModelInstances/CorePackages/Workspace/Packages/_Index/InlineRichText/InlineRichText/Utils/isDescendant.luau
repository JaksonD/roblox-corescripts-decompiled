local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v3 = require(l_Parent_0.Cryo);
local v4 = {};
local function _(v5, v6) --[[ Line: 25 ]] --[[ Name: getMemoKey ]]
    return (("$%*___$%*"):format(v5, v6));
end;
local function _(v8, v9, v10) --[[ Line: 29 ]] --[[ Name: getMemo ]]
    -- upvalues: v4 (copy)
    local v11 = ("$%*___$%*"):format(v9, v10);
    return v4[v8][v11];
end;
local function _(v13, v14, v15, v16) --[[ Line: 35 ]] --[[ Name: setMemo ]]
    -- upvalues: v4 (copy)
    local v17 = ("$%*___$%*"):format(v14, v15);
    v4[v13][v17] = v16;
end;
return function(v19, v20, v21, v22) --[[ Line: 40 ]] --[[ Name: isDescendant ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    if not v4[v20] then
        v4[v20] = {};
    end;
    local v23 = {};
    local function v24(v25) --[[ Line: 46 ]] --[[ Name: dfs ]]
        -- upvalues: v23 (copy), v20 (copy), v22 (copy), v4 (ref), v19 (copy), v2 (ref), v3 (ref), v24 (copy)
        v23[v25] = true;
        local l_v20_0 = v20;
        local v27 = ("$%*___$%*"):format(v25, v22);
        local v28 = v4[l_v20_0][v27];
        if v28 ~= nil then
            return v28;
        else
            l_v20_0 = v19[v25];
            if not l_v20_0 then
                v2:error((("Node %* not found in graph"):format(v25)));
                local l_v20_1 = v20;
                local v30 = ("$%*___$%*"):format(v25, v22);
                v4[l_v20_1][v30] = false;
                return false;
            elseif l_v20_0.children[v22] then
                local l_v20_2 = v20;
                local v32 = ("$%*___$%*"):format(v25, v22);
                v4[l_v20_2][v32] = true;
                return true;
            else
                local v34 = v3.List.filter(v3.Dictionary.keys(l_v20_0.children), function(v33) --[[ Line: 64 ]]
                    -- upvalues: v23 (ref), l_v20_0 (copy)
                    if not v23[v33] and l_v20_0.children[v33] then
                        return true;
                    else
                        return false;
                    end;
                end);
                v27 = false;
                for _, v36 in v34 do
                    if v24(v36) then
                        v27 = true;
                        break;
                    end;
                end;
                local l_v20_3 = v20;
                local l_v22_0 = v22;
                local l_v27_0 = v27;
                local v40 = ("$%*___$%*"):format(v25, l_v22_0);
                v4[l_v20_3][v40] = l_v27_0;
                return v27;
            end;
        end;
    end;
    return (v24(v21));
end;