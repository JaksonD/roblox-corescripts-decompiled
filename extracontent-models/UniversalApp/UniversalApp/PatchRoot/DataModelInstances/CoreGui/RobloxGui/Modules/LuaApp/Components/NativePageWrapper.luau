local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v5 = require(l_Modules_0.LuaApp.ArgCheck);
local v6 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v7 = require(l_Modules_0.LuaApp.Constants);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v10 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v12 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v16 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableLocalizedWebViewFallbackText);
local v17 = {
    canNativeWrapperParentHandleBackNavigation = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppCanNativeWrapperParentHandleBackNavigation)
};
local v18 = v3.PureComponent:extend("NativePageWrapper");
v18.defaultProps = {
    DisplayOrder = 0
};
v18.init = function(v19) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy)
    v19._appInputEventConnection = v19.props.appNotificationService.RobloxEventReceived:Connect(function(v20) --[[ Line: 38 ]]
        -- upvalues: v19 (copy), v17 (ref)
        local l_navigation_0 = v19.props.navigation;
        if v19._isMounted and l_navigation_0 ~= nil and v20.namespace == "AppInput" and v20.detailType == "Focused" then
            if v17.canNativeWrapperParentHandleBackNavigation() and v19.props.backNavigationHandledByParent then
                return;
            else
                l_navigation_0.goBack();
            end;
        end;
    end);
end;
v18.render = function(v22) --[[ Line: 61 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v16 (copy), l_withLocalization_0 (copy), l_withStyle_0 (copy), v7 (copy), v3 (copy), l_HttpService_0 (copy), v10 (copy), l_IsVRAppBuild_0 (copy)
    local l_notificationData_0 = v22.props.notificationData;
    v5.isNonNegativeNumber(v22.props.DisplayOrder, "NativePageWrapper:DisplayOrder");
    if v16() then
        return l_withLocalization_0({
            warningText = "CommonUI.Messages.Label.ActionNotAvailableOnVRHeadsetDevice"
        })(function(v24) --[[ Line: 68 ]]
            -- upvalues: l_withStyle_0 (ref), v7 (ref), v22 (copy), v3 (ref), l_HttpService_0 (ref), l_notificationData_0 (copy), v10 (ref), l_IsVRAppBuild_0 (ref)
            return l_withStyle_0(function(v25) --[[ Line: 69 ]]
                -- upvalues: v7 (ref), v22 (ref), v3 (ref), l_HttpService_0 (ref), l_notificationData_0 (ref), v10 (ref), l_IsVRAppBuild_0 (ref), v24 (copy)
                local l_GRAY1_0 = v7.Color.GRAY1;
                local v27 = 0.5;
                if v25 then
                    l_GRAY1_0 = v25.Theme.Overlay.Color;
                    v27 = v25.Theme.Overlay.Transparency;
                end;
                if v22.props.allowWebviews then
                    return v3.createElement("Frame", {
                        BackgroundColor3 = l_GRAY1_0, 
                        BackgroundTransparency = v27
                    }, {
                        button = v3.createElement("TextButton", {
                            Text = "press", 
                            Size = UDim2.fromScale(0.5, 0.5), 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            AnchorPoint = Vector2.new(0.5, 0.5)
                        })
                    });
                else
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 93 ]]
                        -- upvalues: l_HttpService_0 (ref), l_notificationData_0 (ref)
                        return l_HttpService_0:JSONDecode(l_notificationData_0);
                    end);
                    local v30 = l_status_0 and typeof(l_result_0) == "table" and l_result_0.title or v22.props.titleText;
                    local l_GRAY4_0 = v7.Color.GRAY4;
                    local v32 = 0.5;
                    if v25 then
                        l_GRAY4_0 = v25.Theme.BackgroundDefault.Color;
                        v32 = v25.Theme.BackgroundDefault.Transparency;
                    end;
                    v22.props.eventIngest:sendEventDeferred("open_disabled_web_view", "open_disabled_web_view_action", {
                        pageName = v30
                    });
                    return v3.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundColor3 = l_GRAY4_0, 
                        BackgroundTransparency = v32
                    }, {
                        TopBar = v3.createElement(v10.Container, {
                            titleText = v30, 
                            leftItem = if l_IsVRAppBuild_0() then v10.makeBackButton(nil, true) else v10.BackButton
                        }), 
                        WarningText = v3.createElement("TextLabel", {
                            Text = v24.warningText, 
                            Size = UDim2.new(1, 0, 1, 0), 
                            TextColor3 = v25.Theme.TextDefault.Color, 
                            TextSize = v25.Font.BaseSize, 
                            BackgroundColor3 = v25.Theme.BackgroundUIDefault.Color, 
                            TextWrapped = true
                        })
                    });
                end;
            end);
        end);
    else
        return l_withStyle_0(function(v33) --[[ Line: 136 ]]
            -- upvalues: v7 (ref), v22 (copy), v3 (ref), l_HttpService_0 (ref), l_notificationData_0 (copy), v10 (ref), l_IsVRAppBuild_0 (ref)
            local l_GRAY1_1 = v7.Color.GRAY1;
            local v35 = 0.5;
            if v33 then
                l_GRAY1_1 = v33.Theme.Overlay.Color;
                v35 = v33.Theme.Overlay.Transparency;
            end;
            if v22.props.allowWebviews then
                return v3.createElement("Frame", {
                    BackgroundColor3 = l_GRAY1_1, 
                    BackgroundTransparency = v35
                }, {
                    button = v3.createElement("TextButton", {
                        Text = "press", 
                        Size = UDim2.fromScale(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    })
                });
            else
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 160 ]]
                    -- upvalues: l_HttpService_0 (ref), l_notificationData_0 (ref)
                    return l_HttpService_0:JSONDecode(l_notificationData_0);
                end);
                local v38 = l_status_1 and typeof(l_result_1) == "table" and l_result_1.title or v22.props.titleText;
                local l_GRAY4_1 = v7.Color.GRAY4;
                local v40 = 0.5;
                if v33 then
                    l_GRAY4_1 = v33.Theme.BackgroundDefault.Color;
                    v40 = v33.Theme.BackgroundDefault.Transparency;
                end;
                v22.props.eventIngest:sendEventDeferred("open_disabled_web_view", "open_disabled_web_view_action", {
                    pageName = v38
                });
                return v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundColor3 = l_GRAY4_1, 
                    BackgroundTransparency = v40
                }, {
                    TopBar = v3.createElement(v10.Container, {
                        titleText = v38, 
                        leftItem = if l_IsVRAppBuild_0() then v10.makeBackButton(nil, true) else v10.BackButton
                    }), 
                    WarningText = v3.createElement("TextLabel", {
                        Text = "Error: this functionality is currently unavailable on your device.", 
                        Size = UDim2.new(1, 0, 1, 0), 
                        TextColor3 = v33.Theme.TextDefault.Color, 
                        TextSize = v33.Font.BaseSize, 
                        BackgroundColor3 = v33.Theme.BackgroundUIDefault.Color, 
                        TextWrapped = true
                    })
                });
            end;
        end);
    end;
end;
v18.didUpdate = function(v41, v42) --[[ Line: 204 ]] --[[ Name: didUpdate ]]
    if not v42.isVisible then
        v41:broadcastNotification();
    end;
end;
v18.didMount = function(v43) --[[ Line: 210 ]] --[[ Name: didMount ]]
    v43._isMounted = true;
    v43:broadcastNotification();
end;
v18.willUnmount = function(v44) --[[ Line: 216 ]] --[[ Name: willUnmount ]]
    v44._isMounted = false;
    if v44._appInputEventConnection then
        v44._appInputEventConnection:disconnect();
        v44._appInputEventConnection = nil;
    end;
    if v44.props.onClose ~= nil then
        v44.props.onClose();
    end;
end;
v18.broadcastNotification = function(v45) --[[ Line: 229 ]] --[[ Name: broadcastNotification ]]
    -- upvalues: l_HttpService_0 (copy)
    if not v45.props.allowWebviews then
        return;
    else
        local l_isVisible_0 = v45.props.isVisible;
        local l_notificationData_1 = v45.props.notificationData;
        if game:GetEngineFeature("SetWebViewTitle") and l_notificationData_1 == nil then
            l_notificationData_1 = l_HttpService_0:JSONEncode({
                title = v45.props.titleText, 
                url = v45.props.url, 
                transitionAnimation = v45.props.transitionAnimation, 
                animated = v45.props.animated
            });
        end;
        local l_notificationType_0 = v45.props.notificationType;
        local l_guiService_0 = v45.props.guiService;
        if l_isVisible_0 and l_notificationData_1 ~= nil and l_notificationType_0 ~= nil then
            l_guiService_0:BroadcastNotification(l_notificationData_1, l_notificationType_0);
        end;
        return;
    end;
end;
v18 = l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    appNotificationService = l_AppNotificationService_0, 
    eventIngest = v6
})(v18);
v18 = v12.withNavigation(v18);
return l_RoactAppPolicy_0.connect(function(v50, _) --[[ Line: 264 ]]
    return {
        allowWebviews = v50.getWebViewSupport()
    };
end)(v18);