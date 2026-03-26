debugPrint = function(__) --[[ Line: 29 ]] --[[ Name: debugPrint ]]

end;
local v1 = nil;
local v2 = nil;
local l_game_EngineFeature_0 = game:GetEngineFeature("AnimatorAndADFRefactor");
local l_game_EngineFeature_1 = game:GetEngineFeature("PlayerViewRemoteEventSupport");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_VRService_0 = game:GetService("VRService");
local v8 = game:DefineFastFlag("SelfViewCameraDefaultButtonInViewPort", false);
local v9 = game:DefineFastFlag("InExperienceUpsellSelfViewFix", false);
local v10 = game:DefineFastFlag("SelfViewAvatarJointUpgrade", false);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CharacterUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CharacterUtility;
local l_CFrameUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CFrameUtility;
local l_CoreGui_0 = game:GetService("CoreGui");
local __ = game:GetService("StarterGui");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_RunService_0 = game:GetService("RunService");
local l_MouseIconOverrideService_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService;
local v19 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Symbol.named("SelfieViewCursorOverride");
local l_Players_0 = game:GetService("Players");
local __ = game:GetService("UserInputService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_SocialService_0 = game:GetService("SocialService");
local l_UserInputService_1 = game:GetService("UserInputService");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v26 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local l_game_Service_0 = game:FindService("FaceAnimatorService");
local l_game_Service_1 = game:FindService("VideoCaptureService");
local v29 = require(l_RobloxGui_0.Modules.SelfView.Analytics).new();
local v30 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v31 = require(l_RobloxGui_0.Modules.Tracker.TrackerMenu);
local v32 = require(l_RobloxGui_0.Modules.Tracker.TrackerPromptType);
local v33 = UDim2.fromOffset(15, 25);
local v34 = UDim2.new(0.15, 0, 0.4, 0);
local v35 = Color3.new(1, 1, 1);
local __ = l_RunService_0:IsStudio();
local v37 = require(l_RobloxGui_0.Modules.SelfView.toggleSelfViewSignal);
local v38 = require(l_RobloxGui_0.Modules.Settings.getCamMicPermissions);
local v39 = require(l_RobloxGui_0.Modules.Settings.Analytics.VoiceAnalytics);
local v40 = require(l_RobloxGui_0.Modules.SelfView.publicApi);
local l_GetFFlagAvatarChatServiceEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled;
local v42 = if l_GetFFlagAvatarChatServiceEnabled_0() then game:GetService("AvatarChatService") else nil;
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v44 = require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
local l_GetFFlagJoinWithoutMicPermissions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagJoinWithoutMicPermissions;
local v46 = require(l_RobloxGui_0.Modules.Flags.getFFlagEnableAlwaysAvailableCamera);
local v47 = game:DefineFastFlag("MockOpenSelfViewForCameraUser", false);
local v48 = nil;
local v49 = game:DefineFastInt("SelfViewTooltipLifetime", 10);
local v50 = require(l_RobloxGui_0.Modules.SelfView.mountSelfViewOnCloseTooltip);
local v51 = require(l_RobloxGui_0.Modules.SelfView.mountSelfViewOnOpenTooltip);
local v52 = nil;
local v53 = require(l_RobloxGui_0.Modules.Settings.isCamEnabledForUserAndPlace);
local v54 = require(l_RobloxGui_0.Modules.VoiceChat.Helpers.displayCameraDeniedToast);
local l_Images_0 = require(l_CorePackages_0.Packages.UIBlox).App.ImageSet.Images;
local v56 = l_Images_0["icons/controls/video"];
local v57 = l_Images_0["icons/controls/videoOff"];
local v58 = l_Images_0["icons/controls/microphoneMute"];
local v59 = l_Images_0["icons/controls/microphone_small"];
local v60 = nil;
local v61 = 1.31;
local v62 = 0;
local v63 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatUILogging);
local v64 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceMuteAnalytics);
local v65 = nil;
if v64() then
    v65 = v39.new(l_RbxAnalyticsService_0, "LegacySelfView");
end;
local v66 = nil;
local v67 = nil;
local v68 = {};
local v69 = nil;
local v70 = nil;
local v71 = nil;
local v72 = nil;
local v73 = nil;
local v74 = nil;
local v75 = nil;
local v76 = nil;
local v77 = {};
local v78 = {};
local v79 = nil;
local v80 = nil;
local v81 = nil;
local v82 = nil;
local v83 = nil;
local v84 = nil;
local v85 = nil;
local v86 = Vector3.new(1.1720999479293823, 1.1811000108718872, 1.1577999591827393, 0);
local v87 = nil;
local v88 = nil;
local v89 = nil;
local v90 = nil;
local v91 = nil;
local v92 = nil;
local v93 = nil;
local v94 = nil;
local v95 = nil;
local v96 = nil;
local v97 = nil;
local v98 = false;
local v99 = nil;
local v100 = false;
local v101 = nil;
local v102 = false;
local v103 = 0;
local v104 = false;
local v105 = false;
local v106 = false;
local v107 = true;
local v108 = false;
local v109 = false;
local v110 = false;
local function __() --[[ Line: 193 ]] --[[ Name: getShouldShowMicButton ]]
    -- upvalues: l_default_0 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), v110 (ref), v107 (ref), v46 (copy), v109 (ref)
    local l_voiceUIVisible_0 = l_default_0.voiceUIVisible;
    if l_GetFFlagJoinWithoutMicPermissions_0() then
        return l_voiceUIVisible_0 and v110 and (not l_default_0:VoiceChatEnded() or v107);
    elseif v46() then
        return l_voiceUIVisible_0 and v109;
    else
        return l_voiceUIVisible_0 and v109 and not l_default_0:VoiceChatEnded();
    end;
end;
local v113 = false;
local v114 = false;
local v115 = false;
local v116 = nil;
local v117 = false;
local v118 = nil;
local v119 = nil;
local v120 = nil;
local v121 = {
    "Head", 
    "UpperTorso", 
    "LowerTorso", 
    "Torso", 
    "LeftFoot", 
    "LeftLowerLeg", 
    "LeftUpperLeg", 
    "RightFoot", 
    "RightLowerLeg", 
    "RightUpperLeg", 
    "LeftHand", 
    "LeftLowerArm", 
    "LeftUpperArm", 
    "RightHand", 
    "RightLowerArm", 
    "RightUpperArm"
};
local v122 = {};
local __ = {
    "Head", 
    "Left Arm", 
    "Left Leg", 
    "Right Arm", 
    "Right Leg", 
    "Torso"
};
local v124 = {
    Accessory = "Accessory", 
    Animator = "Animator", 
    Attachment = "Attachment", 
    AnimationConstraint = v10 and "AnimationConstraint" or nil, 
    BallSocketConstraint = v10 and "BallSocketConstraint" or nil, 
    BodyColors = "BodyColors", 
    CharacterMesh = "CharacterMesh", 
    Decal = "Decal", 
    FaceControls = "FaceControls", 
    Humanoid = "Humanoid", 
    HumanoidDescription = "HumanoidDescription", 
    MeshPart = "MeshPart", 
    Motor6D = "Motor6D", 
    NumberValue = "NumberValue", 
    Pants = "Pants", 
    Part = "Part", 
    Shirt = "Shirt", 
    ShirtGraphic = "ShirtGraphic", 
    SpecialMesh = "SpecialMesh", 
    StringValue = "StringValue", 
    SurfaceAppearance = "SurfaceAppearance", 
    Vector3Value = "Vector3Value", 
    WrapTarget = "WrapTarget", 
    Weld = "Weld", 
    WrapLayer = "WrapLayer", 
    WeldConstraint = "WeldConstraint", 
    AccessoryWeld = "AccessoryWeld", 
    PackageLink = "PackageLink", 
    Folder = "Folder", 
    RigidConstraint = "RigidConstraint"
};
local v125 = {
    Accessory = "Accessory", 
    CharacterMesh = "CharacterMesh", 
    Decal = "Decal", 
    MeshPart = "MeshPart", 
    Pants = "Pants", 
    Part = "Part", 
    Shirt = "Shirt", 
    ShirtGraphic = "ShirtGraphic", 
    SpecialMesh = "SpecialMesh", 
    SurfaceAppearance = "SurfaceAppearance"
};
v30:trace("Self View 08-13-2024__1!!");
local v126 = {};
local v127 = {
    AnimationPlayed = "AnimationPlayed", 
    AnimationPlayedCoreScript = "AnimationPlayedCoreScript", 
    DescendantAdded = "DescendantAdded", 
    DescendantRemoving = "DescendantRemoving", 
    HeadSize = "HeadSize", 
    Color = "Color", 
    CharacterAdded = "CharacterAdded", 
    CharacterRemoving = "CharacterRemoving", 
    HumanoidStateChanged = "HumanoidStateChanged"
};
getShouldDisplaySelfieView = function() --[[ Line: 317 ]] --[[ Name: getShouldDisplaySelfieView ]]
    -- upvalues: v47 (copy), l_AppStorageService_0 (copy)
    local v128 = false;
    if v47 then
        return true;
    else
        pcall(function() --[[ Line: 325 ]]
            -- upvalues: l_AppStorageService_0 (ref), v128 (ref)
            if l_AppStorageService_0:GetItem("ShowSelfieViewForCameraUser") == "true" then
                v128 = true;
            end;
        end);
        return v128;
    end;
end;
setSelfieViewDisplayInAppStorage = function(v129) --[[ Line: 335 ]] --[[ Name: setSelfieViewDisplayInAppStorage ]]
    -- upvalues: l_AppStorageService_0 (copy)
    pcall(function() --[[ Line: 337 ]]
        -- upvalues: l_AppStorageService_0 (ref), v129 (copy)
        l_AppStorageService_0:SetItem("ShowSelfieViewForCameraUser", v129 and "true" or "false");
    end);
end;
shouldDisplaySelfViewTooltip = function(v130) --[[ Line: 342 ]] --[[ Name: shouldDisplaySelfViewTooltip ]]
    -- upvalues: v46 (copy), v53 (copy), v94 (ref), v47 (copy), l_AppStorageService_0 (copy)
    if not v46() or not v53() then
        return false;
    elseif not v94 then
        return false;
    else
        local v131 = false;
        if v47 then
            return true;
        else
            pcall(function() --[[ Line: 359 ]]
                -- upvalues: v131 (ref), l_AppStorageService_0 (ref), v130 (copy)
                v131 = l_AppStorageService_0:GetItem(v130) == "true";
            end);
            return v131;
        end;
    end;
end;
displaySelfieViewByDefault = function() --[[ Line: 365 ]] --[[ Name: displaySelfieViewByDefault ]]
    -- upvalues: v46 (copy), v53 (copy), v48 (ref)
    if v46() and v53() and getShouldDisplaySelfieView() and v48 ~= nil then
        v48(true);
    end;
end;
getRelativePosition = function(v132) --[[ Line: 376 ]] --[[ Name: getRelativePosition ]]
    if not v132.Parent then
        return v132.Size;
    else
        local l_AbsoluteSize_0 = v132.Parent.AbsoluteSize;
        return UDim2.new(v132.AbsolutePosition.X / l_AbsoluteSize_0.X, 0, v132.AbsolutePosition.Y / l_AbsoluteSize_0.Y, 0);
    end;
end;
getRelativeSize = function(v134) --[[ Line: 384 ]] --[[ Name: getRelativeSize ]]
    if not v134.Parent then
        return v134.Size;
    else
        local l_AbsoluteSize_1 = v134.Parent.AbsoluteSize;
        debugPrint("uiObject.AbsoluteSize.X:" .. tostring(v134.AbsoluteSize.X) .. ",uiObject.AbsoluteSize.Y:" .. tostring(v134.AbsoluteSize.Y) .. ",screenSize.X:" .. tostring(l_AbsoluteSize_1.X) .. ",screenSize.Y:" .. tostring(l_AbsoluteSize_1.Y));
        return UDim2.new(v134.AbsoluteSize.X / l_AbsoluteSize_1.X, 0, v134.AbsoluteSize.Y / l_AbsoluteSize_1.Y, 0);
    end;
end;
startSelfViewSession = function() --[[ Line: 402 ]] --[[ Name: startSelfViewSession ]]
    -- upvalues: v40 (copy), v93 (ref), v29 (copy)
    v40.setSelfViewIsOpenAndVisible(true);
    local v136 = getRelativePosition(v93);
    local v137 = getRelativeSize(v93);
    v29:reportSelfViewSessionStarted(math.floor(v93.AbsolutePosition.X), math.floor(v93.AbsolutePosition.Y), math.floor(v93.AbsoluteSize.X), math.floor(v93.AbsoluteSize.Y), v136.X, v136.Y, v137.X, v137.Y);
    debugPrint("selfViewPublicApi.getSelfViewIsOpenAndVisible(): " .. tostring(v40.getSelfViewIsOpenAndVisible()));
end;
stopSelfViewSession = function() --[[ Line: 421 ]] --[[ Name: stopSelfViewSession ]]
    -- upvalues: v40 (copy), v29 (copy)
    v40.setSelfViewIsOpenAndVisible(false);
    v29:reportSelfViewSessionStopped();
    debugPrint("selfViewPublicApi.getSelfViewIsOpenAndVisible(): " .. tostring(v40.getSelfViewIsOpenAndVisible()));
end;
getShouldBeEnabledCoreGuiSetting = function() --[[ Line: 429 ]] --[[ Name: getShouldBeEnabledCoreGuiSetting ]]
    return true;
end;
updateSelfViewButtonVisibility = function() --[[ Line: 434 ]] --[[ Name: updateSelfViewButtonVisibility ]]
    -- upvalues: v44 (copy), v53 (copy), v108 (ref), l_default_0 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), v110 (ref), v107 (ref), v46 (copy), v109 (ref), v93 (ref)
    local v138 = 0;
    if v44() then
        if v53() then
            v138 = v138 + 1;
        end;
    elseif v108 then
        v138 = v138 + 1;
    end;
    local l_voiceUIVisible_1 = l_default_0.voiceUIVisible;
    if if l_GetFFlagJoinWithoutMicPermissions_0() then l_voiceUIVisible_1 and v110 and (not l_default_0:VoiceChatEnded() or v107) else if v46() then l_voiceUIVisible_1 and v109 else l_voiceUIVisible_1 and v109 and not l_default_0:VoiceChatEnded() then
        v138 = v138 + 1;
    end;
    if v93 ~= nil then
        local l_v93_FirstChild_0 = v93:FindFirstChild("MicButton", true);
        l_voiceUIVisible_1 = v93:FindFirstChild("CamButton", true);
        local v141 = v138 == 2 and 0.5 or 1;
        if l_v93_FirstChild_0 then
            l_v93_FirstChild_0.Size = UDim2.new(v141, -4, 1, -4);
            local l_voiceUIVisible_2 = l_default_0.voiceUIVisible;
            l_v93_FirstChild_0.Visible = if l_GetFFlagJoinWithoutMicPermissions_0() then l_voiceUIVisible_2 and v110 and (not l_default_0:VoiceChatEnded() or v107) else if v46() then l_voiceUIVisible_2 and v109 else l_voiceUIVisible_2 and v109 and not l_default_0:VoiceChatEnded();
        end;
        if l_voiceUIVisible_1 then
            l_voiceUIVisible_1.Size = UDim2.new(v141, -4, 1, -4);
            local l_v108_0 = v108;
            if v44() then
                l_v108_0 = v53();
            end;
            l_voiceUIVisible_1.Visible = l_v108_0;
        end;
    end;
end;
local v144 = {};
if game:GetEngineFeature("VoiceChatSupported") then
    v144 = {
        [Enum.VoiceChatState.Joining] = l_default_0.VOICE_STATE.CONNECTING, 
        [Enum.VoiceChatState.JoiningRetry] = l_default_0.VOICE_STATE.CONNECTING, 
        [Enum.VoiceChatState.Joined] = l_default_0.VOICE_STATE.MUTED, 
        [Enum.VoiceChatState.Leaving] = l_default_0.VOICE_STATE.MUTED, 
        [Enum.VoiceChatState.Failed] = l_default_0.VOICE_STATE.ERROR
    };
end;
initVoiceChatServiceManager = function() --[[ Line: 488 ]] --[[ Name: initVoiceChatServiceManager ]]
    -- upvalues: l_default_0 (copy), v46 (copy), v95 (ref), v58 (copy), v59 (copy), l_RunService_0 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), v110 (ref), v9 (copy), v109 (ref), v107 (ref), l_Players_0 (copy), v94 (ref), v63 (copy), v30 (copy)
    local l_MUTED_0 = l_default_0.VOICE_STATE.MUTED;
    if v46() then
        l_MUTED_0 = l_default_0.VOICE_STATE.CONNECTING;
    end;
    local v146 = 0;
    local function v150(v147, v148) --[[ Line: 497 ]] --[[ Name: updateMicIcon ]]
        -- upvalues: l_MUTED_0 (ref), v146 (ref), v95 (ref), l_default_0 (ref), v58 (ref), v59 (ref)
        if v147 == l_MUTED_0 and v148 == v146 then
            return;
        else
            l_MUTED_0 = v147;
            v146 = v148;
            if v95 then
                if v147 == l_default_0.VOICE_STATE.MUTED then
                    v95.Size = UDim2.fromOffset(32, 32);
                    v95.Image = v58.Image;
                    if v95.ImageRectOffset ~= v58.ImageRectOffset then
                        v95.ImageRectOffset = v58.ImageRectOffset;
                    end;
                    v95.ImageRectSize = v58.ImageRectSize;
                else
                    local v149 = l_default_0:VoiceStateToIcon(v147, v148, "New");
                    v95.Size = UDim2.fromOffset(16, 20);
                    v95.Image = v149;
                    v95.ImageRectOffset = Vector2.new(0, 0);
                    v95.ImageRectSize = Vector2.new(0, 0);
                end;
                v95.Position = UDim2.new(0.5, 0, 0.5, 0);
                if v147 == l_default_0.VOICE_STATE.INACTIVE then
                    v95.Size = UDim2.fromOffset(19, 19);
                    v95.Image = v59.Image;
                    v95.ImageRectOffset = v59.ImageRectOffset;
                    v95.ImageRectSize = v59.ImageRectSize;
                    return;
                elseif v147 == l_default_0.VOICE_STATE.TALKING then
                    v95.Position = UDim2.new(0.5, 0, 0.5, -1);
                end;
            end;
            return;
        end;
    end;
    local v151 = false;
    local function v153(v152) --[[ Line: 535 ]] --[[ Name: updateVoiceIndicatorRenderStepped ]]
        -- upvalues: v151 (ref), l_RunService_0 (ref), v150 (copy), l_MUTED_0 (ref)
        if v152 then
            if v151 then
                l_RunService_0:UnbindFromRenderStep("SelfViewVoiceIndicatorRenderStepped");
                v151 = false;
                return;
            end;
        elseif not v151 then
            l_RunService_0:BindToRenderStep("SelfViewVoiceIndicatorRenderStepped", Enum.RenderPriority.First.Value + 1, function() --[[ Line: 547 ]]
                -- upvalues: v150 (ref), l_MUTED_0 (ref)
                v150(l_MUTED_0, math.random());
            end);
            v151 = true;
        end;
    end;
    l_default_0.talkingChanged.Event:Connect(function(v154) --[[ Line: 556 ]]
        -- upvalues: v150 (copy), l_default_0 (ref), v146 (ref)
        if v154 then
            v150(l_default_0.VOICE_STATE.TALKING, v146);
            return;
        else
            v150(l_default_0.VOICE_STATE.INACTIVE, v146);
            return;
        end;
    end);
    l_default_0.muteChanged.Event:Connect(function(v155) --[[ Line: 564 ]]
        -- upvalues: v153 (copy), l_default_0 (ref), v150 (copy), v146 (ref)
        v153(v155);
        debugPrint("Self View: VoiceChatServiceManager.muteChanged.Event, muted: " .. tostring(v155));
        local v156 = v155 and l_default_0.VOICE_STATE.MUTED or l_default_0.VOICE_STATE.INACTIVE;
        v150(v156, v146);
    end);
    l_default_0:asyncInit():andThen(function() --[[ Line: 573 ]]
        -- upvalues: l_default_0 (ref), l_GetFFlagJoinWithoutMicPermissions_0 (ref), v110 (ref), v9 (ref), v109 (ref), v107 (ref), v153 (copy), v150 (copy), v146 (ref), l_Players_0 (ref), v94 (ref)
        local v157 = l_default_0:getService();
        if v157 then
            if l_GetFFlagJoinWithoutMicPermissions_0() then
                v110 = true;
            end;
            displaySelfieViewByDefault();
            if v9 then
                v109 = true;
                local l_localMuted_0 = l_default_0.localMuted;
                if l_localMuted_0 ~= nil then
                    v107 = false;
                    v153(l_localMuted_0);
                    v150(if l_localMuted_0 then l_default_0.VOICE_STATE.MUTED else l_default_0.VOICE_STATE.INACTIVE, v146);
                    updateSelfViewButtonVisibility();
                end;
            end;
            v157.StateChanged:Connect(function(__, v160) --[[ Line: 596 ]]
                -- upvalues: l_default_0 (ref), v107 (ref), v150 (ref), v146 (ref)
                local l_l_default_0_VoiceStateFromEnum_0 = l_default_0:GetVoiceStateFromEnum(v160);
                if l_l_default_0_VoiceStateFromEnum_0 then
                    if not (l_l_default_0_VoiceStateFromEnum_0 == l_default_0.VOICE_STATE.CONNECTING) and v107 then
                        v107 = false;
                    end;
                    v150(l_l_default_0_VoiceStateFromEnum_0, v146);
                    return;
                else
                    if v160 == Enum.VoiceChatState.Ended then
                        updateSelfViewButtonVisibility();
                    end;
                    return;
                end;
            end);
            l_default_0.showVoiceUI.Event:Connect(function() --[[ Line: 609 ]]
                -- upvalues: l_Players_0 (ref)
                updateSelfViewButtonVisibility();
                ReInit(l_Players_0.LocalPlayer);
            end);
            l_default_0.hideVoiceUI.Event:Connect(function() --[[ Line: 613 ]]
                -- upvalues: v94 (ref), l_Players_0 (ref)
                updateSelfViewButtonVisibility();
                if v94 then
                    v94:Destroy();
                end;
                v94 = nil;
                ReInit(l_Players_0.LocalPlayer);
            end);
        end;
    end):catch(function() --[[ Line: 623 ]]
        -- upvalues: v63 (ref), v30 (ref)
        if v63() then
            v30:warning("Failed to init VoiceChatServiceManager");
        end;
    end);
end;
local v162 = false;
getPermissions = function() --[[ Line: 633 ]] --[[ Name: getPermissions ]]
    -- upvalues: v30 (copy), v108 (ref), v109 (ref), v162 (ref), v38 (copy)
    v30:trace("Self View: getPermissions()");
    v38(function(v163) --[[ Line: 636 ]]
        -- upvalues: v108 (ref), v109 (ref), v162 (ref)
        v108 = v163.hasCameraPermissions;
        v109 = v163.hasMicPermissions;
        updateSelfViewButtonVisibility();
        if v109 and not v162 then
            initVoiceChatServiceManager();
            v162 = true;
        end;
    end, nil, nil, "FaceChatSelfieView.getPermissions");
end;
getMicPermission = function() --[[ Line: 650 ]] --[[ Name: getMicPermission ]]
    -- upvalues: v109 (ref), l_GetFFlagJoinWithoutMicPermissions_0 (copy), v162 (ref), v38 (copy), l_default_1 (copy)
    v38(function(v164) --[[ Line: 651 ]]
        -- upvalues: v109 (ref), l_GetFFlagJoinWithoutMicPermissions_0 (ref), v162 (ref)
        v109 = v164.hasMicPermissions;
        if l_GetFFlagJoinWithoutMicPermissions_0() then
            if not v162 then
                initVoiceChatServiceManager();
                v162 = true;
                return;
            end;
        elseif v109 and not v162 then
            initVoiceChatServiceManager();
            v162 = true;
        end;
    end, {
        l_default_1.Permissions.MICROPHONE_ACCESS
    }, nil, "FaceChatSelfieView.getMicPermission");
end;
getCameraPermissionWithoutRequest = function() --[[ Line: 674 ]] --[[ Name: getCameraPermissionWithoutRequest ]]
    -- upvalues: v108 (ref), v38 (copy), l_default_1 (copy)
    v38(function(v165) --[[ Line: 675 ]]
        -- upvalues: v108 (ref)
        v108 = v165.hasCameraPermissions;
    end, {
        l_default_1.Permissions.CAMERA_ACCESS
    }, true);
end;
local function __(v166, v167) --[[ Line: 683 ]] --[[ Name: removeChild ]]
    local l_v166_FirstChild_0 = v166:FindFirstChild(v167);
    if l_v166_FirstChild_0 then
        l_v166_FirstChild_0:Destroy();
    end;
end;
setCloneDirty = function(v170) --[[ Line: 690 ]] --[[ Name: setCloneDirty ]]
    -- upvalues: v62 (ref)
    if v170 then
        v62 = 0.35;
        return;
    else
        v62 = 0;
        return;
    end;
end;
local v171 = {};
local v172 = false;
local __ = function() --[[ Line: 702 ]] --[[ Name: disconnectListeners ]]
    -- upvalues: v171 (ref)
    for __, v174 in v171 do
        v174:Disconnect();
    end;
    v171 = {};
end;
constrainTargetPositionToScreen = function(v176, v177, v178) --[[ Line: 709 ]] --[[ Name: constrainTargetPositionToScreen ]]
    if v176 == nil then
        return;
    else
        local v179 = {
            X = v178.X, 
            Y = v178.Y
        };
        v179.X = math.min(v179.X, v177.X - 3 - v176.AbsoluteSize.X);
        v179.Y = math.min(v179.Y, v177.Y - 3 - v176.AbsoluteSize.Y);
        v179.X = math.max(3, v179.X);
        v179.Y = math.max(3, v179.Y);
        return UDim2.fromOffset(v179.X, v179.Y);
    end;
end;
local function v187(v180, v181, v182, v183) --[[ Line: 727 ]] --[[ Name: processDrag ]]
    if not v180.Parent then
        return;
    else
        local v184 = v181 - v182;
        local v185 = {
            X = (v184 + v183).X, 
            Y = (v184 + v183).Y
        };
        local l_AbsoluteSize_2 = v180.Parent.AbsoluteSize;
        v180.Position = constrainTargetPositionToScreen(v180, l_AbsoluteSize_2, v185);
        return;
    end;
end;
local function __() --[[ Line: 742 ]] --[[ Name: mouseEntered ]]
    -- upvalues: l_VRService_0 (copy), v106 (ref), l_MouseIconOverrideService_0 (copy), v19 (copy)
    if not l_VRService_0.VREnabled then
        v106 = true;
        l_MouseIconOverrideService_0.push(v19, Enum.OverrideMouseIconBehavior.ForceShow);
    end;
end;
local function __() --[[ Line: 749 ]] --[[ Name: mouseLeft ]]
    -- upvalues: v106 (ref), l_MouseIconOverrideService_0 (copy), v19 (copy)
    if v106 then
        v106 = false;
        l_MouseIconOverrideService_0.pop(v19);
    end;
end;
local function v209(v190, v191) --[[ Line: 757 ]] --[[ Name: inputBegan ]]
    -- upvalues: v172 (ref), v171 (ref), l_UserInputService_1 (copy), v187 (copy), l_AppStorageService_0 (copy)
    local l_UserInputType_0 = v191.UserInputType;
    if l_UserInputType_0 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_0 ~= Enum.UserInputType.Touch then
        return;
    elseif v172 then
        return;
    else
        v172 = true;
        local l_Position_0 = v191.Position;
        local v194 = Vector3.new(v190.AbsolutePosition.X, v190.AbsolutePosition.Y, 0);
        for __, v196 in v171 do
            v196:Disconnect();
        end;
        v171 = {};
        local v199 = l_UserInputService_1.InputChanged:Connect(function(v197) --[[ Line: 774 ]]
            -- upvalues: v172 (ref), v190 (copy), v191 (copy), v187 (ref), l_Position_0 (copy), v194 (copy)
            if not v172 then
                return;
            else
                v190.AnchorPoint = Vector2.new(0, 0);
                local l_UserInputType_1 = v197.UserInputType;
                if l_UserInputType_1 == Enum.UserInputType.Touch and v197 ~= v191 then
                    return;
                elseif l_UserInputType_1 ~= Enum.UserInputType.MouseMovement and l_UserInputType_1 ~= Enum.UserInputType.Touch then
                    return;
                elseif v197.UserInputState ~= Enum.UserInputState.Change then
                    return;
                else
                    v187(v190, v197.Position, l_Position_0, v194);
                    return;
                end;
            end;
        end);
        table.insert(v171, v199);
        local v205 = l_UserInputService_1.InputEnded:Connect(function(v200) --[[ Line: 804 ]]
            -- upvalues: v172 (ref), v171 (ref), v190 (copy), l_AppStorageService_0 (ref)
            local l_UserInputType_2 = v200.UserInputType;
            if l_UserInputType_2 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_2 ~= Enum.UserInputType.Touch then
                return;
            else
                v172 = false;
                for __, v203 in v171 do
                    v203:Disconnect();
                end;
                v171 = {};
                v190.Position = getRelativePosition(v190);
                local v204 = v190.AbsolutePosition.X .. "," .. v190.AbsolutePosition.Y;
                l_AppStorageService_0:SetItem("SelfViewPosition", v204);
                return;
            end;
        end);
        table.insert(v171, v205);
        local v208 = l_UserInputService_1.WindowFocusReleased:Connect(function() --[[ Line: 820 ]]
            -- upvalues: v171 (ref)
            for __, v207 in v171 do
                v207:Disconnect();
            end;
            v171 = {};
        end);
        table.insert(v171, v208);
        return;
    end;
end;
createCloneAnchor = function() --[[ Line: 827 ]] --[[ Name: createCloneAnchor ]]
    -- upvalues: v87 (ref), v83 (ref)
    if v87 ~= nil then
        v87:Destroy();
        v87 = nil;
    end;
    local l_WorldModel_0 = Instance.new("WorldModel");
    l_WorldModel_0.Parent = v83;
    v87 = l_WorldModel_0;
end;
connectToScreenOrientationChange = function() --[[ Line: 839 ]] --[[ Name: connectToScreenOrientationChange ]]
    -- upvalues: l_Players_0 (copy), v74 (ref), v93 (ref)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if not l_LocalPlayer_0 then
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    if not l_LocalPlayer_0 then
        return;
    else
        local l_PlayerGui_0 = l_LocalPlayer_0:FindFirstChildOfClass("PlayerGui");
        while not l_PlayerGui_0 do
            l_LocalPlayer_0.ChildAdded:wait();
            l_PlayerGui_0 = l_LocalPlayer_0:FindFirstChildOfClass("PlayerGui");
        end;
        v74 = l_PlayerGui_0:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function() --[[ Line: 857 ]]
            -- upvalues: v93 (ref)
            if v93 and v93.Parent then
                local l_AbsoluteSize_3 = v93.Parent.AbsoluteSize;
                local v214 = Vector3.new(v93.AbsolutePosition.X, v93.AbsolutePosition.Y, 0);
                v93.Position = constrainTargetPositionToScreen(v93, l_AbsoluteSize_3, v214);
                v93.Position = getRelativePosition(v93);
            end;
        end);
        return;
    end;
end;
clearObserver = function(v215) --[[ Line: 867 ]] --[[ Name: clearObserver ]]
    -- upvalues: v126 (copy)
    if v126[v215] then
        v126[v215]:Disconnect();
        v126[v215] = nil;
    end;
end;
local function __() --[[ Line: 874 ]] --[[ Name: clearAllObservers ]]
    -- upvalues: v126 (copy)
    for v216 in v126 do
        clearObserver(v216);
    end;
end;
clearCloneCharacter = function() --[[ Line: 880 ]] --[[ Name: clearCloneCharacter ]]
    -- upvalues: v88 (ref), v87 (ref)
    if v88 then
        v88:Destroy();
        v88 = nil;
    end;
    if v87 == nil then
        return;
    else
        local l_SelfAvatar_0 = v87:FindFirstChild("SelfAvatar");
        if l_SelfAvatar_0 then
            l_SelfAvatar_0:Destroy();
        end;
        createCloneAnchor();
        return;
    end;
end;
clearClone = function() --[[ Line: 898 ]] --[[ Name: clearClone ]]
    -- upvalues: v127 (copy), v69 (ref), v70 (ref), v71 (ref), v72 (ref), v73 (ref), v99 (ref), v82 (ref), v76 (ref), v77 (ref)
    debugPrint("Self View: clearClone()");
    stopRenderStepped();
    clearObserver(v127.AnimationPlayed);
    clearObserver(v127.AnimationPlayedCoreScript);
    if v69 then
        v69:Disconnect();
        v69 = nil;
    end;
    if v70 then
        v70:Disconnect();
        v70 = nil;
    end;
    if v71 then
        v71:Disconnect();
        v71 = nil;
    end;
    if v72 then
        v72:Disconnect();
        v72 = nil;
    end;
    if v73 then
        v73:Disconnect();
        v73 = nil;
    end;
    v99 = nil;
    v82 = nil;
    v76 = nil;
    v77 = {};
    clearCloneCharacter();
end;
clearViewportFrame = function() --[[ Line: 937 ]] --[[ Name: clearViewportFrame ]]
    -- upvalues: v83 (ref), v85 (ref)
    if v83 then
        v83:Destroy();
    end;
    if v85 then
        v85:Destroy();
    end;
end;
local function v221(v219) --[[ Line: 946 ]] --[[ Name: setIsOpen ]]
    -- upvalues: v98 (ref), l_Players_0 (copy), v89 (ref), v79 (ref), v80 (ref), v126 (copy), v127 (copy), v74 (ref), v97 (ref)
    debugPrint("Self View: setIsOpen(): " .. tostring(v219));
    v98 = v219;
    setSelfieViewDisplayInAppStorage(v219);
    if v98 then
        ReInit(l_Players_0.LocalPlayer);
        return;
    else
        v89 = nil;
        v79 = nil;
        v80 = nil;
        for v220 in v126 do
            clearObserver(v220);
        end;
        clearObserver(v127.CharacterAdded);
        clearObserver(v127.CharacterRemoving);
        clearClone();
        if v74 then
            v74:Disconnect();
            v74 = nil;
        end;
        prepMicAndCamPropertyChangedSignalHandler();
        v97.Visible = false;
        trackSelfViewSessionAsNeeded();
        clearViewportFrame();
        return;
    end;
end;
createViewportFrame = function() --[[ Line: 976 ]] --[[ Name: createViewportFrame ]]
    -- upvalues: v44 (copy), v8 (copy), v53 (copy), v108 (ref), l_default_0 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), v110 (ref), v107 (ref), v46 (copy), v109 (ref), v85 (ref), v93 (ref), v83 (ref), v35 (copy), v84 (ref)
    local v222 = 0;
    local v223 = UDim2.new(1, 0, 1, -35);
    if v44() and v8 then
        if v53() then
            v222 = v222 + 1;
        end;
    elseif v108 then
        v222 = v222 + 1;
    end;
    local l_voiceUIVisible_3 = l_default_0.voiceUIVisible;
    if if l_GetFFlagJoinWithoutMicPermissions_0() then l_voiceUIVisible_3 and v110 and (not l_default_0:VoiceChatEnded() or v107) else if v46() then l_voiceUIVisible_3 and v109 else l_voiceUIVisible_3 and v109 and not l_default_0:VoiceChatEnded() then
        v222 = v222 + 1;
    end;
    v223 = if v222 == 0 then UDim2.new(1, 0, 1, 0) else UDim2.new(1, 0, 1, -35);
    v85 = Instance.new("Frame");
    v85.Name = "SelfViewFrame";
    v85.Position = UDim2.new(0, 0, 0, 0);
    v85.Size = UDim2.new(1, 0, 1, 0);
    v85.BackgroundTransparency = 1;
    v85.Parent = v93;
    v83 = Instance.new("ViewportFrame");
    v83.Position = UDim2.new(0, 0, 0, 0);
    v83.Size = v223;
    v83.BackgroundColor3 = Color3.new(0, 0, 0);
    v83.BorderColor3 = Color3.new(0.6, 0.5, 0.4);
    v83.BorderSizePixel = 2;
    v83.BackgroundTransparency = 0.65;
    v83.Parent = v85;
    v83.Ambient = Color3.new(0.7529411765, 0.7098039216, 0.7137254902);
    v83.LightColor = Color3.new(1, 0.9960784314, 0.9960784314);
    v83.LightDirection = Vector3.new(9.5, -12, 7.5, 0);
    v83.BackgroundColor3 = Color3.new(0.0990616, 0.138109, 0.452827);
    v83.IsMirrored = true;
    Instance.new("UICorner").Parent = v85;
    Instance.new("UICorner").Parent = v83;
    l_voiceUIVisible_3 = Instance.new("UIStroke");
    l_voiceUIVisible_3.Parent = v85;
    l_voiceUIVisible_3.Thickness = 3;
    l_voiceUIVisible_3.Color = v35;
    l_voiceUIVisible_3 = Instance.new("UIStroke");
    l_voiceUIVisible_3.Parent = v83;
    l_voiceUIVisible_3.Thickness = 2.5;
    l_voiceUIVisible_3.Color = v35;
    v84 = Instance.new("Camera");
    v84.FieldOfView = 52.5;
    v83.CurrentCamera = v84;
    v84.Parent = v83;
    return v83;
end;
getViewportFrame = function() --[[ Line: 1046 ]] --[[ Name: getViewportFrame ]]
    -- upvalues: v83 (ref)
    if v83 then
        clearViewportFrame();
    end;
    v83 = createViewportFrame();
    return v83;
end;
local function v261() --[[ Line: 1054 ]] --[[ Name: createViewport ]]
    -- upvalues: v44 (copy), v8 (copy), v53 (copy), v108 (ref), l_default_0 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), v110 (ref), v107 (ref), v46 (copy), v109 (ref), v93 (ref), v60 (ref), v34 (copy), v33 (copy), v209 (copy), l_VRService_0 (copy), v106 (ref), l_MouseIconOverrideService_0 (copy), v19 (copy), l_AppStorageService_0 (copy), v94 (ref), v35 (copy), v29 (copy), v65 (ref), l_game_Service_0 (copy), v54 (copy), v38 (copy), l_default_1 (copy), v95 (ref), v58 (copy), v96 (ref), v57 (copy), v98 (ref), v97 (ref), v221 (copy), v52 (ref), v51 (copy), v49 (copy), v2 (ref), v1 (ref), v50 (copy), v48 (ref), v116 (ref), v37 (copy), v119 (ref), v120 (ref), l_SocialService_0 (copy), v74 (ref)
    local v225 = 0;
    if v44() and v8 then
        if v53() then
            v225 = v225 + 1;
        end;
    elseif v108 then
        v225 = v225 + 1;
    end;
    local l_voiceUIVisible_4 = l_default_0.voiceUIVisible;
    if if l_GetFFlagJoinWithoutMicPermissions_0() then l_voiceUIVisible_4 and v110 and (not l_default_0:VoiceChatEnded() or v107) else if v46() then l_voiceUIVisible_4 and v109 else l_voiceUIVisible_4 and v109 and not l_default_0:VoiceChatEnded() then
        v225 = v225 + 1;
    end;
    if v93 then
        v93:Destroy();
    end;
    v93 = Instance.new("Frame");
    v93.Name = "SelfView";
    v93.Parent = v60;
    v93.Active = true;
    v93.Size = v34;
    local l_v33_0 = v33;
    v93.BackgroundTransparency = 1;
    v93.InputBegan:Connect(function(v228) --[[ Line: 1086 ]]
        -- upvalues: v209 (ref), v93 (ref)
        v209(v93, v228);
    end);
    v93.MouseEnter:Connect(function() --[[ Line: 1090 ]]
        -- upvalues: l_VRService_0 (ref), v106 (ref), l_MouseIconOverrideService_0 (ref), v19 (ref)
        if not l_VRService_0.VREnabled then
            v106 = true;
            l_MouseIconOverrideService_0.push(v19, Enum.OverrideMouseIconBehavior.ForceShow);
        end;
    end);
    v93.MouseLeave:Connect(function() --[[ Line: 1093 ]]
        -- upvalues: v106 (ref), l_MouseIconOverrideService_0 (ref), v19 (ref)
        if v106 then
            v106 = false;
            l_MouseIconOverrideService_0.pop(v19);
        end;
    end);
    v93.Visible = false;
    l_voiceUIVisible_4 = Instance.new("UIAspectRatioConstraint");
    l_voiceUIVisible_4.Parent = v93;
    l_voiceUIVisible_4.AspectRatio = 0.833;
    l_voiceUIVisible_4.AspectType = "ScaleWithParentSize";
    l_voiceUIVisible_4.DominantAxis = "Width";
    local l_UISizeConstraint_0 = Instance.new("UISizeConstraint");
    l_UISizeConstraint_0.Parent = v93;
    l_UISizeConstraint_0.MaxSize = Vector2.new(140, 140);
    l_UISizeConstraint_0.MinSize = Vector2.new(95, 95);
    pcall(function() --[[ Line: 1113 ]]
        -- upvalues: l_AppStorageService_0 (ref), v93 (ref), l_v33_0 (ref)
        local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("SelfViewPosition");
        if l_l_AppStorageService_0_Item_0 then
            local v231 = string.split(l_l_AppStorageService_0_Item_0, ",");
            local v232 = UDim2.fromOffset(v231[1], v231[2]);
            v232 = {
                X = v231[1], 
                Y = v231[2]
            };
            local l_AbsoluteSize_4 = v93.Parent.AbsoluteSize;
            l_v33_0 = constrainTargetPositionToScreen(v93, l_AbsoluteSize_4, v232);
        end;
    end);
    v93.Position = l_v33_0;
    v93.Position = getRelativePosition(v93);
    local v234 = nil;
    local v235 = nil;
    local v236 = nil;
    local __ = nil;
    local v238 = nil;
    if v225 ~= 0 then
        v94 = Instance.new("Frame");
        v94.Name = "BottomButtonsFrame";
        v94.Position = UDim2.new(0, 0, 1, -35);
        v94.Size = UDim2.new(1, 0, 0, 36);
        v94.BackgroundColor3 = v35;
        v94.BackgroundTransparency = 0;
        v94.BorderSizePixel = 0;
        v94.Parent = v93;
        v234 = Instance.new("UIPadding");
        v234.Parent = v94;
        v234.PaddingBottom = UDim.new(0, 0);
        v234.PaddingLeft = UDim.new(0, 0);
        v234.PaddingRight = UDim.new(0, 0);
        v234.PaddingTop = UDim.new(0, 3);
        v235 = Instance.new("UIListLayout");
        v235.Parent = v94;
        v235.Padding = UDim.new(0, 5);
        v235.FillDirection = Enum.FillDirection.Horizontal;
        v235.HorizontalAlignment = Enum.HorizontalAlignment.Center;
        v235.VerticalAlignment = Enum.VerticalAlignment.Center;
        v235.SortOrder = Enum.SortOrder.LayoutOrder;
        local v239 = v225 == 2 and 0.5 or 1;
        v236 = Instance.new("ImageButton");
        v236.Name = "MicButton";
        v236.Parent = v94;
        v236.Position = UDim2.new(0, 0, 0, 0);
        v236.Size = UDim2.new(v239, -4, 1, -4);
        v236.Image = "rbxasset://textures/SelfView/whiteRect.png";
        v236.ImageColor3 = Color3.new(0.294117, 0.294117, 0.294117);
        v236.BackgroundTransparency = 1;
        v236.LayoutOrder = 0;
        v236.ZIndex = 2;
        local l_voiceUIVisible_5 = l_default_0.voiceUIVisible;
        v236.Visible = if l_GetFFlagJoinWithoutMicPermissions_0() then l_voiceUIVisible_5 and v110 and (not l_default_0:VoiceChatEnded() or v107) else if v46() then l_voiceUIVisible_5 and v109 else l_voiceUIVisible_5 and v109 and not l_default_0:VoiceChatEnded();
        v236.Activated:Connect(function() --[[ Line: 1172 ]]
            -- upvalues: l_default_0 (ref), v109 (ref), l_GetFFlagJoinWithoutMicPermissions_0 (ref), v110 (ref), v107 (ref), v46 (ref), v29 (ref), v65 (ref)
            local v241 = l_default_0:getService();
            debugPrint("Self View: micButton.Activated(), voiceService:" .. tostring(v241) .. ",hasMicPermissions:" .. tostring(v109));
            if v241 then
                local l_voiceUIVisible_6 = l_default_0.voiceUIVisible;
                if if l_GetFFlagJoinWithoutMicPermissions_0() then l_voiceUIVisible_6 and v110 and (not l_default_0:VoiceChatEnded() or v107) else if v46() then l_voiceUIVisible_6 and v109 else l_voiceUIVisible_6 and v109 and not l_default_0:VoiceChatEnded() then
                    if v107 then
                        l_default_0:ShowVoiceChatLoadingMessage();
                        return;
                    else
                        l_default_0:ToggleMic("LegacySelfView");
                        v29:setLastCtx("SelfView");
                        if v65 then
                            v65:onToggleMuteSelf(not l_default_0.localMuted);
                        end;
                    end;
                end;
            end;
        end);
        Instance.new("UICorner").Parent = v236;
        v238 = Instance.new("ImageButton");
        v238.Name = "CamButton";
        v238.Parent = v94;
        v238.Position = UDim2.new(0, 0, 0, 0);
        v238.Size = UDim2.new(v239, -4, 1, -4);
        v238.Image = "rbxasset://textures/SelfView/whiteRect.png";
        v238.ImageColor3 = Color3.new(0.294117, 0.294117, 0.294117);
        v238.BackgroundTransparency = 1;
        v238.LayoutOrder = 1;
        v238.ZIndex = 3;
        l_voiceUIVisible_5 = v108;
        if v44() then
            l_voiceUIVisible_5 = v53();
        end;
        v238.Visible = l_voiceUIVisible_5;
        v238.Activated:Connect(function() --[[ Line: 1212 ]]
            -- upvalues: v108 (ref), l_game_Service_0 (ref), v29 (ref), v44 (ref), v54 (ref), v38 (ref), l_default_1 (ref)
            debugPrint("Self View: camButton.Activated(), hasCameraPermissions:" .. tostring(v108));
            local function __() --[[ Line: 1214 ]]
                -- upvalues: l_game_Service_0 (ref), v29 (ref)
                if not l_game_Service_0 or not l_game_Service_0:IsStarted() then
                    updateVideoButton(false);
                    return;
                else
                    l_game_Service_0.VideoAnimationEnabled = not l_game_Service_0.VideoAnimationEnabled;
                    v29:setLastCtx("SelfView");
                    return;
                end;
            end;
            if v44() then
                if v108 then
                    if not l_game_Service_0 or not l_game_Service_0:IsStarted() then
                        updateVideoButton(false);
                        return;
                    else
                        l_game_Service_0.VideoAnimationEnabled = not l_game_Service_0.VideoAnimationEnabled;
                        v29:setLastCtx("SelfView");
                        return;
                    end;
                else
                    v38(function(v244) --[[ Line: 1229 ]]
                        -- upvalues: v108 (ref), l_game_Service_0 (ref), v29 (ref), v54 (ref)
                        v108 = v244.hasCameraPermissions;
                        if v244.hasCameraPermissions then
                            if not l_game_Service_0 or not l_game_Service_0:IsStarted() then
                                updateVideoButton(false);
                                return;
                            else
                                l_game_Service_0.VideoAnimationEnabled = not l_game_Service_0.VideoAnimationEnabled;
                                v29:setLastCtx("SelfView");
                                return;
                            end;
                        else
                            v54();
                            updateVideoButton(false);
                            return;
                        end;
                    end, {
                        l_default_1.Permissions.CAMERA_ACCESS
                    });
                    return;
                end;
            elseif v108 then
                if not l_game_Service_0 or not l_game_Service_0:IsStarted() then
                    updateVideoButton(false);
                    return;
                else
                    l_game_Service_0.VideoAnimationEnabled = not l_game_Service_0.VideoAnimationEnabled;
                    v29:setLastCtx("SelfView");
                    return;
                end;
            else
                updateVideoButton(false);
                return;
            end;
        end);
        Instance.new("UICorner").Parent = v238;
        v95 = Instance.new("ImageLabel");
        v95.Name = "MicIcon";
        v95.Parent = v236;
        v95.AnchorPoint = Vector2.new(0.5, 0.5);
        v95.Position = UDim2.new(0.5, 0, 0.5, 0);
        if v107 then
            v95.Size = UDim2.fromOffset(16, 20);
            v95.Image = l_default_0:GetIcon("Connecting", "New");
            v95.ImageRectOffset = Vector2.new(0, 0);
            v95.ImageRectSize = Vector2.new(0, 0);
        else
            v95.Size = UDim2.new(0, 32, 0, 32);
            v95.Image = v58.Image;
            v95.ImageRectOffset = v58.ImageRectOffset;
            v95.ImageRectSize = v58.ImageRectSize;
        end;
        v95.BackgroundTransparency = 1;
        v95.ZIndex = 2;
        v96 = Instance.new("ImageLabel");
        v96.Name = "CamIcon";
        v96.Parent = v238;
        v96.AnchorPoint = Vector2.new(0.5, 0.5);
        v96.Position = UDim2.new(0.5, 0, 0.5, 0);
        v96.Size = UDim2.new(0, 32, 0, 32);
        v96.Image = v57.Image;
        v96.ImageRectOffset = v57.ImageRectOffset;
        v96.ImageRectSize = v57.ImageRectSize;
        v96.BackgroundTransparency = 1;
        v96.ZIndex = 2;
    end;
    if v98 then
        getViewportFrame();
    end;
    v97 = Instance.new("ImageLabel");
    v97.Name = "IndicatorCircle";
    v97.Parent = v93;
    v97.Position = UDim2.new(1, -25, 0, 4);
    v97.Size = UDim2.new(0, 22, 0, 22);
    v97.Image = "rbxasset://textures/SelfView/SelfView_icon_indicator_off.png";
    v97.BackgroundTransparency = 1;
    v97.Visible = false;
    v97.ZIndex = 4;
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = "CloseButton";
    l_ImageButton_0.AnchorPoint = Vector2.new(0, 0.5);
    l_ImageButton_0.Parent = v93;
    l_ImageButton_0.Position = UDim2.fromOffset(0, 16);
    l_ImageButton_0.Size = UDim2.new(0, 34, 0, 34);
    l_ImageButton_0.Image = "rbxasset://textures/SelfView/whiteRect.png";
    l_ImageButton_0.ImageTransparency = 1;
    l_ImageButton_0.BackgroundTransparency = 1;
    l_ImageButton_0.BackgroundColor3 = Color3.new(0.137254, 0.137254, 0.137254);
    l_ImageButton_0.ZIndex = 2;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "CloseButtonIcon";
    l_ImageLabel_0.Parent = l_ImageButton_0;
    l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_ImageLabel_0.Position = UDim2.new(0, 17, 0, 17);
    l_ImageLabel_0.Size = UDim2.new(0, 32, 0, 32);
    l_ImageLabel_0.Image = "rbxasset://textures/SelfView/SelfView_icon_close.png";
    l_ImageLabel_0.ImageTransparency = 0;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.ZIndex = 2;
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.Name = "FaceIcon";
    l_ImageLabel_1.Parent = v93;
    l_ImageLabel_1.AnchorPoint = Vector2.new(0.5, 0.5);
    l_ImageLabel_1.Position = UDim2.new(0, 17, 0, 17);
    l_ImageLabel_1.Size = UDim2.new(0, 32, 0, 32);
    l_ImageLabel_1.Image = "rbxasset://textures/SelfView/SelfView_icon_faceToggle_on.png";
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.ZIndex = 2;
    l_ImageLabel_1.Visible = false;
    l_ImageLabel_1.Parent = l_ImageButton_0;
    local function __() --[[ Line: 1337 ]] --[[ Name: setButtonButtonsVisibility ]]
        -- upvalues: v98 (ref), v225 (ref), v236 (ref), v238 (ref), l_ImageButton_0 (copy)
        if v98 then
            if v225 ~= 0 then
                v236.Visible = true;
                v238.Visible = true;
            end;
            l_ImageButton_0.Visible = true;
            return;
        else
            if v225 ~= 0 then
                v236.Visible = false;
                v238.Visible = false;
            end;
            l_ImageButton_0.Visible = false;
            return;
        end;
    end;
    local function v256(v249, v250, v251) --[[ Line: 1364 ]] --[[ Name: showSelfView ]]
        -- upvalues: v221 (ref), v98 (ref), v225 (ref), v236 (ref), v238 (ref), l_ImageButton_0 (copy), v94 (ref), l_ImageLabel_0 (copy), l_ImageLabel_1 (copy), v97 (ref), v93 (ref), v52 (ref), v51 (ref), l_voiceUIVisible_4 (copy), l_UISizeConstraint_0 (copy), v49 (ref), l_AppStorageService_0 (ref), v2 (ref), v1 (ref), v50 (ref)
        v221(v249);
        if v98 then
            if v225 ~= 0 then
                v236.Visible = true;
                v238.Visible = true;
            end;
            l_ImageButton_0.Visible = true;
        else
            if v225 ~= 0 then
                v236.Visible = false;
                v238.Visible = false;
            end;
            l_ImageButton_0.Visible = false;
        end;
        if v225 ~= 0 then
            v94.Visible = v249;
        end;
        l_ImageLabel_0.Visible = v249;
        l_ImageLabel_1.Visible = not v249;
        l_ImageButton_0.BackgroundTransparency = v249 and 1 or 0.5;
        if v98 then
            if v225 ~= 0 then
                v236.Position = UDim2.new(0, 0, 0, 0);
                v236.Size = UDim2.new(0.5, -4, 1, -4);
                v236.ImageTransparency = 0;
                v238.Position = UDim2.new(0, 0, 0, 0);
                v238.Size = UDim2.new(0.5, -4, 1, -4);
                v238.ImageTransparency = 0;
            end;
            v97.Position = UDim2.new(1, -25, 0, 4);
            if v250 ~= nil then
                v93.Position = v250;
            end;
            if v251 ~= nil then
                v93.AnchorPoint = v251;
            end;
            v93.Active = true;
            v93.Visible = true;
            if shouldDisplaySelfViewTooltip("ShowSelfieViewOpenedTooltip") then
                v52 = v51({
                    fallbackText = "Use your camera to make your avatar smile and move just like you", 
                    translationKey = "Feature.Avatar.Message.FTUXSelfieViewOpenedTooltip", 
                    anchorPoint = v93.AnchorPoint, 
                    position = v93.Position, 
                    size = v93.Size, 
                    bottomButtonsFramePosition = v94.Position, 
                    bottomButtonsFrameSize = v94.Size, 
                    aspectRatio = l_voiceUIVisible_4.AspectRatio, 
                    maxSize = l_UISizeConstraint_0.MaxSize, 
                    minSize = l_UISizeConstraint_0.MinSize, 
                    tooltipLifetime = v49
                });
                pcall(function() --[[ Line: 1410 ]]
                    -- upvalues: l_AppStorageService_0 (ref)
                    l_AppStorageService_0:SetItem("ShowSelfieViewOpenedTooltip", "false");
                end);
            end;
        else
            if v225 ~= 0 then
                v236.Position = UDim2.new(0, 40, 0, -1);
                v236.Size = UDim2.new(0, 34, 0, 34);
                v236.ImageTransparency = 0.3;
                v238.Position = UDim2.new(0, 80, 0, -1);
                v238.Size = UDim2.new(0, 34, 0, 34);
                v238.ImageTransparency = 0.3;
            end;
            v97.Position = UDim2.new(0, 20, 0, -10);
            v93.Active = false;
            v93.Visible = false;
            if v2 then
                local v252 = nil;
                local l_v2_0 = v2;
                local l_v1_0 = v1;
                do
                    local l_v252_0 = v252;
                    l_v252_0 = v2.Stopped:Connect(function() --[[ Line: 1433 ]]
                        -- upvalues: l_v2_0 (copy), l_v1_0 (copy), l_v252_0 (ref)
                        l_v2_0:Destroy();
                        if l_v1_0 then
                            l_v1_0:Destroy();
                        end;
                        l_v252_0:Disconnect();
                    end);
                    v2:Stop(0);
                    v2 = nil;
                end;
            elseif v1 then
                v1:Destroy();
                v1 = nil;
            end;
            if shouldDisplaySelfViewTooltip("ShowSelfieViewClosedTooltip") then
                v50({
                    fallbackText = "You can find your camera and self-view controls here", 
                    translationKey = "Feature.Avatar.Message.FTUXSelfieViewClosedTooltip", 
                    tooltipLifetime = v49
                });
                pcall(function() --[[ Line: 1456 ]]
                    -- upvalues: l_AppStorageService_0 (ref)
                    l_AppStorageService_0:SetItem("ShowSelfieViewClosedTooltip", "false");
                end);
            end;
        end;
        if v225 ~= 0 then
            v94.Visible = v98;
        end;
    end;
    v48 = v256;
    l_ImageButton_0.Activated:Connect(function() --[[ Line: 1469 ]]
        -- upvalues: v256 (copy), v98 (ref)
        v256(not v98);
    end);
    if v116 then
        v116:disconnect();
    end;
    v116 = v37:connect(function() --[[ Line: 1476 ]]
        -- upvalues: v256 (copy), v98 (ref)
        v256(not v98);
    end);
    if v119 then
        v119:Disconnect();
        v119 = nil;
    end;
    if v120 then
        v120:Disconnect();
        v120 = nil;
    end;
    v119 = l_SocialService_0.SelfViewVisible:Connect(function(v257) --[[ Line: 1488 ]]
        -- upvalues: v98 (ref), v256 (copy), v93 (ref), l_AppStorageService_0 (ref)
        if not v98 then
            local v258 = nil;
            local v259 = nil;
            if v257 == Enum.SelfViewPosition.TopLeft then
                v258 = UDim2.new(0, 24, 0, 24);
                v259 = Vector2.new(0, 0);
            elseif v257 == Enum.SelfViewPosition.TopRight then
                v258 = UDim2.new(1, -24, 0, 24);
                v259 = Vector2.new(1, 0);
            elseif v257 == Enum.SelfViewPosition.BottomLeft then
                v258 = UDim2.new(0, 24, 1, -24);
                v259 = Vector2.new(0, 1);
            elseif v257 == Enum.SelfViewPosition.BottomRight then
                v258 = UDim2.new(1, -24, 1, -24);
                v259 = Vector2.new(1, 1);
            end;
            v256(true, v258, v259);
            if v258 ~= nil then
                local v260 = v93.AbsolutePosition.X .. "," .. v93.AbsolutePosition.Y;
                l_AppStorageService_0:SetItem("SelfViewPosition", v260);
            end;
        end;
    end);
    v120 = l_SocialService_0.SelfViewHidden:Connect(function() --[[ Line: 1514 ]]
        -- upvalues: v98 (ref), v46 (ref), v52 (ref), v256 (copy)
        if v98 then
            if v46() and v52 then
                v52.unmount();
                v52 = nil;
            end;
            v256(false);
        end;
    end);
    Instance.new("UICorner").Parent = l_ImageButton_0;
    createCloneAnchor();
    if not v74 then
        connectToScreenOrientationChange();
    end;
end;
toggleIndicator = function(v262) --[[ Line: 1536 ]] --[[ Name: toggleIndicator ]]
    -- upvalues: v109 (ref), v108 (ref), v97 (ref), l_default_0 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), v110 (ref), v107 (ref), v46 (copy), v94 (ref)
    local v263 = false;
    debugPrint("Self View: toggleIndicator(), mode: " .. tostring(v262) .. ",hasMicPermissions:" .. tostring(v109) .. ",hasCameraPermissions:" .. tostring(v108));
    if v97 then
        local l_v97_0 = v97;
        local v265;
        if v262 == Enum.TrackerMode.Audio or v262 == Enum.TrackerMode.AudioVideo then
            local l_voiceUIVisible_7 = l_default_0.voiceUIVisible;
            if (if l_GetFFlagJoinWithoutMicPermissions_0() then l_voiceUIVisible_7 and v110 and (not l_default_0:VoiceChatEnded() or v107) else if v46() then l_voiceUIVisible_7 and v109 else l_voiceUIVisible_7 and v109 and not l_default_0:VoiceChatEnded()) and v94 then
                v265 = v94.Visible;
                v263 = v265;
            end;
        end;
        if not v263 then
            v265 = (not (v262 ~= Enum.TrackerMode.Video) or v262 == Enum.TrackerMode.AudioVideo) and v108 and v94 and v94.Visible;
        end;
        v263 = false;
        l_v97_0.Visible = v265;
        if v262 == Enum.TrackerMode.AudioVideo or v262 == Enum.TrackerMode.Audio then
            v97.Image = "rbxasset://textures/SelfView/SelfView_icon_indicator_on.png";
            return;
        else
            v97.Image = "rbxasset://textures/SelfView/SelfView_icon_indicator_off.png";
        end;
    end;
end;
showNoDynamicHeadInfoIfNeeded = function() --[[ Line: 1564 ]] --[[ Name: showNoDynamicHeadInfoIfNeeded ]]
    -- upvalues: v117 (ref), v118 (ref), v31 (copy), v32 (copy)
    if v117 then
        return;
    else
        if v118 == false then
            v117 = true;
            v31:showPrompt(v32.NoDynamicHeadEquipped);
        end;
        return;
    end;
end;
updateVideoButton = function(v267) --[[ Line: 1575 ]] --[[ Name: updateVideoButton ]]
    -- upvalues: v96 (ref), v56 (copy), v57 (copy)
    if v267 then
        if v96 then
            v96.Image = v56.Image;
            v96.ImageRectOffset = v56.ImageRectOffset;
            v96.ImageRectSize = v56.ImageRectSize;
        end;
        showNoDynamicHeadInfoIfNeeded();
        return;
    else
        if v96 then
            v96.Image = v57.Image;
            v96.ImageRectOffset = v57.ImageRectOffset;
            v96.ImageRectSize = v57.ImageRectSize;
        end;
        return;
    end;
end;
local function v271() --[[ Line: 1592 ]]
    -- upvalues: v81 (ref), l_game_Service_0 (copy), v30 (copy), v82 (ref), v108 (ref), v99 (ref), v113 (ref), v114 (ref), v109 (ref), v115 (ref), v29 (copy)
    v81 = Enum.TrackerMode.None;
    if l_game_Service_0.AudioAnimationEnabled and not l_game_Service_0.VideoAnimationEnabled then
        v81 = Enum.TrackerMode.Audio;
    elseif not l_game_Service_0.AudioAnimationEnabled and l_game_Service_0.VideoAnimationEnabled and l_game_Service_0:IsStarted() then
        v81 = Enum.TrackerMode.Video;
    elseif l_game_Service_0.AudioAnimationEnabled and l_game_Service_0.VideoAnimationEnabled and l_game_Service_0:IsStarted() then
        v81 = Enum.TrackerMode.AudioVideo;
    end;
    v30:trace("Self View: onUpdateTrackerMode(), currentTrackerMode: " .. tostring(v81) .. ",cachedMode:" .. tostring(v82));
    updateVideoButton((not (v81 ~= Enum.TrackerMode.AudioVideo) or v81 == Enum.TrackerMode.Video) and v108);
    toggleIndicator(v81);
    local v268 = false;
    local v269 = false;
    if not v99 and v82 == Enum.TrackerMode.None and v81 ~= Enum.TrackerMode.None then
        setCloneDirty(true);
    end;
    if v113 ~= v108 or v114 ~= v109 then
        debugPrint("Self View: cachedHasCameraPermissions ~= hasCameraPermissions or cachedHasMicPermissions ~= hasMicPermissions");
        if v113 ~= v108 then
            v268 = true;
        end;
        debugPrint("Self View: permissions changed, triggering clone refresh in case we get a streamtrack");
        setCloneDirty(true);
    end;
    if v82 ~= v81 then
        v269 = true;
    end;
    if v269 or v268 then
        local v270 = false;
        if v108 and (v81 == Enum.TrackerMode.Video or v81 == Enum.TrackerMode.AudioVideo) then
            v270 = true;
        end;
        if not v108 or v81 ~= Enum.TrackerMode.Video and v81 ~= Enum.TrackerMode.AudioVideo then
            v270 = false;
        end;
        if v270 ~= v115 then
            v29:reportCamState(v270);
            v115 = v270;
        end;
    end;
    v113 = v108;
    v114 = v109;
    v82 = v81;
end;
local function v275(v272, v273) --[[ Line: 1676 ]] --[[ Name: syncTrack ]]
    -- upvalues: v98 (ref), v83 (ref), v1 (ref), v2 (ref), l_Players_0 (copy), v99 (ref), v68 (copy)
    if not v98 or v83 == nil then
        return;
    elseif not v272 or not v273.Animation then
        return;
    else
        local v274 = nil;
        if not v273.Animation:IsA("Animation") then
            if v273.Animation:IsA("TrackerStreamAnimation") then
                v1 = Instance.new("TrackerStreamAnimation");
                if game:GetEngineFeature("UseNewLoadStreamAnimationAPI") then
                    v2 = v272:LoadStreamAnimationV2(v1, l_Players_0.LocalPlayer, false, false);
                else
                    v2 = v272:LoadStreamAnimationForSelfieView_deprecated(v1, l_Players_0.LocalPlayer);
                end;
                v274 = v2;
                v99 = true;
                debugPrint("foundStreamTrack = true");
            else
                warn("No animation to clone in SelfView");
            end;
        end;
        if v274 then
            v274:Play();
            v274.Priority = v273.Priority;
            v68[v273] = v273.Stopped:Connect(function() --[[ Line: 1712 ]]
                -- upvalues: v274 (ref), v68 (ref), v273 (copy)
                v274:Stop(0);
                if v68[v273] then
                    v68[v273]:Disconnect();
                end;
            end);
        end;
        return;
    end;
end;
getFaceControls = function(v276) --[[ Line: 1722 ]] --[[ Name: getFaceControls ]]
    if v276 == nil then
        return;
    else
        return v276:FindFirstChildWhichIsA("FaceControls", true);
    end;
end;
getNeck = function(v277, v278) --[[ Line: 1729 ]] --[[ Name: getNeck ]]
    if v277 == nil or v278 == nil then
        return nil;
    else
        local l_v277_Descendants_0 = v277:GetDescendants();
        debugPrint("Self VIew: getNeck()");
        for __, v281 in l_v277_Descendants_0 do
            if v281:IsA("Motor6D") and (v281.Part1 == v278 or v281.Name == "Neck") then
                return v281;
            end;
        end;
        for __, v283 in l_v277_Descendants_0 do
            if v283:IsA("AnimationConstraint") and v283.Parent == v278 and (v283.Attachment0.Name == "NeckRigAttachment" or v283.Name == "Neck") then
                return v283;
            end;
        end;
        return nil;
    end;
end;
findObjectOfNameAndTypeName = function(v284, v285, v286) --[[ Line: 1755 ]] --[[ Name: findObjectOfNameAndTypeName ]]
    if v286 == nil then
        return nil;
    else
        for __, v288 in (v286:GetDescendants()) do
            if v288:IsA(v285) and v288.Name == v284 then
                return v288;
            end;
        end;
        return;
    end;
end;
getHead = function(v289) --[[ Line: 1767 ]] --[[ Name: getHead ]]
    if not v289 then
        return nil;
    else
        local v290 = nil;
        local v291 = getFaceControls(v289);
        if v291 ~= nil and v291.Parent and (v291.Parent.ClassName == "MeshPart" or v291.Parent.ClassName == "Part") then
            v290 = v291.Parent;
        end;
        if not v290 then
            v290 = findObjectOfNameAndTypeName("Head", "MeshPart", v289) or findObjectOfNameAndTypeName("Head", "Part", v289);
        end;
        debugPrint("Self View: fn getHead(), head: " .. tostring(v290));
        return v290;
    end;
end;
getAnimator = function(v292, v293) --[[ Line: 1802 ]] --[[ Name: getAnimator ]]
    if v292 == nil then
        return nil;
    else
        local v294 = nil;
        local v295 = nil;
        if v293 > 0 then
            local v296 = v292:WaitForChild("Humanoid", v293);
            v295 = if v296 then if v296:IsA("Humanoid") then v296 else v292:FindFirstChildWhichIsA("Humanoid") else v292:FindFirstChildWhichIsA("Humanoid");
        else
            v295 = v292:FindFirstChildWhichIsA("Humanoid");
        end;
        if v295 ~= nil then
            v294 = if v293 > 0 then v295:WaitForChild("Animator", v293) else v295:FindFirstChild("Animator");
        end;
        if v294 == nil then
            v294 = v292:FindFirstChildWhichIsA("Animator", true);
        end;
        return v294;
    end;
end;
local function v297(v298) --[[ Line: 1841 ]] --[[ Name: disableScripts ]]
    -- upvalues: v297 (copy)
    for __, v300 in v298:GetChildren() do
        if v300:IsA("Script") then
            v300.Disabled = true;
            v300.Parent = nil;
        end;
        v297(v300);
    end;
end;
local function v301(v302) --[[ Line: 1852 ]] --[[ Name: removeUI ]]
    -- upvalues: v301 (copy)
    for __, v304 in v302:GetChildren() do
        if v304:IsA("GuiObject") or v304:IsA("ScreenGui") or v304:IsA("BillboardGui") or v304:IsA("AdGui") or v304:IsA("SurfaceGui") then
            v304.Parent = nil;
        end;
        v301(v304);
    end;
end;
local function v305(v306) --[[ Line: 1868 ]] --[[ Name: removeInstancesStrict ]]
    -- upvalues: v124 (copy), v305 (copy)
    for __, v308 in v306:GetChildren() do
        if not v124[v308.ClassName] then
            v308.Parent = nil;
        end;
        v305(v308);
    end;
end;
local function __(v309) --[[ Line: 1879 ]] --[[ Name: sanitize ]]
    -- upvalues: v305 (copy)
    if not v309 then
        return;
    else
        v305(v309);
        return;
    end;
end;
removeTagsFromSelfViewClone = function(v311) --[[ Line: 1887 ]] --[[ Name: removeTagsFromSelfViewClone ]]
    -- upvalues: l_CollectionService_0 (copy)
    if v311 == nil then
        return;
    else
        local l_l_CollectionService_0_Tags_0 = l_CollectionService_0:GetTags(v311);
        for __, v314 in ipairs(l_l_CollectionService_0_Tags_0) do
            if v314 ~= "NoFace" then
                l_CollectionService_0:RemoveTag(v311, v314);
            end;
        end;
        for __, v316 in ipairs(v311:GetDescendants()) do
            local l_l_CollectionService_0_Tags_1 = l_CollectionService_0:GetTags(v316);
            for __, v319 in ipairs(l_l_CollectionService_0_Tags_1) do
                if v319 ~= "NoFace" then
                    l_CollectionService_0:RemoveTag(v316, v319);
                end;
            end;
        end;
        return;
    end;
end;
local function v349(v320) --[[ Line: 1911 ]] --[[ Name: updateClone ]]
    -- upvalues: v100 (ref), v88 (ref), v121 (copy), v122 (copy), l_CollectionService_0 (copy), v305 (copy), v87 (ref), l_CFrameUtility_0 (copy), l_CharacterUtility_0 (copy), v86 (ref), v61 (ref), v90 (ref), v91 (ref), v92 (ref), v84 (ref), v76 (ref), l_game_EngineFeature_0 (copy), v1 (ref), v275 (copy), v126 (copy), v127 (copy)
    debugPrint("Self View: updateClone()");
    clearClone();
    v100 = false;
    if not v320 then
        return;
    else
        startRenderStepped(v320);
        if not v320 or not v320.Character then
            return;
        else
            local v321 = v320.Character or v320.CharacterAdded:Wait();
            if not v321 then
                return;
            else
                debugPrint("Self View: updateClone(): character:" .. tostring(v321));
                local v322 = getAnimator(v321, 10);
                clearCloneCharacter();
                local l_Archivable_0 = v321.Archivable;
                v321.Archivable = true;
                local v324 = getHead(v321);
                v88 = v321:Clone();
                if v88 == nil then
                    return;
                else
                    for __, v326 in ipairs(v88:GetDescendants()) do
                        if v326:IsA("Motor6D") then
                            v326.C0 = CFrame.new(v326.C0.Position);
                            v326.C1 = CFrame.new(v326.C1.Position);
                        end;
                    end;
                    for __, v328 in ipairs(v88:GetDescendants()) do
                        if v328:IsA("Decal") then
                            v328.Transparency = 0;
                        elseif v328:IsA("MeshPart") then
                            if v328.Parent and v328.Parent:IsA("Accessory") or table.find(v121, v328.Name) then
                                if not table.find(v122, v328.MeshId) then
                                    v122[v328.MeshId] = v328.Transparency;
                                else
                                    v328.Transparency = v122[v328.MeshId];
                                end;
                            end;
                        elseif v328:IsA("Part") then
                            if v328.Parent and v328.Parent:IsA("Accessory") or table.find(v121, v328.Name) then
                                v328.Transparency = 0;
                            end;
                            if l_CollectionService_0:HasTag(v328, "__RBX__LOCKED_TRANSPARENT") then
                                v328.Transparency = 1;
                            end;
                        end;
                    end;
                    removeTagsFromSelfViewClone(v88);
                    v88.Name = "SelfAvatar";
                    local l_Animate_0 = v88:FindFirstChild("Animate");
                    if l_Animate_0 then
                        l_Animate_0:Destroy();
                    end;
                    l_Animate_0 = v88:FindFirstChild("Health");
                    if l_Animate_0 then
                        l_Animate_0:Destroy();
                    end;
                    local l_v88_0 = v88;
                    if l_v88_0 then
                        v305(l_v88_0);
                    end;
                    for __, v332 in pairs(v88:GetDescendants()) do
                        if v332:IsA("BaseScript") then
                            v332:Destroy();
                        end;
                    end;
                    v321.Archivable = l_Archivable_0;
                    if v88 == nil then
                        debugPrint("Self View: updateClone: no clone could be created");
                        return;
                    else
                        v88.Parent = v87;
                        v100 = true;
                        l_v88_0 = v88:FindFirstChild("HumanoidRootPart");
                        if l_v88_0 then
                            debugPrint("Self View: cloneRootPart: " .. l_v88_0.Name);
                            l_v88_0.CFrame = CFrame.new((Vector3.new(0, 0, 0, 0)));
                            if v324 then
                                l_Animate_0 = getHead(v88);
                                if l_Animate_0 then
                                    local v333 = l_CFrameUtility_0.CalculateTargetCFrame(l_Animate_0.CFrame);
                                    local v334, v335 = l_CharacterUtility_0.CalculateHeadExtents(v88, v333);
                                    local v336 = Vector3.new(v334.X, v334.Y, v334.Z);
                                    v86 = Vector3.new(v335.X, v335.Y, v335.Z) - v336;
                                    v61 = l_Animate_0.Size.Y;
                                    local v337 = math.min(v86.X, v86.Y);
                                    v337 = math.min(v86.X, v86.Z);
                                    local l_Model_0 = Instance.new("Model");
                                    l_Model_0.Parent = v88;
                                    v321.Archivable = true;
                                    v90 = l_Animate_0:Clone();
                                    v90.CanCollide = false;
                                    v90.Parent = l_Model_0;
                                    v91 = getNeck(v88, v90);
                                    v92 = v90.CFrame;
                                    v90:Destroy();
                                    local v339 = v92.Position + v92.LookVector * (v337 * 2);
                                    v84.CFrame = CFrame.lookAt(v339 + Vector3.new(0, 0.10499999672174454, -0.25, 0), v92.Position);
                                    v84.Focus = v92;
                                    v321.Archivable = l_Archivable_0;
                                    l_Model_0:Destroy();
                                end;
                            else
                                l_Animate_0 = l_v88_0.Position + l_v88_0.CFrame.LookVector * 2.5;
                                v84.CFrame = CFrame.lookAt(l_Animate_0 + Vector3.new(0, 1.5, 0, 0), l_v88_0.Position);
                                v84.CFrame = CFrame.new(v84.CFrame.Position) * CFrame.Angles(-6.981317007977319E-4, 3.141592653589793, 0);
                            end;
                        end;
                        if v88 == nil then
                            debugPrint("Self View: updateClone: no clone could be created");
                            return;
                        else
                            debugPrint("Self View: clone:" .. tostring(v88));
                            l_Animate_0 = nil;
                            l_Animate_0 = v88:FindFirstChildWhichIsA("Humanoid");
                            if l_Animate_0 then
                                l_Animate_0.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
                            end;
                            v76 = getAnimator(v88, 0);
                            if v76 then
                                if not l_game_EngineFeature_0 then
                                    local l_v76_PlayingAnimationTracks_0 = v76:GetPlayingAnimationTracks();
                                    local l_v76_PlayingAnimationTracksCoreScript_0 = v76:GetPlayingAnimationTracksCoreScript();
                                    for __, v343 in ipairs(l_v76_PlayingAnimationTracks_0) do
                                        if v343 ~= nil then
                                            v343:Stop(0);
                                            v343:Destroy();
                                        end;
                                    end;
                                    for __, v345 in ipairs(l_v76_PlayingAnimationTracksCoreScript_0) do
                                        if v345 ~= nil then
                                            v345:Stop(0);
                                            v345:Destroy();
                                        end;
                                    end;
                                    if v1 then
                                        v1:Destroy();
                                        v1 = nil;
                                    end;
                                end;
                                if v322 then
                                    if l_game_EngineFeature_0 then
                                        v76:SynchronizeWith(v322);
                                    else
                                        for __, v347 in ipairs(v322:GetPlayingAnimationTracksCoreScript()) do
                                            v275(v76, v347);
                                        end;
                                        v126[v127.AnimationPlayedCoreScript] = v322.AnimationPlayedCoreScript:Connect(function(v348) --[[ Line: 2131 ]]
                                            -- upvalues: v275 (ref), v76 (ref)
                                            v275(v76, v348);
                                        end);
                                    end;
                                    v100 = true;
                                    setCloneDirty(false);
                                    return;
                                else
                                    debugPrint("Self View: updateClone: no animator (original)!");
                                    return;
                                end;
                            else
                                debugPrint("Self View: updateClone: cloneAnimator is NIL");
                                return;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
local __ = function(v350, v351) --[[ Line: 2151 ]] --[[ Name: hasProperty ]]
    local __ = v350[v351];
end;
updateCachedHeadColor = function(v354) --[[ Line: 2155 ]] --[[ Name: updateCachedHeadColor ]]
    -- upvalues: v79 (ref), v80 (ref)
    if v354 == nil then
        return;
    else
        if pcall(function() --[[ Line: 2160 ]]
            -- upvalues: v354 (copy)
            local __ = v354.Color;
        end) then
            v79 = v354.Color;
            if pcall(function() --[[ Line: 2166 ]]
                -- upvalues: v354 (copy)
                local __ = v354.Size;
            end) then
                v80 = v354.Size;
            end;
        end;
        return;
    end;
end;
addHumanoidStateChangedObserver = function(v357) --[[ Line: 2176 ]] --[[ Name: addHumanoidStateChangedObserver ]]
    -- upvalues: v126 (copy), v127 (copy)
    if not v357 then
        return;
    else
        if not v126[v127.HumanoidStateChanged] then
            v126[v127.HumanoidStateChanged] = v357.StateChanged:Connect(function(v358, v359) --[[ Line: 2181 ]]
                if v358 == Enum.HumanoidStateType.PlatformStanding and v359 == Enum.HumanoidStateType.Running then
                    setCloneDirty(true);
                end;
                if v359 == Enum.HumanoidStateType.GettingUp then
                    setCloneDirty(true);
                end;
            end);
        end;
        return;
    end;
end;
local function v364(v360) --[[ Line: 2194 ]] --[[ Name: characterAdded ]]
    -- upvalues: v98 (ref), v83 (ref), v89 (ref), v127 (copy), v126 (copy), v117 (ref), v118 (ref), v125 (copy)
    if not v98 or v83 == nil then
        return;
    else
        v89 = getHead(v360);
        updateCachedHeadColor(v89);
        clearObserver(v127.DescendantAdded);
        clearObserver(v127.DescendantRemoving);
        clearObserver(v127.HeadSize);
        clearObserver(v127.Color);
        local v361 = nil;
        v361 = v360:FindFirstChildWhichIsA("Humanoid");
        if v361 then
            addHumanoidStateChangedObserver(v361);
        end;
        v126[v127.DescendantAdded] = v360.DescendantAdded:Connect(function(v362) --[[ Line: 2214 ]]
            -- upvalues: v98 (ref), v83 (ref), v89 (ref), v360 (copy), v117 (ref), v118 (ref), v125 (ref)
            if not v98 or v83 == nil then
                return;
            else
                if v362.Name == "Head" then
                    v89 = getHead(v360);
                    updateCachedHeadColor(v89);
                    if not v117 and v362:IsA("MeshPart") then
                        if v362:WaitForChild("FaceControls", 0.5) == nil then
                            v118 = false;
                        else
                            v118 = true;
                        end;
                    end;
                end;
                if v362:IsA("Humanoid") then
                    addHumanoidStateChangedObserver(v362);
                end;
                if v362:IsA("MeshPart") or v362:IsA("Part") or v362:IsA("Decal") then
                    if v362.Transparency < 1 then
                        setCloneDirty(true);
                        return;
                    end;
                elseif v125[v362.ClassName] then
                    setCloneDirty(true);
                end;
                return;
            end;
        end);
        v126[v127.DescendantRemoving] = v360.DescendantRemoving:Connect(function(v363) --[[ Line: 2251 ]]
            -- upvalues: v98 (ref), v83 (ref), v125 (ref)
            if not v98 or v83 == nil then
                return;
            else
                if v363 and (v363:IsA("MeshPart") or v363:IsA("Accessory")) and v363:IsA("MeshPart") then
                    debugPrint("MeshId:" .. tostring(v363.MeshId));
                    if v363.MeshId == "" then
                        return;
                    end;
                end;
                if v363:IsA("MeshPart") or v363:IsA("Part") or v363:IsA("Decal") then
                    if v363.Transparency < 1 then
                        setCloneDirty(true);
                        return;
                    end;
                elseif v125[v363.ClassName] then
                    setCloneDirty(true);
                end;
                return;
            end;
        end);
        setCloneDirty(true);
        return;
    end;
end;
connectToVoiceJoinProgressChanged = function() --[[ Line: 2279 ]] --[[ Name: connectToVoiceJoinProgressChanged ]]
    -- upvalues: v9 (copy), v75 (ref), l_default_0 (copy), v26 (copy)
    if v9 and not v75 then
        v75 = l_default_0.VoiceJoinProgressChanged.Event:Connect(function(v365) --[[ Line: 2282 ]]
            -- upvalues: v26 (ref)
            if v365 == v26.VOICE_JOIN_PROGRESS.Joined then
                initVoiceChatServiceManager();
            end;
        end);
    end;
end;
ReInit = function(v366) --[[ Line: 2291 ]] --[[ Name: ReInit ]]
    -- upvalues: v100 (ref), v89 (ref), v127 (copy), v261 (copy)
    debugPrint("Self View: ReInit()");
    v100 = false;
    v89 = getHead(v366.Character);
    updateCachedHeadColor(v89);
    setCloneDirty(false);
    clearObserver(v127.CharacterAdded);
    clearObserver(v127.CharacterRemoving);
    clearClone();
    v261();
    playerAdded(v366);
    startRenderStepped(v366);
    connectToVoiceJoinProgressChanged();
end;
local function v369(v367) --[[ Line: 2307 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v67 (ref), l_Players_0 (copy), v127 (copy)
    v67:Disconnect();
    ReInit(l_Players_0.LocalPlayer);
    clearObserver(v127.HumanoidStateChanged);
    local v368 = nil;
    v368 = v367:FindFirstChildWhichIsA("Humanoid");
    if v368 then
        addHumanoidStateChangedObserver(v368);
    end;
end;
playerAdded = function(v370) --[[ Line: 2323 ]] --[[ Name: playerAdded ]]
    -- upvalues: l_Players_0 (copy), v67 (ref), v127 (copy), v369 (copy), v364 (copy), v126 (copy), v100 (ref)
    if v370 ~= nil and v370 == l_Players_0.LocalPlayer then
        debugPrint("Self View: playerAdded()");
        if v67 ~= nil then
            v67:Disconnect();
            v67 = nil;
            clearObserver(v127.CharacterAdded);
        end;
        local v371 = v370.Character or v370.CharacterAdded:Wait();
        v67 = v370.CharacterAdded:Connect(v369);
        v364(v371);
        v126[v127.CharacterAdded] = v370.CharacterAdded:Connect(v364);
        v126[v127.CharacterRemoving] = v370.CharacterRemoving:Connect(function() --[[ Line: 2341 ]]
            -- upvalues: v127 (ref), v100 (ref)
            clearObserver(v127.DescendantAdded);
            clearObserver(v127.DescendantRemoving);
            clearObserver(v127.HeadSize);
            clearObserver(v127.Color);
            debugPrint("Self View: updateClone()");
            clearClone();
            v100 = false;
            clearObserver(v127.CharacterRemoving);
        end);
    end;
end;
stopRenderStepped = function() --[[ Line: 2352 ]] --[[ Name: stopRenderStepped ]]
    -- upvalues: v66 (ref)
    if v66 then
        v66:Disconnect();
        v66 = nil;
    end;
end;
updateClonePartsColor = function(v372) --[[ Line: 2359 ]] --[[ Name: updateClonePartsColor ]]
    -- upvalues: v89 (ref), v79 (ref), l_Players_0 (copy), v88 (ref)
    if pcall(function() --[[ Line: 2360 ]]
        -- upvalues: v89 (ref)
        local __ = v89.Color;
    end) and v89.Color ~= v79 then
        local l_Character_0 = l_Players_0.LocalPlayer.Character;
        if not l_Character_0 then
            return;
        elseif not v88 then
            return;
        else
            for __, v376 in pairs(l_Character_0:GetChildren()) do
                if v376:IsA("MeshPart") then
                    local l_v88_FirstChild_0 = v88:FindFirstChild(v376.Name);
                    if l_v88_FirstChild_0 and l_v88_FirstChild_0:IsA("MeshPart") and l_v88_FirstChild_0.Color and v376.Color then
                        l_v88_FirstChild_0.Color = v376.Color;
                    end;
                end;
            end;
        end;
    end;
    v79 = v372;
end;
prepMicAndCamPropertyChangedSignalHandler = function() --[[ Line: 2390 ]] --[[ Name: prepMicAndCamPropertyChangedSignalHandler ]]
    -- upvalues: v69 (ref), l_game_Service_0 (copy), v271 (copy), v70 (ref), v71 (ref), l_game_Service_1 (copy), v72 (ref), v73 (ref)
    debugPrint("Self View: prepMicAndCamPropertyChangedSignalHandler()");
    if not v69 then
        v69 = l_game_Service_0:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function() --[[ Line: 2395 ]]
            -- upvalues: v271 (ref)
            v271();
        end);
    end;
    if not v70 then
        v70 = l_game_Service_0:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(function() --[[ Line: 2403 ]]
            -- upvalues: v271 (ref)
            v271();
        end);
    end;
    if not v71 then
        v71 = l_game_Service_1.Started:Connect(function() --[[ Line: 2409 ]]
            -- upvalues: v271 (ref)
            debugPrint("Self View: VideoCaptureService.Started event");
            getPermissions();
            v271();
        end);
    end;
    if not v72 then
        v72 = l_game_Service_1.Stopped:Connect(function() --[[ Line: 2417 ]]
            -- upvalues: v271 (ref)
            debugPrint("Self View: VideoCaptureService.Stopped event");
            getPermissions();
            v271();
        end);
    end;
    if not v73 then
        v73 = l_game_Service_1.DevicesChanged:Connect(function() --[[ Line: 2425 ]]
            -- upvalues: v271 (ref)
            getPermissions();
            v271();
        end);
    end;
end;
trackSelfViewSessionAsNeeded = function() --[[ Line: 2432 ]] --[[ Name: trackSelfViewSessionAsNeeded ]]
    -- upvalues: v93 (ref), v104 (ref), v98 (ref), v105 (ref)
    if v93 then
        v104 = v93.Visible and v98;
        if v104 and v105 ~= v104 then
            startSelfViewSession();
        end;
        if not v104 and v105 ~= v104 then
            stopSelfViewSession();
        end;
        v105 = v104;
    end;
end;
frameShouldBeVisible = function(v378, v379) --[[ Line: 2445 ]] --[[ Name: frameShouldBeVisible ]]
    -- upvalues: v98 (ref), v101 (ref)
    if not v98 then
        return false;
    elseif not getShouldBeEnabledCoreGuiSetting() then
        return false;
    elseif v379 then
        return true;
    else
        if v101 == nil then
            v101 = 0;
        end;
        v101 = v101 + v378;
        debugPrint("Self View: noUsableCloneOffset: " .. tostring(v101));
        if v101 > 5 then
            v101 = nil;
            return false;
        else
            return true;
        end;
    end;
end;
startRenderStepped = function(v380) --[[ Line: 2479 ]] --[[ Name: startRenderStepped ]]
    -- upvalues: v271 (copy), v98 (ref), v66 (ref), l_RunService_0 (copy), v100 (ref), l_Players_0 (copy), v89 (ref), v76 (ref), l_game_EngineFeature_0 (copy), v78 (ref), v77 (ref), l_UserInputService_1 (copy), v103 (ref), v88 (ref), v90 (ref), v91 (ref), v92 (ref), v84 (ref), l_game_Service_0 (copy), l_game_EngineFeature_1 (copy), v86 (ref), v61 (ref), v80 (ref), v79 (ref), v113 (ref), v108 (ref), v114 (ref), v109 (ref), v62 (ref), v349 (copy), v93 (ref), v101 (ref)
    debugPrint("Self View: startRenderStepped()");
    stopRenderStepped();
    prepMicAndCamPropertyChangedSignalHandler();
    v271();
    if not v98 then
        return;
    else
        v66 = l_RunService_0.RenderStepped:Connect(function(v381) --[[ Line: 2492 ]]
            -- upvalues: v100 (ref), l_Players_0 (ref), v89 (ref), v76 (ref), l_game_EngineFeature_0 (ref), v78 (ref), v77 (ref), l_UserInputService_1 (ref), v103 (ref), v88 (ref), v90 (ref), v91 (ref), v92 (ref), v84 (ref), l_game_Service_0 (ref), l_game_EngineFeature_1 (ref), v86 (ref), v61 (ref), v80 (ref), v79 (ref), v113 (ref), v108 (ref), v114 (ref), v109 (ref), v271 (ref), v62 (ref), v349 (ref), v380 (copy), v93 (ref), v101 (ref)
            v100 = false;
            if l_Players_0.LocalPlayer then
                local l_Character_1 = l_Players_0.LocalPlayer.Character;
                if not l_Character_1 or l_Character_1.Parent == nil then
                    return;
                else
                    if v89 == nil or v89.Parent ~= l_Character_1 then
                        v89 = getHead(l_Character_1);
                    end;
                    if v89 then
                        local v383 = getAnimator(l_Character_1, 0);
                        if v76 ~= nil and v383 ~= nil then
                            v100 = true;
                            if not l_game_EngineFeature_0 then
                                local l_v76_PlayingAnimationTracks_1 = v76:GetPlayingAnimationTracks();
                                for __, v386 in pairs(l_v76_PlayingAnimationTracks_1) do
                                    if v386 ~= nil then
                                        v386:Stop(0);
                                    end;
                                end;
                                local l_v383_PlayingAnimationTracks_0 = v383:GetPlayingAnimationTracks();
                                local v388 = nil;
                                v78 = {};
                                for __, v390 in ipairs(l_v383_PlayingAnimationTracks_0) do
                                    v388 = v390.Animation;
                                    if v388 and v388:IsA("Animation") and v388.AnimationId ~= "" then
                                        v78[v388.AnimationId] = v390;
                                        if not v77[v388.AnimationId] then
                                            v77[v388.AnimationId] = v76:LoadAnimation(v388);
                                        end;
                                        local v391 = v77[v388.AnimationId];
                                        v391:Play();
                                        v391.TimePosition = v390.TimePosition;
                                        v391.Priority = v390.Priority;
                                        v391:AdjustWeight(v390.WeightCurrent, 0.1);
                                    end;
                                end;
                                for v392 in v77 do
                                    local v393 = v77[v392];
                                    if v393 then
                                        v388 = v393.Animation;
                                        if v388 and not v78[v388.AnimationId] then
                                            if v77[v388.AnimationId] ~= nil then
                                                v77[v388.AnimationId]:Stop(0);
                                            end;
                                            v77[v388.AnimationId] = nil;
                                        end;
                                    end;
                                end;
                                for __, v395 in ipairs(v383:GetPlayingAnimationTracksCoreScript()) do
                                    local l_v76_PlayingAnimationTracksCoreScript_1 = v76:GetPlayingAnimationTracksCoreScript();
                                    for __, v398 in pairs(l_v76_PlayingAnimationTracksCoreScript_1) do
                                        if v398.Animation:IsA("TrackerStreamAnimation") then
                                            v398.Priority = v395.Priority;
                                            v398:AdjustWeight(v395.WeightCurrent, 0);
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    local v399 = nil;
                    local l_l_UserInputService_1_Platform_0 = l_UserInputService_1:GetPlatform();
                    if (l_l_UserInputService_1_Platform_0 == Enum.Platform.IOS or l_l_UserInputService_1_Platform_0 == Enum.Platform.Android) and v76 ~= nil then
                        local l_v76_PlayingAnimationTracksCoreScript_2 = v76:GetPlayingAnimationTracksCoreScript();
                        for __, v403 in pairs(l_v76_PlayingAnimationTracksCoreScript_2) do
                            if v403.Animation:IsA("TrackerStreamAnimation") then
                                local l_v403_TrackerData_0, v405, v406 = v403:GetTrackerData();
                                _ = l_v403_TrackerData_0;
                                _ = v406;
                                v399 = v405;
                            end;
                        end;
                    end;
                    v103 = v103 + 1;
                    if v103 == 1 then
                        v103 = 0;
                        if v88 then
                            if not v90 then
                                v90 = getHead(v88);
                                if v90 then
                                    v91 = getNeck(v88, v90);
                                end;
                            end;
                            if v90 then
                                v92 = v90.CFrame;
                            end;
                        end;
                        if v84 and v90 then
                            local l_Position_1 = v90.Position;
                            local l_Position_2 = v90.Position;
                            local l_CFrame_0 = v90.CFrame;
                            if v91 then
                                local l_Part0_0 = v91.Part0;
                                local __ = v91.Part1;
                                local l_C0_0 = v91.C0;
                                local l_C1_0 = v91.C1;
                                local l_Transform_0 = v91.Transform;
                                if l_Part0_0 and l_C0_0 then
                                    l_CFrame_0 = l_Part0_0.CFrame * l_C0_0 * l_Transform_0 * l_C1_0:Inverse();
                                    l_Position_2 = Vector3.new(l_CFrame_0.Position.X * 0.25, (v90.CFrame.Position.Y + l_CFrame_0.Position.Y + l_CFrame_0.Position.Y * 0.75) * 0.33333, l_CFrame_0.Position.Z);
                                    l_Position_1 = Vector3.new(l_CFrame_0.Position.X * 0.6, (v90.CFrame.Position.Y + l_CFrame_0.Position.Y + l_CFrame_0.Position.Y * 0.75) * 0.33333, l_CFrame_0.Position.Z);
                                end;
                            else
                                debugPrint("Self View: no neck found");
                            end;
                            if l_game_Service_0 and l_game_Service_0.VideoAnimationEnabled and (v399 ~= nil or l_game_EngineFeature_1) then
                                if l_game_EngineFeature_1 then
                                    local l_DeviceCameraCFrameForSelfView_0 = game:GetService("PlayerViewService"):GetDeviceCameraCFrameForSelfView();
                                    local l_Position_3 = l_DeviceCameraCFrameForSelfView_0.Position;
                                    local v417, v418, v419 = l_DeviceCameraCFrameForSelfView_0:ToEulerAnglesYXZ();
                                    local v420 = CFrame.fromEulerAnglesYXZ(v417, v418, v419);
                                    local v421 = 0;
                                    if l_Position_3.Z > 0 then
                                        v421 = math.clamp(0.5 - l_Position_3.Z * 3, -0.5, 0.5);
                                    end;
                                    local v422 = -(v86.Z + 1);
                                    local v423 = Vector3.new(0, 0.105, math.floor((v422 + v421 * v422) * 100) / 100);
                                    v84.CFrame = v84.CFrame:lerp(CFrame.lookAt(v420 * (l_Position_1 + v423), l_Position_2), 0.5);
                                else
                                    local v424 = Vector3.new(0, 0.105, -(v86.Z + 1));
                                    local v425, v426, v427 = v399:ToEulerAnglesXYZ();
                                    local v428 = CFrame.Angles(-v425 * 0.5, -v426 * 0.5, -v427 * 0.5);
                                    v84.CFrame = CFrame.lookAt(v428 * (l_Position_1 + v424), l_Position_2);
                                end;
                            else
                                local v429 = Vector3.new(0, v61 * 0.25 - 1.25, -(v86.Z + 1) + 0.125);
                                local l_Character_2 = l_Players_0.LocalPlayer.Character;
                                if l_Character_2 then
                                    local l_Head_0 = l_Character_2:FindFirstChild("Head");
                                    if l_Head_0 then
                                        local l_HumanoidRootPart_0 = l_Character_2:FindFirstChild("HumanoidRootPart");
                                        if l_HumanoidRootPart_0 then
                                            local v433 = l_HumanoidRootPart_0.CFrame:Inverse() * l_Head_0.CFrame;
                                            local v434 = Vector3.new(v433.Position.x * 0.15 + 0.125, v433.Position.y, v433.Position.z * 0.05);
                                            v84.CFrame = CFrame.lookAt(l_Position_1 + v429 + v434, l_Position_2);
                                            v84.Focus = v90.CFrame;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    if v89 then
                        if v89.Size ~= v80 then
                            v80 = v89.Size;
                            setCloneDirty(true);
                        end;
                        if pcall(function() --[[ Line: 2730 ]]
                            -- upvalues: v89 (ref)
                            local __ = v89.Color;
                        end) and v89.Color ~= v79 then
                            updateClonePartsColor(v89.Color);
                        end;
                    end;
                end;
            end;
            if v113 ~= v108 or v114 ~= v109 then
                v271();
            end;
            if v62 > 0 then
                v62 = v62 - v381;
                if v62 <= 0 then
                    debugPrint("Self View: updateCloneCurrentCoolDown <= 0");
                    v349(v380);
                    v62 = 0;
                end;
            end;
            if v93 then
                if v100 then
                    v101 = nil;
                end;
                local v436 = frameShouldBeVisible(v381, v100);
                if v93.Visible ~= v436 then
                    v93.Visible = v436;
                end;
                trackSelfViewSessionAsNeeded();
            end;
        end);
        return;
    end;
end;
triggerAnalyticsReportExperienceSettings = function(v437) --[[ Line: 2770 ]] --[[ Name: triggerAnalyticsReportExperienceSettings ]]
    -- upvalues: v29 (copy), v42 (copy)
    v29:reportExperienceSettings(true, v42:IsEnabled(v437, Enum.AvatarChatServiceFeature.UniverseVideo) and v42:IsEnabled(v437, Enum.AvatarChatServiceFeature.PlaceVideo), v42:IsEnabled(v437, Enum.AvatarChatServiceFeature.UniverseAudio) and v42:IsEnabled(v437, Enum.AvatarChatServiceFeature.PlaceAudio));
    v29:reportUserAccountSettings(v42:IsEnabled(v437, Enum.AvatarChatServiceFeature.UserVideo), v42:IsEnabled(v437, Enum.AvatarChatServiceFeature.UserAudio));
end;
Initialize = function(v438) --[[ Line: 2785 ]] --[[ Name: Initialize ]]
    -- upvalues: v60 (ref), l_CoreGui_0 (copy), v29 (copy), l_GetFFlagAvatarChatServiceEnabled_0 (copy), v42 (copy), v261 (copy), v44 (copy), l_Players_0 (copy), v127 (copy), v75 (ref), v102 (ref)
    v60 = Instance.new("ScreenGui");
    v60.Name = "InExperienceCoreGui";
    v60.Parent = l_CoreGui_0;
    v60.DisplayOrder = -2;
    v60.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    local v439 = getShouldBeEnabledCoreGuiSetting();
    v29:reportSelfViewEnabledInCoreGuiState(v439);
    if not v439 then
        return;
    else
        if l_GetFFlagAvatarChatServiceEnabled_0() then
            if v42.ClientFeaturesInitialized then
                triggerAnalyticsReportExperienceSettings(v42.ClientFeatures);
            else
                local v440 = nil;
                do
                    local l_v440_0 = v440;
                    l_v440_0 = v42:GetPropertyChangedSignal("ClientFeatures"):Connect(function() --[[ Line: 2807 ]]
                        -- upvalues: v42 (ref), l_v440_0 (ref)
                        triggerAnalyticsReportExperienceSettings(v42.ClientFeatures);
                        l_v440_0:Disconnect();
                    end);
                end;
            end;
        end;
        v261();
        if v44() then
            getMicPermission();
            getCameraPermissionWithoutRequest();
            updateSelfViewButtonVisibility();
        else
            getPermissions();
        end;
        playerAdded(v438);
        l_Players_0.PlayerAdded:Connect(playerAdded);
        l_Players_0.PlayerRemoving:Connect(function(v442) --[[ Line: 2827 ]]
            -- upvalues: l_Players_0 (ref), v127 (ref), v75 (ref)
            if v442 == l_Players_0.LocalPlayer then
                clearObserver(v127.HumanoidStateChanged);
                clearObserver(v127.CharacterAdded);
                clearObserver(v127.CharacterRemoving);
                clearClone();
                if v75 then
                    v75:Disconnect();
                    v75 = nil;
                end;
            end;
        end);
        connectToVoiceJoinProgressChanged();
        startRenderStepped(v438);
        v102 = true;
        displaySelfieViewByDefault();
        return;
    end;
end;
Initialize(l_Players_0.LocalPlayer);