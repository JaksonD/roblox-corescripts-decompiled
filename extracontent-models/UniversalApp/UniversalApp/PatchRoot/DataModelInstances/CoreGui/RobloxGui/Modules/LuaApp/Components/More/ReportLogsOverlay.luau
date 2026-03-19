local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local v9 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_LogReporterService_0 = game:GetService("LogReporterService");
local l_Players_0 = game:GetService("Players");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_reportDeviceLogs_0 = require(l_CorePackages_0.Workspace.Packages.LogReporting).reportDeviceLogs;
return function() --[[ Line: 25 ]] --[[ Name: ReportLogsOverlay ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy), l_Players_0 (copy), l_VoiceChatService_0 (copy), l_reportDeviceLogs_0 (copy), l_LogReporterService_0 (copy), v5 (copy), v9 (copy), l_useStyle_0 (copy), l_useSelector_0 (copy), l_InteractiveAlert_0 (copy), l_default_0 (copy), l_ButtonType_0 (copy)
    local v17 = l_useDispatch_0();
    local v18, v19 = v2.useState("");
    local v20, v21 = v2.useState("");
    local v22, v23 = v2.useState(false);
    local v31 = v2.useCallback(function() --[[ Line: 31 ]]
        -- upvalues: l_Players_0 (ref), l_VoiceChatService_0 (ref), l_reportDeviceLogs_0 (ref), l_LogReporterService_0 (ref), v19 (copy), v21 (copy), v23 (copy)
        local l_PlaceId_0 = game.PlaceId;
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        local v26 = l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 36 ]]
            -- upvalues: l_LocalPlayer_0 (copy), l_VoiceChatService_0 (ref), v26 (copy)
            if l_LocalPlayer_0 then
                return l_VoiceChatService_0:IsVoiceEnabledForUserIdAsync(v26);
            else
                return false, false;
            end;
        end);
        local v29 = l_status_0 and l_result_0 or false;
        local v30 = l_reportDeviceLogs_0(l_LogReporterService_0, v26, l_PlaceId_0, v29);
        v19(v30.url);
        v21(v30.reportId);
        v23(true);
    end, {
        game.PlaceId
    });
    local v32 = v2.useCallback(function() --[[ Line: 53 ]]
        -- upvalues: v17 (copy), v5 (ref)
        v17(v5());
    end, {});
    local v33 = v9({
        cancelButtonText = "CommonUI.Features.Action.Close", 
        sendButtonText = "CommonUI.Features.Action.Send", 
        dialogTitle = "CommonUI.Features.Label.ReportLogs", 
        promptText = "CommonUI.Features.Prompt.ReportLogsQuestion", 
        resultText = "CommonUI.Features.Prompt.ReportLogsResult"
    });
    local v34 = l_useStyle_0();
    local v36 = l_useSelector_0(function(v35) --[[ Line: 65 ]]
        return v35.ScreenSize;
    end);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = v34.Theme.BackgroundUIDefault.Color, 
        BackgroundTransparency = 1, 
        Active = true, 
        Selectable = false
    }, {
        AlertWindow = v2.createElement(l_InteractiveAlert_0, {
            title = v33.dialogTitle, 
            screenSize = v36, 
            bodyText = if v22 then string.format("%s\nreportId: %s", v33.resultText, v20) else v33.promptText, 
            middleContent = function() --[[ Line: 82 ]] --[[ Name: middleContent ]]
                -- upvalues: v2 (ref), v18 (copy), v34 (copy), v22 (copy), l_default_0 (ref)
                return v2.createElement("TextButton", {
                    Text = v18, 
                    TextColor3 = v34.Tokens.Semantic.Color.Text.Link.Color3, 
                    TextWrapped = true, 
                    TextSize = v34.Tokens.Global.FontSize_50, 
                    Size = if v22 then UDim2.new(1, 0, 0, 75) else UDim2.new(0, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    [v2.Event.Activated] = function() --[[ Line: 90 ]]
                        -- upvalues: l_default_0 (ref), v18 (ref)
                        l_default_0:shareUrl({
                            url = v18, 
                            context = "ReportLogsUrlShare"
                        });
                    end
                });
            end, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v32, 
                            text = v33.cancelButtonText
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            text = v33.sendButtonText, 
                            userInteractionEnabled = not v22, 
                            isDisabled = v22, 
                            onActivated = v31
                        }
                    }
                }
            }
        })
    });
end;