local v0 = require(script.Parent.Parent.shallowEqual);
local v1 = require(script.Parent.Parent.toString);
return function(v2) --[[ Line: 4 ]] --[[ Name: expectTable ]]
    -- upvalues: v0 (copy), v1 (copy)
    return {
        toEqual = function(v3) --[[ Line: 6 ]] --[[ Name: toEqual ]]
            -- upvalues: v0 (ref), v2 (copy), v1 (ref)
            assert(v0(v2, v3), string.format("expected: %s\ninstead got: %s", v1(v3), v1(v2)));
        end
    };
end;