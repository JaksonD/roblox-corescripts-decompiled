local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v6 = require(l_CorePackages_0.Packages.t);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_OmniFeedProps_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedProps;
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateDownTo3DQRCodePage);
local v10 = require(l_CorePackages_0.Workspace.Packages.SocialCarousel);
local l_Constants_0 = v10.Constants;
local l_FFlagLuaAppCompositionSupport_0 = v5.FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = v5.FFlagLuaAppCompositionAlways;
local l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 = v5.FFlagLuaAppAddSortDataToSocialCarouselClicks;
local l_FFlagFlyoutHideFriendsHeader_0 = v10.Flags.FFlagFlyoutHideFriendsHeader;
local l_FFlagSocialCarouselShareQREnabled_0 = v5.FFlagSocialCarouselShareQREnabled;
local l_FlyoutSidePanelIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP;
local v18 = v6.strictInterface({
    [l_OmniFeedProps_0.key] = l_OmniFeedProps_0.interface, 
    topic = v6.optional(v6.string), 
    topicId = v6.optional(v6.string), 
    formFactor = v6.string, 
    refresh = v6.callback, 
    selectionOrderBase = v6.optional(v6.number), 
    useGridPageLayout = v6.optional(v6.boolean), 
    networking = v6.any, 
    uiModeInfo = v6.any
});
return function(v19) --[[ Line: 51 ]]
    -- upvalues: v18 (copy), l_FFlagSocialCarouselShareQREnabled_0 (copy), l_useDispatch_0 (copy), v3 (copy), v9 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_OmniFeedProps_0 (copy), l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 (copy), l_AppPage_0 (copy), v2 (copy), v10 (copy), l_Constants_0 (copy), l_FFlagFlyoutHideFriendsHeader_0 (copy), l_FlyoutSidePanelIXP_0 (copy)
    v18(v19);
    local v20 = if l_FFlagSocialCarouselShareQREnabled_0 then l_useDispatch_0() else nil;
    local v22 = if l_FFlagSocialCarouselShareQREnabled_0 then v3.useCallback(function(v21) --[[ Line: 56 ]]
        -- upvalues: v20 (copy), v9 (ref)
        v20(v9(v21));
    end, {
        v20
    }) else nil;
    local v23 = l_FFlagLuaAppCompositionAlways_0 and true or if l_FFlagLuaAppCompositionSupport_0 then v19[l_OmniFeedProps_0.key].appCompositionEnabled else nil;
    local v24 = v19[l_OmniFeedProps_0.key].selectionOrderBase or 0;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then
        v26 = v19[l_OmniFeedProps_0.key] and v19[l_OmniFeedProps_0.key].appPage or l_AppPage_0.Home;
        v27 = v19[l_OmniFeedProps_0.key] and v19[l_OmniFeedProps_0.key].feedItemPosition or nil;
        local v28 = v19[l_OmniFeedProps_0.key] and v19[l_OmniFeedProps_0.key].feedItemStartRow or nil;
        v25 = v3.useMemo(function() --[[ Line: 76 ]]
            -- upvalues: v27 (ref), v26 (ref), v19 (copy), v28 (copy)
            return {
                sortIndex = v27 or -1, 
                appPage = v26, 
                sortId = v19.topicId, 
                startRow = v28 or -1
            };
        end, {
            v27, 
            v26, 
            v19.topicId, 
            v28
        });
    end;
    return v2.createElement(v10.Entry, {
        unifiedLogging = {
            sortIndex = if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v27 else v19[l_OmniFeedProps_0.key].feedItemPosition, 
            appPage = if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v26 else v19[l_OmniFeedProps_0.key].appPage, 
            sortId = v19.topicId, 
            scrollViewPositionChangedSignal = v19[l_OmniFeedProps_0.key].scrollViewPositionChangedSignal, 
            impressionTag = "HomeFriendCarousel"
        }, 
        sortAnalyticsData = if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v25 else nil, 
        refreshSignal = v19[l_OmniFeedProps_0.key].refreshSignal, 
        selectionOrderBase = v24, 
        source = l_Constants_0.ANALYTICS.SRC.HOMEPAGE_FRIENDS_CAROUSEL, 
        hideCarouselHeader = l_FFlagFlyoutHideFriendsHeader_0 and l_FlyoutSidePanelIXP_0.isFlyoutSidePanelEnabled() and true or nil, 
        appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v23 else nil, 
        navigateToQRCodePage = if l_FFlagSocialCarouselShareQREnabled_0 then v22 else nil
    });
end;