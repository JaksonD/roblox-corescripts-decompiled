local l_Modules_0 = script:FindFirstAncestor("DiscoveryMonolith").Modules;
local v1 = require(l_Modules_0.LuaApp.Reducers.OmniRecommendationsMetadataRetrievalStatus);
local v2 = require(l_Modules_0.LuaApp.Reducers.SearchesInGamesStatus);
return function(v3, v4) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v1 (copy)
    v3 = v3 or {};
    return {
        SearchesInGamesStatus = v2(v3.SearchesInGamesStatus, v4), 
        OmniRecommendationsMetadataRetrievalStatus = v1(v3.OmniRecommendationsMetadataRetrievalStatus, v4)
    };
end;