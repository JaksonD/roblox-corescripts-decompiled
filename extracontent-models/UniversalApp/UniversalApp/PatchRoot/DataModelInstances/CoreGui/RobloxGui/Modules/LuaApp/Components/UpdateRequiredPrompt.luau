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
local l_game_EngineFeature_1 = game:GetEngineFeature("NewCallbackForBetaProgramEngineFeature");
local v16 = v2.PureComponent:extend("UpdateRequiredPrompt");
v16.validateProps = v7.interface({
    canPerformBinaryUpdate = v7.optional(v7.boolean), 
    showInternalChannelMessage = v7.optional(v7.boolean), 
    updateMessageType = v7.optional(v7.string), 
    closeOverlay = v7.callback, 
    screenSize = v7.Vector2, 
    appUpdateService = if l_game_EngineFeature_0 then v7.table else nil
});
v16.init = function(v17) --[[ Line: 42 ]] --[[ Name: init ]]
    v17.performManagedUpdate = function() --[[ Line: 43 ]]
        -- upvalues: v17 (copy)
        v17.props.appUpdateService:performManagedUpdate();
    end;
end;
v16.render = function(v18) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: l_game_EngineFeature_1 (copy), l_UpdateMessageType_0 (copy), v11 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v19 = nil;
    v19 = if l_game_EngineFeature_1 and v18.props.updateMessageType then v18.props.updateMessageType == l_UpdateMessageType_0.BetaProgram and "CommonUI.Controls.Label.BetaProgramUpdateMessage" or v18.props.updateMessageType == l_UpdateMessageType_0.InternalChannel and "CommonUI.Controls.Label.ChannelConfigurationUpdateMessage" or "CommonUI.Controls.Label.ForceUpdateBody" else v18.props.showInternalChannelMessage and "CommonUI.Controls.Label.ChannelConfigurationUpdateMessage" or "CommonUI.Controls.Label.ForceUpdateBody";
    return v11({
        titleText = "CommonUI.Controls.Label.ForceUpdateTitle", 
        bodyText = v19, 
        buttonText = "CommonUI.Controls.Action.CloseRoblox", 
        cancelButtonText = "Feature.GamePage.LabelCancelField"
    })(function(v20) --[[ Line: 72 ]]
        -- upvalues: v2 (ref), l_InteractiveAlert_0 (ref), v18 (copy), l_ButtonType_0 (ref)
        return (v2.createElement(l_InteractiveAlert_0, {
            screenSize = v18.props.screenSize, 
            title = v20.titleText, 
            bodyText = v20.bodyText, 
            buttonStackInfo = {
                buttons = {
                    if v18.props.canPerformBinaryUpdate then {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            text = v20.buttonText, 
                            onActivated = v18.performManagedUpdate
                        }
                    } else {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            text = v20.cancelButtonText, 
                            onActivated = v18.props.closeOverlay
                        }
                    }
                }
            }
        }));
    end);
end;
v16 = v3.connect(function(v21, _) --[[ Line: 102 ]]
    return {
        screenSize = v21.ScreenSize
    };
end, function(v23) --[[ Line: 106 ]]
    -- upvalues: v12 (copy)
    return {
        closeOverlay = function() --[[ Line: 108 ]] --[[ Name: closeOverlay ]]
            -- upvalues: v23 (copy), v12 (ref)
            v23(v12());
        end
    };
end)(v16);
return l_RoactServices_0.connect({
    appUpdateService = l_AppUpdateService_0
})(v16);