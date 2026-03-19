local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v5 = require(l_Modules_0.Common.RoactRodux);
local v6 = require(l_Modules_0.Common.memoize);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v9 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v10 = require(l_CorePackages_0.Packages.Cryo);
local v11 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_ImpressionsTagUtility_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ImpressionsTagUtility;
local v13 = require(l_Modules_0.LuaApp.AppPage);
local v14 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamePasses);
local v15 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v16 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v17 = require(l_Modules_0.LuaApp.Components.GameDetails.GameInfoRow);
local v18 = require(l_Modules_0.LuaApp.Components.Passes.PassesGrid);
local v19 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.EdpSocialLinksImpressionsDetector);
local v20 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks);
local l_ExperienceCommunityLink_0 = v20.Components.ExperienceCommunityLink;
local l_getCommunityUrl_0 = v20.Utils.getCommunityUrl;
local v23 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v23.Style.withStyle;
local l_useTextSizeOffset_0 = v23.Core.Style.useTextSizeOffset;
local v26 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v29 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v31 = require(l_Modules_0.LuaApp.Components.GameDetails.SocialMediaGroup);
local v32 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_GuildedLogoWhiteAsset_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Constants.GuildedLogoWhiteAsset;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Analytics.Constants;
local l_clickCommunityLinkEvent_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Analytics.Events.clickCommunityLinkEvent;
local v36 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceDetailsExperimentation);
local v37 = require(l_Modules_0.LuaApp.Flags.GetFFlagGameDetailsSeparateChatFeatureRows);
local v38 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixExperienceInfoShowServersPolicy);
local v39 = require(l_Modules_0.Personalization.Flags.FStringLuaAppGenreOverride);
local l_EnableCommunityProfilePageIXP_0 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform).EnableCommunityProfilePageIXP;
local l_FFlagLuaAppUseExperienceLogoTrayInGameInfoList_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppUseExperienceLogoTrayInGameInfoList;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local v44 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceLogoTray);
local l_FFlagLuaAppUpdateContentDescriptorsTranslation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppUpdateContentDescriptorsTranslation;
local v46 = require(l_CorePackages_0.Workspace.Packages.EdpStoreAnalytics);
local l_Constants_1 = v46.Constants;
local l_EdpStoreImpressionsDetector_0 = v46.EdpStoreImpressionsDetector;
local v49 = require(l_Modules_0.LuaApp.Flags.FFlagEnableEdpStoreImpressionsLogging);
local v50 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging);
local l_abbreviateCount_0 = require(l_CorePackages_0.Workspace.Packages.Localization).abbreviateCount;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp;
local v54 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.Hooks.useEdpServerIxpVariables);
local v55 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging);
local l_FFlagLuaAppBadgesSeeAllEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppBadgesSeeAllEnabled;
local l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp;
local l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp;
local l_FFlagLuaAppHideEdpStoreForUnplayable_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppHideEdpStoreForUnplayable;
local v60 = v3.PureComponent:extend("GameInfoList");
local v61 = {
    All = "Feature.GameDetails.Label.GenreAll", 
    Adventure = "Feature.GameDetails.Label.GenreAdventure", 
    Building = "Feature.GameDetails.Label.GenreBuilding", 
    Comedy = "Feature.GameDetails.Label.GenreComedy", 
    Fighting = "Feature.GameDetails.Label.GenreFighting", 
    FPS = "Feature.GameDetails.Label.GenreFPS", 
    Horror = "Feature.GameDetails.Label.LabelGenreHorror", 
    Medieval = "Feature.GameDetails.Label.GenreMedieval", 
    Military = "Feature.GameDetails.Label.GenreMilitary", 
    Naval = "Feature.GameDetails.Label.GenreNaval", 
    RPG = "Feature.GameDetails.Label.GenreRPG", 
    ["Sci-Fi"] = "Feature.GameDetails.Label.GenreSciFi", 
    Sports = "Feature.GameDetails.Label.LabelGenreSports", 
    ["Town and City"] = "Feature.GameDetails.Label.LabelGenreTownAndCity", 
    Western = "Feature.GameDetails.Label.GenreWestern"
};
v60.defaultProps = {
    leftPadding = 0, 
    rightPadding = 0
};
v60.init = function(v62) --[[ Line: 120 ]] --[[ Name: init ]]
    -- upvalues: v49 (copy), v3 (copy), v11 (copy), l_EdpStoreImpressionsDetector_0 (copy), l_Constants_1 (copy), l_ImpressionsTagUtility_0 (copy), v17 (copy), v55 (copy), v18 (copy), v50 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy)
    v62.createGamePassPreviewRow = function(v63, v64, v65, v66) --[[ Line: 121 ]]
        -- upvalues: v62 (copy), v49 (ref), v3 (ref), v11 (ref), l_EdpStoreImpressionsDetector_0 (ref), l_Constants_1 (ref), l_ImpressionsTagUtility_0 (ref), v17 (ref), v55 (ref), v18 (ref), v50 (ref)
        local v67 = v62.props.gameDetail and v62.props.gameDetail.rootPlaceId;
        local l_passes_0 = v62.props.passes;
        if not l_passes_0 or not v67 then
            return;
        else
            local l_leftPadding_0 = v62.props.leftPadding;
            local l_rightPadding_0 = v62.props.rightPadding;
            local l_width_0 = v62.props.width;
            local v72 = nil;
            local v73 = nil;
            local v74 = nil;
            local v75 = nil;
            local v76 = nil;
            if v49 then
                v72 = v3.createRef();
                v73 = v3.createRef();
                v73.current = v11.Signal.new();
                v74 = function(_) --[[ Line: 144 ]]
                    -- upvalues: v73 (ref)
                    v73.current:fire();
                end;
                v75 = v3.createElement(l_EdpStoreImpressionsDetector_0, {
                    parentRef = v72, 
                    scrollViewPositionChangedSignal = v73, 
                    impressionsTag = l_Constants_1.ImpressionsTags.Preview, 
                    parameters = {
                        universeId = v63, 
                        productType = l_Constants_1.StoreEnums.ProductType.GamePasses, 
                        locationType = l_Constants_1.StoreEnums.LocationType.Edp
                    }
                });
                v76 = function(v78) --[[ Line: 159 ]]
                    -- upvalues: v72 (ref), l_ImpressionsTagUtility_0 (ref), l_Constants_1 (ref), v64 (copy)
                    v72.current = v78;
                    l_ImpressionsTagUtility_0.AddTag(v72, l_Constants_1.ImpressionsTags.Preview, v64);
                end;
            end;
            return v3.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = v64
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    Padding = UDim.new(0, 10), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                PassesAndGears = v3.createElement(v17, {
                    Size = UDim2.new(1, 0, 0, 57), 
                    useVerifiedBadgeEmojiWrapper = v65.useVerifiedBadgeEmojiWrapper, 
                    LayoutOrder = 1, 
                    viewWidth = if v55() then l_width_0 else nil, 
                    placeId = v67, 
                    infoName = v65.infoName, 
                    infoData = v65.infoData, 
                    linkPage = v65.linkPage, 
                    linkView = v65.linkView, 
                    universeId = v63, 
                    leftPadding = l_leftPadding_0, 
                    rightPadding = l_rightPadding_0, 
                    topPadding = 10, 
                    bottomPadding = 10, 
                    analyticsSubPage = v65.analyticsSubPage, 
                    testId = v65.testId
                }), 
                GamePassPreview = v3.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    [v3.Ref] = if v49 then v76 else nil, 
                    [v3.Change.AbsolutePosition] = if v49 then v74 else nil
                }, {
                    Layout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    Padding = v3.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 20), 
                        PaddingLeft = UDim.new(0, l_leftPadding_0), 
                        PaddingRight = UDim.new(0, l_rightPadding_0)
                    }), 
                    Grid = v3.createElement(v18, {
                        universeId = v63, 
                        passes = l_passes_0, 
                        numRows = 1, 
                        viewWidth = l_width_0, 
                        textSizeOffset = v66, 
                        locationType = if v50() then l_Constants_1.StoreEnums.LocationType.Edp else nil
                    })
                }), 
                ImpressionsDetecter = if v49 then v75 else nil
            });
        end;
    end;
    v62.checkCommunityLinkExposureLogging = function() --[[ Line: 234 ]]
        -- upvalues: v62 (copy), l_IXPService_0 (ref), l_AppUserLayers_0 (ref)
        if v62.props.communityLink then
            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.EDPCommunityLinksLayer);
        end;
    end;
end;
v60.makeGameInfoListData = function(v79) --[[ Line: 242 ]] --[[ Name: makeGameInfoListData ]]
    -- upvalues: v38 (copy), l_FFlagLuaAppHideEdpStoreForUnplayable_0 (copy), v13 (copy), l_GuildedLogoWhiteAsset_0 (copy), l_getCommunityUrl_0 (copy), l_clickCommunityLinkEvent_0 (copy), l_Constants_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v36 (copy), l_abbreviateCount_0 (copy), l_FFlagLuaAppUpdateContentDescriptorsTranslation_0 (copy), l_EnableCommunityProfilePageIXP_0 (copy), v29 (copy), v39 (copy), v61 (copy), v37 (copy), l_FFlagLuaAppBadgesSeeAllEnabled_0 (copy)
    local l_localization_0 = v79.props.localization;
    local l_universeId_0 = v79.props.universeId;
    local l_maxPlayers_0 = v79.props.gameDetail.maxPlayers;
    local l_creator_0 = v79.props.gameDetail.creator;
    local l_id_0 = v79.props.gameDetail.creator.id;
    local l_type_0 = v79.props.gameDetail.creator.type;
    local l_name_0 = v79.props.gameDetail.creator.name;
    local l_creatorVerified_0 = v79.props.creatorVerified;
    local l_genre_0 = v79.props.gameDetail.genre;
    local l_genre_l1_0 = v79.props.gameDetail.genre_l1;
    local l_genre_l2_0 = v79.props.gameDetail.genre_l2;
    local v91 = DateTime.fromIsoDate(v79.props.gameDetail.created);
    local v92 = DateTime.fromIsoDate(v79.props.gameDetail.updated);
    local l_showPasses_0 = v79.props.showPasses;
    local l_showSubscriptionProducts_0 = v79.props.showSubscriptionProducts;
    local l_showDeveloperProducts_0 = v79.props.showDeveloperProducts;
    local l_showBadges_0 = v79.props.showBadges;
    local l_groupLink_0 = v79.props.groupLink;
    local v98 = nil;
    local v99 = nil;
    if v79.props.ageRecommendations then
        local l_summary_0 = v79.props.ageRecommendations.summary;
        v98 = if l_summary_0 and l_summary_0.ageRecommendation then l_summary_0.ageRecommendation.displayName else nil;
        v99 = if l_summary_0 and l_summary_0.ageRecommendation then l_summary_0.ageRecommendation.minimumAgeDisplay else nil;
    end;
    local l_enableGroupLinks_0 = v79.props.enableGroupLinks;
    local l_showBadgesRow_0 = v79.props.showBadgesRow;
    local l_showCreatedRow_0 = v79.props.showCreatedRow;
    local l_showDeveloperRow_0 = v79.props.showDeveloperRow;
    local l_showRNVDeveloper_0 = v79.props.showRNVDeveloper;
    local l_showGamepassesRow_0 = v79.props.showGamepassesRow;
    local l_showGenreRow_0 = v79.props.showGenreRow;
    local l_showSubgenreRow_0 = v79.props.showSubgenreRow;
    local l_showMaxPlayersRow_0 = v79.props.showMaxPlayersRow;
    local v110 = if v38() then v79.props.showServersRow else v79.props.showGamepassesRow;
    local l_showUpdatedRow_0 = v79.props.showUpdatedRow;
    local l_experienceVoiceEnabled_0 = v79.props.experienceVoiceEnabled;
    local l_experienceVideoEnabled_0 = v79.props.experienceVideoEnabled;
    local l_enableGamePassPreview_0 = v79.props.enableGamePassPreview;
    if l_showBadgesRow_0 == false then
        l_showBadges_0 = false;
    end;
    if l_showGamepassesRow_0 == false then
        l_showPasses_0 = false;
        l_showSubscriptionProducts_0 = false;
        l_showDeveloperProducts_0 = false;
    end;
    v79.gameInfoListData = {};
    local l_l_localization_0_Locale_0 = l_localization_0:GetLocale();
    local v116 = v91:FormatLocalTime("l", l_l_localization_0_Locale_0);
    local v117 = v92:FormatLocalTime("l", l_l_localization_0_Locale_0);
    if l_showPasses_0 and l_enableGamePassPreview_0 and (not l_FFlagLuaAppHideEdpStoreForUnplayable_0 or v79.props.isPlayable) then
        table.insert(v79.gameInfoListData, {
            renderFunction = v79.createGamePassPreviewRow, 
            itemInfo = {
                infoName = "Feature.GameDetails.Label.Store", 
                infoData = "", 
                linkView = v13.PassesPage, 
                analyticsSubPage = "PassesAndGear", 
                testId = "--store-row-tail"
            }
        });
    end;
    local l_communityLink_0 = v79.props.communityLink;
    local l_communityLinksEnabled_0 = v79.props.communityLinksEnabled;
    local l_communityLinkVariant_0 = v79.props.communityLinkVariant;
    if l_communityLinksEnabled_0 and l_communityLinkVariant_0 == "infolist" and l_communityLink_0 then
        table.insert(v79.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Community", 
            infoData = "", 
            infoIcon = l_GuildedLogoWhiteAsset_0, 
            linkUrl = l_getCommunityUrl_0(l_communityLink_0.communityId), 
            testId = "--community-row-tail", 
            linkClickCallback = function() --[[ Line: 333 ]] --[[ Name: linkClickCallback ]]
                -- upvalues: l_clickCommunityLinkEvent_0 (ref), v79 (copy), l_Constants_0 (ref), l_communityLink_0 (copy), l_universeId_0 (copy)
                l_clickCommunityLinkEvent_0(v79.props.eventIngest, l_Constants_0.Context.ExperienceInfoList, {
                    guildedServerId = l_communityLink_0.communityId, 
                    entityType = "universe", 
                    entityId = l_universeId_0
                });
            end
        });
    end;
    local l_edpServerIxpVariables_0 = v79.props.edpServerIxpVariables;
    if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v36.getShouldInterleaveSdui()) and l_edpServerIxpVariables_0 and l_edpServerIxpVariables_0.showVisitsInInfoList == true then
        local v122 = v79.props.gameDetail and v79.props.gameDetail.visits or 0;
        table.insert(v79.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Visits", 
            infoData = l_abbreviateCount_0(v122, l_l_localization_0_Locale_0) or "--", 
            testId = "--visits-row-tail"
        });
    end;
    table.insert(v79.gameInfoListData, {
        infoName = if v79.props.ageRecommendationHeader then v79.props.ageRecommendationHeader else "Feature.GameDetails.Label.ContentMaturity", 
        infoData = if v98 then v98 else l_localization_0:Format("Feature.GameDetails.Label.Unavailable"), 
        linkView = if v98 then v13.ExperienceGuidelinesExplained else nil, 
        analyticsSubPage = v13.ExperienceGuidelinesExplained, 
        disableInfoNameLocalization = v79.props.ageRecommendationHeader ~= nil, 
        testId = "--content-maturity-row-tail"
    });
    if v99 and v99 ~= "" then
        table.insert(v79.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Age", 
            infoData = v99, 
            testId = "--age-row-tail"
        });
    end;
    if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v36.getShouldInterleaveSdui()) and l_edpServerIxpVariables_0 and l_edpServerIxpVariables_0.showContentDescriptorsInInfoList == true and v79.props.ageRecommendations and v79.props.ageRecommendations.descriptorUsages and #v79.props.ageRecommendations.descriptorUsages > 0 then
        for _, v124 in ipairs(v79.props.ageRecommendations.descriptorUsages) do
            if v124.name == "strong-language" and v124.contains then
                table.insert(v79.gameInfoListData, {
                    infoName = l_FFlagLuaAppUpdateContentDescriptorsTranslation_0 and "Feature.AgeGuidelines.Label.CreatorEnabled" or "Feature.AccountSettings.Heading.Communication", 
                    infoData = l_localization_0:Format("Feature.AgeGuidelines.DisplayName.StrongLanguage"), 
                    testId = "--content-descriptors-row-tail"
                });
                break;
            end;
        end;
    end;
    if l_showDeveloperRow_0 or l_showRNVDeveloper_0 and l_creator_0.isRNVAccount then
        if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled and v79.props.communityProfilePageEnabled and l_type_0 == Enum.CreatorType.Group.Name then
            table.insert(v79.gameInfoListData, {
                infoName = "Feature.GameDetails.Label.Developer", 
                infoData = l_name_0, 
                linkView = "CommunityProfilePlatform", 
                linkViewData = l_id_0, 
                analyticsSubPage = "Developer", 
                useVerifiedBadgeEmojiWrapper = l_creatorVerified_0, 
                testId = "--developer-row-tail"
            });
        elseif l_type_0 == Enum.CreatorType.User.Name then
            table.insert(v79.gameInfoListData, {
                infoName = "Feature.GameDetails.Label.Developer", 
                infoData = l_name_0, 
                linkView = "UserProfilePlatform", 
                linkViewData = l_id_0, 
                analyticsSubPage = "Developer", 
                useVerifiedBadgeEmojiWrapper = l_creatorVerified_0, 
                testId = "--developer-row-tail"
            });
        else
            table.insert(v79.gameInfoListData, {
                infoName = "Feature.GameDetails.Label.Developer", 
                infoData = l_name_0, 
                linkPage = v29.game.info.creator({
                    creatorType = l_type_0, 
                    creatorId = l_id_0
                }), 
                analyticsSubPage = "Developer", 
                useVerifiedBadgeEmojiWrapper = l_creatorVerified_0, 
                testId = "--developer-row-tail"
            });
        end;
    end;
    if l_showMaxPlayersRow_0 then
        table.insert(v79.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.MaxPlayers", 
            infoData = tostring(l_maxPlayers_0), 
            testId = "--server-size-row-tail"
        });
    end;
    local v125 = nil;
    if l_genre_l1_0 and l_genre_l1_0 ~= "" then
        v125 = l_genre_l1_0;
    elseif v39 == "N/A" then
        v125 = l_localization_0:Format("Feature.GameDetails.Label.Unavailable");
    elseif v39 == "All" then
        v125 = l_localization_0:Format("Feature.GameDetails.Label.GenreAll");
    end;
    local v126 = v61[l_genre_0];
    if v125 then
        l_genre_0 = v125;
    elseif v126 ~= nil then
        l_genre_0 = l_localization_0:Format(v126);
    end;
    if l_showGenreRow_0 then
        table.insert(v79.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Genre", 
            infoData = l_genre_0, 
            testId = "--genre-row-tail"
        });
    end;
    if l_showSubgenreRow_0 and l_genre_l2_0 and l_genre_l2_0 ~= "" then
        table.insert(v79.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Subgenre", 
            infoData = l_genre_l2_0, 
            testId = "--subgenre-row-tail"
        });
    end;
    if l_showCreatedRow_0 then
        table.insert(v79.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Created", 
            infoData = v116, 
            testId = "--created-row-tail"
        });
    end;
    if l_showUpdatedRow_0 then
        table.insert(v79.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Updated", 
            infoData = v117, 
            testId = "--updated-row-tail"
        });
    end;
    if v37() then
        local v127 = l_localization_0:Format("Feature.GameDetails.Label.NotSupported");
        local v128 = l_localization_0:Format("Feature.GameDetails.Label.NotSupported");
        if l_experienceVideoEnabled_0 then
            v128 = l_localization_0:Format("Feature.GameDetails.Label.Supported");
        end;
        if l_experienceVoiceEnabled_0 then
            v127 = l_localization_0:Format("Feature.GameDetails.Label.Supported");
        end;
        if not v79.props.isLocalUserUnder13 then
            table.insert(v79.gameInfoListData, {
                infoName = "Feature.GameDetails.Label.VoiceChat", 
                infoData = v127, 
                testId = "--voice-chat-row-tail"
            });
        end;
        table.insert(v79.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Camera", 
            infoData = v128, 
            testId = "--camera-row-tail"
        });
    else
        local v129 = {};
        if l_experienceVoiceEnabled_0 and not v79.props.isLocalUserUnder13 then
            table.insert(v129, l_localization_0:Format("Feature.GameDetails.Label.Microphone"));
        end;
        if l_experienceVideoEnabled_0 then
            table.insert(v129, l_localization_0:Format("Feature.GameDetails.Label.Camera"));
        end;
        if #v129 < 1 then
            table.insert(v129, l_localization_0:Format("Feature.GameDetails.Label.None"));
        end;
        table.insert(v79.gameInfoListData, {
            infoName = "Feature.AccountSettings.Heading.Communication", 
            infoData = table.concat(v129, ", "), 
            testId = "--communication-row-tail"
        });
    end;
    if not l_enableGamePassPreview_0 and (l_showPasses_0 or l_showSubscriptionProducts_0 or l_showDeveloperProducts_0) and (not l_FFlagLuaAppHideEdpStoreForUnplayable_0 or v79.props.isPlayable) then
        table.insert(v79.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Store", 
            infoData = "", 
            linkView = v13.PassesPage, 
            analyticsSubPage = "PassesAndGear", 
            testId = "--store-row-tail"
        });
    end;
    if l_showBadges_0 then
        table.insert(v79.gameInfoListData, {
            infoName = "CommonUI.Features.Label.Badges", 
            infoData = "", 
            linkPage = if l_FFlagLuaAppBadgesSeeAllEnabled_0 then nil else v29.game.info.badges({
                universeId = l_universeId_0
            }), 
            linkView = if l_FFlagLuaAppBadgesSeeAllEnabled_0 then v13.BadgesSeeAll else nil, 
            analyticsSubPage = "Badges", 
            testId = "--badges-row-tail"
        });
    end;
    if v110 then
        table.insert(v79.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Servers", 
            infoData = "", 
            linkPage = v29.game.info.servers({
                universeId = l_universeId_0
            }), 
            analyticsSubPage = "Servers", 
            testId = "--servers-row-tail"
        });
    end;
    if l_groupLink_0 and l_enableGroupLinks_0 then
        if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled and v79.props.communityProfilePageEnabled and l_groupLink_0.communityId ~= nil then
            table.insert(v79.gameInfoListData, {
                infoName = "Feature.GameDetails.Label.Group", 
                infoData = "", 
                linkView = "CommunityProfilePlatform", 
                linkViewData = l_groupLink_0.communityId, 
                analyticsSubPage = "Group", 
                testId = "--group-row-tail"
            });
            return;
        else
            table.insert(v79.gameInfoListData, {
                infoName = "Feature.GameDetails.Label.Group", 
                infoData = "", 
                linkPage = l_groupLink_0.url, 
                analyticsSubPage = "Group", 
                testId = "--group-row-tail"
            });
        end;
    end;
end;
v60.createSocialMediaRow = function(v130, v131, v132) --[[ Line: 619 ]] --[[ Name: createSocialMediaRow ]]
    -- upvalues: l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (copy), v3 (copy), v11 (copy), v19 (copy), v13 (copy), l_FFlagLuaAppUseExperienceLogoTrayInGameInfoList_0 (copy), v44 (copy), l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (copy), v31 (copy)
    local v133 = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then ("EXPERIENCE_SOCIAL_LINKS_%*"):format(v131) else nil;
    local v134 = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v3.createRef() else nil;
    local v135 = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v11.Signal.new() else nil;
    local v137 = l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 and function(_) --[[ Line: 635 ]]
        -- upvalues: v135 (copy)
        v135:fire();
    end or nil;
    local l_leftPadding_1 = v130.props.leftPadding;
    local l_rightPadding_1 = v130.props.rightPadding;
    return v3.createElement("Frame", {
        LayoutOrder = v132, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        [v3.Ref] = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v134 else nil, 
        [v3.Change.AbsolutePosition] = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v137 else nil
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_leftPadding_1), 
            PaddingRight = UDim.new(0, l_rightPadding_1), 
            PaddingTop = UDim.new(0, 10), 
            PaddingBottom = UDim.new(0, 10)
        }), 
        EdpSocialLinksImpressionsDetector = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v3.createElement(v19, {
            parentRef = v134, 
            scrollViewPositionChangedSignal = v135, 
            pageContext = v13.GameDetail, 
            impressionsTag = v133, 
            socialLinks = if v130.props.socialLinks then v130.props.socialLinks.externalLinks else nil, 
            universeId = v131
        }) else nil, 
        SocialLinks = if l_FFlagLuaAppUseExperienceLogoTrayInGameInfoList_0 then if v130.props.socialLinks and v130.props.socialLinks.externalLinks then v3.createElement(v44, {
            socialLinks = v130.props.socialLinks.externalLinks, 
            linking = v130.props.linking, 
            openLeaveRobloxAlertUIBlox = v130.props.openLeaveRobloxAlertUIBlox, 
            closeAlert = v130.props.closeAlert, 
            impressionsTag = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v133 else nil, 
            universeId = if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then v130.props.universeId else nil
        }) else nil else v3.createElement(v31, {
            universeId = v131, 
            impressionsTag = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v133 else nil
        })
    });
end;
v60.createCommunityRow = function(v140, v141) --[[ Line: 692 ]] --[[ Name: createCommunityRow ]]
    -- upvalues: v3 (copy), l_ExperienceCommunityLink_0 (copy)
    local l_leftPadding_2 = v140.props.leftPadding;
    local l_rightPadding_2 = v140.props.rightPadding;
    return v3.createElement("Frame", {
        LayoutOrder = v141, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        Padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_leftPadding_2), 
            PaddingRight = UDim.new(0, l_rightPadding_2), 
            PaddingTop = UDim.new(0, 30), 
            PaddingBottom = UDim.new(0, 10)
        }), 
        ExperienceCommunityLink = v3.createElement(l_ExperienceCommunityLink_0, {
            communityInfo = v140.props.communityLink, 
            experienceName = v140.props.gameDetail.name, 
            universeId = v140.props.universeId
        })
    });
end;
v60.render = function(v144) --[[ Line: 717 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_withStyle_0 (copy), v17 (copy), l_EnableCommunityProfilePageIXP_0 (copy)
    local l_textSizeOffset_0 = v144.props.textSizeOffset;
    v144:makeGameInfoListData();
    local l_rootPlaceId_0 = v144.props.gameDetail.rootPlaceId;
    local l_universeId_1 = v144.props.universeId;
    local l_showSocial_0 = v144.props.showSocial;
    local l_LayoutOrder_0 = v144.props.LayoutOrder;
    local l_leftPadding_3 = v144.props.leftPadding;
    local l_rightPadding_3 = v144.props.rightPadding;
    local v152 = {
        Layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right
        })
    };
    return l_withStyle_0(function(v153) --[[ Line: 736 ]]
        -- upvalues: v144 (copy), v152 (copy), l_universeId_1 (copy), l_textSizeOffset_0 (copy), v3 (ref), v17 (ref), l_rootPlaceId_0 (copy), l_EnableCommunityProfilePageIXP_0 (ref), l_leftPadding_3 (copy), l_rightPadding_3 (copy), l_showSocial_0 (copy), l_LayoutOrder_0 (copy)
        local l_Color_0 = v153.Theme.Divider.Color;
        local l_Transparency_0 = v153.Theme.Divider.Transparency;
        local v156 = 0;
        local v157 = #v144.gameInfoListData;
        for v158, v159 in ipairs(v144.gameInfoListData) do
            local l_renderFunction_0 = v159.renderFunction;
            v156 = v156 + 1;
            if l_renderFunction_0 then
                v152["GameInfoRow" .. v158] = l_renderFunction_0(l_universeId_1, v156, v159.itemInfo, l_textSizeOffset_0);
            else
                v152["GameInfoRow" .. v158] = v3.createElement(v17, {
                    Size = UDim2.new(1, 0, 0, 57), 
                    useVerifiedBadgeEmojiWrapper = v159.useVerifiedBadgeEmojiWrapper, 
                    LayoutOrder = v156, 
                    placeId = l_rootPlaceId_0, 
                    infoName = v159.infoName, 
                    infoData = v159.infoData, 
                    infoIcon = v159.infoIcon, 
                    linkPage = v159.linkPage, 
                    linkView = v159.linkView, 
                    linkViewData = if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled then v159.linkViewData else nil, 
                    linkUrl = v159.linkUrl, 
                    linkClickCallback = v159.linkClickCallback, 
                    universeId = l_universeId_1, 
                    leftPadding = l_leftPadding_3, 
                    rightPadding = l_rightPadding_3, 
                    topPadding = 10, 
                    bottomPadding = 10, 
                    analyticsSubPage = v159.analyticsSubPage, 
                    disableInfoNameLocalization = v159.disableInfoNameLocalization, 
                    testId = v159.testId
                });
            end;
            v156 = v156 + 1;
            v152["Divider" .. v158] = v3.createElement("Frame", {
                Size = UDim2.new(1, -l_leftPadding_3, 0, 1), 
                BackgroundColor3 = l_Color_0, 
                BackgroundTransparency = l_Transparency_0, 
                BorderSizePixel = 0, 
                LayoutOrder = v156
            });
        end;
        local l_communityLinksEnabled_1 = v144.props.communityLinksEnabled;
        local l_communityLinkVariant_1 = v144.props.communityLinkVariant;
        if l_communityLinksEnabled_1 and l_communityLinkVariant_1 == "banner" then
            local v163 = v144.props.communityLink and v144:createCommunityRow(v156 + 1) or nil;
            if v163 ~= nil then
                v157 = v157 + 1;
                v156 = v156 + 1;
                v152["GameInfoRow" .. v157] = v163;
            end;
        end;
        local v164 = v156 + 1;
        local v165 = l_showSocial_0 and v144:createSocialMediaRow(l_universeId_1, v164) or nil;
        if v165 ~= nil then
            v152["GameInfoRow" .. v157 + 1] = v165;
        end;
        return v3.createElement("Frame", {
            Size = UDim2.new(1, l_leftPadding_3 + l_rightPadding_3, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = l_LayoutOrder_0, 
            ClipsDescendants = false
        }, v152);
    end);
end;
v60.didMount = function(v166) --[[ Line: 813 ]] --[[ Name: didMount ]]
    v166.checkCommunityLinkExposureLogging();
end;
v60.didUpdate = function(v167, v168, _) --[[ Line: 817 ]] --[[ Name: didUpdate ]]
    -- upvalues: v13 (copy)
    local l_topPage_0 = v167.props.topPage;
    local l_topPage_1 = v168.topPage;
    if l_topPage_0.name ~= l_topPage_1.name and l_topPage_1.name == v13.GenericWebPage and (if l_topPage_1.extraProps then l_topPage_1.extraProps.passOwned else nil) == false then
        v167.props.fetchGamePasses(v167.props.networking, v167.props.universeId);
    end;
    if not v168.communityLink then
        v167.checkCommunityLinkExposureLogging();
    end;
end;
local v176 = v6(function(v172) --[[ Line: 834 ]]
    local v173 = {};
    if not v172 then
        return v173;
    else
        for _, v175 in ipairs(v172) do
            if v175.price ~= nil then
                table.insert(v173, v175);
            end;
        end;
        return v173;
    end;
end);
local function _(v177) --[[ Line: 850 ]] --[[ Name: getTopPageInfo ]]
    local l_history_0 = v177.Navigation.history;
    local v179 = l_history_0[#l_history_0];
    return v179[#v179];
end;
v60 = v5.connect(function(v181, v182) --[[ Line: 857 ]]
    -- upvalues: v176 (copy), v32 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (copy), l_FFlagLuaAppUseExperienceLogoTrayInGameInfoList_0 (copy), l_FFlagLuaAppHideEdpStoreForUnplayable_0 (copy)
    local v183 = v181.GamePasses and v176(v181.GamePasses[v182.universeId]);
    local v184 = v181.GameSubscriptionProducts[v182.universeId];
    local v185 = v181.GameDeveloperProducts[v182.universeId];
    local v186 = v181.GameBadges[v182.universeId];
    local v187 = true;
    local v188 = v184 and #v184 > 0;
    local v189 = v185 and #v185 > 0;
    local v190 = true;
    local v191 = v181.GameSocialLinks[v182.universeId];
    local v192 = v191 and v191.groupLink;
    local v193 = false;
    local v194 = v32.isCreatorOfGameVerified(v181, if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v182.shouldHydrateLegacyIxp then {
        universeId = v182.universeId, 
        shouldUseV2GameDetails = true
    } else v182);
    local v195 = v181.CommunityLinks.ExperienceCommunityLinks[v182.universeId] or nil;
    if v183 and #v183 == 0 then
        v187 = false;
    end;
    if v186 and #v186 == 0 then
        v190 = false;
    end;
    local v196 = v181.VoiceChatOptInStatus.isUserOptIn or false;
    local v197 = false;
    if v181.ShowAgeVerificationOverlay[v182.universeId] ~= nil then
        v193 = v181.ShowAgeVerificationOverlay[v182.universeId].isUniverseEnabledForVoice or false;
        v197 = v181.ShowAgeVerificationOverlay[v182.universeId].isUniverseEnabledForAvatarVideo or false;
    end;
    local v198 = {
        gameDetail = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v182.shouldHydrateLegacyIxp then v181.GameDetailsV2[v182.universeId] else v181.GameDetails[v182.universeId], 
        creatorVerified = v194, 
        showPasses = v187, 
        passes = v183, 
        showSubscriptionProducts = v188, 
        showDeveloperProducts = v189, 
        showBadges = v190, 
        groupLink = v192, 
        communityLink = v195, 
        userVoiceEnabled = v196, 
        experienceVoiceEnabled = v193, 
        experienceVideoEnabled = v197, 
        isLocalUserUnder13 = v181.IsLocalUserUnder13
    };
    local l_history_1 = v181.Navigation.history;
    local v200 = l_history_1[#l_history_1];
    v198.topPage = v200[#v200];
    v198.ageRecommendationHeader = v181.AgeRecommendationHeaders.headerDisplayName;
    v198.socialLinks = if not not l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 or l_FFlagLuaAppUseExperienceLogoTrayInGameInfoList_0 then v191 else nil;
    v198.isPlayable = if l_FFlagLuaAppHideEdpStoreForUnplayable_0 then v181.PlayabilityStatus and v181.PlayabilityStatus[v182.universeId] and v181.PlayabilityStatus[v182.universeId].isPlayable else nil;
    return v198;
end, function(v201) --[[ Line: 927 ]]
    -- upvalues: v14 (copy), l_FFlagLuaAppUseExperienceLogoTrayInGameInfoList_0 (copy), v15 (copy), v16 (copy)
    return {
        fetchGamePasses = function(v202, v203) --[[ Line: 929 ]] --[[ Name: fetchGamePasses ]]
            -- upvalues: v201 (copy), v14 (ref)
            return v201(v14(v202, v203));
        end, 
        openLeaveRobloxAlertUIBlox = l_FFlagLuaAppUseExperienceLogoTrayInGameInfoList_0 and function(v204) --[[ Line: 933 ]]
            -- upvalues: v201 (copy), v15 (ref)
            v201(v15(v204));
        end or nil, 
        closeAlert = l_FFlagLuaAppUseExperienceLogoTrayInGameInfoList_0 and function() --[[ Line: 938 ]]
            -- upvalues: v201 (copy), v16 (ref)
            v201(v16());
        end or nil
    };
end)(v60);
v60 = v26.connectUserLayer({
    l_AppUserLayers_0.EDPCommunityLinksLayer, 
    l_EnableCommunityProfilePageIXP_0.EnableCommunityProfilePageExperimentLayer
}, function(v205) --[[ Line: 948 ]]
    -- upvalues: l_AppUserLayers_0 (copy), l_EnableCommunityProfilePageIXP_0 (copy)
    local v206 = (v205[l_AppUserLayers_0.EDPCommunityLinksLayer] or {}).communityLinkDisplayConfig or {};
    local v207 = if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled then l_EnableCommunityProfilePageIXP_0.isFeatureActive(v205) else nil;
    return {
        communityLinksEnabled = v206.inTreatment, 
        communityLinkVariant = v206.linkVariant, 
        communityProfilePageEnabled = if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled then v207 else nil
    };
end, false)(v60);
v60 = l_RoactAppPolicy_0.connect(function(v208, _) --[[ Line: 964 ]]
    return {
        enableGroupLinks = v208.getSocialGroupLinks(), 
        showBadgesRow = v208.getGameInfoShowBadges(), 
        showCreatedRow = v208.getGameInfoShowCreated(), 
        showDeveloperRow = v208.getGameInfoListDeveloper(), 
        showRNVDeveloper = v208.getGameInfoListShowRNVDeveloper(), 
        showGamepassesRow = v208.getGameInfoShowGamepasses(), 
        showGenreRow = v208.getGameInfoShowGenre(), 
        showSubgenreRow = v208.getGameInfoShowSubgenre(), 
        showMaxPlayersRow = v208.getGameInfoShowMaxPlayers(), 
        showServersRow = v208.getGameInfoShowServers(), 
        showUpdatedRow = v208.getGameInfoShowUpdated()
    };
end)(v60);
v60 = l_RoactServices_0.connect({
    localization = v4, 
    networking = v8, 
    eventIngest = v9, 
    linking = if l_FFlagLuaAppUseExperienceLogoTrayInGameInfoList_0 then l_AppLinking_0 else nil
})(v60);
return function(v210) --[[ Line: 986 ]]
    -- upvalues: l_useTextSizeOffset_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v54 (copy), v10 (copy), v36 (copy), v3 (copy), v60 (ref)
    local v211 = l_useTextSizeOffset_0();
    local v212 = nil;
    if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
        v212 = v54();
    end;
    local v213 = v10.Dictionary.join(v210, {
        textSizeOffset = v211, 
        edpServerIxpVariables = if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v36.getShouldInterleaveSdui() then v212 else nil
    });
    return v3.createElement(v60, v213);
end;