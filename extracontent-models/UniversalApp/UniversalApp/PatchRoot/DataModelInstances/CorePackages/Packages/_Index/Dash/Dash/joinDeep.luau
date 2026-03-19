local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.None);
local _ = require(l_Parent_0.Types);
local v3 = require(l_Parent_0.forEach);
local function v4(v5, v6) --[[ Line: 21 ]] --[[ Name: joinDeep ]]
    -- upvalues: v3 (copy), v4 (copy), v1 (copy)
    local v7 = table.clone(v5);
    v3(v6, function(v8, v9) --[[ Line: 24 ]]
        -- upvalues: v5 (copy), v7 (copy), v4 (ref), v1 (ref)
        if typeof(v5[v9]) == "table" and typeof(v8) == "table" then
            v7[v9] = v4(v5[v9], v8);
            return;
        elseif v8 == v1 then
            v7[v9] = nil;
            return;
        else
            v7[v9] = v8;
            return;
        end;
    end);
    return v7;
end;
return v4;