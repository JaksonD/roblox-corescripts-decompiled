local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_InteractiveAlert_0 = require(l_CorePackages_0.Packages.UIBlox).App.Dialog.Alert.InteractiveAlert;
local v7 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v8 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRegisterQRCodeKeyInEngine and "ProfileQrCodeCameraSettingsModalSeen" or "ScreenshotEventTracking";
local v9 = v3.PureComponent:extend("CameraPermissionPrompt");
v9.renderAlertLocalized = function(v10, v11) --[[ Line: 20 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: v3 (copy), l_InteractiveAlert_0 (copy)
    local v12 = {
        props = {
            onActivated = v10.props.closePrompt, 
            text = v11.gotItButtonText
        }
    };
    return v3.createElement(l_InteractiveAlert_0, {
        title = v11.titleText, 
        bodyText = v11.messageText, 
        buttonStackInfo = {
            buttons = {
                v12
            }
        }, 
        screenSize = v10.props.screenSize
    });
end;
v9.didMount = function(_) --[[ Line: 37 ]] --[[ Name: didMount ]]
    -- upvalues: l_AppStorageService_0 (copy), v8 (copy)
    l_AppStorageService_0:SetItem(v8, "true");
    l_AppStorageService_0:Flush();
end;
v9.render = function(v14) --[[ Line: 42 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        titleText = "Feature.AddFriends.Title.CameraPermission", 
        messageText = "Feature.AddFriends.Description.CameraPermissionWarning", 
        gotItButtonText = "Feature.Avatar.Action.GotIt"
    })(function(v15) --[[ Line: 47 ]]
        -- upvalues: v14 (copy)
        return v14:renderAlertLocalized(v15);
    end);
end;
return (v4.connect(function(v16, _) --[[ Line: 52 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSize = v16.ScreenSize
    };
end, function(v18) --[[ Line: 58 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v7 (copy)
    return {
        closePrompt = function() --[[ Line: 60 ]] --[[ Name: closePrompt ]]
            -- upvalues: v18 (copy), v7 (ref)
            v18(v7());
        end
    };
end)(v9));