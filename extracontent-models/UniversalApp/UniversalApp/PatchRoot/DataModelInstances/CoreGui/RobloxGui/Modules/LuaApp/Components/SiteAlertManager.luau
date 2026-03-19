local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v7 = require(l_Modules_0.LuaApp.Thunks.ApiFetchSiteMessage);
local v8 = require(l_Modules_0.LuaApp.Actions.RefreshSiteAlertInfo);
local v9 = v2.PureComponent:extend("SiteAlertManager");
v9.render = function(_) --[[ Line: 13 ]] --[[ Name: render ]]

end;
v9.didUpdate = function(v11, v12) --[[ Line: 15 ]] --[[ Name: didUpdate ]]
    if not v12.updateRequested and v11.props.updateRequested then
        local v13 = os.time();
        local l_messageTime_0 = v11.props.messageTime;
        if l_messageTime_0 and v13 - l_messageTime_0 < v11.props.alertRateLimit then
            v11.props.dismissRefresh();
            return;
        else
            v11.props.refresh(v11.props.networking);
        end;
    end;
end;
v9 = v3.connect(function(v15, _) --[[ Line: 27 ]]
    return {
        messageTime = v15.SiteMessage.timestamp, 
        updateRequested = v15.SiteMessage.updateRequested
    };
end, function(v17) --[[ Line: 32 ]]
    -- upvalues: v7 (copy), v8 (copy)
    return {
        refresh = function(v18) --[[ Line: 34 ]] --[[ Name: refresh ]]
            -- upvalues: v17 (copy), v7 (ref)
            v17(v7(v18));
        end, 
        dismissRefresh = function() --[[ Line: 37 ]] --[[ Name: dismissRefresh ]]
            -- upvalues: v17 (copy), v8 (ref)
            v17(v8({
                updateRequested = false
            }));
        end
    };
end)(v9);
v9 = l_RoactServices_0.connect({
    networking = v5
})(v9);
return (l_RoactAppPolicy_0.connect(function(v19, _) --[[ Line: 49 ]]
    return {
        alertRateLimit = v19.getAlertRateLimit()
    };
end)(v9));