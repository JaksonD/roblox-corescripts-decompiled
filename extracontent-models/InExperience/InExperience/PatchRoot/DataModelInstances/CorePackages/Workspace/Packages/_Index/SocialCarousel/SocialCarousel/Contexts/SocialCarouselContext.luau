local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Analytics.AnalyticsTypes);
return v2.createContext({
    eventIngest = function() --[[ Line: 28 ]] --[[ Name: eventIngest ]]

    end, 
    appAnalytics = function() --[[ Line: 29 ]] --[[ Name: appAnalytics ]]

    end, 
    hideCarouselHeader = false, 
    unifiedLogging = nil, 
    sortAnalyticsData = nil, 
    tiles = {}, 
    friendRequestCount = 0, 
    friendCount = 0, 
    recommendationCount = 0, 
    onSuccessfulRender = function() --[[ Line: 37 ]] --[[ Name: onSuccessfulRender ]]

    end, 
    selectionOrderBase = nil, 
    source = nil
});