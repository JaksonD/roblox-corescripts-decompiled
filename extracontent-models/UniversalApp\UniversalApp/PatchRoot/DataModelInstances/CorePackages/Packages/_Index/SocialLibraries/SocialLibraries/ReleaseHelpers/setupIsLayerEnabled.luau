local v0 = require(script.Parent.Parent.Dictionary.getDeepValue);
return function(v1) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    return function(v2) --[[ Line: 7 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v2 or {};
        return v0(v3[v1.layerName] or {}, v1.variantName) or false;
    end;
end;