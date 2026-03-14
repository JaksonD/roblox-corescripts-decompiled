local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_Parent_0.DiscoveryUtils);
local l_TopicContentsReducer_0 = require(l_Parent_0.TopicContentsRodux).TopicContentsReducer;
local v7 = require(l_Parent_0.LoggingProtocol);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v9 = require(l_Modules_0.LuaApp.Http.Requests.DiscoveryApi.OmniGetRecommendationsMetadata);
local v10 = require(l_Modules_0.LuaApp.Actions.Games.SetOmniRecommendationsMetadataRequestStatus);
local v11 = require(l_Modules_0.LuaApp.Util.Omni.OmniUtils);
local v12 = require(l_Modules_0.Personalization.Games.DataStore.GenerateTopicContents);
local v13 = require(l_Modules_0.LuaApp.Thunks.Omni.parseAndAddContentMetadata);
local l_FFlagLuaAppLogOmniRecommendationsMetadata_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLogOmniRecommendationsMetadata;
local v15 = game:DefineFastInt("OmniRecommendationsMetadataEventThrottlingHundredthsPercent", 0);
local function _(v16, v17, v18) --[[ Line: 24 ]] --[[ Name: itemForId ]]
    -- upvalues: v11 (copy)
    local v19 = v11.storeForContentType(v16, v17);
    if v19 == nil then
        return nil;
    else
        assert(v19, "store should always exist after this point");
        return v19[tostring(v18)];
    end;
end;
local function _(v21, v22, v23) --[[ Line: 34 ]] --[[ Name: getFetchingStatus ]]
    if v21.RequestsStatus.OmniRecommendationsMetadataRetrievalStatus == nil then
        return nil;
    else
        local v24 = v21.RequestsStatus.OmniRecommendationsMetadataRetrievalStatus[v22];
        if v24 == nil then
            return nil;
        else
            return v24[tostring(v23)];
        end;
    end;
end;
local function v64(v26, v27, v28, v29, v30, v31, v32) --[[ Line: 45 ]] --[[ Name: fetchOmniMetadata ]]
    -- upvalues: v4 (copy), l_TopicContentsReducer_0 (copy), l_RetrievalStatus_0 (copy), v11 (copy), v10 (copy), l_FFlagLuaAppLogOmniRecommendationsMetadata_0 (copy), v15 (copy), v7 (copy), v9 (copy), v5 (copy), v13 (copy), v12 (copy)
    local v33 = v26:getState();
    local v34 = v33.OmniRecommendations and v33.OmniRecommendations[v28] and v33.OmniRecommendations[v28].sorts[v29] or nil;
    if not v34 then
        return v4.reject("pageType, sortIndex combo doesn't exist");
    else
        assert(v34, "OmniRecommendations sort should always exist");
        local v35 = nil;
        local l_topicId_0 = v34.topicId;
        if l_topicId_0 == nil then
            return v4.reject("TopicId for sortIndex " .. tostring(v29) .. " doesn't exist");
        else
            l_topicId_0 = tostring(l_topicId_0);
            v35 = v33.Personalization[l_TopicContentsReducer_0.key][l_topicId_0];
            if not v35 then
                return v4.reject("TopicContents for id: " .. l_topicId_0 .. " doesn't exist");
            else
                assert(v35, "sortIndexContents always exists after this point");
                if not v35.hasMoreRows then
                    return v4.resolve("no more rows to fetch");
                elseif not v34.recommendations then
                    return v4.reject((("No recommendations for sort index %*"):format(v29)));
                else
                    local v37 = {};
                    local v38 = #v35.entries + 1;
                    for v39 = v38, math.min(v38 + v30, #v34.recommendations) do
                        local v40 = v34.recommendations[v39];
                        local l_contentType_0 = v40.contentType;
                        local l_contentId_0 = v40.contentId;
                        local v43;
                        if v33.RequestsStatus.OmniRecommendationsMetadataRetrievalStatus == nil then
                            v43 = nil;
                        else
                            local v44 = v33.RequestsStatus.OmniRecommendationsMetadataRetrievalStatus[l_contentType_0];
                            v43 = if v44 == nil then nil else v44[tostring(l_contentId_0)];
                        end;
                        l_contentType_0 = false;
                        if v43 ~= nil then
                            l_contentType_0 = v43 == l_RetrievalStatus_0.Fetching;
                        end;
                        local l_contentType_1 = v40.contentType;
                        local l_contentId_1 = v40.contentId;
                        local v47 = v11.storeForContentType(v33, l_contentType_1);
                        if v47 == nil then
                            l_contentId_0 = nil;
                        else
                            assert(v47, "store should always exist after this point");
                            l_contentId_0 = v47[tostring(l_contentId_1)];
                        end;
                        if l_contentId_0 == nil and not l_contentType_0 then
                            table.insert(v37, v40);
                        end;
                    end;
                    if #v37 == 0 then
                        return v4.resolve("nothing new to fetch");
                    else
                        local v48 = {};
                        for _, v50 in ipairs(v37) do
                            if v48[v50.contentType] == nil then
                                v48[v50.contentType] = {};
                            end;
                            v48[v50.contentType][tostring(v50.contentId)] = l_RetrievalStatus_0.Fetching;
                        end;
                        v26:dispatch(v10(v48));
                        if l_FFlagLuaAppLogOmniRecommendationsMetadata_0 then
                            v31:logRobloxTelemetryEvent({
                                eventName = "OmniRecommendationsMetadataRequestEvent", 
                                backends = {
                                    "Points", 
                                    "EventIngest"
                                }, 
                                throttlingPercentage = v15
                            }, {
                                v7.StandardizedFields.addOsInfo, 
                                v7.StandardizedFields.addSessionId, 
                                "addSessionInfo"
                            }, {
                                pageType = v28, 
                                sortIndex = v29, 
                                countToFetch = v30, 
                                numberOfIdsToRequest = #v37, 
                                sortHasMoreRows = v35.hasMoreRows, 
                                sortNextPageToken = v35.nextPageToken or "none", 
                                callsite = v32
                            });
                        end;
                        return v9(v27, v37):andThen(function(v51) --[[ Line: 136 ]]
                            -- upvalues: v5 (ref), v31 (copy), v13 (ref), v27 (copy), v26 (copy), v12 (ref), v28 (copy), l_topicId_0 (ref), l_FFlagLuaAppLogOmniRecommendationsMetadata_0 (ref), v15 (ref), v7 (ref), v48 (copy), l_RetrievalStatus_0 (ref), v10 (ref), v4 (ref)
                            v5.logResponseTelemetry("discovery-api/omni-recommendation-metadata", v51, v31);
                            local l_responseBody_0 = v51.responseBody;
                            local v53 = v13(v27, v26, l_responseBody_0);
                            v26:dispatch(v12(v28, l_topicId_0));
                            if l_FFlagLuaAppLogOmniRecommendationsMetadata_0 then
                                v31:logRobloxTelemetryEvent({
                                    eventName = "OmniRecommendationsMetadataResponseEvent", 
                                    backends = {
                                        "Points", 
                                        "EventIngest"
                                    }, 
                                    throttlingPercentage = v15
                                }, {
                                    v7.StandardizedFields.addOsInfo, 
                                    v7.StandardizedFields.addSessionId, 
                                    "addSessionInfo"
                                }, {
                                    numberOfContent = v53 and tostring(#v53) or "no content"
                                });
                            end;
                            local v54 = {};
                            for v55, v56 in pairs(v48) do
                                v54[v55] = {};
                                for v57, _ in pairs(v56) do
                                    v54[v55][tostring(v57)] = l_RetrievalStatus_0.Failed;
                                end;
                            end;
                            for v59, v60 in pairs(v53) do
                                if not v54[v59] then
                                    v54[v59] = {};
                                end;
                                for v61, _ in pairs(v60) do
                                    v54[v59][tostring(v61)] = l_RetrievalStatus_0.Done;
                                end;
                            end;
                            v26:dispatch(v10(v54));
                            return v4.resolve();
                        end, function(v63) --[[ Line: 179 ]]
                            -- upvalues: v26 (copy), v10 (ref), v37 (copy), l_RetrievalStatus_0 (ref), v4 (ref)
                            v26:dispatch(v10(v37, l_RetrievalStatus_0.Failed));
                            warn(v63);
                            return v4.reject(v63);
                        end);
                    end;
                end;
            end;
        end;
    end;
end;
return function(v65, v66, v67, v68, v69, v70) --[[ Line: 186 ]]
    -- upvalues: v64 (copy), l_FFlagLuaAppLogOmniRecommendationsMetadata_0 (copy)
    return function(v71) --[[ Line: 187 ]]
        -- upvalues: v64 (ref), v65 (copy), v66 (copy), v67 (copy), v68 (copy), v69 (copy), l_FFlagLuaAppLogOmniRecommendationsMetadata_0 (ref), v70 (copy)
        return v64(v71, v65, v66, v67, v68, v69, if l_FFlagLuaAppLogOmniRecommendationsMetadata_0 then v70 else nil);
    end;
end;