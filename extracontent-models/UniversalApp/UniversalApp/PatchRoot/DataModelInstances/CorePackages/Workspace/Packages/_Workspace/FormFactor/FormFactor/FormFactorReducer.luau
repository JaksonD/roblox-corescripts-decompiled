local v0 = require(script.Parent.FormFactor);
local v1 = require(script.Parent.SetFormFactor);
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: v0 (copy), v1 (copy)
    v2 = v2 or v0.UNKNOWN;
    if v3.type == v1.name then
        return v3.formFactor;
    else
        return v2;
    end;
end;