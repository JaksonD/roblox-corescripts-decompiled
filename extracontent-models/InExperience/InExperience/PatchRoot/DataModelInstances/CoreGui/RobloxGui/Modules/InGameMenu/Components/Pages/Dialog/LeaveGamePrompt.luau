local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_t_0 = v3.t;
local v7 = require(script.Parent.LeavePrompt);
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v9 = require(l_Parent_0.Localization.withLocalization);
local v10 = require(l_Parent_0.Resources.Constants);
local v11 = require(l_Parent_0.Thunks.CloseMenu);
local v12 = require(l_Parent_0.Utility.SendAnalytics);
local l_GetDefaultQualityLevel_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel;
local v14 = require(l_RobloxGui_0.Modules.FTUX.Flags.GetFFlagEnableVRFTUXExperience);
local v15 = require(l_RobloxGui_0.Modules.FTUX.Utility.IsFTUXExperience);
local v16 = require(l_RobloxGui_0.Modules.FTUX.Enums.PlatformEnum);
local v17 = l_Roact_0.PureComponent:extend("LeaveGamePrompt");
v17.validateProps = l_t_0.strictInterface({
    closeMenu = l_t_0.callback, 
    canGamepadCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    canKeyboardCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    onConfirm = l_t_0.optional(l_t_0.callback)
});
v17.init = function(v18) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy), v10 (copy), l_RunService_0 (copy), l_GetDefaultQualityLevel_0 (copy)
    v18.leaveGameConfirm = function() --[[ Line: 36 ]]
        -- upvalues: v12 (ref), v10 (ref), l_RunService_0 (ref), l_GetDefaultQualityLevel_0 (ref)
        v12(v10.AnalyticsInGameMenuName, v10.AnalyticsLeaveGameName, {
            confirmed = v10.AnalyticsConfirmedName
        });
        l_RunService_0.Heartbeat:Wait();
        game:Shutdown();
        settings().Rendering.QualityLevel = l_GetDefaultQualityLevel_0();
    end;
end;
v17.render = function(v19) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v14 (copy), v15 (copy), v16 (copy), l_Roact_0 (copy), v7 (copy)
    return v9({
        titleText = "CoreScripts.InGameMenu.Prompt.LeaveGameTitle", 
        bodyText = v14() and v15(v16.QuestVR) and "CoreScripts.InGameMenu.Prompt.VRFTUXLeaveGameBodyText" or "CoreScripts.InGameMenu.Prompt.LeaveGameBodyText", 
        confirmText = "CoreScripts.InGameMenu.Prompt.LeaveGame", 
        cancelText = "CoreScripts.InGameMenu.Prompt.ResumeGame"
    })(function(v20) --[[ Line: 56 ]]
        -- upvalues: l_Roact_0 (ref), v7 (ref), v19 (copy)
        return l_Roact_0.createElement(v7, {
            titleText = v20.titleText, 
            bodyText = v20.bodyText, 
            confirmText = v20.confirmText, 
            cancelText = v20.cancelText, 
            onConfirm = v19.props.onConfirm or v19.leaveGameConfirm, 
            onCancel = v19.props.closeMenu, 
            canGamepadCaptureFocus = v19.props.canGamepadCaptureFocus, 
            canKeyboardCaptureFocus = v19.props.canKeyboardCaptureFocus
        });
    end);
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v21, _) --[[ Line: 70 ]]
    -- upvalues: v10 (copy)
    local v23 = false;
    if v21.menuPage == v10.LeaveGamePromptPageKey then
        v23 = false;
        if v21.displayOptions.inputType == v10.InputType.Gamepad then
            v23 = not v21.respawn.dialogOpen and v21.currentZone == 1;
        end;
    end;
    local v24 = false;
    if v21.menuPage == v10.LeaveGamePromptPageKey then
        v24 = false;
        if v21.displayOptions.inputType == v10.InputType.MouseAndKeyboard then
            v24 = not v21.respawn.dialogOpen;
        end;
    end;
    return {
        canGamepadCaptureFocus = v23, 
        canKeyboardCaptureFocus = v24
    };
end, function(v25) --[[ Line: 84 ]]
    -- upvalues: v11 (copy), v12 (copy), v10 (copy)
    return {
        closeMenu = function() --[[ Line: 86 ]] --[[ Name: closeMenu ]]
            -- upvalues: v25 (copy), v11 (ref), v12 (ref), v10 (ref)
            v25(v11);
            v12(v10.AnalyticsInGameMenuName, v10.AnalyticsLeaveGameName, {
                confirmed = v10.AnalyticsCancelledName
            });
        end
    };
end)(v17);