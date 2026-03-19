local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.CapturesToastType);
local v2 = require(l_Parent_0.Actions.ToastTriggered);
return function(v3) --[[ Line: 6 ]] --[[ Name: makeVideoCaptureFailedHandler ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v4) --[[ Line: 7 ]] --[[ Name: videoCaptureFailedHandler ]]
        -- upvalues: v3 (copy), v2 (ref), v1 (ref)
        if v4 == Enum.VideoCaptureResult.OtherError then
            v3(v2(v1.VideoCaptureOtherError));
        end;
    end;
end;