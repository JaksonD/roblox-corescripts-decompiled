local v0 = require(script.Parent.trimStart);
local v1 = require(script.Parent.trimEnd);
return function(v2) --[[ Line: 6 ]]
    -- upvalues: v0 (copy), v1 (copy)
    return v0(v1(v2));
end;