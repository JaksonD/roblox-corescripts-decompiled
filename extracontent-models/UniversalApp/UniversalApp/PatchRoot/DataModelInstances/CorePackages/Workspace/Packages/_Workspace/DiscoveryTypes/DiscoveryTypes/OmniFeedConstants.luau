local l_Parent_0 = script:FindFirstAncestor("DiscoveryTypes").Parent;
local l_FFlagLuaAppHeaderButtonText_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHeaderButtonText;
local l_FFlagLuaAppRfySignalApportioningIxp_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppRfySignalApportioningIxp;
local l_FFlagLuaAppEnableWhyThisAdModal_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableWhyThisAdModal;
local l_FFlagLuaAppSearchGridTiles_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSearchGridTiles;
local l_FFlagLuaAppEnableSponsoredReportAd_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableSponsoredReportAd;
local l_FFlagLuaAppSupportAdRatingFooter_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooter;
local l_FFlagLuaAppSupportAdRatingFooterExperiment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment;
local l_FFlagLuaAppChartsStickyHeader_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsStickyHeader;
local _ = require(script.Parent.RoduxTypes);
return {
    EventContext = "HomeOmniFeed", 
    OmniSortRetrievalStatus = {
        Exception = "Exception", 
        Success = "Success"
    }, 
    GlobalLayoutDataKeys = {
        JYFRefresh = "JYFRefresh"
    }, 
    TopicLayoutDataKeys = {
        PYMKFindFriendsEnabled = "PYMKFindFriendsEnabled", 
        PYMKSeeAllEnabled = "PYMKSeeAllEnabled", 
        JYFFindFriendsEnabled = "JYFFindFriendsEnabled", 
        ComponentType = "componentType", 
        PlayerCountStyle = "playerCountStyle", 
        IsSponsoredFooterAllowed = "isSponsoredFooterAllowed", 
        LinkPath = "linkPath", 
        SubtitleLinkPath = "subtitleLinkPath", 
        HideSeeAll = "hideSeeAll", 
        InfoText = "infoText", 
        EndTimestamp = "endTimestamp", 
        CountdownString = "countdownString", 
        PlayButtonStyle = "playButtonStyle", 
        BackgroundImageAssetId = "backgroundImageAssetId", 
        HeaderButtonText = l_FFlagLuaAppHeaderButtonText_0 and "headerButtonText" or nil, 
        HideTileMetadata = "hideTileMetadata", 
        HideTileTitle = "hideTileTitle", 
        ContainedTile = "containedTile", 
        EnableExplicitFeedback = "enableExplicitFeedback", 
        EnableSignalApportioning = l_FFlagLuaAppRfySignalApportioningIxp_0 and "enableSignalApportioning" or nil, 
        SponsoredUserCohort = l_FFlagLuaAppEnableWhyThisAdModal_0 and "sponsoredUserCohort" or nil, 
        EnableSponsoredFeedback = "enableSponsoredFeedback", 
        EnableCollectionGrid = l_FFlagLuaAppSearchGridTiles_0 and "enableCollectionGrid" or nil, 
        EnableReportAd = l_FFlagLuaAppEnableSponsoredReportAd_0 and "enableReportAd" or nil, 
        IsSponsoredRatingFooterAllowed = l_FFlagLuaAppSupportAdRatingFooter_0 and "isSponsoredRatingFooterAllowed" or nil, 
        SponsoredFooterAdLabelText = l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and "sponsoredFooterAdLabelText" or nil, 
        SponsoredFooterAdLabelFirst = l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and "sponsoredFooterAdLabelFirst" or nil, 
        SponsoredFooterIncludeRatingContent = l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and "sponsoredFooterIncludeRatingContent" or nil
    }, 
    ComponentTypeDataKeys = {
        EventTile = "EventTile", 
        GridTile = "GridTile", 
        AppGameTileNoMetadata = "AppGameTileNoMetadata"
    }, 
    ItemLayoutDataKeys = {
        Footer = "Footer"
    }, 
    OmniRecommendationsRequestIntent = {
        ManualRefresh = "manualRefresh", 
        AutoRefresh = "autoRefresh", 
        FriendPresenceChange = "friendPresenceChange", 
        LogIn = "logIn", 
        LoadMore = "loadMore", 
        GameExit = "gameExit"
    }, 
    ContentGroupType = {
        Game = "Game", 
        Text = "Text", 
        User = "User"
    }, 
    OmniFeedPageSection = if l_FFlagLuaAppChartsStickyHeader_0 then {
        Header = "Header"
    } else nil
};