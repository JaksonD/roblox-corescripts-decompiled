local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local l_ImpressionCacheImpl_0 = require(l_Parent_0.SocialCommon).Utils.ImpressionCacheImpl;
local l_game_EngineFeature_0 = game:GetEngineFeature("RegisterTCEducationBannerImpressionsCountKey");
return l_ImpressionCacheImpl_0({
    appStorageKey = "TCEducationBannerImpressionsCount", 
    dismissedValue = -1, 
    isKeyAvailableInEngine = l_game_EngineFeature_0
});