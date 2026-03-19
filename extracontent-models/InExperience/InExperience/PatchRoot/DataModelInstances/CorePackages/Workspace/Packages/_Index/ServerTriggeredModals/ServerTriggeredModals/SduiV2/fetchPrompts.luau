local l_Parent_0 = script:FindFirstAncestor("ServerTriggeredModals").Parent;
local _ = require(script.Parent.PromptsEntryPoint);
local _ = require(script.Parent.Types.PromptsTypes);
local v3 = require(l_Parent_0.SduiSharedUtilities);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local l_SduiResponseType_0 = v3.SduiResponseType;
local l_getSduiApiStore_0 = v3.getSduiApiStore;
local function v9(v8) --[[ Line: 24 ]] --[[ Name: getPromptsUrl ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_UrlBase_0 (copy)
    return l_UrlBuilder_0.new({
        base = l_UrlBase_0.APIS, 
        path = "modals-api/v1/prompts", 
        query = {
            entryPoint = v8
        }
    })();
end;
return function(v10, v11) --[[ Line: 35 ]] --[[ Name: fetchPrompts ]]
    -- upvalues: l_Parent_0 (copy), l_getSduiApiStore_0 (copy), l_SduiResponseType_0 (copy), v9 (copy)
    local l_GetEligiblePromptsResponse_0 = require(l_Parent_0.ServiceContractsProto).apppageplatform.prompts.prompts.GetEligiblePromptsResponse;
    l_getSduiApiStore_0().fetchIfNeeded({
        responseType = l_SduiResponseType_0.ProtobufJson, 
        url = v9(v10.entryPoint), 
        surfaceKey = v10.surfaceKey, 
        configKey = v10.configKey, 
        clearOnEmptyResponse = v10.clearOnEmptyResponse, 
        loadTimer = v10.loadTimer, 
        apiProto = l_GetEligiblePromptsResponse_0
    }, v11);
end;