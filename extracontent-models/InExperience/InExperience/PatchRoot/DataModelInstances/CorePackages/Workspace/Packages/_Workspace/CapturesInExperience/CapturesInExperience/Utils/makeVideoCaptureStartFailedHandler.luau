local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.CapturesToastType);
local v2 = require(l_Parent_0.Actions.ToastTriggered);
return function(v3) --[[ Line: 6 ]] --[[ Name: makeVideoCaptureStartFailedHandler ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v4) --[[ Line: 7 ]] --[[ Name: videoCaptureStartFailedHandler ]]
        -- upvalues: v3 (copy), v2 (ref), v1 (ref)
        if v4 == Enum.VideoCaptureStartedResult.CapturingAlready then
            v3(v2(v1.VideoCaptureInitializationCapturingAlreadyError));
            return;
        elseif v4 == Enum.VideoCaptureStartedResult.NoDeviceSupport then
            v3(v2(v1.VideoCaptureInitializationNoDeviceSupportError));
            return;
        elseif v4 == Enum.VideoCaptureStartedResult.NoSpaceOnDevice then
            v3(v2(v1.VideoCaptureInitializationNoSpaceOnDeviceError));
            return;
        else
            if v4 == Enum.VideoCaptureStartedResult.OtherError then
                v3(v2(v1.VideoCaptureInitializationOtherError));
            end;
            return;
        end;
    end;
end;