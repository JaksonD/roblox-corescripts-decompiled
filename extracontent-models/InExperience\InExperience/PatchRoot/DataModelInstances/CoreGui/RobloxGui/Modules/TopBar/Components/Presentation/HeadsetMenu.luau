local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_VRService_0 = game:GetService("VRService");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Packages.Signals);
local v9 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_Parent_0 = script.Parent.Parent.Parent;
local v11 = require(l_Parent_0.Parent.Common.EventConnection);
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_FFlagTopBarSignalizeScreenSize_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize;
local v14 = require(script.DisconnectedDialog);
local v15 = v5.PureComponent:extend("HeadsetMenu");
v15.validateProps = v7.strictInterface({
    screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else v7.Vector2, 
    vrService = v7.optional(v7.union(v7.instanceOf("VRService"), v7.table)), 
    guiService = v7.optional(v7.union(v7.instanceOf("GuiService"), v7.table))
});
v15.defaultProps = {
    vrService = l_VRService_0, 
    guiService = l_GuiService_0
};
v15.init = function(v16) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: l_isSubjectToDesktopPolicies_0 (copy), l_RunService_0 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy), v9 (copy), v8 (copy)
    v16.state = {
        vrDeviceAvailable = false, 
        shouldShowDisconnectDialog = false
    };
    v16.restartApp = function() --[[ Line: 43 ]]
        -- upvalues: v16 (copy), l_isSubjectToDesktopPolicies_0 (ref), l_RunService_0 (ref)
        local l_NotificationTypeList_0 = v16.props.guiService:GetNotificationTypeList();
        if l_isSubjectToDesktopPolicies_0() then
            if game:GetEngineFeature("EnableLuaControlsRestartApp") then
                v16.props.guiService:BroadcastNotification("", l_NotificationTypeList_0.RESTART_APP);
            else
                v16.props.guiService:BroadcastNotification("", l_NotificationTypeList_0.NATIVE_EXIT);
            end;
        else
            l_RunService_0.Heartbeat:Wait();
            game:Shutdown();
        end;
        v16:setState({
            shouldShowDisconnectDialog = false
        });
    end;
    if l_FFlagTopBarSignalizeScreenSize_0 then
        local l_getViewportSize_0 = v9.GetDisplayStore(false).getViewportSize;
        v16.disposeScreenSize = v8.createEffect(function(v19) --[[ Line: 65 ]]
            -- upvalues: v16 (copy), l_getViewportSize_0 (copy)
            v16:setState({
                screenSize = l_getViewportSize_0(v19)
            });
        end);
    end;
end;
v15.render = function(v20) --[[ Line: 73 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v11 (copy), v14 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy)
    return v5.createFragment({
        HeadsetConnection = v5.createElement(v11, {
            event = v20.props.vrService:GetPropertyChangedSignal("VRDeviceAvailable"), 
            callback = function() --[[ Line: 77 ]] --[[ Name: callback ]]
                -- upvalues: v20 (copy)
                v20:setState({
                    vrDeviceAvailable = v20.props.vrService.VRDeviceAvailable
                });
            end
        }, {
            HeadsetDisconnectedDialog = v5.createElement(v14, {
                visible = v20.state.shouldShowDisconnectDialog, 
                screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then v20.state.screenSize else v20.props.screenSize, 
                onConfirm = v20.restartApp, 
                guiService = v20.props.guiService
            })
        })
    });
end;
v15.didMount = function(v21) --[[ Line: 93 ]] --[[ Name: didMount ]]
    v21:setState({
        vrDeviceAvailable = v21.props.vrService.VRDeviceAvailable
    });
end;
v15.willUnmount = function(v22) --[[ Line: 99 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagTopBarSignalizeScreenSize_0 (copy)
    if l_FFlagTopBarSignalizeScreenSize_0 then
        v22.disposeScreenSize();
    end;
end;
v15.didUpdate = function(v23, _, v25) --[[ Line: 105 ]] --[[ Name: didUpdate ]]
    if v23.state.vrDeviceAvailable ~= v25.vrDeviceAvailable and not v23.state.vrDeviceAvailable then
        v23:setState({
            shouldShowDisconnectDialog = true
        });
    end;
end;
if not l_FFlagTopBarSignalizeScreenSize_0 then
    v15 = v6.connect(function(v26) --[[ Line: 116 ]]
        return {
            screenSize = v26.displayOptions.screenSize
        };
    end)(v15);
end;
return v15;