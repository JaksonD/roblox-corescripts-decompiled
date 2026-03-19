local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local v4 = require(l_Modules_0.Flags.GetFStringInExperienceNotificationsLayer);
local v5 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteMenuIXP);
local l_GetFFlagInviteListRerank_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank;
local v7 = {};
v7.__index = v7;
v7.new = function(v8) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: l_IXPServiceWrapper_0 (copy), l_GetFFlagInviteListRerank_0 (copy), v7 (copy)
    local v9 = {
        _ixpServiceWrapper = v8 or l_IXPServiceWrapper_0, 
        _styleEnabled = false, 
        _customizationEnabled = false, 
        _newSendEndpointEnabled = false, 
        _inviteListSortOrder = l_GetFFlagInviteListRerank_0() and 0 or nil
    };
    setmetatable(v9, v7);
    return v9;
end;
v7.getStyleEnabled = function(v10) --[[ Line: 32 ]] --[[ Name: getStyleEnabled ]]
    return v10._styleEnabled;
end;
v7.getCustomizationEnabled = function(v11) --[[ Line: 36 ]] --[[ Name: getCustomizationEnabled ]]
    return v11._customizationEnabled;
end;
v7.getNewSendEndpointEnabled = function(v12) --[[ Line: 40 ]] --[[ Name: getNewSendEndpointEnabled ]]
    return v12._newSendEndpointEnabled;
end;
if l_GetFFlagInviteListRerank_0() then
    v7.getInviteListSortOrder = function(v13) --[[ Line: 45 ]] --[[ Name: getInviteListSortOrder ]]
        return v13._inviteListSortOrder;
    end;
end;
v7.initialize = function(v14) --[[ Line: 50 ]] --[[ Name: initialize ]]
    -- upvalues: v5 (copy), v4 (copy), l_GetFFlagInviteListRerank_0 (copy)
    if not v5() then
        return;
    else
        task.spawn(function() --[[ Line: 55 ]]
            -- upvalues: v14 (copy), v4 (ref), l_GetFFlagInviteListRerank_0 (ref)
            v14._ixpServiceWrapper:WaitForInitialization();
            local l_LayerData_0 = v14._ixpServiceWrapper:GetLayerData(v4());
            if l_LayerData_0 then
                v14._styleEnabled = l_LayerData_0.NewInviteMenuStyleEnabled or false;
                v14._customizationEnabled = l_LayerData_0.NewInviteMenuCustomizationEnabled or false;
                v14._newSendEndpointEnabled = l_LayerData_0.NewInviteMenuEndpointEnabled or false;
                v14._inviteListSortOrder = if l_GetFFlagInviteListRerank_0() then l_LayerData_0.invite_list_sort_order or 0 else nil;
            end;
        end);
        return;
    end;
end;
v7.default = v7.new();
return v7;