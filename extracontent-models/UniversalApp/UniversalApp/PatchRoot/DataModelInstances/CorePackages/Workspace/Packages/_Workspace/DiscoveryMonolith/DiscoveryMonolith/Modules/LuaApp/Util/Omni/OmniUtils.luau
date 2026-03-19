local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_OmniRecommendationsContentType_0 = require(l_Parent_0.DiscoveryTypes).OmniRecommendationsContentType;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
return {
    storeForContentType = function(v3, v4) --[[ Line: 9 ]]
        -- upvalues: l_OmniRecommendationsContentType_0 (copy), l_GameInfosReducer_0 (copy)
        if v4 == l_OmniRecommendationsContentType_0.Game then
            return v3.Personalization[l_GameInfosReducer_0.key];
        elseif v4 == l_OmniRecommendationsContentType_0.GameCoPlay then
            return v3.GameCoPlay;
        elseif v4 == l_OmniRecommendationsContentType_0.CatalogAsset then
            return v3.CatalogAssets;
        elseif v4 == l_OmniRecommendationsContentType_0.CatalogBundle then
            return v3.CatalogBundles;
        else
            return nil;
        end;
    end
};