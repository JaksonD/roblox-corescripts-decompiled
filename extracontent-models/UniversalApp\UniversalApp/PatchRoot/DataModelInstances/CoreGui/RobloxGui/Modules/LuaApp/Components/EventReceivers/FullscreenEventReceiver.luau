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
local v12 = game:DefineFastFlag("DisableFullscreenToastWhenNotPointer", false);
v11.init = function(v13) --[[ Line: 18 ]] --[[ Name: init ]]
    v13:setState({
        fullscreenEnabled = v13.props.appUserGameSettings:InFullScreen()
    });
    v13.onFullscreenChanged = function(v14) --[[ Line: 23 ]]
        -- upvalues: v13 (copy)
        v13:setState({
            fullscreenEnabled = v14
        });
    end;
end;
v11.sendAnalytics = function(v15) --[[ Line: 30 ]] --[[ Name: sendAnalytics ]]
    v15.props.analytics.EventStream:setRBXEventStream("LuaApp", "FullscreenMode", {
        enabled = v15.state.fullscreenEnabled
    });
end;
v11.render = function(v16) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), v8 (copy), v2 (copy), v9 (copy), v10 (copy)
    if v12 then
        local v17 = v16.props.preferredInputRef and v16.props.preferredInputRef.current == v8.Input.Pointer;
        return v2.createFragment({
            EventConnector = v2.createElement(v9, {
                event = v16.props.appUserGameSettings.FullscreenChanged, 
                callback = v16.onFullscreenChanged
            }), 
            ExitFullscreenToast = v17 and v16.state.fullscreenEnabled and v2.createElement(v10)
        });
    else
        return v2.createFragment({
            EventConnector = v2.createElement(v9, {
                event = v16.props.appUserGameSettings.FullscreenChanged, 
                callback = v16.onFullscreenChanged
            }), 
            ExitFullscreenToast = v16.state.fullscreenEnabled and v2.createElement(v10)
        });
    end;
end;
v11.didMount = function(v18) --[[ Line: 61 ]] --[[ Name: didMount ]]
    v18:sendAnalytics();
end;
v11.didUpdate = function(v19, _, v21) --[[ Line: 65 ]] --[[ Name: didUpdate ]]
    if v21.fullscreenEnabled ~= v19.state.fullscreenEnabled then
        v19:sendAnalytics();
    end;
end;
v11 = l_RoactServices_0.connect({
    analytics = v6, 
    appUserGameSettings = l_AppUserGameSettings_0
})(v11);
if v12 then
    return function(v22) --[[ Line: 77 ]] --[[ Name: FullscreenEventReceiverContainer ]]
        -- upvalues: v8 (copy), v3 (copy), v2 (copy), v11 (ref), v4 (copy)
        local v23 = v8.usePreferredInput();
        local v24 = v3.useRef(nil);
        v24.current = v23;
        return v2.createElement(v11, v4.Dictionary.join(v22, {
            preferredInputRef = v24
        }));
    end;
else
    return v11;
end;