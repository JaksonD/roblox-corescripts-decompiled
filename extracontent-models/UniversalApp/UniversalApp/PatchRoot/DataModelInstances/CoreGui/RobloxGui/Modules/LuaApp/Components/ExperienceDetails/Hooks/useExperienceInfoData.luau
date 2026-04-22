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
local v17 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.EnableCommunityProfilePageIXP);
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
local l_FFlagEnableBlackbirdPageCloseCallback_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdPageCloseCallback;
local l_getSubscriptionPurchaseCloseCallback_0 = require(l_CorePackages_0.Workspace.Packages.RobloxSubscriptionPurchaseApp).Utils.getSubscriptionPurchaseCloseCallback;
return function(v51, v52, v53) --[[ Line: 101 ]]
    -- upvalues: l_FFlagLuaAppBadgesSeeAllEnabled_0 (copy), l_useNavigation_0 (copy), l_useSelector_0 (copy), v21 (copy), v37 (copy), v12 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v35 (copy), l_ApiFetchGameDetails_0 (copy), l_FFlagLuaAppHideEdpStoreForUnplayable_0 (copy), l_useDispatch_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v18 (copy), v31 (copy), v17 (copy), v1 (copy), l_FFlagHideCloseButtonEdp_0 (copy), v25 (copy), v26 (copy), v29 (copy), v27 (copy), v23 (copy), l_useLocalization_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_GuildedLogoWhiteAsset_0 (copy), l_getCommunityUrl_0 (copy), l_clickCommunityLinkEvent_0 (copy), l_Constants_0 (copy), v20 (copy), v22 (copy), v39 (copy), v24 (copy), v38 (copy), l_FFlagEnableBlackbirdPageCloseCallback_0 (copy), l_getSubscriptionPurchaseCloseCallback_0 (copy), l_navigateToBadgesSeeAll_0 (copy), v47 (copy), v28 (copy), v32 (copy), l_abbreviateCount_0 (copy), l_FFlagLuaAppUpdateContentDescriptorsTranslation_0 (copy), l_RetrievalStatus_0 (copy), v2 (copy)
    local v54 = if l_FFlagLuaAppBadgesSeeAllEnabled_0 then l_useNavigation_0() else nil;
    local v65 = l_useSelector_0(function(v55) --[[ Line: 103 ]]
        -- upvalues: v51 (copy), v21 (ref), v37 (ref), v12 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v52 (copy), v35 (ref), l_ApiFetchGameDetails_0 (ref), l_FFlagLuaAppHideEdpStoreForUnplayable_0 (ref)
        local v56 = v55.GamePasses[v51];
        local v57 = v55.GameBadges[v51];
        local v58 = v55.VoiceChatOptInStatus.isUserOptIn or false;
        local v59 = false;
        local v60 = false;
        if v55.ShowAgeVerificationOverlay[v51] then
            v59 = v55.ShowAgeVerificationOverlay[v51].isUniverseEnabledForVoice;
            v60 = v55.ShowAgeVerificationOverlay[v51].isUniverseEnabledForAvatarVideo;
        end;
        local v61 = v21(v55.GameSocialLinks, v51, "groupLink");
        local v62 = if v37() then nil else v12.isCreatorOfGameVerified(v55, {
            universeId = v51, 
            shouldUseV2GameDetails = not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v52 and true or nil
        });
        local v63 = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v52 then v35.GetFetchingStatus(v55, v51) else l_ApiFetchGameDetails_0.GetFetchingStatus(v55, v51);
        local v64 = v55.CommunityLinks.ExperienceCommunityLinks[v51] or nil;
        return {
            dataStatus = v63, 
            gameDetail = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v52 then v55.GameDetailsV2[v51] or {} else v55.GameDetails[v51] or {}, 
            creatorVerified = v62, 
            showPasses = not v56 or #v56 > 0, 
            showBadges = not v57 or #v57 > 0, 
            userVoiceEnabled = v58, 
            experienceVoiceEnabled = v59, 
            experienceVideoEnabled = v60, 
            groupLink = v61, 
            communityLink = v64, 
            isLocalUserUnder13 = v55.IsLocalUserUnder13, 
            ageRecommendations = v55.AgeRecommendations[v51], 
            ageRecommendationHeader = v55.AgeRecommendationHeaders.headerDisplayName, 
            isPlayable = if l_FFlagLuaAppHideEdpStoreForUnplayable_0 then v55.PlayabilityStatus and v55.PlayabilityStatus[v51] and v55.PlayabilityStatus[v51].isPlayable else nil
        };
    end);
    local v66 = l_useDispatch_0();
    local v67 = nil;
    if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
        v67 = v18();
    end;
    local v68 = v31(if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v52 else nil);
    local v69 = if v17.FFlagIsSetupEnabled then v17.useIsFeatureActive({
        isExposureEnabled = false
    }) else nil;
    local v70 = v1.useCallback(function() --[[ Line: 173 ]]
        -- upvalues: v68 (copy), v51 (copy), l_FFlagHideCloseButtonEdp_0 (ref), v53 (copy)
        v68.openExperienceGuidelinesExplained(v51, if l_FFlagHideCloseButtonEdp_0 then v53 else false);
    end, {
        v66, 
        v51, 
        v68
    });
    local v71 = v25(v26);
    local v72 = v1.useCallback(function() --[[ Line: 183 ]]
        -- upvalues: v66 (copy), v29 (ref), v71 (copy), v51 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v52 (copy)
        v66(v29(v71, v51, nil, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v52 else nil));
    end, {
        v66, 
        v71, 
        v51, 
        if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v52 else nil
    });
    local v73 = v25(v27);
    local v75 = v23(function(v74) --[[ Line: 203 ]]
        return {
            showBadgesRow = v74.getGameInfoShowBadges(), 
            showCreatedRow = v74.getGameInfoShowCreated(), 
            showDeveloperRow = v74.getGameInfoListDeveloper(), 
            showRNVDeveloper = v74.getGameInfoListShowRNVDeveloper(), 
            showGamepassesRow = v74.getGameInfoShowGamepasses(), 
            showGenreRow = v74.getGameInfoShowGenre(), 
            showSubgenreRow = v74.getGameInfoShowSubgenre(), 
            showMaxPlayersRow = v74.getGameInfoShowMaxPlayers(), 
            showServersRow = v74.getGameInfoShowServers(), 
            showUpdatedRow = v74.getGameInfoShowUpdated(), 
            enableGroupLinks = v74.getSocialGroupLinks(), 
            webViewSupport = v74.getWebViewSupport(), 
            showAgeRecommendationRow = v74.getGameInfoShowAgeRecommendation()
        };
    end);
    local v76 = l_useLocalization_0({
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
    local v77 = l_useLocalization_0({
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
    local v79 = l_useUserExperiment_0({
        l_AppUserLayers_0.EDPCommunityLinksLayer
    }, function(v78) --[[ Line: 280 ]]
        -- upvalues: l_AppUserLayers_0 (ref)
        return (v78[l_AppUserLayers_0.EDPCommunityLinksLayer] or {}).communityLinkDisplayConfig or {};
    end, false);
    local v82 = v1.useMemo(function() --[[ Line: 288 ]]
        -- upvalues: v79 (copy), v65 (copy), v76 (copy), l_GuildedLogoWhiteAsset_0 (ref), l_getCommunityUrl_0 (ref), l_clickCommunityLinkEvent_0 (ref), v73 (copy), l_Constants_0 (ref), v51 (copy)
        local l_inTreatment_0 = v79.inTreatment;
        local l_linkVariant_0 = v79.linkVariant;
        if l_inTreatment_0 and v65.communityLink and l_linkVariant_0 == "infolist" then
            return {
                infoName = v76.community, 
                infoIcon = l_GuildedLogoWhiteAsset_0, 
                linkUrl = l_getCommunityUrl_0(v65.communityLink.communityId), 
                linkClickCallback = function() --[[ Line: 297 ]] --[[ Name: linkClickCallback ]]
                    -- upvalues: l_clickCommunityLinkEvent_0 (ref), v73 (ref), l_Constants_0 (ref), v65 (ref), v51 (ref)
                    l_clickCommunityLinkEvent_0(v73, l_Constants_0.Context.ExperienceInfoList, {
                        guildedServerId = v65.communityLink.communityId, 
                        entityType = "universe", 
                        entityId = v51
                    });
                end, 
                testId = "--community-row-tail"
            };
        else
            return;
        end;
    end, {
        v76.community, 
        v65.communityLink
    });
    local v84 = v1.useMemo(function() --[[ Line: 321 ]]
        -- upvalues: v75 (copy), v21 (ref), v65 (copy), v76 (copy), v70 (copy), v20 (ref)
        if v75.showAgeRecommendationRow then
            local v83 = v21(v65.ageRecommendations, "summary", "ageRecommendation", "displayName");
            return {
                infoName = if v65.ageRecommendationHeader then v65.ageRecommendationHeader else v76.contentMaturity, 
                infoData = v83 or v76.unavailable, 
                navigateOverride = if v83 then v70 else nil, 
                analyticsSubPage = if v83 then v20.ExperienceGuidelinesExplained else nil, 
                testId = "--content-maturity-row-tail"
            };
        else
            return;
        end;
    end, {
        v75.showAgeRecommendationRow, 
        v76.contentMaturity, 
        v76.unavailable, 
        v65.ageRecommendations, 
        v65.ageRecommendationHeader, 
        v70
    });
    local v86 = v1.useMemo(function() --[[ Line: 347 ]]
        -- upvalues: v75 (copy), v21 (ref), v65 (copy), v76 (copy)
        if v75.showAgeRecommendationRow then
            local v85 = v21(v65.ageRecommendations, "summary", "ageRecommendation", "minimumAgeDisplay");
            if v85 and v85 ~= "" then
                return {
                    infoName = v76.age, 
                    infoData = v85, 
                    testId = "--age-row-tail"
                };
            end;
        end;
    end, {
        v75.showAgeRecommendationRow, 
        v76.age, 
        v65.ageRecommendations
    });
    local v95 = v1.useMemo(function() --[[ Line: 369 ]]
        -- upvalues: v65 (copy), v75 (copy), v37 (ref), v17 (ref), v69 (copy), v76 (copy), v51 (copy), v68 (copy), v22 (ref)
        local l_creator_0 = v65.gameDetail.creator;
        if l_creator_0 and (v75.showDeveloperRow or v75.showRNVDeveloper and l_creator_0.isRNVAccount) then
            local l_id_0 = l_creator_0.id;
            local l_name_0 = l_creator_0.name;
            local l_type_0 = l_creator_0.type;
            local v91 = if v37() then l_creator_0.hasVerifiedBadge or false else v65.creatorVerified or false;
            if v17.FFlagIsSetupEnabled and v69 and l_type_0 == Enum.CreatorType.Group.Name then
                return {
                    infoName = v76.developer, 
                    infoData = l_name_0, 
                    infoDataOverride = function(v92) --[[ Line: 386 ]] --[[ Name: infoDataOverride ]]
                        -- upvalues: l_name_0 (copy), l_id_0 (copy), v51 (ref), v91 (copy)
                        return v92(l_name_0, l_id_0, v51, v91);
                    end, 
                    navigateOverride = function() --[[ Line: 389 ]] --[[ Name: navigateOverride ]]
                        -- upvalues: v68 (ref), l_id_0 (copy)
                        v68.openCommunityProfilePage(l_id_0, "ExperienceDetailsPage:Developer");
                    end, 
                    analyticsSubPage = "Developer", 
                    testId = "--developer-row-tail"
                };
            elseif l_type_0 == Enum.CreatorType.User.Name then
                return {
                    infoName = v76.developer, 
                    infoData = l_name_0, 
                    infoDataOverride = function(v93) --[[ Line: 403 ]] --[[ Name: infoDataOverride ]]
                        -- upvalues: l_name_0 (copy), l_id_0 (copy), v51 (ref), v91 (copy)
                        return v93(l_name_0, l_id_0, v51, v91);
                    end, 
                    navigateOverride = function() --[[ Line: 406 ]] --[[ Name: navigateOverride ]]
                        -- upvalues: v68 (ref), l_id_0 (copy)
                        v68.openUserProfilePage(l_id_0, "ExperienceDetailsPage:Developer");
                    end, 
                    analyticsSubPage = "Developer", 
                    testId = "--developer-row-tail"
                };
            else
                return {
                    infoName = v76.developer, 
                    infoData = l_name_0, 
                    infoDataOverride = function(v94) --[[ Line: 419 ]] --[[ Name: infoDataOverride ]]
                        -- upvalues: l_name_0 (copy), l_id_0 (copy), v51 (ref), v91 (copy)
                        return v94(l_name_0, l_id_0, v51, v91);
                    end, 
                    linkPage = if v75.webViewSupport then v22.game.info.creator({
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
        v76.developer, 
        v75.showDeveloperRow, 
        v75.showRNVDeveloper, 
        v75.webViewSupport, 
        v51, 
        v65.gameDetail, 
        v65.creatorVerified, 
        if v17.FFlagIsSetupEnabled then v69 else nil
    });
    local v96 = v1.useMemo(function() --[[ Line: 449 ]]
        -- upvalues: v75 (copy), v76 (copy), v65 (copy)
        if v75.showMaxPlayersRow then
            return {
                infoName = v76.maxPlayers, 
                infoData = tostring(v65.gameDetail.maxPlayers or "--"), 
                testId = "--server-size-row-tail"
            };
        else
            return;
        end;
    end, {
        v75.showMaxPlayersRow, 
        v65.gameDetail
    });
    local v99 = v1.useMemo(function() --[[ Line: 466 ]]
        -- upvalues: v65 (copy), v39 (ref), v76 (copy), v77 (copy), v75 (copy)
        local v97 = nil;
        if v65.gameDetail.genre_l1 and v65.gameDetail.genre_l1 ~= "" then
            v97 = v65.gameDetail.genre_l1;
        elseif v39 == "N/A" then
            v97 = v76.unavailable;
        elseif v39 == "All" then
            v97 = v77.All;
        end;
        if v75.showGenreRow then
            local v98 = if v97 then v97 else if v65.gameDetail.genre then v77[v65.gameDetail.genre] else nil;
            return {
                infoName = v76.genre, 
                infoData = v98 or "--", 
                testId = "--genre-row-tail"
            };
        else
            return;
        end;
    end, {
        v75.showGenreRow, 
        v65.gameDetail
    });
    local v100 = v1.useMemo(function() --[[ Line: 495 ]]
        -- upvalues: v75 (copy), v65 (copy), v76 (copy)
        if v75.showSubgenreRow and v65.gameDetail.genre_l2 and v65.gameDetail.genre_l2 ~= "" then
            return {
                infoName = v76.subgenre, 
                infoData = v65.gameDetail.genre_l2, 
                testId = "--subgenre-row-tail"
            };
        else
            return;
        end;
    end, {
        v75.showSubgenreRow, 
        v65.gameDetail
    });
    local v101 = v24(v65.gameDetail.created);
    local v102 = v1.useMemo(function() --[[ Line: 514 ]]
        -- upvalues: v75 (copy), v76 (copy), v101 (copy)
        if v75.showCreatedRow then
            return {
                infoName = v76.created, 
                infoData = v101 or "--", 
                testId = "--created-row-tail"
            };
        else
            return;
        end;
    end, {
        v75.showCreatedRow, 
        v101
    });
    local v103 = v24(v65.gameDetail.updated);
    local v104 = v1.useMemo(function() --[[ Line: 532 ]]
        -- upvalues: v75 (copy), v76 (copy), v103 (copy)
        if v75.showUpdatedRow then
            return {
                infoName = v76.updated, 
                infoData = v103 or "--", 
                testId = "--updated-row-tail"
            };
        else
            return;
        end;
    end, {
        v75.showUpdatedRow, 
        v103
    });
    local v105 = nil;
    local v106 = nil;
    local v107 = nil;
    if v38() then
        v106 = v1.useMemo(function() --[[ Line: 553 ]]
            -- upvalues: v76 (copy), v65 (copy)
            local l_notSupported_0 = v76.notSupported;
            if v65.isLocalUserUnder13 then
                return nil;
            else
                if v65.experienceVoiceEnabled then
                    l_notSupported_0 = v76.supported;
                end;
                return {
                    infoName = v76.voiceChat, 
                    infoData = l_notSupported_0, 
                    testId = "--voice-chat-row-tail"
                };
            end;
        end, {
            v65.experienceVoiceEnabled, 
            v65.isLocalUserUnder13
        });
        v107 = v1.useMemo(function() --[[ Line: 576 ]]
            -- upvalues: v76 (copy), v65 (copy)
            local l_notSupported_1 = v76.notSupported;
            if v65.experienceVideoEnabled then
                l_notSupported_1 = v76.supported;
            end;
            return {
                infoName = v76.camera, 
                infoData = l_notSupported_1, 
                testId = "--camera-row-tail"
            };
        end, {
            v65.experienceVideoEnabled
        });
    else
        v105 = v1.useMemo(function() --[[ Line: 595 ]]
            -- upvalues: v65 (copy), v76 (copy)
            local v110 = {};
            if v65.experienceVoiceEnabled and not v65.isLocalUserUnder13 then
                table.insert(v110, v76.microphone);
            end;
            if v65.experienceVideoEnabled then
                table.insert(v110, v76.camera);
            end;
            if #v110 < 1 then
                table.insert(v110, v76.none);
            end;
            return {
                infoName = v76.communication, 
                infoData = table.concat(v110, ", "), 
                testId = "--communication-row-tail"
            };
        end, {
            v65.experienceVoiceEnabled, 
            v65.experienceVideoEnabled, 
            v65.isLocalUserUnder13
        });
    end;
    local v111 = v1.useMemo(function() --[[ Line: 622 ]]
        -- upvalues: v75 (copy), v65 (copy), l_FFlagLuaAppHideEdpStoreForUnplayable_0 (ref), v76 (copy), v22 (ref), v51 (copy), l_FFlagEnableBlackbirdPageCloseCallback_0 (ref), l_getSubscriptionPurchaseCloseCallback_0 (ref)
        if v75.webViewSupport and v75.showGamepassesRow and v65.showPasses and (not l_FFlagLuaAppHideEdpStoreForUnplayable_0 or v65.isPlayable) then
            return {
                infoName = v76.passesAndGear, 
                linkPage = v22.game.info.store({
                    universeId = v51
                }), 
                analyticsSubPage = "PassesAndGear", 
                testId = "--store-row-tail", 
                onClose = if l_FFlagEnableBlackbirdPageCloseCallback_0 and l_getSubscriptionPurchaseCloseCallback_0 then l_getSubscriptionPurchaseCloseCallback_0() else nil
            };
        else
            return;
        end;
    end, {
        v51, 
        v75.webViewSupport, 
        v75.showGamepassesRow, 
        v65.showPasses, 
        if l_FFlagLuaAppHideEdpStoreForUnplayable_0 then v65.isPlayable else nil
    });
    local v112 = v1.useMemo(function() --[[ Line: 653 ]]
        -- upvalues: l_FFlagLuaAppBadgesSeeAllEnabled_0 (ref), v75 (copy), v65 (copy), v76 (copy), l_navigateToBadgesSeeAll_0 (ref), v54 (copy), v51 (copy), v22 (ref)
        if l_FFlagLuaAppBadgesSeeAllEnabled_0 and v75.showBadgesRow and v65.showBadges then
            return {
                infoName = v76.badges, 
                navigateOverride = function() --[[ Line: 657 ]] --[[ Name: navigateOverride ]]
                    -- upvalues: l_navigateToBadgesSeeAll_0 (ref), v54 (ref), v51 (ref)
                    l_navigateToBadgesSeeAll_0(v54, v51);
                end, 
                analyticsSubPage = "Badges", 
                testId = "--badges-row-tail"
            };
        elseif v75.webViewSupport and v75.showBadgesRow and v65.showBadges then
            return {
                infoName = v76.badges, 
                linkPage = v22.game.info.badges({
                    universeId = v51
                }), 
                analyticsSubPage = "Badges", 
                testId = "--badges-row-tail"
            };
        else
            return;
        end;
    end, {
        v51, 
        v75.webViewSupport, 
        v75.showBadgesRow, 
        v65.showPasses, 
        v54, 
        if v47 then v65.showBadges else nil
    });
    local v113 = v1.useMemo(function() --[[ Line: 686 ]]
        -- upvalues: v75 (copy), v76 (copy), v22 (ref), v51 (copy), l_FFlagEnableBlackbirdPageCloseCallback_0 (ref), l_getSubscriptionPurchaseCloseCallback_0 (ref)
        if v75.webViewSupport and v75.showServersRow then
            return {
                infoName = v76.servers, 
                linkPage = v22.game.info.servers({
                    universeId = v51
                }), 
                analyticsSubPage = "Servers", 
                testId = "--servers-row-tail", 
                onClose = if l_FFlagEnableBlackbirdPageCloseCallback_0 and l_getSubscriptionPurchaseCloseCallback_0 then l_getSubscriptionPurchaseCloseCallback_0() else nil
            };
        else
            return;
        end;
    end, {
        v51, 
        v75.webViewSupport, 
        v75.showServersRow
    });
    local v114 = v1.useMemo(function() --[[ Line: 710 ]]
        -- upvalues: v17 (ref), v69 (copy), v75 (copy), v65 (copy), v76 (copy), v68 (copy)
        if v17.FFlagIsSetupEnabled and v69 then
            if v75.enableGroupLinks and v65.groupLink then
                if v65.groupLink.communityId ~= nil then
                    return {
                        infoName = v76.group, 
                        navigateOverride = function() --[[ Line: 716 ]] --[[ Name: navigateOverride ]]
                            -- upvalues: v68 (ref), v65 (ref)
                            v68.openCommunityProfilePage(v65.groupLink.communityId, "ExperienceDetailsPage:Group");
                        end, 
                        analyticsSubPage = "Group", 
                        testId = "--group-row-tail"
                    };
                elseif v75.webViewSupport then
                    return {
                        infoName = v76.group, 
                        linkPage = v65.groupLink.url, 
                        analyticsSubPage = "Group", 
                        testId = "--group-row-tail"
                    };
                end;
            end;
        elseif v75.webViewSupport and v75.enableGroupLinks and v65.groupLink then
            return {
                infoName = v76.group, 
                linkPage = v65.groupLink.url, 
                analyticsSubPage = "Group", 
                testId = "--group-row-tail"
            };
        end;
    end, {
        v51, 
        v75.webViewSupport, 
        v75.enableGroupLinks, 
        v65.groupLink, 
        if v17.FFlagIsSetupEnabled then v69 else nil
    });
    local v115 = nil;
    local v116 = nil;
    if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
        local l_Locale_0 = v25(v28):GetLocale();
        v116 = v1.useMemo(function() --[[ Line: 762 ]]
            -- upvalues: l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v32 (ref), v67 (ref), v65 (copy), l_abbreviateCount_0 (ref), l_Locale_0 (copy), v76 (copy)
            if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v32.getShouldInterleaveSdui()) and v67 and v67.showVisitsInInfoList == true then
                local l_gameDetail_0 = v65.gameDetail;
                local v119 = l_gameDetail_0 and l_gameDetail_0.visits or 0;
                local v120 = l_abbreviateCount_0(v119, l_Locale_0) or "--";
                return {
                    infoName = v76.visits, 
                    infoData = v120, 
                    testId = "--visits-row-tail"
                };
            else
                return;
            end;
        end, {
            v67, 
            v65.gameDetail, 
            v76.visits, 
            l_Locale_0
        });
        v115 = v1.useMemo(function() --[[ Line: 794 ]]
            -- upvalues: l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v32 (ref), v67 (ref), v65 (copy), l_FFlagLuaAppUpdateContentDescriptorsTranslation_0 (ref), v76 (copy)
            if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v32.getShouldInterleaveSdui()) and v67 and v67.showContentDescriptorsInInfoList == true and v65.ageRecommendations then
                local l_descriptorUsages_0 = v65.ageRecommendations.descriptorUsages;
                if l_descriptorUsages_0 and #l_descriptorUsages_0 > 0 then
                    for _, v123 in ipairs(l_descriptorUsages_0) do
                        if v123.name == "strong-language" and v123.contains then
                            return {
                                infoName = if l_FFlagLuaAppUpdateContentDescriptorsTranslation_0 then v76.creatorEnabled else v76.communication, 
                                infoData = v76.strongLanguage, 
                                testId = "--content-descriptors-row-tail"
                            };
                        end;
                    end;
                end;
            end;
        end, {
            v67, 
            v65.ageRecommendations, 
            v76.contentDescriptors, 
            v76.containsStrongLanguage
        });
    end;
    v1.useEffect(function() --[[ Line: 834 ]]
        -- upvalues: v65 (copy), l_RetrievalStatus_0 (ref), v72 (copy)
        if v65.dataStatus == l_RetrievalStatus_0.NotStarted then
            v72();
        end;
    end);
    return {
        rootPlaceId = tostring(v65.gameDetail.rootPlaceId), 
        rows = v2.append({
            v82
        }, if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v32.getShouldInterleaveSdui()) and v67 and v67.showVisitsInInfoList == true and v116 then {
            v116
        } else nil, {
            v84
        }, {
            v86
        }, if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v32.getShouldInterleaveSdui()) and v67 and v67.showContentDescriptorsInInfoList == true and v115 then {
            v115
        } else nil, {
            v95
        }, {
            v96
        }, {
            v99
        }, {
            v100
        }, {
            v102
        }, {
            v104
        }, if not v38() then {
            v105
        } else nil, if v38() then {
            v106
        } else nil, if v38() then {
            v107
        } else nil, {
            v111
        }, {
            v112
        }, {
            v113
        }, {
            v114
        })
    }, v65.dataStatus, v72;
end;