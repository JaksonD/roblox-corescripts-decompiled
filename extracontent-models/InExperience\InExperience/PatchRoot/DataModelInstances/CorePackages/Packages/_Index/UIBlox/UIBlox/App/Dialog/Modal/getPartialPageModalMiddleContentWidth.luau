local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.getModalWindowWidth);
return function(v2, v3) --[[ Line: 9 ]] --[[ Name: getPartialPageModalMiddleContentWidth ]]
    -- upvalues: v1 (copy)
    return v1(v2) - 2 * (v3 or 24);
end;