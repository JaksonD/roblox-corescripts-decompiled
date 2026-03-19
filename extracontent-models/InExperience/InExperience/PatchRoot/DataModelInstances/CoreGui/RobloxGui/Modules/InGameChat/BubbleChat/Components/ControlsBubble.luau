local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_EventConnection_0 = require(l_CorePackages_0.Packages.ReactUtils).EventConnection;
local l_Images_0 = v8.App.ImageSet.Images;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v12 = require(script.Parent.ControlBubble);
local l_default_0 = require(l_Modules_0.VoiceChat.VoiceChatServiceManager).default;
local v14 = require(l_Modules_0.InGameChat.BubbleChat.Constants);
local v15 = require(l_Modules_0.SelfView.publicApi);
local v16 = require(l_Modules_0.SelfView.toggleSelfViewSignal);
local v17 = require(l_Modules_0.SelfView.Analytics).new();
local l_GetFFlagLocalMutedNilFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLocalMutedNilFix;
local v19 = require(l_Modules_0.VoiceChat.Constants);
local v20 = l_Images_0["icons/controls/video"];
local v21 = l_Images_0["icons/controls/videoOff"];
local v22 = l_Images_0["icons/controls/microphoneMute"];
local v23 = v5.PureComponent:extend("ControlsBubble");
v23.validateProps = v7.strictInterface({
    chatSettings = v7.table, 
    isInsideMaximizeDistance = v7.boolean, 
    isLocalPlayer = v7.boolean, 
    LayoutOrder = v7.optional(v7.number), 
    hasCameraPermissions = v7.boolean, 
    hasMicPermissions = v7.boolean, 
    isShowingDueToEasierUnmuting = v7.optional(v7.boolean)
});
v23.defaultProps = {
    LayoutOrder = 1
};
v23.init = function(v24) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: l_FaceAnimatorService_0 (copy), l_GetFFlagLocalMutedNilFix_0 (copy), l_default_0 (copy), v14 (copy), v17 (copy), v19 (copy), v15 (copy), v16 (copy), v5 (copy), l_HttpService_0 (copy), l_RunService_0 (copy)
    local v25 = if l_FaceAnimatorService_0 then l_FaceAnimatorService_0:IsStarted() and l_FaceAnimatorService_0.VideoAnimationEnabled else false;
    v24:setState({
        microphoneEnabled = if l_GetFFlagLocalMutedNilFix_0 then l_default_0.localMuted == false else not l_default_0.localMuted, 
        cameraEnabled = v25
    });
    v24.toggleMic = function() --[[ Line: 68 ]]
        -- upvalues: v24 (copy), v14 (ref), l_default_0 (ref), v17 (ref), v19 (ref)
        if v24.props.isLocalPlayer then
            if not v24.props.hasMicPermissions then
                return;
            elseif v24.props.voiceState == v14.VOICE_STATE.ERROR then
                l_default_0:RejoinPreviousChannel();
                return;
            elseif v24.props.voiceState == v14.VOICE_STATE.CONNECTING then
                l_default_0:ShowVoiceChatLoadingMessage();
                return;
            else
                v17:setLastCtx("bubbleChatToggle");
                l_default_0:ToggleMic("LegacyBubbleChatToggle");
                v24:setState({
                    microphoneEnabled = not l_default_0.localMuted
                });
                return;
            end;
        else
            l_default_0:ToggleMutePlayer(tonumber(v24.props.userId), if v24.props.isShowingDueToEasierUnmuting then v19.VOICE_CONTEXT_TYPE.EASIER_UNMUTING else v19.VOICE_CONTEXT_TYPE.BUBBLE_CHAT);
            return;
        end;
    end;
    v24.updateVideo = function() --[[ Line: 96 ]]
        -- upvalues: v24 (copy), l_FaceAnimatorService_0 (ref)
        v24:setState({
            cameraEnabled = l_FaceAnimatorService_0.VideoAnimationEnabled
        });
    end;
    v24.toggleVideo = function() --[[ Line: 103 ]]
        -- upvalues: v24 (copy), l_FaceAnimatorService_0 (ref), v17 (ref), v15 (ref), v16 (ref)
        if not v24.props.hasCameraPermissions then
            return;
        elseif not l_FaceAnimatorService_0 or not l_FaceAnimatorService_0:IsStarted() then
            return;
        else
            l_FaceAnimatorService_0.VideoAnimationEnabled = not l_FaceAnimatorService_0.VideoAnimationEnabled;
            v17:setLastCtx("bubbleChatToggle");
            v24:setState({
                cameraEnabled = l_FaceAnimatorService_0.VideoAnimationEnabled
            });
            local v26 = v15.getSelfViewIsOpenAndVisible();
            if l_FaceAnimatorService_0.VideoAnimationEnabled and not v26 then
                v16:fire();
            end;
            return;
        end;
    end;
    v24.muteChangedEvent = function(v27) --[[ Line: 126 ]]
        -- upvalues: v24 (copy)
        v24:setState({
            microphoneEnabled = not v27
        });
    end;
    local v28, v29 = v5.createBinding(0);
    v24.level = v28;
    v24.updateLevel = v29;
    v28, v29 = v5.createBinding(v24.props.voiceState);
    v24.voiceState = v28;
    v24.updateVoiceState = v29;
    v24.renderStepName = l_HttpService_0:GenerateGUID();
    l_RunService_0:BindToRenderStep(v24.renderStepName, Enum.RenderPriority.First.Value + 1, function() --[[ Line: 137 ]]
        -- upvalues: v24 (copy)
        v24.updateLevel(math.random());
    end);
    v24.levelIcon = v5.joinBindings({
        v24.voiceState, 
        v24.level
    }):map(function(v30) --[[ Line: 141 ]]
        -- upvalues: v24 (copy), v14 (ref), l_default_0 (ref)
        local v31 = v30[1];
        local v32 = v30[2];
        local v33 = game:GetEngineFeature("VoiceChatNewSpeakerIcons") and "SpeakerNew" or "SpeakerDark";
        local v34 = v24.props.isLocalPlayer and "New" or v33;
        if v31 == v14.VOICE_STATE.MUTED or v31 == v14.VOICE_STATE.LOCAL_MUTED then
            if v24.props.isLocalPlayer then
                return "";
            else
                return l_default_0:GetIcon("Muted", v34);
            end;
        elseif v31 == v14.VOICE_STATE.CONNECTING then
            return l_default_0:GetIcon("Connecting", v34);
        elseif v31 == v14.VOICE_STATE.INACTIVE then
            return l_default_0:GetIcon("Unmuted0", v34);
        elseif v31 == v14.VOICE_STATE.TALKING then
            local v35 = math.floor(v32 * 5 + 0.5) * 20;
            return l_default_0:GetIcon("Unmuted" .. tostring(v35), v34);
        else
            return l_default_0:GetIcon("Error", v34);
        end;
    end);
end;
v23.shouldShowCameraIndicator = function(v36) --[[ Line: 175 ]] --[[ Name: shouldShowCameraIndicator ]]
    if v36.props.isLocalPlayer and v36.props.hasCameraPermissions then
        return true;
    else
        return false;
    end;
end;
v23.getMicIcon = function(v37) --[[ Line: 183 ]] --[[ Name: getMicIcon ]]
    -- upvalues: v14 (copy), v22 (copy)
    if not v37.props.isLocalPlayer then
        return v37.levelIcon, false;
    else
        local v38 = not v37.props.hasMicPermissions;
        local v39 = true;
        if v37.props.voiceState ~= v14.VOICE_STATE.MUTED then
            v39 = v37.props.voiceState == v14.VOICE_STATE.LOCAL_MUTED;
        end;
        if v38 or v39 then
            return v22, true;
        else
            return v37.levelIcon, false;
        end;
    end;
end;
v23.didUpdate = function(v40, v41, _) --[[ Line: 200 ]] --[[ Name: didUpdate ]]
    if v40.props.voiceState ~= v41.voiceState then
        v40.updateVoiceState(v40.props.voiceState);
    end;
end;
v23.didMount = function(v43) --[[ Line: 206 ]] --[[ Name: didMount ]]
    v43.updateVoiceState(v43.props.voiceState);
end;
v23.render = function(v44) --[[ Line: 210 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v12 (copy), v20 (copy), v21 (copy), l_EventConnection_0 (copy), l_default_0 (copy), l_FaceAnimatorService_0 (copy)
    local v45 = v44.props.hasMicPermissions and v44.props.voiceEnabled;
    local v46 = v44:shouldShowCameraIndicator();
    local v47, v48 = v44:getMicIcon();
    local l_chatSettings_0 = v44.props.chatSettings;
    return v5.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 1), 
        AutomaticSize = Enum.AutomaticSize.X, 
        Position = UDim2.new(0.5, 0, 1, -8), 
        Size = UDim2.new(0, 0, 0, 25), 
        LayoutOrder = v44.props.LayoutOrder, 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
        Visible = v45 or v46
    }, {
        Scale = v5.createElement("UIScale", {
            Scale = not v44.props.isInsideMaximizeDistance and 0.75 or 1
        }), 
        UICorner = v5.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Container = v5.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 0, 
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }, {
            UICorner = l_chatSettings_0.CornerEnabled and v5.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 2)
            }), 
            UIPadding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 2), 
                PaddingRight = UDim.new(0, 2), 
                PaddingBottom = UDim.new(0, 2), 
                PaddingLeft = UDim.new(0, 2)
            }), 
            MicrophoneBubble = v45 and v5.createElement(v12, {
                LayoutOrder = 1, 
                icon = v47, 
                onActivated = v44.toggleMic, 
                enabled = v44.props.hasMicPermissions, 
                isImageSet = v48, 
                chatSettings = l_chatSettings_0, 
                iconSize = if v44.props.isLocalPlayer then UDim2.fromOffset(14, 18) else UDim2.fromOffset(23, 21)
            }), 
            CameraBubble = v46 and v5.createElement(v12, {
                LayoutOrder = 2, 
                icon = if v44.state.cameraEnabled and v44.props.hasCameraPermissions then v20 else v21, 
                onActivated = v44.toggleVideo, 
                enabled = v44.props.hasCameraPermissions, 
                isImageSet = true, 
                imageSetIcon = if v44.state.cameraEnabled and v44.props.hasCameraPermissions then v20 else v21, 
                chatSettings = l_chatSettings_0
            })
        }), 
        Carat = l_chatSettings_0.TailVisible and v5.createElement("ImageLabel", {
            LayoutOrder = 3, 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 1, -1), 
            Size = UDim2.fromOffset(12, 8), 
            Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }), 
        MuteChangedEvent = v5.createElement(l_EventConnection_0, {
            event = l_default_0.muteChanged.Event, 
            callback = v44.muteChangedEvent
        }), 
        VideoEnabledChanged = l_FaceAnimatorService_0 and v5.createElement(l_EventConnection_0, {
            event = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"), 
            callback = v44.updateVideo
        }) or nil
    });
end;
v23.willUnmount = function(v50) --[[ Line: 296 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_RunService_0 (copy)
    local l_status_0, _ = pcall(function() --[[ Line: 297 ]]
        -- upvalues: l_RunService_0 (ref), v50 (copy)
        l_RunService_0:UnbindFromRenderStep(v50.renderStepName);
    end);
    task.spawn(function() --[[ Line: 302 ]]
        -- upvalues: l_status_0 (copy)
        assert(l_status_0 == true, "Tried to UnbindFromRenderStep with a self.renderStepName that was never bound");
    end);
end;
return v6.connect(function(v53, v54) --[[ Line: 307 ]] --[[ Name: mapStateToProps ]]
    return {
        voiceState = v53.voiceState[v54.userId]
    };
end)(v23);