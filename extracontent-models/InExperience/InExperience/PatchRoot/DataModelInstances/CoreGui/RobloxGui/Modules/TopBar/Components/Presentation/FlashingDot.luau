local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.ReactUtils);
local _ = require(l_CorePackages_0.Packages.UIBlox);
local v8 = require(l_CorePackages_0.Packages.t);
local l_EventConnection_0 = v6.EventConnection;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_default_0 = require(l_Modules_0.VoiceChat.VoiceChatServiceManager).default;
local v12 = require(l_Modules_0.Settings.getCamMicPermissions);
local v13 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatCoreScriptSupport();
local v14 = v5.PureComponent:extend("FlashingDot");
local function _(v15, v16, v17) --[[ Line: 30 ]] --[[ Name: lerpNum ]]
    return v15 + (v16 - v15) * v17;
end;
v14.validateProps = v8.strictInterface({});
v14.init = function(v19) --[[ Line: 36 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), l_default_0 (copy), l_FaceAnimatorService_0 (copy), l_VideoCaptureService_0 (copy), v13 (copy)
    v19:setState({
        Visible = false, 
        isUsingMic = false, 
        hasMicPermissions = false, 
        hasCameraPermissions = false
    });
    v19.prevTime = 1.5707963267948966;
    v19.prevSinTime = 1;
    local v20, v21 = v5.createBinding(0);
    v19.transparencyBinding = v20;
    v19.updateTransparencyBinding = v21;
    v19.checkNewVisibility = function() --[[ Line: 48 ]]
        -- upvalues: v19 (copy), l_default_0 (ref), l_FaceAnimatorService_0 (ref), l_VideoCaptureService_0 (ref), v13 (ref)
        local v22 = v19.state.hasMicPermissions and l_default_0.localMuted ~= nil and not l_default_0.localMuted;
        local v23 = v19.state.hasCameraPermissions and l_FaceAnimatorService_0.VideoAnimationEnabled and l_VideoCaptureService_0.Active;
        local v24 = v22 or v23;
        local v25 = v19.state.Visible ~= v24;
        local v26 = v13 and v19.state.isUsingMic ~= v22;
        if v25 or v26 then
            v19:setState({
                Visible = v24, 
                isUsingMic = v22
            });
        end;
    end;
    v19.animationConnection = function(v27) --[[ Line: 71 ]]
        -- upvalues: v19 (copy)
        local v28 = v19.prevTime + v27;
        local v29 = math.sin(v28 * 3);
        local v30 = math.abs(v19.prevSinTime);
        v19.updateTransparencyBinding(v30 * -0.5 + 0.5);
        v19.prevTime = v28;
        v19.prevSinTime = v29;
    end;
end;
v14.didMount = function(v31) --[[ Line: 82 ]] --[[ Name: didMount ]]
    -- upvalues: v12 (copy)
    v31.isMounted = true;
    v12(function(v32) --[[ Line: 84 ]]
        -- upvalues: v31 (copy)
        if not v31.isMounted then
            return;
        else
            v31:setState({
                hasCameraPermissions = v32.hasCameraPermissions, 
                hasMicPermissions = v32.hasMicPermissions
            });
            return;
        end;
    end, nil, nil, "FlashingDot.didMount");
    v31.checkNewVisibility();
end;
v14.didUpdate = function(v33, v34, _) --[[ Line: 98 ]] --[[ Name: didUpdate ]]
    if v33.state.hasMicPermissions ~= v34.hasMicPermissions or v33.state.hasCameraPermissions ~= v34.hasCameraPermissions then
        v33.checkNewVisibility();
    end;
end;
v14.render = function(v36) --[[ Line: 107 ]] --[[ Name: render ]]
    -- upvalues: v13 (copy), l_FaceAnimatorService_0 (copy), l_VideoCaptureService_0 (copy), v5 (copy), l_EventConnection_0 (copy), l_default_0 (copy), l_RunService_0 (copy)
    local v37 = nil;
    local v38 = UDim2.fromOffset(4, 4);
    if v13 then
        local v39 = v36.state.hasCameraPermissions and l_FaceAnimatorService_0.VideoAnimationEnabled and l_VideoCaptureService_0.Active;
        if v36.state.isUsingMic then
            v37 = "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png";
        elseif v39 then
            v37 = "rbxasset://textures/SelfView/SelfView_icon_indicator_off.png";
            v38 = UDim2.fromOffset(12, 12);
        end;
    end;
    return v5.createElement("Frame", {
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, -4, 0, 3), 
        Size = UDim2.fromOffset(4, 4), 
        ZIndex = 2, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Visible = v36.state.Visible
    }, {
        FlashingDot = v5.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            AnchorPoint = if v13 then Vector2.new(0.5, 0.5) else nil, 
            Position = if v13 then UDim2.fromScale(0.5, 0.5) else nil, 
            Size = v38, 
            Image = if v13 then v37 else "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png", 
            ImageTransparency = v36.transparencyBinding, 
            LayoutOrder = 2
        }), 
        MuteChangedEvent = v5.createElement(l_EventConnection_0, {
            event = l_default_0.muteChanged.Event, 
            callback = v36.checkNewVisibility
        }), 
        CameraChangedEvent = v5.createElement(l_EventConnection_0, {
            event = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"), 
            callback = v36.checkNewVisibility
        }), 
        AnimationConnection = if v36.state.Visible then v5.createElement(l_EventConnection_0, {
            event = l_RunService_0.RenderStepped, 
            callback = v36.animationConnection
        }) else nil
    });
end;
v14.willUnmount = function(v40) --[[ Line: 157 ]] --[[ Name: willUnmount ]]
    v40.isMounted = false;
end;
return v14;