local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_Modules_1 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local l_parseAndAddGameInfos_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).parseAndAddGameInfos;
local l_GameInfoModel_0 = require(l_CorePackages_0.Workspace.Packages.GameModels).GameInfoModel;
local l_TopicContentsEntryModel_0 = require(l_CorePackages_0.Workspace.Packages.TopicContentsRodux).TopicContentsEntryModel;
local l_GameDetailModel_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.GameDetailModel;
local l_SetGameVotes_0 = require(l_CorePackages_0.Workspace.Packages.GameVotesRodux).GameVotes.SetGameVotes;
local l_AddGameDetailsV2_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.AddGameDetailsV2;
local l_SetGameDetailError_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.SetGameDetailError;
local l_AgeRecommendationDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).AgeRecommendations.AgeRecommendationDetails;
local l_SetAgeRecommendation_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).AgeRecommendations.SetAgeRecommendation;
local l_SetAgeRecommendationHeaders_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).AgeRecommendations.SetAgeRecommendationHeaders;
local v17 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.getEdpServerIxpVariablesStore);
local l_EnumGameDetailErrorTypes_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).EnumGameDetailErrorTypes;
local v19 = require(l_CorePackages_0.Workspace.Packages.DataHydration);
local v20 = require(l_Modules_0.LuaApp.Promise);
local v21 = require(l_Modules_0.LuaApp.Thunks.ApiFetchExperienceDetailsPageCounters);
local l_GetExperienceDetailsPage_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).ExperienceDetails.GetExperienceDetailsPage;
local v23 = require(script.Parent.Parent.Components.ExperienceDetails.EdpSduiUtils);
local v24 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi);
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp;
local l_FFlagLuaAppDataHydrationUpdateItem_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppDataHydrationUpdateItem;
local l_FFlagLuaAppEdpBackendV2AddUserVote_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2AddUserVote;
local v31 = game:DefineFastFlag("LuaAppEdpBackendV2LogFetchFailureErrorCodeAndMessage2", false);
local l_FFlagLuaAppDataHydrationConnectionsPlayedStore_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppDataHydrationConnectionsPlayedStore;
local v33 = require(l_Modules_0.LuaApp.Actions.Games.SetGameFavorite);
local v34 = require(l_Modules_0.LuaApp.Actions.Games.SetRecommendedGameEntries);
local v35 = require(l_Modules_0.LuaApp.Actions.Games.SetExperienceNotificationsEnabledCount);
local v36 = require(l_Modules_0.LuaApp.Actions.Games.SetExperienceNotificationsEnabledLimit);
local v37 = require(l_Modules_0.LuaApp.Actions.Games.SetGamePasses);
local v38 = require(l_Modules_0.LuaApp.Actions.SetGameFollowingStatus);
local v39 = require(l_Modules_0.LuaApp.Actions.SetGameBadges);
local v40 = require(l_Modules_0.LuaApp.Actions.Games.SetGameSocialLinks);
local l_SetExperienceCommunityLink_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Actions.SetExperienceCommunityLink;
local l_UpdateGameMedia_0 = l_Modules_1.LuaApp.Actions.Games.UpdateGameMedia;
local v43 = require(l_Modules_0.LuaApp.Actions.SetAssetTextFilterSettings);
local l_GameMediaEntry_0 = l_Modules_1.LuaApp.Models.GamesApi.GameMediaEntry;
local l_CommunityInfo_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Models.CommunityInfo;
local l_CommunityVisibility_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Enums.CommunityVisibility;
local v47 = require(l_Modules_0.LuaApp.Thunks.ApiFetchPassesThumbnails);
local v48 = require(l_Modules_0.LuaApp.Thunks.Games.ProcessGameSocialLinks);
local l_FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure;
local l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2LogUniverseIdForEvents;
local v54 = {
    KeyMapper = function(v51) --[[ Line: 85 ]]
        return "luaapp.experience.details." .. v51;
    end, 
    GetFetchingStatus = function(v52, v53) --[[ Line: 91 ]] --[[ Name: GetFetchingStatus ]]
        -- upvalues: l_PerformFetch_0 (copy)
        return l_PerformFetch_0.GetStatus(v52, "luaapp.experience.details." .. v53);
    end
};
local function _(v55, v56, v57, v58) --[[ Line: 95 ]] --[[ Name: safeParseData ]]
    -- upvalues: v21 (copy), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (copy)
    local l_status_0, l_result_0 = pcall(v55, v56);
    if not l_status_0 then
        if v58 then
            v21.logParseFailure(v58, if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v57 else nil);
        end;
        return nil;
    else
        return l_result_0;
    end;
end;
local function v69(v62, v63) --[[ Line: 109 ]] --[[ Name: parseGameDetails ]]
    -- upvalues: l_GameDetailModel_0 (copy), v21 (copy), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (copy)
    local l_gameDetails_0 = v62.gameDetails;
    if l_gameDetails_0 then
        local l_fromJsonData_0 = l_GameDetailModel_0.fromJsonData;
        local l_status_1, l_result_1 = pcall(l_fromJsonData_0, l_gameDetails_0);
        local v68;
        if not l_status_1 then
            v21.logParseFailure("gameDetails", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v63 else nil);
            v68 = nil;
        else
            v68 = l_result_1;
        end;
        if v68 then
            return {
                [v63] = v68
            };
        end;
    else
        v21.logMissingData("gameDetails", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v63 else nil);
    end;
    return nil;
end;
local function v81(v70, v71) --[[ Line: 125 ]] --[[ Name: parseGameMedia ]]
    -- upvalues: l_GameMediaEntry_0 (copy), v21 (copy), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (copy)
    local l_mediaGallery_0 = v70.mediaGallery;
    if l_mediaGallery_0 and type(l_mediaGallery_0) == "table" then
        local v73 = {};
        for _, v75 in l_mediaGallery_0 do
            if type(v75) == "table" then
                local v76 = {
                    id = v75.id, 
                    assetTypeId = v75.assetTypeId, 
                    imageId = v75.imageId, 
                    videoId = v75.videoId, 
                    videoHash = v75.videoHash, 
                    videoTitle = v75.videoTitle, 
                    approved = true
                };
                local l_fromJsonData_1 = l_GameMediaEntry_0.fromJsonData;
                local l_status_2, l_result_2 = pcall(l_fromJsonData_1, v76);
                local v80;
                if not l_status_2 then
                    v21.logParseFailure("gameMedia", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v71 else nil);
                    v80 = nil;
                else
                    v80 = l_result_2;
                end;
                if v80 then
                    table.insert(v73, v80);
                end;
            else
                v21.logInvalidData("mediaEntry", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v71 else nil);
            end;
        end;
        return v73;
    else
        v21.logMissingData("mediaGallery", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v71 else nil);
        return nil;
    end;
end;
local function v101(v82, v83, v84, v85) --[[ Line: 161 ]] --[[ Name: parseRecommendedGames ]]
    -- upvalues: l_TopicContentsEntryModel_0 (copy), v21 (copy), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (copy), v4 (copy), l_GameInfoModel_0 (copy), l_parseAndAddGameInfos_0 (copy)
    local l_relatedGames_0 = v82.relatedGames;
    if l_relatedGames_0 and type(l_relatedGames_0) == "table" then
        local v87 = {};
        l_parseAndAddGameInfos_0(v83, v84, l_relatedGames_0, function(v88) --[[ Line: 191 ]] --[[ Name: safeGameInfoModelFromGamesApi ]]
            -- upvalues: l_GameInfoModel_0 (ref), v21 (ref), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (ref), v85 (copy)
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 192 ]]
                -- upvalues: l_GameInfoModel_0 (ref), v88 (copy)
                return l_GameInfoModel_0.fromGamesApi(v88);
            end);
            if l_status_3 then
                return l_result_3;
            else
                v21.logParseFailure("recommendedGame", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v85 else nil);
                return nil;
            end;
        end, function(v91, v92) --[[ Line: 165 ]] --[[ Name: forEachGameInfo ]]
            -- upvalues: l_TopicContentsEntryModel_0 (ref), v85 (copy), v21 (ref), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (ref), v4 (ref), v87 (copy)
            if type(v91) == "table" then
                local l_fromGamesApiData_0 = l_TopicContentsEntryModel_0.fromGamesApiData;
                local l_v85_0 = v85;
                local l_status_4, l_result_4 = pcall(l_fromGamesApiData_0, v91);
                local v97;
                if not l_status_4 then
                    v21.logParseFailure("recommendedGame", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then l_v85_0 else nil);
                    v97 = nil;
                else
                    v97 = l_result_4;
                end;
                if v97 then
                    v97:match(function(v98) --[[ Line: 172 ]]
                        -- upvalues: v4 (ref), v92 (copy), v87 (ref)
                        local v99 = v4.Dictionary.join(v92, v98);
                        table.insert(v87, v99);
                    end):matchError(function(_) --[[ Line: 176 ]]
                        -- upvalues: v21 (ref), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (ref), v85 (ref)
                        v21.logParseFailure("recommendedGame", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v85 else nil);
                    end);
                    return;
                end;
            else
                v21.logInvalidData("relatedGameData", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v85 else nil);
            end;
        end);
        return v87;
    else
        v21.logMissingData("relatedGames", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v85 else nil);
        return nil;
    end;
end;
local function v108(v102, v103) --[[ Line: 217 ]] --[[ Name: parseGamePasses ]]
    -- upvalues: v21 (copy), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (copy)
    local l_gamePassProducts_0 = v102.gamePassProducts;
    if l_gamePassProducts_0 and type(l_gamePassProducts_0) == "table" then
        local v105 = {};
        if #l_gamePassProducts_0 > 0 then
            for _, v107 in l_gamePassProducts_0 do
                if type(v107) == "table" and v107.id then
                    table.insert(v105, v107.id);
                else
                    v21.logInvalidData("gamePass", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v103 else nil);
                end;
            end;
        end;
        return {
            passes = l_gamePassProducts_0, 
            passIds = v105
        };
    else
        return nil;
    end;
end;
local function v116(v109, v110) --[[ Line: 241 ]] --[[ Name: parseFollowingStatus ]]
    -- upvalues: v21 (copy), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (copy)
    local l_followingStatus_0 = v109.followingStatus;
    if l_followingStatus_0 and type(l_followingStatus_0) == "table" then
        local l_canFollow_0 = l_followingStatus_0.canFollow;
        local l_isFollowing_0 = l_followingStatus_0.isFollowing;
        local l_followingCountByType_0 = l_followingStatus_0.followingCountByType;
        local l_followingLimitByType_0 = l_followingStatus_0.followingLimitByType;
        return {
            canFollow = l_canFollow_0, 
            isFollowing = l_isFollowing_0, 
            count = l_followingCountByType_0, 
            limit = l_followingLimitByType_0
        };
    else
        v21.logMissingData("followingStatus", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v110 else nil);
        return nil;
    end;
end;
local function _(v117, v118) --[[ Line: 264 ]] --[[ Name: parseCommunityLinks ]]
    -- upvalues: l_CommunityInfo_0 (copy), v21 (copy), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (copy)
    local l_communityLinks_0 = v117.communityLinks;
    if l_communityLinks_0 then
        local l_fromJsonData_2 = l_CommunityInfo_0.fromJsonData;
        local l_status_5, l_result_5 = pcall(l_fromJsonData_2, l_communityLinks_0);
        if not l_status_5 then
            v21.logParseFailure("communityLinks", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v118 else nil);
            return nil;
        else
            return l_result_5;
        end;
    else
        return nil;
    end;
end;
local function v133(v124, v125) --[[ Line: 274 ]] --[[ Name: parseAgeRecommendations ]]
    -- upvalues: l_AgeRecommendationDetails_0 (copy), v21 (copy), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (copy)
    local l_ageRecommendations_0 = v124.ageRecommendations;
    if l_ageRecommendations_0 and type(l_ageRecommendations_0) == "table" then
        local l_ageRecommendationsDetails_0 = l_ageRecommendations_0.ageRecommendationsDetails;
        if l_ageRecommendationsDetails_0 then
            local l_fromJsonData_3 = l_AgeRecommendationDetails_0.fromJsonData;
            local l_status_6, l_result_6 = pcall(l_fromJsonData_3, l_ageRecommendationsDetails_0);
            local v131;
            if not l_status_6 then
                v21.logParseFailure("ageRecommendations", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v125 else nil);
                v131 = nil;
            else
                v131 = l_result_6;
            end;
            if not v131 then
                return nil;
            else
                l_fromJsonData_3, l_status_6 = v131:unwrap();
                if l_fromJsonData_3 == false then
                    v21.logParseFailure("ageRecommendations", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v125 else nil);
                    return nil;
                else
                    l_result_6 = l_ageRecommendations_0.headerDisplayName;
                    local l_headerDisplayNameShort_0 = l_ageRecommendations_0.headerDisplayNameShort;
                    return {
                        ageRecommendationDetailsData = l_status_6, 
                        headerDisplayName = l_result_6, 
                        headerDisplayNameShort = l_headerDisplayNameShort_0
                    };
                end;
            end;
        end;
    else
        v21.logMissingData("ageRecommendations", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v125 else nil);
    end;
    return nil;
end;
local function v140(v134, _) --[[ Line: 318 ]] --[[ Name: extractSduiFeedItems ]]
    if v134 and v134.sdui and v134.sdui.feed and v134.sdui.feed.props and v134.sdui.feed.props.feedItems then
        local v136 = {};
        for _, v138 in v134.sdui.feed.props.feedItems do
            if type(v138) == "table" and v138.feedItemKey then
                local v139 = {
                    topicId = v138.topicId, 
                    sortIndex = v138.sortIndex, 
                    componentConfig = v138.componentConfig, 
                    analyticsData = v138.analyticsData
                };
                v136[v138.feedItemKey] = v139;
            end;
        end;
        return v136;
    else
        return nil;
    end;
end;
local function _(v141) --[[ Line: 338 ]] --[[ Name: extractSduiTemplates ]]
    if not v141 or not v141.sdui or not v141.sdui.templates then
        return nil;
    else
        return v141.sdui.templates;
    end;
end;
local function v160(v143, v144) --[[ Line: 346 ]] --[[ Name: updateDataHydrationStores ]]
    -- upvalues: v19 (copy), l_FFlagLuaAppEdpBackendV2AddUserVote_0 (copy), v69 (copy), l_FFlagLuaAppDataHydrationConnectionsPlayedStore_0 (copy), l_Players_0 (copy), v116 (copy)
    local v145 = if v144 and v144.sdui and v144.sdui.feed and v144.sdui.feed.props and v144.sdui.feed.props.experienceDetails then v144.sdui.feed.props.experienceDetails else nil;
    if not v145 then
        return;
    else
        local v146 = v19.Game.getVotesStore(false);
        local v147 = v145.totalUpVotes or 0;
        local v148 = v145.totalDownVotes or 0;
        v146.updateVoteItem(v143, v148, v147);
        if l_FFlagLuaAppEdpBackendV2AddUserVote_0 then
            local l_userVote_0 = v145.userVote;
            if l_userVote_0 ~= nil then
                v146.updateUserVoteItem(v143, l_userVote_0);
            end;
        end;
        local v150 = v19.Game.getGameInfoStore(false);
        local v151 = v69(v145, v143);
        local v152 = v151 and v151[v143];
        if v152 then
            v150.updateGameInfo(v143, {
                rootPlaceId = v152.rootPlaceId, 
                name = v152.name, 
                description = v152.description, 
                creator = v152.creator, 
                universeId = v143, 
                playerCount = v152.playing
            });
        end;
        local l_isFavorited_0 = v145.isFavorited;
        local v154 = v19.Game.getFavoritesStore(false);
        if l_FFlagLuaAppDataHydrationConnectionsPlayedStore_0 then
            local l_connectionsPlayed_0 = v145.connectionsPlayed;
            local v156 = v19.Game.getConnectionsPlayedStore(false);
            if l_connectionsPlayed_0 then
                v156.updateItems({
                    [v143] = l_connectionsPlayed_0
                });
            end;
        end;
        v154.updateItem(v143, l_isFavorited_0);
        local v157 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId;
        if v157 and v157 > 0 then
            local v158 = v116(v145, v143);
            if v158 then
                local v159 = v19.Game.getFollowingsStore(false);
                v159.updateItem(v143, {
                    userId = tostring(v157), 
                    universeId = v143, 
                    isFollowing = v158.isFollowing, 
                    canFollow = v158.canFollow
                });
                v159.updateUserFollowingLimits({
                    followingCountByType = v158.count, 
                    followingLimitByType = v158.limit
                });
            end;
        end;
        return;
    end;
end;
local function v169(v161, _) --[[ Line: 417 ]] --[[ Name: parseEdpServerIxpVariables ]]
    -- upvalues: v21 (copy)
    if not v161 or not v161.sdui or not v161.sdui.feed or not v161.sdui.feed.props or not v161.sdui.feed.props.visibilityVariables then
        return nil;
    else
        local l_visibilityVariables_0 = v161.sdui.feed.props.visibilityVariables;
        local v164 = {
            hideNotifyButton = l_visibilityVariables_0.hideNotifyButton, 
            hideGameRatings = l_visibilityVariables_0.hideGameRatings, 
            hideFavoritesInContextMenu = l_visibilityVariables_0.hideFavoritesInContextMenu, 
            hideNotifyInContextMenu = l_visibilityVariables_0.hideNotifyInContextMenu, 
            showVisitsInInfoList = l_visibilityVariables_0.showVisitsInInfoList, 
            showAgeMaturityInHeader = l_visibilityVariables_0.showAgeMaturityInHeader, 
            showContentDescriptorsInInfoList = l_visibilityVariables_0.showContentDescriptorsInInfoList, 
            hideStatsCarousel = l_visibilityVariables_0.hideStatsCarousel
        };
        local v165 = {};
        for v166, v167 in v164 do
            if v167 ~= nil then
                table.insert(v165, tostring(v166) .. ":" .. tostring(v167));
            end;
        end;
        local v168 = table.concat(v165, ",");
        v21.logVisibilityVariables(v168);
        return v164;
    end;
end;
v54.Fetch = function(v170, v171, v172, v173) --[[ Line: 453 ]] --[[ Name: Fetch ]]
    -- upvalues: l_PerformFetch_0 (copy), l_GetExperienceDetailsPage_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v140 (copy), l_FFlagLuaAppDataHydrationUpdateItem_0 (copy), v160 (copy), v23 (copy), v24 (copy), v169 (copy), v17 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v21 (copy), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (copy), v20 (copy), v69 (copy), l_AddGameDetailsV2_0 (copy), v81 (copy), l_UpdateGameMedia_0 (copy), v33 (copy), l_SetGameVotes_0 (copy), v43 (copy), v101 (copy), v34 (copy), v108 (copy), v37 (copy), v47 (copy), v116 (copy), v38 (copy), v35 (copy), v36 (copy), v39 (copy), v48 (copy), v40 (copy), l_getAppFeaturePolicies_0 (copy), l_CommunityInfo_0 (copy), l_CommunityVisibility_0 (copy), l_SetExperienceCommunityLink_0 (copy), v133 (copy), l_SetAgeRecommendation_0 (copy), l_SetAgeRecommendationHeaders_0 (copy), l_FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure_0 (copy), l_SetGameDetailError_0 (copy), l_EnumGameDetailErrorTypes_0 (copy), v31 (copy)
    if type(v171) ~= "string" then
        error("ApiFetchExperienceDetailsPage thunk expects universeId to be a string");
    end;
    return l_PerformFetch_0.Single("luaapp.experience.details." .. v171, function(v174) --[[ Line: 458 ]]
        -- upvalues: l_GetExperienceDetailsPage_0 (ref), v170 (copy), v171 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v173 (copy), v140 (ref), l_FFlagLuaAppDataHydrationUpdateItem_0 (ref), v160 (ref), v23 (ref), v24 (ref), v169 (ref), v17 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v172 (copy), v21 (ref), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (ref), v20 (ref), v69 (ref), l_AddGameDetailsV2_0 (ref), v81 (ref), l_UpdateGameMedia_0 (ref), v33 (ref), l_SetGameVotes_0 (ref), v43 (ref), v101 (ref), v34 (ref), v108 (ref), v37 (ref), v47 (ref), v116 (ref), v38 (ref), v35 (ref), v36 (ref), v39 (ref), v48 (ref), v40 (ref), l_getAppFeaturePolicies_0 (ref), l_CommunityInfo_0 (ref), l_CommunityVisibility_0 (ref), l_SetExperienceCommunityLink_0 (ref), v133 (ref), l_SetAgeRecommendation_0 (ref), l_SetAgeRecommendationHeaders_0 (ref), l_FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure_0 (ref), l_SetGameDetailError_0 (ref), l_EnumGameDetailErrorTypes_0 (ref), v31 (ref)
        return l_GetExperienceDetailsPage_0(v170, v171):andThen(function(v175) --[[ Line: 459 ]]
            -- upvalues: l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v173 (ref), v140 (ref), v171 (ref), l_FFlagLuaAppDataHydrationUpdateItem_0 (ref), v160 (ref), v23 (ref), v24 (ref), v169 (ref), v17 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v172 (ref), v21 (ref), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (ref), v20 (ref), v69 (ref), v174 (copy), l_AddGameDetailsV2_0 (ref), v81 (ref), l_UpdateGameMedia_0 (ref), v33 (ref), l_SetGameVotes_0 (ref), v43 (ref), v101 (ref), v170 (ref), v34 (ref), v108 (ref), v37 (ref), v47 (ref), v116 (ref), v38 (ref), v35 (ref), v36 (ref), v39 (ref), v48 (ref), v40 (ref), l_getAppFeaturePolicies_0 (ref), l_CommunityInfo_0 (ref), l_CommunityVisibility_0 (ref), l_SetExperienceCommunityLink_0 (ref), v133 (ref), l_SetAgeRecommendation_0 (ref), l_SetAgeRecommendationHeaders_0 (ref), l_FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure_0 (ref)
            local l_responseBody_0 = v175.responseBody;
            if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v173 then
                local v177 = v140(l_responseBody_0, v171);
                local v178 = if l_responseBody_0 and l_responseBody_0.sdui and l_responseBody_0.sdui.templates then l_responseBody_0.sdui.templates else nil;
                if v177 and next(v177) then
                    if l_FFlagLuaAppDataHydrationUpdateItem_0 then
                        v160(v171, l_responseBody_0);
                    end;
                    local v179 = os.time() * 1000;
                    local v180 = v23.getUnprocessedEdpStoreKey((tostring(v171)));
                    v24.getSduiFeedStore(v180).updateData({
                        itemCollections = v177, 
                        templates = v178, 
                        dataUpdatedTimestamp = v179
                    });
                end;
                local v181 = v169(l_responseBody_0, v171);
                if v181 then
                    v17().setEdpServerIxpVariables(v181);
                end;
            end;
            if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v172 then
                local v182 = nil;
                if l_responseBody_0 and l_responseBody_0.sdui and l_responseBody_0.sdui.feed and l_responseBody_0.sdui.feed.props and l_responseBody_0.sdui.feed.props.experienceDetails then
                    v182 = l_responseBody_0.sdui.feed.props.experienceDetails;
                end;
                if v182 == nil then
                    v21.logMissingData("experienceDetailsProps", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v171 else nil);
                    return v20.reject({
                        HttpError = Enum.HttpError.InternalServerError
                    });
                else
                    local v183 = v69(v182, v171);
                    if v183 then
                        v174:dispatch(l_AddGameDetailsV2_0(v183));
                    end;
                    local v184 = v81(v182, v171);
                    if v184 then
                        v174:dispatch(l_UpdateGameMedia_0(v171, v184));
                    end;
                    local l_isFavorited_1 = v182.isFavorited;
                    if l_isFavorited_1 ~= nil then
                        v174:dispatch(v33(v171, l_isFavorited_1));
                    end;
                    local l_totalUpVotes_0 = v182.totalUpVotes;
                    local l_totalDownVotes_0 = v182.totalDownVotes;
                    if l_totalUpVotes_0 ~= nil and l_totalDownVotes_0 ~= nil then
                        local v188 = l_totalUpVotes_0 < 0 and 0 or l_totalUpVotes_0;
                        local v189 = l_totalDownVotes_0 < 0 and 0 or l_totalDownVotes_0;
                        v174:dispatch(l_SetGameVotes_0(v171, v188, v189));
                    end;
                    local l_textFilterProfanity_0 = v182.textFilterProfanity;
                    if l_textFilterProfanity_0 ~= nil then
                        v174:dispatch(v43(v171, l_textFilterProfanity_0));
                    else
                        v174:dispatch(v43(v171, false));
                    end;
                    local v191 = v101(v182, v170, v174, v171);
                    if v191 then
                        v174:dispatch(v34(v171, v191));
                    end;
                    local v192 = v108(v182, v171);
                    if v192 and v192.passes then
                        v174:dispatch(v37(v171, v192.passes));
                        if v192 and v192.passIds then
                            v174:dispatch(v47(v170, v192.passIds));
                        end;
                    end;
                    local v193 = v116(v182, v171);
                    if v193 and v193.canFollow ~= nil and v193.isFollowing ~= nil then
                        v174:dispatch(v38(v171, v193.canFollow, v193.isFollowing));
                    end;
                    if v193 and v193.count ~= nil then
                        v174:dispatch(v35(v193.count));
                    end;
                    if v193 and v193.limit ~= nil then
                        v174:dispatch(v36(v193.limit));
                    end;
                    local l_badges_0 = v182.badges;
                    if l_badges_0 then
                        v174:dispatch(v39(v171, l_badges_0));
                    end;
                    local l_socialLinks_0 = v182.socialLinks;
                    if l_socialLinks_0 then
                        local v196 = v48(l_socialLinks_0, v171);
                        if v196 then
                            v174:dispatch(v40(v171, v196));
                        end;
                    end;
                    if l_getAppFeaturePolicies_0().getCommunityLinksEnabled() then
                        local l_v182_0 = v182;
                        local l_v171_0 = v171;
                        local l_communityLinks_1 = l_v182_0.communityLinks;
                        local v200;
                        if l_communityLinks_1 then
                            local l_fromJsonData_4 = l_CommunityInfo_0.fromJsonData;
                            local l_status_7, l_result_7 = pcall(l_fromJsonData_4, l_communityLinks_1);
                            local v204;
                            if not l_status_7 then
                                v21.logParseFailure("communityLinks", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then l_v171_0 else nil);
                                v204 = nil;
                            else
                                v204 = l_result_7;
                            end;
                            v200 = v204;
                        else
                            v200 = nil;
                        end;
                        if v200 and v200.visibility == l_CommunityVisibility_0.Public then
                            v174:dispatch(l_SetExperienceCommunityLink_0(v171, v200));
                        end;
                    end;
                    local v205 = v133(v182, v171);
                    if v205 then
                        v174:dispatch(l_SetAgeRecommendation_0(v171, v205.ageRecommendationDetailsData));
                        v174:dispatch(l_SetAgeRecommendationHeaders_0(v205.headerDisplayName, v205.headerDisplayNameShort));
                    end;
                end;
            end;
            if l_FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure_0 then
                v21.logFetchSuccess(if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v171 else nil);
            end;
            return l_responseBody_0;
        end):catch(function(v206) --[[ Line: 612 ]]
            -- upvalues: v174 (copy), l_SetGameDetailError_0 (ref), v171 (ref), l_EnumGameDetailErrorTypes_0 (ref), l_FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure_0 (ref), v21 (ref), v31 (ref), v20 (ref)
            if v206 and v206.StatusCode == 404 then
                v174:dispatch(l_SetGameDetailError_0(v171, l_EnumGameDetailErrorTypes_0.ExperienceUnavailable));
            end;
            if l_FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure_0 then
                v21.logFetchFailure(v171, if v31 and v206 then v206.StatusCode else nil, if v31 and v206 then v206.StatusMessage else nil);
            end;
            return v20.reject(v206);
        end);
    end);
end;
return v54;