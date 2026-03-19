local l_CorePackages_0 = game:GetService("CorePackages");
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_SduiOmniFeedItem_0 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi).SduiOmniFeedItem;
local l_OmniFeedTypes_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).OmniFeedTypes;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_GameCarouselFeedItem_0 = l_Modules_0.Personalization.OmniFeed.FeedItems.GameCarouselFeedItem;
local l_SongCarouselFeedItem_0 = l_Modules_0.Personalization.OmniFeed.FeedItems.SongCarouselFeedItem;
local l_HomeGameGridFlexFeedItem_0 = l_Modules_0.Personalization.OmniFeed.FeedItems.HomeGameGridFlexFeedItem;
local l_SearchGameGridFeedItem_0 = l_Modules_0.Personalization.OmniFeed.FeedItems.SearchGameGridFeedItem;
local l_SearchTextFeedItem_0 = l_Modules_0.Personalization.OmniFeed.FeedItems.SearchTextFeedItem;
local l_GameFiltersFeedItem_0 = l_Modules_0.Personalization.OmniFeed.FeedItems.GameFiltersFeedItem;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v12 = require(l_Modules_1.Personalization.OmniFeed.FeedItems.UserInfoFeedItem);
local v13 = require(l_Modules_1.Personalization.OmniFeed.FeedItems.FriendCarouselFeedItem.FriendCarouselFeedItem);
local v14 = require(l_Modules_1.Personalization.OmniFeed.FeedItems.JoinYourFriendsFeedItem);
local v15 = require(l_Modules_1.Personalization.OmniFeed.FeedItems.FriendRecommendationCarouselFeedItem);
local v16 = require(l_Modules_1.Personalization.OmniFeed.FeedItems.UserSearchGridFeedItem);
local v17 = require(l_Modules_1.Personalization.OmniFeed.FeedItems.UpsellCardFeedItem);
local v18 = require(l_Modules_1.Personalization.OmniFeed.FeedItems.SearchPillCarouselFeedItem);
local l_FFlagSearchOmniAutocompletePage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage;
local l_FFlagEnableTopSongsSort_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableTopSongsSort;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local function v23(v22) --[[ Line: 32 ]]
    -- upvalues: l_OmniFeedTypes_0 (copy), l_GameCarouselFeedItem_0 (copy), l_FFlagEnableTopSongsSort_0 (copy), l_SongCarouselFeedItem_0 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_IsVRAppBuild_0 (copy), v12 (copy), v14 (copy), v13 (copy), l_SduiOmniFeedItem_0 (copy), v15 (copy), l_HomeGameGridFlexFeedItem_0 (copy), l_SearchGameGridFeedItem_0 (copy), l_SearchTextFeedItem_0 (copy), v17 (copy), v16 (copy), l_GameFiltersFeedItem_0 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), v18 (copy)
    if v22 == l_OmniFeedTypes_0.Carousel then
        return l_GameCarouselFeedItem_0;
    elseif l_FFlagEnableTopSongsSort_0 and v22 == l_OmniFeedTypes_0.SongCarousel then
        return l_SongCarouselFeedItem_0;
    elseif v22 == l_OmniFeedTypes_0.UserInfo then
        if (l_isSubjectToDesktopPolicies_0() or l_IsVRAppBuild_0()) and not _G.__TESTEZ_RUNNING_TEST__ then
            return nil;
        else
            return v12;
        end;
    elseif v22 == l_OmniFeedTypes_0.JoinYourFriendsCarousel then
        return v14;
    elseif v22 == l_OmniFeedTypes_0.FriendCarousel then
        return v13;
    elseif v22 == l_OmniFeedTypes_0.AvatarCarousel then
        warn("AvatarCarousel is not currently supported on the client");
        return nil;
    elseif v22 == l_OmniFeedTypes_0.ServerDrivenUi then
        return l_SduiOmniFeedItem_0;
    elseif v22 == l_OmniFeedTypes_0.FriendRecommendationCarousel then
        return v15;
    elseif v22 == l_OmniFeedTypes_0.HomeGameGrid then
        return l_HomeGameGridFlexFeedItem_0;
    elseif v22 == l_OmniFeedTypes_0.GenreExplorer then
        warn("GenreExplorer is not currently supported on the client");
        return nil;
    elseif v22 == l_OmniFeedTypes_0.SearchGameGrid then
        return l_SearchGameGridFeedItem_0;
    elseif v22 == l_OmniFeedTypes_0.SearchText then
        return l_SearchTextFeedItem_0;
    elseif v22 == l_OmniFeedTypes_0.UpsellCard then
        return v17;
    elseif v22 == l_OmniFeedTypes_0.UserSearchGrid then
        return v16;
    elseif v22 == l_OmniFeedTypes_0.Pills then
        return l_GameFiltersFeedItem_0;
    elseif l_FFlagSearchOmniAutocompletePage_0 and v22 == l_OmniFeedTypes_0.SearchPillCarousel then
        return v18;
    else
        warn("Unmapped omni feed item type: " .. tostring(v22));
        return nil;
    end;
end;
return {
    getComponent = v23, 
    hasComponent = function(v24) --[[ Line: 80 ]] --[[ Name: hasComponent ]]
        -- upvalues: v23 (copy)
        return v23(v24) ~= nil;
    end
};