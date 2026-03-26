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
local l_FFlagSduiProtobufJsonDecode_0 = require(l_Parent_0.SharedFlags).FFlagSduiProtobufJsonDecode;
local v23 = game:DefineFastFlag("SduiEnableClearOnEmptyResponse", false);
local l_FFlagSduiAllowNoConfigsBuilt_0 = require(l_Parent_0.SharedFlags).FFlagSduiAllowNoConfigsBuilt;
return function() --[[ Line: 68 ]] --[[ Name: createSduiApiStore ]]
    -- upvalues: l_createDataCache_0 (copy), v4 (copy), v9 (copy), l_FFlagSduiProtobufJsonDecode_0 (copy), l_SduiResponseType_0 (copy), l_HttpService_0 (copy), v21 (copy), l_SduiRequestStatus_0 (copy), l_SduiLogger_0 (copy), l_SduiErrors_0 (copy), l_makeProtobufJsonResponseDecoder_0 (copy), l_makeProtoResponseDecoder_0 (copy), v20 (copy), v16 (copy), l_FFlagSduiAllowNoConfigsBuilt_0 (copy), l_SduiParseHelpers_0 (copy), v23 (copy), v3 (copy), l_createDataResolver_0 (copy)
    local v25 = l_createDataCache_0();
    local v26 = {};
    local v27 = {};
    local v28 = {};
    local function v33(v29) --[[ Line: 81 ]] --[[ Name: getInputDataSignals ]]
        -- upvalues: v28 (copy), v4 (ref)
        local v30 = v28[v29];
        if v30 == nil then
            local v31, v32 = v4.createSignal(nil);
            v30 = {
                get = v31, 
                set = v32
            };
            v28[v29] = v30;
        end;
        return v30;
    end;
    local function v61(v34, v35) --[[ Line: 97 ]] --[[ Name: fetchFunction ]]
        -- upvalues: v26 (copy), v9 (ref), l_FFlagSduiProtobufJsonDecode_0 (ref), l_SduiResponseType_0 (ref), l_HttpService_0 (ref), v27 (copy), v21 (ref), l_SduiRequestStatus_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), l_makeProtobufJsonResponseDecoder_0 (ref), l_makeProtoResponseDecoder_0 (ref), v20 (ref), v16 (ref), v33 (copy), l_FFlagSduiAllowNoConfigsBuilt_0 (ref), l_SduiParseHelpers_0 (ref), v23 (ref), v3 (ref)
        local v36 = v26[v34];
        if not v36 then
            return v9.reject("No request config for key", v34);
        else
            local l_url_0 = v36.url;
            local l_loadTimer_0 = v36.loadTimer;
            l_loadTimer_0.logUiRequestSent();
            local v39 = l_FFlagSduiProtobufJsonDecode_0 and v36.responseType == l_SduiResponseType_0.ProtobufJson;
            local v40 = l_HttpService_0:RequestInternal({
                Url = l_url_0, 
                Method = "GET", 
                Headers = {
                    Accept = v39 and "application/json" or "application/x-protobuf"
                }
            });
            return v9.new(function(v41, v42) --[[ Line: 116 ]]
                -- upvalues: v40 (copy), l_loadTimer_0 (copy), v27 (ref), v34 (copy), v21 (ref), v36 (copy), l_SduiRequestStatus_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), l_url_0 (copy), v39 (copy), l_makeProtobufJsonResponseDecoder_0 (ref), l_makeProtoResponseDecoder_0 (ref), v35 (copy), v20 (ref), v16 (ref), v33 (ref), l_FFlagSduiAllowNoConfigsBuilt_0 (ref), l_SduiParseHelpers_0 (ref), v23 (ref), v3 (ref)
                v40:Start(function(v43, v44) --[[ Line: 117 ]]
                    -- upvalues: l_loadTimer_0 (ref), v27 (ref), v34 (ref), v21 (ref), v36 (ref), l_SduiRequestStatus_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), l_url_0 (ref), v42 (copy), v39 (ref), l_makeProtobufJsonResponseDecoder_0 (ref), l_makeProtoResponseDecoder_0 (ref), v35 (ref), v20 (ref), v16 (ref), v33 (ref), l_FFlagSduiAllowNoConfigsBuilt_0 (ref), l_SduiParseHelpers_0 (ref), v23 (ref), v3 (ref), v41 (copy)
                    l_loadTimer_0.logUiResponseReceived();
                    v27[v34] = false;
                    v21.sendPageStatusEvent(v36.surfaceKey, v44.StatusCode, v44.HttpError);
                    if v43 then
                        local v45 = if v44.StatusCode then tonumber(v44.StatusCode) else nil;
                        if v45 and v45 >= 400 or v44.HttpError and v44.HttpError ~= Enum.HttpError.OK then
                            l_loadTimer_0.updateRequestStatus(l_SduiRequestStatus_0.FailedToLoad);
                            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToFetchPage, {
                                message = ("Http request not successful for %* StatusCode %* HttpError %*"):format(l_url_0, v44.StatusCode, v44.HttpError), 
                                name = v36.surfaceKey
                            }, v36.surfaceKey);
                            return v42(v44);
                        else
                            l_loadTimer_0.updateRequestStatus(l_SduiRequestStatus_0.LoadedFromNetwork);
                            v21.sendPagePayloadSizeEvent(v36.surfaceKey, v44.Body);
                            local v46 = if v39 then l_makeProtobufJsonResponseDecoder_0(v36.apiProto) else l_makeProtoResponseDecoder_0(v36.apiProto);
                            local l_status_0, l_result_0 = pcall(function() --[[ Line: 155 ]]
                                -- upvalues: v36 (ref), v35 (ref), v20 (ref), v44 (copy), l_loadTimer_0 (ref), v46 (copy), v16 (ref), v33 (ref), l_FFlagSduiAllowNoConfigsBuilt_0 (ref)
                                local v47 = v36.isPaginated and v35.data(false) ~= nil;
                                return v20({
                                    response = v44, 
                                    loadTimer = l_loadTimer_0, 
                                    surfaceKey = v36.surfaceKey, 
                                    configCacheKey = v36.configKey, 
                                    decodeResponse = v46, 
                                    parseHydrationDataFromResponse = v16.parseHydrationDataFromResponse, 
                                    parseTemplateEntriesFromResponse = v16.parseTemplateEntriesFromResponse, 
                                    parsePageEntriesFromResponse = v16.parsePageEntriesFromResponse, 
                                    getInputDataSignalsForRequest = v33, 
                                    paginateResponse = v47, 
                                    buildNextPageUrl = v36.buildNextPageUrl, 
                                    allowNoConfigsBuilt = if l_FFlagSduiAllowNoConfigsBuilt_0 then v36.allowNoConfigsBuilt else nil
                                });
                            end);
                            if not l_status_0 then
                                local v50 = l_SduiParseHelpers_0.stringifyValue(l_result_0);
                                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToFetchPage, {
                                    message = ("handleSduiApiResponse not successful for %* err %*"):format(l_url_0, v50), 
                                    name = v36.surfaceKey
                                }, v36.surfaceKey);
                                return v42(v35);
                            else
                                local v51 = {};
                                if v23 then
                                    if next(l_result_0) then
                                        local v52 = v35.data(false);
                                        for v53, v54 in l_result_0 do
                                            local v55 = v52 and v52[v53];
                                            v51[v53] = if v55 then v3.Dictionary.join(v55, v54) else v54;
                                        end;
                                    elseif v36.clearOnEmptyResponse then
                                        v51[v36.configKey] = {};
                                    end;
                                else
                                    local v56 = v35.data(false);
                                    for v57, v58 in l_result_0 do
                                        local v59 = v56 and v56[v57];
                                        v51[v57] = if v59 then v3.Dictionary.join(v59, v58) else v58;
                                    end;
                                end;
                                return v41(v51);
                            end;
                        end;
                    else
                        local v60 = l_SduiParseHelpers_0.stringifyValue(v44);
                        l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToFetchPage, {
                            message = ("Http request not successful for %* err %*"):format(l_url_0, v60), 
                            name = v36.surfaceKey
                        }, v36.surfaceKey);
                        return v42(v44);
                    end;
                end);
            end);
        end;
    end;
    local v62 = l_createDataResolver_0({
        cache = v25, 
        fetchFn = v61, 
        queueProcessDelaySec = 0, 
        supportsMultiGet = false
    });
    local function v66(v63, v64) --[[ Line: 233 ]] --[[ Name: fetchIfNeeded ]]
        -- upvalues: l_FFlagSduiProtobufJsonDecode_0 (ref), l_SduiResponseType_0 (ref), v27 (copy), v26 (copy), v62 (copy)
        if l_FFlagSduiProtobufJsonDecode_0 and v63.responseType == nil then
            v63.responseType = l_SduiResponseType_0.Protobuf;
        end;
        local v65 = v63.configKey or v63.url;
        v63.configKey = v65;
        if v27[v65] then
            return;
        else
            v27[v65] = true;
            v63.loadTimer.logUiRequestQueued();
            v26[v65] = v63;
            return v62.getAndFetchItem(v65, v64 and function() --[[ Line: 259 ]]
                return true;
            end or nil);
        end;
    end;
    local function v72(v67, v68, v69) --[[ Line: 270 ]] --[[ Name: getRootConfig ]]
        -- upvalues: v62 (copy)
        local v70 = v62.getCachedItem(v67).data(v68);
        local v71 = v70 and v70[v69 or v67];
        if v71 then
            return v71.config;
        else
            return nil;
        end;
    end;
    local function v78(v73, v74, v75) --[[ Line: 286 ]] --[[ Name: getTitle ]]
        -- upvalues: v62 (copy)
        local v76 = v62.getCachedItem(v73).data(v74);
        local v77 = v76 and v76[v75 or v73];
        if v77 and v77.title ~= "" then
            return v77.title;
        else
            return nil;
        end;
    end;
    local function v84(v79) --[[ Line: 300 ]] --[[ Name: loadMoreFromApi ]]
        -- upvalues: v27 (copy), v26 (copy), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), v62 (copy), v66 (copy), v3 (ref)
        if v27[v79.configKey] then
            return;
        else
            local v80 = v26[v79.configKey];
            if not v80 then
                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToPaginateRequest, {
                    message = ("No requestData for %*"):format(v79.configKey)
                }, "unknown");
                return;
            else
                local v81 = v62.getCachedItem(v79.configKey).data(false);
                local v82 = v81 and v81[v79.identifier or v79.configKey];
                if not v82 then
                    l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToPaginateRequest, {
                        message = ("No entry data for %*"):format(v79.configKey), 
                        name = v80.surfaceKey
                    }, v80.surfaceKey);
                    return;
                else
                    local l_nextPageUrl_0 = v82.nextPageUrl;
                    if not l_nextPageUrl_0 or l_nextPageUrl_0 == "" then
                        return;
                    else
                        v66(v3.Dictionary.join(v80, {
                            url = l_nextPageUrl_0, 
                            loadTimer = v79.loadTimer, 
                            isPaginated = true
                        }), true);
                        return;
                    end;
                end;
            end;
        end;
    end;
    return {
        fetchIfNeeded = v66, 
        getData = v62.getCachedItem, 
        getRootConfig = v72, 
        getTitle = v78, 
        loadMoreFromApi = v84
    };
end;