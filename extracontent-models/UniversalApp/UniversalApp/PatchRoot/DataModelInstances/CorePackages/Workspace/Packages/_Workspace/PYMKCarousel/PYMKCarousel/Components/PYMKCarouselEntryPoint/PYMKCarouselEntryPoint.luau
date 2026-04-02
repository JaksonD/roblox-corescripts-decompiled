local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v2.React;
local v4 = require(l_Parent_0.RobloxAppHooks);
local l_useSelector_0 = v2.Hooks.useSelector;
local l_dependencyArray_0 = v2.Hooks.dependencyArray;
local l_useLocalUserId_0 = v4.useLocalUserId;
local l_setupFireEvent_0 = require(l_script_FirstAncestor_0.Analytics).setupFireEvent;
local l_getSessionIdByKey_0 = v2.RoduxAnalytics.Selectors.getSessionIdByKey;
local l_RECOMMENDATION_SESSION_ID_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RECOMMENDATION_SESSION_ID_KEY;
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local v12 = require(l_script_FirstAncestor_0.Components.PYMKCollectionCarousel);
local _ = require(l_script_FirstAncestor_0.Analytics.AnalyticsTypes);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v15) --[[ Line: 47 ]] --[[ Name: PYMKCarouselEntryPoint ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useSelector_0 (copy), l_getSessionIdByKey_0 (copy), l_RECOMMENDATION_SESSION_ID_KEY_0 (copy), l_React_0 (copy), l_setupFireEvent_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v12 (copy), l_FFlagLuaAppCompositionSupport_0 (copy)
    local v16 = l_useLocalUserId_0();
    local v18 = l_useSelector_0(function(v17) --[[ Line: 50 ]]
        -- upvalues: l_getSessionIdByKey_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref)
        return l_getSessionIdByKey_0(v17)(l_RECOMMENDATION_SESSION_ID_KEY_0);
    end);
    local v19 = l_React_0.useMemo(function() --[[ Line: 55 ]]
        -- upvalues: l_setupFireEvent_0 (ref), v16 (copy), v18 (copy), v15 (copy)
        return l_setupFireEvent_0({
            infoForAllEvents = {
                uid = v16, 
                recommendationSessionId = v18, 
                sortIndex = v15.sortAnalyticsData.sortIndex, 
                sortId = v15.sortAnalyticsData.sortId, 
                appPage = v15.sortAnalyticsData.appPage, 
                rowNumber = 1, 
                feedRowNumber = v15.sortAnalyticsData.startRow
            }, 
            analytics = {
                Diag = v15.diagService, 
                EventStream = v15.eventIngestService
            }
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v16, 
        v18, 
        v15.sortAnalyticsData
    } else l_dependencyArray_0(v16, v18, v15.sortAnalyticsData));
    if not v16 then
        return nil;
    elseif v18 or v15.findFriendsTileEnabled then
        return l_React_0.createElement(v12, {
            findFriendsTileEnabled = v15.findFriendsTileEnabled, 
            seeAllTileEnabled = v15.seeAllTileEnabled, 
            recommendationSessionId = v18, 
            carouselTitle = v15.carouselTitle, 
            sideMargin = v15.sideMargin, 
            openProfilePeekView = v15.openProfilePeekView, 
            showToast = v15.showToast, 
            goToAddFriendsPage = v15.goToAddFriendsPage, 
            shouldShowContactImporterBadge = v15.shouldShowContactImporterBadge, 
            pageContext = v15.pageContext, 
            scrollViewPositionChangedSignal = v15.scrollViewPositionChangedSignal, 
            fireAnalyticsEvent = v19, 
            appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v15.appCompositionEnabled else nil
        });
    else
        return nil;
    end;
end;