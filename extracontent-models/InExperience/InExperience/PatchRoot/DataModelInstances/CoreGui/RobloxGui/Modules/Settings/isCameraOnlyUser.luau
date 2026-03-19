local l_AvatarChatService_0 = game:GetService("AvatarChatService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GetFFlagAvatarChatServiceEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled;
local v7 = require(l_RobloxGui_0.Modules.Flags.getFFlagUseCameraDevicesListener);
local v8 = require(l_RobloxGui_0.Modules.Settings.cameraDevicesHelper);
return function() --[[ Line: 14 ]]
    -- upvalues: l_GetFFlagAvatarChatServiceEnabled_0 (copy), l_AvatarChatService_0 (copy), v7 (copy), v8 (copy), l_VideoCaptureService_0 (copy), v4 (copy)
    if not l_GetFFlagAvatarChatServiceEnabled_0() then
        return false;
    else
        local l_status_0, l_result_0 = pcall(l_AvatarChatService_0.GetClientFeaturesAsync, l_AvatarChatService_0);
        if not l_status_0 then
            warn("Unable to get Client Features from AvatarChatService");
            return false;
        else
            local v11 = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.PlaceVideo);
            local v12 = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.UserVideo);
            local v13 = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.UserVideoEligible);
            local v14 = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.PlaceAudio);
            local v15 = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.UserAudio);
            local v16 = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.UserAudioEligible);
            local v17 = nil;
            v17 = if v7() then v8.GetDevices() else l_VideoCaptureService_0:GetCameraDevices();
            if v4.isEmpty(v17) then
                return false;
            else
                local v18 = v15 and v16;
                local v19 = v12 and v13;
                if not v11 then
                    return false;
                elseif v14 and v18 then
                    return false;
                elseif v19 then
                    return true;
                else
                    return false;
                end;
            end;
        end;
    end;
end;