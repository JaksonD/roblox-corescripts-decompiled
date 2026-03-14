local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_VRService_0 = game:GetService("VRService");
local v7 = require(script.Parent.Parent.Logger)(script.Name);
local v8 = require(l_CorePackages_0.Packages.Roact);
local v9 = require(l_CorePackages_0.Packages.RoactRodux);
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_CorePackages_0.Packages.Otter);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v13 = require(l_RobloxGui_0.Modules.Settings.getCamMicPermissions);
local v14 = require(script.Parent.BubbleChatList);
local v15 = require(script.Parent.ChatBubbleDistant);
local v16 = require(script.Parent.VoiceBubble);
local v17 = require(script.Parent.ControlsBubble);
local v18 = require(l_RobloxGui_0.Modules.VoiceChat.Components.VoiceIndicator);
local v19 = require(script.Parent.Parent.Types);
local v20 = require(script.Parent.Parent.Constants);
local v21 = require(script.Parent.Parent.Helpers.getSettingsForMessage);
local v22 = require(l_RobloxGui_0.Modules.SelfView.selfViewVisibilityUpdatedSignal);
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
local v24 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local l_default_1 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v26 = require(l_RobloxGui_0.Modules.Flags.GetFFlagMicConnectingToast);
local v27 = require(l_RobloxGui_0.Modules.Flags.GetFFlagBubbleChatInexistantAdorneeFix);
local v28 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatCoreScriptSupport();
local v29 = require(l_RobloxGui_0.Modules.Flags.FFlagEnableAvatarChatToggleUIUpgradeForLegacyChatService);
local v30 = require(l_RobloxGui_0.Modules.SelfView.publicApi);
local v31 = game:DefineFastInt("BubbleVoiceTimeoutMillis", 1000);
local v32 = game:DefineFastFlag("DebugAllowControlButtonsNoVoiceChat", false);
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local v34 = game:DefineFastFlag("EasierUnmuting3", false);
local v35 = game:DefineFastFlag("EasierUnmutingBasedOnCamera", false);
local v36 = game:DefineFastFlag("EasierUnmutingHideIfMuted", false);
local v37 = game:DefineFastInt("EasierUnmutingDisplayDistance", 20);
local v38 = game:DefineFastString("EasierUnmutingIXPLayerName", "Voice.UserAgency");
local v39 = game:DefineFastString("EasierUnmutingIXPLayerValue", "VoiceUserAgencyEnabled");
local v40 = require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
local v41 = v8.PureComponent:extend("BubbleChatBillboard");
local v42 = {
    dampingRatio = 1, 
    frequency = 4
};
local v43 = nil;
if v29 then
    v43 = require(script.Parent.ControlsBubbleV2);
end;
v41.validateProps = v10.strictInterface({
    userId = v10.string, 
    onFadeOut = v10.optional(v10.callback), 
    voiceEnabled = v10.optional(v10.boolean), 
    bubbleChatEnabled = v10.optional(v10.boolean), 
    chatSettings = v19.IChatSettings, 
    messageIds = v10.optional(v10.array(v10.string)), 
    lastMessage = v10.optional(v19.IMessage), 
    voiceState = v10.optional(v10.string)
});
getEasierUnmutingDistance = function(v44) --[[ Line: 84 ]] --[[ Name: getEasierUnmutingDistance ]]
    -- upvalues: l_Players_0 (copy), v35 (copy)
    if not v44 then
        return nil;
    else
        local v45 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Character and l_Players_0.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
        local v46 = v45 and v45.CFrame and v45.CFrame.Position;
        local v47 = workspace.CurrentCamera and workspace.CurrentCamera.CFrame.Position;
        if v35 or not v46 then
            if not v47 then
                return nil;
            else
                return (v44 - v47).Magnitude;
            end;
        else
            return (v44 - v46).Magnitude;
        end;
    end;
end;
v41.init = function(v48) --[[ Line: 110 ]] --[[ Name: init ]]
    -- upvalues: v30 (copy), v28 (copy), l_StarterGui_0 (copy), v34 (copy), v36 (copy), v8 (copy), v11 (copy), l_Players_0 (copy), v20 (copy), l_default_1 (copy), v26 (copy), v24 (copy), v18 (copy), v22 (copy), l_IXPServiceWrapper_0 (copy), v38 (copy), v39 (copy)
    local v49 = v30.getSelfViewIsOpenAndVisible();
    local v50 = if v28 then l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.All) or l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView) else nil;
    v48:setState({
        adornee = nil, 
        isInsideRenderDistance = false, 
        isInsideMaximizeDistance = false, 
        savedChatSettings = v48.props.chatSettings, 
        voiceTimedOut = false, 
        voiceStateCounter = 0, 
        lastVoiceState = nil, 
        selfViewOpen = v49, 
        selfViewEnabled = v50, 
        isInsideEasierUnmutingDistance = not v34 and nil, 
        isMuted = (not v34 or not v36) and nil, 
        isInEasierUnmutingTreatment = not v34 and nil, 
        haveLoggedUserExposure = not v34 and nil
    });
    v48.isMounted = false;
    local v51, v52 = v8.createBinding((Vector3.new()));
    v48.offset = v51;
    v48.updateOffset = v52;
    v48.offsetMotor = v11.createSingleMotor(0);
    v48.offsetMotor:onStep(function(v53) --[[ Line: 137 ]]
        -- upvalues: v48 (copy)
        v48.updateOffset((Vector3.new(0, v53, 0)));
    end);
    v48.offsetGoal = 0;
    v48.onSelfViewVisibilityUpdated = function() --[[ Line: 142 ]]
        -- upvalues: v48 (copy), v30 (ref)
        v48:setState({
            selfViewOpen = v30.getSelfViewIsOpenAndVisible()
        });
    end;
    v48.onLastBubbleFadeOut = function() --[[ Line: 148 ]]
        -- upvalues: v48 (copy)
        if v48.props.onFadeOut and not v48.isFadingOut then
            v48.isFadingOut = true;
            v48.props.onFadeOut(v48.props.userId);
        end;
        if v48.state.hasMessage and v48.isMounted then
            v48:setState({
                hasMessage = false
            });
        end;
    end;
    if v48.props.voiceEnabled then
        v51 = nil;
        v51 = v48.props.userId == tostring(l_Players_0.LocalPlayer.UserId) and function() --[[ Line: 164 ]]
            -- upvalues: v48 (copy), v20 (ref), l_default_1 (ref), v26 (ref)
            if v48.props.voiceState == v20.VOICE_STATE.ERROR then
                l_default_1:RejoinPreviousChannel();
                return;
            elseif v26() and v48.props.voiceState == v20.VOICE_STATE.CONNECTING then
                l_default_1:ShowVoiceChatLoadingMessage();
                return;
            else
                l_default_1:ToggleMic("LegacyBubbleChat");
                return;
            end;
        end or function() --[[ Line: 174 ]]
            -- upvalues: l_default_1 (ref), v48 (copy), v24 (ref)
            l_default_1:ToggleMutePlayer(tonumber(v48.props.userId), if v48:isShowingDueToEasierUnmuting() then v24.VOICE_CONTEXT_TYPE.EASIER_UNMUTING else v24.VOICE_CONTEXT_TYPE.BUBBLE_CHAT);
        end;
        v52 = v48.props.userId;
        local v54 = v52 ~= tostring(l_Players_0.LocalPlayer.UserId) and "SpeakerDark" or "MicDark";
        local l_v52_0 = v52 --[[ copy: 4 -> 6 ]];
        do
            local l_v51_0 = v51;
            v48.renderInsert = function() --[[ Line: 188 ]]
                -- upvalues: v8 (ref), v18 (ref), l_v51_0 (ref), l_v52_0 (copy), v54 (copy)
                return v8.createElement(v18, {
                    onClicked = l_v51_0, 
                    userId = l_v52_0, 
                    iconStyle = v54
                });
            end;
            v48.insertSize = Vector2.new(28, 28);
        end;
    end;
    v48.onCoreGuiChanged = function() --[[ Line: 199 ]]
        -- upvalues: l_StarterGui_0 (ref), v48 (copy)
        local l_l_StarterGui_0_CoreGuiEnabled_0 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView);
        if v48.state.selfViewOpen ~= l_l_StarterGui_0_CoreGuiEnabled_0 then
            v48:setState({
                selfViewOpen = l_l_StarterGui_0_CoreGuiEnabled_0
            });
        end;
    end;
    v48.selfViewVisibilityUpdatedSignal = v22:connect(function() --[[ Line: 208 ]]
        -- upvalues: v48 (copy), v30 (ref)
        v48:setState({
            selfViewOpen = v30.getSelfViewIsOpenAndVisible()
        });
    end);
    if v34 then
        v51, v52 = pcall(function() --[[ Line: 215 ]]
            -- upvalues: l_IXPServiceWrapper_0 (ref), v38 (ref)
            return l_IXPServiceWrapper_0:GetLayerData(v38);
        end);
        if v51 and v52 and v52[v39] then
            v48:setState({
                isInEasierUnmutingTreatment = true
            });
        end;
    end;
    if v34 and v48.state.isInEasierUnmutingTreatment and v36 then
        v48.participantsUpdateConnection = l_default_1.participantsUpdate.Event:Connect(function(v58) --[[ Line: 232 ]]
            -- upvalues: v48 (copy)
            local v59 = v58[v48.props.userId];
            if not v59 then
                return;
            else
                if v59.isMuted ~= v48.state.isMuted then
                    v48:setState({
                        isMuted = v59.isMuted
                    });
                end;
                return;
            end;
        end);
    end;
end;
v41.isShowingDueToEasierUnmuting = function(v60) --[[ Line: 249 ]] --[[ Name: isShowingDueToEasierUnmuting ]]
    -- upvalues: v34 (copy), v20 (copy), v36 (copy)
    return v34 and v60.state.isInEasierUnmutingTreatment and v60.props.voiceState == v20.VOICE_STATE.LOCAL_MUTED and v60.state.isInsideEasierUnmutingDistance and not (v36 and v60.state.isMuted);
end;
v41.checkCounterForTimeout = function(v61, v62) --[[ Line: 257 ]] --[[ Name: checkCounterForTimeout ]]
    -- upvalues: l_Players_0 (copy), v20 (copy), v31 (copy)
    if v61.props.userId ~= tostring(l_Players_0.LocalPlayer.UserId) and v61.state.lastVoiceState ~= v20.VOICE_STATE.TALKING and v61.state.voiceStateCounter ~= v62 then
        local l_voiceStateCounter_0 = v61.state.voiceStateCounter;
        delay(v31 / 1000, function() --[[ Line: 266 ]]
            -- upvalues: v61 (copy), l_voiceStateCounter_0 (copy)
            if v61.state.voiceStateCounter == l_voiceStateCounter_0 and v61.isMounted then
                v61:setState({
                    voiceTimedOut = true
                });
            end;
        end);
    end;
end;
v41.checkCounterForTimeoutWithEasierUnmuting = function(v64, v65) --[[ Line: 277 ]] --[[ Name: checkCounterForTimeoutWithEasierUnmuting ]]
    -- upvalues: v34 (copy), l_Players_0 (copy), v20 (copy), v31 (copy)
    local v66 = if v65 then v65.voiceStateCounter else nil;
    if not v34 or not v64.state.isInEasierUnmutingTreatment then
        return v64:checkCounterForTimeout(v66);
    else
        local v67 = v64.props.userId ~= tostring(l_Players_0.LocalPlayer.UserId);
        local v68 = v64.state.voiceStateCounter ~= v66;
        local v69 = false;
        if v64.state.lastVoiceState ~= v20.VOICE_STATE.TALKING then
            v69 = v64.state.lastVoiceState ~= v20.VOICE_STATE.LOCAL_MUTED;
        end;
        if v67 and v68 and v69 then
            local l_voiceStateCounter_1 = v64.state.voiceStateCounter;
            delay(v31 / 1000, function() --[[ Line: 295 ]]
                -- upvalues: v64 (copy), l_voiceStateCounter_1 (copy)
                if v64.state.voiceStateCounter == l_voiceStateCounter_1 and v64.isMounted then
                    v64:setState({
                        voiceTimedOut = true
                    });
                end;
            end);
        end;
        return;
    end;
end;
v41.didMount = function(v71) --[[ Line: 308 ]] --[[ Name: didMount ]]
    -- upvalues: v11 (copy), v28 (copy), v40 (copy), l_Players_0 (copy), l_RunService_0 (copy), v34 (copy), v37 (copy), v20 (copy), v42 (copy)
    v71.isMounted = true;
    local v72 = v71.props.lastMessage and v71.props.lastMessage.adornee;
    v71:setState({
        adornee = v72
    });
    local v73 = v71:getVerticalOffset(v72);
    v71.offsetGoal = v73;
    v71.offsetMotor:setGoal(v11.instant(v73));
    if v28 then
        if v40() then
            v71:getMicPermission();
            v71:getCameraPermissionWithoutRequest();
        else
            v71:getPermissions();
        end;
    end;
    local v74 = nil;
    if v72 then
        v74 = l_Players_0:GetPlayerFromCharacter(v72);
    elseif tonumber(v71.props.userId) then
        v74 = l_Players_0:GetPlayerByUserId(v71.props.userId);
    end;
    if v74 then
        if v74.Character then
            coroutine.wrap(function() --[[ Line: 338 ]]
                -- upvalues: v71 (copy), v74 (ref)
                v71:onCharacterAdded(v74, v74.Character);
            end)();
        end;
        v71.characterConn = v74.CharacterAdded:Connect(function(v75) --[[ Line: 342 ]]
            -- upvalues: v71 (copy), v74 (ref)
            v71:onCharacterAdded(v74, v75);
        end);
    end;
    v71.heartbeatConn = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 348 ]]
        -- upvalues: v71 (copy), v34 (ref), v37 (ref), v20 (ref), v11 (ref), v42 (ref)
        local v76 = v71:getAdorneeInstance(v71.state.adornee);
        if workspace.CurrentCamera and v76 then
            local v77 = v76:IsA("Attachment") and v76.WorldPosition or v76.Position;
            local l_Magnitude_0 = (workspace.CurrentCamera.CFrame.Position - v77).Magnitude;
            local v79 = l_Magnitude_0 < v71.state.savedChatSettings.MaxDistance;
            local v80 = l_Magnitude_0 < v71.state.savedChatSettings.MinimizeDistance;
            local v81 = false;
            if v34 and v71.state.isInEasierUnmutingTreatment then
                local v82 = getEasierUnmutingDistance(v77);
                if v82 ~= nil then
                    v81 = v82 < v37;
                end;
            end;
            if v80 ~= v71.state.isInsideMaximizeDistance or v79 ~= v71.state.isInsideRenderDistance or v34 and v71.state.isInEasierUnmutingTreatment and v81 ~= v71.state.isInsideEasierUnmutingDistance then
                v71:setState({
                    isInsideRenderDistance = v79, 
                    isInsideMaximizeDistance = v80, 
                    isInsideEasierUnmutingDistance = v81
                });
            end;
        end;
        local v83 = v71:getVerticalOffset(v71.state.adornee);
        if math.abs(v83 - v71.offsetGoal) > v20.BILLBOARD_OFFSET_EPSILON then
            v71.offsetGoal = v83;
            v71.offsetMotor:setGoal(v11.spring(v83, v42));
        end;
    end);
    if v34 and v71.state.isInEasierUnmutingTreatment then
        v71:checkCounterForTimeoutWithEasierUnmuting(nil);
    else
        v71:checkCounterForTimeout(nil);
    end;
end;
v41.willUnmount = function(v84) --[[ Line: 393 ]] --[[ Name: willUnmount ]]
    -- upvalues: v7 (copy), v34 (copy), v36 (copy)
    v7:trace("Unmounting billboards for {}", v84.state.shortId);
    v84.isMounted = false;
    if v84.characterConn then
        v84.characterConn:Disconnect();
        v84.characterConn = nil;
    end;
    if v84.heartbeatConn then
        v84.heartbeatConn:Disconnect();
        v84.heartbeatConn = nil;
    end;
    if v84.humanoidDiedConn then
        v84.humanoidDiedConn:Disconnect();
        v84.humanoidDiedConn = nil;
    end;
    v84.offsetMotor:destroy();
    if v84.selfViewVisibilityUpdatedSignal then
        v84.selfViewVisibilityUpdatedSignal:disconnect();
        v84.selfViewVisibilityUpdatedSignal = nil;
    end;
    if v34 and v84.state.isInEasierUnmutingTreatment and v36 and v84.participantsUpdateConnection then
        v84.participantsUpdateConnection:Disconnect();
        v84.participantsUpdateConnection = nil;
    end;
end;
local function v90(...) --[[ Line: 421 ]] --[[ Name: waitForFirst ]]
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v86 = {
        ...
    };
    local function v88(...) --[[ Line: 425 ]] --[[ Name: fire ]]
        -- upvalues: v86 (copy), l_BindableEvent_0 (copy)
        for v87 = 1, #v86 do
            v86[v87]:Disconnect();
        end;
        return l_BindableEvent_0:Fire(...);
    end;
    for v89 = 1, #v86 do
        v86[v89] = v86[v89]:Connect(v88);
    end;
    return l_BindableEvent_0.Event:Wait();
end;
local function v96(v91, v92, v93) --[[ Line: 440 ]] --[[ Name: findFirstChildByNameAndClass ]]
    for _, v95 in ipairs(v91:GetChildren()) do
        if v95.Name == v92 and v95:IsA(v93) then
            return v95;
        end;
    end;
end;
v41.onCharacterAdded = function(v97, v98, v99) --[[ Line: 449 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v90 (copy), v7 (copy), v27 (copy), v96 (copy)
    if not v99.Parent then
        v90(v99.AncestryChanged, v98.CharacterAdded);
    end;
    if v98.Character ~= v99 or not v99.Parent then
        v7:debug("Mismatched or unparented character in onCharacterAdded for {}", v97.state.shortId);
        return;
    else
        local l_Humanoid_0 = v99:FindFirstChildOfClass("Humanoid");
        while v99:IsDescendantOf(game) and not l_Humanoid_0 do
            v90(v99.ChildAdded, v99.AncestryChanged, v98.CharacterAdded);
            l_Humanoid_0 = v99:FindFirstChildOfClass("Humanoid");
        end;
        if v98.Character ~= v99 or not v99:IsDescendantOf(game) then
            v7:debug("Mismatched or unparented character in onCharacterAdded for {}", v97.state.shortId);
            return;
        else
            local v101 = nil;
            v101 = if v27() then v99.PrimaryPart else v99:FindFirstChild("HumanoidRootPart");
            while v99:IsDescendantOf(game) and not v101 do
                v90(v99.ChildAdded, v99.AncestryChanged, v98.CharacterAdded);
                if v27() then
                    v101 = v99.PrimaryPart;
                else
                    v101 = v99:FindFirstChild("HumanoidRootPart");
                end;
            end;
            if v101 and v99:IsDescendantOf(game) and v98.Character == v99 and v97.isMounted then
                local v102 = v96(v99, "Head", "BasePart");
                v97:setState({
                    adornee = l_Humanoid_0.Health == 0 and v102 or v99
                });
                if v97.humanoidDiedConn then
                    v97.humanoidDiedConn:Disconnect();
                    v97.humanoidDiedConn = nil;
                end;
                v97.humanoidDiedConn = l_Humanoid_0.Died:Connect(function() --[[ Line: 499 ]]
                    -- upvalues: v97 (copy), v96 (ref), v99 (copy)
                    v97:setState({
                        adornee = v96(v99, "Head", "BasePart") or v99
                    });
                end);
            end;
            return;
        end;
    end;
end;
v41.getVerticalOffset = function(v103, v104) --[[ Line: 509 ]] --[[ Name: getVerticalOffset ]]
    if v104 and v104:IsA("Model") then
        local l_v104_BoundingBox_0, v106 = v104:GetBoundingBox();
        local v107 = v103:getAdorneeInstance(v104);
        if not v107 then
            return v106.Y / 2;
        elseif v107:IsA("BasePart") then
            local v108 = l_v104_BoundingBox_0:PointToObjectSpace(v107.Position);
            return v106.Y / 2 - v108.Y;
        else
            return 0;
        end;
    elseif v104 and v104:IsA("BasePart") then
        return v104.Size.Y / 2;
    else
        return 0;
    end;
end;
v41.getAdorneeInstance = function(v109, v110) --[[ Line: 531 ]] --[[ Name: getAdorneeInstance ]]
    -- upvalues: v27 (copy)
    if not v110 then
        return;
    else
        if v110:IsA("Model") then
            local l_v110_FirstChild_0 = v110:FindFirstChild(v109.state.savedChatSettings.AdorneeName, true);
            if v27() then
                l_v110_FirstChild_0 = l_v110_FirstChild_0 or v110.PrimaryPart;
            end;
            if not l_v110_FirstChild_0 or l_v110_FirstChild_0:IsA("BasePart") or l_v110_FirstChild_0:IsA("Attachment") then
                return l_v110_FirstChild_0;
            end;
        elseif v110:IsA("BasePart") or v110:IsA("Attachment") then
            return v110;
        end;
        return;
    end;
end;
v41.getPermissions = function(v112) --[[ Line: 550 ]] --[[ Name: getPermissions ]]
    -- upvalues: v13 (copy)
    return v13(function(v113) --[[ Line: 551 ]]
        -- upvalues: v112 (copy)
        v112:setState({
            hasCameraPermissions = v113.hasCameraPermissions, 
            hasMicPermissions = v113.hasMicPermissions
        });
    end, nil, nil, "BubbleChatBillboard.getPermissions");
end;
v41.getMicPermission = function(v114) --[[ Line: 563 ]] --[[ Name: getMicPermission ]]
    -- upvalues: v13 (copy), l_default_0 (copy)
    v13(function(v115) --[[ Line: 564 ]]
        -- upvalues: v114 (copy)
        v114:setState({
            hasMicPermissions = v115.hasMicPermissions
        });
    end, {
        l_default_0.Permissions.MICROPHONE_ACCESS
    }, nil, "BubbleChatBillboard.getMicPermission");
end;
v41.getCameraPermissionWithoutRequest = function(v116) --[[ Line: 575 ]] --[[ Name: getCameraPermissionWithoutRequest ]]
    -- upvalues: v13 (copy), l_default_0 (copy)
    v13(function(v117) --[[ Line: 576 ]]
        -- upvalues: v116 (copy)
        v116:setState({
            hasCameraPermissions = v117.hasCameraPermissions
        });
    end, {
        l_default_0.Permissions.CAMERA_ACCESS
    }, true);
end;
v41.setCameraPermissionStateFromControl = function(v118, v119) --[[ Line: 584 ]] --[[ Name: setCameraPermissionStateFromControl ]]
    v118:setState({
        hasCameraPermissions = v119
    });
end;
v41.getRenderVoiceAndCameraBubble = function(v120) --[[ Line: 590 ]] --[[ Name: getRenderVoiceAndCameraBubble ]]
    -- upvalues: v32 (copy), v28 (copy), l_Players_0 (copy), l_VRService_0 (copy), l_Enabled_0 (copy)
    if not v120.props.voiceEnabled and not v32 and not v28 then
        return false;
    elseif v120.props.userId == tostring(l_Players_0.LocalPlayer.UserId) then
        if l_VRService_0.VREnabled or l_Enabled_0() then
            return false;
        elseif not v120.state.selfViewOpen then
            return true;
        else
            return false;
        end;
    else
        return v120.props.voiceEnabled and not v120.state.voiceTimedOut;
    end;
end;
v41.shouldRenderCarat = function(v121) --[[ Line: 621 ]] --[[ Name: shouldRenderCarat ]]
    return v121.props.chatSettings.TailVisible and not v121:getRenderVoiceAndCameraBubble();
end;
v41.render = function(v122) --[[ Line: 625 ]] --[[ Name: render ]]
    -- upvalues: l_Players_0 (copy), v7 (copy), v34 (copy), v20 (copy), v36 (copy), v28 (copy), l_VRService_0 (copy), l_Enabled_0 (copy), v40 (copy), v29 (copy), v8 (copy), v43 (ref), v17 (copy), v16 (copy), v14 (copy), v15 (copy)
    local v123 = v122:getAdorneeInstance(v122.state.adornee);
    local v124 = v122.props.userId == tostring(l_Players_0.LocalPlayer.UserId);
    local l_savedChatSettings_0 = v122.state.savedChatSettings;
    if not v123 then
        v7:trace("No adornee for {}", v122.state.shortId);
        return;
    elseif not v122.state.isInsideRenderDistance then
        v7:trace("Not in range for {}", v122.state.shortId);
        return;
    elseif v34 and v122.state.isInEasierUnmutingTreatment and v122.props.voiceState == v20.VOICE_STATE.LOCAL_MUTED and (not v122.state.isInsideEasierUnmutingDistance or v36 and v122.state.isMuted) then
        v7:trace("Unmute toggle not applicable for {}", v122.state.shortId);
        return;
    else
        local v126 = {};
        local v127 = nil;
        local v128 = v122.props.voiceEnabled and not v122.state.voiceTimedOut;
        if v28 and v124 then
            v128 = v128 and not v122.state.selfViewOpen;
        end;
        if (l_VRService_0.VREnabled or l_Enabled_0()) and v124 then
            v128 = false;
        end;
        if v28 then
            if v122:getRenderVoiceAndCameraBubble() then
                local v130 = {
                    chatSettings = l_savedChatSettings_0, 
                    isInsideMaximizeDistance = v122.state.isInsideMaximizeDistance, 
                    LayoutOrder = 2, 
                    isLocalPlayer = v124, 
                    hasCameraPermissions = v122.state.hasCameraPermissions, 
                    hasMicPermissions = v122.state.hasMicPermissions, 
                    userId = v122.props.userId, 
                    voiceEnabled = v122.props.voiceEnabled, 
                    setCameraPermissionStateFromControl = function(v129) --[[ Line: 681 ]] --[[ Name: setCameraPermissionStateFromControl ]]
                        -- upvalues: v40 (ref), v122 (copy)
                        if v40() then
                            v122:setCameraPermissionStateFromControl(v129);
                        end;
                    end, 
                    isShowingDueToEasierUnmuting = v122:isShowingDueToEasierUnmuting()
                };
                v126.VoiceAndCameraBubble = v29 and v8.createElement(v43, v130) or v8.createElement(v17, v130);
                v126.listLayout = v8.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, 8)
                });
                v126.padding = v8.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 8)
                });
            end;
        elseif v128 and (not v122.props.bubbleChatEnabled or not v122.props.messageIds or #v122.props.messageIds == 0) then
            v126.VoiceBubble = v8.createElement(v16, {
                chatSettings = l_savedChatSettings_0, 
                renderInsert = v122.renderInsert, 
                insertSize = v122.insertSize, 
                isDistant = not v122.state.isInsideMaximizeDistance
            });
        end;
        if v122.state.hasMessage then
            if v122.state.isInsideMaximizeDistance then
                v126.BubbleChatList = v8.createElement(v14, {
                    userId = v122.props.userId, 
                    isVisible = v122.state.isInsideMaximizeDistance, 
                    onLastBubbleFadeOut = v122.onLastBubbleFadeOut, 
                    chatSettings = l_savedChatSettings_0, 
                    renderFirstInsert = if not v28 and v128 then v122.renderInsert else nil, 
                    insertSize = v122.insertSize, 
                    showCarat = v122:shouldRenderCarat()
                });
            else
                v126.DistantBubble = v8.createElement(v15, {
                    fadingOut = not v122.props.messageIds or #v122.props.messageIds == 0, 
                    onFadeOut = v122.onLastBubbleFadeOut, 
                    chatSettings = l_savedChatSettings_0, 
                    renderInsert = v128 and v122.renderInsert, 
                    insertSize = v122.insertSize
                });
            end;
        end;
        v127 = v128;
        if v28 then
            v127 = v122:getRenderVoiceAndCameraBubble();
        end;
        local v131 = v124 and l_savedChatSettings_0.LocalPlayerStudsOffset or Vector3.new(0, 1, 0.10000000149011612, 0);
        return v8.createElement("BillboardGui", {
            Adornee = v123, 
            Active = v127, 
            Size = UDim2.fromOffset(500, 200), 
            SizeOffset = Vector2.new(0, 0.5), 
            StudsOffset = v131 + Vector3.new(0, l_savedChatSettings_0.VerticalStudsOffset, 0), 
            StudsOffsetWorldSpace = v122.offset, 
            ResetOnSpawn = false
        }, v126);
    end;
end;
v41.didUpdate = function(v132, _, v134) --[[ Line: 765 ]] --[[ Name: didUpdate ]]
    -- upvalues: v34 (copy), l_Players_0 (copy), v20 (copy), l_IXPServiceWrapper_0 (copy), v38 (copy)
    if (not v132.props.messageIds or #v132.props.messageIds == 0) and not v132.state.isInsideRenderDistance then
        v132.onLastBubbleFadeOut();
    end;
    if v132.props.messageIds and #v132.props.messageIds > 0 then
        v132.isFadingOut = false;
    end;
    if v34 and v132.state.isInEasierUnmutingTreatment then
        v132:checkCounterForTimeoutWithEasierUnmuting(v134);
    else
        v132:checkCounterForTimeout(v134.voiceStateCounter);
    end;
    local v135 = v132.props.userId == tostring(l_Players_0.LocalPlayer.UserId);
    if v34 and v135 and not v132.state.haveLoggedUserExposure and (v132.props.voiceState == v20.VOICE_STATE.INACTIVE or v132.props.voiceState == v20.VOICE_STATE.TALKING or v132.props.voiceState == v20.VOICE_STATE.MUTED) then
        l_IXPServiceWrapper_0:LogUserLayerExposure(v38);
        v132:setState({
            haveLoggedUserExposure = true
        });
    end;
end;
v41.getDerivedStateFromProps = function(v136, v137) --[[ Line: 802 ]] --[[ Name: getDerivedStateFromProps ]]
    local v138 = "..." .. string.sub(tostring(v136.userId), -4);
    local v139 = not v137.hasMessage and v136.messageIds and #v136.messageIds > 0;
    local v140 = nil;
    local v141 = nil;
    local v142 = nil;
    if v137.lastVoiceState ~= v136.voiceState then
        v141 = (v137.voiceStateCounter or 0) + 1;
        v142 = false;
        v140 = v136.voiceState;
    end;
    return {
        hasMessage = v139 or nil, 
        savedChatSettings = v136.lastMessage and v136.chatSettings, 
        shortId = v138, 
        voiceStateCounter = v141, 
        voiceTimedOut = v142, 
        lastVoiceState = v140
    };
end;
return v9.connect(function(v143, v144) --[[ Line: 832 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v21 (copy)
    local v145 = v143.userMessages[v144.userId];
    local v146 = v145 and #v145 >= 1 and v145[#v145];
    local v147 = v146 and v143.messages[v146];
    local v148 = v143.voiceState[v144.userId];
    return {
        chatSettings = v21(v143.chatSettings, v147), 
        messageIds = v145, 
        lastMessage = v147, 
        voiceState = v148
    };
end)(v41);