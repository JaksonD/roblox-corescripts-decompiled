local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedUtilities");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Signals);
local v3 = require(l_Parent_0.SduiCoreSystem);
local l_SduiErrors_0 = v3.SduiErrors;
local l_SduiLogger_0 = v3.SduiLogger;
local v6 = require(l_script_FirstAncestor_0.getSduiTemplateStore);
local _ = require(l_script_FirstAncestor_0.SduiLoadTimer);
local l_SduiRequestStatus_0 = require(l_script_FirstAncestor_0.SduiIntegrationTypes).SduiRequestStatus;
local l_getSduiClientBindingBuilder_0 = v3.getSduiClientBindingBuilder;
local l_createBuilderConfig_0 = v3.createBuilderConfig;
local l_getSduiDataBinder_0 = v3.getSduiDataBinder;
local l_FFlagSduiInputDataSignals_0 = require(l_Parent_0.SharedFlags).FFlagSduiInputDataSignals;
local function v13(v14, v15) --[[ Line: 29 ]] --[[ Name: mergeTables ]]
    -- upvalues: v13 (copy)
    for v16, v17 in v15 do
        if typeof(v17) == "table" then
            if v14[v16] == nil then
                v14[v16] = {};
            end;
            if #v17 > 0 then
                for _, v19 in v17 do
                    table.insert(v14[v16], v19);
                end;
            else
                v13(v14[v16], v17);
            end;
        else
            v14[v16] = v17;
        end;
    end;
end;
local function _(v20, v21) --[[ Line: 51 ]] --[[ Name: getUpdatedInputData ]]
    -- upvalues: v13 (copy)
    local v22 = table.clone(v20);
    v13(v22, v21);
    return v22;
end;
return function(v24) --[[ Line: 68 ]] --[[ Name: handleSduiApiResponse ]]
    -- upvalues: l_FFlagSduiInputDataSignals_0 (copy), l_SduiRequestStatus_0 (copy), l_SduiLogger_0 (copy), l_SduiErrors_0 (copy), l_getSduiDataBinder_0 (copy), v6 (copy), v13 (copy), l_createBuilderConfig_0 (copy), l_getSduiClientBindingBuilder_0 (copy)
    local l_response_0 = v24.response;
    local l_decodeResponse_0 = v24.decodeResponse;
    local l_parsePageEntriesFromResponse_0 = v24.parsePageEntriesFromResponse;
    local l_parseHydrationDataFromResponse_0 = v24.parseHydrationDataFromResponse;
    local l_parseTemplateEntriesFromResponse_0 = v24.parseTemplateEntriesFromResponse;
    local v30 = if l_FFlagSduiInputDataSignals_0 then v24.getInputDataSignalsForRequest else nil;
    local l_loadTimer_0 = v24.loadTimer;
    local l_surfaceKey_0 = v24.surfaceKey;
    local v33 = v24.configCacheKey or v24.surfaceKey;
    local v34 = if l_FFlagSduiInputDataSignals_0 then v24.paginateResponse else nil;
    local v35 = if l_FFlagSduiInputDataSignals_0 then v24.buildNextPageUrl else nil;
    assert(v33, "configCacheKey must exist");
    l_loadTimer_0.logNetRequestStats(l_response_0.Stats);
    l_loadTimer_0.logResponseDecodeBegin();
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 106 ]]
        -- upvalues: l_decodeResponse_0 (copy), l_response_0 (copy)
        return (l_decodeResponse_0(l_response_0.Body));
    end);
    l_loadTimer_0.logResponseDecodeEnd();
    if not l_status_0 then
        l_loadTimer_0.updateRequestStatus(l_SduiRequestStatus_0.FailedToLoad);
        l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToDecodeResponse, {
            debugName = v33, 
            message = l_result_0
        }, l_surfaceKey_0);
        error("Failed to decode");
    end;
    l_loadTimer_0.logResponseDataUpdateBegin();
    if l_parseHydrationDataFromResponse_0 then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 129 ]]
            -- upvalues: l_parseHydrationDataFromResponse_0 (copy), l_result_0 (copy), l_getSduiDataBinder_0 (ref)
            local v38 = l_parseHydrationDataFromResponse_0(l_result_0);
            l_getSduiDataBinder_0().updateDataStores(v38);
        end);
        if not l_status_1 then
            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToUpdateDataStores, {
                debugName = v33, 
                message = l_result_1
            }, l_surfaceKey_0);
        end;
    end;
    local v41 = {};
    if l_parseTemplateEntriesFromResponse_0 then
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 145 ]]
            -- upvalues: v41 (ref), l_parseTemplateEntriesFromResponse_0 (copy), l_result_0 (copy), v6 (ref)
            local _ = nil;
            local v43, v44 = l_parseTemplateEntriesFromResponse_0(l_result_0);
            v41 = v44;
            v6().addTemplates(v43);
        end);
        if not l_status_2 then
            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToAddTemplates, {
                debugName = v33, 
                message = l_result_2
            }, l_surfaceKey_0);
        end;
    end;
    l_loadTimer_0.logResponseDataUpdateEnd();
    l_loadTimer_0.logSduiTreeBuildBegin();
    local v47 = if l_parsePageEntriesFromResponse_0 then l_parsePageEntriesFromResponse_0(l_result_0) else {};
    local v48 = {};
    local v49 = #v47 > 1;
    if l_FFlagSduiInputDataSignals_0 then
        for _, v51 in v47 do
            local l_identifier_0 = v51.identifier;
            local v53 = if v49 and l_identifier_0 and l_identifier_0 ~= "" then ("%*_%*"):format(v33, l_identifier_0) else v33;
            local l_componentInputData_0 = v51.componentInputData;
            local v55 = v30(v53);
            local v56 = v55.get(false);
            if v34 and v56 then
                if l_componentInputData_0 then
                    local v57 = v55.get(false);
                    local v58 = table.clone(v57);
                    v13(v58, l_componentInputData_0);
                    v55.set(v58);
                end;
            else
                v55.set(l_componentInputData_0);
            end;
            if not (v34 and v56) then
                local l_robloxComponentType_0 = v51.robloxComponentType;
                if not l_robloxComponentType_0 then
                    l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToAddTemplates, {
                        debugName = v33, 
                        message = "Page entry missing robloxComponentType"
                    }, l_surfaceKey_0);
                    continue;
                else
                    local v60 = v41[l_robloxComponentType_0];
                    if not v60 then
                        l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToMapRobloxComponentToTemplate, {
                            debugName = v33, 
                            name = l_robloxComponentType_0, 
                            message = ("Missing template for robloxComponentType %*"):format(l_robloxComponentType_0)
                        }, l_surfaceKey_0);
                        continue;
                    else
                        local l_status_3, l_result_3 = pcall(function() --[[ Line: 218 ]]
                            -- upvalues: l_createBuilderConfig_0 (ref), l_surfaceKey_0 (copy), v33 (copy), v41 (ref), l_getSduiClientBindingBuilder_0 (ref), v60 (copy), v55 (copy)
                            local v62 = l_createBuilderConfig_0({
                                appPage = l_surfaceKey_0, 
                                debugName = v33, 
                                getTemplateForRobloxComponent = function(v61) --[[ Line: 222 ]] --[[ Name: getTemplateForRobloxComponent ]]
                                    -- upvalues: v41 (ref)
                                    return v41[v61];
                                end
                            });
                            return (l_getSduiClientBindingBuilder_0().buildConfigForComponent(v60, v55.get, v62));
                        end);
                        if l_status_3 then
                            if v48[v53] then
                                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.DuplicateOrMissingIdentifier, {
                                    debugName = v53, 
                                    name = l_robloxComponentType_0, 
                                    message = ("Existing config found for cacheKey %*. Need to specify identifer in page entry for multiple configs"):format(v53)
                                }, l_surfaceKey_0);
                            end;
                            v48[v53] = {
                                config = l_result_3
                            };
                        else
                            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToBuildClientBindingConfig, {
                                debugName = v33, 
                                name = l_robloxComponentType_0, 
                                message = ("%*"):format(l_result_3)
                            }, l_surfaceKey_0);
                        end;
                        if v51.title and v48[v53] then
                            v48[v53].title = v51.title;
                        end;
                    end;
                end;
            end;
            v48[v53] = v48[v53] or {};
            if v35 then
                v48[v53].nextPageUrl = v35(l_result_0) or "";
            else
                v48[v53].nextPageUrl = "";
            end;
        end;
    else
        for _, v66 in v47 do
            local l_robloxComponentType_1 = v66.robloxComponentType;
            if not l_robloxComponentType_1 then
                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToAddTemplates, {
                    debugName = v33, 
                    message = "Page entry missing robloxComponentType"
                }, l_surfaceKey_0);
            else
                local v68 = v41[l_robloxComponentType_1];
                if not v68 then
                    l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToMapRobloxComponentToTemplate, {
                        debugName = v33, 
                        name = l_robloxComponentType_1, 
                        message = ("Missing template for robloxComponentType %*"):format(l_robloxComponentType_1)
                    }, l_surfaceKey_0);
                else
                    local l_componentInputData_1 = v66.componentInputData;
                    if not v34 then
                        if v68 then
                            local l_status_4, l_result_4 = pcall(function() --[[ Line: 290 ]]
                                -- upvalues: l_createBuilderConfig_0 (ref), l_surfaceKey_0 (copy), v33 (copy), v41 (ref), l_getSduiClientBindingBuilder_0 (ref), v68 (copy), l_componentInputData_1 (copy)
                                local v71 = l_createBuilderConfig_0({
                                    appPage = l_surfaceKey_0, 
                                    debugName = v33, 
                                    getTemplateForRobloxComponent = function(v70) --[[ Line: 294 ]] --[[ Name: getTemplateForRobloxComponent ]]
                                        -- upvalues: v41 (ref)
                                        return v41[v70];
                                    end
                                });
                                return (l_getSduiClientBindingBuilder_0().buildConfigForComponent(v68, l_componentInputData_1, v71));
                            end);
                            local l_identifier_1 = v66.identifier;
                            local v75 = if v49 and l_identifier_1 and l_identifier_1 ~= "" then ("%*_%*"):format(v33, l_identifier_1) else v33;
                            if l_status_4 then
                                if v48[v75] then
                                    l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.DuplicateOrMissingIdentifier, {
                                        debugName = v75, 
                                        name = l_robloxComponentType_1, 
                                        message = ("Existing config found for cacheKey %*. Need to specify identifer in page entry for multiple configs"):format(v75)
                                    }, l_surfaceKey_0);
                                end;
                                v48[v75] = {
                                    config = l_result_4
                                };
                            else
                                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToBuildClientBindingConfig, {
                                    debugName = v33, 
                                    name = l_robloxComponentType_1, 
                                    message = ("%*"):format(l_result_4)
                                }, l_surfaceKey_0);
                            end;
                            if v66.title and v48[v75] then
                                v48[v75].title = v66.title;
                            end;
                        else
                            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.NilTemplateForTemplateId, {
                                debugName = v33, 
                                name = l_robloxComponentType_1, 
                                message = ("Missing template for robloxComponentType %*"):format(l_robloxComponentType_1)
                            }, l_surfaceKey_0);
                        end;
                    end;
                end;
            end;
        end;
    end;
    if not next(v48) and (not l_FFlagSduiInputDataSignals_0 or not v34) then
        l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.NoComponentConfigsBuilt, {
            debugName = v33, 
            message = ("No configs built when handling proto response for %*"):format(v33)
        }, l_surfaceKey_0);
    end;
    l_loadTimer_0.logSduiTreeBuildEnd();
    return v48;
end;