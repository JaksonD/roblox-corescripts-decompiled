local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerTriggeredModals");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.DeepLink);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_Parent_0.SharedFlags);
local v7 = require(l_Parent_0.t);
local l_validateSduiComponentConfig_0 = require(l_Parent_0.ServerDrivenUi).validateSduiComponentConfig;
local _ = require(l_script_FirstAncestor_0.EntryPoint);
local v10 = require(l_script_FirstAncestor_0.logResponseStatus);
local v11 = require(l_script_FirstAncestor_0.logResponseLatency);
local _ = require(l_script_FirstAncestor_0.SignalStores.createModalSignalStore);
local v13 = require(l_script_FirstAncestor_0.SignalStores.getModalSignalStore);
local l_FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals_0 = v6.FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals;
local l_FFlagEnableDeepLinkHistoryWithModalAPI_0 = v6.FFlagEnableDeepLinkHistoryWithModalAPI;
local v16 = v7.interface({
    modalId = v7.string, 
    modalType = v7.string, 
    sdui = if l_FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals_0 then v7.optional(v7.table) else v7.table, 
    isCustomHandler = if l_FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals_0 then v7.optional(v7.boolean) else nil
});
local v17 = {};
local function v22(v18) --[[ Line: 37 ]] --[[ Name: getModalMetadataUrl ]]
    -- upvalues: l_FFlagEnableDeepLinkHistoryWithModalAPI_0 (copy), v2 (copy), l_UrlBuilder_0 (copy), l_UrlBase_0 (copy)
    local v19 = nil;
    if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
        local v20 = v2.DeepLinkLuaReceiverStatusStore(false).getLastDetectedPostAuthUrl(false);
        local v21 = false;
        if v20 ~= nil then
            v21 = v20 ~= "";
        end;
        v19 = v21;
    end;
    return l_UrlBuilder_0.new({
        base = l_UrlBase_0.APIS, 
        path = "modals-api/v1/modal", 
        query = {
            entryPoint = v18, 
            hasDetectedDeepLink = if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then tostring(v19) else nil
        }
    })();
end;
local function v30(v23) --[[ Line: 56 ]] --[[ Name: parseResponseToMetadata ]]
    -- upvalues: v16 (copy), l_FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals_0 (copy), l_validateSduiComponentConfig_0 (copy)
    local v24, v25 = v16(v23);
    if not v24 then
        return {
            metadata = nil, 
            errorMessage = v25
        };
    else
        local v26 = if l_FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals_0 then v23 and v23.isCustomHandler else false;
        if not l_FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals_0 or not v26 then
            local v27, v28 = l_validateSduiComponentConfig_0(v23.sdui);
            if not v27 then
                local v29 = if v28 and v28.message then v28.message else "Invalid sdui config";
                return {
                    metadata = nil, 
                    errorMessage = v29
                };
            end;
        end;
        return {
            metadata = {
                modalId = v23.modalId, 
                modalType = v23.modalType, 
                sduiConfig = v23.sdui, 
                isCustomHandler = if l_FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals_0 then v23.isCustomHandler else nil
            }, 
            errorMessage = nil
        };
    end;
end;
return function(v31, v32) --[[ Line: 90 ]]
    -- upvalues: v13 (copy), v5 (copy), v17 (copy), v22 (copy), v11 (copy), v30 (copy), v10 (copy)
    local v33 = v13(false);
    local v34 = v33.getMetadataGetter(v32)(false);
    if v34 ~= nil then
        return v5.resolve(v34);
    else
        local v35 = v17[v32];
        if v35 then
            return v35;
        else
            local v36 = v22(v32);
            local v37 = nil;
            v37 = v5.new(function(v38, v39, v40) --[[ Line: 105 ]]
                -- upvalues: v31 (copy), v36 (copy), v11 (ref), v30 (ref), v33 (copy), v32 (copy), v10 (ref)
                local v41 = v31(v36, "GET");
                v41:andThen(function(v42) --[[ Line: 108 ]]
                    -- upvalues: v11 (ref), v39 (copy), v30 (ref), v33 (ref), v32 (ref), v38 (copy)
                    local v43 = v42 and v42.responseCode or nil;
                    v11("modals-api/v1/modal", v42.responseTimeMs, v43);
                    if v43 ~= 200 then
                        v39((("Unexpected responseCode when fetching metadata: %*"):format(v43)));
                        return;
                    else
                        local v44 = v30(v42.responseBody);
                        if not v44.metadata then
                            v39((("Failed to parse modal metadata response: %*"):format(v44.errorMessage)));
                            return;
                        else
                            v33.setMetadata(v32, v44.metadata);
                            v38(v44);
                            return;
                        end;
                    end;
                end):catch(function(v45) --[[ Line: 125 ]]
                    -- upvalues: v10 (ref), v39 (copy)
                    v10("modals-api/v1/modal", v45.StatusCode);
                    v39((("Failed to fetch modal metadata: %*"):format(v45)));
                end);
                v40(function() --[[ Line: 130 ]]
                    -- upvalues: v41 (copy)
                    v41:cancel();
                end);
            end);
            v17[v32] = v37;
            v37:finally(function() --[[ Line: 136 ]]
                -- upvalues: v17 (ref), v32 (copy), v37 (ref)
                assert(v17[v32] == v37, "In-flight request promise mismatch");
                v17[v32] = nil;
            end);
            return v37;
        end;
    end;
end;