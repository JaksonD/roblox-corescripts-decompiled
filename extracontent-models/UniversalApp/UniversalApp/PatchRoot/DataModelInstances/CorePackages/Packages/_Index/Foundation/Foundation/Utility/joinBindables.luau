local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v5, v6) --[[ Line: 9 ]] --[[ Name: joinBindables ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v7 = {};
    local v8 = {};
    local v9 = false;
    for v10, v11 in v5 do
        if v3.isBinding(v11) then
            v7[v10] = v11;
            v9 = true;
        else
            v8[v10] = v11;
        end;
    end;
    if not v9 then
        return v6(v8);
    else
        return v2.joinBindings(v7):map(function(v12) --[[ Line: 30 ]]
            -- upvalues: v8 (copy), v6 (copy)
            local v13 = table.clone(v8);
            for v14, v15 in v12 do
                v13[v14] = v15;
            end;
            return v6(v13);
        end);
    end;
end;