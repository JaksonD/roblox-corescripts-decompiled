local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedUtilities");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Signals);
local v5 = require(l_Parent_0.SduiCoreSystem);
local l_SduiErrors_0 = v5.SduiErrors;
local l_SduiLogger_0 = v5.SduiLogger;
local l_SduiParseHelpers_0 = v5.SduiParseHelpers;
local v9 = require(l_Parent_0.Promise);
local v10 = require(l_Parent_0.DataHydration);
local l_createDataCache_0 = v10.createDataCache;
local l_createDataResolver_0 = v10.createDataResolver;
local v13 = require(l_script_FirstAncestor_0.SduiIntegrationTypes);
local l_SduiRequestStatus_0 = v13.SduiRequestStatus;
local _ = require(l_script_FirstAncestor_0.SduiLoadTimer);
local v16 = require(l_script_FirstAncestor_0.SduiProtobufResponseHelpers);
local l_makeProtoResponseDecoder_0 = v16.makeProtoResponseDecoder;
local l_makeProtobufJsonResponseDecoder_0 = v16.makeProtobufJsonResponseDecoder;
local l_SduiResponseType_0 = v13.SduiResponseType;
local v20 = require(l_script_FirstAncestor_0.handleSduiApiResponse);
local v21 = require(l_script_FirstAncestor_0.SduiPageAnalytics);
local v22 = require(l_script_FirstAncestor_0.SduiApiStorePostConfig);
local l_FFlagSduiProtobufJsonDecode_0 = require(l_Parent_0.SharedFlags).FFlagSduiProtobufJsonDecode;
local v24 = game:DefineFastFlag("SduiEnableClearOnEmptyResponse", false);
local l_FFlagSduiAllowNoConfigsBuilt_0 = require(l_Parent_0.SharedFlags).FFlagSduiAllowNoConfigsBuilt;
local l_FFlagSduiChartsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiChartsSupport;
local l_FFlagSduiConfigFetchTakesPostBody_0 = require(l_Parent_0.SharedFlags).FFlagSduiConfigFetchTakesPostBody;
return function() --[[ Line: 82 ]] --[[ Name: createSduiApiStore ]]
    -- upvalues: l_createDataCache_0 (copy), v4 (copy), v9 (copy), l_FFlagSduiProtobufJsonDecode_0 (copy), l_SduiResponseType_0 (copy), l_FFlagSduiConfigFetchTakesPostBody_0 (copy), l_HttpService_0 (copy), v22 (copy), v21 (copy), l_SduiRequestStatus_0 (copy), l_SduiLogger_0 (copy), l_SduiErrors_0 (copy), l_FFlagSduiChartsSupport_0 (copy), l_makeProtobufJsonResponseDecoder_0 (copy), l_makeProtoResponseDecoder_0 (copy), v20 (copy), v16 (copy), l_FFlagSduiAllowNoConfigsBuilt_0 (copy), l_SduiParseHelpers_0 (copy), v24 (copy), v3 (copy), l_createDataResolver_0 (copy)
    local v28 = l_createDataCache_0();
    local v29 = {};
    local v30 = {};
    local v31 = {};
    local function _(v32, v33, v34) --[[ Line: 96 ]] --[[ Name: completeActiveRequest ]]
        -- upvalues: v31 (copy)
        local v35 = v31[v32];
        if v35 then
            v31[v32] = nil;
            if v33 then
                v35.resolve(v34);
                return;
            else
                v35.reject(v34);
            end;
        end;
    end;
    local v37 = {};
    local function v42(v38) --[[ Line: 114 ]] --[[ Name: getInputDataSignals ]]
        -- upvalues: v37 (copy), v4 (ref)
        local v39 = v37[v38];
        if v39 == nil then
            local v40, v41 = v4.createSignal(nil);
            v39 = {
                get = v40, 
                set = v41
            };
            v37[v38] = v39;
        end;
        return v39;
    end;
    local function v80(v43, v44) --[[ Line: 130 ]] --[[ Name: fetchFunction ]]
        -- upvalues: v29 (copy), v9 (ref), l_FFlagSduiProtobufJsonDecode_0 (ref), l_SduiResponseType_0 (ref), l_FFlagSduiConfigFetchTakesPostBody_0 (ref), l_HttpService_0 (ref), v22 (ref), v30 (copy), v21 (ref), l_SduiRequestStatus_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), l_FFlagSduiChartsSupport_0 (ref), v31 (copy), l_makeProtobufJsonResponseDecoder_0 (ref), l_makeProtoResponseDecoder_0 (ref), v20 (ref), v16 (ref), v42 (copy), l_FFlagSduiAllowNoConfigsBuilt_0 (ref), l_SduiParseHelpers_0 (ref), v24 (ref), v3 (ref)
        local v45 = v29[v43];
        if not v45 then
            return v9.reject("No request config for key", v43);
        else
            local l_url_0 = v45.url;
            local l_loadTimer_0 = v45.loadTimer;
            l_loadTimer_0.logUiRequestSent();
            local v48 = l_FFlagSduiProtobufJsonDecode_0 and v45.responseType == l_SduiResponseType_0.ProtobufJson;
            local l_postConfig_0 = v45.postConfig;
            local v50 = l_FFlagSduiConfigFetchTakesPostBody_0 and l_postConfig_0 and "POST" or "GET";
            local v51 = l_HttpService_0:RequestInternal({
                Url = l_url_0, 
                Method = v50, 
                Headers = {
                    Accept = v48 and "application/json" or "application/x-protobuf", 
                    ["Content-Type"] = if l_FFlagSduiConfigFetchTakesPostBody_0 and l_postConfig_0 then v22.getContentTypeHeaderFromPostConfig(l_postConfig_0) else nil
                }, 
                Body = if l_FFlagSduiConfigFetchTakesPostBody_0 and l_postConfig_0 then v22.getBodyFromPostConfig(l_postConfig_0) else nil
            });
            return v9.new(function(v52, v53) --[[ Line: 162 ]]
                -- upvalues: v51 (copy), l_loadTimer_0 (copy), v30 (ref), v43 (copy), v21 (ref), v45 (copy), l_SduiRequestStatus_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), l_url_0 (copy), l_FFlagSduiChartsSupport_0 (ref), v31 (ref), v48 (copy), l_makeProtobufJsonResponseDecoder_0 (ref), l_makeProtoResponseDecoder_0 (ref), v44 (copy), v20 (ref), v16 (ref), v42 (ref), l_FFlagSduiAllowNoConfigsBuilt_0 (ref), l_SduiParseHelpers_0 (ref), v24 (ref), v3 (ref)
                v51:Start(function(v54, v55) --[[ Line: 163 ]]
                    -- upvalues: l_loadTimer_0 (ref), v30 (ref), v43 (ref), v21 (ref), v45 (ref), l_SduiRequestStatus_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), l_url_0 (ref), l_FFlagSduiChartsSupport_0 (ref), v31 (ref), v53 (copy), v48 (ref), l_makeProtobufJsonResponseDecoder_0 (ref), l_makeProtoResponseDecoder_0 (ref), v44 (ref), v20 (ref), v16 (ref), v42 (ref), l_FFlagSduiAllowNoConfigsBuilt_0 (ref), l_SduiParseHelpers_0 (ref), v24 (ref), v3 (ref), v52 (copy)
                    l_loadTimer_0.logUiResponseReceived();
                    v30[v43] = false;
                    v21.sendPageStatusEvent(v45.surfaceKey, v55.StatusCode, v55.HttpError);
                    if v54 then
                        local v56 = if v55.StatusCode then tonumber(v55.StatusCode) else nil;
                        if v56 and v56 >= 400 or v55.HttpError and v55.HttpError ~= Enum.HttpError.OK then
                            l_loadTimer_0.updateRequestStatus(l_SduiRequestStatus_0.FailedToLoad);
                            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToFetchPage, {
                                message = ("Http request not successful for %* StatusCode %* HttpError %*"):format(l_url_0, v55.StatusCode, v55.HttpError), 
                                name = v45.surfaceKey
                            }, v45.surfaceKey);
                            if l_FFlagSduiChartsSupport_0 then
                                local l_v43_0 = v43;
                                local v58 = v31[l_v43_0];
                                if v58 then
                                    v31[l_v43_0] = nil;
                                    v58.reject(v55);
                                end;
                            end;
                            return v53(v55);
                        else
                            l_loadTimer_0.updateRequestStatus(l_SduiRequestStatus_0.LoadedFromNetwork);
                            v21.sendPagePayloadSizeEvent(v45.surfaceKey, v55.Body);
                            local v59 = if v48 then l_makeProtobufJsonResponseDecoder_0(v45.apiProto) else l_makeProtoResponseDecoder_0(v45.apiProto);
                            local l_status_0, l_result_0 = pcall(function() --[[ Line: 203 ]]
                                -- upvalues: v45 (ref), v44 (ref), v20 (ref), v55 (copy), l_loadTimer_0 (ref), v59 (copy), v16 (ref), v42 (ref), l_FFlagSduiAllowNoConfigsBuilt_0 (ref)
                                local v60 = v45.isPaginated and v44.data(false) ~= nil;
                                return v20({
                                    response = v55, 
                                    loadTimer = l_loadTimer_0, 
                                    surfaceKey = v45.surfaceKey, 
                                    configCacheKey = v45.configKey, 
                                    decodeResponse = v59, 
                                    parseHydrationDataFromResponse = v16.parseHydrationDataFromResponse, 
                                    parseTemplateEntriesFromResponse = v16.parseTemplateEntriesFromResponse, 
                                    parsePageEntriesFromResponse = v16.parsePageEntriesFromResponse, 
                                    getInputDataSignalsForRequest = v42, 
                                    paginateResponse = v60, 
                                    buildNextPageUrl = v45.buildNextPageUrl, 
                                    allowNoConfigsBuilt = if l_FFlagSduiAllowNoConfigsBuilt_0 then v45.allowNoConfigsBuilt else nil
                                });
                            end);
                            if not l_status_0 then
                                local v63 = l_SduiParseHelpers_0.stringifyValue(l_result_0);
                                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToFetchPage, {
                                    message = ("handleSduiApiResponse not successful for %* err %*"):format(l_url_0, v63), 
                                    name = v45.surfaceKey
                                }, v45.surfaceKey);
                                if l_FFlagSduiChartsSupport_0 then
                                    local l_v43_1 = v43;
                                    local v65 = v31[l_v43_1];
                                    if v65 then
                                        v31[l_v43_1] = nil;
                                        v65.reject(l_result_0);
                                    end;
                                end;
                                return v53(v44);
                            else
                                local v66 = {};
                                if v24 then
                                    if next(l_result_0) then
                                        local v67 = v44.data(false);
                                        for v68, v69 in l_result_0 do
                                            local v70 = v67 and v67[v68];
                                            v66[v68] = if v70 then v3.Dictionary.join(v70, v69) else v69;
                                        end;
                                    elseif v45.clearOnEmptyResponse then
                                        v66[v45.configKey] = {};
                                    end;
                                else
                                    local v71 = v44.data(false);
                                    for v72, v73 in l_result_0 do
                                        local v74 = v71 and v71[v72];
                                        v66[v72] = if v74 then v3.Dictionary.join(v74, v73) else v73;
                                    end;
                                end;
                                if l_FFlagSduiChartsSupport_0 then
                                    local l_v43_2 = v43;
                                    local v76 = v31[l_v43_2];
                                    if v76 then
                                        v31[l_v43_2] = nil;
                                        v76.resolve(v66);
                                    end;
                                end;
                                return v52(v66);
                            end;
                        end;
                    else
                        local v77 = l_SduiParseHelpers_0.stringifyValue(v55);
                        l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToFetchPage, {
                            message = ("Http request not successful for %* err %*"):format(l_url_0, v77), 
                            name = v45.surfaceKey
                        }, v45.surfaceKey);
                        if l_FFlagSduiChartsSupport_0 then
                            local l_v43_3 = v43;
                            local v79 = v31[l_v43_3];
                            if v79 then
                                v31[l_v43_3] = nil;
                                v79.reject(v55);
                            end;
                        end;
                        return v53(v55);
                    end;
                end);
            end);
        end;
    end;
    local v81 = l_createDataResolver_0({
        cache = v28, 
        fetchFn = v80, 
        queueProcessDelaySec = 0, 
        supportsMultiGet = false
    });
    local function v95(v82, v83) --[[ Line: 290 ]] --[[ Name: fetchIfNeeded ]]
        -- upvalues: l_FFlagSduiProtobufJsonDecode_0 (ref), l_SduiResponseType_0 (ref), l_FFlagSduiChartsSupport_0 (ref), v29 (copy), v81 (copy), v31 (copy), v9 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), l_SduiParseHelpers_0 (ref), v30 (copy)
        if l_FFlagSduiProtobufJsonDecode_0 and v82.responseType == nil then
            v82.responseType = l_SduiResponseType_0.Protobuf;
        end;
        local v84 = v82.configKey or v82.url;
        v82.configKey = v84;
        if l_FFlagSduiChartsSupport_0 then
            v82.loadTimer.logUiRequestQueued();
            v29[v84] = v82;
            local _, v86 = v81.getAndFetchItem(v84, v83 and function() --[[ Line: 306 ]]
                return true;
            end or nil);
            if v86 then
                if not v31[v84] then
                    local v87 = nil;
                    local v88 = nil;
                    do
                        local l_v87_0, l_v88_0 = v87, v88;
                        local v93 = v9.new(function(v91, v92) --[[ Line: 315 ]]
                            -- upvalues: l_v87_0 (ref), l_v88_0 (ref)
                            l_v87_0 = v91;
                            l_v88_0 = v92;
                        end);
                        v93:catch(function(v94) --[[ Line: 319 ]]
                            -- upvalues: l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), v84 (copy), l_SduiParseHelpers_0 (ref), v82 (copy)
                            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToFetchPage, {
                                message = ("fetchIfNeeded promise rejected for %*: %*"):format(v84, (l_SduiParseHelpers_0.stringifyValue(v94)))
                            }, v82.surfaceKey);
                        end);
                        v31[v84] = {
                            promise = v93, 
                            resolve = l_v87_0, 
                            reject = l_v88_0
                        };
                    end;
                end;
                return v31[v84].promise;
            else
                return v9.resolve();
            end;
        elseif v30[v84] then
            return nil;
        else
            v30[v84] = true;
            v82.loadTimer.logUiRequestQueued();
            v29[v84] = v82;
            return v81.getAndFetchItem(v84, v83 and function() --[[ Line: 354 ]]
                return true;
            end or nil);
        end;
    end;
    local function v101(v96, v97, v98) --[[ Line: 366 ]] --[[ Name: getRootConfig ]]
        -- upvalues: v81 (copy)
        local v99 = v81.getCachedItem(v96).data(v97);
        local v100 = v99 and v99[v98 or v96];
        if v100 then
            return v100.config;
        else
            return nil;
        end;
    end;
    local function v107(v102, v103, v104) --[[ Line: 382 ]] --[[ Name: getTitle ]]
        -- upvalues: v81 (copy)
        local v105 = v81.getCachedItem(v102).data(v103);
        local v106 = v105 and v105[v104 or v102];
        if v106 and v106.title ~= "" then
            return v106.title;
        else
            return nil;
        end;
    end;
    local function v113(v108, v109, v110) --[[ Line: 396 ]] --[[ Name: getDataUpdatedTimestamp ]]
        -- upvalues: v81 (copy)
        local v111 = v81.getCachedItem(v108).data(v109);
        local v112 = v111 and v111[v110 or v108];
        if v112 then
            return v112.dataUpdatedTimestamp;
        else
            return nil;
        end;
    end;
    local function v119(v114) --[[ Line: 407 ]] --[[ Name: loadMoreFromApi ]]
        -- upvalues: l_FFlagSduiChartsSupport_0 (ref), v30 (copy), v29 (copy), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), v9 (ref), v81 (copy), v95 (copy), v3 (ref)
        if not l_FFlagSduiChartsSupport_0 and v30[v114.configKey] then
            return nil;
        else
            local v115 = v29[v114.configKey];
            if not v115 then
                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToPaginateRequest, {
                    message = ("No requestData for %*"):format(v114.configKey)
                }, "unknown");
                if l_FFlagSduiChartsSupport_0 then
                    return v9.resolve();
                else
                    return nil;
                end;
            else
                local v116 = v81.getCachedItem(v114.configKey).data(false);
                local v117 = v116 and v116[v114.identifier or v114.configKey];
                if not v117 then
                    l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToPaginateRequest, {
                        message = ("No entry data for %*"):format(v114.configKey), 
                        name = v115.surfaceKey
                    }, v115.surfaceKey);
                    if l_FFlagSduiChartsSupport_0 then
                        return v9.resolve();
                    else
                        return nil;
                    end;
                else
                    local l_nextPageUrl_0 = v117.nextPageUrl;
                    if not l_nextPageUrl_0 or l_nextPageUrl_0 == "" then
                        if l_FFlagSduiChartsSupport_0 then
                            return v9.resolve();
                        else
                            return nil;
                        end;
                    elseif l_FFlagSduiChartsSupport_0 then
                        return v95(v3.Dictionary.join(v115, {
                            url = l_nextPageUrl_0, 
                            loadTimer = v114.loadTimer, 
                            isPaginated = true
                        }), true);
                    else
                        v95(v3.Dictionary.join(v115, {
                            url = l_nextPageUrl_0, 
                            loadTimer = v114.loadTimer, 
                            isPaginated = true
                        }), true);
                        return nil;
                    end;
                end;
            end;
        end;
    end;
    local function v123(v120) --[[ Line: 469 ]] --[[ Name: refreshFromApi ]]
        -- upvalues: v29 (copy), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), l_FFlagSduiChartsSupport_0 (ref), v9 (ref), v95 (copy), v3 (ref)
        local v121 = v29[v120.configKey];
        if not v121 then
            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToFetchPage, {
                message = ("No requestData for refresh: %*"):format(v120.configKey)
            }, "unknown");
            if l_FFlagSduiChartsSupport_0 then
                return v9.resolve();
            else
                return nil;
            end;
        elseif l_FFlagSduiChartsSupport_0 then
            local v122 = if v121.buildRefreshUrl then v121.buildRefreshUrl() else nil;
            return v95(v3.Dictionary.join(v121, {
                url = v122 or v121.url, 
                loadTimer = v120.loadTimer, 
                isPaginated = v3.None
            }), true);
        else
            return v95(v3.Dictionary.join(v121, {
                loadTimer = v120.loadTimer
            }), true);
        end;
    end;
    return {
        fetchIfNeeded = v95, 
        getData = v81.getCachedItem, 
        getRootConfig = v101, 
        getTitle = v107, 
        getDataUpdatedTimestamp = v113, 
        loadMoreFromApi = v119, 
        refreshFromApi = v123
    };
end;