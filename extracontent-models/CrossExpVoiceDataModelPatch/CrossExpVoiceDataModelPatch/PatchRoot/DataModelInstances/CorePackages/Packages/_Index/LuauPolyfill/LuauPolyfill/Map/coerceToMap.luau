local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent);
local v2 = require(l_Parent_0.Object);
local v3 = require(l_Parent_0.instanceof);
local _ = require(l_Parent_0.types);
return function(v5) --[[ Line: 9 ]] --[[ Name: coerceToMap ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    return v3(v5, v1) and v5 or v1.new(v2.entries(v5));
end;