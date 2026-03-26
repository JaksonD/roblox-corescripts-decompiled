local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.React);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v4 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v5 = require(l_CorePackages_0.Packages.t);
local l_OmniFeedProps_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedProps;
local v7 = require(l_CorePackages_0.Workspace.Packages.SocialCarousel);
local l_Constants_0 = v7.Constants;
local l_FFlagLuaAppCompositionSupport_0 = v4.FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = v4.FFlagLuaAppCompositionAlways;
local l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 = v4.FFlagLuaAppAddSortDataToSocialCarouselClicks;
local l_FFlagFlyoutHideFriendsHeader_0 = v7.Flags.FFlagFlyoutHideFriendsHeader;
local l_FlyoutSidePanelIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP;
local v14 = v5.strictInterface({
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
return function(v15) --[[ Line: 47 ]]
    -- upvalues: v14 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_OmniFeedProps_0 (copy), l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 (copy), l_AppPage_0 (copy), v2 (copy), v1 (copy), v7 (copy), l_Constants_0 (copy), l_FFlagFlyoutHideFriendsHeader_0 (copy), l_FlyoutSidePanelIXP_0 (copy)
    v14(v15);
    local v16 = l_FFlagLuaAppCompositionAlways_0 and true or if l_FFlagLuaAppCompositionSupport_0 then v15[l_OmniFeedProps_0.key].appCompositionEnabled else nil;
    local v17 = v15[l_OmniFeedProps_0.key].selectionOrderBase or 0;
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then
        v19 = v15[l_OmniFeedProps_0.key] and v15[l_OmniFeedProps_0.key].appPage or l_AppPage_0.Home;
        v20 = v15[l_OmniFeedProps_0.key] and v15[l_OmniFeedProps_0.key].feedItemPosition or nil;
        local v21 = v15[l_OmniFeedProps_0.key] and v15[l_OmniFeedProps_0.key].feedItemStartRow or nil;
        v18 = v2.useMemo(function() --[[ Line: 65 ]]
            -- upvalues: v20 (ref), v19 (ref), v15 (copy), v21 (copy)
            return {
                sortIndex = v20 or -1, 
                appPage = v19, 
                sortId = v15.topicId, 
                startRow = v21 or -1
            };
        end, {
            v20, 
            v19, 
            v15.topicId, 
            v21
        });
    end;
    return v1.createElement(v7.Entry, {
        unifiedLogging = {
            sortIndex = if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v20 else v15[l_OmniFeedProps_0.key].feedItemPosition, 
            appPage = if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v19 else v15[l_OmniFeedProps_0.key].appPage, 
            sortId = v15.topicId, 
            scrollViewPositionChangedSignal = v15[l_OmniFeedProps_0.key].scrollViewPositionChangedSignal, 
            impressionTag = "HomeFriendCarousel"
        }, 
        sortAnalyticsData = if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v18 else nil, 
        refreshSignal = v15[l_OmniFeedProps_0.key].refreshSignal, 
        selectionOrderBase = v17, 
        source = l_Constants_0.ANALYTICS.SRC.HOMEPAGE_FRIENDS_CAROUSEL, 
        hideCarouselHeader = l_FFlagFlyoutHideFriendsHeader_0 and l_FlyoutSidePanelIXP_0.isFlyoutSidePanelEnabled() and true or nil, 
        appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v16 else nil
    });
end;