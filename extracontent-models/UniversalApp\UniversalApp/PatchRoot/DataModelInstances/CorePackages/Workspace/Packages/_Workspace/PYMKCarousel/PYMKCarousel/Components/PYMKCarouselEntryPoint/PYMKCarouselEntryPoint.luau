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
local v11 = require(l_script_FirstAncestor_0.Components.PYMKCollectionCarousel);
local _ = require(l_script_FirstAncestor_0.Analytics.AnalyticsTypes);
return function(v13) --[[ Line: 41 ]] --[[ Name: PYMKCarouselEntryPoint ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useSelector_0 (copy), l_getSessionIdByKey_0 (copy), l_RECOMMENDATION_SESSION_ID_KEY_0 (copy), l_React_0 (copy), l_setupFireEvent_0 (copy), l_dependencyArray_0 (copy), v11 (copy)
    local v14 = l_useLocalUserId_0();
    local v16 = l_useSelector_0(function(v15) --[[ Line: 44 ]]
        -- upvalues: l_getSessionIdByKey_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref)
        return l_getSessionIdByKey_0(v15)(l_RECOMMENDATION_SESSION_ID_KEY_0);
    end);
    local v17 = l_React_0.useMemo(function() --[[ Line: 48 ]]
        -- upvalues: l_setupFireEvent_0 (ref), v14 (copy), v16 (copy), v13 (copy)
        return l_setupFireEvent_0({
            infoForAllEvents = {
                uid = v14, 
                recommendationSessionId = v16, 
                sortIndex = v13.sortAnalyticsData.sortIndex, 
                sortId = v13.sortAnalyticsData.sortId, 
                appPage = v13.sortAnalyticsData.appPage, 
                rowNumber = 1, 
                feedRowNumber = v13.sortAnalyticsData.startRow
            }, 
            analytics = {
                Diag = v13.diagService, 
                EventStream = v13.eventIngestService
            }
        });
    end, l_dependencyArray_0(v14, v16, v13.sortAnalyticsData));
    if not v14 then
        return nil;
    elseif v16 or v13.findFriendsTileEnabled then
        return l_React_0.createElement(v11, {
            findFriendsTileEnabled = v13.findFriendsTileEnabled, 
            seeAllTileEnabled = v13.seeAllTileEnabled, 
            recommendationSessionId = v16, 
            carouselTitle = v13.carouselTitle, 
            sideMargin = v13.sideMargin, 
            openProfilePeekView = v13.openProfilePeekView, 
            showToast = v13.showToast, 
            goToAddFriendsPage = v13.goToAddFriendsPage, 
            shouldShowContactImporterBadge = v13.shouldShowContactImporterBadge, 
            pageContext = v13.pageContext, 
            scrollViewPositionChangedSignal = v13.scrollViewPositionChangedSignal, 
            fireAnalyticsEvent = v17
        });
    else
        return nil;
    end;
end;