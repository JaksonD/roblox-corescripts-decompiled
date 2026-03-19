local l_Parent_0 = script:FindFirstAncestor("UserSearch").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Dash);
local function v6(v3, v4) --[[ Line: 13 ]]
    -- upvalues: v2 (copy)
    local v5 = v4 + 1;
    return v2.slice(v3, v5);
end;
return function(v7) --[[ Line: 18 ]]
    -- upvalues: v1 (copy), v6 (copy)
    local v8 = v7.users or {};
    local v9, v10 = v1.useState(0);
    local v11, v12 = v1.useState(v8);
    v1.useEffect(function() --[[ Line: 23 ]]
        -- upvalues: v12 (copy), v6 (ref), v8 (copy), v9 (copy), v10 (copy)
        v12(v6(v8, v9));
        v10(#v8);
    end, {
        #v8
    });
    return v11;
end;