local l_Parent_0 = script:FindFirstAncestor("GameDetail").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v2 = require(l_Parent_0.SduiSharedUtilities);
local l_SduiResponseType_0 = v2.SduiResponseType;
local l_getSduiApiStore_0 = v2.getSduiApiStore;
local v5 = require(script.Parent.getExperienceDetailsUrl);
local v6 = require(script.Parent.getExperienceDetailsPageKey);
return function(v7, v8, v9) --[[ Line: 12 ]] --[[ Name: fetchExperienceDetailsPage ]]
    -- upvalues: v5 (copy), l_Parent_0 (copy), l_getSduiApiStore_0 (copy), l_SduiResponseType_0 (copy), l_AppPage_0 (copy), v6 (copy)
    local v10 = v5(v7);
    local l_experience_details_page_0 = require(l_Parent_0.ServiceContractsProto).apppageplatform.experiencedetails.experience_details_page;
    l_getSduiApiStore_0().fetchIfNeeded({
        responseType = l_SduiResponseType_0.Protobuf, 
        url = v10, 
        surfaceKey = l_AppPage_0.ExperienceDetail, 
        configKey = v6(v7), 
        loadTimer = v8, 
        apiProto = l_experience_details_page_0.ExperienceDetailsPageResponse
    }, v9);
end;