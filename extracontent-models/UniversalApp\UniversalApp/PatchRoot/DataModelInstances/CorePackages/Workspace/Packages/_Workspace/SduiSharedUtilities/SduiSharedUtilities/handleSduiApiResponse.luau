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
local function v12(v13, v14) --[[ Line: 28 ]] --[[ Name: mergeTables ]]
    -- upvalues: v12 (copy)
    for v15, v16 in v14 do
        if typeof(v16) == "table" then
            if v13[v15] == nil then
                v13[v15] = {};
            end;
            if #v16 > 0 then
                for _, v18 in v16 do
                    table.insert(v13[v15], v18);
                end;
            else
                v12(v13[v15], v16);
            end;
        else
            v13[v15] = v16;
        end;
    end;
end;
local function _(v19, v20) --[[ Line: 50 ]] --[[ Name: getUpdatedInputData ]]
    -- upvalues: v12 (copy)
    local v21 = table.clone(v19);
    v12(v21, v20);
    return v21;
end;
return function(v23) --[[ Line: 67 ]] --[[ Name: handleSduiApiResponse ]]
    -- upvalues: l_SduiRequestStatus_0 (copy), l_SduiLogger_0 (copy), l_SduiErrors_0 (copy), l_getSduiDataBinder_0 (copy), v6 (copy), v12 (copy), l_createBuilderConfig_0 (copy), l_getSduiClientBindingBuilder_0 (copy)
    local l_response_0 = v23.response;
    local l_decodeResponse_0 = v23.decodeResponse;
    local l_parsePageEntriesFromResponse_0 = v23.parsePageEntriesFromResponse;
    local l_parseHydrationDataFromResponse_0 = v23.parseHydrationDataFromResponse;
    local l_parseTemplateEntriesFromResponse_0 = v23.parseTemplateEntriesFromResponse;
    local l_getInputDataSignalsForRequest_0 = v23.getInputDataSignalsForRequest;
    local l_loadTimer_0 = v23.loadTimer;
    local l_surfaceKey_0 = v23.surfaceKey;
    local v32 = v23.configCacheKey or v23.surfaceKey;
    local l_paginateResponse_0 = v23.paginateResponse;
    local l_buildNextPageUrl_0 = v23.buildNextPageUrl;
    assert(v32, "configCacheKey must exist");
    l_loadTimer_0.logNetRequestStats(l_response_0.Stats);
    l_loadTimer_0.logResponseDecodeBegin();
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 103 ]]
        -- upvalues: l_decodeResponse_0 (copy), l_response_0 (copy)
        return (l_decodeResponse_0(l_response_0.Body));
    end);
    l_loadTimer_0.logResponseDecodeEnd();
    if not l_status_0 then
        l_loadTimer_0.updateRequestStatus(l_SduiRequestStatus_0.FailedToLoad);
        l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToDecodeResponse, {
            debugName = v32, 
            message = l_result_0
        }, l_surfaceKey_0);
        error("Failed to decode");
    end;
    l_loadTimer_0.logResponseDataUpdateBegin();
    if l_parseHydrationDataFromResponse_0 then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 126 ]]
            -- upvalues: l_parseHydrationDataFromResponse_0 (copy), l_result_0 (copy), l_getSduiDataBinder_0 (ref)
            local v37 = l_parseHydrationDataFromResponse_0(l_result_0);
            l_getSduiDataBinder_0().updateDataStores(v37);
        end);
        if not l_status_1 then
            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToUpdateDataStores, {
                debugName = v32, 
                message = l_result_1
            }, l_surfaceKey_0);
        end;
    end;
    local v40 = {};
    if l_parseTemplateEntriesFromResponse_0 then
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 142 ]]
            -- upvalues: v40 (ref), l_parseTemplateEntriesFromResponse_0 (copy), l_result_0 (copy), v6 (ref)
            local _ = nil;
            local v42, v43 = l_parseTemplateEntriesFromResponse_0(l_result_0);
            v40 = v43;
            v6().addTemplates(v42);
        end);
        if not l_status_2 then
            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToAddTemplates, {
                debugName = v32, 
                message = l_result_2
            }, l_surfaceKey_0);
        end;
    end;
    l_loadTimer_0.logResponseDataUpdateEnd();
    l_loadTimer_0.logSduiTreeBuildBegin();
    local v46 = if l_parsePageEntriesFromResponse_0 then l_parsePageEntriesFromResponse_0(l_result_0) else {};
    local v47 = {};
    local v48 = #v46 > 1;
    for _, v50 in v46 do
        local l_identifier_0 = v50.identifier;
        local v52 = if v48 and l_identifier_0 and l_identifier_0 ~= "" then ("%*_%*"):format(v32, l_identifier_0) else v32;
        local l_componentInputData_0 = v50.componentInputData;
        local v54 = l_getInputDataSignalsForRequest_0(v52);
        local v55 = v54.get(false);
        if l_paginateResponse_0 and v55 then
            if l_componentInputData_0 then
                local v56 = v54.get(false);
                local v57 = table.clone(v56);
                v12(v57, l_componentInputData_0);
                v54.set(v57);
            end;
        else
            v54.set(l_componentInputData_0);
        end;
        if not (l_paginateResponse_0 and v55) then
            local l_robloxComponentType_0 = v50.robloxComponentType;
            if not l_robloxComponentType_0 then
                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToAddTemplates, {
                    debugName = v32, 
                    message = "Page entry missing robloxComponentType"
                }, l_surfaceKey_0);
                continue;
            else
                local v59 = v40[l_robloxComponentType_0];
                if not v59 then
                    l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToMapRobloxComponentToTemplate, {
                        debugName = v32, 
                        name = l_robloxComponentType_0, 
                        message = ("Missing template for robloxComponentType %*"):format(l_robloxComponentType_0)
                    }, l_surfaceKey_0);
                    continue;
                else
                    local l_status_3, l_result_3 = pcall(function() --[[ Line: 214 ]]
                        -- upvalues: l_createBuilderConfig_0 (ref), l_surfaceKey_0 (copy), v32 (copy), v40 (ref), l_getSduiClientBindingBuilder_0 (ref), v59 (copy), v54 (copy)
                        local v61 = l_createBuilderConfig_0({
                            appPage = l_surfaceKey_0, 
                            debugName = v32, 
                            getTemplateForRobloxComponent = function(v60) --[[ Line: 218 ]] --[[ Name: getTemplateForRobloxComponent ]]
                                -- upvalues: v40 (ref)
                                return v40[v60];
                            end
                        });
                        return (l_getSduiClientBindingBuilder_0().buildConfigForComponent(v59, v54.get, v61));
                    end);
                    if l_status_3 then
                        if v47[v52] then
                            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.DuplicateOrMissingIdentifier, {
                                debugName = v52, 
                                name = l_robloxComponentType_0, 
                                message = ("Existing config found for cacheKey %*. Need to specify identifer in page entry for multiple configs"):format(v52)
                            }, l_surfaceKey_0);
                        end;
                        v47[v52] = {
                            config = l_result_3
                        };
                    else
                        l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToBuildClientBindingConfig, {
                            debugName = v32, 
                            name = l_robloxComponentType_0, 
                            message = ("%*"):format(l_result_3)
                        }, l_surfaceKey_0);
                    end;
                    if v50.title and v47[v52] then
                        v47[v52].title = v50.title;
                    end;
                end;
            end;
        end;
        v47[v52] = v47[v52] or {};
        if l_buildNextPageUrl_0 then
            v47[v52].nextPageUrl = l_buildNextPageUrl_0(l_result_0) or "";
        else
            v47[v52].nextPageUrl = "";
        end;
    end;
    if not next(v47) and not l_paginateResponse_0 then
        l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.NoComponentConfigsBuilt, {
            debugName = v32, 
            message = ("No configs built when handling proto response for %*"):format(v32)
        }, l_surfaceKey_0);
    end;
    l_loadTimer_0.logSduiTreeBuildEnd();
    return v47;
end;