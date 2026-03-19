local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local v1 = nil;
l_VideoCaptureService_0.DevicesChanged:Connect(function() --[[ Line: 4 ]]
    -- upvalues: v1 (ref), l_VideoCaptureService_0 (copy)
    v1 = l_VideoCaptureService_0:GetCameraDevices();
end);
return {
    GetDevices = function() --[[ Line: 8 ]]
        -- upvalues: v1 (ref), l_VideoCaptureService_0 (copy)
        if not v1 then
            v1 = l_VideoCaptureService_0:GetCameraDevices();
        end;
        return v1;
    end
};