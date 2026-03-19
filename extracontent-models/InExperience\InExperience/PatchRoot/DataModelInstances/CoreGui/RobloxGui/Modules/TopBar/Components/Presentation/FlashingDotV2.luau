local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local v5 = require(l_CorePackages_0.Packages.Roact);
local _ = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.ReactUtils);
local v8 = require(l_CorePackages_0.Packages.t);
local l_EventConnection_0 = v7.EventConnection;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_default_0 = require(l_Modules_0.VoiceChat.VoiceChatServiceManager).default;
local v12 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatCoreScriptSupport();
local v13 = require(l_CoreGui_0.RobloxGui.Modules.Settings.cameraDevicePermissionGrantedSignal);
local v14 = require(l_CoreGui_0.RobloxGui.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
local v15 = v5.PureComponent:extend("FlashingDot");
local function _(v16, v17, v18) --[[ Line: 33 ]] --[[ Name: lerpNum ]]
    return v16 + (v17 - v16) * v18;
end;
v15.validateProps = v8.strictInterface({});
v15.init = function(v20) --[[ Line: 39 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), l_default_0 (copy), l_FaceAnimatorService_0 (copy), l_VideoCaptureService_0 (copy), v14 (copy), v12 (copy), v13 (copy)
    v20:setState({
        Visible = false, 
        isUsingMic = false
    });
    v20.prevTime = 1.5707963267948966;
    v20.prevSinTime = 1;
    local v21, v22 = v5.createBinding(0);
    v20.transparencyBinding = v21;
    v20.updateTransparencyBinding = v22;
    v20.checkNewVisibility = function() --[[ Line: 49 ]]
        -- upvalues: l_default_0 (ref), l_FaceAnimatorService_0 (ref), l_VideoCaptureService_0 (ref), v14 (ref), v20 (copy), v12 (ref)
        local v23 = false;
        if l_default_0.localMuted ~= nil then
            v23 = not l_default_0.localMuted;
        end;
        local v24 = l_FaceAnimatorService_0.VideoAnimationEnabled and l_VideoCaptureService_0.Active;
        if v14() then
            v24 = l_FaceAnimatorService_0:IsStarted() and l_FaceAnimatorService_0.VideoAnimationEnabled;
        end;
        local v25 = v23 or v24;
        local v26 = v20.state.Visible ~= v25;
        local v27 = v12 and v20.state.isUsingMic ~= v23;
        if v26 or v27 then
            v20:setState({
                Visible = v25, 
                isUsingMic = v23
            });
        end;
    end;
    v20.animationConnection = function(v28) --[[ Line: 72 ]]
        -- upvalues: v20 (copy)
        local v29 = v20.prevTime + v28;
        local v30 = math.sin(v29 * 3);
        local v31 = math.abs(v20.prevSinTime);
        v20.updateTransparencyBinding(v31 * -0.5 + 0.5);
        v20.prevTime = v29;
        v20.prevSinTime = v30;
    end;
    if v14() then
        v20.teardownCameraPermissionGrantedListener = function() --[[ Line: 83 ]]
            -- upvalues: v20 (copy)
            if v20.cameraPermissionGrantedListener then
                v20.cameraPermissionGrantedListener:disconnect();
                v20.cameraPermissionGrantedListener = nil;
            end;
        end;
        v20.cameraPermissionGrantedListener = v13:connect(function() --[[ Line: 91 ]]
            -- upvalues: v20 (copy)
            v20.checkNewVisibility();
        end);
    end;
end;
v15.didMount = function(v32) --[[ Line: 97 ]] --[[ Name: didMount ]]
    v32.checkNewVisibility();
end;
v15.willUnmount = function(v33) --[[ Line: 101 ]] --[[ Name: willUnmount ]]
    if v33.teardownCameraPermissionGrantedListener then
        v33.teardownCameraPermissionGrantedListener();
    end;
end;
v15.render = function(v34) --[[ Line: 107 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), l_FaceAnimatorService_0 (copy), l_VideoCaptureService_0 (copy), v14 (copy), v5 (copy), l_EventConnection_0 (copy), l_default_0 (copy), l_RunService_0 (copy)
    local v35 = nil;
    local v36 = UDim2.fromOffset(4, 4);
    if v12 then
        local v37 = l_FaceAnimatorService_0.VideoAnimationEnabled and l_VideoCaptureService_0.Active;
        if v14() then
            v37 = l_FaceAnimatorService_0:IsStarted() and l_FaceAnimatorService_0.VideoAnimationEnabled;
        end;
        if v34.state.isUsingMic then
            v35 = "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png";
        elseif v37 then
            v35 = "rbxasset://textures/SelfView/SelfView_icon_indicator_off.png";
            v36 = UDim2.fromOffset(12, 12);
        end;
    end;
    return v5.createElement("Frame", {
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, -4, 0, 3), 
        Size = UDim2.fromOffset(4, 4), 
        ZIndex = 2, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Visible = v34.state.Visible
    }, {
        FlashingDot = v5.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            AnchorPoint = if v12 then Vector2.new(0.5, 0.5) else nil, 
            Position = if v12 then UDim2.fromScale(0.5, 0.5) else nil, 
            Size = v36, 
            Image = if v12 then v35 else "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png", 
            ImageTransparency = v34.transparencyBinding, 
            LayoutOrder = 2
        }), 
        MuteChangedEvent = v5.createElement(l_EventConnection_0, {
            event = l_default_0.muteChanged.Event, 
            callback = v34.checkNewVisibility
        }), 
        CameraChangedEvent = v5.createElement(l_EventConnection_0, {
            event = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"), 
            callback = v34.checkNewVisibility
        }), 
        AnimationConnection = if v34.state.Visible then v5.createElement(l_EventConnection_0, {
            event = l_RunService_0.RenderStepped, 
            callback = v34.animationConnection
        }) else nil
    });
end;
return v15;