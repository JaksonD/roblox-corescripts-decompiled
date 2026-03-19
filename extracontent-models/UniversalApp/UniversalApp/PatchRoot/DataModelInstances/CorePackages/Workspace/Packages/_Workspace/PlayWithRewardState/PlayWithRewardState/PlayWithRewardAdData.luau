local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayWithRewardState");
local v1 = require(l_script_FirstAncestor_0.PlayWithRewardExperimentData);
return {
    new = function(v2, v3, v4, v5, v6) --[[ Line: 16 ]] --[[ Name: new ]]
        -- upvalues: v1 (copy)
        return {
            adAvailabilityResult = v2, 
            productId = v3, 
            productName = v4, 
            productImageAssetId = v5, 
            experimentVariantData = v1.fromJsonData(v6)
        };
    end
};