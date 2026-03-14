local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(l_Parent_0.ReactUtils);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v7 = require(l_Parent_0.SharedFlags);
local l_EventConnection_0 = v5.EventConnection;
local v9 = require(l_script_FirstAncestor_0.Config);
local l_AvatarChatUISettings_0 = v9.AvatarChatUISettings;
local l_Permissions_0 = v9.Permissions;
local v12 = require(l_script_FirstAncestor_0.GlobalFlags);
local l_FFlagExpChatUseProximityStore_0 = v7.FFlagExpChatUseProximityStore;
local v14 = if l_FFlagExpChatUseProximityStore_0 then require(l_Parent_0.ReactIs) else nil;
local v15 = require(script.Parent.ControlBubble);
local v16 = require(l_script_FirstAncestor_0.Flags.GetFFlagExpChatEnableVoiceReverseNudge);
local l_GetFFlagExpChatUseVoiceParticipantsStore_0 = v7.GetFFlagExpChatUseVoiceParticipantsStore;
local v18 = game:DefineFastFlag("PreventMicToggleIfGameConsumedEvent", false);
local v19 = v3.PureComponent:extend("PlayerButtons");
v19.defaultProps = {
    LayoutOrder = 1
};
v19.init = function(v20) --[[ Line: 41 ]] --[[ Name: init ]]
    -- upvalues: l_FaceAnimatorService_0 (copy), v18 (copy), l_GetFFlagExpChatUseVoiceParticipantsStore_0 (copy), v12 (copy), l_Permissions_0 (copy)
    v20:setState({
        cameraEnabled = if l_FaceAnimatorService_0 then l_FaceAnimatorService_0:IsStarted() and l_FaceAnimatorService_0.VideoAnimationEnabled else false
    });
    v20.toggleMic = function(v21, v22) --[[ Line: 49 ]]
        -- upvalues: v18 (ref), v20 (copy), l_GetFFlagExpChatUseVoiceParticipantsStore_0 (ref)
        if v18 and v21 then
            return;
        else
            v20.props.onClickedVoiceIndicator(v20.props.userId, if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then v22 else v20.props.voiceState);
            return;
        end;
    end;
    v20.onVideoButtonPressed = function() --[[ Line: 61 ]]
        -- upvalues: v12 (ref), v20 (copy), l_Permissions_0 (ref)
        if v12.DoNotPromptCameraPermissionsOnMount and not v20.props.hasCameraPermissions then
            local function v25(v23, _) --[[ Line: 64 ]]
                -- upvalues: v20 (ref)
                if v23 then
                    v20:toggleVideo();
                    if v20.props.setCameraPermissionStateFromControl then
                        v20.props.setCameraPermissionStateFromControl(v23);
                        return;
                    end;
                elseif v20.props.displayCameraDeniedToast then
                    v20.props.displayCameraDeniedToast();
                end;
            end;
            if v20.props.getPermissions then
                v20.props.getPermissions(v25, l_Permissions_0.CAMERA_ACCESS);
                return;
            end;
        else
            v20:toggleVideo();
        end;
    end;
    v20.toggleVideo = function() --[[ Line: 86 ]]
        -- upvalues: v20 (copy)
        v20.props.onClickedCameraIndicator();
    end;
    v20.updateVideo = function() --[[ Line: 90 ]]
        -- upvalues: v20 (copy), l_FaceAnimatorService_0 (ref)
        v20:setState({
            cameraEnabled = l_FaceAnimatorService_0.VideoAnimationEnabled
        });
    end;
end;
v19.shouldShowCameraIndicator = function(v26) --[[ Line: 97 ]] --[[ Name: shouldShowCameraIndicator ]]
    return v26.props.isLocalPlayer and v26:getCameraButtonVisibleAtMount();
end;
v19.shouldShowMicOffIndicator = function(v27) --[[ Line: 101 ]] --[[ Name: shouldShowMicOffIndicator ]]
    -- upvalues: v12 (copy)
    if v27.props.isLocalPlayer then
        local v28 = true;
        if v27.props.voiceState ~= "Muted" then
            v28 = v27.props.voiceState == "LOCAL_MUTED";
        end;
        if v12.JoinWithoutMicPermissions then
            return v28;
        else
            return v28 or not v27.props.hasMicPermissions;
        end;
    else
        return false;
    end;
end;
v19.getCameraButtonVisibleAtMount = function(v29) --[[ Line: 114 ]] --[[ Name: getCameraButtonVisibleAtMount ]]
    -- upvalues: v12 (copy)
    if v12.EnableAlwaysAvailableCamera and v29.props.isCameraOnlyUser and v29.props.isCameraOnlyUser() then
        return false;
    elseif v29.props.isCamEnabledForUserAndPlace then
        return v29.props.isCamEnabledForUserAndPlace();
    else
        return false;
    end;
end;
v19.render = function(v30) --[[ Line: 130 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), l_GetFFlagExpChatUseVoiceParticipantsStore_0 (copy), l_AvatarChatUISettings_0 (copy), v3 (copy), l_FFlagExpChatUseProximityStore_0 (copy), v14 (copy), l_Dictionary_0 (copy), v15 (copy), l_FaceAnimatorService_0 (copy), l_EventConnection_0 (copy)
    local v31 = v30.props.hasMicPermissions or v30.props.voiceEnabled;
    if v12.JoinWithoutMicPermissions then
        v31 = v30.props.voiceEnabled;
    end;
    local v32 = v30:shouldShowCameraIndicator();
    local v33 = not l_GetFFlagExpChatUseVoiceParticipantsStore_0() and v30:shouldShowMicOffIndicator();
    local v34 = v32 and v31;
    local l_chatSettings_0 = v30.props.chatSettings;
    local v36 = v34 and l_AvatarChatUISettings_0.DoubleIconCornerRadiusOffset or l_AvatarChatUISettings_0.SingleIconCornerRadiusOffset;
    local v37 = v34 and l_AvatarChatUISettings_0.DoubleIconButtonSize or l_AvatarChatUISettings_0.SingleIconButtonSize;
    local v38 = v30.props.isLocalPlayer and "microphone" or "speaker";
    local v39 = v30.state.cameraEnabled and v30.props.hasCameraPermissions and "icons/controls/voice/video_on_light" or "icons/controls/voice/video_off_light";
    if v12.DoNotPromptCameraPermissionsOnMount then
        v39 = v30.state.cameraEnabled and v30:getCameraButtonVisibleAtMount() and "icons/controls/voice/video_on_light" or "icons/controls/voice/video_off_light";
    end;
    return v3.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 1), 
        Position = UDim2.new(0.5, 0, 1, -8), 
        AutomaticSize = Enum.AutomaticSize.X, 
        Size = UDim2.fromOffset(0, l_AvatarChatUISettings_0.FrameHeight), 
        LayoutOrder = v30.props.LayoutOrder, 
        BackgroundTransparency = l_chatSettings_0.BackgroundTransparency, 
        BackgroundColor3 = l_chatSettings_0.BackgroundColor3, 
        Visible = if l_FFlagExpChatUseProximityStore_0 and v14.isBinding(v30.props.Visible) then v30.props.Visible:map(function(v40) --[[ Line: 169 ]]
            -- upvalues: v31 (ref), v32 (copy)
            return v40 and v31 or v32;
        end) else v31 or v32
    }, {
        Scale = v3.createElement("UIScale", {
            Scale = not v30.props.isInsideMaximizeDistance and 0.75 or 1
        }), 
        UICorner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, v36)
        }), 
        Container = v3.createElement("ImageLabel", l_Dictionary_0.join({
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, l_chatSettings_0.ImageLabel), {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, v36)
            }), 
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            MicrophoneBubble = v31 and v3.createElement(v15, {
                LayoutOrder = 1, 
                onActivated = v30.toggleMic, 
                chatSettings = l_chatSettings_0, 
                controlBubbleSize = v37, 
                cornerRadiusOffset = v36, 
                iconAssetName = v33 and "icons/controls/voice/microphone_off_light" or nil, 
                iconSize = l_AvatarChatUISettings_0.IconSize, 
                iconTransparency = l_AvatarChatUISettings_0.IconTransparency, 
                voiceState = if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then nil else v30.props.voiceState, 
                iconStyle = v38, 
                isUserToxic = if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then nil else v30.props.isUserToxic, 
                userId = if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then v30.props.userId else nil
            }), 
            Divider = v31 and v32 and v3.createElement("Frame", {
                Size = l_AvatarChatUISettings_0.DividerSize, 
                AnchorPoint = Vector2.new(0.5, 1), 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                ZIndex = 1, 
                BackgroundColor3 = l_AvatarChatUISettings_0.DividerColor
            }), 
            CameraBubble = v32 and v3.createElement(v15, {
                LayoutOrder = 3, 
                onActivated = v12.DoNotPromptCameraPermissionsOnMount and v30.onVideoButtonPressed or v30.toggleVideo, 
                chatSettings = l_chatSettings_0, 
                cornerRadiusOffset = v36, 
                controlBubbleSize = v37, 
                iconAssetName = v39, 
                iconSize = l_AvatarChatUISettings_0.IconSize, 
                iconTransparency = l_AvatarChatUISettings_0.IconTransparency, 
                iconStyle = v38, 
                isUserToxic = if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then nil else v30.props.isUserToxic
            })
        }), 
        Carat = l_chatSettings_0.TailVisible and v3.createElement("ImageLabel", {
            LayoutOrder = 3, 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 1, -1), 
            Size = UDim2.fromOffset(12, 8), 
            Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
            ImageColor3 = l_chatSettings_0.BackgroundColor3, 
            ImageTransparency = l_chatSettings_0.BackgroundTransparency
        }, {
            CaratGradient = l_chatSettings_0.UIGradient and v3.createElement("UIGradient", l_chatSettings_0.UIGradient)
        }), 
        BubbleGradient = l_chatSettings_0.UIGradient and v3.createElement("UIGradient", l_chatSettings_0.UIGradient), 
        VideoEnabledChanged = l_FaceAnimatorService_0 and v3.createElement(l_EventConnection_0, {
            event = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"), 
            callback = v30.updateVideo
        }) or nil
    });
end;
local function v44(v41, v42) --[[ Line: 253 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v16 (copy)
    local v43 = false;
    if v16() and v41.ReverseNudgeToxicUsers then
        v43 = v41.ReverseNudgeToxicUsers[v42.userId];
        if v43 == nil then
            v43 = false;
        end;
    end;
    return {
        voiceState = v41.Voice.participants[v42.userId], 
        isUserToxic = v43
    };
end;
if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then
    return v19;
else
    return v4.connect(v44)(v19);
end;