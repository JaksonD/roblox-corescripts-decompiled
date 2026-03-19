local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.React);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v4 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v5 = require(l_CorePackages_0.Packages.t);
local l_OmniFeedProps_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedProps;
local v7 = require(l_CorePackages_0.Workspace.Packages.SocialCarousel);
local l_Constants_0 = v7.Constants;
local l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 = v4.FFlagLuaAppAddSortDataToSocialCarouselClicks;
local l_FFlagFlyoutHideFriendsHeader_0 = v7.Flags.FFlagFlyoutHideFriendsHeader;
local l_FlyoutSidePanelIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP;
local v12 = v5.strictInterface({
    [l_OmniFeedProps_0.key] = l_OmniFeedProps_0.interface, 
    topic = v5.optional(v5.string), 
    topicId = v5.optional(v5.string), 
    formFactor = v5.string, 
    refresh = v5.callback, 
    selectionOrderBase = v5.optional(v5.number), 
    useGridPageLayout = v5.optional(v5.boolean), 
    networking = v5.any, 
    uiModeInfo = v5.any
});
return function(v13) --[[ Line: 45 ]]
    -- upvalues: v12 (copy), l_OmniFeedProps_0 (copy), l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 (copy), l_AppPage_0 (copy), v2 (copy), v1 (copy), v7 (copy), l_Constants_0 (copy), l_FFlagFlyoutHideFriendsHeader_0 (copy), l_FlyoutSidePanelIXP_0 (copy)
    v12(v13);
    local v14 = v13[l_OmniFeedProps_0.key].selectionOrderBase or 0;
    local v15 = nil;
    local v16 = nil;
    local v17 = nil;
    if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then
        v16 = v13[l_OmniFeedProps_0.key] and v13[l_OmniFeedProps_0.key].appPage or l_AppPage_0.Home;
        v17 = v13[l_OmniFeedProps_0.key] and v13[l_OmniFeedProps_0.key].feedItemPosition or nil;
        local v18 = v13[l_OmniFeedProps_0.key] and v13[l_OmniFeedProps_0.key].feedItemStartRow or nil;
        v15 = v2.useMemo(function() --[[ Line: 58 ]]
            -- upvalues: v17 (ref), v16 (ref), v13 (copy), v18 (copy)
            return {
                sortIndex = v17 or -1, 
                appPage = v16, 
                sortId = v13.topicId, 
                startRow = v18 or -1
            };
        end, {
            v17, 
            v16, 
            v13.topicId, 
            v18
        });
    end;
    return v1.createElement(v7.Entry, {
        unifiedLogging = {
            sortIndex = if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v17 else v13[l_OmniFeedProps_0.key].feedItemPosition, 
            appPage = if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v16 else v13[l_OmniFeedProps_0.key].appPage, 
            sortId = v13.topicId, 
            scrollViewPositionChangedSignal = v13[l_OmniFeedProps_0.key].scrollViewPositionChangedSignal, 
            impressionTag = "HomeFriendCarousel"
        }, 
        sortAnalyticsData = if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v15 else nil, 
        refreshSignal = v13[l_OmniFeedProps_0.key].refreshSignal, 
        selectionOrderBase = v14, 
        source = l_Constants_0.ANALYTICS.SRC.HOMEPAGE_FRIENDS_CAROUSEL, 
        hideCarouselHeader = l_FFlagFlyoutHideFriendsHeader_0 and l_FlyoutSidePanelIXP_0.isFlyoutSidePanelEnabled() and true or nil
    });
end;