local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = v4.Style.withStyle;
local l_LoadingAlert_0 = v4.App.Dialog.Alert.LoadingAlert;
local v8 = require(l_Modules_0.LuaApp.Constants);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_AppRunService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppRunService;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local v13 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v14 = require(l_Modules_0.LuaApp.Components.ScreenGuiWithBlurControl);
local v15 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v16 = require(l_Modules_0.LuaApp.StateTable);
local v17 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger:new(script:GetFullName());
local v18 = v3.PureComponent:extend("NativeHandshakeWrapper");
v18.validateProps = v5.strictInterface({
    errorMessage = v5.string, 
    notificationData = v5.string, 
    notificationType = v5.any, 
    responseType = v5.string, 
    title = v5.string, 
    navigation = v5.table, 
    isVisible = v5.optional(v5.boolean), 
    cancelTimeout = v5.optional(v5.number), 
    dispatchTimeout = v5.optional(v5.number), 
    DisplayOrder = v5.optional(v5.number), 
    errorSubMessage = v5.optional(v5.string), 
    responseNamespace = v5.optional(v5.string), 
    responseCancelled = v5.optional(v5.string), 
    responseFailure = v5.optional(v5.string), 
    responseSuccess = v5.optional(v5.string), 
    showBackButton = v5.optional(v5.boolean), 
    navigateBack = v5.callback, 
    onError = v5.callback, 
    guiService = v5.table, 
    runService = v5.table, 
    appNotificationService = v5.table
});
v18.defaultProps = {
    cancelTimeout = 1, 
    dispatchTimeout = 5, 
    DisplayOrder = 0, 
    responseNamespace = "AppShellNotifications", 
    responseCancelled = "cancelled", 
    responseFailure = "failure", 
    responseSuccess = "success", 
    showBackButton = false
};
local v19 = {
    Theme = {
        Overlay = {
            Color = v8.Color.GRAY1, 
            Transparency = 0.5
        }
    }
};
v18.init = function(v20) --[[ Line: 85 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy), v16 (copy), v13 (copy)
    v20.state = {
        screenSize = Vector2.new()
    };
    v20.waitingTimeoutRunning = false;
    v20.cancelTimeoutRunning = false;
    v20.stopTimers = function() --[[ Line: 93 ]]
        -- upvalues: v20 (copy)
        v20.waitingTimeoutRunning = false;
        v20.cancelTimeoutRunning = false;
    end;
    v20.closeSelf = function() --[[ Line: 98 ]]
        -- upvalues: v20 (copy)
        v20.stopTimers();
        v20:close();
    end;
    v20.closeWithError = function() --[[ Line: 103 ]]
        -- upvalues: v20 (copy)
        if v20.props.onError then
            v20.props.onError(v20.props.errorMessage, v20.props.errorSubMessage);
        end;
        v20.closeSelf();
    end;
    v20.broadcastNotification = function() --[[ Line: 110 ]]
        -- upvalues: v17 (ref), v20 (copy)
        v17:debug("Broadcasting NativeHandshakeWrapper notification");
        v20.startTime = tick();
        v20.waitingTimeoutRunning = true;
        v20:_broadcast(false);
    end;
    v20.broadcastCancel = function() --[[ Line: 117 ]]
        -- upvalues: v17 (ref), v20 (copy)
        v17:debug("Broadcasting NativeHandshakeWrapper cancellation");
        v20.waitingTimeoutRunning = false;
        v20.cancelTime = tick();
        v20.cancelTimeoutRunning = true;
        v20:_broadcast(true);
    end;
    v20.stateTable = v16.new("NativeHandshakeWrapper", "waiting", {}, {
        waiting = {
            successReceived = {
                nextState = "success", 
                action = v20.stopTimers
            }, 
            failureReceived = {
                nextState = "halt", 
                action = v20.closeWithError
            }, 
            cancelReceived = {
                nextState = "halt", 
                action = v20.closeWithError
            }, 
            onTimeout = {
                nextState = "timed_out", 
                action = v20.broadcastCancel
            }, 
            onCancel = {
                nextState = "cancelled", 
                action = v20.broadcastCancel
            }
        }, 
        cancelled = {
            successReceived = {
                nextState = "success"
            }, 
            failureReceived = {
                nextState = "halt", 
                action = v20.closeWithError
            }, 
            cancelReceived = {
                nextState = "halt", 
                action = v20.closeSelf
            }, 
            onTimeout = {
                nextState = "halt", 
                action = v20.closeWithError
            }
        }, 
        timed_out = {
            successReceived = {
                nextState = "success"
            }, 
            failureReceived = {
                nextState = "halt", 
                action = v20.closeWithError
            }, 
            cancelReceived = {
                nextState = "halt", 
                action = v20.closeWithError
            }, 
            onTimeout = {
                nextState = "halt", 
                action = v20.closeWithError
            }
        }, 
        success = {
            focusReceived = {
                nextState = "halt", 
                action = v20.closeSelf
            }
        }, 
        halt = {}
    });
    v20.back = function() --[[ Line: 151 ]]
        -- upvalues: v20 (copy)
        v20.stateTable.events.onCancel();
    end;
    v20.backButton = v13.makeBackButton(v20.back, true);
    v20.checkEvent = function(v21) --[[ Line: 157 ]]
        -- upvalues: v20 (copy), v17 (ref)
        if v21.namespace == v20.props.responseNamespace and v21.detailType == v20.props.responseType then
            v17:debug("Received message {}: {}", tostring(v21.detailType), (tostring(v21.detail)));
            if v21.detail == v20.props.responseSuccess then
                v20.stateTable.events.successReceived();
            elseif v21.detail == v20.props.responseFailure then
                v20.stateTable.events.failureReceived();
            elseif v21.detail == v20.props.responseCancelled then
                v20.stateTable.events.cancelReceived();
            end;
        end;
        if v21.namespace == "AppInput" and v21.detailType == "Focused" then
            v17:debug("Received app focused message");
            v20.stateTable.events.focusReceived();
        end;
    end;
    v20.heartbeat = function() --[[ Line: 175 ]]
        -- upvalues: v20 (copy), v17 (ref)
        if v20.waitingTimeoutRunning and tick() - v20.startTime > v20.props.dispatchTimeout then
            v17:info("Timed out waiting for native response");
            v20.stateTable.events.onTimeout();
            return;
        else
            if v20.cancelTimeoutRunning and tick() - v20.cancelTime > v20.props.cancelTimeout then
                v17:warning("Timed out waiting for cancellation acknowledgement");
                v20.stateTable.events.onTimeout();
            end;
            return;
        end;
    end;
    v20.onResize = function(v22) --[[ Line: 185 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            screenSize = v22.AbsoluteSize
        });
    end;
end;
v18.didMount = function(v23) --[[ Line: 192 ]] --[[ Name: didMount ]]
    -- upvalues: v17 (copy)
    v17:info("NativeHandshakeWrapper mounted");
    v23:broadcastNotification();
end;
v18.render = function(v24) --[[ Line: 197 ]] --[[ Name: render ]]
    -- upvalues: v17 (copy), l_withStyle_0 (copy), v19 (copy), v3 (copy), v14 (copy), v13 (copy), l_LoadingAlert_0 (copy), v15 (copy)
    v17:trace("Rendering NativeHandshakeWrapper");
    return l_withStyle_0(function(v25) --[[ Line: 199 ]]
        -- upvalues: v19 (ref), v3 (ref), v14 (ref), v24 (copy), v13 (ref), l_LoadingAlert_0 (ref), v15 (ref)
        if not v25 then
            v25 = v19;
        end;
        return v3.createElement(v14, {
            Enabled = true, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            DisplayOrder = v24.props.DisplayOrder, 
            [v3.Change.AbsoluteSize] = v24.onResize
        }, {
            Background = v3.createElement("Frame", {
                BackgroundColor3 = v25.Theme.Overlay.Color, 
                BackgroundTransparency = v25.Theme.Overlay.Transparency, 
                ZIndex = 0, 
                Size = UDim2.fromScale(1, 1), 
                Active = true, 
                BorderSizePixel = 0
            }), 
            TopBar = if v24.props.showBackButton then v3.createElement(v13.Container, {
                titleText = "", 
                leftItem = v24.backButton, 
                ZIndex = 2
            }) else nil, 
            Loading = v3.createElement(l_LoadingAlert_0, {
                title = v24.props.title, 
                screenSize = v24.state.screenSize
            }), 
            EventConnection = v3.createElement(v15, {
                event = v24.props.appNotificationService.RobloxEventReceived, 
                callback = v24.checkEvent
            }), 
            HeartbeatConnection = v3.createElement(v15, {
                event = v24.props.runService.Heartbeat, 
                callback = v24.heartbeat
            }), 
            BackButtonConnection = v3.createElement(v15, {
                event = v24.props.guiService.ShowLeaveConfirmation, 
                callback = v24.stateTable.events.onCancel
            })
        });
    end);
end;
v18._broadcast = function(v26, v27) --[[ Line: 245 ]] --[[ Name: _broadcast ]]
    -- upvalues: l_HttpService_0 (copy), v17 (copy)
    local l_isVisible_0 = v26.props.isVisible;
    local l_notificationType_0 = v26.props.notificationType;
    local l_guiService_0 = v26.props.guiService;
    local l_notificationData_0 = v26.props.notificationData;
    if v27 then
        l_notificationData_0 = l_HttpService_0:JSONEncode({
            cancel = true
        });
    end;
    if l_isVisible_0 and l_notificationData_0 ~= nil and l_notificationType_0 ~= nil then
        v17:trace("Broadcasting {}: {}", l_notificationType_0, l_notificationData_0);
        l_guiService_0:BroadcastNotification(l_notificationData_0, l_notificationType_0);
    end;
end;
v18.close = function(v32) --[[ Line: 263 ]] --[[ Name: close ]]
    -- upvalues: v17 (copy)
    v17:debug("Closing NativeHandshakerapper");
    v32.props.navigation.goBack();
end;
return (l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    runService = l_AppRunService_0, 
    appNotificationService = l_AppNotificationService_0
})(v18));