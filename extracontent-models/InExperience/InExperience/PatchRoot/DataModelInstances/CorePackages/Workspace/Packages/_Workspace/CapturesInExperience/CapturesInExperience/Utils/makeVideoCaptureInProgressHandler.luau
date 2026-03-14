local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_default_0 = require(l_Parent_1.VoiceChatCore).CoreVoiceManager.default;
local l_default_1 = require(l_Parent_1.VoiceChat).GlobalVoiceManager.default;
local v4 = require(l_Parent_0.Analytics.EventNames);
local v5 = require(l_Parent_0.Actions.VideoCaptureStarted);
local v6 = require(l_Parent_0.Actions.VideoCaptureStopped);
local _ = require(l_Parent_0.Types);
local v8 = require(l_Parent_0.Enums.CaptureTriggerType);
local v9 = require(l_Parent_0.Constants);
local l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0 = require(l_Parent_1.SharedFlags).GetFFlagEnableVoiceChatMuteForVideoCaptures;
local l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 = require(l_Parent_1.SharedFlags).GetFFlagEnableCrossExperienceVoiceCaptureMute;
local function v13(v12) --[[ Line: 22 ]] --[[ Name: maybeMuteVoiceChat ]]
    -- upvalues: l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (copy), l_default_1 (copy), l_default_0 (copy), l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0 (copy)
    if game:GetEngineFeature("ReenableMomentsVoice") then
        return;
    else
        if l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() then
            if v12 then
                l_default_1:MuteAll("Capture");
            else
                l_default_1:UnmuteAll("Capture");
            end;
        end;
        if l_default_0:UserVoiceEnabled() and l_default_0:IsInitialized() then
            if not l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() then
                l_default_0:MuteAll(v12, "Capture");
            end;
            if l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0 then
                if v12 then
                    l_default_0:RequestHidePublicVoiceUI();
                    return;
                else
                    l_default_0:RequestShowPublicVoiceUI();
                end;
            end;
        end;
        return;
    end;
end;
return function(v14, _, v16) --[[ Line: 47 ]] --[[ Name: makeVideoCaptureInProgressHandler ]]
    -- upvalues: v9 (copy), v5 (copy), v8 (copy), v13 (copy), v4 (copy), v6 (copy)
    return function(v17, v18) --[[ Line: 52 ]] --[[ Name: videoCaptureInProgressHandler ]]
        -- upvalues: v14 (copy), v9 (ref), v5 (ref), v8 (ref), v13 (ref), v16 (copy), v4 (ref), v6 (ref)
        local l_status_0 = v14:getState()[v9.RoduxKey].IsVideoCaptureActive.status;
        if v17 and not l_status_0 then
            v14:dispatch(v5(v18));
            if v18 == v8.UserCapture or v18 == v8.DeveloperCapture then
                v13(true);
            end;
            if v18 == v8.DeveloperCapture then
                v16(v4.CapturesVideoCaptureDevApiStarted);
            end;
            v16(v4.CapturesVideoCaptureStarted, {
                triggerType = v18
            });
            return;
        else
            if not v17 and l_status_0 then
                v14:dispatch(v6(v18));
                if v18 == v8.UserCapture or v18 == v8.DeveloperCapture then
                    v13(false);
                end;
                if v18 == v8.DeveloperCapture then
                    v16(v4.CapturesVideoCaptureDevApiEnded);
                end;
                v16(v4.CapturesVideoCaptureStopped, {
                    triggerType = v18
                });
            end;
            return;
        end;
    end;
end;