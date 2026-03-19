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
return function() --[[ Line: 64 ]] --[[ Name: createSduiApiStore ]]
    -- upvalues: l_createDataCache_0 (copy), v4 (copy), v9 (copy), l_FFlagSduiProtobufJsonDecode_0 (copy), l_SduiResponseType_0 (copy), l_HttpService_0 (copy), v21 (copy), l_SduiRequestStatus_0 (copy), l_SduiLogger_0 (copy), l_SduiErrors_0 (copy), l_makeProtobufJsonResponseDecoder_0 (copy), l_makeProtoResponseDecoder_0 (copy), v20 (copy), v16 (copy), l_SduiParseHelpers_0 (copy), v23 (copy), v3 (copy), l_createDataResolver_0 (copy)
    local v24 = l_createDataCache_0();
    local v25 = {};
    local v26 = {};
    local v27 = {};
    local function v32(v28) --[[ Line: 77 ]] --[[ Name: getInputDataSignals ]]
        -- upvalues: v27 (copy), v4 (ref)
        local v29 = v27[v28];
        if v29 == nil then
            local v30, v31 = v4.createSignal(nil);
            v29 = {
                get = v30, 
                set = v31
            };
            v27[v28] = v29;
        end;
        return v29;
    end;
    local function v60(v33, v34) --[[ Line: 93 ]] --[[ Name: fetchFunction ]]
        -- upvalues: v25 (copy), v9 (ref), l_FFlagSduiProtobufJsonDecode_0 (ref), l_SduiResponseType_0 (ref), l_HttpService_0 (ref), v26 (copy), v21 (ref), l_SduiRequestStatus_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), l_makeProtobufJsonResponseDecoder_0 (ref), l_makeProtoResponseDecoder_0 (ref), v20 (ref), v16 (ref), v32 (copy), l_SduiParseHelpers_0 (ref), v23 (ref), v3 (ref)
        local v35 = v25[v33];
        if not v35 then
            return v9.reject("No request config for key", v33);
        else
            local l_url_0 = v35.url;
            local l_loadTimer_0 = v35.loadTimer;
            l_loadTimer_0.logUiRequestSent();
            local v38 = l_FFlagSduiProtobufJsonDecode_0 and v35.responseType == l_SduiResponseType_0.ProtobufJson;
            local v39 = l_HttpService_0:RequestInternal({
                Url = l_url_0, 
                Method = "GET", 
                Headers = {
                    Accept = v38 and "application/json" or "application/x-protobuf"
                }
            });
            return v9.new(function(v40, v41) --[[ Line: 112 ]]
                -- upvalues: v39 (copy), l_loadTimer_0 (copy), v26 (ref), v33 (copy), v21 (ref), v35 (copy), l_SduiRequestStatus_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), l_url_0 (copy), v38 (copy), l_makeProtobufJsonResponseDecoder_0 (ref), l_makeProtoResponseDecoder_0 (ref), v34 (copy), v20 (ref), v16 (ref), v32 (ref), l_SduiParseHelpers_0 (ref), v23 (ref), v3 (ref)
                v39:Start(function(v42, v43) --[[ Line: 113 ]]
                    -- upvalues: l_loadTimer_0 (ref), v26 (ref), v33 (ref), v21 (ref), v35 (ref), l_SduiRequestStatus_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), l_url_0 (ref), v41 (copy), v38 (ref), l_makeProtobufJsonResponseDecoder_0 (ref), l_makeProtoResponseDecoder_0 (ref), v34 (ref), v20 (ref), v16 (ref), v32 (ref), l_SduiParseHelpers_0 (ref), v23 (ref), v3 (ref), v40 (copy)
                    l_loadTimer_0.logUiResponseReceived();
                    v26[v33] = false;
                    v21.sendPageStatusEvent(v35.surfaceKey, v43.StatusCode, v43.HttpError);
                    if v42 then
                        local v44 = if v43.StatusCode then tonumber(v43.StatusCode) else nil;
                        if v44 and v44 >= 400 or v43.HttpError and v43.HttpError ~= Enum.HttpError.OK then
                            l_loadTimer_0.updateRequestStatus(l_SduiRequestStatus_0.FailedToLoad);
                            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToFetchPage, {
                                message = ("Http request not successful for %* StatusCode %* HttpError %*"):format(l_url_0, v43.StatusCode, v43.HttpError), 
                                name = v35.surfaceKey
                            }, v35.surfaceKey);
                            return v41(v43);
                        else
                            l_loadTimer_0.updateRequestStatus(l_SduiRequestStatus_0.LoadedFromNetwork);
                            v21.sendPagePayloadSizeEvent(v35.surfaceKey, v43.Body);
                            local v45 = if v38 then l_makeProtobufJsonResponseDecoder_0(v35.apiProto) else l_makeProtoResponseDecoder_0(v35.apiProto);
                            local l_status_0, l_result_0 = pcall(function() --[[ Line: 151 ]]
                                -- upvalues: v35 (ref), v34 (ref), v20 (ref), v43 (copy), l_loadTimer_0 (ref), v45 (copy), v16 (ref), v32 (ref)
                                local v46 = v35.isPaginated and v34.data(false) ~= nil;
                                return v20({
                                    response = v43, 
                                    loadTimer = l_loadTimer_0, 
                                    surfaceKey = v35.surfaceKey, 
                                    configCacheKey = v35.configKey, 
                                    decodeResponse = v45, 
                                    parseHydrationDataFromResponse = v16.parseHydrationDataFromResponse, 
                                    parseTemplateEntriesFromResponse = v16.parseTemplateEntriesFromResponse, 
                                    parsePageEntriesFromResponse = v16.parsePageEntriesFromResponse, 
                                    getInputDataSignalsForRequest = v32, 
                                    paginateResponse = v46, 
                                    buildNextPageUrl = v35.buildNextPageUrl
                                });
                            end);
                            if not l_status_0 then
                                local v49 = l_SduiParseHelpers_0.stringifyValue(l_result_0);
                                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToFetchPage, {
                                    message = ("handleSduiApiResponse not successful for %* err %*"):format(l_url_0, v49), 
                                    name = v35.surfaceKey
                                }, v35.surfaceKey);
                                return v41(v34);
                            else
                                local v50 = {};
                                if v23 then
                                    if next(l_result_0) then
                                        local v51 = v34.data(false);
                                        for v52, v53 in l_result_0 do
                                            local v54 = v51 and v51[v52];
                                            v50[v52] = if v54 then v3.Dictionary.join(v54, v53) else v53;
                                        end;
                                    elseif v35.clearOnEmptyResponse then
                                        v50[v35.configKey] = {};
                                    end;
                                else
                                    local v55 = v34.data(false);
                                    for v56, v57 in l_result_0 do
                                        local v58 = v55 and v55[v56];
                                        v50[v56] = if v58 then v3.Dictionary.join(v58, v57) else v57;
                                    end;
                                end;
                                return v40(v50);
                            end;
                        end;
                    else
                        local v59 = l_SduiParseHelpers_0.stringifyValue(v43);
                        l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToFetchPage, {
                            message = ("Http request not successful for %* err %*"):format(l_url_0, v59), 
                            name = v35.surfaceKey
                        }, v35.surfaceKey);
                        return v41(v43);
                    end;
                end);
            end);
        end;
    end;
    local v61 = l_createDataResolver_0({
        cache = v24, 
        fetchFn = v60, 
        queueProcessDelaySec = 0, 
        supportsMultiGet = false
    });
    local function v65(v62, v63) --[[ Line: 226 ]] --[[ Name: fetchIfNeeded ]]
        -- upvalues: l_FFlagSduiProtobufJsonDecode_0 (ref), l_SduiResponseType_0 (ref), v26 (copy), v25 (copy), v61 (copy)
        if l_FFlagSduiProtobufJsonDecode_0 and v62.responseType == nil then
            v62.responseType = l_SduiResponseType_0.Protobuf;
        end;
        local v64 = v62.configKey or v62.url;
        v62.configKey = v64;
        if v26[v64] then
            return;
        else
            v26[v64] = true;
            v62.loadTimer.logUiRequestQueued();
            v25[v64] = v62;
            return v61.getAndFetchItem(v64, v63 and function() --[[ Line: 252 ]]
                return true;
            end or nil);
        end;
    end;
    local function v71(v66, v67, v68) --[[ Line: 263 ]] --[[ Name: getRootConfig ]]
        -- upvalues: v61 (copy)
        local v69 = v61.getCachedItem(v66).data(v67);
        local v70 = v69 and v69[v68 or v66];
        if v70 then
            return v70.config;
        else
            return nil;
        end;
    end;
    local function v77(v72, v73, v74) --[[ Line: 279 ]] --[[ Name: getTitle ]]
        -- upvalues: v61 (copy)
        local v75 = v61.getCachedItem(v72).data(v73);
        local v76 = v75 and v75[v74 or v72];
        if v76 and v76.title ~= "" then
            return v76.title;
        else
            return nil;
        end;
    end;
    local function v83(v78) --[[ Line: 293 ]] --[[ Name: loadMoreFromApi ]]
        -- upvalues: v26 (copy), v25 (copy), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), v61 (copy), v65 (copy), v3 (ref)
        if v26[v78.configKey] then
            return;
        else
            local v79 = v25[v78.configKey];
            if not v79 then
                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToPaginateRequest, {
                    message = ("No requestData for %*"):format(v78.configKey)
                }, "unknown");
                return;
            else
                local v80 = v61.getCachedItem(v78.configKey).data(false);
                local v81 = v80 and v80[v78.identifier or v78.configKey];
                if not v81 then
                    l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToPaginateRequest, {
                        message = ("No entry data for %*"):format(v78.configKey), 
                        name = v79.surfaceKey
                    }, v79.surfaceKey);
                    return;
                else
                    local l_nextPageUrl_0 = v81.nextPageUrl;
                    if not l_nextPageUrl_0 or l_nextPageUrl_0 == "" then
                        return;
                    else
                        v65(v3.Dictionary.join(v79, {
                            url = l_nextPageUrl_0, 
                            loadTimer = v78.loadTimer, 
                            isPaginated = true
                        }), true);
                        return;
                    end;
                end;
            end;
        end;
    end;
    return {
        fetchIfNeeded = v65, 
        getData = v61.getCachedItem, 
        getRootConfig = v71, 
        getTitle = v77, 
        loadMoreFromApi = v83
    };
end;