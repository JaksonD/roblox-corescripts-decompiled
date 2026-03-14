local v0 = require(script.Utility.isSelectedDataDSAIllegalContent);
local v1 = require(script.Utility.isShowEUDSAIllegalContentReportingLink);
local v2 = require(script.Utility.isInDSAFeaturesOverrideList);
local v3 = require(script.Components.DSAReportLink);
local v4 = require(script.Utility.Constants);
local v5 = require(script.Components.OSAReportLink);
local v6 = require(script.Utility.isShowUKOSAIllegalContentReportingLink);
local v7 = require(script.Components.GenericReportLink);
local v8 = require(script.Utility.isShowGenericIllegalContentReportingLink);
return {
    isShowEUDSAIllegalContentReportingLink = v1, 
    isSelectedDataDSAIllegalContent = v0, 
    isInDSAFeaturesOverrideList = v2, 
    DSAReportLink = v3, 
    Constants = v4, 
    OSAReportLink = v5, 
    isShowUKOSAIllegalContentReportingLink = v6, 
    GenericReportLink = v7, 
    isShowGenericIllegalContentReportingLink = v8, 
    ["jest.config"] = script["jest.config"]
};