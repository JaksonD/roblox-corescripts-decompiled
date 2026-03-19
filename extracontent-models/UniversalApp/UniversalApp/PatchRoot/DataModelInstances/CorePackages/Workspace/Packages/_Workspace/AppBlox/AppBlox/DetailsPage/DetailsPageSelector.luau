local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(script.Parent.DetailsPageTemplate);
local v2 = require(script.Parent.DetailsPageTenfootTemplate);
local l_DeviceType_0 = require(l_Parent_0.RobloxAppEnums).DeviceType;
local v4 = require(l_Parent_0.React);
local v5 = {
    [l_DeviceType_0.Console] = v2, 
    [l_DeviceType_0.Phone] = v1, 
    [l_DeviceType_0.Desktop] = v1, 
    [l_DeviceType_0.Unknown] = v1, 
    [l_DeviceType_0.Tablet] = v1, 
    [l_DeviceType_0.VR] = v1
};
return function(v6) --[[ Line: 32 ]] --[[ Name: DetailsPageTemplateSelector ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (copy)
    local v7 = v5[v6.deviceType] or v1;
    return v4.createElement(v7, v6.detailsPageProps);
end;