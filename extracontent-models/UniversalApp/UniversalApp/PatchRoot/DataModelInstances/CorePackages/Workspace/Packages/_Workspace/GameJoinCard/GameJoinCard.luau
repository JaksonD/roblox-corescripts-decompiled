local v0 = require(script.Analytics.AnalyticsConstants);
return {
    Analytics = {
        AnalyticsConstants = v0, 
        Constants = v0, 
        useGameJoinCardAnalytics = require(script.Analytics.useGameJoinCardAnalytics)
    }, 
    DesktopGameJoinCard = require(script.Components.DesktopGameJoinCard.DesktopGameJoinCard), 
    DesktopGameJoinCardContainer = require(script.Components.DesktopGameJoinCard.DesktopGameJoinCardContainer), 
    GamepadJoinFocusBehavior = require(script.Components.DesktopGameJoinCard.GamepadJoinFocusBehavior), 
    MobileGameJoinCard = require(script.Components.MobileGameJoinCard), 
    ["jest.config"] = script["jest.config"]
};