local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedUtilities");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Signals);
local v3 = require(l_Parent_0.SduiCoreSystem);
local l_SduiErrors_0 = v3.SduiErrors;
local l_SduiLogger_0 = v3.SduiLogger;
local v6 = require(l_script_FirstAncestor_0.getSduiTemplateStore);
local v7 = require(l_script_FirstAncestor_0.SduiProtobufResponseHelpers);
local _ = require(l_script_FirstAncestor_0.SduiLoadTimer);
local l_SduiRequestStatus_0 = require(l_script_FirstAncestor_0.SduiIntegrationTypes).SduiRequestStatus;
local l_getSduiClientBindingBuilder_0 = v3.getSduiClientBindingBuilder;
local l_createBuilderConfig_0 = v3.createBuilderConfig;
local l_getSduiDataBinder_0 = v3.getSduiDataBinder;
local l_FFlagSduiAllowNoConfigsBuilt_0 = require(l_Parent_0.SharedFlags).FFlagSduiAllowNoConfigsBuilt;
local l_FFlagSduiLocalizedLiterals_0 = require(l_Parent_0.SharedFlags).FFlagSduiLocalizedLiterals;
local l_FFlagSduiChartsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiChartsSupport;
local function v16(v17, v18) --[[ Line: 33 ]] --[[ Name: mergeTables ]]
    -- upvalues: v16 (copy)
    for v19, v20 in v18 do
        if typeof(v20) == "table" then
            if v17[v19] == nil then
                v17[v19] = {};
            end;
            if #v20 > 0 then
                for _, v22 in v20 do
                    table.insert(v17[v19], v22);
                end;
            else
                v16(v17[v19], v20);
            end;
        else
            v17[v19] = v20;
        end;
    end;
end;
local function _(v23, v24) --[[ Line: 55 ]] --[[ Name: getUpdatedInputData ]]
    -- upvalues: v16 (copy)
    local v25 = table.clone(v23);
    v16(v25, v24);
    return v25;
end;
return function(v27) --[[ Line: 72 ]] --[[ Name: handleSduiApiResponse ]]
    -- upvalues: l_FFlagSduiAllowNoConfigsBuilt_0 (copy), l_SduiRequestStatus_0 (copy), l_SduiLogger_0 (copy), l_SduiErrors_0 (copy), l_getSduiDataBinder_0 (copy), v6 (copy), l_FFlagSduiLocalizedLiterals_0 (copy), v7 (copy), v16 (copy), l_createBuilderConfig_0 (copy), l_getSduiClientBindingBuilder_0 (copy), l_FFlagSduiChartsSupport_0 (copy)
    local l_response_0 = v27.response;
    local l_decodeResponse_0 = v27.decodeResponse;
    local l_parsePageEntriesFromResponse_0 = v27.parsePageEntriesFromResponse;
    local l_parseHydrationDataFromResponse_0 = v27.parseHydrationDataFromResponse;
    local l_parseTemplateEntriesFromResponse_0 = v27.parseTemplateEntriesFromResponse;
    local l_getInputDataSignalsForRequest_0 = v27.getInputDataSignalsForRequest;
    local l_loadTimer_0 = v27.loadTimer;
    local l_surfaceKey_0 = v27.surfaceKey;
    local v36 = v27.configCacheKey or v27.surfaceKey;
    local l_paginateResponse_0 = v27.paginateResponse;
    local l_buildNextPageUrl_0 = v27.buildNextPageUrl;
    local v39 = if l_FFlagSduiAllowNoConfigsBuilt_0 then v27.allowNoConfigsBuilt else nil;
    assert(v36, "configCacheKey must exist");
    l_loadTimer_0.logNetRequestStats(l_response_0.Stats);
    l_loadTimer_0.logResponseDecodeBegin();
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 110 ]]
        -- upvalues: l_decodeResponse_0 (copy), l_response_0 (copy)
        return (l_decodeResponse_0(l_response_0.Body));
    end);
    l_loadTimer_0.logResponseDecodeEnd();
    if not l_status_0 then
        l_loadTimer_0.updateRequestStatus(l_SduiRequestStatus_0.FailedToLoad);
        l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToDecodeResponse, {
            debugName = v36, 
            message = l_result_0
        }, l_surfaceKey_0);
        error("Failed to decode");
    end;
    l_loadTimer_0.logResponseDataUpdateBegin();
    if l_parseHydrationDataFromResponse_0 then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 133 ]]
            -- upvalues: l_parseHydrationDataFromResponse_0 (copy), l_result_0 (copy), l_getSduiDataBinder_0 (ref)
            local v42 = l_parseHydrationDataFromResponse_0(l_result_0);
            l_getSduiDataBinder_0().updateDataStores(v42);
        end);
        if not l_status_1 then
            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToUpdateDataStores, {
                debugName = v36, 
                message = l_result_1
            }, l_surfaceKey_0);
        end;
    end;
    local v45 = {};
    if l_parseTemplateEntriesFromResponse_0 then
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 149 ]]
            -- upvalues: v45 (ref), l_parseTemplateEntriesFromResponse_0 (copy), l_result_0 (copy), v6 (ref)
            local _ = nil;
            local v47, v48 = l_parseTemplateEntriesFromResponse_0(l_result_0);
            v45 = v48;
            v6().addTemplates(v47);
        end);
        if not l_status_2 then
            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToAddTemplates, {
                debugName = v36, 
                message = l_result_2
            }, l_surfaceKey_0);
        end;
    end;
    l_loadTimer_0.logResponseDataUpdateEnd();
    l_loadTimer_0.logSduiTreeBuildBegin();
    local v51 = if l_parsePageEntriesFromResponse_0 then l_parsePageEntriesFromResponse_0(l_result_0) else {};
    local v52 = if l_FFlagSduiLocalizedLiterals_0 then v7.parseLocalizedLiteralsFromResponse(l_result_0) else nil;
    local v53 = {};
    local v54 = #v51 > 1;
    for _, v56 in v51 do
        local l_identifier_0 = v56.identifier;
        local v58 = if v54 and l_identifier_0 and l_identifier_0 ~= "" then ("%*_%*"):format(v36, l_identifier_0) else v36;
        local l_componentInputData_0 = v56.componentInputData;
        local v60 = l_getInputDataSignalsForRequest_0(v58);
        local v61 = v60.get(false);
        if l_paginateResponse_0 and v61 then
            if l_componentInputData_0 then
                local v62 = v60.get(false);
                local v63 = table.clone(v62);
                v16(v63, l_componentInputData_0);
                v60.set(v63);
            end;
        else
            v60.set(l_componentInputData_0);
        end;
        if not (l_paginateResponse_0 and v61) then
            local l_robloxComponentType_0 = v56.robloxComponentType;
            if not l_robloxComponentType_0 then
                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToAddTemplates, {
                    debugName = v36, 
                    message = "Page entry missing robloxComponentType"
                }, l_surfaceKey_0);
                continue;
            else
                local v65 = v45[l_robloxComponentType_0];
                if not v65 then
                    l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToMapRobloxComponentToTemplate, {
                        debugName = v36, 
                        name = l_robloxComponentType_0, 
                        message = ("Missing template for robloxComponentType %*"):format(l_robloxComponentType_0)
                    }, l_surfaceKey_0);
                    continue;
                else
                    local l_status_3, l_result_3 = pcall(function() --[[ Line: 225 ]]
                        -- upvalues: l_createBuilderConfig_0 (ref), l_surfaceKey_0 (copy), v36 (copy), v45 (ref), v52 (copy), l_getSduiClientBindingBuilder_0 (ref), v65 (copy), v60 (copy)
                        local v67 = l_createBuilderConfig_0({
                            appPage = l_surfaceKey_0, 
                            debugName = v36, 
                            getTemplateForRobloxComponent = function(v66) --[[ Line: 229 ]] --[[ Name: getTemplateForRobloxComponent ]]
                                -- upvalues: v45 (ref)
                                return v45[v66];
                            end, 
                            localizedLiterals = v52
                        });
                        return (l_getSduiClientBindingBuilder_0().buildConfigForComponent(v65, v60.get, v67));
                    end);
                    if l_status_3 then
                        if v53[v58] then
                            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.DuplicateOrMissingIdentifier, {
                                debugName = v58, 
                                name = l_robloxComponentType_0, 
                                message = ("Existing config found for cacheKey %*. Need to specify identifer in page entry for multiple configs"):format(v58)
                            }, l_surfaceKey_0);
                        end;
                        v53[v58] = {
                            config = l_result_3, 
                            dataUpdatedTimestamp = if l_FFlagSduiChartsSupport_0 then os.clock() else nil
                        };
                    else
                        l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToBuildClientBindingConfig, {
                            debugName = v36, 
                            name = l_robloxComponentType_0, 
                            message = ("%*"):format(l_result_3)
                        }, l_surfaceKey_0);
                    end;
                    if v56.title and v53[v58] then
                        v53[v58].title = v56.title;
                    end;
                end;
            end;
        end;
        v53[v58] = v53[v58] or {};
        if l_buildNextPageUrl_0 then
            v53[v58].nextPageUrl = l_buildNextPageUrl_0(l_result_0) or "";
        else
            v53[v58].nextPageUrl = "";
        end;
    end;
    if not next(v53) and not l_paginateResponse_0 and (not l_FFlagSduiAllowNoConfigsBuilt_0 or not v39) then
        l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.NoComponentConfigsBuilt, {
            debugName = v36, 
            message = ("No configs built when handling proto response for %*"):format(v36)
        }, l_surfaceKey_0);
    end;
    l_loadTimer_0.logSduiTreeBuildEnd();
    return v53;
end;