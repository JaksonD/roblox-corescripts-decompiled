local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local l_ImpressionsTagUtility_0 = require(l_Parent_0.Impressions).ImpressionsTagUtility;
return function(v3, v4, v5) --[[ Line: 8 ]] --[[ Name: useSetupImpressionsTileTagging ]]
    -- upvalues: v1 (copy), l_ImpressionsTagUtility_0 (copy)
    v1.useEffect(function() --[[ Line: 9 ]]
        -- upvalues: l_ImpressionsTagUtility_0 (ref), v3 (copy), v4 (copy), v5 (copy)
        l_ImpressionsTagUtility_0.AddTag(v3, v4, v5);
        return function() --[[ Line: 11 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v3 (ref), v4 (ref), v5 (ref)
            l_ImpressionsTagUtility_0.RemoveTag(v3, v4, v5);
        end;
    end, {
        v3, 
        v4, 
        v5
    });
end;