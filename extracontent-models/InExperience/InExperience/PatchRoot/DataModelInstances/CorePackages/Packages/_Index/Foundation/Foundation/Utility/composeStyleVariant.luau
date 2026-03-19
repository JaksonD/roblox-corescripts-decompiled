local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local function _(v4) --[[ Line: 11 ]] --[[ Name: tagToTable ]]
    if type(v4) == "string" then
        return {
            [v4] = true
        };
    else
        return v4;
    end;
end;
local function v10(v6, v7) --[[ Line: 20 ]] --[[ Name: mergeTags ]]
    -- upvalues: v2 (copy)
    if not v6 then
        return v7;
    elseif not v7 then
        return v6;
    elseif type(v6) == "table" or type(v7) == "table" then
        local v8 = if type(v6) == "string" then {
            [v6] = true
        } else v6;
        local v9 = if type(v7) == "string" then {
            [v7] = true
        } else v7;
        return v2.join(v8, v9);
    else
        return (("%* %*"):format(v6, v7));
    end;
end;
local function _(v11, v12) --[[ Line: 40 ]] --[[ Name: mergeProps ]]
    -- upvalues: v2 (copy), v10 (copy)
    local v13 = v2.join(v11, v12);
    v13.tag = v10(v11.tag, v12.tag);
    return v13;
end;
composeStyleVariant = function(v15, ...) --[[ Line: 48 ]] --[[ Name: composeStyleVariant ]]
    -- upvalues: v2 (copy), v10 (copy)
    local v16 = v2.copy(v15);
    v2.forEachArgs(function(v17) --[[ Line: 50 ]]
        -- upvalues: v16 (copy), v2 (ref), v10 (ref)
        if v17 == nil then
            return;
        else
            for v18, v19 in v17 do
                local l_v16_0 = v16;
                local v21 = v16[v18] or {};
                local v22 = v2.join(v21, v19);
                v22.tag = v10(v21.tag, v19.tag);
                l_v16_0[v18] = v22;
            end;
            return;
        end;
    end, ...);
    return v16;
end;
return composeStyleVariant;