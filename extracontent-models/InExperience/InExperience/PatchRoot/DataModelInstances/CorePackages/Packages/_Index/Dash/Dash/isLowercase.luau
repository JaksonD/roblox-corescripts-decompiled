local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.assertEqual);
return function(v2) --[[ Line: 15 ]] --[[ Name: isLowercase ]]
    -- upvalues: v1 (copy)
    v1(#v2 > 0, true, "Attempted to call Dash.isLowercase with an empty string");
    local v3 = v2:sub(1, 1);
    return v3 == v3:lower();
end;