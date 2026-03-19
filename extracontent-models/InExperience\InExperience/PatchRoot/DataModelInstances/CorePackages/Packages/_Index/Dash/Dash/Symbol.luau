local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.class)("Symbol", function(v1) --[[ Line: 20 ]]
    return {
        name = v1
    };
end);
v2.toString = function(v3) --[[ Line: 26 ]] --[[ Name: toString ]]
    return ("Symbol(%s)"):format(v3.name);
end;
return v2;