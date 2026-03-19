local l_AvatarChatService_0 = game:GetService("AvatarChatService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_RobloxGui_0.Modules.Settings.getCamMicPermissions);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local l_GetFFlagAvatarChatServiceEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled;
local v6 = game:DefineFastFlag("DisableCameraOnSelfieViewForLowspecDevices", false);
local function v7() --[[ Line: 14 ]]
    return true;
end;
if v6 then
    v7 = require(l_RobloxGui_0.Modules.Settings.isCamEnabledForUserAndPlace);
end;
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local v9 = nil;
local function v13() --[[ Line: 34 ]]
    -- upvalues: v9 (ref), l_GetFFlagAvatarChatServiceEnabled_0 (copy), l_AvatarChatService_0 (copy), v6 (copy), v7 (ref)
    if v9 ~= nil then
        return v9;
    elseif not l_GetFFlagAvatarChatServiceEnabled_0() or _G.__TESTEZ_RUNNING_TEST__ then
        return {
            placeCamEnabled = false, 
            placeMicEnabled = false, 
            userCamEnabled = false, 
            userCamEligible = false, 
            userMicEnabled = false, 
            userMicEligible = false
        };
    else
        local l_status_0, l_result_0 = pcall(l_AvatarChatService_0.GetClientFeaturesAsync, l_AvatarChatService_0);
        if not l_status_0 then
            warn("Unable to get Client Features from AvatarChatService");
            return {
                placeCamEnabled = false, 
                placeMicEnabled = false, 
                userCamEnabled = false, 
                userCamEligible = false, 
                userMicEnabled = false, 
                userMicEligible = false
            };
        else
            local v12 = {
                placeMicEnabled = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.PlaceAudio), 
                userMicEnabled = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.UserAudio), 
                userMicEligible = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.UserAudioEligible), 
                placeCamEnabled = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.PlaceVideo), 
                userCamEnabled = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.UserVideo), 
                userCamEligible = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.UserVideoEligible)
            };
            if v6 and v12.placeCamEnabled and v12.userCamEligible and v12.userCamEnabled and not v7() then
                v12.userCamEnabled = false;
            end;
            v9 = v12;
            return v12;
        end;
    end;
end;
local function v14() --[[ Line: 87 ]] --[[ Name: toggleVideoAnimation ]]
    -- upvalues: l_FaceAnimatorService_0 (copy), v6 (copy), v13 (copy), v2 (copy), l_default_0 (copy)
    v2(function() --[[ Line: 88 ]]
        -- upvalues: l_FaceAnimatorService_0 (ref), v6 (ref), v13 (ref)
        if not l_FaceAnimatorService_0 or not l_FaceAnimatorService_0:IsStarted() then
            return;
        else
            if not v6 or v13().userCamEnabled then
                l_FaceAnimatorService_0.VideoAnimationEnabled = not l_FaceAnimatorService_0.VideoAnimationEnabled;
            end;
            return;
        end;
    end, {
        l_default_0.Permissions.CAMERA_ACCESS
    });
end;
local function v15() --[[ Line: 101 ]] --[[ Name: getTrackerMode ]]
    -- upvalues: l_FaceAnimatorService_0 (copy)
    if l_FaceAnimatorService_0.AudioAnimationEnabled and not l_FaceAnimatorService_0.VideoAnimationEnabled then
        return Enum.TrackerMode.Audio;
    elseif not l_FaceAnimatorService_0.AudioAnimationEnabled and l_FaceAnimatorService_0.VideoAnimationEnabled and l_FaceAnimatorService_0:IsStarted() then
        return Enum.TrackerMode.Video;
    elseif l_FaceAnimatorService_0.AudioAnimationEnabled and l_FaceAnimatorService_0.VideoAnimationEnabled and l_FaceAnimatorService_0:IsStarted() then
        return Enum.TrackerMode.AudioVideo;
    else
        return Enum.TrackerMode.None;
    end;
end;
return {
    getPermissions = v13, 
    toggleVideoAnimation = v14, 
    getTrackerMode = v15, 
    isCameraOn = function() --[[ Line: 121 ]] --[[ Name: isCameraOn ]]
        -- upvalues: v15 (copy)
        local v16 = v15();
        local v17 = true;
        if v16 ~= Enum.TrackerMode.AudioVideo then
            v17 = v16 == Enum.TrackerMode.Video;
        end;
        return v17;
    end
};