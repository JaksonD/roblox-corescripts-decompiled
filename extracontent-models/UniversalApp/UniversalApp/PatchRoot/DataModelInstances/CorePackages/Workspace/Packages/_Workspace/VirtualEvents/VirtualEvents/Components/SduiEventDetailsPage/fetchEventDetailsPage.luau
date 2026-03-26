local l_Parent_0 = script:FindFirstAncestor("VirtualEvents").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v2 = require(l_Parent_0.SduiSharedUtilities);
local l_SduiResponseType_0 = v2.SduiResponseType;
local l_getSduiApiStore_0 = v2.getSduiApiStore;
local v5 = require(script.Parent.getEventDetailsUrl);
local v6 = require(script.Parent.getEventDetailsPageKey);
return function(v7, v8) --[[ Line: 13 ]] --[[ Name: fetchEventDetailsPage ]]
    -- upvalues: v5 (copy), l_Parent_0 (copy), l_getSduiApiStore_0 (copy), l_SduiResponseType_0 (copy), l_AppPage_0 (copy), v6 (copy)
    local v9 = v5(v7);
    local l_experience_event_details_page_0 = require(l_Parent_0.ServiceContractsProto).apppageplatform.experienceevents.experience_event_details_page;
    l_getSduiApiStore_0().fetchIfNeeded({
        responseType = l_SduiResponseType_0.Protobuf, 
        url = v9, 
        surfaceKey = l_AppPage_0.EventDetails, 
        configKey = v6(v7), 
        loadTimer = v8, 
        apiProto = l_experience_event_details_page_0.ExperienceEventDetailsPageResponse
    });
end;