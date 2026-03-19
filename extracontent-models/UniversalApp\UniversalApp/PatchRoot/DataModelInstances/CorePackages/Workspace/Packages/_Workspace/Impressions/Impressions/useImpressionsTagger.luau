local l_Parent_0 = script:FindFirstAncestor("Impressions").Parent;
local v1 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v3 = require(script.Parent.ImpressionsTagUtility);
return function(v4, v5, v6) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v3 (copy), l_dependencyArray_0 (copy)
    v1.useEffect(function() --[[ Line: 10 ]]
        -- upvalues: v3 (ref), v4 (copy), v5 (copy), v6 (copy)
        v3.AddTag(v4, v5, v6);
        return function() --[[ Line: 13 ]]
            -- upvalues: v3 (ref), v4 (ref), v5 (ref), v6 (ref)
            v3.RemoveTag(v4, v5, v6);
        end;
    end, l_dependencyArray_0(v4, v5, v6));
end;