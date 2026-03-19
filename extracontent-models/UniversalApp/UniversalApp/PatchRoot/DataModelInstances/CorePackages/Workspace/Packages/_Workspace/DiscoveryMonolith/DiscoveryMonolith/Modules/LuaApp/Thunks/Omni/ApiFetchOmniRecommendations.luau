local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Signals_0 = require(l_Parent_0.DiscoveryAvailability).Signals;
local l_GameSortLoadSource_0 = require(l_Parent_0.DiscoveryAvailability).GameSortLoadSource;
local v6 = require(l_Parent_0.TopicInfosRodux);
local l_TopicInfoModel_0 = v6.TopicInfoModel;
local l_AddTopicInfos_0 = v6.AddTopicInfos;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_MakeOmniRecommendationsRequest_0 = require(l_Parent_0.GraphQlShared).MakeOmniRecommendationsRequest;
local v12 = require(l_Parent_0.Promise);
local v13 = require(l_Parent_0.DiscoveryTypes);
local l_OmniFeedTypes_0 = v13.OmniFeedTypes;
local _ = v13.OmniFeedConstants;
local v16 = require(l_Parent_0.DiscoveryUtils);
local l_OmniRecommendationsPageType_0 = v16.OmniRecommendationsPageType;
local l_DiscoveryClientAppStorage_0 = v16.DiscoveryClientAppStorage;
local l_HomeOmniFeedCache_0 = v16.HomeOmniFeedCache;
local l_makeDiscoveryNetworkCallWithCacheFallback_0 = v16.makeDiscoveryNetworkCallWithCacheFallback;
local v21 = require(l_Parent_0.FetchStatusRodux);
local l_FetchStatusReducer_0 = v21.FetchStatusReducer;
local l_FetchStatusNamespace_0 = v21.FetchStatusNamespace;
local l_SetFetchStatus_0 = v21.SetFetchStatus;
local l_AddSduiRootConfig_0 = require(l_Parent_0.ServerDrivenUi).AddSduiRootConfig;
local l_SduiErrors_0 = require(l_Parent_0.ServerDrivenUi).SduiErrors;
local l_SduiLogger_0 = require(l_Parent_0.ServerDrivenUi).SduiLogger;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v30 = require(l_Modules_0.Personalization.Games.DataStore.GenerateTopicContents);
local v31 = require(l_Modules_0.LuaApp.Actions.Games.AddOmniRecommendations);
local v32 = require(l_Modules_0.LuaApp.Thunks.Omni.parseAndAddContentMetadata);
local v33 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.OmniRecommendations);
local v34 = require(l_Modules_0.LuaApp.Actions.Games.SetOmniRecommendationsRefreshTime);
local v35 = require(l_Modules_0.Personalization.Sessions.DataStore.SetPageSessionTimestamp);
local v36 = require(l_Modules_0.LuaApp.Flags.GetFFlagFixFetchNextOmniWithoutPageToken);
local l_FFlagEnableContextFeaturesForOmniRecommendations_0 = require(l_Parent_0.SharedFlags).FFlagEnableContextFeaturesForOmniRecommendations;
local l_FStringLuaEnabledSduiTreatmentTypes_0 = require(l_Parent_0.SharedFlags).FStringLuaEnabledSduiTreatmentTypes;
local l_HomePageDataSourceType_0 = l_Signals_0.HomePageDataSourceType;
local l_GameSortLoadSourceType_0 = l_GameSortLoadSource_0.GameSortLoadSourceType;
local function v43(v41, v42) --[[ Line: 48 ]]
    -- upvalues: l_SetFetchStatus_0 (copy), l_FetchStatusNamespace_0 (copy)
    return l_SetFetchStatus_0(l_FetchStatusNamespace_0.OmniRecommendations, v41, v42);
end;
local function v53() --[[ Line: 52 ]] --[[ Name: getSupportedSduiTreatmentTypes ]]
    -- upvalues: l_RunService_0 (copy), l_FStringLuaEnabledSduiTreatmentTypes_0 (copy)
    local l_l_RunService_0_RobloxVersion_0 = l_RunService_0:GetRobloxVersion();
    local v45 = tonumber(string.match(l_l_RunService_0_RobloxVersion_0, ".(%d+)."));
    local v46 = {};
    local v47 = string.split(l_FStringLuaEnabledSduiTreatmentTypes_0, ",");
    for _, v49 in ipairs(v47) do
        if v49 ~= "" then
            local v50, v51 = string.match(v49, "(.*):(.*)");
            local v52 = tonumber(v51);
            if v50 and v52 and v52 <= v45 then
                table.insert(v46, v50);
            end;
        end;
    end;
    return v46;
end;
local function v57(v54) --[[ Line: 70 ]]
    local v55 = v54:getState();
    local v56 = v55.Squad and v55.Squad.Squad and v55.Squad.Squad.currentSquad;
    if v56 and v56.members then
        return {
            party_size = #v56.members
        };
    else
        return nil;
    end;
end;
local function v100(v58, v59, _, v61, v62, v63, v64, v65, v66, v67) --[[ Line: 81 ]] --[[ Name: fetchOmni ]]
    -- upvalues: l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy), l_RetrievalStatus_0 (copy), v12 (copy), v43 (copy), l_HttpService_0 (copy), v36 (copy), l_OmniFeedTypes_0 (copy), v53 (copy), l_mutedError_0 (copy), l_FFlagEnableContextFeaturesForOmniRecommendations_0 (copy), v57 (copy), l_MakeOmniRecommendationsRequest_0 (copy), l_makeDiscoveryNetworkCallWithCacheFallback_0 (copy), v16 (copy), l_DiscoveryClientAppStorage_0 (copy), l_HomeOmniFeedCache_0 (copy), l_OmniRecommendationsPageType_0 (copy), l_SduiLogger_0 (copy), l_Signals_0 (copy), l_HomePageDataSourceType_0 (copy), v32 (copy), v13 (copy), v33 (copy), v31 (copy), l_SduiErrors_0 (copy), l_TopicInfoModel_0 (copy), l_GameSortLoadSource_0 (copy), l_GameSortLoadSourceType_0 (copy), l_AddTopicInfos_0 (copy), v30 (copy), v34 (copy), l_AppPage_0 (copy), v35 (copy), l_AddSduiRootConfig_0 (copy)
    if v58:getState().Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.OmniRecommendations][v61] == l_RetrievalStatus_0.Fetching then
        return v12.resolve("Data is fetching");
    else
        v58:dispatch(v43(v61, l_RetrievalStatus_0.Fetching));
        local v68 = nil;
        v68 = v63 or l_HttpService_0:GenerateGUID(false):lower();
        local v69 = nil;
        if v62 then
            local v70 = v58:getState().OmniRecommendations[v61];
            if v70 then
                v69 = v70.nextPageToken;
                v68 = v70.omniSessionId;
            end;
            if v36() and (v69 == nil or v69 == "") then
                v58:dispatch(v43(v61, l_RetrievalStatus_0.Done));
                return v12.resolve("nextPageToken is empty");
            end;
        end;
        local v71 = {};
        for _, v73 in pairs(l_OmniFeedTypes_0) do
            table.insert(v71, v73);
        end;
        if v67 == nil then
            local l_status_0, l_result_0 = pcall(v53);
            if l_status_0 then
                v67 = l_result_0;
            else
                l_mutedError_0("Failed to get supported SDUI treatment types: ");
            end;
        end;
        local _ = nil;
        local v77 = nil;
        if l_FFlagEnableContextFeaturesForOmniRecommendations_0 then
            v77 = v57(v58);
        end;
        local v78 = l_MakeOmniRecommendationsRequest_0(v59, v61, v68, v69, v71, v64, nil, v67, v77);
        return (if v66 then l_makeDiscoveryNetworkCallWithCacheFallback_0(v78:catch(function(v79) --[[ Line: 160 ]]
            -- upvalues: v16 (ref), v65 (copy), v12 (ref)
            v16.logResponseError("discovery-api/omni-recommendation", v79, v65);
            return v12.reject(v79);
        end), l_DiscoveryClientAppStorage_0.CacheKey.HomeOmniFeedCache, l_HomeOmniFeedCache_0.HOME_OMNI_FEED_CACHE_VERSION) else v78):andThen(function(v80) --[[ Line: 172 ]]
            -- upvalues: v16 (ref), v65 (copy), v58 (copy), v43 (ref), v61 (copy), l_RetrievalStatus_0 (ref), v12 (ref), l_OmniRecommendationsPageType_0 (ref), l_SduiLogger_0 (ref), l_HomeOmniFeedCache_0 (ref), l_Signals_0 (ref), l_HomePageDataSourceType_0 (ref), v68 (ref), l_HttpService_0 (ref), v32 (ref), v59 (copy), v13 (ref), v33 (ref), v62 (copy), v31 (ref), l_OmniFeedTypes_0 (ref), l_SduiErrors_0 (ref), l_TopicInfoModel_0 (ref), l_GameSortLoadSource_0 (ref), l_GameSortLoadSourceType_0 (ref), l_AddTopicInfos_0 (ref), v30 (ref), v34 (ref), l_AppPage_0 (ref), v35 (ref), l_AddSduiRootConfig_0 (ref)
            if not v80.isFromCache then
                v16.logResponseTelemetry("discovery-api/omni-recommendation", v80, v65);
            end;
            local l_responseBody_0 = v80.responseBody;
            if l_responseBody_0 == nil or l_responseBody_0.sorts == nil or #l_responseBody_0.sorts == 0 then
                v58:dispatch(v43(v61, l_RetrievalStatus_0.Failed));
                return v12.reject("No sort data found in response.");
            elseif l_OmniRecommendationsPageType_0.toAppPage(l_responseBody_0.pageType) ~= v61 then
                v58:dispatch(v43(v61, l_RetrievalStatus_0.Failed));
                return v12.reject("Wrong sort data found in response.");
            else
                l_SduiLogger_0.reportOmniFeedStats(l_responseBody_0.sorts, l_responseBody_0.sdui, v61);
                if not v80.isFromCache then
                    l_HomeOmniFeedCache_0.cacheOmniRecommendationsData(l_responseBody_0);
                end;
                l_Signals_0.getCacheStore().setHomePageDataSource(if v80.isFromCache then l_HomePageDataSourceType_0.Cache else l_HomePageDataSourceType_0.API);
                if v80.isFromCache then
                    v68 = l_HttpService_0:GenerateGUID(false):lower();
                end;
                local v82 = v32(v59, v58, l_responseBody_0);
                v82[v13.OmniRecommendationsContentType.Game] = nil;
                v33.fromJsonData(l_responseBody_0, v68):match(function(v83) --[[ Line: 215 ]]
                    -- upvalues: v62 (ref), v82 (copy), v58 (ref), v31 (ref), l_OmniFeedTypes_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), v61 (ref), l_TopicInfoModel_0 (ref), l_GameSortLoadSource_0 (ref), v80 (copy), l_GameSortLoadSourceType_0 (ref), l_AddTopicInfos_0 (ref), v30 (ref), v34 (ref), v43 (ref), l_RetrievalStatus_0 (ref), l_AppPage_0 (ref), v35 (ref), l_AddSduiRootConfig_0 (ref)
                    local v84 = nil;
                    if not v62 then
                        v84 = tick();
                    end;
                    v83.metadata = v82;
                    v58:dispatch(v31(v83, v62));
                    local v85 = {};
                    local v86 = {};
                    if v83.sorts then
                        for v87, v88 in v83.sorts do
                            local v89 = v88.treatmentType == l_OmniFeedTypes_0.ServerDrivenUi;
                            local v90 = false;
                            if v88.feedItemKey ~= nil then
                                v90 = v88.feedItemKey ~= "";
                            end;
                            if v89 and v90 then
                                table.insert(v85, {
                                    feedItemKey = v88.feedItemKey, 
                                    topicId = v88.topicId, 
                                    sortIndex = v87
                                });
                            elseif v89 then
                                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.NilFeedItemKeyForSduiSort, {
                                    name = ("%*"):format(v88.topicId), 
                                    message = ("Sdui treatmentType but no feedItemKey for topicId %* at index %*"):format(v88.topicId, v87)
                                }, v61);
                            elseif v90 then
                                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.InvalidTreatmentTypeWithFeedItemKey, {
                                    name = ("%*"):format(v88.topicId), 
                                    message = ("Has sdui feedItemKey %* but treatmentType %* for topicId %* at index %*"):format(v88.feedItemKey, v88.treatmentType, v88.topicId, v87)
                                }, v61);
                            end;
                            local v91 = l_TopicInfoModel_0.fromOmniApi(v88);
                            v86[#v86 + 1] = v91;
                            l_GameSortLoadSource_0.setSortLoadSource(v88.topicId, if v80.isFromCache then l_GameSortLoadSourceType_0.ClientFallbackCache else l_GameSortLoadSourceType_0.API);
                        end;
                    end;
                    v58:dispatch(l_AddTopicInfos_0(v86));
                    v58:dispatch(v30(v61, nil, v84));
                    v58:dispatch(v34(v61, v83.sortsExpirationTime));
                    v58:dispatch(v43(v61, l_RetrievalStatus_0.Done));
                    if v61 == l_AppPage_0.Home and not v62 then
                        v58:dispatch(v35(l_AppPage_0.Home));
                    end;
                    if v83.sdui then
                        local v92;
                        v86, v92 = pcall(function() --[[ Line: 286 ]]
                            -- upvalues: v58 (ref), l_AddSduiRootConfig_0 (ref), v61 (ref), v83 (copy), v85 (copy)
                            v58:dispatch(l_AddSduiRootConfig_0(v61, v83.sdui, tick(), v85));
                        end);
                        if not v86 then
                            local v93 = "";
                            if #v85 > 0 then
                                for _, v95 in v85 do
                                    v93 = ("%* %*"):format(v93, v95.topicId);
                                end;
                            end;
                            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.ErrorStoringOmniData, {
                                name = "discovery-api/omni-recommendation", 
                                message = ("Error storing omni response: %* topicIds: %*"):format(v92, v93)
                            }, v61);
                            return;
                        end;
                    elseif #v85 > 0 then
                        v86 = "";
                        for _, v97 in v85 do
                            v86 = ("%* %*"):format(v86, v97.topicId);
                        end;
                        l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.NilSduiTreeInResponse, {
                            name = "discovery-api/omni-recommendation", 
                            message = ("Has sdui sorts, but no sdui tree in response. topicIds: %*"):format(v86)
                        }, v61);
                    end;
                end):matchError(function(v98) --[[ Line: 312 ]]
                    -- upvalues: v58 (ref), v43 (ref), v61 (ref), l_RetrievalStatus_0 (ref)
                    v58:dispatch(v43(v61, l_RetrievalStatus_0.Failed));
                    warn(v98);
                end);
                return v12.resolve();
            end;
        end, function(v99) --[[ Line: 317 ]]
            -- upvalues: v66 (copy), v16 (ref), v65 (copy), v58 (copy), v43 (ref), v61 (copy), l_RetrievalStatus_0 (ref), v12 (ref)
            if not v66 then
                v16.logResponseError("discovery-api/omni-recommendation", v99, v65);
            end;
            v58:dispatch(v43(v61, l_RetrievalStatus_0.Failed));
            return v12.reject(v99);
        end);
    end;
end;
return function(v101, v102, v103, v104, v105, v106, v107, v108) --[[ Line: 327 ]]
    -- upvalues: v100 (copy)
    return function(v109) --[[ Line: 337 ]]
        -- upvalues: v100 (ref), v101 (copy), v102 (copy), v103 (copy), v104 (copy), v105 (copy), v106 (copy), v107 (copy), v108 (copy)
        return v100(v109, v101, v102, v103, v104, v105, v106, v107, v108);
    end;
end;