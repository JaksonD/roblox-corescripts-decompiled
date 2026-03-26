local l_Parent_0 = script:FindFirstAncestor("Impressions").Parent;
local v1 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v3 = require(script.Parent.ImpressionsTagUtility);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v5, v6, v7) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v3 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    v1.useEffect(function() --[[ Line: 13 ]]
        -- upvalues: v3 (ref), v5 (copy), v6 (copy), v7 (copy)
        v3.AddTag(v5, v6, v7);
        return function() --[[ Line: 16 ]]
            -- upvalues: v3 (ref), v5 (ref), v6 (ref), v7 (ref)
            v3.RemoveTag(v5, v6, v7);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v5, 
        v6, 
        v7
    } else l_dependencyArray_0(v5, v6, v7));
end;