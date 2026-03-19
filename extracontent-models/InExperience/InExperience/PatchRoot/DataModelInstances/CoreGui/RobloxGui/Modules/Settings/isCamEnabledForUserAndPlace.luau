local l_AvatarChatService_0 = game:GetService("AvatarChatService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local v5 = require(l_CorePackages_0.Packages.Cryo);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_IXPService_0 = game:GetService("IXPService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_GetFFlagAvatarChatServiceEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled;
local v10 = require(l_RobloxGui_0.Modules.Flags.getFFlagEnableAlwaysAvailableCamera);
local v11 = require(l_RobloxGui_0.Modules.Flags.getFFlagUseCameraDevicesListener);
local v12 = require(l_RobloxGui_0.Modules.Settings.cameraDevicesHelper);
local v13 = require(l_RobloxGui_0.Modules.Tracker.TrackerMenu);
local v14 = require(l_RobloxGui_0.Modules.Tracker.TrackerPromptType);
local v15 = game:DefineFastFlag("DisableCameraOnLowSpecDevices2", false);
local v16 = game:DefineFastString("DisableCameraOnLowSpecDevicesIXPLayer", "AvatarChat.DisableOnLowSpecAndroid");
local v17 = game:DefineFastString("DisableCameraOnLowSpecDevicesIXPField", "DisableOnAndroid");
local v18 = game:DefineFastFlag("OnlyShowToastOnce2", false);
local v19 = game:DefineFastFlag("DebugAlwaysShowDisableCameraToast", false);
local v20 = game:DefineFastFlag("OnlyShowToastOnceInLifetime2", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("DisableCameraToastShownStorageKey");
local function v24() --[[ Line: 29 ]] --[[ Name: ShouldCheckDeviceSpecs ]]
    -- upvalues: v15 (copy), l_IXPService_0 (copy), v16 (copy), v17 (copy)
    if v15 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 32 ]]
            -- upvalues: l_IXPService_0 (ref), v16 (ref)
            return l_IXPService_0:GetUserLayerVariables(v16);
        end);
        if not l_status_0 or not l_result_0 or l_result_0[v17] == nil then
            return false;
        else
            l_IXPService_0:LogUserLayerExposure(v16);
            return l_result_0[v17];
        end;
    else
        return false;
    end;
end;
return function() --[[ Line: 47 ]]
    -- upvalues: l_GetFFlagAvatarChatServiceEnabled_0 (copy), l_AvatarChatService_0 (copy), v15 (copy), v24 (copy), v20 (copy), l_game_EngineFeature_0 (copy), l_AppStorageService_0 (copy), v19 (copy), v13 (copy), v14 (copy), v18 (copy), l_MemStorageService_0 (copy), v10 (copy), v11 (copy), v12 (copy), l_VideoCaptureService_0 (copy), v5 (copy)
    if not l_GetFFlagAvatarChatServiceEnabled_0() or _G.__TESTEZ_RUNNING_TEST__ then
        return false;
    else
        local l_status_1, l_result_1 = pcall(l_AvatarChatService_0.GetClientFeaturesAsync, l_AvatarChatService_0);
        if not l_status_1 then
            warn("Unable to get Client Features from AvatarChatService");
            return false;
        else
            local v27 = l_AvatarChatService_0:IsEnabled(l_result_1, Enum.AvatarChatServiceFeature.PlaceVideo);
            local v28 = l_AvatarChatService_0:IsEnabled(l_result_1, Enum.AvatarChatServiceFeature.UserVideo);
            local v29 = l_AvatarChatService_0:IsEnabled(l_result_1, Enum.AvatarChatServiceFeature.UserVideoEligible);
            if v15 and v27 and v28 and v29 and not l_AvatarChatService_0:deviceMeetsRequirementsForFeature(Enum.DeviceFeatureType.DeviceCapture) and v24() then
                if v20 and l_game_EngineFeature_0 then
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 69 ]]
                        -- upvalues: l_AppStorageService_0 (ref)
                        return l_AppStorageService_0:GetItem("DisableCameraToastShown");
                    end);
                    if not l_status_2 or not (l_result_2 == "true") or v19 then
                        v13:showPrompt(v14.CameraUnavailable);
                        pcall(function() --[[ Line: 78 ]]
                            -- upvalues: l_AppStorageService_0 (ref)
                            l_AppStorageService_0:SetItem("DisableCameraToastShown", "true");
                            l_AppStorageService_0:Flush();
                        end);
                    end;
                elseif v18 then
                    if not (l_MemStorageService_0:GetItem("DisableCameraToastShown") == "true") or v19 then
                        v13:showPrompt(v14.CameraUnavailable);
                        l_MemStorageService_0:SetItem("DisableCameraToastShown", "true");
                    end;
                else
                    v13:showPrompt(v14.CameraUnavailable);
                end;
                return false;
            elseif v10() then
                local v32 = nil;
                v32 = if v11() then v12.GetDevices() else l_VideoCaptureService_0:GetCameraDevices();
                local v33 = not v5.isEmpty(v32);
                return v27 and v29 and v28 and v33;
            else
                return v27 and v29 and v28;
            end;
        end;
    end;
end;