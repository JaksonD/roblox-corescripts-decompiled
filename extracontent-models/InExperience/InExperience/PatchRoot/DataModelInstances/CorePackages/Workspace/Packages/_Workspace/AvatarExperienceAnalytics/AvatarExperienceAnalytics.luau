local v0 = require(script.AnalyticsService);
local v1 = require(script.addUnifiedEventLogging);
local v2 = require(script.useUnifiedEventListener);
local v3 = require(script.sendUnifiedEventLog);
local v4 = require(script.sendUnifiedEventLogForInstance);
local v5 = require(script.logWidgetLoaded);
local v6 = require(script.sendUnifiedEventForDeferredAction);
local v7 = require(script.UnifiedEventLogConstants);
local v8 = require(script.UnifiedEventLogEnums);
return {
    AnalyticsService = v0, 
    addUnifiedEventLogging = v1, 
    useUnifiedEventListener = v2, 
    sendUnifiedEventLog = v3, 
    sendUnifiedEventLogForInstance = v4, 
    logWidgetLoaded = v5, 
    sendUnifiedEventForDeferredAction = v6, 
    UnifiedEventLogConstants = v7, 
    UnifiedEventLogEnums = v8, 
    useUnifiedEventImpressionsReporter = require(script.useUnifiedEventImpressionsReporter), 
    TagBasedImpressionsDetector = require(script.TagBasedImpressionsDetector), 
    AvatarExperienceImpressionsDetector = require(script.AvatarExperienceImpressionsDetector), 
    AvatarExperienceScreenSizeImpressionsDetector = require(script.AvatarExperienceScreenSizeImpressionsDetector), 
    sendAXStat = require(script.sendAXStat), 
    sendAXCounterV2 = require(script.sendAXCounterV2), 
    getAvatarEventCounterNameWithPlatform = require(script.getAvatarEventCounterNameWithPlatform), 
    reportAvatarEventCounterNoAnalyticsArgument = require(script.reportAvatarEventCounterNoAnalyticsArgument), 
    reportAvatarEventCounterV1 = require(script.reportAvatarEventCounterV1), 
    Flags = {}, 
    Enums = {
        ImpressionEnums = require(script.Enums.ImpressionEnums)
    }, 
    Surfaces = {
        SlotBasedEditorAnalytics = require(script.Surfaces.SlotBasedEditorAnalytics)
    }, 
    Utils = {
        UnifiedEventLoggingUtils = require(script.Utils.UnifiedEventLoggingUtils), 
        getTimedOptionForItemData = require(script.Utils.getTimedOptionForItemData)
    }, 
    Constants = require(script.Constants), 
    ["jest.config"] = script["jest.config"]
};