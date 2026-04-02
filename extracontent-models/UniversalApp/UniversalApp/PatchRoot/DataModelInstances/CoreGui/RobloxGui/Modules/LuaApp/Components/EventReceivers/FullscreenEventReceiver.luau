local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_AppUserGameSettings_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUserGameSettings;
local v8 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v9 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v10 = require(l_Modules_0.LuaApp.Components.ExitFullscreenToast);
local v11 = v2.PureComponent:extend("FullscreenEventReceiver");
v11.init = function(v12) --[[ Line: 17 ]] --[[ Name: init ]]
    v12:setState({
        fullscreenEnabled = v12.props.appUserGameSettings:InFullScreen()
    });
    v12.onFullscreenChanged = function(v13) --[[ Line: 22 ]]
        -- upvalues: v12 (copy)
        v12:setState({
            fullscreenEnabled = v13
        });
    end;
end;
v11.sendAnalytics = function(v14) --[[ Line: 29 ]] --[[ Name: sendAnalytics ]]
    v14.props.analytics.EventStream:setRBXEventStream("LuaApp", "FullscreenMode", {
        enabled = v14.state.fullscreenEnabled
    });
end;
v11.render = function(v15) --[[ Line: 36 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v2 (copy), v9 (copy), v10 (copy)
    local v16 = v15.props.preferredInputRef and v15.props.preferredInputRef.current == v8.Input.Pointer;
    return v2.createFragment({
        EventConnector = v2.createElement(v9, {
            event = v15.props.appUserGameSettings.FullscreenChanged, 
            callback = v15.onFullscreenChanged
        }), 
        ExitFullscreenToast = v16 and v15.state.fullscreenEnabled and v2.createElement(v10)
    });
end;
v11.didMount = function(v17) --[[ Line: 50 ]] --[[ Name: didMount ]]
    v17:sendAnalytics();
end;
v11.didUpdate = function(v18, _, v20) --[[ Line: 54 ]] --[[ Name: didUpdate ]]
    if v20.fullscreenEnabled ~= v18.state.fullscreenEnabled then
        v18:sendAnalytics();
    end;
end;
v11 = l_RoactServices_0.connect({
    analytics = v6, 
    appUserGameSettings = l_AppUserGameSettings_0
})(v11);
return function(v21) --[[ Line: 64 ]] --[[ Name: FullscreenEventReceiverContainer ]]
    -- upvalues: v8 (copy), v3 (copy), v2 (copy), v11 (ref), v4 (copy)
    local v22 = v8.usePreferredInput();
    local v23 = v3.useRef(nil);
    v23.current = v22;
    return v2.createElement(v11, v4.Dictionary.join(v21, {
        preferredInputRef = v23
    }));
end;