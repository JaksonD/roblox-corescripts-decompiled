local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v6 = require(l_Modules_0.LuaApp.withLocalization);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v7.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local v10 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v11 = require(l_Modules_0.LuaApp.Constants);
local v12 = v1.PureComponent:extend("ConfirmSignOutV2");
v12.init = function(v13) --[[ Line: 18 ]] --[[ Name: init ]]
    v13.closeAlert = function() --[[ Line: 19 ]]
        -- upvalues: v13 (copy)
        v13.props.closeAlert();
    end;
end;
v12.render = function(v14) --[[ Line: 24 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v1 (copy), v11 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local l_continueFunc_0 = v14.props.continueFunc;
    return v6({
        titleText = "Application.Logout.Title.Logout", 
        messageText = "Application.Logout.Message.Confirmation", 
        confirmButtonText = "Application.Logout.Action.Logout", 
        cancelButtonText = "Feature.GamePage.LabelCancelField"
    })(function(v16) --[[ Line: 32 ]]
        -- upvalues: v1 (ref), v11 (ref), l_InteractiveAlert_0 (ref), l_ButtonType_0 (ref), v14 (copy), l_continueFunc_0 (copy)
        return (v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v11.Color.BLACK, 
            BackgroundTransparency = 1, 
            Active = true, 
            Selectable = false
        }, {
            AlertWindow = v1.createElement(l_InteractiveAlert_0, {
                title = v16.titleText, 
                bodyText = v16.messageText, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                onActivated = v14.closeAlert, 
                                text = v16.cancelButtonText
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = l_continueFunc_0, 
                                text = v16.confirmButtonText
                            }
                        }
                    }
                }, 
                screenSize = v14.props.screenSize
            })
        }));
    end);
end;
v12 = v2.connect(function(v17, _) --[[ Line: 69 ]]
    return {
        screenSize = v17.ScreenSize
    };
end, function(v19) --[[ Line: 73 ]]
    -- upvalues: v10 (copy)
    return {
        closeAlert = function() --[[ Line: 75 ]] --[[ Name: closeAlert ]]
            -- upvalues: v19 (copy), v10 (ref)
            return v19(v10());
        end
    };
end)(v12);
return (l_RoactServices_0.connect({
    localization = v5
})(v12));