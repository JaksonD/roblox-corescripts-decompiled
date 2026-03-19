local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local v3 = require(l_Parent_0.t);
return {
    ageRecommendationResponseValidator = v3.interface({
        ageRecommendationDetails = v3.interface({
            summary = v3.interface({
                ageRecommendation = v3.interface({
                    displayName = v3.optional(v3.string), 
                    displayNameWithHeaderShort = v3.optional(v3.string)
                })
            })
        })
    })
};