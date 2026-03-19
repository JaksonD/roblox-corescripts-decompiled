local v0 = require(script.Parent.FFlagAXStrictCheckForPrefetchMarketplace);
local v1 = v0 and game:DefineFastFlag("AXPrefetchMarketplaceThumbnailsXP", false);
local v2 = v0 and game:DefineFastFlag("AXPrefetchMarketplaceThumbnailsXPExposure", false);
return {
    UserIsInTreatment = v1, 
    UserIsInExperiment = v2
};