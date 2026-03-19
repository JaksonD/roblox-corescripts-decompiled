local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_Toast_0 = v5.App.Dialog.Toast;
local l_Images_0 = v5.App.ImageSet.Images;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v12 = require(l_RobloxGui_0.Modules.shouldSaveScreenshotToAlbum);
local v13 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v14 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local v15 = {
    None = "None", 
    Success = "Success", 
    Fail = "Fail", 
    Permission = "Permission"
};
local v16 = v4.PureComponent:extend("CaptureNotification");
v16.validateProps = v6.strictInterface({
    forceDismissToast = v6.optional(v6.table), 
    permissionEvent = v6.optional(v6.instanceOf("BindableEvent"))
});
v16.init = function(v17) --[[ Line: 40 ]] --[[ Name: init ]]
    -- upvalues: v15 (copy), l_Images_0 (copy), v13 (copy), v4 (copy), l_UserInputService_0 (copy)
    v17.state = {
        screenSize = Vector2.new(0, 0), 
        dismissedPermission = false, 
        notificationType = v15.None, 
        toastContent = nil
    };
    v17.onScreenSizeChanged = function(v18) --[[ Line: 48 ]]
        -- upvalues: v17 (copy)
        if v17.state.screenSize ~= v18.AbsoluteSize then
            v17:setState({
                screenSize = v18.AbsoluteSize
            });
        end;
    end;
    v17.getToastContent = function(v19) --[[ Line: 56 ]]
        -- upvalues: v15 (ref), l_Images_0 (ref), v13 (ref), v17 (copy), v4 (ref)
        if v19 == v15.Success or v19 == v15.Fail then
            local v20 = v19 == v15.Success;
            return {
                iconImage = v20 and l_Images_0["icons/status/success"] or l_Images_0["icons/status/alert"], 
                iconColorStyle = not v20 and {
                    Color = Color3.fromRGB(247, 75, 82), 
                    Transparency = 0
                } or nil, 
                toastTitle = v20 and v13:FormatByKey("InGame.NotificationScript2.Capture.Success.ToastText") or v13:FormatByKey("InGame.NotificationScript2.Capture.Fail.ToastText"), 
                onDismissed = function() --[[ Line: 68 ]] --[[ Name: onDismissed ]]
                    -- upvalues: v17 (ref), v15 (ref), v4 (ref)
                    v17:setState({
                        notificationType = v15.None, 
                        toastContent = v4.None
                    });
                    if v17.props.forceDismissToast and v17.props.forceDismissToast.onDismissed then
                        v17.props.forceDismissToast.onDismissed();
                    end;
                end
            };
        else
            return v4.None;
        end;
    end;
    v17.dismissPermissionAlert = function() --[[ Line: 83 ]]
        -- upvalues: v17 (copy), v15 (ref)
        v17:setState({
            dismissedPermission = true, 
            notificationType = v15.Fail, 
            toastContent = v17.getToastContent(v15.Fail)
        });
    end;
    v17.screenshotSavedToAlbumCallback = function(_, v22, v23) --[[ Line: 91 ]]
        -- upvalues: v15 (ref), v17 (copy)
        local v24 = nil;
        v24 = if v22 then v15.Success else if not v17.state.dismissedPermission and v23:find("Domain=ALAssetsLibraryErrorDomain") and v23:find("Data unavailable") then v15.Permission else v15.Fail;
        v17:setState({
            notificationType = v24, 
            toastContent = v17.getToastContent(v24)
        });
    end;
    v17.permissionEventCallback = function() --[[ Line: 116 ]]
        -- upvalues: v17 (copy), v15 (ref)
        v17:setState({
            notificationType = v15.Permission, 
            toastContent = v17.getToastContent(v15.Permission)
        });
    end;
    v17.getPermissionAlertBodyText = function() --[[ Line: 123 ]]
        -- upvalues: l_UserInputService_0 (ref), v13 (ref)
        if l_UserInputService_0:GetPlatform() == Enum.Platform.IOS then
            return v13:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertTextIOS");
        elseif l_UserInputService_0:GetPlatform() == Enum.Platform.Android then
            return v13:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertTextAndroid");
        else
            return v13:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertText");
        end;
    end;
end;
v16.renderWithStyle = function(_, v26) --[[ Line: 134 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v14 (copy)
    return v14(v26);
end;
v16.render = function(v27) --[[ Line: 138 ]] --[[ Name: render ]]
    -- upvalues: v15 (copy), v4 (copy), l_Toast_0 (copy), l_InteractiveAlert_0 (copy), v13 (copy), l_ButtonType_0 (copy), v12 (copy), l_ExternalEventConnection_0 (copy)
    local l_notificationType_0 = v27.state.notificationType;
    local v29 = false;
    if l_notificationType_0 == v15.Success then
        v29 = v27.state.toastContent;
    end;
    local v30 = false;
    if l_notificationType_0 == v15.Fail then
        v30 = v27.state.toastContent;
    end;
    local v31 = l_notificationType_0 == v15.Permission;
    return v27:renderWithStyle({
        RobloxCaptureNotificationGui = v4.createElement("ScreenGui", {
            AutoLocalize = false, 
            DisplayOrder = 9, 
            IgnoreGuiInset = true, 
            OnTopOfCoreBlur = true, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            Content = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                [v4.Change.AbsoluteSize] = v27.onScreenSizeChanged
            }, {
                SuccessToast = v29 and v4.createElement(l_Toast_0, {
                    duration = 3, 
                    show = not v27.props.forceDismissToast, 
                    toastContent = v27.state.toastContent
                }), 
                FailToast = v30 and v4.createElement(l_Toast_0, {
                    duration = 3, 
                    show = not v27.props.forceDismissToast, 
                    toastContent = v27.state.toastContent
                }), 
                PermissionAlertOverlay = v31 and v4.createElement("Frame", {
                    Active = true, 
                    BackgroundColor3 = Color3.new(0, 0, 0), 
                    BackgroundTransparency = 0.5, 
                    Size = UDim2.new(1, 0, 1, 0)
                }, {
                    PermissionAlert = v4.createElement(l_InteractiveAlert_0, {
                        title = v13:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertTitle"), 
                        bodyText = v27.getPermissionAlertBodyText(), 
                        buttonStackInfo = {
                            buttons = {
                                {
                                    buttonType = l_ButtonType_0.PrimarySystem, 
                                    props = {
                                        onActivated = v27.dismissPermissionAlert, 
                                        text = v13:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertButtonText")
                                    }
                                }
                            }
                        }, 
                        position = UDim2.fromScale(0.5, 0.5), 
                        screenSize = v27.state.screenSize
                    })
                }), 
                ScreenshotSavedToAlbumConnection = v12() and v4.createElement(l_ExternalEventConnection_0, {
                    event = game.ScreenshotSavedToAlbum, 
                    callback = v27.screenshotSavedToAlbumCallback
                }), 
                PermissionEventConnection = v27.props.permissionEvent and v4.createElement(l_ExternalEventConnection_0, {
                    event = v27.props.permissionEvent.Event, 
                    callback = v27.permissionEventCallback
                })
            })
        })
    });
end;
v16.didUpdate = function(v32, v33) --[[ Line: 208 ]] --[[ Name: didUpdate ]]
    -- upvalues: v15 (copy)
    local l_forceDismissToast_0 = v32.props.forceDismissToast;
    if v33.forceDismissToast ~= l_forceDismissToast_0 and not ((not (v32.state.notificationType ~= v15.Success) or v32.state.notificationType == v15.Fail) and v32.state.toastContent) and l_forceDismissToast_0 and l_forceDismissToast_0.onDismissed then
        l_forceDismissToast_0.onDismissed();
    end;
end;
return v16;