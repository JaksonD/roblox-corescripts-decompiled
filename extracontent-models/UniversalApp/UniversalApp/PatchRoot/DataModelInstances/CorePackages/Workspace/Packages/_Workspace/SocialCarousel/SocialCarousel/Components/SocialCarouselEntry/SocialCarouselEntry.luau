local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_RoactAnalytics_0 = require(l_Parent_0.RoactServiceTags).RoactAnalytics;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useThrottledCallback_0 = v3.Hooks.useThrottledCallback;
local _ = require(l_script_FirstAncestor_0.Common.Enums);
local v9 = require(l_script_FirstAncestor_0.Contexts.SocialCarouselContext);
local v10 = require(l_script_FirstAncestor_0.Hooks.useSocialCarouselList);
local v11 = require(l_script_FirstAncestor_0.Analytics.useSocialCarouselUnifiedLogging);
local v12 = require(l_script_FirstAncestor_0.Analytics.useSocialCarouselAnalytics);
local v13 = require(l_script_FirstAncestor_0.Analytics.useSocialCarouselLoadTimer);
local _ = require(l_script_FirstAncestor_0.Analytics.AnalyticsTypes);
local v15 = game:DefineFastInt("FriendCarouselRefreshThrottleInterval", 3);
local l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSortDataToSocialCarouselClicks;
local v17 = require(l_script_FirstAncestor_0.Components.Carousel);
return function(v18) --[[ Line: 47 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_AppEventIngestService_0 (copy), v12 (copy), v13 (copy), v2 (copy), v10 (copy), v11 (copy), l_useThrottledCallback_0 (copy), v15 (copy), v9 (copy), l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 (copy), v17 (copy)
    local v19 = l_useRoactService_0(l_RoactAnalytics_0);
    local v20 = l_useRoactService_0(l_AppEventIngestService_0);
    local v21 = v12();
    local v22 = v13(v21.reportLoadingEvent);
    local v23 = v2.useRef(os.clock());
    local v24 = v10(v18.roduxKey, v18.customTileList);
    local v25 = v11(v19, v20, v18.unifiedLogging, v24, v23);
    local v26 = l_useThrottledCallback_0(function() --[[ Line: 62 ]]
        -- upvalues: v24 (copy)
        v24.refreshFriendsList();
    end, v15);
    v2.useEffect(function() --[[ Line: 66 ]]
        -- upvalues: v18 (copy), v26 (copy)
        if not v18.refreshSignal then
            return;
        else
            v18.refreshSignal:connect(v26);
            return;
        end;
    end, {
        v18.refreshSignal
    });
    return v2.createElement(v9.Provider, {
        value = {
            eventIngest = v20, 
            appAnalytics = v19, 
            hideCarouselHeader = v18.hideCarouselHeader, 
            unifiedLogging = v25, 
            sortAnalyticsData = if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v18.sortAnalyticsData else nil, 
            friendRequestCount = v24.friendRequestCount, 
            recommendationCount = v24.recommendationCount, 
            friendCount = v24.friendCount, 
            tiles = v24.tiles, 
            onSuccessfulRender = v22.onSuccessfulRender, 
            selectionOrderBase = v18.selectionOrderBase, 
            source = v18.source
        }
    }, {
        Carousel = v2.createElement(v17)
    });
end;