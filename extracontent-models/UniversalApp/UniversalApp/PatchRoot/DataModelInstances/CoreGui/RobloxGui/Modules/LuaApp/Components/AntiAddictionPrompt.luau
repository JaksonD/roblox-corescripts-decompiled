local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v6 = require(l_Modules_0.LuaApp.Constants);
local v7 = require(l_Modules_0.LuaApp.withLocalization);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_AppUserInputService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUserInputService;
local v10 = require(l_Modules_0.LuaApp.Components.ScreenGuiWithBlurControl);
local v11 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v11.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v11.App.Button.Enum.ButtonType;
local v14 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v15 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v16 = require(l_Modules_0.LuaApp.AppPage);
local v17 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v18 = require(l_Modules_0.LuaApp.Actions.SetScreenGuiBlur);
local v19 = v2.PureComponent:extend("AntiAddictionPrompt");
v19.init = function(v20) --[[ Line: 31 ]] --[[ Name: init ]]
    local l_guiService_0 = v20.props.guiService;
    local l_networking_0 = v20.props.networking;
    v20.state = {
        screenSize = Vector2.new(0, 0)
    };
    v20.changeScreenSize = function(v23) --[[ Line: 39 ]]
        -- upvalues: v20 (copy)
        if v20.state.screenSize ~= v23.AbsoluteSize then
            v20:setState({
                screenSize = v23.AbsoluteSize
            });
        end;
    end;
    v20.OkCallback = function(...) --[[ Line: 47 ]]
        -- upvalues: v20 (copy)
        if v20.props.okCallback then
            v20.props.okCallback(...);
        end;
    end;
    v20.LogoutCallback = function() --[[ Line: 53 ]]
        -- upvalues: v20 (copy), l_networking_0 (copy), l_guiService_0 (copy)
        v20.props.logout(l_networking_0, l_guiService_0);
        if v20.props.logoutCallback then
            v20.props.logoutCallback();
        end;
    end;
end;
v19.render = function(v24) --[[ Line: 62 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy), v10 (copy), v6 (copy), v7 (copy)
    local l_message_0 = v24.props.message;
    local l_lockOut_0 = v24.props.lockOut;
    local v27 = l_lockOut_0 and v24.LogoutCallback or v24.OkCallback;
    local l_FocusedTextBox_0 = v24.props.userInputService:GetFocusedTextBox();
    if l_FocusedTextBox_0 then
        l_FocusedTextBox_0:ReleaseFocus();
    end;
    local function v32(v29) --[[ Line: 72 ]]
        -- upvalues: v2 (ref), l_InteractiveAlert_0 (ref), l_message_0 (copy), l_ButtonType_0 (ref), v27 (copy), v24 (copy), v10 (ref), v6 (ref), l_lockOut_0 (copy)
        local v30 = v2.createElement(l_InteractiveAlert_0, {
            title = v29.alertTitle, 
            bodyText = l_message_0, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v27, 
                            text = v29.buttonText
                        }
                    }
                }
            }, 
            screenSize = v24.state.screenSize
        });
        local v31 = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(), 
            BackgroundTransparency = 1, 
            Active = true, 
            Selectable = false
        }, {
            AlertWindow = v30
        });
        return v2.createElement(v10, {
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            DisplayOrder = v6.DisplayOrder.AntiAddictionPrompt, 
            OnTopOfCoreBlur = l_lockOut_0
        }, {
            Overlay = v31
        });
    end;
    return v7({
        buttonText = l_lockOut_0 and "Application.Logout.Action.Logout" or "CommonUI.Messages.Action.OK", 
        alertTitle = "CommonUI.Messages.Label.Alert"
    })(function(v33) --[[ Line: 110 ]]
        -- upvalues: v32 (copy)
        return v32(v33);
    end);
end;
v19.didMount = function(v34) --[[ Line: 115 ]] --[[ Name: didMount ]]
    if v34.props.lockOut then
        v34.props.setScreenGuiBlur(true);
    end;
end;
v19.willUnmount = function(v35) --[[ Line: 123 ]] --[[ Name: willUnmount ]]
    if v35.props.lockOut then
        v35.props.setScreenGuiBlur(false);
    end;
end;
v19 = v3.connect(nil, function(v36) --[[ Line: 131 ]]
    -- upvalues: v15 (copy), v16 (copy), v18 (copy), v6 (copy), v14 (copy), v17 (copy)
    return {
        openLogoutPage = function() --[[ Line: 133 ]] --[[ Name: openLogoutPage ]]
            -- upvalues: v36 (copy), v15 (ref), v16 (ref)
            v36(v15({
                name = v16.LogoutConfirmation
            }));
        end, 
        setScreenGuiBlur = function(v37) --[[ Line: 136 ]] --[[ Name: setScreenGuiBlur ]]
            -- upvalues: v36 (copy), v18 (ref), v6 (ref)
            v36(v18("AntiAddictionPrompt", v37, v6.DisplayOrder.AntiAddictionPrompt));
        end, 
        logout = function(v38, v39) --[[ Line: 139 ]] --[[ Name: logout ]]
            -- upvalues: v36 (copy), v14 (ref), v17 (ref)
            v36(v14(v38, v39, v17.AntiAddiction));
        end
    };
end)(v19);
return (l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    userInputService = l_AppUserInputService_0, 
    networking = v5
})(v19));