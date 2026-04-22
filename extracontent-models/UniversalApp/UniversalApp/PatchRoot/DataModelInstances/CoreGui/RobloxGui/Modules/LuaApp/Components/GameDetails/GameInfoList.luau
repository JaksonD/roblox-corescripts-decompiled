local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.Common.Roact);
local v5 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v6 = require(l_Modules_0.Common.RoactRodux);
local v7 = require(l_Modules_0.Common.memoize);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v9 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v10 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v11 = require(l_CorePackages_0.Packages.Cryo);
local v12 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_ImpressionsTagUtility_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ImpressionsTagUtility;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v15 = require(l_Modules_0.LuaApp.AppPage);
local v16 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamePasses);
local v17 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v18 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v19 = require(l_Modules_0.LuaApp.Components.GameDetails.GameInfoRow);
local v20 = require(l_Modules_0.LuaApp.Components.Passes.PassesGrid);
local v21 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.EdpSocialLinksImpressionsDetector);
local v22 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks);
local l_ExperienceCommunityLink_0 = v22.Components.ExperienceCommunityLink;
local l_getCommunityUrl_0 = v22.Utils.getCommunityUrl;
local v25 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v25.Style.withStyle;
local l_useTextSizeOffset_0 = v25.Core.Style.useTextSizeOffset;
local v28 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v31 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v33 = require(l_Modules_0.LuaApp.Components.GameDetails.SocialMediaGroup);
local v34 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_GuildedLogoWhiteAsset_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Constants.GuildedLogoWhiteAsset;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Analytics.Constants;
local l_clickCommunityLinkEvent_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Analytics.Events.clickCommunityLinkEvent;
local v38 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceDetailsExperimentation);
local v39 = require(l_Modules_0.LuaApp.Flags.GetFFlagGameDetailsSeparateChatFeatureRows);
local v40 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixExperienceInfoShowServersPolicy);
local v41 = require(l_Modules_0.Personalization.Flags.FStringLuaAppGenreOverride);
local v42 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.EnableCommunityProfilePageIXP);
local l_FFlagLuaAppUseExperienceLogoTrayInGameInfoList_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppUseExperienceLogoTrayInGameInfoList;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local v46 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceLogoTray);
local l_FFlagLuaAppUpdateContentDescriptorsTranslation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppUpdateContentDescriptorsTranslation;
local v48 = require(l_CorePackages_0.Workspace.Packages.EdpStoreAnalytics);
local l_Constants_1 = v48.Constants;
local l_EdpStoreImpressionsDetector_0 = v48.EdpStoreImpressionsDetector;
local v51 = require(l_Modules_0.LuaApp.Flags.FFlagEnableEdpStoreImpressionsLogging);
local v52 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging);
local l_abbreviateCount_0 = require(l_CorePackages_0.Workspace.Packages.Localization).abbreviateCount;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp;
local v56 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.Hooks.useEdpServerIxpVariables);
local v57 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging);
local l_FFlagLuaAppBadgesSeeAllEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppBadgesSeeAllEnabled;
local l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp;
local l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp;
local l_FFlagLuaAppHideEdpStoreForUnplayable_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppHideEdpStoreForUnplayable;
local l_FFlagEnableBlackbirdPageCloseCallback_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdPageCloseCallback;
local l_getSubscriptionPurchaseCloseCallback_0 = require(l_CorePackages_0.Workspace.Packages.RobloxSubscriptionPurchaseApp).Utils.getSubscriptionPurchaseCloseCallback;
local v64 = v4.PureComponent:extend("GameInfoList");
local v65 = {
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
v64.defaultProps = {
    leftPadding = 0, 
    rightPadding = 0
};
v64.init = function(v66) --[[ Line: 126 ]] --[[ Name: init ]]
    -- upvalues: v51 (copy), v4 (copy), v12 (copy), l_EdpStoreImpressionsDetector_0 (copy), l_Constants_1 (copy), l_ImpressionsTagUtility_0 (copy), v19 (copy), v57 (copy), v20 (copy), v52 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy)
    v66.createGamePassPreviewRow = function(v67, v68, v69, v70) --[[ Line: 127 ]]
        -- upvalues: v66 (copy), v51 (ref), v4 (ref), v12 (ref), l_EdpStoreImpressionsDetector_0 (ref), l_Constants_1 (ref), l_ImpressionsTagUtility_0 (ref), v19 (ref), v57 (ref), v20 (ref), v52 (ref)
        local v71 = v66.props.gameDetail and v66.props.gameDetail.rootPlaceId;
        local l_passes_0 = v66.props.passes;
        if not l_passes_0 or not v71 then
            return;
        else
            local l_leftPadding_0 = v66.props.leftPadding;
            local l_rightPadding_0 = v66.props.rightPadding;
            local l_width_0 = v66.props.width;
            local v76 = nil;
            local v77 = nil;
            local v78 = nil;
            local v79 = nil;
            local v80 = nil;
            if v51 then
                v76 = v4.createRef();
                v77 = v4.createRef();
                v77.current = v12.Signal.new();
                v78 = function(_) --[[ Line: 150 ]]
                    -- upvalues: v77 (ref)
                    v77.current:fire();
                end;
                v79 = v4.createElement(l_EdpStoreImpressionsDetector_0, {
                    parentRef = v76, 
                    scrollViewPositionChangedSignal = v77, 
                    impressionsTag = l_Constants_1.ImpressionsTags.Preview, 
                    parameters = {
                        universeId = v67, 
                        productType = l_Constants_1.StoreEnums.ProductType.GamePasses, 
                        locationType = l_Constants_1.StoreEnums.LocationType.Edp
                    }
                });
                v80 = function(v82) --[[ Line: 165 ]]
                    -- upvalues: v76 (ref), l_ImpressionsTagUtility_0 (ref), l_Constants_1 (ref), v68 (copy)
                    v76.current = v82;
                    l_ImpressionsTagUtility_0.AddTag(v76, l_Constants_1.ImpressionsTags.Preview, v68);
                end;
            end;
            return v4.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = v68
            }, {
                UIListLayout = v4.createElement("UIListLayout", {
                    Padding = UDim.new(0, 10), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                PassesAndGears = v4.createElement(v19, {
                    Size = UDim2.new(1, 0, 0, 57), 
                    useVerifiedBadgeEmojiWrapper = v69.useVerifiedBadgeEmojiWrapper, 
                    LayoutOrder = 1, 
                    viewWidth = if v57() then l_width_0 else nil, 
                    placeId = v71, 
                    infoName = v69.infoName, 
                    infoData = v69.infoData, 
                    linkPage = v69.linkPage, 
                    linkView = v69.linkView, 
                    universeId = v67, 
                    leftPadding = l_leftPadding_0, 
                    rightPadding = l_rightPadding_0, 
                    topPadding = 10, 
                    bottomPadding = 10, 
                    analyticsSubPage = v69.analyticsSubPage, 
                    testId = v69.testId
                }), 
                GamePassPreview = v4.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    [v4.Ref] = if v51 then v80 else nil, 
                    [v4.Change.AbsolutePosition] = if v51 then v78 else nil
                }, {
                    Layout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    Padding = v4.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 20), 
                        PaddingLeft = UDim.new(0, l_leftPadding_0), 
                        PaddingRight = UDim.new(0, l_rightPadding_0)
                    }), 
                    Grid = v4.createElement(v20, {
                        universeId = v67, 
                        passes = l_passes_0, 
                        numRows = 1, 
                        viewWidth = l_width_0, 
                        textSizeOffset = v70, 
                        locationType = if v52() then l_Constants_1.StoreEnums.LocationType.Edp else nil
                    })
                }), 
                ImpressionsDetecter = if v51 then v79 else nil
            });
        end;
    end;
    v66.checkCommunityLinkExposureLogging = function() --[[ Line: 240 ]]
        -- upvalues: v66 (copy), l_IXPService_0 (ref), l_AppUserLayers_0 (ref)
        if v66.props.communityLink then
            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.EDPCommunityLinksLayer);
        end;
    end;
end;
v64.makeGameInfoListData = function(v83) --[[ Line: 248 ]] --[[ Name: makeGameInfoListData ]]
    -- upvalues: v40 (copy), l_FFlagLuaAppHideEdpStoreForUnplayable_0 (copy), v15 (copy), l_GuildedLogoWhiteAsset_0 (copy), l_getCommunityUrl_0 (copy), l_clickCommunityLinkEvent_0 (copy), l_Constants_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v38 (copy), l_abbreviateCount_0 (copy), l_FFlagLuaAppUpdateContentDescriptorsTranslation_0 (copy), v42 (copy), v31 (copy), v41 (copy), v65 (copy), v39 (copy), l_FFlagLuaAppBadgesSeeAllEnabled_0 (copy), l_FFlagEnableBlackbirdPageCloseCallback_0 (copy), l_getSubscriptionPurchaseCloseCallback_0 (copy)
    local l_localization_0 = v83.props.localization;
    local l_universeId_0 = v83.props.universeId;
    local l_maxPlayers_0 = v83.props.gameDetail.maxPlayers;
    local l_creator_0 = v83.props.gameDetail.creator;
    local l_id_0 = v83.props.gameDetail.creator.id;
    local l_type_0 = v83.props.gameDetail.creator.type;
    local l_name_0 = v83.props.gameDetail.creator.name;
    local l_creatorVerified_0 = v83.props.creatorVerified;
    local l_genre_0 = v83.props.gameDetail.genre;
    local l_genre_l1_0 = v83.props.gameDetail.genre_l1;
    local l_genre_l2_0 = v83.props.gameDetail.genre_l2;
    local v95 = DateTime.fromIsoDate(v83.props.gameDetail.created);
    local v96 = DateTime.fromIsoDate(v83.props.gameDetail.updated);
    local l_showPasses_0 = v83.props.showPasses;
    local l_showSubscriptionProducts_0 = v83.props.showSubscriptionProducts;
    local l_showDeveloperProducts_0 = v83.props.showDeveloperProducts;
    local l_showBadges_0 = v83.props.showBadges;
    local l_groupLink_0 = v83.props.groupLink;
    local v102 = nil;
    local v103 = nil;
    if v83.props.ageRecommendations then
        local l_summary_0 = v83.props.ageRecommendations.summary;
        v102 = if l_summary_0 and l_summary_0.ageRecommendation then l_summary_0.ageRecommendation.displayName else nil;
        v103 = if l_summary_0 and l_summary_0.ageRecommendation then l_summary_0.ageRecommendation.minimumAgeDisplay else nil;
    end;
    local l_enableGroupLinks_0 = v83.props.enableGroupLinks;
    local l_showBadgesRow_0 = v83.props.showBadgesRow;
    local l_showCreatedRow_0 = v83.props.showCreatedRow;
    local l_showDeveloperRow_0 = v83.props.showDeveloperRow;
    local l_showRNVDeveloper_0 = v83.props.showRNVDeveloper;
    local l_showGamepassesRow_0 = v83.props.showGamepassesRow;
    local l_showGenreRow_0 = v83.props.showGenreRow;
    local l_showSubgenreRow_0 = v83.props.showSubgenreRow;
    local l_showMaxPlayersRow_0 = v83.props.showMaxPlayersRow;
    local v114 = if v40() then v83.props.showServersRow else v83.props.showGamepassesRow;
    local l_showUpdatedRow_0 = v83.props.showUpdatedRow;
    local l_experienceVoiceEnabled_0 = v83.props.experienceVoiceEnabled;
    local l_experienceVideoEnabled_0 = v83.props.experienceVideoEnabled;
    local l_enableGamePassPreview_0 = v83.props.enableGamePassPreview;
    if l_showBadgesRow_0 == false then
        l_showBadges_0 = false;
    end;
    if l_showGamepassesRow_0 == false then
        l_showPasses_0 = false;
        l_showSubscriptionProducts_0 = false;
        l_showDeveloperProducts_0 = false;
    end;
    v83.gameInfoListData = {};
    local l_l_localization_0_Locale_0 = l_localization_0:GetLocale();
    local v120 = v95:FormatLocalTime("l", l_l_localization_0_Locale_0);
    local v121 = v96:FormatLocalTime("l", l_l_localization_0_Locale_0);
    if l_showPasses_0 and l_enableGamePassPreview_0 and (not l_FFlagLuaAppHideEdpStoreForUnplayable_0 or v83.props.isPlayable) then
        table.insert(v83.gameInfoListData, {
            renderFunction = v83.createGamePassPreviewRow, 
            itemInfo = {
                infoName = "Feature.GameDetails.Label.Store", 
                infoData = "", 
                linkView = v15.PassesPage, 
                analyticsSubPage = "PassesAndGear", 
                testId = "--store-row-tail"
            }
        });
    end;
    local l_communityLink_0 = v83.props.communityLink;
    local l_communityLinksEnabled_0 = v83.props.communityLinksEnabled;
    local l_communityLinkVariant_0 = v83.props.communityLinkVariant;
    if l_communityLinksEnabled_0 and l_communityLinkVariant_0 == "infolist" and l_communityLink_0 then
        table.insert(v83.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Community", 
            infoData = "", 
            infoIcon = l_GuildedLogoWhiteAsset_0, 
            linkUrl = l_getCommunityUrl_0(l_communityLink_0.communityId), 
            testId = "--community-row-tail", 
            linkClickCallback = function() --[[ Line: 339 ]] --[[ Name: linkClickCallback ]]
                -- upvalues: l_clickCommunityLinkEvent_0 (ref), v83 (copy), l_Constants_0 (ref), l_communityLink_0 (copy), l_universeId_0 (copy)
                l_clickCommunityLinkEvent_0(v83.props.eventIngest, l_Constants_0.Context.ExperienceInfoList, {
                    guildedServerId = l_communityLink_0.communityId, 
                    entityType = "universe", 
                    entityId = l_universeId_0
                });
            end
        });
    end;
    local l_edpServerIxpVariables_0 = v83.props.edpServerIxpVariables;
    if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v38.getShouldInterleaveSdui()) and l_edpServerIxpVariables_0 and l_edpServerIxpVariables_0.showVisitsInInfoList == true then
        local v126 = v83.props.gameDetail and v83.props.gameDetail.visits or 0;
        table.insert(v83.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Visits", 
            infoData = l_abbreviateCount_0(v126, l_l_localization_0_Locale_0) or "--", 
            testId = "--visits-row-tail"
        });
    end;
    table.insert(v83.gameInfoListData, {
        infoName = if v83.props.ageRecommendationHeader then v83.props.ageRecommendationHeader else "Feature.GameDetails.Label.ContentMaturity", 
        infoData = if v102 then v102 else l_localization_0:Format("Feature.GameDetails.Label.Unavailable"), 
        linkView = if v102 then v15.ExperienceGuidelinesExplained else nil, 
        analyticsSubPage = v15.ExperienceGuidelinesExplained, 
        disableInfoNameLocalization = v83.props.ageRecommendationHeader ~= nil, 
        testId = "--content-maturity-row-tail"
    });
    if v103 and v103 ~= "" then
        table.insert(v83.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Age", 
            infoData = v103, 
            testId = "--age-row-tail"
        });
    end;
    if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v38.getShouldInterleaveSdui()) and l_edpServerIxpVariables_0 and l_edpServerIxpVariables_0.showContentDescriptorsInInfoList == true and v83.props.ageRecommendations and v83.props.ageRecommendations.descriptorUsages and #v83.props.ageRecommendations.descriptorUsages > 0 then
        for _, v128 in ipairs(v83.props.ageRecommendations.descriptorUsages) do
            if v128.name == "strong-language" and v128.contains then
                table.insert(v83.gameInfoListData, {
                    infoName = l_FFlagLuaAppUpdateContentDescriptorsTranslation_0 and "Feature.AgeGuidelines.Label.CreatorEnabled" or "Feature.AccountSettings.Heading.Communication", 
                    infoData = l_localization_0:Format("Feature.AgeGuidelines.DisplayName.StrongLanguage"), 
                    testId = "--content-descriptors-row-tail"
                });
                break;
            end;
        end;
    end;
    if l_showDeveloperRow_0 or l_showRNVDeveloper_0 and l_creator_0.isRNVAccount then
        if v42.FFlagIsSetupEnabled and v83.props.communityProfilePageEnabled and l_type_0 == Enum.CreatorType.Group.Name then
            table.insert(v83.gameInfoListData, {
                infoName = "Feature.GameDetails.Label.Developer", 
                infoData = l_name_0, 
                linkView = "CommunityProfilePlatform", 
                linkViewData = l_id_0, 
                analyticsSubPage = "Developer", 
                useVerifiedBadgeEmojiWrapper = l_creatorVerified_0, 
                testId = "--developer-row-tail"
            });
        elseif l_type_0 == Enum.CreatorType.User.Name then
            table.insert(v83.gameInfoListData, {
                infoName = "Feature.GameDetails.Label.Developer", 
                infoData = l_name_0, 
                linkView = "UserProfilePlatform", 
                linkViewData = l_id_0, 
                analyticsSubPage = "Developer", 
                useVerifiedBadgeEmojiWrapper = l_creatorVerified_0, 
                testId = "--developer-row-tail"
            });
        else
            table.insert(v83.gameInfoListData, {
                infoName = "Feature.GameDetails.Label.Developer", 
                infoData = l_name_0, 
                linkPage = v31.game.info.creator({
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
        table.insert(v83.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.MaxPlayers", 
            infoData = tostring(l_maxPlayers_0), 
            testId = "--server-size-row-tail"
        });
    end;
    local v129 = nil;
    if l_genre_l1_0 and l_genre_l1_0 ~= "" then
        v129 = l_genre_l1_0;
    elseif v41 == "N/A" then
        v129 = l_localization_0:Format("Feature.GameDetails.Label.Unavailable");
    elseif v41 == "All" then
        v129 = l_localization_0:Format("Feature.GameDetails.Label.GenreAll");
    end;
    local v130 = v65[l_genre_0];
    if v129 then
        l_genre_0 = v129;
    elseif v130 ~= nil then
        l_genre_0 = l_localization_0:Format(v130);
    end;
    if l_showGenreRow_0 then
        table.insert(v83.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Genre", 
            infoData = l_genre_0, 
            testId = "--genre-row-tail"
        });
    end;
    if l_showSubgenreRow_0 and l_genre_l2_0 and l_genre_l2_0 ~= "" then
        table.insert(v83.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Subgenre", 
            infoData = l_genre_l2_0, 
            testId = "--subgenre-row-tail"
        });
    end;
    if l_showCreatedRow_0 then
        table.insert(v83.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Created", 
            infoData = v120, 
            testId = "--created-row-tail"
        });
    end;
    if l_showUpdatedRow_0 then
        table.insert(v83.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Updated", 
            infoData = v121, 
            testId = "--updated-row-tail"
        });
    end;
    if v39() then
        local v131 = l_localization_0:Format("Feature.GameDetails.Label.NotSupported");
        local v132 = l_localization_0:Format("Feature.GameDetails.Label.NotSupported");
        if l_experienceVideoEnabled_0 then
            v132 = l_localization_0:Format("Feature.GameDetails.Label.Supported");
        end;
        if l_experienceVoiceEnabled_0 then
            v131 = l_localization_0:Format("Feature.GameDetails.Label.Supported");
        end;
        if not v83.props.isLocalUserUnder13 then
            table.insert(v83.gameInfoListData, {
                infoName = "Feature.GameDetails.Label.VoiceChat", 
                infoData = v131, 
                testId = "--voice-chat-row-tail"
            });
        end;
        table.insert(v83.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Camera", 
            infoData = v132, 
            testId = "--camera-row-tail"
        });
    else
        local v133 = {};
        if l_experienceVoiceEnabled_0 and not v83.props.isLocalUserUnder13 then
            table.insert(v133, l_localization_0:Format("Feature.GameDetails.Label.Microphone"));
        end;
        if l_experienceVideoEnabled_0 then
            table.insert(v133, l_localization_0:Format("Feature.GameDetails.Label.Camera"));
        end;
        if #v133 < 1 then
            table.insert(v133, l_localization_0:Format("Feature.GameDetails.Label.None"));
        end;
        table.insert(v83.gameInfoListData, {
            infoName = "Feature.AccountSettings.Heading.Communication", 
            infoData = table.concat(v133, ", "), 
            testId = "--communication-row-tail"
        });
    end;
    if not l_enableGamePassPreview_0 and (l_showPasses_0 or l_showSubscriptionProducts_0 or l_showDeveloperProducts_0) and (not l_FFlagLuaAppHideEdpStoreForUnplayable_0 or v83.props.isPlayable) then
        table.insert(v83.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Store", 
            infoData = "", 
            linkView = v15.PassesPage, 
            analyticsSubPage = "PassesAndGear", 
            testId = "--store-row-tail"
        });
    end;
    if l_showBadges_0 then
        table.insert(v83.gameInfoListData, {
            infoName = "CommonUI.Features.Label.Badges", 
            infoData = "", 
            linkPage = if l_FFlagLuaAppBadgesSeeAllEnabled_0 then nil else v31.game.info.badges({
                universeId = l_universeId_0
            }), 
            linkView = if l_FFlagLuaAppBadgesSeeAllEnabled_0 then v15.BadgesSeeAll else nil, 
            analyticsSubPage = "Badges", 
            testId = "--badges-row-tail"
        });
    end;
    if v114 then
        table.insert(v83.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Servers", 
            infoData = "", 
            linkPage = v31.game.info.servers({
                universeId = l_universeId_0
            }), 
            analyticsSubPage = "Servers", 
            testId = "--servers-row-tail", 
            onClose = if l_FFlagEnableBlackbirdPageCloseCallback_0 and l_getSubscriptionPurchaseCloseCallback_0 then l_getSubscriptionPurchaseCloseCallback_0() else nil
        });
    end;
    if l_groupLink_0 and l_enableGroupLinks_0 then
        if v42.FFlagIsSetupEnabled and v83.props.communityProfilePageEnabled and l_groupLink_0.communityId ~= nil then
            table.insert(v83.gameInfoListData, {
                infoName = "Feature.GameDetails.Label.Group", 
                infoData = "", 
                linkView = "CommunityProfilePlatform", 
                linkViewData = l_groupLink_0.communityId, 
                analyticsSubPage = "Group", 
                testId = "--group-row-tail"
            });
            return;
        else
            table.insert(v83.gameInfoListData, {
                infoName = "Feature.GameDetails.Label.Group", 
                infoData = "", 
                linkPage = l_groupLink_0.url, 
                analyticsSubPage = "Group", 
                testId = "--group-row-tail"
            });
        end;
    end;
end;
v64.createSocialMediaRow = function(v134, v135, v136) --[[ Line: 628 ]] --[[ Name: createSocialMediaRow ]]
    -- upvalues: l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (copy), v4 (copy), v12 (copy), v21 (copy), v15 (copy), l_FFlagLuaAppUseExperienceLogoTrayInGameInfoList_0 (copy), v46 (copy), l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (copy), v33 (copy)
    local v137 = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then ("EXPERIENCE_SOCIAL_LINKS_%*"):format(v135) else nil;
    local v138 = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v4.createRef() else nil;
    local v139 = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v12.Signal.new() else nil;
    local v141 = l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 and function(_) --[[ Line: 644 ]]
        -- upvalues: v139 (copy)
        v139:fire();
    end or nil;
    local l_leftPadding_1 = v134.props.leftPadding;
    local l_rightPadding_1 = v134.props.rightPadding;
    return v4.createElement("Frame", {
        LayoutOrder = v136, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        [v4.Ref] = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v138 else nil, 
        [v4.Change.AbsolutePosition] = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v141 else nil
    }, {
        ListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_leftPadding_1), 
            PaddingRight = UDim.new(0, l_rightPadding_1), 
            PaddingTop = UDim.new(0, 10), 
            PaddingBottom = UDim.new(0, 10)
        }), 
        EdpSocialLinksImpressionsDetector = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v4.createElement(v21, {
            parentRef = v138, 
            scrollViewPositionChangedSignal = v139, 
            pageContext = v15.GameDetail, 
            impressionsTag = v137, 
            socialLinks = if v134.props.socialLinks then v134.props.socialLinks.externalLinks else nil, 
            universeId = v135
        }) else nil, 
        SocialLinks = if l_FFlagLuaAppUseExperienceLogoTrayInGameInfoList_0 then if v134.props.socialLinks and v134.props.socialLinks.externalLinks then v4.createElement(v46, {
            socialLinks = v134.props.socialLinks.externalLinks, 
            linking = v134.props.linking, 
            openLeaveRobloxAlertUIBlox = v134.props.openLeaveRobloxAlertUIBlox, 
            closeAlert = v134.props.closeAlert, 
            impressionsTag = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v137 else nil, 
            universeId = if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then v134.props.universeId else nil
        }) else nil else v4.createElement(v33, {
            universeId = v135, 
            impressionsTag = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v137 else nil
        })
    });
end;
v64.createCommunityRow = function(v144, v145) --[[ Line: 701 ]] --[[ Name: createCommunityRow ]]
    -- upvalues: v4 (copy), l_ExperienceCommunityLink_0 (copy)
    local l_leftPadding_2 = v144.props.leftPadding;
    local l_rightPadding_2 = v144.props.rightPadding;
    return v4.createElement("Frame", {
        LayoutOrder = v145, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        Padding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_leftPadding_2), 
            PaddingRight = UDim.new(0, l_rightPadding_2), 
            PaddingTop = UDim.new(0, 30), 
            PaddingBottom = UDim.new(0, 10)
        }), 
        ExperienceCommunityLink = v4.createElement(l_ExperienceCommunityLink_0, {
            communityInfo = v144.props.communityLink, 
            experienceName = v144.props.gameDetail.name, 
            universeId = v144.props.universeId
        })
    });
end;
v64.render = function(v148) --[[ Line: 726 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_withStyle_0 (copy), v19 (copy), v42 (copy), l_FFlagEnableBlackbirdPageCloseCallback_0 (copy)
    local l_textSizeOffset_0 = v148.props.textSizeOffset;
    v148:makeGameInfoListData();
    local l_rootPlaceId_0 = v148.props.gameDetail.rootPlaceId;
    local l_universeId_1 = v148.props.universeId;
    local l_showSocial_0 = v148.props.showSocial;
    local l_LayoutOrder_0 = v148.props.LayoutOrder;
    local l_leftPadding_3 = v148.props.leftPadding;
    local l_rightPadding_3 = v148.props.rightPadding;
    local v156 = {
        Layout = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right
        })
    };
    return l_withStyle_0(function(v157) --[[ Line: 745 ]]
        -- upvalues: v148 (copy), v156 (copy), l_universeId_1 (copy), l_textSizeOffset_0 (copy), v4 (ref), v19 (ref), l_rootPlaceId_0 (copy), v42 (ref), l_leftPadding_3 (copy), l_rightPadding_3 (copy), l_FFlagEnableBlackbirdPageCloseCallback_0 (ref), l_showSocial_0 (copy), l_LayoutOrder_0 (copy)
        local l_Color_0 = v157.Theme.Divider.Color;
        local l_Transparency_0 = v157.Theme.Divider.Transparency;
        local v160 = 0;
        local v161 = #v148.gameInfoListData;
        for v162, v163 in ipairs(v148.gameInfoListData) do
            local l_renderFunction_0 = v163.renderFunction;
            v160 = v160 + 1;
            if l_renderFunction_0 then
                v156["GameInfoRow" .. v162] = l_renderFunction_0(l_universeId_1, v160, v163.itemInfo, l_textSizeOffset_0);
            else
                v156["GameInfoRow" .. v162] = v4.createElement(v19, {
                    Size = UDim2.new(1, 0, 0, 57), 
                    useVerifiedBadgeEmojiWrapper = v163.useVerifiedBadgeEmojiWrapper, 
                    LayoutOrder = v160, 
                    placeId = l_rootPlaceId_0, 
                    infoName = v163.infoName, 
                    infoData = v163.infoData, 
                    infoIcon = v163.infoIcon, 
                    linkPage = v163.linkPage, 
                    linkView = v163.linkView, 
                    linkViewData = if v42.FFlagIsSetupEnabled then v163.linkViewData else nil, 
                    linkUrl = v163.linkUrl, 
                    linkClickCallback = v163.linkClickCallback, 
                    universeId = l_universeId_1, 
                    leftPadding = l_leftPadding_3, 
                    rightPadding = l_rightPadding_3, 
                    topPadding = 10, 
                    bottomPadding = 10, 
                    analyticsSubPage = v163.analyticsSubPage, 
                    disableInfoNameLocalization = v163.disableInfoNameLocalization, 
                    testId = v163.testId, 
                    onClose = if l_FFlagEnableBlackbirdPageCloseCallback_0 then v163.onClose else nil
                });
            end;
            v160 = v160 + 1;
            v156["Divider" .. v162] = v4.createElement("Frame", {
                Size = UDim2.new(1, -l_leftPadding_3, 0, 1), 
                BackgroundColor3 = l_Color_0, 
                BackgroundTransparency = l_Transparency_0, 
                BorderSizePixel = 0, 
                LayoutOrder = v160
            });
        end;
        local l_communityLinksEnabled_1 = v148.props.communityLinksEnabled;
        local l_communityLinkVariant_1 = v148.props.communityLinkVariant;
        if l_communityLinksEnabled_1 and l_communityLinkVariant_1 == "banner" then
            local v167 = v148.props.communityLink and v148:createCommunityRow(v160 + 1) or nil;
            if v167 ~= nil then
                v161 = v161 + 1;
                v160 = v160 + 1;
                v156["GameInfoRow" .. v161] = v167;
            end;
        end;
        local v168 = v160 + 1;
        local v169 = l_showSocial_0 and v148:createSocialMediaRow(l_universeId_1, v168) or nil;
        if v169 ~= nil then
            v156["GameInfoRow" .. v161 + 1] = v169;
        end;
        return v4.createElement("Frame", {
            Size = UDim2.new(1, l_leftPadding_3 + l_rightPadding_3, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = l_LayoutOrder_0, 
            ClipsDescendants = false
        }, v156);
    end);
end;
v64.didMount = function(v170) --[[ Line: 823 ]] --[[ Name: didMount ]]
    v170.checkCommunityLinkExposureLogging();
end;
v64.didUpdate = function(v171, v172, _) --[[ Line: 827 ]] --[[ Name: didUpdate ]]
    -- upvalues: v15 (copy)
    local l_topPage_0 = v171.props.topPage;
    local l_topPage_1 = v172.topPage;
    if l_topPage_0.name ~= l_topPage_1.name and l_topPage_1.name == v15.GenericWebPage and (if l_topPage_1.extraProps then l_topPage_1.extraProps.passOwned else nil) == false then
        v171.props.fetchGamePasses(v171.props.networking, v171.props.universeId);
    end;
    if not v172.communityLink then
        v171.checkCommunityLinkExposureLogging();
    end;
end;
local v180 = v7(function(v176) --[[ Line: 844 ]]
    local v177 = {};
    if not v176 then
        return v177;
    else
        for _, v179 in ipairs(v176) do
            if v179.price ~= nil then
                table.insert(v177, v179);
            end;
        end;
        return v177;
    end;
end);
local function _(v181) --[[ Line: 860 ]] --[[ Name: getTopPageInfo ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    local v182 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectLegacyHistory(v181) else v181.Navigation.history;
    local v183 = v182[#v182];
    return v183[#v183];
end;
v64 = v6.connect(function(v185, v186) --[[ Line: 869 ]]
    -- upvalues: v180 (copy), v34 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (copy), l_FFlagLuaAppUseExperienceLogoTrayInGameInfoList_0 (copy), l_FFlagLuaAppHideEdpStoreForUnplayable_0 (copy)
    local v187 = v185.GamePasses and v180(v185.GamePasses[v186.universeId]);
    local v188 = v185.GameSubscriptionProducts[v186.universeId];
    local v189 = v185.GameDeveloperProducts[v186.universeId];
    local v190 = v185.GameBadges[v186.universeId];
    local v191 = true;
    local v192 = v188 and #v188 > 0;
    local v193 = v189 and #v189 > 0;
    local v194 = true;
    local v195 = v185.GameSocialLinks[v186.universeId];
    local v196 = v195 and v195.groupLink;
    local v197 = false;
    local v198 = v34.isCreatorOfGameVerified(v185, if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v186.shouldHydrateLegacyIxp then {
        universeId = v186.universeId, 
        shouldUseV2GameDetails = true
    } else v186);
    local v199 = v185.CommunityLinks.ExperienceCommunityLinks[v186.universeId] or nil;
    if v187 and #v187 == 0 then
        v191 = false;
    end;
    if v190 and #v190 == 0 then
        v194 = false;
    end;
    local v200 = v185.VoiceChatOptInStatus.isUserOptIn or false;
    local v201 = false;
    if v185.ShowAgeVerificationOverlay[v186.universeId] ~= nil then
        v197 = v185.ShowAgeVerificationOverlay[v186.universeId].isUniverseEnabledForVoice or false;
        v201 = v185.ShowAgeVerificationOverlay[v186.universeId].isUniverseEnabledForAvatarVideo or false;
    end;
    local v202 = {
        gameDetail = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v186.shouldHydrateLegacyIxp then v185.GameDetailsV2[v186.universeId] else v185.GameDetails[v186.universeId], 
        creatorVerified = v198, 
        showPasses = v191, 
        passes = v187, 
        showSubscriptionProducts = v192, 
        showDeveloperProducts = v193, 
        showBadges = v194, 
        groupLink = v196, 
        communityLink = v199, 
        userVoiceEnabled = v200, 
        experienceVoiceEnabled = v197, 
        experienceVideoEnabled = v201, 
        isLocalUserUnder13 = v185.IsLocalUserUnder13
    };
    local v203 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectLegacyHistory(v185) else v185.Navigation.history;
    local v204 = v203[#v203];
    v202.topPage = v204[#v204];
    v202.ageRecommendationHeader = v185.AgeRecommendationHeaders.headerDisplayName;
    v202.socialLinks = if not not l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 or l_FFlagLuaAppUseExperienceLogoTrayInGameInfoList_0 then v195 else nil;
    v202.isPlayable = if l_FFlagLuaAppHideEdpStoreForUnplayable_0 then v185.PlayabilityStatus and v185.PlayabilityStatus[v186.universeId] and v185.PlayabilityStatus[v186.universeId].isPlayable else nil;
    return v202;
end, function(v205) --[[ Line: 939 ]]
    -- upvalues: v16 (copy), l_FFlagLuaAppUseExperienceLogoTrayInGameInfoList_0 (copy), v17 (copy), v18 (copy)
    return {
        fetchGamePasses = function(v206, v207) --[[ Line: 941 ]] --[[ Name: fetchGamePasses ]]
            -- upvalues: v205 (copy), v16 (ref)
            return v205(v16(v206, v207));
        end, 
        openLeaveRobloxAlertUIBlox = l_FFlagLuaAppUseExperienceLogoTrayInGameInfoList_0 and function(v208) --[[ Line: 945 ]]
            -- upvalues: v205 (copy), v17 (ref)
            v205(v17(v208));
        end or nil, 
        closeAlert = l_FFlagLuaAppUseExperienceLogoTrayInGameInfoList_0 and function() --[[ Line: 950 ]]
            -- upvalues: v205 (copy), v18 (ref)
            v205(v18());
        end or nil
    };
end)(v64);
v64 = v28.connectUserLayer({
    l_AppUserLayers_0.EDPCommunityLinksLayer, 
    v42.EnableCommunityProfilePageExperimentLayer
}, function(v209) --[[ Line: 960 ]]
    -- upvalues: l_AppUserLayers_0 (copy), v42 (copy)
    local v210 = (v209[l_AppUserLayers_0.EDPCommunityLinksLayer] or {}).communityLinkDisplayConfig or {};
    local v211 = if v42.FFlagIsSetupEnabled then v42.isFeatureActive(v209) else nil;
    return {
        communityLinksEnabled = v210.inTreatment, 
        communityLinkVariant = v210.linkVariant, 
        communityProfilePageEnabled = if v42.FFlagIsSetupEnabled then v211 else nil
    };
end, false)(v64);
v64 = l_RoactAppPolicy_0.connect(function(v212, _) --[[ Line: 976 ]]
    return {
        enableGroupLinks = v212.getSocialGroupLinks(), 
        showBadgesRow = v212.getGameInfoShowBadges(), 
        showCreatedRow = v212.getGameInfoShowCreated(), 
        showDeveloperRow = v212.getGameInfoListDeveloper(), 
        showRNVDeveloper = v212.getGameInfoListShowRNVDeveloper(), 
        showGamepassesRow = v212.getGameInfoShowGamepasses(), 
        showGenreRow = v212.getGameInfoShowGenre(), 
        showSubgenreRow = v212.getGameInfoShowSubgenre(), 
        showMaxPlayersRow = v212.getGameInfoShowMaxPlayers(), 
        showServersRow = v212.getGameInfoShowServers(), 
        showUpdatedRow = v212.getGameInfoShowUpdated()
    };
end)(v64);
v64 = l_RoactServices_0.connect({
    localization = v5, 
    networking = v9, 
    eventIngest = v10, 
    linking = if l_FFlagLuaAppUseExperienceLogoTrayInGameInfoList_0 then l_AppLinking_0 else nil
})(v64);
return function(v214) --[[ Line: 998 ]]
    -- upvalues: l_useTextSizeOffset_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v56 (copy), v11 (copy), v38 (copy), v4 (copy), v64 (ref)
    local v215 = l_useTextSizeOffset_0();
    local v216 = nil;
    if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
        v216 = v56();
    end;
    local v217 = v11.Dictionary.join(v214, {
        textSizeOffset = v215, 
        edpServerIxpVariables = if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v38.getShouldInterleaveSdui() then v216 else nil
    });
    return v4.createElement(v64, v217);
end;