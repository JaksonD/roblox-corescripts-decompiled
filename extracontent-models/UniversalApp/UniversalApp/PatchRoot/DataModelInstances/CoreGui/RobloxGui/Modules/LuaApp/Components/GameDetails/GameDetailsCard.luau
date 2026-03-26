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
local v84 = {
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
local function _(v85) --[[ Line: 128 ]] --[[ Name: getInnerPaddingSize ]]
    if v85 < 600 then
        return 20;
    else
        return 40;
    end;
end;
local function _() --[[ Line: 132 ]] --[[ Name: createLayoutOrderGenerator ]]
    local v87 = 0;
    return function() --[[ Line: 134 ]]
        -- upvalues: v87 (ref)
        v87 = v87 + 1;
        return v87;
    end;
end;
local v89 = {
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
local v90 = v3.PureComponent:extend("GameDetailsCard");
v90.init = function(v91) --[[ Line: 159 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagEnablePlayWithRewardComponent_0 (copy), v19 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (copy), l_MediaGallerySwiped_0 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (copy), l_MediaGalleryMediaChanged_0 (copy), l_memoize_0 (copy), l_checkAndFormatPossibleLink_0 (copy), v3 (copy), l_RetrievalStatus_0 (copy)
    if l_FFlagEnablePlayWithRewardComponent_0 then
        v91.state = {
            didFocus = false
        };
        v91.onDidFocus = function() --[[ Line: 162 ]]
            -- upvalues: v91 (copy)
            v91:setState({
                didFocus = true
            });
        end;
    end;
    local l_universeId_0 = v91.props.universeId;
    v19.isType(l_universeId_0, "string", "GameDetailsCard.init.universeId");
    v91.fetchGameDetailsPageData = function() --[[ Line: 170 ]]
        -- upvalues: v91 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref)
        local l_networking_0 = v91.props.networking;
        local l_universeId_1 = v91.props.universeId;
        return v91.props.fetchGameDetailsPageData(l_networking_0, l_universeId_1, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v91.props.shouldHydrateLegacyIxp else nil, if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v91.props.shouldInterleaveSduiIxp else nil, if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v91.props.shouldInterleaveSduiIxp then v91.props.sduiDataUpdatedTimestamp else nil);
    end;
    v91.onMediaGallerySwiped = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then nil else function() --[[ Line: 189 ]]
        -- upvalues: v91 (copy), l_MediaGallerySwiped_0 (ref), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref)
        local v95 = v91.props.gameDetail and v91.props.gameDetail.rootPlaceId or nil;
        if v95 then
            l_MediaGallerySwiped_0(v91.props.eventIngest, "GameDetailsCard", v95, if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then {
                universeId = v91.props.universeId
            } else nil);
        end;
    end;
    v91.onMediaGalleryMediaChanged = l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 and function(v96, v97, v98, v99) --[[ Line: 206 ]]
        -- upvalues: v91 (copy), l_MediaGalleryMediaChanged_0 (ref), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref)
        local v100 = v91.props.gameDetail and v91.props.gameDetail.rootPlaceId or nil;
        if v100 then
            l_MediaGalleryMediaChanged_0(v91.props.eventIngest, "GameDetailsCard", v100, {
                imageAssetId = v96, 
                videoAssetId = v97, 
                isYouTubeVideo = v98, 
                autoAdvance = v99, 
                universeId = if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v91.props.universeId else nil
            });
        end;
    end or nil;
    v91.linkStartStyle = l_memoize_0(function(v101) --[[ Line: 220 ]]
        local l_Color3_0 = v101.Tokens.Semantic.Color.Text.Link.Color3;
        return (("<font color=\"%*\"><b>"):format((string.format("rgb(%d, %d, %d)", math.round(l_Color3_0.R * 255), math.round(l_Color3_0.G * 255), (math.round(l_Color3_0.B * 255))))));
    end);
    v91.checkAndFormatPossibleLink = l_memoize_0(function(v103, v104) --[[ Line: 232 ]]
        -- upvalues: l_checkAndFormatPossibleLink_0 (ref), v91 (copy)
        return l_checkAndFormatPossibleLink_0(v104, nil, nil, v91.linkStartStyle(v103), "</b></font>");
    end);
    v91.renderRefundPolicy = function(v105, v106, v107) --[[ Line: 238 ]]
        -- upvalues: v91 (copy), v3 (ref)
        local l_Body_0 = v105.Tokens.Semantic.Typography.Body;
        local l_Muted_0 = v105.Tokens.Semantic.Color.Text.Muted;
        local v110, v111 = v91.checkAndFormatPossibleLink(v105, v106.policyText);
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v107
        }, {
            RefundPolicy = v3.createElement("TextButton", {
                BackgroundTransparency = 1, 
                Text = v111, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Font = l_Body_0.Font, 
                TextSize = l_Body_0.FontSize, 
                TextColor3 = l_Muted_0.Color3, 
                TextTransparency = l_Muted_0.Transparency, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                RichText = v110, 
                [v3.Event.Activated] = function(_) --[[ Line: 262 ]]
                    -- upvalues: v91 (ref), v106 (copy)
                    v91.props.openRefundPolicyLearnMorePage(v106.learnMoreUrl);
                end
            })
        });
    end;
    v91.maybeFetchPlayWithReward = l_FFlagEnablePlayWithRewardComponent_0 and function() --[[ Line: 270 ]]
        -- upvalues: v91 (copy), l_RetrievalStatus_0 (ref)
        if v91.state.didFocus ~= true or v91.props.gameDetailsPageDataStatus ~= l_RetrievalStatus_0.Done then
            return;
        else
            local v113 = tonumber(v91.props.localUserId);
            if not v113 then
                return;
            elseif v91.props.playWithRewardData and v91.props.playWithRewardData.universeId == v91.props.universeId then
                return;
            else
                v91:setState({
                    didFocus = false
                });
                v91.props.fetchPlayWithReward(v91.props.universeId, v113):catch(function() --[[ Line: 285 ]]

                end);
                return;
            end;
        end;
    end or nil;
end;
v90.renderOnLoading = function(_, v115) --[[ Line: 290 ]] --[[ Name: renderOnLoading ]]
    -- upvalues: v3 (copy), v45 (copy), v84 (copy)
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Padding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, v115), 
            PaddingRight = UDim.new(0, v115)
        }), 
        Skeleton = v3.createElement(v45, {
            Size = UDim2.new(1, 0, 1, 0), 
            createLayout = function() --[[ Line: 302 ]] --[[ Name: createLayout ]]
                -- upvalues: v3 (ref)
                return v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 15)
                });
            end, 
            panels = v84
        })
    });
end;
v90.renderOnLoaded = function(v116, v117, v118, v119, v120) --[[ Line: 315 ]] --[[ Name: renderOnLoaded ]]
    -- upvalues: l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v24 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), l_FFlagEnablePlayWithRewardComponent_0 (copy), l_withStyle_0 (copy), v3 (copy), l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 (copy), v47 (copy), v89 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v55 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (copy), v52 (copy), v53 (copy), v51 (copy), v54 (copy), l_RetrievalStatus_1 (copy), v56 (copy), v42 (copy), v48 (copy), v46 (copy), l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 (copy), v57 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_ExperienceDetailsNoticeType_0 (copy), v72 (copy), l_RetrievalStatus_0 (copy), v61 (copy), l_AppPage_0 (copy), l_FFlagSongEdpCarouselIxp_0 (copy), v60 (copy), l_PlayWithRewardComponent_0 (copy)
    local l_universeId_2 = v116.props.universeId;
    local l_gameDetail_0 = v116.props.gameDetail;
    local l_gameInfo_0 = v116.props.gameInfo;
    local v124 = l_gameDetail_0 and l_gameDetail_0.rootPlaceId or l_gameInfo_0 and l_gameInfo_0.placeId;
    local v125 = v116.props.showRecommendedGames and v116.props.enableRecommendedGames;
    local v126 = l_gameDetail_0 and v116.props.enableSocial;
    local v127 = l_gameDetail_0 and v116.props.enableGameInfoList;
    local l_enableGamePlaysAndRatings_0 = v116.props.enableGamePlaysAndRatings;
    local l_enableGamePassPreview_0 = v116.props.enableGamePassPreview;
    if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v24.getShouldInterleaveSdui()) and v116.props.edpServerIxpVariables and v116.props.edpServerIxpVariables.hideGameRatings == true then
        l_enableGamePlaysAndRatings_0 = false;
    end;
    local v130 = l_gameDetail_0 and l_gameDetail_0.description ~= nil and l_gameDetail_0.description ~= "";
    local l_showGlobalCounters_0 = v116.props.showGlobalCounters;
    local l_showLikesFavoritesCount_0 = v116.props.showLikesFavoritesCount;
    local l_ageRecommendations_0 = v116.props.ageRecommendations;
    local v134 = if l_FFlagLuaAppAddIgrsRatingToEdp_0 and l_ageRecommendations_0 and l_ageRecommendations_0.summary and l_ageRecommendations_0.summary.ageRecommendation and l_ageRecommendations_0.summary.ageRecommendation.igrsRating and l_ageRecommendations_0.summary.ageRecommendation.igrsRating ~= "" then l_ageRecommendations_0.summary.ageRecommendation.igrsRating else nil;
    local v135 = if l_FFlagLuaAppAddIgrsRatingToEdp_0 and l_ageRecommendations_0 and l_ageRecommendations_0.summary and l_ageRecommendations_0.summary.ageRecommendation and l_ageRecommendations_0.summary.ageRecommendation.igrsRatingDisplayMessage then l_ageRecommendations_0.summary.ageRecommendation.igrsRatingDisplayMessage else nil;
    local l_notificationsCanAccessExperience_0 = v116.props.notificationsCanAccessExperience;
    if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v24.getShouldInterleaveSdui()) and v116.props.edpServerIxpVariables and v116.props.edpServerIxpVariables.hideNotifyButton == true then
        l_notificationsCanAccessExperience_0 = false;
    end;
    local v137 = 0;
    local v138;
    do
        local l_v137_0 = v137;
        v138 = function() --[[ Line: 134 ]]
            -- upvalues: l_v137_0 (ref)
            l_v137_0 = l_v137_0 + 1;
            return l_v137_0;
        end;
    end;
    v137 = v116.props.webViewSupport and l_gameDetail_0 ~= nil and l_gameDetail_0.refundPolicy ~= nil;
    local v140 = if l_FFlagEnablePlayWithRewardComponent_0 then v116.props.isPlayabilitySettledAndPlayable else nil;
    return l_withStyle_0(function(v141) --[[ Line: 378 ]]
        -- upvalues: v3 (ref), v118 (copy), l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 (ref), v47 (ref), v89 (ref), l_universeId_2 (copy), l_notificationsCanAccessExperience_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v116 (copy), v138 (copy), v55 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (ref), v117 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v24 (ref), v52 (ref), v53 (ref), v51 (ref), v124 (copy), v130 (copy), v54 (ref), l_RetrievalStatus_1 (ref), v119 (copy), l_gameDetail_0 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (ref), v134 (copy), v56 (ref), v135 (copy), v42 (ref), v120 (copy), l_enableGamePlaysAndRatings_0 (ref), v48 (ref), l_showGlobalCounters_0 (copy), l_showLikesFavoritesCount_0 (copy), v127 (copy), v46 (ref), v126 (copy), l_ageRecommendations_0 (copy), l_enableGamePassPreview_0 (copy), v137 (copy), l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 (ref), v57 (ref), l_FFlagLuaAppShowNoticeOnEdp_0 (ref), l_ExperienceDetailsNoticeType_0 (ref), v72 (ref), l_RetrievalStatus_0 (ref), v125 (copy), v61 (ref), l_AppPage_0 (ref), l_FFlagSongEdpCarouselIxp_0 (ref), v60 (ref), l_gameInfo_0 (copy), l_FFlagEnablePlayWithRewardComponent_0 (ref), v140 (copy), l_PlayWithRewardComponent_0 (ref)
        local v142 = {
            ListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 20)
            }), 
            PagePadding = v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v118), 
                PaddingRight = UDim.new(0, v118), 
                PaddingTop = UDim.new(0, 0), 
                PaddingBottom = UDim.new(0, 20)
            }), 
            Header = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v3.createElement(v47, {
                LayoutOrder = v89.Header, 
                universeId = l_universeId_2, 
                showNotificationButton = l_notificationsCanAccessExperience_0, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v116.props.shouldHydrateLegacyIxp else nil
            }) else v3.createElement("Frame", {
                LayoutOrder = v138(), 
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
                        onSwipe = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then nil else v116.onMediaGallerySwiped, 
                        onMediaGalleryMediaChanged = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v116.onMediaGalleryMediaChanged else nil, 
                        mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v116.props.mediaGalleryRedesignEnabledIxp else nil, 
                        mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v116.props.mediaGalleryVideoPreviewEnabledIxp else nil, 
                        shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v116.props.shouldHydrateLegacyIxp else nil
                    }), 
                    SizeConstraint = v3.createElement("UISizeConstraint", {
                        MinSize = Vector2.new(0, (v117 - v118 * 2) / 1.7777777777777777)
                    })
                }), 
                Header = v3.createElement(v47, {
                    LayoutOrder = 1, 
                    universeId = l_universeId_2, 
                    showNotificationButton = l_notificationsCanAccessExperience_0, 
                    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v116.props.shouldHydrateLegacyIxp else nil
                })
            }), 
            MediaGalleryFrame = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v3.createElement("Frame", {
                LayoutOrder = v89.MediaGallery, 
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
                    onSwipe = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then nil else v116.onMediaGallerySwiped, 
                    onMediaGalleryMediaChanged = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v116.onMediaGalleryMediaChanged else nil, 
                    mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v116.props.mediaGalleryRedesignEnabledIxp else nil, 
                    mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v116.props.mediaGalleryVideoPreviewEnabledIxp else nil, 
                    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v116.props.shouldHydrateLegacyIxp else nil
                }), 
                SizeConstraint = v3.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, (v117 - v118 * 2) / 1.7777777777777777)
                })
            }) else nil, 
            StatsCarousel = if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v24.getShouldInterleaveSdui()) and v116.props.edpServerIxpVariables and v116.props.edpServerIxpVariables.hideStatsCarousel == true then nil else v3.createElement(v52, {
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v89.StatsCarousel else v138(), 
                universeId = l_universeId_2, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v116.props.shouldHydrateLegacyIxp else nil
            }), 
            TagSection = v3.createElement(v53, {
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v89.TagSection else v138(), 
                universeId = l_universeId_2, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v116.props.shouldHydrateLegacyIxp else nil, 
                hideContentDescriptors = (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v24.getShouldInterleaveSdui()) and v116.props.edpServerIxpVariables and v116.props.edpServerIxpVariables.showContentDescriptorsInInfoList == true or nil
            }), 
            MovedEventsList = v3.createElement(v51, {
                layoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v89.MovedEventsList else v138(), 
                universeId = l_universeId_2, 
                referralSource = "expDetailsPage", 
                defaultThumbnail = if v124 then ("rbxthumb://type=GameThumbnail&id=%d&w=768&h=432"):format(v124) else nil, 
                peekViewFormat = true
            }), 
            Description = if v130 then v3.createElement(v54, {
                dataStatus = l_RetrievalStatus_1.fromRawValue(v119), 
                descriptionText = l_gameDetail_0 and l_gameDetail_0.description, 
                expandable = true, 
                listPadding = v141.Tokens.Global.Space_125, 
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v89.Description else v138()
            }) else nil, 
            IgrsRatingLabel = if l_FFlagLuaAppAddIgrsRatingToEdp_0 and v134 then v3.createElement(v56, {
                igrsRating = v134, 
                igrsRatingDisplayMessage = v135, 
                onActivated = function() --[[ Line: 556 ]] --[[ Name: onActivated ]]
                    -- upvalues: v116 (ref), v42 (ref), v120 (ref)
                    v116.props.openWebview(v42.INDONESIAN_CONTENT_MATURITY_URL, v120.contentMaturityHeader);
                end, 
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v89.IgrsRatingLabel else v138()
            }) else nil, 
            PlaysAndRatings = l_enableGamePlaysAndRatings_0 and v3.createElement(v48, {
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v89.PlaysAndRatings else v138(), 
                universeId = l_universeId_2, 
                containerWidth = v117 - 2 * v118, 
                rowPadding = 20, 
                showGlobalCounters = l_showGlobalCounters_0, 
                showLikesFavoritesCount = l_showLikesFavoritesCount_0, 
                hideVisits = true, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v116.props.shouldHydrateLegacyIxp else nil
            }), 
            InfoList = v127 and v3.createElement(v46, {
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v89.InfoList else v138(), 
                universeId = l_universeId_2, 
                leftPadding = v118, 
                rightPadding = v118, 
                showSocial = v126, 
                ageRecommendations = l_ageRecommendations_0, 
                width = v117, 
                enableGamePassPreview = l_enableGamePassPreview_0, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v116.props.shouldHydrateLegacyIxp else nil
            }), 
            RefundPolicy = if v137 then if l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 then v3.createElement(v57, {
                refundPolicy = l_gameDetail_0.refundPolicy, 
                layoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v89.RefundPolicy else v138()
            }) else v116.renderRefundPolicy(v141, l_gameDetail_0.refundPolicy, if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v89.RefundPolicy else v138()) else nil, 
            Notice = if l_FFlagLuaAppShowNoticeOnEdp_0 and v116.props.experienceDetailsNoticeType == l_ExperienceDetailsNoticeType_0.InExperiencePurchase then v3.createElement(v54, {
                dataStatus = if v72 then l_RetrievalStatus_1.fromRawValue(l_RetrievalStatus_0.Done) else l_RetrievalStatus_1.fromRawValue(v119), 
                headerText = v120.noticeHeader, 
                descriptionText = v120.noticeText, 
                expandable = false, 
                listPadding = v141.Tokens.Global.Space_125, 
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v89.Notice else v138()
            }) else nil, 
            RecommendedGames = v125 and v3.createElement("Frame", {
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v89.RecommendedGames else v138(), 
                Size = UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                Carousel = v3.createElement(v61, {
                    universeId = l_universeId_2, 
                    pageContext = l_AppPage_0.GameDetail, 
                    onPeekViewClosed = v116.props.onPeekViewClosed, 
                    scrollingEnabled = true, 
                    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v116.props.shouldHydrateLegacyIxp else nil
                })
            }), 
            ExperienceSongsCarousel = if l_FFlagSongEdpCarouselIxp_0 and v116.props.showSongCarousel then v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v89.ExperienceSongsCarousel else v138()
            }, {
                v3.createElement(v60, {
                    universeId = l_universeId_2, 
                    universeTitle = l_gameDetail_0 and l_gameDetail_0.name or l_gameInfo_0 and l_gameInfo_0.name or "", 
                    collectionOrder = 2, 
                    clipsDescendants = false
                })
            }) else nil, 
            PlayWithRewardComponent = if l_FFlagEnablePlayWithRewardComponent_0 and v140 then v3.createElement(l_PlayWithRewardComponent_0, {
                universeId = l_universeId_2, 
                placeId = v124, 
                flowId = if v116.props.playWithRewardData then v116.props.playWithRewardData.flowId else "", 
                fetchedUniverseId = if v116.props.playWithRewardData then v116.props.playWithRewardData.universeId else nil, 
                playWithRewardAdData = if v116.props.playWithRewardData then v116.props.playWithRewardData.adData else nil
            }) else nil
        };
        if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v116.props.shouldInterleaveSduiIxp) and v116.props.sduiFeedItemConfigs then
            for v143, v144 in v116.props.sduiFeedItemConfigs do
                v142[("SduiFeedItem_%*"):format(v143)] = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v144.portraitLayoutOrder
                }, {
                    SduiComponent = v144.renderComponent()
                });
            end;
        end;
        return v3.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, v142);
    end);
end;
v90.renderOnFailed = function(v145, v146, v147, v148) --[[ Line: 710 ]] --[[ Name: renderOnFailed ]]
    -- upvalues: v72 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), l_EnumGameDetailErrorTypes_0 (copy), v3 (copy), l_EmptyState_0 (copy)
    if v145.props.gameInfo then
        return v145:renderOnLoaded(v147, v148, nil, if not not v72 or l_FFlagLuaAppAddIgrsRatingToEdp_0 then v146 else nil);
    else
        local v149 = v145.props.gameDetailError and v145.props.gameDetailError.errorType == l_EnumGameDetailErrorTypes_0.ExperienceUnavailable;
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 100), 
                PaddingLeft = UDim.new(0, v148), 
                PaddingRight = UDim.new(0, v148), 
                PaddingBottom = UDim.new(0, 20)
            }), 
            EmptyState = v3.createElement(l_EmptyState_0, {
                onActivated = if v149 then nil else v145.fetchGameDetailsPageData, 
                text = if v149 then v146.experienceUnavailableMessage else v146.failedMessage, 
                maxSizeTextLabel = Vector2.new(v147 - 2 * v148, 1e999)
            })
        });
    end;
end;
v90.getImageSize = function(_, v151, v152, v153, v154) --[[ Line: 745 ]] --[[ Name: getImageSize ]]
    local v155 = v152 * 1.8;
    local v156 = v154 / v153;
    local v157 = math.max(v155, v151 * v156);
    local v158 = v157 / v156;
    return Vector2.new(v158, v157);
end;
v90.render = function(v159) --[[ Line: 756 ]] --[[ Name: render ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v3 (copy), l_withLocalization_0 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_1 (copy), l_FFlagEnablePlayWithRewardComponent_0 (copy), v21 (copy)
    local l_screenSize_0 = v159.props.screenSize;
    local l_globalGuiInset_0 = v159.props.globalGuiInset;
    local l_gameDetailsPageDataStatus_0 = v159.props.gameDetailsPageDataStatus;
    local v163 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0);
    local v164 = math.min(v163.X.Offset, 640);
    local l_Offset_0 = v163.Y.Offset;
    local v166 = v164 < 600 and 20 or 40;
    local v168 = v3.createElement("Frame", {
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
            })(function(v167) --[[ Line: 795 ]]
                -- upvalues: v3 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_1 (ref), l_gameDetailsPageDataStatus_0 (copy), v159 (copy), v164 (copy), v166 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (ref), l_FFlagLuaAppAddIgrsRatingToEdp_0 (ref)
                return v3.createElement("Frame", {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Position = UDim2.new(0, 0, 0, 0), 
                    ZIndex = 2, 
                    BackgroundTransparency = 1
                }, {
                    LoadingStateContainer = v3.createElement(l_LoadingStateContainer_0, {
                        dataStatus = l_RetrievalStatus_1.fromRawValue(l_gameDetailsPageDataStatus_0), 
                        renderOnFailed = function() --[[ Line: 805 ]] --[[ Name: renderOnFailed ]]
                            -- upvalues: v159 (ref), v167 (copy), v164 (ref), v166 (ref)
                            return v159:renderOnFailed(v167, v164, v166);
                        end, 
                        renderOnLoading = function() --[[ Line: 808 ]] --[[ Name: renderOnLoading ]]
                            -- upvalues: v159 (ref), v166 (ref)
                            return v159:renderOnLoading(v166);
                        end, 
                        renderOnLoaded = function() --[[ Line: 811 ]] --[[ Name: renderOnLoaded ]]
                            -- upvalues: v159 (ref), v164 (ref), v166 (ref), l_gameDetailsPageDataStatus_0 (ref), l_FFlagLuaAppShowNoticeOnEdp_0 (ref), l_FFlagLuaAppAddIgrsRatingToEdp_0 (ref), v167 (copy)
                            return v159:renderOnLoaded(v164, v166, l_gameDetailsPageDataStatus_0, if not not l_FFlagLuaAppShowNoticeOnEdp_0 or l_FFlagLuaAppAddIgrsRatingToEdp_0 then v167 else nil);
                        end
                    })
                });
            end)
        })
    });
    if l_FFlagEnablePlayWithRewardComponent_0 then
        return v3.createFragment({
            Content = v168, 
            NavigationEvents = v3.createElement(v21.NavigationEvents, {
                onDidFocus = v159.onDidFocus
            })
        });
    else
        return v168;
    end;
end;
v90.didMount = function(v169) --[[ Line: 837 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagEnablePlayWithRewardComponent_0 (copy)
    v169.fetchGameDetailsPageData();
    if l_FFlagEnablePlayWithRewardComponent_0 then
        v169.maybeFetchPlayWithReward();
    end;
end;
v90.didUpdate = function(v170) --[[ Line: 844 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagEnablePlayWithRewardComponent_0 (copy)
    if l_FFlagEnablePlayWithRewardComponent_0 then
        v170.maybeFetchPlayWithReward();
    end;
end;
v90.willUnmount = function(v171) --[[ Line: 850 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagEnablePlayWithRewardComponent_0 (copy)
    local l_eventIngest_0 = v171.props.eventIngest;
    local l_universeId_3 = v171.props.universeId;
    local v174 = v171.props.gameDetail and v171.props.gameDetail.rootPlaceId or nil;
    local v175 = v171.props.source or "None";
    local v176 = v171.props.index or -1;
    if l_eventIngest_0 ~= nil and l_universeId_3 ~= nil and v174 ~= nil then
        l_eventIngest_0:setRBXEventStream("GameDetailsCard", "viewClose", {
            universeId = l_universeId_3, 
            rootPlaceId = v174, 
            source = v175, 
            index = v176
        });
    end;
    if l_FFlagEnablePlayWithRewardComponent_0 then
        v171.props.clearPlayWithReward();
    end;
end;
local v179 = l_memoize_0(function(v177, v178) --[[ Line: 869 ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    if v177 == l_RetrievalStatus_0.Done and (v178 == nil or #v178 == 0) then
        return false;
    else
        return true;
    end;
end);
v90 = v5.connect(function(v180, v181) --[[ Line: 879 ]]
    -- upvalues: l_FFlagEnablePlayWithRewardComponent_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), l_RetrievalStatus_0 (copy), l_PlayabilityStatusEnum_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v43 (copy), l_ApiFetchGameDetails_0 (copy), v50 (copy), l_GameInfosReducer_0 (copy), v179 (copy)
    local v182 = nil;
    local v183 = nil;
    local v184 = if l_FFlagEnablePlayWithRewardComponent_0 then l_FetchGamePlayabilityAndProductInfo_0.GetFetchingStatus(v180, v181.universeId) else nil;
    local v185 = if l_FFlagEnablePlayWithRewardComponent_0 then v180.PlayabilityStatus and v180.PlayabilityStatus[v181.universeId] or nil else nil;
    local v186 = if l_FFlagEnablePlayWithRewardComponent_0 then v184 == l_RetrievalStatus_0.Done and v185 ~= nil and v185.playabilityStatus == l_PlayabilityStatusEnum_0.Playable else nil;
    if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v181.shouldHydrateLegacyIxp then
        v182 = v43.GetFetchingStatus(v180, v181.universeId);
        v183 = v43.GetFetchingStatus(v180, v181.universeId);
    else
        v182 = l_ApiFetchGameDetails_0.GetFetchingStatus(v180, v181.universeId);
        v183 = v50.GetFetchingStatus(v180, v181.universeId);
    end;
    local v187 = v180.Personalization[l_GameInfosReducer_0.key][v181.universeId];
    local v188 = nil;
    if l_FFlagEnablePlayWithRewardComponent_0 and v180.PlayWithRewardState.universeId == v181.universeId then
        v188 = v180.PlayWithRewardState;
    end;
    return {
        topBarHeight = 0, 
        gameDetail = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v181.shouldHydrateLegacyIxp then v180.GameDetailsV2[v181.universeId] else v180.GameDetails[v181.universeId], 
        gameDetailError = v180.GameDetailErrors[v181.universeId], 
        gameDetailsPageDataStatus = v182, 
        gameInfo = v187, 
        screenSize = v180.ScreenSize, 
        globalGuiInset = v180.GlobalGuiInset, 
        showLoadingBackground = v182 ~= l_RetrievalStatus_0.Done, 
        showRecommendedGames = v179(v183, v180.RecommendedGameEntries[v181.universeId]), 
        ageRecommendations = v180.AgeRecommendations[v181.universeId], 
        playWithRewardData = if l_FFlagEnablePlayWithRewardComponent_0 then v188 else nil, 
        isPlayabilitySettledAndPlayable = if l_FFlagEnablePlayWithRewardComponent_0 then v186 else nil, 
        localUserId = if l_FFlagEnablePlayWithRewardComponent_0 then v180.LocalUserId else nil
    };
end, function(v189) --[[ Line: 936 ]]
    -- upvalues: v49 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagEnablePlayWithRewardComponent_0 (copy), l_SetPlayWithRewardState_0 (copy), l_FetchPlayWithRewardState_0 (copy), l_AdService_0 (copy), v58 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), v59 (copy)
    return {
        fetchGameDetailsPageData = function(v190, v191, v192, v193, v194) --[[ Line: 938 ]] --[[ Name: fetchGameDetailsPageData ]]
            -- upvalues: v189 (copy), v49 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref)
            return v189(v49(v190, v191, nil, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v192 else nil, if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v193 else nil, if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v193 then v194 else nil));
        end, 
        clearPlayWithReward = l_FFlagEnablePlayWithRewardComponent_0 and function() --[[ Line: 960 ]]
            -- upvalues: v189 (copy), l_SetPlayWithRewardState_0 (ref)
            return v189(l_SetPlayWithRewardState_0("", nil));
        end or nil, 
        fetchPlayWithReward = l_FFlagEnablePlayWithRewardComponent_0 and function(v195, v196) --[[ Line: 965 ]]
            -- upvalues: v189 (copy), l_FetchPlayWithRewardState_0 (ref), l_AdService_0 (ref)
            return v189(l_FetchPlayWithRewardState_0(l_AdService_0, v195, v196));
        end or nil, 
        openRefundPolicyLearnMorePage = function(v197) --[[ Line: 969 ]] --[[ Name: openRefundPolicyLearnMorePage ]]
            -- upvalues: v189 (copy), v58 (ref)
            return v189(v58(v197));
        end, 
        openWebview = l_FFlagLuaAppAddIgrsRatingToEdp_0 and function(v198, v199) --[[ Line: 973 ]]
            -- upvalues: v189 (copy), v59 (ref)
            return v189(v59(v198, v199));
        end or nil
    };
end)(v90);
v90 = l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    eventIngest = l_AppEventIngestService_0
})(v90);
v90 = l_RoactAppPolicy_0.connect(function(v200, _) --[[ Line: 985 ]]
    -- upvalues: l_FFlagLuaAppShowNoticeOnEdp_0 (copy)
    return {
        enableRecommendedGames = v200.getRecommendedGames(), 
        enableSocial = v200.getSocialLinks(), 
        enableGameInfoList = v200.getGameInfoList(), 
        enableGamePlaysAndRatings = v200.getGamePlaysAndRatings(), 
        showGlobalCounters = v200.getShowGlobalCounters(), 
        showLikesFavoritesCount = v200.getEnableAggregateLikesFavoritesCount(), 
        enableGamePassPreview = v200.getShowPassesOnExperienceDetails(), 
        webViewSupport = v200.getWebViewSupport(), 
        notificationsCanAccessExperience = v200.getNotificationsCanReceiveExperience(), 
        experienceDetailsNoticeType = if l_FFlagLuaAppShowNoticeOnEdp_0 then v200.getExperienceDetailsNoticeType() else nil
    };
end)(v90);
if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
    local l_v90_0 = v90;
    local l_l_v90_0_0 = l_v90_0 --[[ copy: 90 -> 91 ]];
    v90 = function(v204) --[[ Line: 1004 ]]
        -- upvalues: l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v63 (copy), v62 (copy), v89 (copy), v44 (copy), v18 (copy), v17 (copy), v36 (copy), v3 (copy), l_l_v90_0_0 (copy), v4 (copy)
        local v205 = nil;
        local v206 = nil;
        local v207 = nil;
        if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
            local v208 = v63.useSduiContextFromSignalAndProcessConfigs(v62.getUnprocessedEdpStoreKey((tostring(v204.universeId))), v62.getEdpStoreKey((tostring(v204.universeId))), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v204.shouldInterleaveSduiIxp);
            v205 = v63.useSduiEdpFeedItemConfigs({
                sduiContext = v208, 
                storeKey = v62.getEdpStoreKey((tostring(v204.universeId))), 
                portraitLayoutConfig = v89, 
                landscapeLayoutConfig = v89, 
                defaultLayoutOrder = v89.SduiFeedItemsDefault, 
                logLayoutConflictFn = v44.logSduiLayoutOrderConflict, 
                shouldInterleaveSdui = l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v204.shouldInterleaveSduiIxp
            });
            local v210 = v18.useMemo(function() --[[ Line: 1025 ]]
                -- upvalues: l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v204 (copy), v63 (ref), v62 (ref)
                return function(v209) --[[ Line: 1026 ]]
                    -- upvalues: l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v204 (ref), v63 (ref), v62 (ref)
                    if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v204.shouldInterleaveSduiIxp) and v204.universeId then
                        return v63.getSduiFeedStore(v62.getEdpStoreKey((tostring(v204.universeId)))).getDataUpdatedTimestamp(v209);
                    else
                        return nil;
                    end;
                end;
            end, {
                v204.universeId, 
                v204.shouldInterleaveSduiIxp
            });
            v206 = v17.useSignalState(v210);
            v207 = v36();
        end;
        return v3.createElement(l_l_v90_0_0, v4.Dictionary.join(v204, {
            currentSduiDataTimestamp = v206, 
            sduiFeedItemConfigs = v205, 
            edpServerIxpVariables = v207
        }));
    end;
end;
if l_FFlagSongEdpCarouselIxp_0 or l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 or l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then
    v90 = v22.connectUserLayer({
        l_AppUserLayers_0.ExperienceDetailsPageExposureLayer
    }, function(v211, _) --[[ Line: 1058 ]]
        -- upvalues: l_AppUserLayers_0 (copy), l_FFlagSongEdpCarouselIxp_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (copy)
        local v213 = v211[l_AppUserLayers_0.ExperienceDetailsPageExposureLayer] or {};
        return {
            showSongCarousel = if l_FFlagSongEdpCarouselIxp_0 then v213.showSongCarousel else nil, 
            mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v213.MediaGalleryRedesignEnabled else nil, 
            mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v213.MediaGalleryVideoPreviewEnabled else nil
        };
    end, true)(v90);
end;
if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 or l_FFlagEDPTTITrackingEnabled_0 then
    local l_v90_1 = v90;
    v90 = function(v215) --[[ Line: 1081 ]]
        -- upvalues: l_FFlagEDPTTITrackingEnabled_0 (copy), l_useFirstMediaCarouselImageUri_0 (copy), v67 (copy), l_EDPTTIConstants_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v24 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v18 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v3 (copy), l_v90_1 (copy), v4 (copy)
        if l_FFlagEDPTTITrackingEnabled_0 then
            local v216 = l_useFirstMediaCarouselImageUri_0(v215.universeId);
            v67(l_EDPTTIConstants_0.EDP_IMPLEMENTATION.LEGACY_PEEK_VIEW, v215.universeId, v216);
        end;
        local v217 = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v24.getShouldHydrateLegacy() else nil;
        local v218 = if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v24.getShouldInterleaveSdui() else nil;
        v18.useEffect(function() --[[ Line: 1098 ]]
            -- upvalues: l_IXPService_0 (ref), l_AppUserLayers_0 (ref)
            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.ExperienceDetailsPageExposureLayer);
        end, {});
        return v3.createElement(l_v90_1, v4.Dictionary.join(v215, {
            shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v217 else nil, 
            shouldInterleaveSduiIxp = if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v218 else nil
        }));
    end;
end;
return v90;