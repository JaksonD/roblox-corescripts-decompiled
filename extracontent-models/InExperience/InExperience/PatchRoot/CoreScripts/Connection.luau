local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_TeleportService_0 = game:GetService("TeleportService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_VRService_0 = game:GetService("VRService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local v10 = game:DefineFastFlag("ConnectionRemoveLoadingTimeout", false);
l_CorePackages_0:WaitForChild("Workspace"):WaitForChild("Packages", v10 and 1e999 or nil);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v12 = require(l_RobloxGui_0.Modules.ErrorPrompt);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local _ = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).Url;
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local v17 = game:DefineFastFlag("DebugEnableErrorStringTesting", false);
local v18 = game:DefineFastFlag("ShouldMuteUnlocalizedError", false);
local v19 = game:DefineFastFlag("UpdateConnectionErrorLoc", false);
local v20 = game:DefineFastFlag("ShowScreentimeLockoutKickMessage", false);
local v21 = game:DefineFastFlag("AddConnectionErrorLocalizationKeys", false);
local v22 = game:DefineFastFlag("AddClientDisconnectVerboselyModeratedGame", false);
local v23 = {
    eventName = "ConnectionEvent", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        2025, 
        7, 
        31
    }, 
    description = "Counter to track connection events.", 
    links = "https://roblox.atlassian.net/browse/CSC-585"
};
local v24 = game:DefineFastInt("PotentialClientTimeoutSeconds", 7200);
local v25 = game:DefineFastInt("MaxKickMessageLength", 200);
local v26 = game:DefineFastFlag("RefactorReconnectUnblockTeleport", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("CoreGuiOverflowDetection");
local v28 = require(l_RobloxGui_0.Modules.Flags.FFlagCoreScriptShowTeleportPrompt);
local v29 = require(l_RobloxGui_0.Modules.Flags.FFlagAllowDisconnectGuiForOkUnknown);
local v30 = game:DefineFastFlag("EnableExperienceGenericChallengeRenderingConnection2", false);
local v31 = require(l_RobloxGui_0.Modules.Flags.GetFFlagDisplayChannelNameOnErrorPrompt);
local function _(v32, v33) --[[ Line: 61 ]] --[[ Name: safeGetFInt ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 62 ]]
        -- upvalues: v32 (copy)
        return (tonumber(settings():GetFVariable(v32)));
    end);
    return l_status_0 and l_result_0 or v33;
end;
local function _(v37, v38) --[[ Line: 68 ]] --[[ Name: safeGetFString ]]
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 69 ]]
        -- upvalues: v37 (copy)
        return settings():GetFVariable(v37);
    end);
    return l_status_1 and l_result_1 or v38;
end;
local l_pcall_0 = pcall;
local v43 = "DefaultTimeoutTimeMs";
local l_v43_0 = v43 --[[ copy: 38 -> 79 ]];
local v45;
l_pcall_0, v45 = l_pcall_0(function() --[[ Line: 62 ]]
    -- upvalues: l_v43_0 (copy)
    return (tonumber(settings():GetFVariable(l_v43_0)));
end);
local v46 = (l_pcall_0 and v45 or 10000) / 1000;
local l_FFlag_0 = settings():GetFFlag("ReconnectDisabled");
v45 = pcall;
local v48 = "ReconnectDisabledReason";
local l_v48_0 = v48 --[[ copy: 39 -> 80 ]];
v45, v43 = v45(function() --[[ Line: 69 ]]
    -- upvalues: l_v48_0 (copy)
    return settings():GetFVariable(l_v48_0);
end);
l_pcall_0 = v45 and v43 or "We're sorry, Roblox is temporarily unavailable.  Please try again later.";
v45 = tick();
v43 = game:DefineFastFlag("UpdateConnectionLocWarning", false);
v48 = game:DefineFastFlag("AddPlacelaunchDeviceBlock2", false);
local function v56(v50, v51) --[[ Line: 96 ]] --[[ Name: translateString ]]
    -- upvalues: l_LocalizationService_0 (copy), l_Localization_0 (copy), v43 (copy), l_Logging_0 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v53 = l_Localization_0.new(l_RobloxLocaleId_0);
    v53:SetLocale(l_RobloxLocaleId_0);
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 101 ]]
        -- upvalues: v53 (copy), v50 (copy), v51 (copy)
        return v53:Format(v50, v51);
    end);
    if l_status_2 then
        return l_result_2;
    else
        if v43 then
            l_Logging_0.warn("Failed to translate string with key: " .. v50 .. ", LocaleId: " .. l_RobloxLocaleId_0);
        else
            l_Logging_0.warn("Failed to translate string with key: " .. v50);
        end;
        return "";
    end;
end;
local v57 = nil;
local v58 = -1;
local l_X_0 = l_RobloxGui_0.AbsoluteSize.X;
local l_Y_0 = l_RobloxGui_0.AbsoluteSize.Y;
local v61 = {
    NONE = 1, 
    RECONNECT_PLACELAUNCH = 2, 
    RECONNECT_DISCONNECT = 3, 
    TELEPORT_FAILED = 4, 
    IS_RECONNECTING = 5, 
    RECONNECT_DISABLED_DISCONNECT = 6, 
    RECONNECT_DISABLED_PLACELAUNCH = 7, 
    RECONNECT_DISABLED = 8, 
    OUT_OF_MEMORY_KEEPPLAYING_LEAVE = 9, 
    RECONNECT_CONNECT_FAILURE = 10, 
    RECONNECT_DISABLED_CONNECT_FAILURE = 11
};
local l_NONE_0 = v61.NONE;
local l_OK_0 = Enum.ConnectionError.OK;
local v64 = {
    [v61.RECONNECT_PLACELAUNCH] = "Join Error", 
    [v61.RECONNECT_DISABLED_PLACELAUNCH] = "Join Error", 
    [v61.RECONNECT_DISCONNECT] = "Disconnected", 
    [v61.RECONNECT_DISABLED_DISCONNECT] = "Disconnected", 
    [v61.TELEPORT_FAILED] = "Teleport Failed", 
    [v61.RECONNECT_DISABLED] = "Error", 
    [v61.OUT_OF_MEMORY_KEEPPLAYING_LEAVE] = "Low Memory Warning", 
    [v61.RECONNECT_CONNECT_FAILURE] = "Connection Failed", 
    [v61.RECONNECT_DISABLED_CONNECT_FAILURE] = "Connection Failed"
};
local v65 = {
    [v61.RECONNECT_PLACELAUNCH] = "InGame.ConnectionError.Title.JoinError", 
    [v61.RECONNECT_DISABLED_PLACELAUNCH] = "InGame.ConnectionError.Title.JoinError", 
    [v61.RECONNECT_DISCONNECT] = "InGame.ConnectionError.Title.Disconnected", 
    [v61.RECONNECT_DISABLED_DISCONNECT] = "InGame.ConnectionError.Title.Disconnected", 
    [v61.TELEPORT_FAILED] = "InGame.ConnectionError.Title.TeleportFailed", 
    [v61.RECONNECT_DISABLED] = "InGame.CommonUI.Title.Error", 
    [v61.OUT_OF_MEMORY_KEEPPLAYING_LEAVE] = "InGame.ConnectionError.Title.LowMemoryWarning", 
    [v61.RECONNECT_CONNECT_FAILURE] = "InGame.ConnectionError.Title.ConnectionFailed", 
    [v61.RECONNECT_DISABLED_CONNECT_FAILURE] = "InGame.ConnectionError.Title.ConnectionFailed"
};
local v66 = l_Create_0("ScreenGui")({
    Parent = l_CoreGui_0, 
    Name = "RobloxPromptGui", 
    OnTopOfCoreBlur = true, 
    DisplayOrder = 9, 
    AutoLocalize = false
});
local v67 = l_Create_0("Frame")({
    Name = "promptOverlay", 
    BackgroundColor3 = Color3.new(0, 0, 0), 
    BackgroundTransparency = 1, 
    Size = UDim2.new(1, 0, 1, 36), 
    Position = UDim2.new(0, 0, 0, -36), 
    Active = false, 
    Parent = v66
});
coroutine.wrap(function() --[[ Line: 185 ]]
    -- upvalues: l_RobloxGui_0 (copy), v67 (copy)
    local v68 = require(l_RobloxGui_0.Modules.TopBar.Constants);
    local v69 = v68.ApplyDisplayScale(v68.TopBarHeight);
    v67.Size = UDim2.new(1, 0, 1, v69);
    v67.Position = UDim2.new(0, 0, 0, -v69);
end)();
local function v71() --[[ Line: 194 ]]
    -- upvalues: l_NONE_0 (ref), v61 (copy), l_TelemetryService_0 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v57 (ref), l_TeleportService_0 (copy), v28 (copy), v26 (copy), l_GuiService_0 (copy)
    local _ = tick();
    if l_NONE_0 == v61.IS_RECONNECTING then
        l_TelemetryService_0:LogCounter(v23, {
            customFields = {
                selectedItem = "UserClickWhileReconnecting"
            }
        }, 1);
        return;
    else
        l_TelemetryService_0:LogCounter(v23, {
            customFields = {
                selectedItem = "ReconnectInitiated"
            }
        }, 1);
        l_RbxAnalyticsService_0:ReportCounter("ReconnectPrompt-ReconnectActivated");
        l_NONE_0 = v61.IS_RECONNECTING;
        v57:primaryShimmerPlay();
        l_TelemetryService_0:LogCounter(v23, {
            customFields = {
                selectedItem = "ReconnectSameServer"
            }
        }, 1);
        l_TeleportService_0:TeleportReconnect();
        if v28 then
            if v26 then
                l_TeleportService_0:UnblockAsync();
                return;
            else
                l_GuiService_0:SetMenuIsOpen(false, "ErrorPrompt");
            end;
        end;
        return;
    end;
end;
local function v72() --[[ Line: 219 ]]
    -- upvalues: l_TelemetryService_0 (copy), v23 (copy), l_GuiService_0 (copy), l_RunService_0 (copy)
    l_TelemetryService_0:LogCounter(v23, {
        customFields = {
            selectedItem = "LeaveInitiated"
        }
    }, 1);
    l_GuiService_0.SelectedCoreObject = nil;
    l_RunService_0.RenderStepped:wait();
    l_RunService_0.RenderStepped:wait();
    game:Shutdown();
end;
local function v73() --[[ Line: 228 ]]
    -- upvalues: l_GuiService_0 (copy)
    l_GuiService_0:ClearError();
end;
local v74 = {
    [Enum.ConnectionError.IPRecentlyConnected] = true, 
    [Enum.ConnectionError.ConnectionBanned] = true, 
    [Enum.ConnectionError.InvalidPassword] = true, 
    [Enum.ConnectionError.OurSystemRequiresSecurity] = true, 
    [Enum.ConnectionError.IncompatibleProtocolVersion] = true, 
    [Enum.ConnectionError.DisconnectLuaKick] = true, 
    [Enum.ConnectionError.DisconnectSecurityKeyMismatch] = true, 
    [Enum.ConnectionError.DisconnectNewSecurityKeyMismatch] = true, 
    [Enum.ConnectionError.DisconnectDuplicateTicket] = true, 
    [Enum.ConnectionError.DisconnectWrongVersion] = true, 
    [Enum.ConnectionError.DisconnectProtocolMismatch] = true, 
    [Enum.ConnectionError.DisconnectBadhash] = true, 
    [Enum.ConnectionError.DisconnectIllegalTeleport] = true, 
    [Enum.ConnectionError.DisconnectDuplicatePlayer] = true, 
    [Enum.ConnectionError.DisconnectCloudEditKick] = true, 
    [Enum.ConnectionError.DisconnectOnRemoteSysStats] = true, 
    [Enum.ConnectionError.DisconnectPrivateServerKickout] = true, 
    [Enum.ConnectionError.PlacelaunchFlooded] = true, 
    [Enum.ConnectionError.PlacelaunchHashException] = true, 
    [Enum.ConnectionError.PlacelaunchHashExpired] = true, 
    [Enum.ConnectionError.PlacelaunchUnauthorized] = true, 
    [Enum.ConnectionError.PlacelaunchUserLeft] = true, 
    [Enum.ConnectionError.PlacelaunchRestricted] = true, 
    [Enum.ConnectionError.PlacelaunchUserPrivacyUnauthorized] = true, 
    [Enum.ConnectionError.PlacelaunchCreatorBan] = true, 
    [Enum.ConnectionError.AndroidAnticheatKick] = true, 
    [Enum.ConnectionError.AndroidEmulatorKick] = true, 
    [Enum.ConnectionError.AndroidRootedKick] = true
};
if l_game_EngineFeature_0 then
    v74[Enum.ConnectionError.DisconnectClientFailure] = true;
end;
if v20 then
    v74[Enum.ConnectionError.ScreentimeLockoutKick] = true;
end;
if v21 then
    v74[Enum.ConnectionError.DisconnectBySecurityPolicy] = true;
    v74[Enum.ConnectionError.DisconnectBlockedIP] = true;
    v74[Enum.ConnectionError.DisconnectCollaboratorPermissionRevoked] = true;
    v74[Enum.ConnectionError.DisconnectCollaboratorUnderage] = true;
end;
if v48 then
    v74[Enum.ConnectionError.PlacelaunchDeviceBlock] = true;
end;
local v75 = {
    [v61.RECONNECT_PLACELAUNCH] = {
        {
            Text = "Retry", 
            LocalizationKey = "InGame.CommonUI.Button.Retry", 
            LayoutOrder = 2, 
            Callback = v71, 
            Primary = true
        }, 
        {
            Text = "Cancel", 
            LocalizationKey = "Feature.SettingsHub.Action.CancelSearch", 
            LayoutOrder = 1, 
            Callback = v72
        }
    }, 
    [v61.RECONNECT_DISCONNECT] = {
        {
            Text = "Reconnect", 
            LocalizationKey = "InGame.ConnectionError.Button.Reconnect", 
            LayoutOrder = 2, 
            Callback = v71, 
            Primary = true
        }, 
        {
            Text = "Leave", 
            LocalizationKey = "Feature.SettingsHub.Label.LeaveButton", 
            LayoutOrder = 1, 
            Callback = v72
        }
    }, 
    [v61.TELEPORT_FAILED] = {
        {
            Text = "OK", 
            LocalizationKey = "InGame.CommonUI.Button.Ok", 
            LayoutOrder = 1, 
            Callback = v73, 
            Primary = true
        }
    }, 
    [v61.RECONNECT_DISABLED_DISCONNECT] = {
        {
            Text = "Leave", 
            LocalizationKey = "Feature.SettingsHub.Label.LeaveButton", 
            LayoutOrder = 1, 
            Callback = v72, 
            Primary = true
        }
    }, 
    [v61.RECONNECT_DISABLED_PLACELAUNCH] = {
        {
            Text = "Leave", 
            LocalizationKey = "Feature.SettingsHub.Label.LeaveButton", 
            LayoutOrder = 1, 
            Callback = v72, 
            Primary = true
        }
    }, 
    [v61.RECONNECT_DISABLED] = {
        {
            Text = "Leave", 
            LocalizationKey = "Feature.SettingsHub.Label.LeaveButton", 
            LayoutOrder = 1, 
            Callback = v72, 
            Primary = true
        }
    }, 
    [v61.OUT_OF_MEMORY_KEEPPLAYING_LEAVE] = {
        {
            Text = "Keep Playing", 
            LocalizationKey = "InGame.CommonUI.Button.KeepPlaying", 
            LayoutOrder = 1, 
            Callback = v73
        }, 
        {
            Text = "Leave", 
            LocalizationKey = "Feature.SettingsHub.Label.LeaveButton", 
            LayoutOrder = 2, 
            Callback = v72, 
            Primary = true
        }
    }, 
    [v61.RECONNECT_CONNECT_FAILURE] = {
        {
            Text = "Retry", 
            LocalizationKey = "InGame.CommonUI.Button.Retry", 
            LayoutOrder = 2, 
            Callback = v71, 
            Primary = true
        }, 
        {
            Text = "Cancel", 
            LocalizationKey = "Feature.SettingsHub.Action.CancelSearch", 
            LayoutOrder = 1, 
            Callback = v72
        }
    }, 
    [v61.RECONNECT_DISABLED_CONNECT_FAILURE] = {
        {
            Text = "Leave", 
            LocalizationKey = "Feature.SettingsHub.Label.LeaveButton", 
            LayoutOrder = 1, 
            Callback = v72, 
            Primary = true
        }
    }
};
local v76 = {
    [v61.NONE] = function() --[[ Line: 395 ]]
        -- upvalues: l_RunService_0 (copy), v67 (copy)
        l_RunService_0:SetRobloxGuiFocused(false);
        v67.Active = false;
        v67.Transparency = 1;
    end, 
    [v61.RECONNECT_DISCONNECT] = function() --[[ Line: 400 ]]
        -- upvalues: l_VRService_0 (copy), l_RunService_0 (copy), v67 (copy)
        if l_VRService_0.VREnabled then
            l_RunService_0:SetRobloxGuiFocused(false);
        else
            l_RunService_0:SetRobloxGuiFocused(true);
        end;
        v67.Active = true;
        v67.Transparency = 1;
    end, 
    [v61.RECONNECT_PLACELAUNCH] = function() --[[ Line: 409 ]]
        -- upvalues: l_RunService_0 (copy), v67 (copy)
        l_RunService_0:SetRobloxGuiFocused(false);
        v67.Active = true;
        v67.Transparency = 0.3;
    end, 
    [v61.TELEPORT_FAILED] = function() --[[ Line: 414 ]]
        -- upvalues: l_RunService_0 (copy), v67 (copy)
        l_RunService_0:SetRobloxGuiFocused(false);
        v67.Active = true;
        v67.Transparency = 0.3;
    end, 
    [v61.RECONNECT_DISABLED_DISCONNECT] = function() --[[ Line: 419 ]]
        -- upvalues: l_VRService_0 (copy), l_RunService_0 (copy), v67 (copy)
        if l_VRService_0.VREnabled then
            l_RunService_0:SetRobloxGuiFocused(false);
        else
            l_RunService_0:SetRobloxGuiFocused(true);
        end;
        v67.Active = true;
        v67.Transparency = 1;
    end, 
    [v61.RECONNECT_DISABLED_PLACELAUNCH] = function() --[[ Line: 428 ]]
        -- upvalues: l_RunService_0 (copy), v67 (copy)
        l_RunService_0:SetRobloxGuiFocused(false);
        v67.Active = true;
        v67.Transparency = 0.3;
    end, 
    [v61.RECONNECT_DISABLED] = function() --[[ Line: 433 ]]
        -- upvalues: l_VRService_0 (copy), l_RunService_0 (copy), v67 (copy)
        if l_VRService_0.VREnabled then
            l_RunService_0:SetRobloxGuiFocused(false);
        else
            l_RunService_0:SetRobloxGuiFocused(true);
        end;
        v67.Active = true;
        v67.Transparency = 1;
    end, 
    [v61.RECONNECT_CONNECT_FAILURE] = function() --[[ Line: 442 ]]
        -- upvalues: l_RunService_0 (copy), v67 (copy)
        l_RunService_0:SetRobloxGuiFocused(false);
        v67.Active = true;
        v67.Transparency = 0.3;
    end, 
    [v61.RECONNECT_DISABLED_CONNECT_FAILURE] = function() --[[ Line: 447 ]]
        -- upvalues: l_RunService_0 (copy), v67 (copy)
        l_RunService_0:SetRobloxGuiFocused(false);
        v67.Active = true;
        v67.Transparency = 0.3;
    end
};
local function v79(v77) --[[ Line: 454 ]] --[[ Name: onEnter ]]
    -- upvalues: v57 (ref), v17 (copy), v12 (copy), v67 (copy), l_X_0 (ref), l_Y_0 (ref), v76 (copy), v64 (copy), v65 (copy), v75 (copy)
    if not v57 then
        local v78 = {
            MenuIsOpenKey = "ConnectionErrorPrompt", 
            PlayAnimation = not v17
        };
        v57 = v12.new("Default", v78);
        v57:setParent(v67);
        v57:resizeWidthAndHeight(l_X_0, l_Y_0);
    end;
    if v76[v77] then
        v76[v77]();
    end;
    v57:setErrorTitle(v64[v77], v65[v77]);
    v57:updateButtons(v75[v77]);
end;
local function _(v80) --[[ Line: 471 ]] --[[ Name: onExit ]]
    -- upvalues: v61 (copy), v57 (ref)
    if v80 == v61.IS_RECONNECTING then
        v57:primaryShimmerStop();
    end;
end;
local function v85(v82, v83, v84) --[[ Line: 478 ]] --[[ Name: stateTransit ]]
    -- upvalues: v29 (copy), v61 (copy), l_FFlag_0 (copy), v45 (ref), v58 (ref), v46 (copy), l_OK_0 (ref), v74 (copy), l_TelemetryService_0 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v24 (copy)
    if v29 then
        if v83 == Enum.ConnectionError.OK then
            return v61.NONE;
        end;
    elseif v82 == Enum.ConnectionError.OK then
        return v61.NONE;
    end;
    if v84 == v61.NONE then
        if l_FFlag_0 then
            return v61.RECONNECT_DISABLED;
        else
            v45 = tick();
            if v29 then
                assert(v83 ~= Enum.ConnectionError.OK);
                if v82 == Enum.ConnectionError.OK then
                    return v61.RECONNECT_DISCONNECT;
                end;
            end;
            if v82 == Enum.ConnectionError.ConnectErrors then
                v58 = tick() + v46;
                l_OK_0 = Enum.ConnectionError.ConnectErrors;
                if v74[v83] then
                    return v61.RECONNECT_DISABLED_CONNECT_FAILURE;
                else
                    l_TelemetryService_0:LogCounter(v23, {
                        customFields = {
                            selectedItem = "ConnectError"
                        }
                    }, 1);
                    l_TelemetryService_0:LogCounter(v23, {
                        customFields = {
                            selectedItem = "ConnectFailed"
                        }
                    }, 1);
                    return v61.RECONNECT_CONNECT_FAILURE;
                end;
            elseif v82 == Enum.ConnectionError.DisconnectErrors then
                v58 = tick() + v46;
                l_OK_0 = Enum.ConnectionError.DisconnectErrors;
                if v83 == Enum.ConnectionError.DisconnectOutOfMemoryKeepPlayingLeave then
                    return v61.OUT_OF_MEMORY_KEEPPLAYING_LEAVE;
                elseif v74[v83] then
                    return v61.RECONNECT_DISABLED_DISCONNECT;
                else
                    l_TelemetryService_0:LogCounter(v23, {
                        customFields = {
                            selectedItem = "Disconnected"
                        }
                    }, 1);
                    l_RbxAnalyticsService_0:ReportCounter("ReconnectPrompt-Disconnect");
                    return v61.RECONNECT_DISCONNECT;
                end;
            elseif v82 == Enum.ConnectionError.PlacelaunchErrors then
                l_OK_0 = Enum.ConnectionError.PlacelaunchErrors;
                if v74[v83] then
                    return v61.RECONNECT_DISABLED_PLACELAUNCH;
                else
                    l_TelemetryService_0:LogCounter(v23, {
                        customFields = {
                            selectedItem = "PlaceLaunchError"
                        }
                    }, 1);
                    l_RbxAnalyticsService_0:ReportCounter("ReconnectPrompt-PlaceLaunch");
                    return v61.RECONNECT_PLACELAUNCH;
                end;
            elseif v82 == Enum.ConnectionError.TeleportErrors then
                l_TelemetryService_0:LogCounter(v23, {
                    customFields = {
                        selectedItem = "TeleportError"
                    }
                }, 1);
                l_RbxAnalyticsService_0:ReportCounter("ReconnectPrompt-TeleportFailed");
                return v61.TELEPORT_FAILED;
            end;
        end;
    end;
    if v84 == v61.IS_RECONNECTING then
        l_TelemetryService_0:LogCounter(v23, {
            customFields = {
                selectedItem = "ReconnectFailed"
            }
        }, 1);
        l_RbxAnalyticsService_0:ReportCounter("ReconnectPrompt-ReconnectFailed");
        if v82 == Enum.ConnectionError.TeleportErrors then
            if tick() > v45 + v24 then
                l_TelemetryService_0:LogCounter(v23, {
                    customFields = {
                        selectedItem = "ReconnectTimedOut"
                    }
                }, 1);
                if l_OK_0 == Enum.ConnectionError.PlacelaunchErrors then
                    return v61.RECONNECT_DISABLED_PLACELAUNCH;
                else
                    return v61.RECONNECT_DISABLED_DISCONNECT;
                end;
            elseif l_OK_0 == Enum.ConnectionError.PlacelaunchErrors then
                l_TelemetryService_0:LogCounter(v23, {
                    customFields = {
                        selectedItem = "PlaceLaunchReconnectFailed"
                    }
                }, 1);
                return v61.RECONNECT_PLACELAUNCH;
            elseif l_OK_0 == Enum.ConnectionError.DisconnectErrors then
                l_TelemetryService_0:LogCounter(v23, {
                    customFields = {
                        selectedItem = "DisconnectReconnectFailed"
                    }
                }, 1);
                return v61.RECONNECT_DISCONNECT;
            elseif l_OK_0 == Enum.ConnectionError.ConnectErrors then
                l_TelemetryService_0:LogCounter(v23, {
                    customFields = {
                        selectedItem = "ConnectReconnectFailed"
                    }
                }, 1);
                return v61.RECONNECT_CONNECT_FAILURE;
            end;
        end;
    end;
    return v84;
end;
local function v99(v86) --[[ Line: 577 ]] --[[ Name: getCreatorBanString ]]
    -- upvalues: l_GuiService_0 (copy), v56 (copy)
    local l_l_GuiService_0_ErrorDetails_0 = l_GuiService_0:GetErrorDetails();
    if l_l_GuiService_0_ErrorDetails_0 then
        local l_time_0 = l_l_GuiService_0_ErrorDetails_0.time;
        local v89 = nil;
        if l_time_0 then
            local l_minutes_0 = l_l_GuiService_0_ErrorDetails_0.minutes;
            local l_hours_0 = l_l_GuiService_0_ErrorDetails_0.hours;
            local l_days_0 = l_l_GuiService_0_ErrorDetails_0.days;
            local v93 = nil;
            v93 = if l_minutes_0 == 1 then v56("InGame.ConnectionError.CreatorBanMinutesSingular") else v56("InGame.ConnectionError.CreatorBanMinutesPlural", {
                RBX_TIME_MINUTES = l_minutes_0
            });
            local v94 = nil;
            v94 = if l_hours_0 == 1 then v56("InGame.ConnectionError.CreatorBanHoursSingular") else v56("InGame.ConnectionError.CreatorBanHoursPlural", {
                RBX_TIME_HOURS = l_hours_0
            });
            local v95 = nil;
            v95 = if l_days_0 == 1 then v56("InGame.ConnectionError.CreatorBanDaysSingular") else v56("InGame.ConnectionError.CreatorBanDaysPlural", {
                RBX_TIME_DAYS = l_days_0
            });
            if v93 ~= "" and v94 ~= "" and v95 ~= "" then
                local l_v93_0 = v93;
                if l_hours_0 > 0 then
                    l_v93_0 = v94 .. ", " .. l_v93_0;
                end;
                if l_days_0 > 0 then
                    l_v93_0 = v95 .. ", " .. l_v93_0;
                end;
                v89 = v56("InGame.ConnectionError.CreatorBanWithTime", {
                    RBX_TIME_REMAINING = l_v93_0
                });
            else
                return v86;
            end;
        else
            v89 = v56("InGame.ConnectionError.CreatorBanNoTime");
        end;
        if v89 == "" then
            return v86;
        else
            local l_displayReason_0 = l_l_GuiService_0_ErrorDetails_0.displayReason;
            if l_displayReason_0 and l_displayReason_0 ~= "" then
                local v98 = v56("InGame.ConnectionError.CreatorBanMessage", {
                    RBX_STR = l_displayReason_0
                });
                if v98 ~= "" then
                    return v89 .. " " .. v98;
                else
                    return v86;
                end;
            else
                return v89;
            end;
        end;
    else
        return v86;
    end;
end;
local v100 = game:DefineFastFlag("RemoveRefToMissingLocInConnection", false);
local v101 = {
    [Enum.ConnectionError.ConnectErrors] = "InGame.ConnectionError.ConnectErrors", 
    [Enum.ConnectionError.AlreadyConnected] = "InGame.ConnectionError.ConnectionFailedWaitAndTry", 
    [Enum.ConnectionError.NoFreeIncomingConnections] = "InGame.ConnectionError.ConnectionFailedWaitAndTry", 
    [Enum.ConnectionError.IPRecentlyConnected] = "InGame.ConnectionError.ConnectErrors", 
    [Enum.ConnectionError.ConnectionBanned] = "InGame.ConnectionError.ConnectionBanned", 
    [Enum.ConnectionError.InvalidPassword] = "InGame.ConnectionError.ConnectionFailedRobloxVersion", 
    [Enum.ConnectionError.OurSystemRequiresSecurity] = "InGame.ConnectionError.ConnectionFailedRobloxVersion", 
    [Enum.ConnectionError.IncompatibleProtocolVersion] = "InGame.ConnectionError.ConnectionFailedRobloxVersion", 
    [Enum.ConnectionError.DisconnectErrors] = "InGame.ConnectionError.DisconnectErrors", 
    [Enum.ConnectionError.DisconnectBadhash] = "InGame.ConnectionError.DisconnectBadhash", 
    [Enum.ConnectionError.DisconnectSecurityKeyMismatch] = "InGame.ConnectionError.DisconnectSecurityKeyMismatch", 
    [Enum.ConnectionError.DisconnectProtocolMismatch] = "InGame.ConnectionError.DisconnectProtocolMismatch", 
    [Enum.ConnectionError.DisconnectReceivePacketError] = "InGame.ConnectionError.DisconnectReceivePacketError", 
    [Enum.ConnectionError.DisconnectReceivePacketStreamError] = "InGame.ConnectionError.DisconnectReceivePacketStreamError", 
    [Enum.ConnectionError.DisconnectSendPacketError] = "InGame.ConnectionError.DisconnectSendPacketError", 
    [Enum.ConnectionError.DisconnectIllegalTeleport] = "InGame.ConnectionError.DisconnectIllegalTeleport", 
    [Enum.ConnectionError.DisconnectDuplicatePlayer] = "InGame.ConnectionError.DisconnectDuplicatePlayer", 
    [Enum.ConnectionError.DisconnectDuplicateTicket] = "InGame.ConnectionError.DisconnectDuplicateTicket", 
    [Enum.ConnectionError.DisconnectTimeout] = "InGame.ConnectionError.DisconnectTimeout", 
    [Enum.ConnectionError.DisconnectLuaKick] = "InGame.ConnectionError.DisconnectLuaKick", 
    [Enum.ConnectionError.DisconnectOnRemoteSysStats] = "InGame.ConnectionError.DisconnectOnRemoteSysStats", 
    [Enum.ConnectionError.DisconnectHashTimeout] = "InGame.ConnectionError.DisconnectHashTimeout", 
    [Enum.ConnectionError.DisconnectCloudEditKick] = "InGame.ConnectionError.DisconnectCloudEditKick", 
    [Enum.ConnectionError.DisconnectPlayerless] = "InGame.ConnectionError.DisconnectPlayerless", 
    [Enum.ConnectionError.DisconnectNewSecurityKeyMismatch] = "InGame.ConnectionError.DisconnectNewSecurityKeyMismatch", 
    [Enum.ConnectionError.DisconnectEvicted] = "InGame.ConnectionError.DisconnectEvicted", 
    [Enum.ConnectionError.DisconnectDevMaintenance] = "InGame.ConnectionError.DisconnectDevMaintenance", 
    [Enum.ConnectionError.DisconnectRobloxMaintenance] = "InGame.ConnectionError.DisconnectRobloxMaintenance", 
    [Enum.ConnectionError.DisconnectRejoin] = "InGame.ConnectionError.DisconnectRejoin", 
    [Enum.ConnectionError.DisconnectConnectionLost] = "InGame.ConnectionError.DisconnectConnectionLost", 
    [Enum.ConnectionError.DisconnectIdle] = "InGame.ConnectionError.DisconnectIdle", 
    [Enum.ConnectionError.DisconnectRaknetErrors] = "InGame.ConnectionError.DisconnectRaknetErrors", 
    [Enum.ConnectionError.DisconnectWrongVersion] = "InGame.ConnectionError.DisconnectWrongVersion", 
    [Enum.ConnectionError.DisconnectBySecurityPolicy] = if v100 then nil else "InGame.ConnectionError.DisconnectBySecurityPolicy", 
    [Enum.ConnectionError.DisconnectBlockedIP] = if v100 then nil else "InGame.ConnectionError.DisconnectBlockedIP", 
    [Enum.ConnectionError.DisconnectClientFailure] = if v100 then nil else "InGame.ConnectionError.DisconnectClientFailure", 
    [Enum.ConnectionError.DisconnectClientRequest] = if v100 then nil else "InGame.ConnectionError.DisconnectClientRequest", 
    [Enum.ConnectionError.DisconnectPrivateServerKickout] = "InGame.ConnectionError.DisconnectPrivateServerKickout", 
    [Enum.ConnectionError.DisconnectModeratedGame] = if v100 then nil else "InGame.ConnectionError.DisconnectModeratedGame", 
    [Enum.ConnectionError.ServerShutdown] = if v100 then nil else "InGame.ConnectionError.ServerShutdown", 
    [Enum.ConnectionError.ReplicatorTimeout] = if v100 then nil else "InGame.ConnectionError.ReplicatorTimeout", 
    [Enum.ConnectionError.PlayerRemoved] = if v100 then nil else "InGame.ConnectionError.PlayerRemoved", 
    [Enum.ConnectionError.DisconnectOutOfMemoryKeepPlayingLeave] = "InGame.ConnectionError.DisconnectOutOfMemoryKeepPlayingLeave", 
    [Enum.ConnectionError.DisconnectRomarkEndOfTest] = if v100 then nil else "InGame.ConnectionError.DisconnectRomarkEndOfTest", 
    [Enum.ConnectionError.DisconnectCollaboratorPermissionRevoked] = if v100 then nil else "InGame.ConnectionError.DisconnectCollaboratorPermissionRevoked", 
    [Enum.ConnectionError.DisconnectCollaboratorUnderage] = if v100 then nil else "InGame.ConnectionError.DisconnectCollaboratorUnderage", 
    [Enum.ConnectionError.NetworkInternal] = if v100 then nil else "InGame.ConnectionError.NetworkInternal", 
    [Enum.ConnectionError.NetworkSend] = if v100 then nil else "InGame.ConnectionError.NetworkSend", 
    [Enum.ConnectionError.NetworkTimeout] = if v100 then nil else "InGame.ConnectionError.NetworkTimeout", 
    [Enum.ConnectionError.NetworkMisbehavior] = if v100 then nil else "InGame.ConnectionError.NetworkMisbehavior", 
    [Enum.ConnectionError.NetworkSecurity] = if v100 then nil else "InGame.ConnectionError.NetworkSecurity", 
    [Enum.ConnectionError.ReplacementReady] = if v100 then nil else "InGame.ConnectionError.ReplacementReady", 
    [Enum.ConnectionError.ServerEmpty] = if v100 then nil else "InGame.ConnectionError.ServerEmpty", 
    [Enum.ConnectionError.PhantomFreeze] = if v100 then nil else "InGame.ConnectionError.PhantomFreeze", 
    [Enum.ConnectionError.AndroidAnticheatKick] = "InGame.ConnectionError.AndroidAnticheatKick", 
    [Enum.ConnectionError.AndroidEmulatorKick] = "InGame.ConnectionError.AndroidEmulatorKick", 
    [Enum.ConnectionError.PlacelaunchErrors] = "InGame.ConnectionError.PlacelaunchErrors", 
    [Enum.ConnectionError.PlacelaunchDisabled] = "InGame.ConnectionError.PlacelaunchDisabled", 
    [Enum.ConnectionError.PlacelaunchError] = "InGame.ConnectionError.PlacelaunchError", 
    [Enum.ConnectionError.PlacelaunchGameEnded] = "InGame.ConnectionError.PlacelaunchGameEnded", 
    [Enum.ConnectionError.PlacelaunchGameFull] = "InGame.ConnectionError.PlacelaunchGameFull", 
    [Enum.ConnectionError.PlacelaunchUserLeft] = "InGame.ConnectionError.PlacelaunchUserLeft", 
    [Enum.ConnectionError.PlacelaunchRestricted] = "InGame.ConnectionError.PlacelaunchRestricted", 
    [Enum.ConnectionError.PlacelaunchUnauthorized] = "InGame.ConnectionError.PlacelaunchUnauthorized", 
    [Enum.ConnectionError.PlacelaunchFlooded] = "InGame.ConnectionError.PlacelaunchFlooded", 
    [Enum.ConnectionError.PlacelaunchHashExpired] = "InGame.ConnectionError.PlacelaunchHashExpired", 
    [Enum.ConnectionError.PlacelaunchHashException] = "InGame.ConnectionError.PlacelaunchHashException", 
    [Enum.ConnectionError.PlacelaunchPartyCannotFit] = "InGame.ConnectionError.PlacelaunchPartyCannotFit", 
    [Enum.ConnectionError.PlacelaunchHttpError] = "InGame.ConnectionError.PlacelaunchHttpError", 
    [Enum.ConnectionError.PlacelaunchUserPrivacyUnauthorized] = "InGame.ConnectionError.PlacelaunchUserPrivacyUnauthorized", 
    [Enum.ConnectionError.PlacelaunchCreatorBan] = if v100 then nil else "InGame.ConnectionError.PlacelaunchCreatorBan", 
    [Enum.ConnectionError.PlacelaunchCustomMessage] = if v100 then nil else "InGame.ConnectionError.PlacelaunchCustomMessage", 
    [Enum.ConnectionError.PlacelaunchOtherError] = "InGame.ConnectionError.PlacelaunchOtherError", 
    [Enum.ConnectionError.TeleportErrors] = "InGame.ConnectionError.TeleportErrors", 
    [Enum.ConnectionError.TeleportFailure] = "InGame.ConnectionError.TeleportFailure", 
    [Enum.ConnectionError.TeleportGameNotFound] = "InGame.ConnectionError.TeleportGameNotFound", 
    [Enum.ConnectionError.TeleportGameEnded] = "InGame.ConnectionError.TeleportGameEnded", 
    [Enum.ConnectionError.TeleportGameFull] = "InGame.ConnectionError.TeleportGameFull", 
    [Enum.ConnectionError.TeleportUnauthorized] = "InGame.ConnectionError.TeleportUnauthorized", 
    [Enum.ConnectionError.TeleportFlooded] = "InGame.ConnectionError.TeleportFlooded", 
    [Enum.ConnectionError.TeleportIsTeleporting] = if v100 then nil else "InGame.ConnectionError.TeleportIsTeleporting"
};
if v22 then
    v101[Enum.ConnectionError.DisconnectVerboselyModeratedGame] = "InGame.ConnectionError.DisconnectVerboselyModeratedGame";
end;
if v20 then
    v101[Enum.ConnectionError.ScreentimeLockoutKick] = "Feature.Screentime.Content.ScreentimeLimitDialog";
end;
if v21 then
    v101[Enum.ConnectionError.DisconnectBySecurityPolicy] = "InGame.ConnectionError.DisconnectBlockedConnection";
    v101[Enum.ConnectionError.DisconnectBlockedIP] = "InGame.ConnectionError.DisconnectBlockedConnection";
    v101[Enum.ConnectionError.DisconnectClientFailure] = "InGame.ConnectionError.DisconnectClientFailure";
    v101[Enum.ConnectionError.DisconnectClientRequest] = "InGame.ConnectionError.DisconnectClientRequest";
    v101[Enum.ConnectionError.DisconnectModeratedGame] = "InGame.ConnectionError.ServerShutdown";
    v101[Enum.ConnectionError.ServerShutdown] = "InGame.ConnectionError.ServerShutdown";
    v101[Enum.ConnectionError.ReplicatorTimeout] = "InGame.ConnectionError.DisconnectTryAgain";
    v101[Enum.ConnectionError.PlayerRemoved] = "InGame.ConnectionError.DisconnectTryAgain";
    v101[Enum.ConnectionError.DisconnectRomarkEndOfTest] = "InGame.ConnectionError.DisconnectTryAgain";
    v101[Enum.ConnectionError.DisconnectCollaboratorPermissionRevoked] = "InGame.ConnectionError.DisconnectCollaboratorPermissionRevoked";
    v101[Enum.ConnectionError.DisconnectCollaboratorUnderage] = "InGame.ConnectionError.DisconnectCollaboratorUnderage";
    v101[Enum.ConnectionError.NetworkInternal] = "InGame.ConnectionError.DisconnectTryAgain";
    v101[Enum.ConnectionError.NetworkSend] = "InGame.ConnectionError.DisconnectTryAgain";
    v101[Enum.ConnectionError.NetworkTimeout] = "InGame.ConnectionError.DisconnectTryAgain";
    v101[Enum.ConnectionError.NetworkMisbehavior] = "InGame.ConnectionError.DisconnectTryAgain";
    v101[Enum.ConnectionError.NetworkSecurity] = "InGame.ConnectionError.DisconnectTryAgain";
    v101[Enum.ConnectionError.ReplacementReady] = "InGame.ConnectionError.DisconnectTryAgain";
    v101[Enum.ConnectionError.ServerEmpty] = "InGame.ConnectionError.DisconnectTryAgain";
    v101[Enum.ConnectionError.PhantomFreeze] = "InGame.ConnectionError.DisconnectTryAgain";
    v101[Enum.ConnectionError.PlacelaunchCreatorBan] = "InGame.ConnectionError.CreatorBanNoTime";
end;
if v48 then
    v101[Enum.ConnectionError.PlacelaunchDeviceBlock] = "InGame.ConnectionError.PlacelaunchDeviceBlock";
end;
local function v109(v102, v103, v104) --[[ Line: 769 ]] --[[ Name: getErrorString ]]
    -- upvalues: v56 (copy), v25 (copy), v19 (copy), v101 (copy), l_mutedError_0 (copy), v18 (copy)
    if v103 == Enum.ConnectionError.OK then
        return "";
    elseif v104 then
        local v105 = v56("InGame.ConnectionError.ReconnectFailed");
        if v105 ~= "" then
            return v105;
        else
            return "Reconnect was unsuccessful. Please try again.";
        end;
    elseif v103 == Enum.ConnectionError.DisconnectLuaKick and v102 ~= "" then
        v102 = v102:sub(1, v25);
        local v106 = v56("InGame.ConnectionError.DisconnectLuaKickWithMessage", {
            RBX_STR = v102
        });
        if v106 ~= "" then
            return v106;
        else
            return v102;
        end;
    else
        local v107 = nil;
        if v19 then
            v107 = v101[v103];
            if not v107 then
                l_mutedError_0("Cannot find localization key for " .. tostring(v103));
                v107 = "InGame.ConnectionError.UnknownError";
            end;
        else
            v107 = string.gsub(tostring(v103), "Enum", "InGame");
        end;
        local v108 = nil;
        v108 = if v103 == Enum.ConnectionError.DisconnectIdle then v56(v107, {
            RBX_NUM = tostring(20)
        }) else v56(v107);
        if v108 ~= "" then
            return v108;
        elseif v18 then
            return (v56("InGame.ConnectionError.UnknownError"));
        else
            return v102;
        end;
    end;
end;
local function v116(v110, v111, v112) --[[ Line: 823 ]] --[[ Name: updateErrorPrompt ]]
    -- upvalues: v85 (copy), l_NONE_0 (ref), v61 (copy), v57 (ref), v79 (copy), v99 (copy), v56 (copy), v109 (copy), l_pcall_0 (copy), v31 (copy)
    local v113 = v85(v112, v111, l_NONE_0);
    if v113 ~= l_NONE_0 then
        if l_NONE_0 == v61.IS_RECONNECTING then
            v57:primaryShimmerStop();
        end;
        l_NONE_0 = v113;
        v79(v113);
    end;
    if v111 == Enum.ConnectionError.PlacelaunchCreatorBan then
        v110 = v99(v110);
    elseif v112 == Enum.ConnectionError.TeleportErrors and l_NONE_0 ~= v61.TELEPORT_FAILED then
        local _ = v110;
        if v111 == Enum.ConnectionError.OK then
            v110 = "";
        else
            local v115 = v56("InGame.ConnectionError.ReconnectFailed");
            v110 = if v115 ~= "" then v115 else "Reconnect was unsuccessful. Please try again.";
        end;
    else
        v110 = v109(v110, v111);
    end;
    if l_NONE_0 == v61.RECONNECT_DISABLED then
        v110 = l_pcall_0;
    end;
    if v57 then
        if v31() then
            v57:onErrorChanged(v110, v111, true);
            return;
        else
            v57:onErrorChanged(v110, v111);
        end;
    end;
end;
local function v120() --[[ Line: 854 ]] --[[ Name: onErrorMessageChanged ]]
    -- upvalues: l_GuiService_0 (copy), v116 (copy)
    local l_l_GuiService_0_ErrorMessage_0 = l_GuiService_0:GetErrorMessage();
    local l_l_GuiService_0_ErrorCode_0 = l_GuiService_0:GetErrorCode();
    local l_l_GuiService_0_ErrorType_0 = l_GuiService_0:GetErrorType();
    v116(l_l_GuiService_0_ErrorMessage_0, l_l_GuiService_0_ErrorCode_0, l_l_GuiService_0_ErrorType_0);
end;
local function v123() --[[ Line: 861 ]] --[[ Name: onScreenSizeChanged ]]
    -- upvalues: v57 (ref), l_RobloxGui_0 (copy), l_X_0 (ref), l_Y_0 (ref)
    if not v57 then
        return;
    else
        local l_X_1 = l_RobloxGui_0.AbsoluteSize.X;
        local l_Y_1 = l_RobloxGui_0.AbsoluteSize.Y;
        if l_X_0 ~= l_X_1 or l_Y_0 ~= l_Y_1 then
            l_X_0 = l_X_1;
            l_Y_0 = l_Y_1;
            v57:resizeWidthAndHeight(l_X_0, l_Y_0);
        end;
        return;
    end;
end;
l_RobloxGui_0:GetPropertyChangedSignal("AbsoluteSize"):connect(v123);
v116(l_GuiService_0:GetErrorMessage(), l_GuiService_0:GetErrorCode(), (l_GuiService_0:GetErrorType()));
l_GuiService_0.ErrorMessageChanged:connect(v120);
if v17 then
    local v124 = require(l_RobloxGui_0.Modules.ErrorTestSets);
    for v125, v126 in pairs(v124) do
        for _, v128 in pairs(v126) do
            v116("Should show localized strings, please file a jira ticket for missing translation.", v128, v125);
            wait(2);
            l_NONE_0 = v61.NONE;
        end;
    end;
end;
if l_game_EngineFeature_0 then
    l_GuiService_0.CoreGuiRenderOverflowed:Connect(function() --[[ Line: 897 ]]
        -- upvalues: l_CoreGui_0 (copy)
        for _, v130 in pairs(l_CoreGui_0:GetChildren()) do
            if v130:IsA("ScreenGui") and v130.Name ~= "RobloxPromptGui" then
                v130.Enabled = false;
            end;
        end;
    end);
end;
if v30 then
    coroutine.wrap(function() --[[ Line: 914 ]]
        -- upvalues: l_CorePackages_0 (copy)
        require(l_CorePackages_0.Workspace.Packages.GenericChallenges).Middleware.InitExperienceChallengeInterceptor();
    end)();
end;