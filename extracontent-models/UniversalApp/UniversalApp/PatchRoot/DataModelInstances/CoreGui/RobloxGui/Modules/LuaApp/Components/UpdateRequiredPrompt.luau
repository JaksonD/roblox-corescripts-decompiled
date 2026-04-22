local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local v7 = require(l_CorePackages_0.Packages.t);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppUpdateService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUpdateService;
local v11 = require(l_Modules_0.LuaApp.withLocalization);
local v12 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local l_UpdateMessageType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppUpdate).UpdateMessageType;
local l_game_EngineFeature_0 = game:GetEngineFeature("AutoUpgradeEngineFeatureOnly");
local v15 = v2.PureComponent:extend("UpdateRequiredPrompt");
v15.validateProps = v7.interface({
    canPerformBinaryUpdate = v7.optional(v7.boolean), 
    showInternalChannelMessage = v7.optional(v7.boolean), 
    updateMessageType = v7.optional(v7.string), 
    closeOverlay = v7.callback, 
    screenSize = v7.Vector2, 
    appUpdateService = if l_game_EngineFeature_0 then v7.table else nil
});
v15.init = function(v16) --[[ Line: 41 ]] --[[ Name: init ]]
    v16.performManagedUpdate = function() --[[ Line: 42 ]]
        -- upvalues: v16 (copy)
        v16.props.appUpdateService:performManagedUpdate();
    end;
end;
v15.render = function(v17) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: l_UpdateMessageType_0 (copy), v11 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v18 = nil;
    v18 = if v17.props.updateMessageType then v17.props.updateMessageType == l_UpdateMessageType_0.BetaProgram and "CommonUI.Controls.Label.BetaProgramUpdateMessage" or v17.props.updateMessageType == l_UpdateMessageType_0.InternalChannel and "CommonUI.Controls.Label.ChannelConfigurationUpdateMessage" or "CommonUI.Controls.Label.ForceUpdateBody" else v17.props.showInternalChannelMessage and "CommonUI.Controls.Label.ChannelConfigurationUpdateMessage" or "CommonUI.Controls.Label.ForceUpdateBody";
    return v11({
        titleText = "CommonUI.Controls.Label.ForceUpdateTitle", 
        bodyText = v18, 
        buttonText = "CommonUI.Controls.Action.CloseRoblox", 
        cancelButtonText = "Feature.GamePage.LabelCancelField"
    })(function(v19) --[[ Line: 70 ]]
        -- upvalues: v2 (ref), l_InteractiveAlert_0 (ref), v17 (copy), l_ButtonType_0 (ref)
        return (v2.createElement(l_InteractiveAlert_0, {
            screenSize = v17.props.screenSize, 
            title = v19.titleText, 
            bodyText = v19.bodyText, 
            buttonStackInfo = {
                buttons = {
                    if v17.props.canPerformBinaryUpdate then {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            text = v19.buttonText, 
                            onActivated = v17.performManagedUpdate
                        }
                    } else {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            text = v19.cancelButtonText, 
                            onActivated = v17.props.closeOverlay
                        }
                    }
                }
            }
        }));
    end);
end;
v15 = v3.connect(function(v20, _) --[[ Line: 100 ]]
    return {
        screenSize = v20.ScreenSize
    };
end, function(v22) --[[ Line: 104 ]]
    -- upvalues: v12 (copy)
    return {
        closeOverlay = function() --[[ Line: 106 ]] --[[ Name: closeOverlay ]]
            -- upvalues: v22 (copy), v12 (ref)
            v22(v12());
        end
    };
end)(v15);
return l_RoactServices_0.connect({
    appUpdateService = l_AppUpdateService_0
})(v15);