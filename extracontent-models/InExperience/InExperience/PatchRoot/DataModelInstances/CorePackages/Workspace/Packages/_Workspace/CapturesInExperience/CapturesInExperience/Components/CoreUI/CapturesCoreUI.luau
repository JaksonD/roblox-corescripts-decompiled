local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.ReactUtils);
local l_CaptureService_0 = game:GetService("CaptureService");
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactUtils);
local v6 = require(l_Parent_0.Components.CoreUI.CaptureControlsView);
local v7 = require(l_Parent_0.Constants);
local v8 = require(l_Parent_0.Utils.makeVideoCaptureFailedHandler);
local v9 = require(l_Parent_0.Utils.makeVideoCaptureStartFailedHandler);
local v10 = require(l_Parent_0.Components.Common.ToastContainer);
local l_useCallback_0 = v4.useCallback;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useEventConnection_0 = v2.useEventConnection;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local v15 = require(l_Parent_0.Flags.FFlagEnableUpdatedCaptureControls);
return function(_) --[[ Line: 25 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v7 (copy), l_useCallback_0 (copy), v9 (copy), l_useEventConnection_0 (copy), l_CaptureService_0 (copy), v8 (copy), v4 (copy), v15 (copy), v6 (copy), v10 (copy)
    local v17 = l_useDispatch_0();
    local v19 = l_useSelector_0(function(v18) --[[ Line: 28 ]]
        -- upvalues: v7 (ref)
        return v18[v7.RoduxKey].Carousel.IsOpen;
    end);
    local v21 = l_useSelector_0(function(v20) --[[ Line: 32 ]]
        -- upvalues: v7 (ref)
        return v20[v7.RoduxKey].IsCapturesCoreGuiEnabled;
    end);
    local v22 = l_useCallback_0(v9(v17), {});
    l_useEventConnection_0(l_CaptureService_0.UserVideoCaptureStartFailed, v22);
    local v23 = l_useCallback_0(v8(v17), {});
    l_useEventConnection_0(l_CaptureService_0.UserVideoCaptureFailed, v23);
    return v4.createElement(v4.Fragment, {}, {
        CaptureControlsView = if v15 and v21 then v4.createElement(v6) else nil, 
        ToastsFrame = if not v19 then v4.createElement("Frame", {
            Active = false, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = v7.ZIndex.Toasts
        }, {
            ToastContainer = v4.createElement(v10)
        }) else nil
    });
end;