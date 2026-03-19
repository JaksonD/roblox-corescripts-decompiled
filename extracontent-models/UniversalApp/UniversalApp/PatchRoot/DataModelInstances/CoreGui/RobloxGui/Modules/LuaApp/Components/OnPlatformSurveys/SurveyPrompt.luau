local l_CorePackages_0 = game:GetService("CorePackages");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v8 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v9 = require(l_Modules_0.LuaApp.withLocalization);
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v10.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v10.App.Button.Enum.ButtonType;
local v13 = require(l_CorePackages_0.Packages.Foundation);
local l_ButtonVariant_0 = v13.Enums.ButtonVariant;
local l_Dialog_0 = v13.Dialog;
local l_DialogSize_0 = v13.Enums.DialogSize;
local v17 = require(l_Modules_0.LuaApp.Constants);
local v18 = game:DefineFastFlag("EnableSurveyPromptTelemetry", false);
local v19 = game:DefineFastFlag("UpdateCopyAndDesignOfSurveyPrompt", false);
local v20 = v3.PureComponent:extend("SurveyPrompt");
local v21 = {
    eventName = "SurveyPrompt", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = game:DefineFastInt("SurveyPromptEventThrottleHunderedthsPercent", 0), 
    lastUpdated = {
        2025, 
        10, 
        29
    }, 
    description = "Interactions with the qualtrics survey prompt"
};
local v22 = {
    "addSessionId", 
    "addOSInfo", 
    "addSessionInfo"
};
local function _(v23, v24) --[[ Line: 39 ]] --[[ Name: getPromptText ]]
    if v24 and v24 ~= "" then
        return v24;
    else
        return v23;
    end;
end;
v20.init = function(v26) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v18 (copy), l_TelemetryService_0 (copy), v21 (copy), v22 (copy)
    v26.closePrompt = function() --[[ Line: 48 ]]
        -- upvalues: v18 (ref), l_TelemetryService_0 (ref), v21 (ref), v22 (ref), v26 (copy)
        if v18 then
            l_TelemetryService_0:LogEvent(v21, {
                standardizedFields = v22, 
                customFields = {
                    action = "closeButton"
                }
            });
        end;
        v26.props.closeAlert();
        v26.props.closeFunc();
    end;
    v26.openSurvey = function() --[[ Line: 62 ]]
        -- upvalues: v18 (ref), l_TelemetryService_0 (ref), v21 (ref), v22 (ref), v26 (copy)
        if v18 then
            l_TelemetryService_0:LogEvent(v21, {
                standardizedFields = v22, 
                customFields = {
                    action = "openButton"
                }
            });
        end;
        v26.props.closeAlert();
        v26.props.continueFunc();
    end;
end;
v20.render = function(v27) --[[ Line: 77 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v19 (copy), v2 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_ButtonVariant_0 (copy), v3 (copy), v17 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    return v9({
        titleText = "Feature.QualtricsSurveyPrompt.Heading.Title", 
        cancelButtonText = "Feature.QualtricsSurveyPrompt.Action.Close", 
        confirmButtonText = "CommonUI.Features.Action.Go", 
        titleText2 = "Feature.QualtricsSurveyPrompt.Heading.GiveUsFeedback", 
        bodyText2 = "Feature.QualtricsSurveyPrompt.Description.TakeAQuickSurvey", 
        cancelButtonText2 = "Feature.QualtricsSurveyPrompt.Action.Cancel", 
        confirmButtonText2 = "Feature.QualtricsSurveyPrompt.Action.Continue"
    })(function(v28) --[[ Line: 89 ]]
        -- upvalues: v27 (copy), v19 (ref), v2 (ref), l_Dialog_0 (ref), l_DialogSize_0 (ref), l_ButtonVariant_0 (ref), v3 (ref), v17 (ref), l_InteractiveAlert_0 (ref), l_ButtonType_0 (ref)
        local l_titleText_0 = v28.titleText;
        local l_titleText_1 = v27.props.titleText;
        local v31 = if l_titleText_1 and l_titleText_1 ~= "" then l_titleText_1 else l_titleText_0;
        l_titleText_1 = v27.props.localization:Format("Feature.QualtricsSurveyPrompt.Description.PromptText", v27.props.displayName);
        local l_bodyText_0 = v27.props.bodyText;
        l_titleText_0 = if l_bodyText_0 and l_bodyText_0 ~= "" then l_bodyText_0 else l_titleText_1;
        l_bodyText_0 = v28.cancelButtonText;
        local l_cancelButtonText_0 = v27.props.cancelButtonText;
        l_titleText_1 = if l_cancelButtonText_0 and l_cancelButtonText_0 ~= "" then l_cancelButtonText_0 else l_bodyText_0;
        l_cancelButtonText_0 = v28.confirmButtonText;
        local l_confirmButtonText_0 = v27.props.confirmButtonText;
        l_bodyText_0 = if l_confirmButtonText_0 and l_confirmButtonText_0 ~= "" then l_confirmButtonText_0 else l_cancelButtonText_0;
        if v19 then
            return (v2.createElement(l_Dialog_0.Root, {
                size = l_DialogSize_0.Small, 
                hasBackdrop = true, 
                onClose = v27.closePrompt
            }, {
                DialogTitle = v2.createElement(l_Dialog_0.Title, {
                    text = v28.titleText2
                }), 
                DialogContent = v2.createElement(l_Dialog_0.Content, {
                    LayoutOrder = 2
                }, {
                    DialogText = v2.createElement(l_Dialog_0.Text, {
                        Text = v28.bodyText2
                    })
                }), 
                DialogActions = v2.createElement(l_Dialog_0.Actions, {
                    LayoutOrder = 3, 
                    actions = {
                        {
                            text = v28.cancelButtonText2, 
                            variant = l_ButtonVariant_0.Standard, 
                            onActivated = v27.closePrompt
                        }, 
                        {
                            text = v28.confirmButtonText2, 
                            variant = l_ButtonVariant_0.Emphasis, 
                            onActivated = v27.openSurvey
                        }
                    }
                })
            }));
        else
            return (v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = v17.Color.BLACK, 
                BackgroundTransparency = 0.5, 
                Active = true, 
                Selectable = false
            }, {
                AlertWindow = v3.createElement(l_InteractiveAlert_0, {
                    bodyText = l_titleText_0, 
                    title = v31, 
                    buttonStackInfo = {
                        buttons = {
                            {
                                buttonType = l_ButtonType_0.Secondary, 
                                props = {
                                    onActivated = v27.closePrompt, 
                                    text = l_titleText_1
                                }
                            }, 
                            {
                                buttonType = l_ButtonType_0.PrimarySystem, 
                                props = {
                                    onActivated = v27.openSurvey, 
                                    text = l_bodyText_0
                                }
                            }
                        }
                    }, 
                    screenSize = v27.props.screenSize
                })
            }));
        end;
    end);
end;
v20 = v4.connect(function(v35, _) --[[ Line: 164 ]]
    local v37 = v35.Users[v35.LocalUserId];
    return {
        screenSize = v35.ScreenSize, 
        displayName = if v37 then v37.displayName or v37.name else "Robloxian"
    };
end, function(v38) --[[ Line: 170 ]]
    -- upvalues: v8 (copy)
    return {
        closeAlert = function() --[[ Line: 172 ]] --[[ Name: closeAlert ]]
            -- upvalues: v38 (copy), v8 (ref)
            return v38(v8());
        end
    };
end)(v20);
return (l_RoactServices_0.connect({
    localization = v7
})(v20));