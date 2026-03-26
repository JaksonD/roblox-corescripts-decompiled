local l_Parent_0 = script:FindFirstAncestor("ServerTriggeredModals").Parent;
local _ = require(script.Parent.PromptsEntryPoint);
local _ = require(script.Parent.Types.PromptsTypes);
local v3 = require(l_Parent_0.SduiSharedUtilities);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local l_SduiResponseType_0 = v3.SduiResponseType;
local l_getSduiApiStore_0 = v3.getSduiApiStore;
local l_FFlagSduiAllowNoConfigsBuilt_0 = require(l_Parent_0.SharedFlags).FFlagSduiAllowNoConfigsBuilt;
local function v10(v9) --[[ Line: 26 ]] --[[ Name: getPromptsUrl ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_UrlBase_0 (copy)
    return l_UrlBuilder_0.new({
        base = l_UrlBase_0.APIS, 
        path = "modals-api/v1/prompts", 
        query = {
            entryPoint = v9
        }
    })();
end;
return function(v11, v12) --[[ Line: 37 ]] --[[ Name: fetchPrompts ]]
    -- upvalues: l_Parent_0 (copy), l_getSduiApiStore_0 (copy), l_SduiResponseType_0 (copy), v10 (copy), l_FFlagSduiAllowNoConfigsBuilt_0 (copy)
    local l_GetEligiblePromptsResponse_0 = require(l_Parent_0.ServiceContractsProto).apppageplatform.prompts.prompts.GetEligiblePromptsResponse;
    l_getSduiApiStore_0().fetchIfNeeded({
        responseType = l_SduiResponseType_0.ProtobufJson, 
        url = v10(v11.entryPoint), 
        surfaceKey = v11.surfaceKey, 
        configKey = v11.configKey, 
        clearOnEmptyResponse = v11.clearOnEmptyResponse, 
        allowNoConfigsBuilt = if l_FFlagSduiAllowNoConfigsBuilt_0 then v11.allowNoConfigsBuilt else nil, 
        loadTimer = v11.loadTimer, 
        apiProto = l_GetEligiblePromptsResponse_0
    }, v12);
end;