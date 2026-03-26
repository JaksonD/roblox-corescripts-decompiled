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
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSortDataToSocialCarouselClicks;
local v18 = require(l_script_FirstAncestor_0.Components.Carousel);
return function(v19) --[[ Line: 50 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_AppEventIngestService_0 (copy), v12 (copy), v13 (copy), v2 (copy), v10 (copy), v11 (copy), l_useThrottledCallback_0 (copy), v15 (copy), v9 (copy), l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 (copy), v18 (copy), l_FFlagLuaAppCompositionSupport_0 (copy)
    local v20 = l_useRoactService_0(l_RoactAnalytics_0);
    local v21 = l_useRoactService_0(l_AppEventIngestService_0);
    local v22 = v12();
    local v23 = v13(v22.reportLoadingEvent);
    local v24 = v2.useRef(os.clock());
    local v25 = v10(v19.roduxKey, v19.customTileList);
    local v26 = v11(v20, v21, v19.unifiedLogging, v25, v24);
    local v27 = l_useThrottledCallback_0(function() --[[ Line: 65 ]]
        -- upvalues: v25 (copy)
        v25.refreshFriendsList();
    end, v15);
    v2.useEffect(function() --[[ Line: 69 ]]
        -- upvalues: v19 (copy), v27 (copy)
        if not v19.refreshSignal then
            return;
        else
            v19.refreshSignal:connect(v27);
            return;
        end;
    end, {
        v19.refreshSignal
    });
    return v2.createElement(v9.Provider, {
        value = {
            eventIngest = v21, 
            appAnalytics = v20, 
            hideCarouselHeader = v19.hideCarouselHeader, 
            unifiedLogging = v26, 
            sortAnalyticsData = if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v19.sortAnalyticsData else nil, 
            friendRequestCount = v25.friendRequestCount, 
            recommendationCount = v25.recommendationCount, 
            friendCount = v25.friendCount, 
            tiles = v25.tiles, 
            onSuccessfulRender = v23.onSuccessfulRender, 
            selectionOrderBase = v19.selectionOrderBase, 
            source = v19.source
        }
    }, {
        Carousel = v2.createElement(v18, {
            appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v19.appCompositionEnabled else nil
        })
    });
end;