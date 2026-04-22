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
local l_FFlagSocialCarouselShareQREnabled_0 = require(l_Parent_0.SharedFlags).FFlagSocialCarouselShareQREnabled;
local v19 = require(l_script_FirstAncestor_0.Components.Carousel);
return function(v20) --[[ Line: 53 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_AppEventIngestService_0 (copy), v12 (copy), v13 (copy), v2 (copy), v10 (copy), v11 (copy), l_useThrottledCallback_0 (copy), v15 (copy), v9 (copy), l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 (copy), l_FFlagSocialCarouselShareQREnabled_0 (copy), v19 (copy), l_FFlagLuaAppCompositionSupport_0 (copy)
    local v21 = l_useRoactService_0(l_RoactAnalytics_0);
    local v22 = l_useRoactService_0(l_AppEventIngestService_0);
    local v23 = v12();
    local v24 = v13(v23.reportLoadingEvent);
    local v25 = v2.useRef(os.clock());
    local v26 = v10(v20.roduxKey, v20.customTileList);
    local v27 = v11(v21, v22, v20.unifiedLogging, v26, v25);
    local v28 = l_useThrottledCallback_0(function() --[[ Line: 68 ]]
        -- upvalues: v26 (copy)
        v26.refreshFriendsList();
    end, v15);
    v2.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v20 (copy), v28 (copy)
        if not v20.refreshSignal then
            return;
        else
            v20.refreshSignal:connect(v28);
            return;
        end;
    end, {
        v20.refreshSignal
    });
    return v2.createElement(v9.Provider, {
        value = {
            eventIngest = v22, 
            appAnalytics = v21, 
            hideCarouselHeader = v20.hideCarouselHeader, 
            unifiedLogging = v27, 
            sortAnalyticsData = if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v20.sortAnalyticsData else nil, 
            friendRequestCount = v26.friendRequestCount, 
            recommendationCount = v26.recommendationCount, 
            friendCount = v26.friendCount, 
            tiles = v26.tiles, 
            onSuccessfulRender = v24.onSuccessfulRender, 
            selectionOrderBase = v20.selectionOrderBase, 
            source = v20.source, 
            navigateToQRCodePage = if l_FFlagSocialCarouselShareQREnabled_0 then v20.navigateToQRCodePage else nil
        }
    }, {
        Carousel = v2.createElement(v19, {
            appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v20.appCompositionEnabled else nil
        })
    });
end;