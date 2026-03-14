local v0 = require(script.options.ViewportQueryOptions);
local v1 = require(script.options.RangeQueryOptions);
local v2 = require(script.options.DataModelTraversalOptions);
return {
    ViewportQueryOptions = v0, 
    RangeQueryOptions = v1, 
    DataModelTraversalOptions = v2, 
    getSourceAssetsInView = require(script.getSourceAssetsInView), 
    getSourceAssetsInRange = require(script.getSourceAssetsInRange), 
    createLazyInstanceCollector = require(script.traversal.createLazyInstanceCollector), 
    isSourceAsset = require(script.isSourceAsset), 
    calculatePotentialAudibility = require(script.audio.calculatePotentialAudibility), 
    getAudibleVolume = require(script.audio.getAudibleVolume), 
    isAudible = require(script.audio.isAudible)
};