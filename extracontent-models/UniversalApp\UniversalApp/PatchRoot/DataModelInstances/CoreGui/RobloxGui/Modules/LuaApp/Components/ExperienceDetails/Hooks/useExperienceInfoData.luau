local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v4 = require(l_CorePackages_0.Workspace.Packages.Localization);
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_navigateToBadgesSeeAll_0 = require(l_CorePackages_0.Workspace.Packages.Badges).navigateToBadgesSeeAll;
local l_useUserExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useUserExperiment;
local v12 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_getCommunityUrl_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Utils.getCommunityUrl;
local l_ApiFetchGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local l_abbreviateCount_0 = require(l_CorePackages_0.Workspace.Packages.Localization).abbreviateCount;
local l_clickCommunityLinkEvent_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Analytics.Events.clickCommunityLinkEvent;
local l_EnableCommunityProfilePageIXP_0 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform).EnableCommunityProfilePageIXP;
local v18 = require(script.Parent.useEdpServerIxpVariables);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v20 = require(l_Modules_0.LuaApp.AppPage);
local v21 = require(l_Modules_0.LuaApp.Common.safeGet);
local v22 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v23 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v24 = require(l_Modules_0.LuaApp.Hooks.useLocalTime);
local v25 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v26 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v27 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v28 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v29 = require(l_Modules_0.LuaApp.Thunks.Games.FetchGameDetailsPageData);
local _ = require(l_Modules_0.LuaApp.Models.GamesApi.GameSocialLink);
local v31 = require(script.Parent.Parent.useExperienceDetailsNavigation);
local v32 = require(script.Parent.Parent.Parent.ExperienceDetails.ExperienceDetailsExperimentation);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_GuildedLogoWhiteAsset_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Constants.GuildedLogoWhiteAsset;
local v35 = require(l_Modules_0.LuaApp.Thunks.ApiFetchExperienceDetailsPage);
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Analytics.Constants;
local v37 = require(l_Modules_0.LuaApp.Flags.GetFFlagRemoveVerifiedBadgeReducer);
local v38 = require(l_Modules_0.LuaApp.Flags.GetFFlagGameDetailsSeparateChatFeatureRows);
local v39 = require(l_Modules_0.Personalization.Flags.FStringLuaAppGenreOverride);
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp;
local l_FFlagHideCloseButtonEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagHideCloseButtonEdp;
local l_FFlagLuaAppUpdateContentDescriptorsTranslation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppUpdateContentDescriptorsTranslation;
local l_FFlagLuaAppBadgesSeeAllEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppBadgesSeeAllEnabled;
local v47 = game:DefineFastFlag("LuaAppHideBadgesRowFix", false);
local l_FFlagLuaAppHideEdpStoreForUnplayable_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppHideEdpStoreForUnplayable;
return function(v49, v50, v51) --[[ Line: 96 ]]
    -- upvalues: l_FFlagLuaAppBadgesSeeAllEnabled_0 (copy), l_useNavigation_0 (copy), l_useSelector_0 (copy), v21 (copy), v37 (copy), v12 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v35 (copy), l_ApiFetchGameDetails_0 (copy), l_FFlagLuaAppHideEdpStoreForUnplayable_0 (copy), l_useDispatch_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v18 (copy), v31 (copy), l_EnableCommunityProfilePageIXP_0 (copy), v1 (copy), l_FFlagHideCloseButtonEdp_0 (copy), v25 (copy), v26 (copy), v29 (copy), v27 (copy), v23 (copy), l_useLocalization_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_GuildedLogoWhiteAsset_0 (copy), l_getCommunityUrl_0 (copy), l_clickCommunityLinkEvent_0 (copy), l_Constants_0 (copy), v20 (copy), v22 (copy), v39 (copy), v24 (copy), v38 (copy), l_navigateToBadgesSeeAll_0 (copy), v47 (copy), v28 (copy), v32 (copy), l_abbreviateCount_0 (copy), l_FFlagLuaAppUpdateContentDescriptorsTranslation_0 (copy), l_RetrievalStatus_0 (copy), v2 (copy)
    local v52 = if l_FFlagLuaAppBadgesSeeAllEnabled_0 then l_useNavigation_0() else nil;
    local v63 = l_useSelector_0(function(v53) --[[ Line: 98 ]]
        -- upvalues: v49 (copy), v21 (ref), v37 (ref), v12 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v50 (copy), v35 (ref), l_ApiFetchGameDetails_0 (ref), l_FFlagLuaAppHideEdpStoreForUnplayable_0 (ref)
        local v54 = v53.GamePasses[v49];
        local v55 = v53.GameBadges[v49];
        local v56 = v53.VoiceChatOptInStatus.isUserOptIn or false;
        local v57 = false;
        local v58 = false;
        if v53.ShowAgeVerificationOverlay[v49] then
            v57 = v53.ShowAgeVerificationOverlay[v49].isUniverseEnabledForVoice;
            v58 = v53.ShowAgeVerificationOverlay[v49].isUniverseEnabledForAvatarVideo;
        end;
        local v59 = v21(v53.GameSocialLinks, v49, "groupLink");
        local v60 = if v37() then nil else v12.isCreatorOfGameVerified(v53, {
            universeId = v49, 
            shouldUseV2GameDetails = not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v50 and true or nil
        });
        local v61 = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v50 then v35.GetFetchingStatus(v53, v49) else l_ApiFetchGameDetails_0.GetFetchingStatus(v53, v49);
        local v62 = v53.CommunityLinks.ExperienceCommunityLinks[v49] or nil;
        return {
            dataStatus = v61, 
            gameDetail = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v50 then v53.GameDetailsV2[v49] or {} else v53.GameDetails[v49] or {}, 
            creatorVerified = v60, 
            showPasses = not v54 or #v54 > 0, 
            showBadges = not v55 or #v55 > 0, 
            userVoiceEnabled = v56, 
            experienceVoiceEnabled = v57, 
            experienceVideoEnabled = v58, 
            groupLink = v59, 
            communityLink = v62, 
            isLocalUserUnder13 = v53.IsLocalUserUnder13, 
            ageRecommendations = v53.AgeRecommendations[v49], 
            ageRecommendationHeader = v53.AgeRecommendationHeaders.headerDisplayName, 
            isPlayable = if l_FFlagLuaAppHideEdpStoreForUnplayable_0 then v53.PlayabilityStatus and v53.PlayabilityStatus[v49] and v53.PlayabilityStatus[v49].isPlayable else nil
        };
    end);
    local v64 = l_useDispatch_0();
    local v65 = nil;
    if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
        v65 = v18();
    end;
    local v66 = v31(if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v50 else nil);
    local v67 = if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled then l_EnableCommunityProfilePageIXP_0.useIsFeatureActive({
        isExposureEnabled = false
    }) else nil;
    local v68 = v1.useCallback(function() --[[ Line: 168 ]]
        -- upvalues: v66 (copy), v49 (copy), l_FFlagHideCloseButtonEdp_0 (ref), v51 (copy)
        v66.openExperienceGuidelinesExplained(v49, if l_FFlagHideCloseButtonEdp_0 then v51 else false);
    end, {
        v64, 
        v49, 
        v66
    });
    local v69 = v25(v26);
    local v70 = v1.useCallback(function() --[[ Line: 178 ]]
        -- upvalues: v64 (copy), v29 (ref), v69 (copy), v49 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v50 (copy)
        v64(v29(v69, v49, nil, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v50 else nil));
    end, {
        v64, 
        v69, 
        v49, 
        if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v50 else nil
    });
    local v71 = v25(v27);
    local v73 = v23(function(v72) --[[ Line: 198 ]]
        return {
            showBadgesRow = v72.getGameInfoShowBadges(), 
            showCreatedRow = v72.getGameInfoShowCreated(), 
            showDeveloperRow = v72.getGameInfoListDeveloper(), 
            showRNVDeveloper = v72.getGameInfoListShowRNVDeveloper(), 
            showGamepassesRow = v72.getGameInfoShowGamepasses(), 
            showGenreRow = v72.getGameInfoShowGenre(), 
            showSubgenreRow = v72.getGameInfoShowSubgenre(), 
            showMaxPlayersRow = v72.getGameInfoShowMaxPlayers(), 
            showServersRow = v72.getGameInfoShowServers(), 
            showUpdatedRow = v72.getGameInfoShowUpdated(), 
            enableGroupLinks = v72.getSocialGroupLinks(), 
            webViewSupport = v72.getWebViewSupport(), 
            showAgeRecommendationRow = v72.getGameInfoShowAgeRecommendation()
        };
    end);
    local v74 = l_useLocalization_0({
        yes = "Feature.GameDetails.Label.Yes", 
        no = "Feature.GameDetails.Label.No", 
        none = "Feature.GameDetails.Label.None", 
        unavailable = "Feature.GameDetails.Label.Unavailable", 
        contentMaturity = "Feature.GameDetails.Label.ContentMaturity", 
        developer = "Feature.GameDetails.Label.Developer", 
        maxPlayers = "Feature.GameDetails.Label.MaxPlayers", 
        genre = "Feature.GameDetails.Label.Genre", 
        created = "Feature.GameDetails.Label.Created", 
        updated = "Feature.GameDetails.Label.Updated", 
        voiceEnabled = "Feature.GameDetails.Label.VoiceEnabled", 
        microphone = "Feature.GameDetails.Label.Microphone", 
        camera = "Feature.GameDetails.Label.Camera", 
        voiceChat = "Feature.GameDetails.Label.VoiceChat", 
        supported = "Feature.GameDetails.Label.Supported", 
        notSupported = "Feature.GameDetails.Label.NotSupported", 
        chatFeatures = "Feature.GameDetails.Label.ChatFeatures", 
        communication = "Feature.AccountSettings.Heading.Communication", 
        passesAndGear = "Feature.GameDetails.Label.Store", 
        badges = "CommonUI.Features.Label.Badges", 
        servers = "Feature.GameDetails.Label.Servers", 
        group = "Feature.GameDetails.Label.Group", 
        community = "Feature.GameDetails.Label.Community", 
        subgenre = "Feature.GameDetails.Label.Subgenre", 
        age = "Feature.GameDetails.Label.Age", 
        visits = (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0) and "Feature.GameDetails.Label.Visits" or nil, 
        strongLanguage = (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0) and "Feature.AgeGuidelines.DisplayName.StrongLanguage" or nil, 
        creatorEnabled = (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0) and "Feature.AgeGuidelines.Label.CreatorEnabled" or nil
    });
    local v75 = l_useLocalization_0({
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
    });
    local v77 = l_useUserExperiment_0({
        l_AppUserLayers_0.EDPCommunityLinksLayer
    }, function(v76) --[[ Line: 275 ]]
        -- upvalues: l_AppUserLayers_0 (ref)
        return (v76[l_AppUserLayers_0.EDPCommunityLinksLayer] or {}).communityLinkDisplayConfig or {};
    end, false);
    local v80 = v1.useMemo(function() --[[ Line: 283 ]]
        -- upvalues: v77 (copy), v63 (copy), v74 (copy), l_GuildedLogoWhiteAsset_0 (ref), l_getCommunityUrl_0 (ref), l_clickCommunityLinkEvent_0 (ref), v71 (copy), l_Constants_0 (ref), v49 (copy)
        local l_inTreatment_0 = v77.inTreatment;
        local l_linkVariant_0 = v77.linkVariant;
        if l_inTreatment_0 and v63.communityLink and l_linkVariant_0 == "infolist" then
            return {
                infoName = v74.community, 
                infoIcon = l_GuildedLogoWhiteAsset_0, 
                linkUrl = l_getCommunityUrl_0(v63.communityLink.communityId), 
                linkClickCallback = function() --[[ Line: 292 ]] --[[ Name: linkClickCallback ]]
                    -- upvalues: l_clickCommunityLinkEvent_0 (ref), v71 (ref), l_Constants_0 (ref), v63 (ref), v49 (ref)
                    l_clickCommunityLinkEvent_0(v71, l_Constants_0.Context.ExperienceInfoList, {
                        guildedServerId = v63.communityLink.communityId, 
                        entityType = "universe", 
                        entityId = v49
                    });
                end, 
                testId = "--community-row-tail"
            };
        else
            return;
        end;
    end, {
        v74.community, 
        v63.communityLink
    });
    local v82 = v1.useMemo(function() --[[ Line: 316 ]]
        -- upvalues: v73 (copy), v21 (ref), v63 (copy), v74 (copy), v68 (copy), v20 (ref)
        if v73.showAgeRecommendationRow then
            local v81 = v21(v63.ageRecommendations, "summary", "ageRecommendation", "displayName");
            return {
                infoName = if v63.ageRecommendationHeader then v63.ageRecommendationHeader else v74.contentMaturity, 
                infoData = v81 or v74.unavailable, 
                navigateOverride = if v81 then v68 else nil, 
                analyticsSubPage = if v81 then v20.ExperienceGuidelinesExplained else nil, 
                testId = "--content-maturity-row-tail"
            };
        else
            return;
        end;
    end, {
        v73.showAgeRecommendationRow, 
        v74.contentMaturity, 
        v74.unavailable, 
        v63.ageRecommendations, 
        v63.ageRecommendationHeader, 
        v68
    });
    local v84 = v1.useMemo(function() --[[ Line: 342 ]]
        -- upvalues: v73 (copy), v21 (ref), v63 (copy), v74 (copy)
        if v73.showAgeRecommendationRow then
            local v83 = v21(v63.ageRecommendations, "summary", "ageRecommendation", "minimumAgeDisplay");
            if v83 and v83 ~= "" then
                return {
                    infoName = v74.age, 
                    infoData = v83, 
                    testId = "--age-row-tail"
                };
            end;
        end;
    end, {
        v73.showAgeRecommendationRow, 
        v74.age, 
        v63.ageRecommendations
    });
    local v93 = v1.useMemo(function() --[[ Line: 364 ]]
        -- upvalues: v63 (copy), v73 (copy), v37 (ref), l_EnableCommunityProfilePageIXP_0 (ref), v67 (copy), v74 (copy), v49 (copy), v66 (copy), v22 (ref)
        local l_creator_0 = v63.gameDetail.creator;
        if l_creator_0 and (v73.showDeveloperRow or v73.showRNVDeveloper and l_creator_0.isRNVAccount) then
            local l_id_0 = l_creator_0.id;
            local l_name_0 = l_creator_0.name;
            local l_type_0 = l_creator_0.type;
            local v89 = if v37() then l_creator_0.hasVerifiedBadge or false else v63.creatorVerified or false;
            if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled and v67 and l_type_0 == Enum.CreatorType.Group.Name then
                return {
                    infoName = v74.developer, 
                    infoData = l_name_0, 
                    infoDataOverride = function(v90) --[[ Line: 381 ]] --[[ Name: infoDataOverride ]]
                        -- upvalues: l_name_0 (copy), l_id_0 (copy), v49 (ref), v89 (copy)
                        return v90(l_name_0, l_id_0, v49, v89);
                    end, 
                    navigateOverride = function() --[[ Line: 384 ]] --[[ Name: navigateOverride ]]
                        -- upvalues: v66 (ref), l_id_0 (copy)
                        v66.openCommunityProfilePage(l_id_0, "ExperienceDetailsPage:Developer");
                    end, 
                    analyticsSubPage = "Developer", 
                    testId = "--developer-row-tail"
                };
            elseif l_type_0 == Enum.CreatorType.User.Name then
                return {
                    infoName = v74.developer, 
                    infoData = l_name_0, 
                    infoDataOverride = function(v91) --[[ Line: 398 ]] --[[ Name: infoDataOverride ]]
                        -- upvalues: l_name_0 (copy), l_id_0 (copy), v49 (ref), v89 (copy)
                        return v91(l_name_0, l_id_0, v49, v89);
                    end, 
                    navigateOverride = function() --[[ Line: 401 ]] --[[ Name: navigateOverride ]]
                        -- upvalues: v66 (ref), l_id_0 (copy)
                        v66.openUserProfilePage(l_id_0, "ExperienceDetailsPage:Developer");
                    end, 
                    analyticsSubPage = "Developer", 
                    testId = "--developer-row-tail"
                };
            else
                return {
                    infoName = v74.developer, 
                    infoData = l_name_0, 
                    infoDataOverride = function(v92) --[[ Line: 414 ]] --[[ Name: infoDataOverride ]]
                        -- upvalues: l_name_0 (copy), l_id_0 (copy), v49 (ref), v89 (copy)
                        return v92(l_name_0, l_id_0, v49, v89);
                    end, 
                    linkPage = if v73.webViewSupport then v22.game.info.creator({
                        creatorType = l_type_0, 
                        creatorId = l_id_0
                    }) else nil, 
                    analyticsSubPage = "Developer", 
                    testId = "--developer-row-tail"
                };
            end;
        else
            return;
        end;
    end, {
        v74.developer, 
        v73.showDeveloperRow, 
        v73.showRNVDeveloper, 
        v73.webViewSupport, 
        v49, 
        v63.gameDetail, 
        v63.creatorVerified, 
        if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled then v67 else nil
    });
    local v94 = v1.useMemo(function() --[[ Line: 444 ]]
        -- upvalues: v73 (copy), v74 (copy), v63 (copy)
        if v73.showMaxPlayersRow then
            return {
                infoName = v74.maxPlayers, 
                infoData = tostring(v63.gameDetail.maxPlayers or "--"), 
                testId = "--server-size-row-tail"
            };
        else
            return;
        end;
    end, {
        v73.showMaxPlayersRow, 
        v63.gameDetail
    });
    local v97 = v1.useMemo(function() --[[ Line: 461 ]]
        -- upvalues: v63 (copy), v39 (ref), v74 (copy), v75 (copy), v73 (copy)
        local v95 = nil;
        if v63.gameDetail.genre_l1 and v63.gameDetail.genre_l1 ~= "" then
            v95 = v63.gameDetail.genre_l1;
        elseif v39 == "N/A" then
            v95 = v74.unavailable;
        elseif v39 == "All" then
            v95 = v75.All;
        end;
        if v73.showGenreRow then
            local v96 = if v95 then v95 else if v63.gameDetail.genre then v75[v63.gameDetail.genre] else nil;
            return {
                infoName = v74.genre, 
                infoData = v96 or "--", 
                testId = "--genre-row-tail"
            };
        else
            return;
        end;
    end, {
        v73.showGenreRow, 
        v63.gameDetail
    });
    local v98 = v1.useMemo(function() --[[ Line: 490 ]]
        -- upvalues: v73 (copy), v63 (copy), v74 (copy)
        if v73.showSubgenreRow and v63.gameDetail.genre_l2 and v63.gameDetail.genre_l2 ~= "" then
            return {
                infoName = v74.subgenre, 
                infoData = v63.gameDetail.genre_l2, 
                testId = "--subgenre-row-tail"
            };
        else
            return;
        end;
    end, {
        v73.showSubgenreRow, 
        v63.gameDetail
    });
    local v99 = v24(v63.gameDetail.created);
    local v100 = v1.useMemo(function() --[[ Line: 509 ]]
        -- upvalues: v73 (copy), v74 (copy), v99 (copy)
        if v73.showCreatedRow then
            return {
                infoName = v74.created, 
                infoData = v99 or "--", 
                testId = "--created-row-tail"
            };
        else
            return;
        end;
    end, {
        v73.showCreatedRow, 
        v99
    });
    local v101 = v24(v63.gameDetail.updated);
    local v102 = v1.useMemo(function() --[[ Line: 527 ]]
        -- upvalues: v73 (copy), v74 (copy), v101 (copy)
        if v73.showUpdatedRow then
            return {
                infoName = v74.updated, 
                infoData = v101 or "--", 
                testId = "--updated-row-tail"
            };
        else
            return;
        end;
    end, {
        v73.showUpdatedRow, 
        v101
    });
    local v103 = nil;
    local v104 = nil;
    local v105 = nil;
    if v38() then
        v104 = v1.useMemo(function() --[[ Line: 548 ]]
            -- upvalues: v74 (copy), v63 (copy)
            local l_notSupported_0 = v74.notSupported;
            if v63.isLocalUserUnder13 then
                return nil;
            else
                if v63.experienceVoiceEnabled then
                    l_notSupported_0 = v74.supported;
                end;
                return {
                    infoName = v74.voiceChat, 
                    infoData = l_notSupported_0, 
                    testId = "--voice-chat-row-tail"
                };
            end;
        end, {
            v63.experienceVoiceEnabled, 
            v63.isLocalUserUnder13
        });
        v105 = v1.useMemo(function() --[[ Line: 571 ]]
            -- upvalues: v74 (copy), v63 (copy)
            local l_notSupported_1 = v74.notSupported;
            if v63.experienceVideoEnabled then
                l_notSupported_1 = v74.supported;
            end;
            return {
                infoName = v74.camera, 
                infoData = l_notSupported_1, 
                testId = "--camera-row-tail"
            };
        end, {
            v63.experienceVideoEnabled
        });
    else
        v103 = v1.useMemo(function() --[[ Line: 590 ]]
            -- upvalues: v63 (copy), v74 (copy)
            local v108 = {};
            if v63.experienceVoiceEnabled and not v63.isLocalUserUnder13 then
                table.insert(v108, v74.microphone);
            end;
            if v63.experienceVideoEnabled then
                table.insert(v108, v74.camera);
            end;
            if #v108 < 1 then
                table.insert(v108, v74.none);
            end;
            return {
                infoName = v74.communication, 
                infoData = table.concat(v108, ", "), 
                testId = "--communication-row-tail"
            };
        end, {
            v63.experienceVoiceEnabled, 
            v63.experienceVideoEnabled, 
            v63.isLocalUserUnder13
        });
    end;
    local v109 = v1.useMemo(function() --[[ Line: 617 ]]
        -- upvalues: v73 (copy), v63 (copy), l_FFlagLuaAppHideEdpStoreForUnplayable_0 (ref), v74 (copy), v22 (ref), v49 (copy)
        if v73.webViewSupport and v73.showGamepassesRow and v63.showPasses and (not l_FFlagLuaAppHideEdpStoreForUnplayable_0 or v63.isPlayable) then
            return {
                infoName = v74.passesAndGear, 
                linkPage = v22.game.info.store({
                    universeId = v49
                }), 
                analyticsSubPage = "PassesAndGear", 
                testId = "--store-row-tail"
            };
        else
            return;
        end;
    end, {
        v49, 
        v73.webViewSupport, 
        v73.showGamepassesRow, 
        v63.showPasses, 
        if l_FFlagLuaAppHideEdpStoreForUnplayable_0 then v63.isPlayable else nil
    });
    local v110 = v1.useMemo(function() --[[ Line: 645 ]]
        -- upvalues: l_FFlagLuaAppBadgesSeeAllEnabled_0 (ref), v73 (copy), v63 (copy), v74 (copy), l_navigateToBadgesSeeAll_0 (ref), v52 (copy), v49 (copy), v22 (ref)
        if l_FFlagLuaAppBadgesSeeAllEnabled_0 and v73.showBadgesRow and v63.showBadges then
            return {
                infoName = v74.badges, 
                navigateOverride = function() --[[ Line: 649 ]] --[[ Name: navigateOverride ]]
                    -- upvalues: l_navigateToBadgesSeeAll_0 (ref), v52 (ref), v49 (ref)
                    l_navigateToBadgesSeeAll_0(v52, v49);
                end, 
                analyticsSubPage = "Badges", 
                testId = "--badges-row-tail"
            };
        elseif v73.webViewSupport and v73.showBadgesRow and v63.showBadges then
            return {
                infoName = v74.badges, 
                linkPage = v22.game.info.badges({
                    universeId = v49
                }), 
                analyticsSubPage = "Badges", 
                testId = "--badges-row-tail"
            };
        else
            return;
        end;
    end, {
        v49, 
        v73.webViewSupport, 
        v73.showBadgesRow, 
        v63.showPasses, 
        v52, 
        if v47 then v63.showBadges else nil
    });
    local v111 = v1.useMemo(function() --[[ Line: 678 ]]
        -- upvalues: v73 (copy), v74 (copy), v22 (ref), v49 (copy)
        if v73.webViewSupport and v73.showServersRow then
            return {
                infoName = v74.servers, 
                linkPage = v22.game.info.servers({
                    universeId = v49
                }), 
                analyticsSubPage = "Servers", 
                testId = "--servers-row-tail"
            };
        else
            return;
        end;
    end, {
        v49, 
        v73.webViewSupport, 
        v73.showServersRow
    });
    local v112 = v1.useMemo(function() --[[ Line: 699 ]]
        -- upvalues: l_EnableCommunityProfilePageIXP_0 (ref), v67 (copy), v73 (copy), v63 (copy), v74 (copy), v66 (copy)
        if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled and v67 then
            if v73.enableGroupLinks and v63.groupLink then
                if v63.groupLink.communityId ~= nil then
                    return {
                        infoName = v74.group, 
                        navigateOverride = function() --[[ Line: 705 ]] --[[ Name: navigateOverride ]]
                            -- upvalues: v66 (ref), v63 (ref)
                            v66.openCommunityProfilePage(v63.groupLink.communityId, "ExperienceDetailsPage:Group");
                        end, 
                        analyticsSubPage = "Group", 
                        testId = "--group-row-tail"
                    };
                elseif v73.webViewSupport then
                    return {
                        infoName = v74.group, 
                        linkPage = v63.groupLink.url, 
                        analyticsSubPage = "Group", 
                        testId = "--group-row-tail"
                    };
                end;
            end;
        elseif v73.webViewSupport and v73.enableGroupLinks and v63.groupLink then
            return {
                infoName = v74.group, 
                linkPage = v63.groupLink.url, 
                analyticsSubPage = "Group", 
                testId = "--group-row-tail"
            };
        end;
    end, {
        v49, 
        v73.webViewSupport, 
        v73.enableGroupLinks, 
        v63.groupLink, 
        if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled then v67 else nil
    });
    local v113 = nil;
    local v114 = nil;
    if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
        local l_Locale_0 = v25(v28):GetLocale();
        v114 = v1.useMemo(function() --[[ Line: 751 ]]
            -- upvalues: l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v32 (ref), v65 (ref), v63 (copy), l_abbreviateCount_0 (ref), l_Locale_0 (copy), v74 (copy)
            if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v32.getShouldInterleaveSdui()) and v65 and v65.showVisitsInInfoList == true then
                local l_gameDetail_0 = v63.gameDetail;
                local v117 = l_gameDetail_0 and l_gameDetail_0.visits or 0;
                local v118 = l_abbreviateCount_0(v117, l_Locale_0) or "--";
                return {
                    infoName = v74.visits, 
                    infoData = v118, 
                    testId = "--visits-row-tail"
                };
            else
                return;
            end;
        end, {
            v65, 
            v63.gameDetail, 
            v74.visits, 
            l_Locale_0
        });
        v113 = v1.useMemo(function() --[[ Line: 783 ]]
            -- upvalues: l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v32 (ref), v65 (ref), v63 (copy), l_FFlagLuaAppUpdateContentDescriptorsTranslation_0 (ref), v74 (copy)
            if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v32.getShouldInterleaveSdui()) and v65 and v65.showContentDescriptorsInInfoList == true and v63.ageRecommendations then
                local l_descriptorUsages_0 = v63.ageRecommendations.descriptorUsages;
                if l_descriptorUsages_0 and #l_descriptorUsages_0 > 0 then
                    for _, v121 in ipairs(l_descriptorUsages_0) do
                        if v121.name == "strong-language" and v121.contains then
                            return {
                                infoName = if l_FFlagLuaAppUpdateContentDescriptorsTranslation_0 then v74.creatorEnabled else v74.communication, 
                                infoData = v74.strongLanguage, 
                                testId = "--content-descriptors-row-tail"
                            };
                        end;
                    end;
                end;
            end;
        end, {
            v65, 
            v63.ageRecommendations, 
            v74.contentDescriptors, 
            v74.containsStrongLanguage
        });
    end;
    v1.useEffect(function() --[[ Line: 823 ]]
        -- upvalues: v63 (copy), l_RetrievalStatus_0 (ref), v70 (copy)
        if v63.dataStatus == l_RetrievalStatus_0.NotStarted then
            v70();
        end;
    end);
    return {
        rootPlaceId = tostring(v63.gameDetail.rootPlaceId), 
        rows = v2.append({
            v80
        }, if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v32.getShouldInterleaveSdui()) and v65 and v65.showVisitsInInfoList == true and v114 then {
            v114
        } else nil, {
            v82
        }, {
            v84
        }, if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v32.getShouldInterleaveSdui()) and v65 and v65.showContentDescriptorsInInfoList == true and v113 then {
            v113
        } else nil, {
            v93
        }, {
            v94
        }, {
            v97
        }, {
            v98
        }, {
            v100
        }, {
            v102
        }, if not v38() then {
            v103
        } else nil, if v38() then {
            v104
        } else nil, if v38() then {
            v105
        } else nil, {
            v109
        }, {
            v110
        }, {
            v111
        }, {
            v112
        })
    }, v63.dataStatus, v70;
end;