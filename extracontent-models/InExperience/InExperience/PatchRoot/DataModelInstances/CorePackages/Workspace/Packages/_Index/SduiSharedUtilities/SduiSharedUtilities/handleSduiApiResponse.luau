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
local l_FFlagSduiAllowNoConfigsBuilt_0 = require(l_Parent_0.SharedFlags).FFlagSduiAllowNoConfigsBuilt;
local function v13(v14, v15) --[[ Line: 30 ]] --[[ Name: mergeTables ]]
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
local function _(v20, v21) --[[ Line: 52 ]] --[[ Name: getUpdatedInputData ]]
    -- upvalues: v13 (copy)
    local v22 = table.clone(v20);
    v13(v22, v21);
    return v22;
end;
return function(v24) --[[ Line: 69 ]] --[[ Name: handleSduiApiResponse ]]
    -- upvalues: l_FFlagSduiAllowNoConfigsBuilt_0 (copy), l_SduiRequestStatus_0 (copy), l_SduiLogger_0 (copy), l_SduiErrors_0 (copy), l_getSduiDataBinder_0 (copy), v6 (copy), v13 (copy), l_createBuilderConfig_0 (copy), l_getSduiClientBindingBuilder_0 (copy)
    local l_response_0 = v24.response;
    local l_decodeResponse_0 = v24.decodeResponse;
    local l_parsePageEntriesFromResponse_0 = v24.parsePageEntriesFromResponse;
    local l_parseHydrationDataFromResponse_0 = v24.parseHydrationDataFromResponse;
    local l_parseTemplateEntriesFromResponse_0 = v24.parseTemplateEntriesFromResponse;
    local l_getInputDataSignalsForRequest_0 = v24.getInputDataSignalsForRequest;
    local l_loadTimer_0 = v24.loadTimer;
    local l_surfaceKey_0 = v24.surfaceKey;
    local v33 = v24.configCacheKey or v24.surfaceKey;
    local l_paginateResponse_0 = v24.paginateResponse;
    local l_buildNextPageUrl_0 = v24.buildNextPageUrl;
    local v36 = if l_FFlagSduiAllowNoConfigsBuilt_0 then v24.allowNoConfigsBuilt else nil;
    assert(v33, "configCacheKey must exist");
    l_loadTimer_0.logNetRequestStats(l_response_0.Stats);
    l_loadTimer_0.logResponseDecodeBegin();
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 107 ]]
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
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 130 ]]
            -- upvalues: l_parseHydrationDataFromResponse_0 (copy), l_result_0 (copy), l_getSduiDataBinder_0 (ref)
            local v39 = l_parseHydrationDataFromResponse_0(l_result_0);
            l_getSduiDataBinder_0().updateDataStores(v39);
        end);
        if not l_status_1 then
            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToUpdateDataStores, {
                debugName = v33, 
                message = l_result_1
            }, l_surfaceKey_0);
        end;
    end;
    local v42 = {};
    if l_parseTemplateEntriesFromResponse_0 then
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 146 ]]
            -- upvalues: v42 (ref), l_parseTemplateEntriesFromResponse_0 (copy), l_result_0 (copy), v6 (ref)
            local _ = nil;
            local v44, v45 = l_parseTemplateEntriesFromResponse_0(l_result_0);
            v42 = v45;
            v6().addTemplates(v44);
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
    local v48 = if l_parsePageEntriesFromResponse_0 then l_parsePageEntriesFromResponse_0(l_result_0) else {};
    local v49 = {};
    local v50 = #v48 > 1;
    for _, v52 in v48 do
        local l_identifier_0 = v52.identifier;
        local v54 = if v50 and l_identifier_0 and l_identifier_0 ~= "" then ("%*_%*"):format(v33, l_identifier_0) else v33;
        local l_componentInputData_0 = v52.componentInputData;
        local v56 = l_getInputDataSignalsForRequest_0(v54);
        local v57 = v56.get(false);
        if l_paginateResponse_0 and v57 then
            if l_componentInputData_0 then
                local v58 = v56.get(false);
                local v59 = table.clone(v58);
                v13(v59, l_componentInputData_0);
                v56.set(v59);
            end;
        else
            v56.set(l_componentInputData_0);
        end;
        if not (l_paginateResponse_0 and v57) then
            local l_robloxComponentType_0 = v52.robloxComponentType;
            if not l_robloxComponentType_0 then
                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToAddTemplates, {
                    debugName = v33, 
                    message = "Page entry missing robloxComponentType"
                }, l_surfaceKey_0);
                continue;
            else
                local v61 = v42[l_robloxComponentType_0];
                if not v61 then
                    l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToMapRobloxComponentToTemplate, {
                        debugName = v33, 
                        name = l_robloxComponentType_0, 
                        message = ("Missing template for robloxComponentType %*"):format(l_robloxComponentType_0)
                    }, l_surfaceKey_0);
                    continue;
                else
                    local l_status_3, l_result_3 = pcall(function() --[[ Line: 218 ]]
                        -- upvalues: l_createBuilderConfig_0 (ref), l_surfaceKey_0 (copy), v33 (copy), v42 (ref), l_getSduiClientBindingBuilder_0 (ref), v61 (copy), v56 (copy)
                        local v63 = l_createBuilderConfig_0({
                            appPage = l_surfaceKey_0, 
                            debugName = v33, 
                            getTemplateForRobloxComponent = function(v62) --[[ Line: 222 ]] --[[ Name: getTemplateForRobloxComponent ]]
                                -- upvalues: v42 (ref)
                                return v42[v62];
                            end
                        });
                        return (l_getSduiClientBindingBuilder_0().buildConfigForComponent(v61, v56.get, v63));
                    end);
                    if l_status_3 then
                        if v49[v54] then
                            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.DuplicateOrMissingIdentifier, {
                                debugName = v54, 
                                name = l_robloxComponentType_0, 
                                message = ("Existing config found for cacheKey %*. Need to specify identifer in page entry for multiple configs"):format(v54)
                            }, l_surfaceKey_0);
                        end;
                        v49[v54] = {
                            config = l_result_3
                        };
                    else
                        l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToBuildClientBindingConfig, {
                            debugName = v33, 
                            name = l_robloxComponentType_0, 
                            message = ("%*"):format(l_result_3)
                        }, l_surfaceKey_0);
                    end;
                    if v52.title and v49[v54] then
                        v49[v54].title = v52.title;
                    end;
                end;
            end;
        end;
        v49[v54] = v49[v54] or {};
        if l_buildNextPageUrl_0 then
            v49[v54].nextPageUrl = l_buildNextPageUrl_0(l_result_0) or "";
        else
            v49[v54].nextPageUrl = "";
        end;
    end;
    if not next(v49) and not l_paginateResponse_0 and (not l_FFlagSduiAllowNoConfigsBuilt_0 or not v36) then
        l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.NoComponentConfigsBuilt, {
            debugName = v33, 
            message = ("No configs built when handling proto response for %*"):format(v33)
        }, l_surfaceKey_0);
    end;
    l_loadTimer_0.logSduiTreeBuildEnd();
    return v49;
end;