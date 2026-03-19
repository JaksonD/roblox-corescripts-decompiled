local l_Parent_0 = script:FindFirstAncestor("LazyRequire").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
return function(v3) --[[ Line: 13 ]] --[[ Name: createLazyComponent ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v2.forwardRef(function(v4, v5) --[[ Line: 16 ]]
        -- upvalues: v2 (ref), v3 (copy), v1 (ref)
        return v2.createElement(v3(), v1.Dictionary.join(v4, {
            ref = v5
        }));
    end);
end;