local l_CorePackages_0 = game:GetService("CorePackages");
local l_AdService_0 = game:GetService("AdService");
local l_IXPService_0 = game:GetService("IXPService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_ApiFetchGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local l_FetchGamePlayabilityAndProductInfo_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).FetchGamePlayabilityAndProductInfo;
local l_PlayabilityStatusEnum_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).PlayabilityStatusEnum;
local l_EnumGameDetailErrorTypes_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).EnumGameDetailErrorTypes;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v17 = require(l_CorePackages_0.Packages.SignalsReact);
local v18 = require(l_CorePackages_0.Packages.React);
local v19 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local v21 = require(l_CorePackages_0.Packages.RoactNavigation);
local v22 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v24 = require(script.Parent.Parent.ExperienceDetails.ExperienceDetailsExperimentation);
local l_GameInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).GameInfosReducer;
local l_ExperienceDetailsNoticeType_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).ExperienceDetailsNoticeType;
local v27 = require(l_CorePackages_0.Packages.UIBlox);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_withStyle_0 = v27.Style.withStyle;
local l_LoadingStateContainer_0 = v27.App.Container.LoadingStateContainer;
local l_RetrievalStatus_1 = v27.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = v27.App.Indicator.EmptyState;
local l_PlayWithRewardComponent_0 = require(l_CorePackages_0.Workspace.Packages.PlayWithRewardComponent).PlayWithRewardComponent;
local l_FetchPlayWithRewardState_0 = require(l_CorePackages_0.Workspace.Packages.PlayWithRewardComponent).FetchPlayWithRewardState;
local l_SetPlayWithRewardState_0 = require(l_CorePackages_0.Workspace.Packages.PlayWithRewardState).SetPlayWithRewardState;
local v36 = require(script.Parent.Parent.ExperienceDetails.Hooks.useEdpServerIxpVariables);
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_MediaGallerySwiped_0 = l_Modules_0.LuaApp.Analytics.Events.Games.GameDetailsEvents.MediaGallerySwiped;
local l_MediaGalleryMediaChanged_0 = l_Modules_0.LuaApp.Analytics.Events.Games.GameDetailsEvents.MediaGalleryMediaChanged;
local l_checkAndFormatPossibleLink_0 = require(l_CorePackages_0.Workspace.Packages.CollectionViews).checkAndFormatPossibleLink;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v42 = require(l_Modules_1.LuaApp.Constants);
local v43 = require(l_Modules_1.LuaApp.Thunks.ApiFetchExperienceDetailsPage);
local v44 = require(l_Modules_1.LuaApp.Thunks.ApiFetchExperienceDetailsPageCounters);
local v45 = require(l_Modules_1.LuaApp.Components.LoadingSkeleton);
local v46 = require(l_Modules_1.LuaApp.Components.GameDetails.GameInfoList);
local v47 = require(l_Modules_1.LuaApp.Components.GameDetails.GameHeader);
local v48 = require(l_Modules_1.LuaApp.Components.GameDetails.GamePlaysAndRatings);
local v49 = require(l_Modules_1.LuaApp.Thunks.Games.FetchGameDetailsPageData);
local v50 = require(l_Modules_1.LuaApp.Thunks.Games.RecommendedGames);
local v51 = require(l_Modules_1.LuaApp.Components.VirtualEvents.EventsListWrapper);
local v52 = require(l_Modules_1.LuaApp.Components.ExperienceDetails.GameStatsCarousel);
local v53 = require(l_Modules_1.LuaApp.Components.ExperienceDetails.ExperienceTagsContainer);
local v54 = require(l_Modules_1.LuaApp.Components.ExperienceDetails.ExperienceDescription);
local v55 = require(l_Modules_1.LuaApp.Components.ExperienceDetails.ExperienceMediaGallery);
local v56 = require(l_Modules_1.LuaApp.Components.ExperienceDetails.IgrsRatingLabel);
local v57 = require(l_Modules_1.LuaApp.Components.GameDetails.GameRefundPolicy);
local v58 = require(l_Modules_1.LuaApp.Thunks.OpenRefundPolicyLearnMorePage);
local v59 = require(l_Modules_1.LuaApp.Thunks.OpenWebview);
local v60 = require(l_Modules_1.LuaApp.Components.ExperienceDetails.ExperienceSongsCarousel);
local v61 = require(l_Modules_1.LuaApp.Components.ExperienceDetails.RecommendedExperienceCarousel);
local v62 = require(script.Parent.Parent.ExperienceDetails.EdpSduiUtils);
local v63 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi);
local v64 = require(l_CorePackages_0.Workspace.Packages.GameDetailTelemetry);
local l_EDPTTIConstants_0 = v64.EDPTTIConstants;
local l_FFlagEDPTTITrackingEnabled_0 = v64.FFlagEDPTTITrackingEnabled;
local v67 = require(l_Modules_1.LuaApp.Components.ExperienceDetails.useEDPTTITracking);
local l_useFirstMediaCarouselImageUri_0 = require(l_Modules_1.LuaApp.Components.ExperienceDetails.useFirstMediaCarouselImageUri).useFirstMediaCarouselImageUri;
local l_FFlagLuaAppShowNoticeOnEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppShowNoticeOnEdp;
local l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppExperienceDetailsLayoutOrderConfig;
local l_FFlagSongEdpCarouselIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSongEdpCarouselIxp;
local v72 = game:DefineFastFlag("LuaAppFixNoticeLocalization", false);
local l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableConsolidatedGameRefundPolicy;
local l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignIxp;
local l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreviewIxp;
local l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignTelemetry;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local l_FFlagEnablePlayWithRewardComponent_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnablePlayWithRewardComponent;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp;
local l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents;
local l_FFlagLuaAppAddIgrsRatingToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddIgrsRatingToEdp;
local l_FFlagLuaAppExpandableTextImpressionsEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppExpandableTextImpressionsEnabled;
local v85 = {
    [1] = {
        Size = UDim2.new(0.5, 0, 0, 35)
    }, 
    [2] = {
        Size = UDim2.new(0.25, 0, 0, 24)
    }, 
    [3] = {
        Size = UDim2.new(1, 0, 0, 200)
    }, 
    [4] = {
        Size = UDim2.new(1, 0, 0, 24)
    }, 
    [5] = {
        Size = UDim2.new(0.6, 0, 0, 24)
    }
};
local function _(v86) --[[ Line: 130 ]] --[[ Name: getInnerPaddingSize ]]
    if v86 < 600 then
        return 20;
    else
        return 40;
    end;
end;
local function _() --[[ Line: 134 ]] --[[ Name: createLayoutOrderGenerator ]]
    local v88 = 0;
    return function() --[[ Line: 136 ]]
        -- upvalues: v88 (ref)
        v88 = v88 + 1;
        return v88;
    end;
end;
local v90 = {
    Header = 100, 
    MediaGallery = 125, 
    StatsCarousel = 200, 
    TagSection = 300, 
    MovedEventsList = 400, 
    Description = 500, 
    IgrsRatingLabel = l_FFlagLuaAppAddIgrsRatingToEdp_0 and 550 or nil, 
    PlaysAndRatings = 600, 
    InfoList = 700, 
    RefundPolicy = 900, 
    Notice = 1000, 
    RecommendedGames = 1100, 
    ExperienceSongsCarousel = 1200, 
    SduiFeedItemsDefault = 1500
};
local v91 = v3.PureComponent:extend("GameDetailsCard");
v91.init = function(v92) --[[ Line: 161 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagEnablePlayWithRewardComponent_0 (copy), v19 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (copy), l_MediaGallerySwiped_0 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (copy), l_MediaGalleryMediaChanged_0 (copy), l_memoize_0 (copy), l_checkAndFormatPossibleLink_0 (copy), v3 (copy), l_RetrievalStatus_0 (copy)
    if l_FFlagEnablePlayWithRewardComponent_0 then
        v92.state = {
            didFocus = false
        };
        v92.onDidFocus = function() --[[ Line: 164 ]]
            -- upvalues: v92 (copy)
            v92:setState({
                didFocus = true
            });
        end;
    end;
    local l_universeId_0 = v92.props.universeId;
    v19.isType(l_universeId_0, "string", "GameDetailsCard.init.universeId");
    v92.fetchGameDetailsPageData = function() --[[ Line: 172 ]]
        -- upvalues: v92 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref)
        local l_networking_0 = v92.props.networking;
        local l_universeId_1 = v92.props.universeId;
        return v92.props.fetchGameDetailsPageData(l_networking_0, l_universeId_1, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v92.props.shouldHydrateLegacyIxp else nil, if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v92.props.shouldInterleaveSduiIxp else nil, if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v92.props.shouldInterleaveSduiIxp then v92.props.sduiDataUpdatedTimestamp else nil);
    end;
    v92.onMediaGallerySwiped = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then nil else function() --[[ Line: 191 ]]
        -- upvalues: v92 (copy), l_MediaGallerySwiped_0 (ref), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref)
        local v96 = v92.props.gameDetail and v92.props.gameDetail.rootPlaceId or nil;
        if v96 then
            l_MediaGallerySwiped_0(v92.props.eventIngest, "GameDetailsCard", v96, if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then {
                universeId = v92.props.universeId
            } else nil);
        end;
    end;
    v92.onMediaGalleryMediaChanged = l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 and function(v97, v98, v99, v100) --[[ Line: 208 ]]
        -- upvalues: v92 (copy), l_MediaGalleryMediaChanged_0 (ref), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref)
        local v101 = v92.props.gameDetail and v92.props.gameDetail.rootPlaceId or nil;
        if v101 then
            l_MediaGalleryMediaChanged_0(v92.props.eventIngest, "GameDetailsCard", v101, {
                imageAssetId = v97, 
                videoAssetId = v98, 
                isYouTubeVideo = v99, 
                autoAdvance = v100, 
                universeId = if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v92.props.universeId else nil
            });
        end;
    end or nil;
    v92.linkStartStyle = l_memoize_0(function(v102) --[[ Line: 222 ]]
        local l_Color3_0 = v102.Tokens.Semantic.Color.Text.Link.Color3;
        return (("<font color=\"%*\"><b>"):format((string.format("rgb(%d, %d, %d)", math.round(l_Color3_0.R * 255), math.round(l_Color3_0.G * 255), (math.round(l_Color3_0.B * 255))))));
    end);
    v92.checkAndFormatPossibleLink = l_memoize_0(function(v104, v105) --[[ Line: 234 ]]
        -- upvalues: l_checkAndFormatPossibleLink_0 (ref), v92 (copy)
        return l_checkAndFormatPossibleLink_0(v105, nil, nil, v92.linkStartStyle(v104), "</b></font>");
    end);
    v92.renderRefundPolicy = function(v106, v107, v108) --[[ Line: 240 ]]
        -- upvalues: v92 (copy), v3 (ref)
        local l_Body_0 = v106.Tokens.Semantic.Typography.Body;
        local l_Muted_0 = v106.Tokens.Semantic.Color.Text.Muted;
        local v111, v112 = v92.checkAndFormatPossibleLink(v106, v107.policyText);
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v108
        }, {
            RefundPolicy = v3.createElement("TextButton", {
                BackgroundTransparency = 1, 
                Text = v112, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Font = l_Body_0.Font, 
                TextSize = l_Body_0.FontSize, 
                TextColor3 = l_Muted_0.Color3, 
                TextTransparency = l_Muted_0.Transparency, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                RichText = v111, 
                [v3.Event.Activated] = function(_) --[[ Line: 264 ]]
                    -- upvalues: v92 (ref), v107 (copy)
                    v92.props.openRefundPolicyLearnMorePage(v107.learnMoreUrl);
                end
            })
        });
    end;
    v92.maybeFetchPlayWithReward = l_FFlagEnablePlayWithRewardComponent_0 and function() --[[ Line: 272 ]]
        -- upvalues: v92 (copy), l_RetrievalStatus_0 (ref)
        if v92.state.didFocus ~= true or v92.props.gameDetailsPageDataStatus ~= l_RetrievalStatus_0.Done then
            return;
        else
            local v114 = tonumber(v92.props.localUserId);
            if not v114 then
                return;
            elseif v92.props.playWithRewardData and v92.props.playWithRewardData.universeId == v92.props.universeId then
                return;
            else
                v92:setState({
                    didFocus = false
                });
                v92.props.fetchPlayWithReward(v92.props.universeId, v114):catch(function() --[[ Line: 287 ]]

                end);
                return;
            end;
        end;
    end or nil;
end;
v91.renderOnLoading = function(_, v116) --[[ Line: 292 ]] --[[ Name: renderOnLoading ]]
    -- upvalues: v3 (copy), v45 (copy), v85 (copy)
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Padding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, v116), 
            PaddingRight = UDim.new(0, v116)
        }), 
        Skeleton = v3.createElement(v45, {
            Size = UDim2.new(1, 0, 1, 0), 
            createLayout = function() --[[ Line: 304 ]] --[[ Name: createLayout ]]
                -- upvalues: v3 (ref)
                return v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 15)
                });
            end, 
            panels = v85
        })
    });
end;
v91.renderOnLoaded = function(v117, v118, v119, v120, v121) --[[ Line: 317 ]] --[[ Name: renderOnLoaded ]]
    -- upvalues: l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v24 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), l_FFlagEnablePlayWithRewardComponent_0 (copy), l_withStyle_0 (copy), v3 (copy), l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 (copy), v47 (copy), v90 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v55 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (copy), v52 (copy), v53 (copy), v51 (copy), v54 (copy), l_RetrievalStatus_1 (copy), l_FFlagLuaAppExpandableTextImpressionsEnabled_0 (copy), l_AppPage_0 (copy), v56 (copy), v42 (copy), v48 (copy), v46 (copy), l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 (copy), v57 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_ExperienceDetailsNoticeType_0 (copy), v72 (copy), l_RetrievalStatus_0 (copy), v61 (copy), l_FFlagSongEdpCarouselIxp_0 (copy), v60 (copy), l_PlayWithRewardComponent_0 (copy)
    local l_universeId_2 = v117.props.universeId;
    local l_gameDetail_0 = v117.props.gameDetail;
    local l_gameInfo_0 = v117.props.gameInfo;
    local v125 = l_gameDetail_0 and l_gameDetail_0.rootPlaceId or l_gameInfo_0 and l_gameInfo_0.placeId;
    local v126 = v117.props.showRecommendedGames and v117.props.enableRecommendedGames;
    local v127 = l_gameDetail_0 and v117.props.enableSocial;
    local v128 = l_gameDetail_0 and v117.props.enableGameInfoList;
    local l_enableGamePlaysAndRatings_0 = v117.props.enableGamePlaysAndRatings;
    local l_enableGamePassPreview_0 = v117.props.enableGamePassPreview;
    if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v24.getShouldInterleaveSdui()) and v117.props.edpServerIxpVariables and v117.props.edpServerIxpVariables.hideGameRatings == true then
        l_enableGamePlaysAndRatings_0 = false;
    end;
    local v131 = l_gameDetail_0 and l_gameDetail_0.description ~= nil and l_gameDetail_0.description ~= "";
    local l_showGlobalCounters_0 = v117.props.showGlobalCounters;
    local l_showLikesFavoritesCount_0 = v117.props.showLikesFavoritesCount;
    local l_ageRecommendations_0 = v117.props.ageRecommendations;
    local v135 = if l_FFlagLuaAppAddIgrsRatingToEdp_0 and l_ageRecommendations_0 and l_ageRecommendations_0.summary and l_ageRecommendations_0.summary.ageRecommendation and l_ageRecommendations_0.summary.ageRecommendation.igrsRating and l_ageRecommendations_0.summary.ageRecommendation.igrsRating ~= "" then l_ageRecommendations_0.summary.ageRecommendation.igrsRating else nil;
    local v136 = if l_FFlagLuaAppAddIgrsRatingToEdp_0 and l_ageRecommendations_0 and l_ageRecommendations_0.summary and l_ageRecommendations_0.summary.ageRecommendation and l_ageRecommendations_0.summary.ageRecommendation.igrsRatingDisplayMessage then l_ageRecommendations_0.summary.ageRecommendation.igrsRatingDisplayMessage else nil;
    local l_notificationsCanAccessExperience_0 = v117.props.notificationsCanAccessExperience;
    if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v24.getShouldInterleaveSdui()) and v117.props.edpServerIxpVariables and v117.props.edpServerIxpVariables.hideNotifyButton == true then
        l_notificationsCanAccessExperience_0 = false;
    end;
    local v138 = 0;
    local v139;
    do
        local l_v138_0 = v138;
        v139 = function() --[[ Line: 136 ]]
            -- upvalues: l_v138_0 (ref)
            l_v138_0 = l_v138_0 + 1;
            return l_v138_0;
        end;
    end;
    v138 = v117.props.webViewSupport and l_gameDetail_0 ~= nil and l_gameDetail_0.refundPolicy ~= nil;
    local v141 = if l_FFlagEnablePlayWithRewardComponent_0 then v117.props.isPlayabilitySettledAndPlayable else nil;
    return l_withStyle_0(function(v142) --[[ Line: 380 ]]
        -- upvalues: v3 (ref), v119 (copy), l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 (ref), v47 (ref), v90 (ref), l_universeId_2 (copy), l_notificationsCanAccessExperience_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v117 (copy), v139 (copy), v55 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (ref), v118 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v24 (ref), v52 (ref), v53 (ref), v51 (ref), v125 (copy), v131 (copy), v54 (ref), l_RetrievalStatus_1 (ref), v120 (copy), l_gameDetail_0 (copy), l_FFlagLuaAppExpandableTextImpressionsEnabled_0 (ref), l_AppPage_0 (ref), l_FFlagLuaAppAddIgrsRatingToEdp_0 (ref), v135 (copy), v56 (ref), v136 (copy), v42 (ref), v121 (copy), l_enableGamePlaysAndRatings_0 (ref), v48 (ref), l_showGlobalCounters_0 (copy), l_showLikesFavoritesCount_0 (copy), v128 (copy), v46 (ref), v127 (copy), l_ageRecommendations_0 (copy), l_enableGamePassPreview_0 (copy), v138 (copy), l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 (ref), v57 (ref), l_FFlagLuaAppShowNoticeOnEdp_0 (ref), l_ExperienceDetailsNoticeType_0 (ref), v72 (ref), l_RetrievalStatus_0 (ref), v126 (copy), v61 (ref), l_FFlagSongEdpCarouselIxp_0 (ref), v60 (ref), l_gameInfo_0 (copy), l_FFlagEnablePlayWithRewardComponent_0 (ref), v141 (copy), l_PlayWithRewardComponent_0 (ref)
        local v143 = {
            ListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 20)
            }), 
            PagePadding = v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v119), 
                PaddingRight = UDim.new(0, v119), 
                PaddingTop = UDim.new(0, 0), 
                PaddingBottom = UDim.new(0, 20)
            }), 
            Header = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v3.createElement(v47, {
                LayoutOrder = v90.Header, 
                universeId = l_universeId_2, 
                showNotificationButton = l_notificationsCanAccessExperience_0, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v117.props.shouldHydrateLegacyIxp else nil
            }) else v3.createElement("Frame", {
                LayoutOrder = v139(), 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                ListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 20)
                }), 
                MediaGalleryFrame = v3.createElement("Frame", {
                    LayoutOrder = 2, 
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    MediaGallery = v3.createElement(v55, {
                        universeId = l_universeId_2, 
                        deviceType = "Phone", 
                        showYouTubeVideoFirst = false, 
                        onSwipe = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then nil else v117.onMediaGallerySwiped, 
                        onMediaGalleryMediaChanged = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v117.onMediaGalleryMediaChanged else nil, 
                        mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v117.props.mediaGalleryRedesignEnabledIxp else nil, 
                        mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v117.props.mediaGalleryVideoPreviewEnabledIxp else nil, 
                        shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v117.props.shouldHydrateLegacyIxp else nil
                    }), 
                    SizeConstraint = v3.createElement("UISizeConstraint", {
                        MinSize = Vector2.new(0, (v118 - v119 * 2) / 1.7777777777777777)
                    })
                }), 
                Header = v3.createElement(v47, {
                    LayoutOrder = 1, 
                    universeId = l_universeId_2, 
                    showNotificationButton = l_notificationsCanAccessExperience_0, 
                    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v117.props.shouldHydrateLegacyIxp else nil
                })
            }), 
            MediaGalleryFrame = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v3.createElement("Frame", {
                LayoutOrder = v90.MediaGallery, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                MediaGallery = v3.createElement(v55, {
                    universeId = l_universeId_2, 
                    deviceType = "Phone", 
                    showYouTubeVideoFirst = false, 
                    onSwipe = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then nil else v117.onMediaGallerySwiped, 
                    onMediaGalleryMediaChanged = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v117.onMediaGalleryMediaChanged else nil, 
                    mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v117.props.mediaGalleryRedesignEnabledIxp else nil, 
                    mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v117.props.mediaGalleryVideoPreviewEnabledIxp else nil, 
                    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v117.props.shouldHydrateLegacyIxp else nil
                }), 
                SizeConstraint = v3.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, (v118 - v119 * 2) / 1.7777777777777777)
                })
            }) else nil, 
            StatsCarousel = if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v24.getShouldInterleaveSdui()) and v117.props.edpServerIxpVariables and v117.props.edpServerIxpVariables.hideStatsCarousel == true then nil else v3.createElement(v52, {
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v90.StatsCarousel else v139(), 
                universeId = l_universeId_2, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v117.props.shouldHydrateLegacyIxp else nil
            }), 
            TagSection = v3.createElement(v53, {
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v90.TagSection else v139(), 
                universeId = l_universeId_2, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v117.props.shouldHydrateLegacyIxp else nil, 
                hideContentDescriptors = (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v24.getShouldInterleaveSdui()) and v117.props.edpServerIxpVariables and v117.props.edpServerIxpVariables.showContentDescriptorsInInfoList == true or nil
            }), 
            MovedEventsList = v3.createElement(v51, {
                layoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v90.MovedEventsList else v139(), 
                universeId = l_universeId_2, 
                referralSource = "expDetailsPage", 
                defaultThumbnail = if v125 then ("rbxthumb://type=GameThumbnail&id=%d&w=768&h=432"):format(v125) else nil, 
                peekViewFormat = true
            }), 
            Description = if v131 then v3.createElement(v54, {
                dataStatus = l_RetrievalStatus_1.fromRawValue(v120), 
                descriptionText = l_gameDetail_0 and l_gameDetail_0.description, 
                expandable = true, 
                listPadding = v142.Tokens.Global.Space_125, 
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v90.Description else v139(), 
                universeId = if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then l_universeId_2 else nil, 
                pageContext = if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then l_AppPage_0.GameDetail else nil, 
                componentType = l_FFlagLuaAppExpandableTextImpressionsEnabled_0 and "gameDescription" or nil, 
                viewportBoundsOffset = if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then v117.props.viewportBoundsOffset else nil
            }) else nil, 
            IgrsRatingLabel = if l_FFlagLuaAppAddIgrsRatingToEdp_0 and v135 then v3.createElement(v56, {
                igrsRating = v135, 
                igrsRatingDisplayMessage = v136, 
                onActivated = function() --[[ Line: 564 ]] --[[ Name: onActivated ]]
                    -- upvalues: v117 (ref), v42 (ref), v121 (ref)
                    v117.props.openWebview(v42.INDONESIAN_CONTENT_MATURITY_URL, v121.contentMaturityHeader);
                end, 
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v90.IgrsRatingLabel else v139()
            }) else nil, 
            PlaysAndRatings = l_enableGamePlaysAndRatings_0 and v3.createElement(v48, {
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v90.PlaysAndRatings else v139(), 
                universeId = l_universeId_2, 
                containerWidth = v118 - 2 * v119, 
                rowPadding = 20, 
                showGlobalCounters = l_showGlobalCounters_0, 
                showLikesFavoritesCount = l_showLikesFavoritesCount_0, 
                hideVisits = true, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v117.props.shouldHydrateLegacyIxp else nil
            }), 
            InfoList = v128 and v3.createElement(v46, {
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v90.InfoList else v139(), 
                universeId = l_universeId_2, 
                leftPadding = v119, 
                rightPadding = v119, 
                showSocial = v127, 
                ageRecommendations = l_ageRecommendations_0, 
                width = v118, 
                enableGamePassPreview = l_enableGamePassPreview_0, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v117.props.shouldHydrateLegacyIxp else nil
            }), 
            RefundPolicy = if v138 then if l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 then v3.createElement(v57, {
                refundPolicy = l_gameDetail_0.refundPolicy, 
                layoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v90.RefundPolicy else v139()
            }) else v117.renderRefundPolicy(v142, l_gameDetail_0.refundPolicy, if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v90.RefundPolicy else v139()) else nil, 
            Notice = if l_FFlagLuaAppShowNoticeOnEdp_0 and v117.props.experienceDetailsNoticeType == l_ExperienceDetailsNoticeType_0.InExperiencePurchase then v3.createElement(v54, {
                dataStatus = if v72 then l_RetrievalStatus_1.fromRawValue(l_RetrievalStatus_0.Done) else l_RetrievalStatus_1.fromRawValue(v120), 
                headerText = v121.noticeHeader, 
                descriptionText = v121.noticeText, 
                expandable = false, 
                listPadding = v142.Tokens.Global.Space_125, 
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v90.Notice else v139(), 
                universeId = if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then l_universeId_2 else nil, 
                pageContext = if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then l_AppPage_0.GameDetail else nil, 
                componentType = l_FFlagLuaAppExpandableTextImpressionsEnabled_0 and "gameNotice" or nil, 
                viewportBoundsOffset = if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then v117.props.viewportBoundsOffset else nil
            }) else nil, 
            RecommendedGames = v126 and v3.createElement("Frame", {
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v90.RecommendedGames else v139(), 
                Size = UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                Carousel = v3.createElement(v61, {
                    universeId = l_universeId_2, 
                    pageContext = l_AppPage_0.GameDetail, 
                    onPeekViewClosed = v117.props.onPeekViewClosed, 
                    scrollingEnabled = true, 
                    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v117.props.shouldHydrateLegacyIxp else nil
                })
            }), 
            ExperienceSongsCarousel = if l_FFlagSongEdpCarouselIxp_0 and v117.props.showSongCarousel then v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v90.ExperienceSongsCarousel else v139()
            }, {
                v3.createElement(v60, {
                    universeId = l_universeId_2, 
                    universeTitle = l_gameDetail_0 and l_gameDetail_0.name or l_gameInfo_0 and l_gameInfo_0.name or "", 
                    collectionOrder = 2, 
                    clipsDescendants = false
                })
            }) else nil, 
            PlayWithRewardComponent = if l_FFlagEnablePlayWithRewardComponent_0 and v141 then v3.createElement(l_PlayWithRewardComponent_0, {
                universeId = l_universeId_2, 
                placeId = v125, 
                flowId = if v117.props.playWithRewardData then v117.props.playWithRewardData.flowId else "", 
                fetchedUniverseId = if v117.props.playWithRewardData then v117.props.playWithRewardData.universeId else nil, 
                playWithRewardAdData = if v117.props.playWithRewardData then v117.props.playWithRewardData.adData else nil
            }) else nil
        };
        if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v117.props.shouldInterleaveSduiIxp) and v117.props.sduiFeedItemConfigs then
            for v144, v145 in v117.props.sduiFeedItemConfigs do
                v143[("SduiFeedItem_%*"):format(v144)] = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v145.portraitLayoutOrder
                }, {
                    SduiComponent = v145.renderComponent()
                });
            end;
        end;
        return v3.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, v143);
    end);
end;
v91.renderOnFailed = function(v146, v147, v148, v149) --[[ Line: 724 ]] --[[ Name: renderOnFailed ]]
    -- upvalues: v72 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), l_EnumGameDetailErrorTypes_0 (copy), v3 (copy), l_EmptyState_0 (copy)
    if v146.props.gameInfo then
        return v146:renderOnLoaded(v148, v149, nil, if not not v72 or l_FFlagLuaAppAddIgrsRatingToEdp_0 then v147 else nil);
    else
        local v150 = v146.props.gameDetailError and v146.props.gameDetailError.errorType == l_EnumGameDetailErrorTypes_0.ExperienceUnavailable;
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 100), 
                PaddingLeft = UDim.new(0, v149), 
                PaddingRight = UDim.new(0, v149), 
                PaddingBottom = UDim.new(0, 20)
            }), 
            EmptyState = v3.createElement(l_EmptyState_0, {
                onActivated = if v150 then nil else v146.fetchGameDetailsPageData, 
                text = if v150 then v147.experienceUnavailableMessage else v147.failedMessage, 
                maxSizeTextLabel = Vector2.new(v148 - 2 * v149, 1e999)
            })
        });
    end;
end;
v91.getImageSize = function(_, v152, v153, v154, v155) --[[ Line: 759 ]] --[[ Name: getImageSize ]]
    local v156 = v153 * 1.8;
    local v157 = v155 / v154;
    local v158 = math.max(v156, v152 * v157);
    local v159 = v158 / v157;
    return Vector2.new(v159, v158);
end;
v91.render = function(v160) --[[ Line: 770 ]] --[[ Name: render ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v3 (copy), l_withLocalization_0 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_1 (copy), l_FFlagEnablePlayWithRewardComponent_0 (copy), v21 (copy)
    local l_screenSize_0 = v160.props.screenSize;
    local l_globalGuiInset_0 = v160.props.globalGuiInset;
    local l_gameDetailsPageDataStatus_0 = v160.props.gameDetailsPageDataStatus;
    local v164 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0);
    local v165 = math.min(v164.X.Offset, 640);
    local l_Offset_0 = v164.Y.Offset;
    local v167 = v165 < 600 and 20 or 40;
    local v169 = v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        GameDetails = v3.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1
        }, {
            Background = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_Offset_0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 1
            }), 
            LoadingState = l_withLocalization_0({
                failedMessage = "Feature.EmptyStatePage.Message.NoInternet", 
                experienceUnavailableMessage = "Feature.GamePage.QuickLaunch.LaunchError.TemporarilyUnavailable", 
                noticeHeader = l_FFlagLuaAppShowNoticeOnEdp_0 and "Feature.ExperienceDetails.Body.NotesTitle" or nil, 
                noticeText = l_FFlagLuaAppShowNoticeOnEdp_0 and "Feature.ExperienceDetails.Notes.InExperiencePurchase" or nil, 
                contentMaturityHeader = l_FFlagLuaAppAddIgrsRatingToEdp_0 and "Feature.GameDetails.Label.ContentMaturity" or nil
            })(function(v168) --[[ Line: 809 ]]
                -- upvalues: v3 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_1 (ref), l_gameDetailsPageDataStatus_0 (copy), v160 (copy), v165 (copy), v167 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (ref), l_FFlagLuaAppAddIgrsRatingToEdp_0 (ref)
                return v3.createElement("Frame", {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Position = UDim2.new(0, 0, 0, 0), 
                    ZIndex = 2, 
                    BackgroundTransparency = 1
                }, {
                    LoadingStateContainer = v3.createElement(l_LoadingStateContainer_0, {
                        dataStatus = l_RetrievalStatus_1.fromRawValue(l_gameDetailsPageDataStatus_0), 
                        renderOnFailed = function() --[[ Line: 819 ]] --[[ Name: renderOnFailed ]]
                            -- upvalues: v160 (ref), v168 (copy), v165 (ref), v167 (ref)
                            return v160:renderOnFailed(v168, v165, v167);
                        end, 
                        renderOnLoading = function() --[[ Line: 822 ]] --[[ Name: renderOnLoading ]]
                            -- upvalues: v160 (ref), v167 (ref)
                            return v160:renderOnLoading(v167);
                        end, 
                        renderOnLoaded = function() --[[ Line: 825 ]] --[[ Name: renderOnLoaded ]]
                            -- upvalues: v160 (ref), v165 (ref), v167 (ref), l_gameDetailsPageDataStatus_0 (ref), l_FFlagLuaAppShowNoticeOnEdp_0 (ref), l_FFlagLuaAppAddIgrsRatingToEdp_0 (ref), v168 (copy)
                            return v160:renderOnLoaded(v165, v167, l_gameDetailsPageDataStatus_0, if not not l_FFlagLuaAppShowNoticeOnEdp_0 or l_FFlagLuaAppAddIgrsRatingToEdp_0 then v168 else nil);
                        end
                    })
                });
            end)
        })
    });
    if l_FFlagEnablePlayWithRewardComponent_0 then
        return v3.createFragment({
            Content = v169, 
            NavigationEvents = v3.createElement(v21.NavigationEvents, {
                onDidFocus = v160.onDidFocus
            })
        });
    else
        return v169;
    end;
end;
v91.didMount = function(v170) --[[ Line: 851 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagEnablePlayWithRewardComponent_0 (copy)
    v170.fetchGameDetailsPageData();
    if l_FFlagEnablePlayWithRewardComponent_0 then
        v170.maybeFetchPlayWithReward();
    end;
end;
v91.didUpdate = function(v171) --[[ Line: 858 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagEnablePlayWithRewardComponent_0 (copy)
    if l_FFlagEnablePlayWithRewardComponent_0 then
        v171.maybeFetchPlayWithReward();
    end;
end;
v91.willUnmount = function(v172) --[[ Line: 864 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagEnablePlayWithRewardComponent_0 (copy)
    local l_eventIngest_0 = v172.props.eventIngest;
    local l_universeId_3 = v172.props.universeId;
    local v175 = v172.props.gameDetail and v172.props.gameDetail.rootPlaceId or nil;
    local v176 = v172.props.source or "None";
    local v177 = v172.props.index or -1;
    if l_eventIngest_0 ~= nil and l_universeId_3 ~= nil and v175 ~= nil then
        l_eventIngest_0:setRBXEventStream("GameDetailsCard", "viewClose", {
            universeId = l_universeId_3, 
            rootPlaceId = v175, 
            source = v176, 
            index = v177
        });
    end;
    if l_FFlagEnablePlayWithRewardComponent_0 then
        v172.props.clearPlayWithReward();
    end;
end;
local v180 = l_memoize_0(function(v178, v179) --[[ Line: 883 ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    if v178 == l_RetrievalStatus_0.Done and (v179 == nil or #v179 == 0) then
        return false;
    else
        return true;
    end;
end);
v91 = v5.connect(function(v181, v182) --[[ Line: 893 ]]
    -- upvalues: l_FFlagEnablePlayWithRewardComponent_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), l_RetrievalStatus_0 (copy), l_PlayabilityStatusEnum_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v43 (copy), l_ApiFetchGameDetails_0 (copy), v50 (copy), l_GameInfosReducer_0 (copy), v180 (copy)
    local v183 = nil;
    local v184 = nil;
    local v185 = if l_FFlagEnablePlayWithRewardComponent_0 then l_FetchGamePlayabilityAndProductInfo_0.GetFetchingStatus(v181, v182.universeId) else nil;
    local v186 = if l_FFlagEnablePlayWithRewardComponent_0 then v181.PlayabilityStatus and v181.PlayabilityStatus[v182.universeId] or nil else nil;
    local v187 = if l_FFlagEnablePlayWithRewardComponent_0 then v185 == l_RetrievalStatus_0.Done and v186 ~= nil and v186.playabilityStatus == l_PlayabilityStatusEnum_0.Playable else nil;
    if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v182.shouldHydrateLegacyIxp then
        v183 = v43.GetFetchingStatus(v181, v182.universeId);
        v184 = v43.GetFetchingStatus(v181, v182.universeId);
    else
        v183 = l_ApiFetchGameDetails_0.GetFetchingStatus(v181, v182.universeId);
        v184 = v50.GetFetchingStatus(v181, v182.universeId);
    end;
    local v188 = v181.Personalization[l_GameInfosReducer_0.key][v182.universeId];
    local v189 = nil;
    if l_FFlagEnablePlayWithRewardComponent_0 and v181.PlayWithRewardState.universeId == v182.universeId then
        v189 = v181.PlayWithRewardState;
    end;
    return {
        topBarHeight = 0, 
        gameDetail = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v182.shouldHydrateLegacyIxp then v181.GameDetailsV2[v182.universeId] else v181.GameDetails[v182.universeId], 
        gameDetailError = v181.GameDetailErrors[v182.universeId], 
        gameDetailsPageDataStatus = v183, 
        gameInfo = v188, 
        screenSize = v181.ScreenSize, 
        globalGuiInset = v181.GlobalGuiInset, 
        showLoadingBackground = v183 ~= l_RetrievalStatus_0.Done, 
        showRecommendedGames = v180(v184, v181.RecommendedGameEntries[v182.universeId]), 
        ageRecommendations = v181.AgeRecommendations[v182.universeId], 
        playWithRewardData = if l_FFlagEnablePlayWithRewardComponent_0 then v189 else nil, 
        isPlayabilitySettledAndPlayable = if l_FFlagEnablePlayWithRewardComponent_0 then v187 else nil, 
        localUserId = if l_FFlagEnablePlayWithRewardComponent_0 then v181.LocalUserId else nil
    };
end, function(v190) --[[ Line: 950 ]]
    -- upvalues: v49 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagEnablePlayWithRewardComponent_0 (copy), l_SetPlayWithRewardState_0 (copy), l_FetchPlayWithRewardState_0 (copy), l_AdService_0 (copy), v58 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), v59 (copy)
    return {
        fetchGameDetailsPageData = function(v191, v192, v193, v194, v195) --[[ Line: 952 ]] --[[ Name: fetchGameDetailsPageData ]]
            -- upvalues: v190 (copy), v49 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref)
            return v190(v49(v191, v192, nil, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v193 else nil, if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v194 else nil, if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v194 then v195 else nil));
        end, 
        clearPlayWithReward = l_FFlagEnablePlayWithRewardComponent_0 and function() --[[ Line: 974 ]]
            -- upvalues: v190 (copy), l_SetPlayWithRewardState_0 (ref)
            return v190(l_SetPlayWithRewardState_0("", nil));
        end or nil, 
        fetchPlayWithReward = l_FFlagEnablePlayWithRewardComponent_0 and function(v196, v197) --[[ Line: 979 ]]
            -- upvalues: v190 (copy), l_FetchPlayWithRewardState_0 (ref), l_AdService_0 (ref)
            return v190(l_FetchPlayWithRewardState_0(l_AdService_0, v196, v197));
        end or nil, 
        openRefundPolicyLearnMorePage = function(v198) --[[ Line: 983 ]] --[[ Name: openRefundPolicyLearnMorePage ]]
            -- upvalues: v190 (copy), v58 (ref)
            return v190(v58(v198));
        end, 
        openWebview = l_FFlagLuaAppAddIgrsRatingToEdp_0 and function(v199, v200) --[[ Line: 987 ]]
            -- upvalues: v190 (copy), v59 (ref)
            return v190(v59(v199, v200));
        end or nil
    };
end)(v91);
v91 = l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    eventIngest = l_AppEventIngestService_0
})(v91);
v91 = l_RoactAppPolicy_0.connect(function(v201, _) --[[ Line: 999 ]]
    -- upvalues: l_FFlagLuaAppShowNoticeOnEdp_0 (copy)
    return {
        enableRecommendedGames = v201.getRecommendedGames(), 
        enableSocial = v201.getSocialLinks(), 
        enableGameInfoList = v201.getGameInfoList(), 
        enableGamePlaysAndRatings = v201.getGamePlaysAndRatings(), 
        showGlobalCounters = v201.getShowGlobalCounters(), 
        showLikesFavoritesCount = v201.getEnableAggregateLikesFavoritesCount(), 
        enableGamePassPreview = v201.getShowPassesOnExperienceDetails(), 
        webViewSupport = v201.getWebViewSupport(), 
        notificationsCanAccessExperience = v201.getNotificationsCanReceiveExperience(), 
        experienceDetailsNoticeType = if l_FFlagLuaAppShowNoticeOnEdp_0 then v201.getExperienceDetailsNoticeType() else nil
    };
end)(v91);
if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
    local l_v91_0 = v91;
    local l_l_v91_0_0 = l_v91_0 --[[ copy: 91 -> 92 ]];
    v91 = function(v205) --[[ Line: 1018 ]]
        -- upvalues: l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v63 (copy), v62 (copy), v90 (copy), v44 (copy), v18 (copy), v17 (copy), v36 (copy), v3 (copy), l_l_v91_0_0 (copy), v4 (copy)
        local v206 = nil;
        local v207 = nil;
        local v208 = nil;
        if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
            local v209 = v63.useSduiContextFromSignalAndProcessConfigs(v62.getUnprocessedEdpStoreKey((tostring(v205.universeId))), v62.getEdpStoreKey((tostring(v205.universeId))), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v205.shouldInterleaveSduiIxp);
            v206 = v63.useSduiEdpFeedItemConfigs({
                sduiContext = v209, 
                storeKey = v62.getEdpStoreKey((tostring(v205.universeId))), 
                portraitLayoutConfig = v90, 
                landscapeLayoutConfig = v90, 
                defaultLayoutOrder = v90.SduiFeedItemsDefault, 
                logLayoutConflictFn = v44.logSduiLayoutOrderConflict, 
                shouldInterleaveSdui = l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v205.shouldInterleaveSduiIxp
            });
            local v211 = v18.useMemo(function() --[[ Line: 1039 ]]
                -- upvalues: l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v205 (copy), v63 (ref), v62 (ref)
                return function(v210) --[[ Line: 1040 ]]
                    -- upvalues: l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v205 (ref), v63 (ref), v62 (ref)
                    if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v205.shouldInterleaveSduiIxp) and v205.universeId then
                        return v63.getSduiFeedStore(v62.getEdpStoreKey((tostring(v205.universeId)))).getDataUpdatedTimestamp(v210);
                    else
                        return nil;
                    end;
                end;
            end, {
                v205.universeId, 
                v205.shouldInterleaveSduiIxp
            });
            v207 = v17.useSignalState(v211);
            v208 = v36();
        end;
        return v3.createElement(l_l_v91_0_0, v4.Dictionary.join(v205, {
            currentSduiDataTimestamp = v207, 
            sduiFeedItemConfigs = v206, 
            edpServerIxpVariables = v208
        }));
    end;
end;
if l_FFlagSongEdpCarouselIxp_0 or l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 or l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then
    v91 = v22.connectUserLayer({
        l_AppUserLayers_0.ExperienceDetailsPageExposureLayer
    }, function(v212, _) --[[ Line: 1072 ]]
        -- upvalues: l_AppUserLayers_0 (copy), l_FFlagSongEdpCarouselIxp_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (copy)
        local v214 = v212[l_AppUserLayers_0.ExperienceDetailsPageExposureLayer] or {};
        return {
            showSongCarousel = if l_FFlagSongEdpCarouselIxp_0 then v214.showSongCarousel else nil, 
            mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v214.MediaGalleryRedesignEnabled else nil, 
            mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v214.MediaGalleryVideoPreviewEnabled else nil
        };
    end, true)(v91);
end;
if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 or l_FFlagEDPTTITrackingEnabled_0 then
    local l_v91_1 = v91;
    v91 = function(v216) --[[ Line: 1095 ]]
        -- upvalues: l_FFlagEDPTTITrackingEnabled_0 (copy), l_useFirstMediaCarouselImageUri_0 (copy), v67 (copy), l_EDPTTIConstants_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v24 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v18 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v3 (copy), l_v91_1 (copy), v4 (copy)
        if l_FFlagEDPTTITrackingEnabled_0 then
            local v217 = l_useFirstMediaCarouselImageUri_0(v216.universeId);
            v67(l_EDPTTIConstants_0.EDP_IMPLEMENTATION.LEGACY_PEEK_VIEW, v216.universeId, v217);
        end;
        local v218 = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v24.getShouldHydrateLegacy() else nil;
        local v219 = if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v24.getShouldInterleaveSdui() else nil;
        v18.useEffect(function() --[[ Line: 1112 ]]
            -- upvalues: l_IXPService_0 (ref), l_AppUserLayers_0 (ref)
            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.ExperienceDetailsPageExposureLayer);
        end, {});
        return v3.createElement(l_v91_1, v4.Dictionary.join(v216, {
            shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v218 else nil, 
            shouldInterleaveSduiIxp = if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v219 else nil
        }));
    end;
end;
return v91;