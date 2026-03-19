local l_Parent_0 = script:FindFirstAncestor("ContactImporter").Parent;
local l_ImpressionCacheImpl_0 = require(l_Parent_0.SocialCommon).Utils.ImpressionCacheImpl;
local l_game_EngineFeature_0 = game:GetEngineFeature("RegisterContactsSyncWarningImpressionsCountKey");
return (l_ImpressionCacheImpl_0({
    appStorageKey = "ContactsSyncWarningImpressionsCount", 
    isKeyAvailableInEngine = l_game_EngineFeature_0, 
    dismissedValue = -1
}));