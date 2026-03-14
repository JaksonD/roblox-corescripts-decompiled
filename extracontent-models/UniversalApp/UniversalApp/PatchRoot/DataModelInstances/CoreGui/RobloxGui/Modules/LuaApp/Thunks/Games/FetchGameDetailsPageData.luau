local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_PromiseUtilities_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Utils.PromiseUtilities;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v6 = require(l_CorePackages_0.Workspace.Packages.NextDataExpirationTimeRodux);
local l_SetNextDataExpirationTime_0 = v6.SetNextDataExpirationTime;
local l_NextDataExpirationTimeReducer_0 = v6.NextDataExpirationTimeReducer;
local l_ExpirationTimeNamespace_0 = v6.ExpirationTimeNamespace;
local l_ApiFetchGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local l_ApiFetchAgeRecommendations_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).AgeRecommendations.ApiFetchAgeRecommendations;
local l_ApiFetchVoiceChatOptInStatus_0 = require(l_CorePackages_0.Workspace.Packages.VoiceChat).OptInStatus.ApiFetchVoiceChatOptInStatus;
local l_FetchGameVotes_0 = require(l_CorePackages_0.Workspace.Packages.GameVotesRodux).GameVotes.FetchGameVotes;
local l_ApiFetchExperienceCommunityLink_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Thunks.ApiFetchExperienceCommunityLink;
local l_FetchGamePlayButtonData_0 = require(l_CorePackages_0.Workspace.Packages.GamePlayButton).FetchGamePlayButtonData;
local v16 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux);
local l_BigGameIconReducer_0 = v16.BigGameIcons.BigGameIconReducer;
local l_GameIconReducer_0 = v16.GameIcons.GameIconReducer;
local l_ApiFetchBigGameIcons_0 = v16.BigGameIcons.ApiFetchBigGameIcons;
local l_ApiFetchGameIcons_0 = v16.GameIcons.ApiFetchGameIcons;
local l_ApiFetchGameMedia_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Thunks.Games.ApiFetchGameMedia;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v23 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGameIsFavorite);
local v24 = require(l_Modules_0.LuaApp.Thunks.ApiFetchGameFollowingStatus);
local v25 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGameSocialLinks);
local v26 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamePasses);
local v27 = require(l_Modules_0.LuaApp.Thunks.DeveloperProduct.ApiFetchGameDeveloperProducts);
local v28 = require(l_Modules_0.LuaApp.Thunks.Subscription.ApiFetchGameSubscriptionProducts);
local v29 = require(l_Modules_0.LuaApp.Thunks.ApiFetchGameBadges);
local v30 = require(l_Modules_0.LuaApp.Thunks.Games.RecommendedGames);
local v31 = require(l_Modules_0.LuaApp.Thunks.ApiFetchAssetTextFilterSettings);
local v32 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchPrivateServersEnabled);
local v33 = require(l_Modules_0.LuaApp.Thunks.ApiFetchExperienceDetailsPage);
local v34 = require(l_Modules_0.LuaApp.Thunks.ApiFetchExperienceDetailsPageCounters);
local v35 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local v36 = require(script.Parent.Parent.Parent.Components.ExperienceDetails.EdpSduiUtils);
local v37 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v38 = tonumber(settings():GetFVariable("LuaAppGameDetailsRefreshIntervalInSeconds"));
local v39 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppLaunchConnectorFix);
local v40 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableBigGameIconInDetailsPage);
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp;
local l_FFlagLuaAppEdpFetchLatencyTracking_0 = v37.FFlagLuaAppEdpFetchLatencyTracking;
local v46 = game:DefineFastInt("EdpFetchLatencyTrackingThrottlingHundredthsPercent", 1000);
local l_FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure;
local l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2LogUniverseIdForEvents;
local v49 = nil;
local v50 = nil;
if l_FFlagLuaAppEdpFetchLatencyTracking_0 then
    v49 = {
        eventName = "experienceDetailsFetchLatency", 
        backends = {
            v35.TelemetryBackends.Points, 
            v35.TelemetryBackends.EventIngest
        }, 
        throttlingPercentage = v46, 
        description = "\"Latency measurement for EDP first class promise fetch batch\"", 
        lastUpdated = {
            25, 
            8, 
            20
        }, 
        links = "https://roblox.atlassian.net/wiki/x/q4Ji4w"
    };
    v50 = {
        eventName = "experienceDetailsFetchLatencyMissingStartTime", 
        backends = {
            v35.TelemetryBackends.Points, 
            v35.TelemetryBackends.EventIngest
        }, 
        throttlingPercentage = v46, 
        description = "\"Missing start time for EDP first class promise fetch batch\"", 
        lastUpdated = {
            25, 
            8, 
            20
        }, 
        links = "https://roblox.atlassian.net/wiki/x/q4Ji4w"
    };
end;
local function v53(v51, v52) --[[ Line: 96 ]] --[[ Name: logMissingDataMetrics ]]
    -- upvalues: v34 (copy)
    if v51.GameDetailsV2[v52] == nil then
        v34.logFetchMissingData("gameDetails");
    end;
    if v51.GameMedia[v52] == nil then
        v34.logFetchMissingData("gameMedia");
    end;
    if v51.AgeRecommendations[v52] == nil then
        v34.logFetchMissingData("ageRecommendations");
    end;
    if v51.GameVotes[v52] == nil then
        v34.logFetchMissingData("gameVotes");
    end;
    if v51.GameFavorites[v52] == nil then
        v34.logFetchMissingData("gameFavorites");
    end;
    if v51.GameFollowings[v52] == nil then
        v34.logFetchMissingData("gameFollowings");
    end;
    if v51.AssetTextFilterSettings[v52] == nil then
        v34.logFetchMissingData("assetTextFilterSettings");
    end;
    if v51.GamePrivateServersEnabled[v52] == nil then
        v34.logFetchMissingData("gamePrivateServersEnabled");
    end;
end;
local function v67(v54, v55, v56, v57, v58, v59, v60, v61) --[[ Line: 130 ]] --[[ Name: startFirstClassFetchPromises ]]
    -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), l_FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure_0 (copy), v34 (copy), v53 (copy), v36 (copy), v38 (copy), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (copy), v33 (copy), l_ApiFetchVoiceChatOptInStatus_0 (copy), l_ApiFetchGameDetails_0 (copy), l_ApiFetchGameMedia_0 (copy), l_ApiFetchAgeRecommendations_0 (copy), v40 (copy), v39 (copy), l_UiMode_0 (copy), l_BigGameIconReducer_0 (copy), l_ApiFetchBigGameIcons_0 (copy), l_GameIconReducer_0 (copy), l_ApiFetchGameIcons_0 (copy)
    local v62 = {};
    if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v59 or l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v60 then
        if not l_FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure_0 then
            v34.logFetchRequest("initial");
            if v58 then
                v34.logFetchRequest("forceRefresh");
            end;
        end;
        local v63 = nil;
        if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v59 then
            local v64 = v55:getState();
            local v65 = true;
            if v64.GameDetailsV2[v56] ~= nil then
                v65 = true;
                if v64.GameMedia[v56] ~= nil then
                    v65 = true;
                    if v64.AgeRecommendations[v56] ~= nil then
                        v65 = true;
                        if v64.GameVotes[v56] ~= nil then
                            v65 = true;
                            if v64.GameFavorites[v56] ~= nil then
                                v65 = true;
                                if v64.GameFollowings[v56] ~= nil then
                                    v65 = true;
                                    if v64.AssetTextFilterSettings[v56] ~= nil then
                                        v65 = v64.GamePrivateServersEnabled[v56] == nil;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            v63 = v65;
            if v63 and not v58 then
                v53(v64, v56);
            end;
        end;
        local v66 = nil;
        if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v60 then
            v66 = v36.checkEdpDataStaleness(v61, v38);
            if v66 then
                v34.logFetchRequest("sduiStale");
            else
                v34.logFetchRequest("sduiFresh");
            end;
        end;
        if v58 or (l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v59) and v63 or (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v60) and v66 then
            if l_FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure_0 then
                if v58 then
                    v34.logFetchRequest("forceRefresh", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v56 else nil);
                else
                    v34.logFetchRequest("initial", if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v56 else nil);
                end;
            end;
            table.insert(v62, v55:dispatch(v33.Fetch(v54, v56, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v59 else nil, if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v60 else nil)));
        end;
        if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v59 then
            if v58 or v55:getState().VoiceChatOptInStatus == nil then
                v55:dispatch(l_ApiFetchVoiceChatOptInStatus_0.Fetch(v54));
            end;
            return v62;
        end;
    end;
    if v58 or v55:getState().GameDetails[v56] == nil then
        table.insert(v62, v55:dispatch(l_ApiFetchGameDetails_0.Fetch(v54, {
            v56
        })));
    end;
    if v58 or v55:getState().VoiceChatOptInStatus == nil then
        v55:dispatch(l_ApiFetchVoiceChatOptInStatus_0.Fetch(v54));
    end;
    if v58 or v55:getState().GameMedia[v56] == nil then
        table.insert(v62, v55:dispatch(l_ApiFetchGameMedia_0.Fetch(v54, v56)));
    end;
    if v58 or v55:getState().AgeRecommendations[v56] == nil then
        table.insert(v62, v55:dispatch(l_ApiFetchAgeRecommendations_0.Fetch(v54, v56)));
    end;
    if v40() and v39() and v57 and v57.uiMode == l_UiMode_0.TenFoot and (v58 or v55:getState()[l_BigGameIconReducer_0.key][v56] == nil) then
        v55:dispatch(l_ApiFetchBigGameIcons_0(v54, {
            v56
        }));
    end;
    if v55:getState()[l_GameIconReducer_0.key][v56] == nil then
        v55:dispatch(l_ApiFetchGameIcons_0(v54, {
            v56
        }));
    end;
    return v62;
end;
local function v77(v68, v69, v70, v71, v72) --[[ Line: 278 ]] --[[ Name: startSecondClassFetchPromises ]]
    -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v32 (copy), v28 (copy), v27 (copy), l_FetchGameVotes_0 (copy), v23 (copy), v24 (copy), v25 (copy), v30 (copy), v2 (copy), v26 (copy), v29 (copy), v31 (copy), l_getAppFeaturePolicies_0 (copy), l_ApiFetchExperienceCommunityLink_0 (copy)
    if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v72 then
        if v71 or v69:getState().GamePrivateServersEnabled[v70] == nil then
            v69:dispatch(v32(v68, v70));
        end;
        if v71 or v69:getState().GameSubscriptionProducts[v70] == nil then
            v69:dispatch(v28(v68, v70));
        end;
        if v71 or v69:getState().GameDeveloperProducts[v70] == nil then
            local v73 = v69:getState();
            local v74 = v73.GameDetailsV2[v70];
            if v74 and v74.rootPlaceId and v73.LocalUserId then
                v69:dispatch(v27(v68, v70, v74.rootPlaceId, v73.LocalUserId));
            end;
        end;
        return;
    else
        if v71 or v69:getState().GameVotes[v70] == nil then
            v69:dispatch(l_FetchGameVotes_0.Fetch(v68, v70));
        end;
        if v71 or v69:getState().GameFavorites[v70] == nil then
            v69:dispatch(v23(v68, v70));
        end;
        if v71 or v69:getState().GameFollowings[v70] == nil then
            v69:dispatch(v24(v68, v70));
        end;
        if v71 or v69:getState().GameSocialLinks[v70] == nil then
            v69:dispatch(v25(v68, v70));
        end;
        if v71 or v69:getState().RecommendedGameEntries[v70] == nil then
            v69:dispatch(v30.Fetch(v68, v70, {
                maxRows = v2.Constants.MAX_RECOMMENDED_GAMES_FETCH_COUNT
            }));
        end;
        if v71 or v69:getState().GamePasses[v70] == nil then
            v69:dispatch(v26(v68, v70));
        end;
        if v71 or v69:getState().GameSubscriptionProducts[v70] == nil then
            v69:dispatch(v28(v68, v70));
        end;
        if v71 or v69:getState().GameDeveloperProducts[v70] == nil then
            local v75 = v69:getState();
            local v76 = v75.GameDetails[v70];
            if v76 and v76.rootPlaceId and v75.LocalUserId then
                v69:dispatch(v27(v68, v70, v76.rootPlaceId, v75.LocalUserId));
            end;
        end;
        if v71 or v69:getState().GameBadges[v70] == nil then
            v69:dispatch(v29(v68, v70));
        end;
        if v71 or v69:getState().AssetTextFilterSettings[v70] == nil then
            v69:dispatch(v31.Fetch(v68, v70));
        end;
        if v71 or v69:getState().GamePrivateServersEnabled[v70] == nil then
            v69:dispatch(v32(v68, v70));
        end;
        if l_getAppFeaturePolicies_0().getCommunityLinksEnabled() and (v71 or v69:getState().CommunityLinks.ExperienceCommunityLinks[v70] == nil) then
            v69:dispatch(l_ApiFetchExperienceCommunityLink_0(v68, v70));
        end;
        return;
    end;
end;
return function(v78, v79, v80, v81, v82, v83) --[[ Line: 363 ]]
    -- upvalues: l_NextDataExpirationTimeReducer_0 (copy), l_ExpirationTimeNamespace_0 (copy), l_FetchGamePlayButtonData_0 (copy), v67 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_RunService_0 (copy), l_FFlagLuaAppEdpFetchLatencyTracking_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_PromiseUtilities_0 (copy), v38 (copy), l_SetNextDataExpirationTime_0 (copy), v77 (copy), v49 (ref), v35 (copy), v50 (ref)
    if type(v79) ~= "string" then
        error(string.format("FetchGameDetailsPageData thunk expects universeId to be a string. Got type: '%s', value: '%s'", type(v79), (tostring(v79))));
    end;
    return function(v84) --[[ Line: 381 ]]
        -- upvalues: l_NextDataExpirationTimeReducer_0 (ref), l_ExpirationTimeNamespace_0 (ref), v79 (copy), l_FetchGamePlayButtonData_0 (ref), v78 (copy), v67 (ref), v80 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v81 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v82 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), v83 (copy), l_RunService_0 (ref), l_FFlagLuaAppEdpFetchLatencyTracking_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_PromiseUtilities_0 (ref), v38 (ref), l_SetNextDataExpirationTime_0 (ref), v77 (ref), v49 (ref), v35 (ref), v50 (ref)
        local v85 = false;
        local v86 = tick();
        local v87 = nil;
        local v88 = v84:getState().Personalization[l_NextDataExpirationTimeReducer_0.key][l_ExpirationTimeNamespace_0.GameDetailPage];
        if v88 then
            v87 = v88[v79];
        end;
        if v87 == nil or v87 < v86 then
            v85 = true;
        end;
        v84:dispatch(l_FetchGamePlayButtonData_0.Fetch(v78, v79));
        local v89 = v67(v78, v84, v79, v80, v85, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v81 else nil, if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v82 else nil, if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v82 then v83 else nil);
        if #v89 > 0 then
            local v90 = nil;
            if _G.__TESTEZ_RUNNING_TEST__ or l_RunService_0:IsStudio() then
                v90 = warn;
            end;
            local v91 = nil;
            local v92 = nil;
            if l_FFlagLuaAppEdpFetchLatencyTracking_0 then
                v91 = (not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v81) and 2 or 1;
                v92 = tick();
            end;
            return l_PromiseUtilities_0.Batch(v89, v90):andThen(function(v93) --[[ Line: 430 ]]
                -- upvalues: l_PromiseUtilities_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v81 (ref), v84 (copy), v79 (ref), v86 (ref), v87 (ref), v38 (ref), l_SetNextDataExpirationTime_0 (ref), l_ExpirationTimeNamespace_0 (ref), v77 (ref), v78 (ref), v85 (ref)
                l_PromiseUtilities_0.CountResults(v93);
                local _ = nil;
                if (if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v81 then v84:getState().GameDetailsV2[v79] else v84:getState().GameDetails[v79]) ~= nil then
                    v86 = tick();
                    v87 = math.floor(v86 + v38);
                    v84:dispatch(l_SetNextDataExpirationTime_0(v79, v87, l_ExpirationTimeNamespace_0.GameDetailPage));
                end;
                v77(v78, v84, v79, v85, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v81 else nil);
            end):finally(function() --[[ Line: 465 ]]
                -- upvalues: l_FFlagLuaAppEdpFetchLatencyTracking_0 (ref), v49 (ref), v92 (ref), v35 (ref), v91 (ref), v79 (ref), v50 (ref)
                if l_FFlagLuaAppEdpFetchLatencyTracking_0 and v49 and v92 then
                    local v95 = (tick() - v92) * 1000;
                    v35.default:logRobloxTelemetryEvent(v49, nil, {
                        latencyMs = v95, 
                        backendVersion = v91, 
                        universeId = v79
                    });
                    return;
                else
                    if l_FFlagLuaAppEdpFetchLatencyTracking_0 and v50 then
                        v35.default:logRobloxTelemetryEvent(v50, nil, {
                            universeId = v79
                        });
                    end;
                    return;
                end;
            end);
        else
            v77(v78, v84, v79, v85, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v81 else nil);
            return;
        end;
    end;
end;