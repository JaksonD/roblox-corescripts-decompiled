local l_Parent_0 = script:FindFirstAncestor("BugReporting").Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_ScreenshotManager_0 = require(l_Parent_0.TnSScreenshot).ScreenshotManager;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local _ = require(l_Parent_0.SystemInfoProtocol);
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local l_reportDeviceLogs_0 = require(l_Parent_0.LogReporting).reportDeviceLogs;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_BugReporterCounterName_0 = require(script.Parent.BugReporterTypes).BugReporterCounterName;
local v15 = require(script.Parent.api.postBugReportApi);
local v16 = require(script.Parent.SharedConstants);
local v17 = require(script.Parent.dependencies);
local l_bugReporterService_0 = v17.bugReporterService;
local l_guiService_0 = v17.guiService;
local l_loggingProtocol_0 = v17.loggingProtocol;
local l_logReporterService_0 = v17.logReporterService;
local l_runService_0 = v17.runService;
local l_userInputService_0 = v17.userInputService;
local l_voiceChatService_0 = v17.voiceChatService;
local l_systemInfoProtocol_0 = v17.systemInfoProtocol;
local l_localPlayer_0 = v17.localPlayer;
local l_getPlaceId_0 = v17.getPlaceId;
local l_makeLogger_0 = v17.makeLogger;
local l_networking_0 = v17.networking;
local v30 = game:DefineFastFlag("InAppBugReporterIxpEnabled", false);
local v31 = game:DefineFastFlag("InAppBugReporterIxpBypass", false);
local function _(v32, v33) --[[ Line: 46 ]] --[[ Name: isVoiceEnabled ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 47 ]]
        -- upvalues: v33 (copy), v32 (copy)
        if v33 then
            return v32:IsVoiceEnabledForUserIdAsync(v33);
        else
            return false;
        end;
    end);
    return l_status_0 and l_result_0;
end;
local function _(v37, v38, v39, v40) --[[ Line: 58 ]] --[[ Name: safeReportDeviceLogs ]]
    -- upvalues: l_reportDeviceLogs_0 (copy), l_mutedError_0 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 64 ]]
        -- upvalues: l_reportDeviceLogs_0 (ref), v37 (copy), v38 (copy), v39 (copy), v40 (copy)
        return l_reportDeviceLogs_0(v37, v38, v39, v40).url;
    end);
    if not l_status_1 then
        l_mutedError_0((("Failed to report device logs: %*"):format(l_result_1)));
    end;
    return l_status_1 and l_result_1 or "";
end;
return v2.memo(function() --[[ Line: 76 ]] --[[ Name: BugReporterEventReceiver ]]
    -- upvalues: l_useDispatch_0 (copy), l_getPlaceId_0 (copy), v31 (copy), v30 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_bugReporterService_0 (copy), v2 (copy), l_localPlayer_0 (copy), l_voiceChatService_0 (copy), l_logReporterService_0 (copy), l_reportDeviceLogs_0 (copy), l_mutedError_0 (copy), l_BugReporterCounterName_0 (copy), v15 (copy), l_networking_0 (copy), v1 (copy), l_SetCurrentToastMessage_0 (copy), l_makeLogger_0 (copy), l_loggingProtocol_0 (copy), l_Signal_0 (copy), l_ScreenshotManager_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_guiService_0 (copy), l_runService_0 (copy), l_userInputService_0 (copy), l_systemInfoProtocol_0 (copy), v16 (copy)
    local v44 = l_useDispatch_0();
    local v45 = l_getPlaceId_0();
    local v46 = nil;
    if v31 then
        v46 = true;
    elseif v30 then
        v46 = l_useUserExperiment_0({
            l_AppUserLayers_0.ConsumerPlatformsBugReporting
        }, function(v47) --[[ Line: 86 ]]
            -- upvalues: l_AppUserLayers_0 (ref)
            return (v47[l_AppUserLayers_0.ConsumerPlatformsBugReporting] or {}).inAppBugReportingEnabled or nil;
        end);
    end;
    local v48 = v46 and l_bugReporterService_0 and l_bugReporterService_0:IsAvailable();
    local v62 = v2.useCallback(function(v49, v50) --[[ Line: 96 ]]
        -- upvalues: l_localPlayer_0 (ref), l_voiceChatService_0 (ref), l_logReporterService_0 (ref), v45 (copy), l_reportDeviceLogs_0 (ref), l_mutedError_0 (ref), l_BugReporterCounterName_0 (ref), v15 (ref), l_networking_0 (ref), v1 (ref), v44 (copy), l_SetCurrentToastMessage_0 (ref)
        local v51 = l_localPlayer_0 and l_localPlayer_0.UserId or 0;
        local v52 = l_localPlayer_0 and l_localPlayer_0.DisplayName or "";
        local l_l_voiceChatService_0_0 = l_voiceChatService_0;
        local l_l_l_voiceChatService_0_0_0 = l_l_voiceChatService_0_0 --[[ copy: 5 -> 10 ]];
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 47 ]]
            -- upvalues: v51 (copy), l_l_l_voiceChatService_0_0_0 (copy)
            if v51 then
                return l_l_l_voiceChatService_0_0_0:IsVoiceEnabledForUserIdAsync(v51);
            else
                return false;
            end;
        end);
        local v57 = l_status_2 and l_result_2;
        l_status_2 = l_logReporterService_0;
        l_result_2 = v45;
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 64 ]]
            -- upvalues: l_reportDeviceLogs_0 (ref), l_status_2 (copy), v51 (copy), l_result_2 (copy), v57 (copy)
            return l_reportDeviceLogs_0(l_status_2, v51, l_result_2, v57).url;
        end);
        if not l_status_3 then
            l_mutedError_0((("Failed to report device logs: %*"):format(l_result_3)));
        end;
        l_l_voiceChatService_0_0 = l_status_3 and l_result_3 or "";
        v49.reportCounter(l_BugReporterCounterName_0.ReportSubmitted);
        v49.reportMilestone(l_BugReporterCounterName_0.ReportSubmitted, {
            screen = v50.additionalInfo.screen
        });
        v15(l_networking_0, v1.join(v50, {
            userId = v51, 
            userDisplayName = v52, 
            logUrl = l_l_voiceChatService_0_0
        })):andThen(function(v60) --[[ Line: 115 ]]
            -- upvalues: v49 (copy), l_BugReporterCounterName_0 (ref), v44 (ref), l_SetCurrentToastMessage_0 (ref)
            v49.reportCounter(l_BugReporterCounterName_0.ReportSucceeded);
            v49.reportMilestone(l_BugReporterCounterName_0.ReportSucceeded, {
                issueId = v60.issue.id
            });
            v44(l_SetCurrentToastMessage_0({
                toastMessage = "Feature.InAppBugReporting.Message.ToastSuccess"
            }));
        end):catch(function(v61) --[[ Line: 123 ]]
            -- upvalues: v49 (copy), v50 (copy), v44 (ref), l_SetCurrentToastMessage_0 (ref)
            v49.reportError(v61.type, {
                screen = v50.additionalInfo.screen, 
                message = v61.message
            });
            v44(l_SetCurrentToastMessage_0({
                toastMessage = "Feature.InAppBugReporting.Message.ToastFailure"
            }));
        end);
    end, {
        v44, 
        v45
    });
    v2.useEffect(function() --[[ Line: 137 ]]
        -- upvalues: v48 (copy), l_bugReporterService_0 (ref), l_makeLogger_0 (ref), l_loggingProtocol_0 (ref), l_Signal_0 (ref), l_BugReporterCounterName_0 (ref), l_ScreenshotManager_0 (ref), v44 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), l_guiService_0 (ref), l_runService_0 (ref), l_userInputService_0 (ref), l_systemInfoProtocol_0 (ref), v62 (copy), v16 (ref)
        local v63 = nil;
        if v48 and l_bugReporterService_0 then
            v63 = l_bugReporterService_0.BugReportRequested:Connect(function(v64) --[[ Line: 141 ]]
                -- upvalues: l_makeLogger_0 (ref), l_loggingProtocol_0 (ref), l_Signal_0 (ref), l_BugReporterCounterName_0 (ref), l_ScreenshotManager_0 (ref), v44 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), l_guiService_0 (ref), l_runService_0 (ref), l_userInputService_0 (ref), l_systemInfoProtocol_0 (ref), v62 (ref), v16 (ref)
                local v65 = l_makeLogger_0(l_loggingProtocol_0, v64);
                local v66 = l_Signal_0.new();
                v65.reportCounter(l_BugReporterCounterName_0.ReportInitiated);
                l_ScreenshotManager_0:TakeScreenshotWithCallback(function(v67) --[[ Line: 147 ]]
                    -- upvalues: v65 (copy), l_BugReporterCounterName_0 (ref), v66 (copy)
                    v65.reportCounter(l_BugReporterCounterName_0.ScreenshotUploaded, {
                        screenshotRemoteId = v67
                    });
                    v66:fire(v67);
                end, function(v68) --[[ Line: 150 ]]
                    -- upvalues: v65 (copy), l_BugReporterCounterName_0 (ref), v44 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), l_guiService_0 (ref), l_runService_0 (ref), l_userInputService_0 (ref), l_systemInfoProtocol_0 (ref), v66 (copy), v62 (ref)
                    v65.reportCounter(l_BugReporterCounterName_0.ScreenshotCaptured, {
                        screenshotLocalId = v68
                    });
                    v44(l_SetCentralOverlay_0(l_CentralOverlayType_0.BugReporter, {
                        guiService = l_guiService_0, 
                        runService = l_runService_0, 
                        userInputService = l_userInputService_0, 
                        systemInfoProtocol = l_systemInfoProtocol_0, 
                        screenshotLocalId = v68, 
                        onScreenshotUploaded = v66, 
                        onSubmitBugReport = v62, 
                        logger = v65
                    }));
                end, v16.SCREENSHOT_BUCKET);
            end);
        end;
        return function() --[[ Line: 166 ]]
            -- upvalues: v63 (ref)
            if v63 then
                v63:Disconnect();
            end;
        end;
    end, {
        v44, 
        v48, 
        v62
    });
end);