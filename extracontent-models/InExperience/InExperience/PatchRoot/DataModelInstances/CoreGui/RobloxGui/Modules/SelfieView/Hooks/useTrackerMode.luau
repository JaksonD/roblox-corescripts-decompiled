local l_Packages_0 = game:GetService("CorePackages").Packages;
local v1 = require(l_Packages_0.React);
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local v4 = require(script.Parent.Parent.Utils.FaceChatUtils);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v6 = require(l_RobloxGui_0.Modules.SelfView.Analytics).new();
local l_TrackerMode_0 = Enum.TrackerMode;
local v8 = v4.getTrackerMode();
local v9 = true;
if v8 ~= l_TrackerMode_0.Video then
    v9 = v8 == l_TrackerMode_0.AudioVideo;
end;
local v10 = true;
if v8 ~= l_TrackerMode_0.Audio then
    v10 = v8 == l_TrackerMode_0.AudioVideo;
end;
return function() --[[ Line: 23 ]]
    -- upvalues: v1 (copy), l_TrackerMode_0 (copy), v4 (copy), v9 (ref), v6 (copy), v10 (ref), l_VideoCaptureService_0 (copy), l_FaceAnimatorService_0 (copy)
    local v11, v12 = v1.useState(l_TrackerMode_0.None);
    local v16 = v1.useCallback(function() --[[ Line: 26 ]]
        -- upvalues: v4 (ref), l_TrackerMode_0 (ref), v9 (ref), v6 (ref), v10 (ref), v12 (copy)
        local v13 = v4.getTrackerMode();
        local v14 = true;
        if v13 ~= l_TrackerMode_0.Video then
            v14 = v13 == l_TrackerMode_0.AudioVideo;
        end;
        if v14 ~= v9 then
            v6:reportCamState(v14);
            v9 = v14;
        end;
        local v15 = true;
        if v13 ~= l_TrackerMode_0.Audio then
            v15 = v13 == l_TrackerMode_0.AudioVideo;
        end;
        if v15 ~= v10 then
            v6:reportMicState(v15);
            v10 = v15;
        end;
        v12(v13);
    end);
    v1.useEffect(function() --[[ Line: 45 ]]
        -- upvalues: l_VideoCaptureService_0 (ref), v16 (copy), l_FaceAnimatorService_0 (ref)
        if l_VideoCaptureService_0 then
            v16();
            local v17 = l_VideoCaptureService_0.Started:Connect(v16);
            local v18 = l_VideoCaptureService_0.Stopped:Connect(v16);
            local v19 = l_VideoCaptureService_0.DevicesChanged:Connect(v16);
            local v20 = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(v16);
            local v21 = l_FaceAnimatorService_0:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(v16);
            return function() --[[ Line: 55 ]]
                -- upvalues: v17 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy)
                v17:Disconnect();
                v18:Disconnect();
                v19:Disconnect();
                v20:Disconnect();
                v21:Disconnect();
            end;
        else
            return function() --[[ Line: 63 ]]

            end;
        end;
    end, {});
    return v11;
end;