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
local l_FFlagLuaAppShowNoticeOnEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppShowNoticeOnEdp;
local l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppExperienceDetailsLayoutOrderConfig;
local l_FFlagSongEdpCarouselIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSongEdpCarouselIxp;
local v67 = game:DefineFastFlag("LuaAppFixNoticeLocalization", false);
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
local v79 = {
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
local function _(v80) --[[ Line: 121 ]] --[[ Name: getInnerPaddingSize ]]
    if v80 < 600 then
        return 20;
    else
        return 40;
    end;
end;
local function _() --[[ Line: 125 ]] --[[ Name: createLayoutOrderGenerator ]]
    local v82 = 0;
    return function() --[[ Line: 127 ]]
        -- upvalues: v82 (ref)
        v82 = v82 + 1;
        return v82;
    end;
end;
local v84 = {
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
local v85 = v3.PureComponent:extend("GameDetailsCard");
v85.init = function(v86) --[[ Line: 152 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagEnablePlayWithRewardComponent_0 (copy), v19 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (copy), l_MediaGallerySwiped_0 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (copy), l_MediaGalleryMediaChanged_0 (copy), l_memoize_0 (copy), l_checkAndFormatPossibleLink_0 (copy), v3 (copy), l_RetrievalStatus_0 (copy)
    if l_FFlagEnablePlayWithRewardComponent_0 then
        v86.state = {
            didFocus = false
        };
        v86.onDidFocus = function() --[[ Line: 155 ]]
            -- upvalues: v86 (copy)
            v86:setState({
                didFocus = true
            });
        end;
    end;
    local l_universeId_0 = v86.props.universeId;
    v19.isType(l_universeId_0, "string", "GameDetailsCard.init.universeId");
    v86.fetchGameDetailsPageData = function() --[[ Line: 163 ]]
        -- upvalues: v86 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref)
        local l_networking_0 = v86.props.networking;
        local l_universeId_1 = v86.props.universeId;
        return v86.props.fetchGameDetailsPageData(l_networking_0, l_universeId_1, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v86.props.shouldHydrateLegacyIxp else nil, if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v86.props.shouldInterleaveSduiIxp else nil, if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v86.props.shouldInterleaveSduiIxp then v86.props.sduiDataUpdatedTimestamp else nil);
    end;
    v86.onMediaGallerySwiped = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then nil else function() --[[ Line: 182 ]]
        -- upvalues: v86 (copy), l_MediaGallerySwiped_0 (ref), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref)
        local v90 = v86.props.gameDetail and v86.props.gameDetail.rootPlaceId or nil;
        if v90 then
            l_MediaGallerySwiped_0(v86.props.eventIngest, "GameDetailsCard", v90, if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then {
                universeId = v86.props.universeId
            } else nil);
        end;
    end;
    v86.onMediaGalleryMediaChanged = l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 and function(v91, v92, v93, v94) --[[ Line: 199 ]]
        -- upvalues: v86 (copy), l_MediaGalleryMediaChanged_0 (ref), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref)
        local v95 = v86.props.gameDetail and v86.props.gameDetail.rootPlaceId or nil;
        if v95 then
            l_MediaGalleryMediaChanged_0(v86.props.eventIngest, "GameDetailsCard", v95, {
                imageAssetId = v91, 
                videoAssetId = v92, 
                isYouTubeVideo = v93, 
                autoAdvance = v94, 
                universeId = if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v86.props.universeId else nil
            });
        end;
    end or nil;
    v86.linkStartStyle = l_memoize_0(function(v96) --[[ Line: 213 ]]
        local l_Color3_0 = v96.Tokens.Semantic.Color.Text.Link.Color3;
        return (("<font color=\"%*\"><b>"):format((string.format("rgb(%d, %d, %d)", math.round(l_Color3_0.R * 255), math.round(l_Color3_0.G * 255), (math.round(l_Color3_0.B * 255))))));
    end);
    v86.checkAndFormatPossibleLink = l_memoize_0(function(v98, v99) --[[ Line: 225 ]]
        -- upvalues: l_checkAndFormatPossibleLink_0 (ref), v86 (copy)
        return l_checkAndFormatPossibleLink_0(v99, nil, nil, v86.linkStartStyle(v98), "</b></font>");
    end);
    v86.renderRefundPolicy = function(v100, v101, v102) --[[ Line: 231 ]]
        -- upvalues: v86 (copy), v3 (ref)
        local l_Body_0 = v100.Tokens.Semantic.Typography.Body;
        local l_Muted_0 = v100.Tokens.Semantic.Color.Text.Muted;
        local v105, v106 = v86.checkAndFormatPossibleLink(v100, v101.policyText);
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v102
        }, {
            RefundPolicy = v3.createElement("TextButton", {
                BackgroundTransparency = 1, 
                Text = v106, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Font = l_Body_0.Font, 
                TextSize = l_Body_0.FontSize, 
                TextColor3 = l_Muted_0.Color3, 
                TextTransparency = l_Muted_0.Transparency, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                RichText = v105, 
                [v3.Event.Activated] = function(_) --[[ Line: 255 ]]
                    -- upvalues: v86 (ref), v101 (copy)
                    v86.props.openRefundPolicyLearnMorePage(v101.learnMoreUrl);
                end
            })
        });
    end;
    v86.maybeFetchPlayWithReward = l_FFlagEnablePlayWithRewardComponent_0 and function() --[[ Line: 263 ]]
        -- upvalues: v86 (copy), l_RetrievalStatus_0 (ref)
        if v86.state.didFocus ~= true or v86.props.gameDetailsPageDataStatus ~= l_RetrievalStatus_0.Done then
            return;
        else
            local v108 = tonumber(v86.props.localUserId);
            if not v108 then
                return;
            elseif v86.props.playWithRewardData and v86.props.playWithRewardData.universeId == v86.props.universeId then
                return;
            else
                v86:setState({
                    didFocus = false
                });
                v86.props.fetchPlayWithReward(v86.props.universeId, v108):catch(function() --[[ Line: 278 ]]

                end);
                return;
            end;
        end;
    end or nil;
end;
v85.renderOnLoading = function(_, v110) --[[ Line: 283 ]] --[[ Name: renderOnLoading ]]
    -- upvalues: v3 (copy), v45 (copy), v79 (copy)
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Padding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, v110), 
            PaddingRight = UDim.new(0, v110)
        }), 
        Skeleton = v3.createElement(v45, {
            Size = UDim2.new(1, 0, 1, 0), 
            createLayout = function() --[[ Line: 295 ]] --[[ Name: createLayout ]]
                -- upvalues: v3 (ref)
                return v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 15)
                });
            end, 
            panels = v79
        })
    });
end;
v85.renderOnLoaded = function(v111, v112, v113, v114, v115) --[[ Line: 308 ]] --[[ Name: renderOnLoaded ]]
    -- upvalues: l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v24 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), l_FFlagEnablePlayWithRewardComponent_0 (copy), l_withStyle_0 (copy), v3 (copy), l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 (copy), v47 (copy), v84 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v55 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (copy), v52 (copy), v53 (copy), v51 (copy), v54 (copy), l_RetrievalStatus_1 (copy), v56 (copy), v42 (copy), v48 (copy), v46 (copy), l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 (copy), v57 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_ExperienceDetailsNoticeType_0 (copy), v67 (copy), l_RetrievalStatus_0 (copy), v61 (copy), l_AppPage_0 (copy), l_FFlagSongEdpCarouselIxp_0 (copy), v60 (copy), l_PlayWithRewardComponent_0 (copy)
    local l_universeId_2 = v111.props.universeId;
    local l_gameDetail_0 = v111.props.gameDetail;
    local l_gameInfo_0 = v111.props.gameInfo;
    local v119 = l_gameDetail_0 and l_gameDetail_0.rootPlaceId or l_gameInfo_0 and l_gameInfo_0.placeId;
    local v120 = v111.props.showRecommendedGames and v111.props.enableRecommendedGames;
    local v121 = l_gameDetail_0 and v111.props.enableSocial;
    local v122 = l_gameDetail_0 and v111.props.enableGameInfoList;
    local l_enableGamePlaysAndRatings_0 = v111.props.enableGamePlaysAndRatings;
    local l_enableGamePassPreview_0 = v111.props.enableGamePassPreview;
    if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v24.getShouldInterleaveSdui()) and v111.props.edpServerIxpVariables and v111.props.edpServerIxpVariables.hideGameRatings == true then
        l_enableGamePlaysAndRatings_0 = false;
    end;
    local v125 = l_gameDetail_0 and l_gameDetail_0.description ~= nil and l_gameDetail_0.description ~= "";
    local l_showGlobalCounters_0 = v111.props.showGlobalCounters;
    local l_showLikesFavoritesCount_0 = v111.props.showLikesFavoritesCount;
    local l_ageRecommendations_0 = v111.props.ageRecommendations;
    local v129 = if l_FFlagLuaAppAddIgrsRatingToEdp_0 and l_ageRecommendations_0 and l_ageRecommendations_0.summary and l_ageRecommendations_0.summary.ageRecommendation and l_ageRecommendations_0.summary.ageRecommendation.igrsRating and l_ageRecommendations_0.summary.ageRecommendation.igrsRating ~= "" then l_ageRecommendations_0.summary.ageRecommendation.igrsRating else nil;
    local v130 = if l_FFlagLuaAppAddIgrsRatingToEdp_0 and l_ageRecommendations_0 and l_ageRecommendations_0.summary and l_ageRecommendations_0.summary.ageRecommendation and l_ageRecommendations_0.summary.ageRecommendation.igrsRatingDisplayMessage then l_ageRecommendations_0.summary.ageRecommendation.igrsRatingDisplayMessage else nil;
    local l_notificationsCanAccessExperience_0 = v111.props.notificationsCanAccessExperience;
    if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v24.getShouldInterleaveSdui()) and v111.props.edpServerIxpVariables and v111.props.edpServerIxpVariables.hideNotifyButton == true then
        l_notificationsCanAccessExperience_0 = false;
    end;
    local v132 = 0;
    local v133;
    do
        local l_v132_0 = v132;
        v133 = function() --[[ Line: 127 ]]
            -- upvalues: l_v132_0 (ref)
            l_v132_0 = l_v132_0 + 1;
            return l_v132_0;
        end;
    end;
    v132 = v111.props.webViewSupport and l_gameDetail_0 ~= nil and l_gameDetail_0.refundPolicy ~= nil;
    local v135 = if l_FFlagEnablePlayWithRewardComponent_0 then v111.props.isPlayabilitySettledAndPlayable else nil;
    return l_withStyle_0(function(v136) --[[ Line: 371 ]]
        -- upvalues: v3 (ref), v113 (copy), l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 (ref), v47 (ref), v84 (ref), l_universeId_2 (copy), l_notificationsCanAccessExperience_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v111 (copy), v133 (copy), v55 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (ref), v112 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v24 (ref), v52 (ref), v53 (ref), v51 (ref), v119 (copy), v125 (copy), v54 (ref), l_RetrievalStatus_1 (ref), v114 (copy), l_gameDetail_0 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (ref), v129 (copy), v56 (ref), v130 (copy), v42 (ref), v115 (copy), l_enableGamePlaysAndRatings_0 (ref), v48 (ref), l_showGlobalCounters_0 (copy), l_showLikesFavoritesCount_0 (copy), v122 (copy), v46 (ref), v121 (copy), l_ageRecommendations_0 (copy), l_enableGamePassPreview_0 (copy), v132 (copy), l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 (ref), v57 (ref), l_FFlagLuaAppShowNoticeOnEdp_0 (ref), l_ExperienceDetailsNoticeType_0 (ref), v67 (ref), l_RetrievalStatus_0 (ref), v120 (copy), v61 (ref), l_AppPage_0 (ref), l_FFlagSongEdpCarouselIxp_0 (ref), v60 (ref), l_gameInfo_0 (copy), l_FFlagEnablePlayWithRewardComponent_0 (ref), v135 (copy), l_PlayWithRewardComponent_0 (ref)
        local v137 = {
            ListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 20)
            }), 
            PagePadding = v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v113), 
                PaddingRight = UDim.new(0, v113), 
                PaddingTop = UDim.new(0, 0), 
                PaddingBottom = UDim.new(0, 20)
            }), 
            Header = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v3.createElement(v47, {
                LayoutOrder = v84.Header, 
                universeId = l_universeId_2, 
                showNotificationButton = l_notificationsCanAccessExperience_0, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v111.props.shouldHydrateLegacyIxp else nil
            }) else v3.createElement("Frame", {
                LayoutOrder = v133(), 
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
                        onSwipe = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then nil else v111.onMediaGallerySwiped, 
                        onMediaGalleryMediaChanged = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v111.onMediaGalleryMediaChanged else nil, 
                        mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v111.props.mediaGalleryRedesignEnabledIxp else nil, 
                        mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v111.props.mediaGalleryVideoPreviewEnabledIxp else nil, 
                        shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v111.props.shouldHydrateLegacyIxp else nil
                    }), 
                    SizeConstraint = v3.createElement("UISizeConstraint", {
                        MinSize = Vector2.new(0, (v112 - v113 * 2) / 1.7777777777777777)
                    })
                }), 
                Header = v3.createElement(v47, {
                    LayoutOrder = 1, 
                    universeId = l_universeId_2, 
                    showNotificationButton = l_notificationsCanAccessExperience_0, 
                    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v111.props.shouldHydrateLegacyIxp else nil
                })
            }), 
            MediaGalleryFrame = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v3.createElement("Frame", {
                LayoutOrder = v84.MediaGallery, 
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
                    onSwipe = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then nil else v111.onMediaGallerySwiped, 
                    onMediaGalleryMediaChanged = if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then v111.onMediaGalleryMediaChanged else nil, 
                    mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v111.props.mediaGalleryRedesignEnabledIxp else nil, 
                    mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v111.props.mediaGalleryVideoPreviewEnabledIxp else nil, 
                    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v111.props.shouldHydrateLegacyIxp else nil
                }), 
                SizeConstraint = v3.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, (v112 - v113 * 2) / 1.7777777777777777)
                })
            }) else nil, 
            StatsCarousel = if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v24.getShouldInterleaveSdui()) and v111.props.edpServerIxpVariables and v111.props.edpServerIxpVariables.hideStatsCarousel == true then nil else v3.createElement(v52, {
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v84.StatsCarousel else v133(), 
                universeId = l_universeId_2, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v111.props.shouldHydrateLegacyIxp else nil
            }), 
            TagSection = v3.createElement(v53, {
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v84.TagSection else v133(), 
                universeId = l_universeId_2, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v111.props.shouldHydrateLegacyIxp else nil, 
                hideContentDescriptors = (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v24.getShouldInterleaveSdui()) and v111.props.edpServerIxpVariables and v111.props.edpServerIxpVariables.showContentDescriptorsInInfoList == true or nil
            }), 
            MovedEventsList = v3.createElement(v51, {
                layoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v84.MovedEventsList else v133(), 
                universeId = l_universeId_2, 
                referralSource = "expDetailsPage", 
                defaultThumbnail = if v119 then ("rbxthumb://type=GameThumbnail&id=%d&w=768&h=432"):format(v119) else nil, 
                peekViewFormat = true
            }), 
            Description = if v125 then v3.createElement(v54, {
                dataStatus = l_RetrievalStatus_1.fromRawValue(v114), 
                descriptionText = l_gameDetail_0 and l_gameDetail_0.description, 
                expandable = true, 
                listPadding = v136.Tokens.Global.Space_125, 
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v84.Description else v133()
            }) else nil, 
            IgrsRatingLabel = if l_FFlagLuaAppAddIgrsRatingToEdp_0 and v129 then v3.createElement(v56, {
                igrsRating = v129, 
                igrsRatingDisplayMessage = v130, 
                onActivated = function() --[[ Line: 549 ]] --[[ Name: onActivated ]]
                    -- upvalues: v111 (ref), v42 (ref), v115 (ref)
                    v111.props.openWebview(v42.INDONESIAN_CONTENT_MATURITY_URL, v115.contentMaturityHeader);
                end, 
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v84.IgrsRatingLabel else v133()
            }) else nil, 
            PlaysAndRatings = l_enableGamePlaysAndRatings_0 and v3.createElement(v48, {
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v84.PlaysAndRatings else v133(), 
                universeId = l_universeId_2, 
                containerWidth = v112 - 2 * v113, 
                rowPadding = 20, 
                showGlobalCounters = l_showGlobalCounters_0, 
                showLikesFavoritesCount = l_showLikesFavoritesCount_0, 
                hideVisits = true, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v111.props.shouldHydrateLegacyIxp else nil
            }), 
            InfoList = v122 and v3.createElement(v46, {
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v84.InfoList else v133(), 
                universeId = l_universeId_2, 
                leftPadding = v113, 
                rightPadding = v113, 
                showSocial = v121, 
                ageRecommendations = l_ageRecommendations_0, 
                width = v112, 
                enableGamePassPreview = l_enableGamePassPreview_0, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v111.props.shouldHydrateLegacyIxp else nil
            }), 
            RefundPolicy = if v132 then if l_FFlagLuaAppEnableConsolidatedGameRefundPolicy_0 then v3.createElement(v57, {
                refundPolicy = l_gameDetail_0.refundPolicy, 
                layoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v84.RefundPolicy else v133()
            }) else v111.renderRefundPolicy(v136, l_gameDetail_0.refundPolicy, if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v84.RefundPolicy else v133()) else nil, 
            Notice = if l_FFlagLuaAppShowNoticeOnEdp_0 and v111.props.experienceDetailsNoticeType == l_ExperienceDetailsNoticeType_0.InExperiencePurchase then v3.createElement(v54, {
                dataStatus = if v67 then l_RetrievalStatus_1.fromRawValue(l_RetrievalStatus_0.Done) else l_RetrievalStatus_1.fromRawValue(v114), 
                headerText = v115.noticeHeader, 
                descriptionText = v115.noticeText, 
                expandable = false, 
                listPadding = v136.Tokens.Global.Space_125, 
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v84.Notice else v133()
            }) else nil, 
            RecommendedGames = v120 and v3.createElement("Frame", {
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v84.RecommendedGames else v133(), 
                Size = UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                Carousel = v3.createElement(v61, {
                    universeId = l_universeId_2, 
                    pageContext = l_AppPage_0.GameDetail, 
                    onPeekViewClosed = v111.props.onPeekViewClosed, 
                    scrollingEnabled = true, 
                    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v111.props.shouldHydrateLegacyIxp else nil
                })
            }), 
            ExperienceSongsCarousel = if l_FFlagSongEdpCarouselIxp_0 and v111.props.showSongCarousel then v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = if l_FFlagLuaAppExperienceDetailsLayoutOrderConfig_0 then v84.ExperienceSongsCarousel else v133()
            }, {
                v3.createElement(v60, {
                    universeId = l_universeId_2, 
                    universeTitle = l_gameDetail_0 and l_gameDetail_0.name or l_gameInfo_0 and l_gameInfo_0.name or "", 
                    collectionOrder = 2, 
                    clipsDescendants = false
                })
            }) else nil, 
            PlayWithRewardComponent = if l_FFlagEnablePlayWithRewardComponent_0 and v135 then v3.createElement(l_PlayWithRewardComponent_0, {
                universeId = l_universeId_2, 
                placeId = v119, 
                flowId = if v111.props.playWithRewardData then v111.props.playWithRewardData.flowId else "", 
                fetchedUniverseId = if v111.props.playWithRewardData then v111.props.playWithRewardData.universeId else nil, 
                playWithRewardAdData = if v111.props.playWithRewardData then v111.props.playWithRewardData.adData else nil
            }) else nil
        };
        if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v111.props.shouldInterleaveSduiIxp) and v111.props.sduiFeedItemConfigs then
            for v138, v139 in v111.props.sduiFeedItemConfigs do
                v137[("SduiFeedItem_%*"):format(v138)] = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v139.portraitLayoutOrder
                }, {
                    SduiComponent = v139.renderComponent()
                });
            end;
        end;
        return v3.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, v137);
    end);
end;
v85.renderOnFailed = function(v140, v141, v142, v143) --[[ Line: 703 ]] --[[ Name: renderOnFailed ]]
    -- upvalues: v67 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), l_EnumGameDetailErrorTypes_0 (copy), v3 (copy), l_EmptyState_0 (copy)
    if v140.props.gameInfo then
        return v140:renderOnLoaded(v142, v143, nil, if not not v67 or l_FFlagLuaAppAddIgrsRatingToEdp_0 then v141 else nil);
    else
        local v144 = v140.props.gameDetailError and v140.props.gameDetailError.errorType == l_EnumGameDetailErrorTypes_0.ExperienceUnavailable;
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 100), 
                PaddingLeft = UDim.new(0, v143), 
                PaddingRight = UDim.new(0, v143), 
                PaddingBottom = UDim.new(0, 20)
            }), 
            EmptyState = v3.createElement(l_EmptyState_0, {
                onActivated = if v144 then nil else v140.fetchGameDetailsPageData, 
                text = if v144 then v141.experienceUnavailableMessage else v141.failedMessage, 
                maxSizeTextLabel = Vector2.new(v142 - 2 * v143, 1e999)
            })
        });
    end;
end;
v85.getImageSize = function(_, v146, v147, v148, v149) --[[ Line: 738 ]] --[[ Name: getImageSize ]]
    local v150 = v147 * 1.8;
    local v151 = v149 / v148;
    local v152 = math.max(v150, v146 * v151);
    local v153 = v152 / v151;
    return Vector2.new(v153, v152);
end;
v85.render = function(v154) --[[ Line: 749 ]] --[[ Name: render ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v3 (copy), l_withLocalization_0 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_1 (copy), l_FFlagEnablePlayWithRewardComponent_0 (copy), v21 (copy)
    local l_screenSize_0 = v154.props.screenSize;
    local l_globalGuiInset_0 = v154.props.globalGuiInset;
    local l_gameDetailsPageDataStatus_0 = v154.props.gameDetailsPageDataStatus;
    local v158 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0);
    local v159 = math.min(v158.X.Offset, 640);
    local l_Offset_0 = v158.Y.Offset;
    local v161 = v159 < 600 and 20 or 40;
    local v163 = v3.createElement("Frame", {
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
            })(function(v162) --[[ Line: 788 ]]
                -- upvalues: v3 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_1 (ref), l_gameDetailsPageDataStatus_0 (copy), v154 (copy), v159 (copy), v161 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (ref), l_FFlagLuaAppAddIgrsRatingToEdp_0 (ref)
                return v3.createElement("Frame", {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Position = UDim2.new(0, 0, 0, 0), 
                    ZIndex = 2, 
                    BackgroundTransparency = 1
                }, {
                    LoadingStateContainer = v3.createElement(l_LoadingStateContainer_0, {
                        dataStatus = l_RetrievalStatus_1.fromRawValue(l_gameDetailsPageDataStatus_0), 
                        renderOnFailed = function() --[[ Line: 798 ]] --[[ Name: renderOnFailed ]]
                            -- upvalues: v154 (ref), v162 (copy), v159 (ref), v161 (ref)
                            return v154:renderOnFailed(v162, v159, v161);
                        end, 
                        renderOnLoading = function() --[[ Line: 801 ]] --[[ Name: renderOnLoading ]]
                            -- upvalues: v154 (ref), v161 (ref)
                            return v154:renderOnLoading(v161);
                        end, 
                        renderOnLoaded = function() --[[ Line: 804 ]] --[[ Name: renderOnLoaded ]]
                            -- upvalues: v154 (ref), v159 (ref), v161 (ref), l_gameDetailsPageDataStatus_0 (ref), l_FFlagLuaAppShowNoticeOnEdp_0 (ref), l_FFlagLuaAppAddIgrsRatingToEdp_0 (ref), v162 (copy)
                            return v154:renderOnLoaded(v159, v161, l_gameDetailsPageDataStatus_0, if not not l_FFlagLuaAppShowNoticeOnEdp_0 or l_FFlagLuaAppAddIgrsRatingToEdp_0 then v162 else nil);
                        end
                    })
                });
            end)
        })
    });
    if l_FFlagEnablePlayWithRewardComponent_0 then
        return v3.createFragment({
            Content = v163, 
            NavigationEvents = v3.createElement(v21.NavigationEvents, {
                onDidFocus = v154.onDidFocus
            })
        });
    else
        return v163;
    end;
end;
v85.didMount = function(v164) --[[ Line: 830 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagEnablePlayWithRewardComponent_0 (copy)
    v164.fetchGameDetailsPageData();
    if l_FFlagEnablePlayWithRewardComponent_0 then
        v164.maybeFetchPlayWithReward();
    end;
end;
v85.didUpdate = function(v165) --[[ Line: 837 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagEnablePlayWithRewardComponent_0 (copy)
    if l_FFlagEnablePlayWithRewardComponent_0 then
        v165.maybeFetchPlayWithReward();
    end;
end;
v85.willUnmount = function(v166) --[[ Line: 843 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagEnablePlayWithRewardComponent_0 (copy)
    local l_eventIngest_0 = v166.props.eventIngest;
    local l_universeId_3 = v166.props.universeId;
    local v169 = v166.props.gameDetail and v166.props.gameDetail.rootPlaceId or nil;
    local v170 = v166.props.source or "None";
    local v171 = v166.props.index or -1;
    if l_eventIngest_0 ~= nil and l_universeId_3 ~= nil and v169 ~= nil then
        l_eventIngest_0:setRBXEventStream("GameDetailsCard", "viewClose", {
            universeId = l_universeId_3, 
            rootPlaceId = v169, 
            source = v170, 
            index = v171
        });
    end;
    if l_FFlagEnablePlayWithRewardComponent_0 then
        v166.props.clearPlayWithReward();
    end;
end;
local v174 = l_memoize_0(function(v172, v173) --[[ Line: 862 ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    if v172 == l_RetrievalStatus_0.Done and (v173 == nil or #v173 == 0) then
        return false;
    else
        return true;
    end;
end);
v85 = v5.connect(function(v175, v176) --[[ Line: 872 ]]
    -- upvalues: l_FFlagEnablePlayWithRewardComponent_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), l_RetrievalStatus_0 (copy), l_PlayabilityStatusEnum_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v43 (copy), l_ApiFetchGameDetails_0 (copy), v50 (copy), l_GameInfosReducer_0 (copy), v174 (copy)
    local v177 = nil;
    local v178 = nil;
    local v179 = if l_FFlagEnablePlayWithRewardComponent_0 then l_FetchGamePlayabilityAndProductInfo_0.GetFetchingStatus(v175, v176.universeId) else nil;
    local v180 = if l_FFlagEnablePlayWithRewardComponent_0 then v175.PlayabilityStatus and v175.PlayabilityStatus[v176.universeId] or nil else nil;
    local v181 = if l_FFlagEnablePlayWithRewardComponent_0 then v179 == l_RetrievalStatus_0.Done and v180 ~= nil and v180.playabilityStatus == l_PlayabilityStatusEnum_0.Playable else nil;
    if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v176.shouldHydrateLegacyIxp then
        v177 = v43.GetFetchingStatus(v175, v176.universeId);
        v178 = v43.GetFetchingStatus(v175, v176.universeId);
    else
        v177 = l_ApiFetchGameDetails_0.GetFetchingStatus(v175, v176.universeId);
        v178 = v50.GetFetchingStatus(v175, v176.universeId);
    end;
    local v182 = v175.Personalization[l_GameInfosReducer_0.key][v176.universeId];
    local v183 = nil;
    if l_FFlagEnablePlayWithRewardComponent_0 and v175.PlayWithRewardState.universeId == v176.universeId then
        v183 = v175.PlayWithRewardState;
    end;
    return {
        topBarHeight = 0, 
        gameDetail = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v176.shouldHydrateLegacyIxp then v175.GameDetailsV2[v176.universeId] else v175.GameDetails[v176.universeId], 
        gameDetailError = v175.GameDetailErrors[v176.universeId], 
        gameDetailsPageDataStatus = v177, 
        gameInfo = v182, 
        screenSize = v175.ScreenSize, 
        globalGuiInset = v175.GlobalGuiInset, 
        showLoadingBackground = v177 ~= l_RetrievalStatus_0.Done, 
        showRecommendedGames = v174(v178, v175.RecommendedGameEntries[v176.universeId]), 
        ageRecommendations = v175.AgeRecommendations[v176.universeId], 
        playWithRewardData = if l_FFlagEnablePlayWithRewardComponent_0 then v183 else nil, 
        isPlayabilitySettledAndPlayable = if l_FFlagEnablePlayWithRewardComponent_0 then v181 else nil, 
        localUserId = if l_FFlagEnablePlayWithRewardComponent_0 then v175.LocalUserId else nil
    };
end, function(v184) --[[ Line: 929 ]]
    -- upvalues: v49 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagEnablePlayWithRewardComponent_0 (copy), l_SetPlayWithRewardState_0 (copy), l_FetchPlayWithRewardState_0 (copy), l_AdService_0 (copy), v58 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), v59 (copy)
    return {
        fetchGameDetailsPageData = function(v185, v186, v187, v188, v189) --[[ Line: 931 ]] --[[ Name: fetchGameDetailsPageData ]]
            -- upvalues: v184 (copy), v49 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref)
            return v184(v49(v185, v186, nil, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v187 else nil, if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v188 else nil, if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v188 then v189 else nil));
        end, 
        clearPlayWithReward = l_FFlagEnablePlayWithRewardComponent_0 and function() --[[ Line: 953 ]]
            -- upvalues: v184 (copy), l_SetPlayWithRewardState_0 (ref)
            return v184(l_SetPlayWithRewardState_0("", nil));
        end or nil, 
        fetchPlayWithReward = l_FFlagEnablePlayWithRewardComponent_0 and function(v190, v191) --[[ Line: 958 ]]
            -- upvalues: v184 (copy), l_FetchPlayWithRewardState_0 (ref), l_AdService_0 (ref)
            return v184(l_FetchPlayWithRewardState_0(l_AdService_0, v190, v191));
        end or nil, 
        openRefundPolicyLearnMorePage = function(v192) --[[ Line: 962 ]] --[[ Name: openRefundPolicyLearnMorePage ]]
            -- upvalues: v184 (copy), v58 (ref)
            return v184(v58(v192));
        end, 
        openWebview = l_FFlagLuaAppAddIgrsRatingToEdp_0 and function(v193, v194) --[[ Line: 966 ]]
            -- upvalues: v184 (copy), v59 (ref)
            return v184(v59(v193, v194));
        end or nil
    };
end)(v85);
v85 = l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    eventIngest = l_AppEventIngestService_0
})(v85);
v85 = l_RoactAppPolicy_0.connect(function(v195, _) --[[ Line: 978 ]]
    -- upvalues: l_FFlagLuaAppShowNoticeOnEdp_0 (copy)
    return {
        enableRecommendedGames = v195.getRecommendedGames(), 
        enableSocial = v195.getSocialLinks(), 
        enableGameInfoList = v195.getGameInfoList(), 
        enableGamePlaysAndRatings = v195.getGamePlaysAndRatings(), 
        showGlobalCounters = v195.getShowGlobalCounters(), 
        showLikesFavoritesCount = v195.getEnableAggregateLikesFavoritesCount(), 
        enableGamePassPreview = v195.getShowPassesOnExperienceDetails(), 
        webViewSupport = v195.getWebViewSupport(), 
        notificationsCanAccessExperience = v195.getNotificationsCanReceiveExperience(), 
        experienceDetailsNoticeType = if l_FFlagLuaAppShowNoticeOnEdp_0 then v195.getExperienceDetailsNoticeType() else nil
    };
end)(v85);
if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
    local l_v85_0 = v85;
    local l_l_v85_0_0 = l_v85_0 --[[ copy: 85 -> 86 ]];
    v85 = function(v199) --[[ Line: 997 ]]
        -- upvalues: l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v63 (copy), v62 (copy), v84 (copy), v44 (copy), v18 (copy), v17 (copy), v36 (copy), v3 (copy), l_l_v85_0_0 (copy), v4 (copy)
        local v200 = nil;
        local v201 = nil;
        local v202 = nil;
        if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
            local v203 = v63.useSduiContextFromSignalAndProcessConfigs(v62.getUnprocessedEdpStoreKey((tostring(v199.universeId))), v62.getEdpStoreKey((tostring(v199.universeId))), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v199.shouldInterleaveSduiIxp);
            v200 = v63.useSduiEdpFeedItemConfigs({
                sduiContext = v203, 
                storeKey = v62.getEdpStoreKey((tostring(v199.universeId))), 
                portraitLayoutConfig = v84, 
                landscapeLayoutConfig = v84, 
                defaultLayoutOrder = v84.SduiFeedItemsDefault, 
                logLayoutConflictFn = v44.logSduiLayoutOrderConflict, 
                shouldInterleaveSdui = l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v199.shouldInterleaveSduiIxp
            });
            local v205 = v18.useMemo(function() --[[ Line: 1018 ]]
                -- upvalues: l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v199 (copy), v63 (ref), v62 (ref)
                return function(v204) --[[ Line: 1019 ]]
                    -- upvalues: l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v199 (ref), v63 (ref), v62 (ref)
                    if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v199.shouldInterleaveSduiIxp) and v199.universeId then
                        return v63.getSduiFeedStore(v62.getEdpStoreKey((tostring(v199.universeId)))).getDataUpdatedTimestamp(v204);
                    else
                        return nil;
                    end;
                end;
            end, {
                v199.universeId, 
                v199.shouldInterleaveSduiIxp
            });
            v201 = v17.useSignalState(v205);
            v202 = v36();
        end;
        return v3.createElement(l_l_v85_0_0, v4.Dictionary.join(v199, {
            currentSduiDataTimestamp = v201, 
            sduiFeedItemConfigs = v200, 
            edpServerIxpVariables = v202
        }));
    end;
end;
if l_FFlagSongEdpCarouselIxp_0 or l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 or l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then
    v85 = v22.connectUserLayer({
        l_AppUserLayers_0.ExperienceDetailsPageExposureLayer
    }, function(v206, _) --[[ Line: 1051 ]]
        -- upvalues: l_AppUserLayers_0 (copy), l_FFlagSongEdpCarouselIxp_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (copy)
        local v208 = v206[l_AppUserLayers_0.ExperienceDetailsPageExposureLayer] or {};
        return {
            showSongCarousel = if l_FFlagSongEdpCarouselIxp_0 then v208.showSongCarousel else nil, 
            mediaGalleryRedesignEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v208.MediaGalleryRedesignEnabled else nil, 
            mediaGalleryVideoPreviewEnabledIxp = if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v208.MediaGalleryVideoPreviewEnabled else nil
        };
    end, true)(v85);
end;
if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
    local l_v85_1 = v85;
    v85 = function(v210) --[[ Line: 1070 ]]
        -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v24 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v18 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v3 (copy), l_v85_1 (copy), v4 (copy)
        local v211 = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v24.getShouldHydrateLegacy() else nil;
        local v212 = if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v24.getShouldInterleaveSdui() else nil;
        v18.useEffect(function() --[[ Line: 1078 ]]
            -- upvalues: l_IXPService_0 (ref), l_AppUserLayers_0 (ref)
            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.ExperienceDetailsPageExposureLayer);
        end, {});
        return v3.createElement(l_v85_1, v4.Dictionary.join(v210, {
            shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v211 else nil, 
            shouldInterleaveSduiIxp = if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v212 else nil
        }));
    end;
end;
return v85;