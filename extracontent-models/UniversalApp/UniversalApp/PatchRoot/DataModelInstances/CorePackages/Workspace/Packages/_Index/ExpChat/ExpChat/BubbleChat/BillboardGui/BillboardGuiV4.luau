local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ExpChatShared);
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.RoactRodux);
local l_List_0 = require(l_Parent_0.llama).List;
local v7 = require(l_Parent_0.Otter);
local v8 = require(l_Parent_0.tutils);
local v9 = require(l_Parent_0.SharedFlags);
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_VRService_0 = game:GetService("VRService");
local l_createEffect_0 = require(l_Parent_0.Signals).createEffect;
local v15 = v2.Logger:new("ExpChat/" .. script.Name);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("BubbleChat");
local v17 = require(l_script_FirstAncestor_1.VoiceIndicator);
local v18 = require(l_script_FirstAncestor_1.BlankBubble);
local v19 = require(l_script_FirstAncestor_1.BubbleChatList);
local v20 = require(l_script_FirstAncestor_1.ChatBubbleDistant);
local v21 = require(l_script_FirstAncestor_1.LikelySpeakingBubble);
local v22 = require(l_script_FirstAncestor_0.GlobalFlags);
local l_Helpers_0 = l_script_FirstAncestor_1.Helpers;
local v24 = require(l_script_FirstAncestor_0.Stores.GetMessagesStore);
local v25 = require(l_script_FirstAncestor_0.Stores.GetChatConfigurationStore);
local v26 = require(l_Helpers_0.getSettingsForMessage);
local v27 = game:DefineFastFlag("SelfViewNoApi", false);
local v28 = require(l_script_FirstAncestor_1.PlayerButtons);
local v29 = require(l_script_FirstAncestor_0.Flags.FFlagEasierUnmuting);
local v30 = game:DefineFastFlag("EasierUnmutingBasedOnCameraTCS", false);
local v31 = game:DefineFastInt("LikelySpeakingBubbleDisplayDistance", 50);
local v32 = game:DefineFastFlag("ExpChatMemoBillboardGui", false);
local v33 = game:DefineFastFlag("StopBubbleChatReactWarning", false);
local v34 = game:DefineFastInt("ExperienceChatHeartbeatIncrement", 5);
local l_FFlagExpChatUseAdorneeStore_0 = v9.FFlagExpChatUseAdorneeStore;
local l_FFlagExpChatUseProximityStore_0 = v9.FFlagExpChatUseProximityStore;
local v37 = game:DefineFastInt("ExpChatProximityStoreExtraRendersBeforeUnmount", 10);
local l_FFlagExpChatUseMessagesStore_0 = v9.FFlagExpChatUseMessagesStore;
local l_FFlagExpChatUseChatConfigStore_0 = v9.FFlagExpChatUseChatConfigStore;
local v40 = Vector2.new(28, 28);
local function v49(v41, v42, v43) --[[ Line: 56 ]] --[[ Name: getRecentMessages ]]
    -- upvalues: l_List_0 (copy)
    local v44 = workspace:GetServerTimeNow() * 1000;
    local v45 = v41 or {};
    return l_List_0.filter(v45, function(v46, v47) --[[ Line: 60 ]]
        -- upvalues: v41 (copy), v43 (copy), v44 (copy), v42 (copy)
        if v46.isVisibleInBubbleChat then
            local v48 = false;
            if #v41 - v43 < v47 then
                v48 = v44 - v46.timestamp.UnixTimestampMillis < v42;
            end;
            return v48;
        else
            return false;
        end;
    end);
end;
local v50 = (if v33 then v3.Component else v3.PureComponent):extend("BubbleChatBillboard");
local v51 = {
    dampingRatio = 1, 
    frequency = 4
};
local l_CurrentCamera_0 = workspace.CurrentCamera;
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 81 ]]
    -- upvalues: l_CurrentCamera_0 (ref)
    l_CurrentCamera_0 = workspace.CurrentCamera;
end);
getEasierUnmutingDistance = function(v53, v54) --[[ Line: 85 ]] --[[ Name: getEasierUnmutingDistance ]]
    -- upvalues: l_CurrentCamera_0 (ref), v30 (copy)
    local v55 = l_CurrentCamera_0 and l_CurrentCamera_0.CFrame.Position;
    if (v30 or not v54) and v53 and v55 then
        return (v53 - v55).Magnitude;
    elseif v53 and v54 then
        return (v53 - v54).Magnitude;
    else
        return nil;
    end;
end;
v50.init = function(v56) --[[ Line: 99 ]] --[[ Name: init ]]
    -- upvalues: v22 (copy), v27 (copy), l_StarterGui_0 (copy), l_FFlagExpChatUseProximityStore_0 (copy), v2 (copy), v3 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v7 (copy), l_Players_0 (copy), v17 (copy), v24 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v25 (copy)
    local v57 = nil;
    local v58 = nil;
    if v22.AvatarChatEnabled then
        v57 = v56.props.selfViewListenerChanged.getSelfViewVisibility();
        v58 = v27 or l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.All) or l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView);
    end;
    if l_FFlagExpChatUseProximityStore_0 then
        local l_context_0 = v2.context;
        v56.ProximityStore = l_context_0 and l_context_0.proximityStore;
        local v60, v61 = v3.createBinding(100);
        v56.invisibleCount = v60;
        v56.setInvisibleCount = v61;
        v60, v61 = v3.createBinding(false);
        v56.renderDistanceBinding = v60;
        v56.updateRenderDistanceBinding = v61;
        v60, v61 = v3.createBinding(false);
        v56.maximizeDistanceBinding = v60;
        v56.updateMaximizeDistanceBinding = v61;
        v60, v61 = v3.createBinding(false);
        v56.likelySpeakingDistanceBinding = v60;
        v56.updateLikelySpeakingDistanceBinding = v61;
    end;
    v56:setState({
        isInsideRenderDistance = false, 
        isInsideMaximizeDistance = false, 
        savedChatSettings = v56.props.chatSettings, 
        selfViewOpen = v57, 
        selfViewEnabled = v58, 
        voiceTimedOut = false, 
        voiceStateCounter = 0, 
        lastVoiceState = nil, 
        filteredMessages = if l_FFlagExpChatUseMessagesStore_0 then {} else nil
    });
    v56.isMounted = false;
    local v62, v63 = v3.createBinding((Vector3.new()));
    v56.offset = v62;
    v56.updateOffset = v63;
    v56.offsetMotor = v7.createSingleMotor(0);
    v56.offsetMotor:onStep(function(v64) --[[ Line: 135 ]]
        -- upvalues: v56 (copy)
        v56.updateOffset((Vector3.new(0, v64, 0)));
    end);
    v56.offsetGoal = 0;
    v62, v63 = v3.createBinding(nil);
    v56.adorneeBinding = v62;
    v56.updateAdorneeBinding = v63;
    v62, v63 = v3.createBinding(nil);
    v56.localAdorneeBinding = v62;
    v56.updateLocalAdorneeBinding = v63;
    if l_FFlagExpChatUseProximityStore_0 then
        v62, v63 = v3.createBinding(false);
        v56.voiceTimedOutBinding = v62;
        v56.setVoiceTimedOutBinding = v63;
    end;
    v56.heartbeatCount = 0;
    v56.lastDistanceUpdate = 0;
    v56.onLastBubbleFadeOut = function() --[[ Line: 151 ]]
        -- upvalues: v56 (copy)
        if v56.props.onFadeOut and not v56.isFadingOut then
            v56.isFadingOut = true;
            v56.props.onFadeOut(v56.props.userId);
        end;
    end;
    v56.wrappedOnClickVoiceIndicator = function(v65, v66) --[[ Line: 159 ]]
        -- upvalues: v56 (copy)
        return v56.props.onClickedVoiceIndicator(v65, v66, "bubblechat");
    end;
    v62 = l_Players_0.LocalPlayer;
    v63 = if v62 then v56.props.userId ~= tostring(v62.UserId) and "SpeakerDark" or "MicDark" else "SpeakerDark";
    v56.renderInsert = function() --[[ Line: 167 ]]
        -- upvalues: v3 (ref), v17 (ref), v56 (copy), v63 (copy)
        return v3.createElement(v17, {
            userId = v56.props.userId, 
            getIcon = v56.props.getIconVoiceIndicator, 
            onClicked = v56.wrappedOnClickVoiceIndicator, 
            iconStyle = v63
        });
    end;
    if v22.AvatarChatEnabled then
        local l_selfViewVisibilityUpdatedSignal_0 = v56.props.selfViewListenerChanged.selfViewVisibilityUpdatedSignal;
        local l_getSelfViewVisibility_0 = v56.props.selfViewListenerChanged.getSelfViewVisibility;
        v56.selfViewConnection = l_selfViewVisibilityUpdatedSignal_0:connect(function() --[[ Line: 180 ]] --[[ Name: callback ]]
            -- upvalues: v56 (copy), l_getSelfViewVisibility_0 (copy)
            v56:setState({
                selfViewOpen = l_getSelfViewVisibility_0()
            });
        end);
    end;
    if l_FFlagExpChatUseMessagesStore_0 then
        v56.MessagesStore = v24(false);
    end;
    if l_FFlagExpChatUseChatConfigStore_0 then
        v56.ChatConfigurationStore = v25(false);
    end;
end;
v50.checkCounterForTimeout = function(v69, v70) --[[ Line: 197 ]] --[[ Name: checkCounterForTimeout ]]
    -- upvalues: l_Players_0 (copy), l_FFlagExpChatUseProximityStore_0 (copy)
    if l_Players_0.LocalPlayer and v69.props.userId ~= tostring(l_Players_0.LocalPlayer.UserId) and v69.state.lastVoiceState ~= "Talking" and v69.state.voiceStateCounter ~= v70 then
        local l_voiceStateCounter_0 = v69.state.voiceStateCounter;
        delay(1, function() --[[ Line: 207 ]]
            -- upvalues: v69 (copy), l_voiceStateCounter_0 (copy), l_FFlagExpChatUseProximityStore_0 (ref)
            if v69.state.voiceStateCounter == l_voiceStateCounter_0 and v69.isMounted then
                if l_FFlagExpChatUseProximityStore_0 then
                    v69.setVoiceTimedOutBinding(true);
                    return;
                else
                    v69:setState({
                        voiceTimedOut = true
                    });
                end;
            end;
        end);
    end;
end;
v50.getVerticalOffset = function(v72) --[[ Line: 222 ]] --[[ Name: getVerticalOffset ]]
    local v73 = v72:getEffectiveAdornee(false);
    if v73 and v73:IsA("Model") then
        local l_v73_BoundingBox_0, v75 = v73:GetBoundingBox();
        local v76 = getAdorneeInstance(v73, v72.state.savedChatSettings.AdorneeName);
        if not v76 then
            return v75.Y / 2;
        elseif v76:IsA("BasePart") then
            local v77 = l_v73_BoundingBox_0:PointToObjectSpace(v76.Position);
            return v75.Y / 2 - v77.Y;
        else
            return 0;
        end;
    elseif v73 and v73:IsA("BasePart") then
        return v73.Size.Y / 2;
    else
        return 0;
    end;
end;
getAdorneeInstance = function(v78, v79) --[[ Line: 246 ]] --[[ Name: getAdorneeInstance ]]
    if not v78 then
        return nil;
    else
        if v78:IsA("Model") then
            local v80 = v78:FindFirstChild(v79, true) or v78.PrimaryPart;
            if not v80 or v80:IsA("BasePart") or v80:IsA("Attachment") then
                return v80;
            end;
        elseif v78:IsA("BasePart") or v78:IsA("Attachment") then
            return v78;
        end;
        return nil;
    end;
end;
v50.getEffectiveAdornee = function(v81, v82) --[[ Line: 262 ]] --[[ Name: getEffectiveAdornee ]]
    -- upvalues: l_FFlagExpChatUseAdorneeStore_0 (copy), v2 (copy)
    if not l_FFlagExpChatUseAdorneeStore_0 then
        return v81.props.adornee;
    else
        local l_context_1 = v2.context;
        local v84 = l_context_1 and l_context_1.adorneeStore;
        if v84 and v81.props.userId then
            local v85 = v84.getAdornee(v81.props.userId);
            if v85 then
                local v86 = v85(v82 or false);
                if v86 then
                    return v86;
                end;
            end;
        end;
        return v81.props.partOrModel;
    end;
end;
v50.shouldRenderCaret = function(v87) --[[ Line: 283 ]] --[[ Name: shouldRenderCaret ]]
    -- upvalues: l_FFlagExpChatUseChatConfigStore_0 (copy), v22 (copy)
    local v88 = if l_FFlagExpChatUseChatConfigStore_0 then v87.ChatConfigurationStore.getBubbleChatSettings(false) else v87.state.savedChatSettings;
    local v89 = not v22.ShowLikelySpeakingBubbles or not v87:shouldRenderLikelySpeakingBubble();
    return v88.TailVisible and not v87:shouldRenderPlayerButtons() and v89;
end;
v50.shouldRenderCaretNew = function(v90, v91) --[[ Line: 294 ]] --[[ Name: shouldRenderCaretNew ]]
    -- upvalues: v22 (copy)
    local l_savedChatSettings_0 = v90.state.savedChatSettings;
    local v93 = not v22.ShowLikelySpeakingBubbles or not v90:shouldRenderLikelySpeakingBubble();
    return l_savedChatSettings_0.TailVisible and not v90:shouldRenderPlayerButtonsNew(v91) and v93;
end;
v50.shouldRenderPlayerButtons = function(v94) --[[ Line: 304 ]] --[[ Name: shouldRenderPlayerButtons ]]
    -- upvalues: l_Players_0 (copy), l_FFlagExpChatUseProximityStore_0 (copy), l_VRService_0 (copy), v22 (copy)
    if not v94.props.voiceEnabled or not v94.props.isVoiceUIVisible then
        return false;
    else
        local v95 = if l_Players_0.LocalPlayer then v94.props.userId == tostring(l_Players_0.LocalPlayer.UserId) else false;
        if l_FFlagExpChatUseProximityStore_0 then
            if v95 and not v94.props.testMode then
                if l_VRService_0.VREnabled or v22.ChromeEnabled then
                    return false;
                elseif not v94.state.selfViewOpen then
                    return true;
                else
                    return false;
                end;
            end;
        elseif v95 then
            if l_VRService_0.VREnabled or v22.ChromeEnabled then
                return false;
            elseif not v94.state.selfViewOpen then
                return true;
            else
                return false;
            end;
        end;
        return v94.props.voiceEnabled and not v94.state.voiceTimedOut;
    end;
end;
v50.shouldRenderPlayerButtonsNew = function(v96, v97) --[[ Line: 348 ]] --[[ Name: shouldRenderPlayerButtonsNew ]]
    -- upvalues: l_Players_0 (copy), l_VRService_0 (copy), v22 (copy)
    if not v96.props.voiceEnabled or not v96.props.isVoiceUIVisible then
        return false;
    elseif if l_Players_0.LocalPlayer then v96.props.userId == tostring(l_Players_0.LocalPlayer.UserId) else false then
        if l_VRService_0.VREnabled or v22.ChromeEnabled then
            return false;
        elseif not v96.state.selfViewOpen then
            return true;
        else
            return false;
        end;
    elseif v97 == nil then
        return v96.props.voiceEnabled and not v96.state.voiceTimedOut;
    else
        return v96.props.voiceEnabled and not v97;
    end;
end;
v50.shouldRenderLikelySpeakingBubble = function(v98) --[[ Line: 379 ]] --[[ Name: shouldRenderLikelySpeakingBubble ]]
    -- upvalues: l_Players_0 (copy)
    return not (if l_Players_0.LocalPlayer then v98.props.userId == tostring(l_Players_0.LocalPlayer.UserId) else false) and v98.props.isEligibleForLikelySpeakingBubbles and v98.props.isLikelySpeakingUser;
end;
local function v105(v99, v100) --[[ Line: 387 ]] --[[ Name: messagesHaveChanged ]]
    -- upvalues: l_FFlagExpChatUseMessagesStore_0 (copy)
    local v101 = #v99;
    local v102 = #v100;
    if v101 == 0 and v102 == 0 then
        return false;
    elseif v101 ~= v102 then
        return true;
    else
        for v103, v104 in v99 do
            if v104.messageId ~= v100[v103].messageId then
                return true;
            elseif l_FFlagExpChatUseMessagesStore_0 and v104.text ~= v100[v103].text then
                return true;
            end;
        end;
        return false;
    end;
end;
local v106 = {
    filteredMessages = true
};
v50.shouldComponentUpdate = function(v107, v108, v109) --[[ Line: 408 ]] --[[ Name: shouldComponentUpdate ]]
    -- upvalues: l_FFlagExpChatUseProximityStore_0 (copy), v105 (copy), v8 (copy), v106 (copy)
    if not l_FFlagExpChatUseProximityStore_0 and v107.state.isInsideRenderDistance ~= v109.isInsideRenderDistance and not v109.isInsideRenderDistance then
        return false;
    elseif v105(v107.state.filteredMessages, v109.filteredMessages) then
        return true;
    else
        return not v8.shallowEqual(v108, v107.props, v106) or not v8.shallowEqual(v109, v107.state, v106);
    end;
end;
v50.render = function(v110) --[[ Line: 427 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagExpChatUseChatConfigStore_0 (copy), l_FFlagExpChatUseAdorneeStore_0 (copy), l_Players_0 (copy), v15 (copy), l_FFlagExpChatUseProximityStore_0 (copy), v37 (copy), v3 (copy), v22 (copy), v40 (copy), v28 (copy), v4 (copy), v21 (copy), v18 (copy), v19 (copy), v20 (copy)
    local v111 = if l_FFlagExpChatUseChatConfigStore_0 then v110.ChatConfigurationStore.getBubbleChatSettings(false) else v110.state.savedChatSettings;
    local v112 = if l_FFlagExpChatUseAdorneeStore_0 then v110.adorneeBinding else v110.props.adornee or v110.props.partOrModel;
    local v114 = if l_FFlagExpChatUseAdorneeStore_0 then v110.adorneeBinding:map(function(v113) --[[ Line: 437 ]]
        -- upvalues: v110 (copy)
        return getAdorneeInstance(v113, v110.state.savedChatSettings.AdorneeName);
    end) else getAdorneeInstance(v112, v110.state.savedChatSettings.AdorneeName);
    local v115 = if l_Players_0.LocalPlayer then v110.props.userId == tostring(l_Players_0.LocalPlayer.UserId) else false;
    if not l_FFlagExpChatUseAdorneeStore_0 and not v114 then
        v15:trace("No adornee for {}", v110.state.shortId);
        return;
    else
        if l_FFlagExpChatUseProximityStore_0 then
            if v110.renderDistanceBinding:getValue() or v110.props.testMode then
                v110.setInvisibleCount(0);
            elseif v110.invisibleCount:getValue() > v37 then
                return;
            else
                v110.setInvisibleCount(v110.invisibleCount:getValue() + 1);
            end;
        elseif not v110.state.isInsideRenderDistance then
            return;
        end;
        local v116 = nil;
        if l_FFlagExpChatUseProximityStore_0 then
            v116 = v3.joinBindings({
                renderDistance = v110.renderDistanceBinding, 
                maximizeDistance = v110.maximizeDistanceBinding, 
                likelySpeakingDistance = v110.likelySpeakingDistanceBinding
            }):map(function(v117) --[[ Line: 484 ]]
                -- upvalues: v22 (ref), v110 (copy)
                return {
                    isInsideMaximizeDistance = v117.maximizeDistance, 
                    isInsideLikelySpeakingDistance = v117.likelySpeakingDistance, 
                    isDistant = not v117.maximizeDistance, 
                    showLikelySpeakingBubble = v22.ShowLikelySpeakingBubbles and v110:shouldRenderLikelySpeakingBubble() and v117.likelySpeakingDistance
                };
            end);
        end;
        local v118 = {};
        local v119 = v110.state.filteredMessages and #v110.state.filteredMessages > 0;
        local v120 = v110.props.voiceEnabled and not v110.state.voiceTimedOut;
        if v22.AvatarChatEnabled and v115 then
            v120 = v120 and not v110.state.selfViewOpen;
        end;
        if v22.ChromeEnabled and v115 then
            v120 = false;
        end;
        local v121 = v120 and not v22.AvatarChatEnabled and not v22.ChromeEnabled;
        local v122 = if v120 then v110.renderInsert else nil;
        local l_v40_0 = v40;
        local v124 = nil;
        if l_FFlagExpChatUseProximityStore_0 then
            v124 = v110.voiceTimedOutBinding:map(function(v125) --[[ Line: 519 ]]
                -- upvalues: v110 (copy), v22 (ref), v115 (copy)
                local v126 = v110.props.voiceEnabled and not v125;
                if v22.AvatarChatEnabled and v115 then
                    v126 = v126 and not v110.state.selfViewOpen;
                end;
                if v22.ChromeEnabled and v115 then
                    v126 = false;
                end;
                return v126;
            end);
        end;
        local l_clientSettings_0 = v110.props.clientSettings;
        if l_FFlagExpChatUseProximityStore_0 then
            if v110.props.testMode or v22.AvatarChatEnabled or v22.ChromeEnabled then
                local v130 = {
                    Visible = if not l_FFlagExpChatUseProximityStore_0 or v110.props.testMode then v110:shouldRenderPlayerButtons() else v110.voiceTimedOutBinding:map(function(v128) --[[ Line: 537 ]]
                        -- upvalues: v110 (copy)
                        return v110:shouldRenderPlayerButtonsNew(v128);
                    end), 
                    chatSettings = v110.props.chatSettings, 
                    isInsideMaximizeDistance = v116:map(function(v129) --[[ Line: 542 ]]
                        return v129.isInsideMaximizeDistance;
                    end), 
                    LayoutOrder = 2, 
                    isLocalPlayer = v115, 
                    userId = v110.props.userId, 
                    getIcon = v110.props.getIconVoiceIndicator, 
                    hasCameraPermissions = v110.props.hasCameraPermissions, 
                    hasMicPermissions = v110.props.hasMicPermissions, 
                    onClickedVoiceIndicator = v110.wrappedOnClickVoiceIndicator, 
                    onClickedCameraIndicator = v110.props.onClickedCameraIndicator, 
                    voiceEnabled = v110.props.voiceEnabled, 
                    displayCameraDeniedToast = v110.props.displayCameraDeniedToast, 
                    isCamEnabledForUserAndPlace = v110.props.isCamEnabledForUserAndPlace, 
                    setCameraPermissionStateFromControl = v110.props.setCameraPermissionStateFromControl, 
                    getPermissions = v110.props.getPermissions, 
                    isCameraOnlyUser = v110.props.isCameraOnlyUser, 
                    isVoiceServiceInitialized = v110.props.isVoiceServiceInitialized
                };
                v118.PlayerButtons = v3.createElement(v28, v130);
                v118.listLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, 8)
                });
                v118.padding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 8)
                });
                v118.LikelySpeakingBubbleConditional = v3.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    Visible = v4.joinBindings({
                        v116, 
                        v110.voiceTimedOutBinding
                    }):map(function(v131) --[[ Line: 578 ]]
                        -- upvalues: v110 (copy)
                        return v131[1].showLikelySpeakingBubble and not v110:shouldRenderPlayerButtons(v131[2]);
                    end)
                }, {
                    LikelySpeakingBubble = v3.createElement(v21, {
                        chatSettings = v110.props.chatSettings, 
                        isInsideMaximizeDistance = v116:map(function(v132) --[[ Line: 584 ]]
                            return v132.isInsideMaximizeDistance;
                        end), 
                        LayoutOrder = 2, 
                        onActivated = v110.props.onClickedLikelySpeakingBubble
                    })
                });
            elseif v120 and v119 == false then
                v118.VoiceBubble = v3.createElement(v18, {
                    chatSettings = v111, 
                    userId = v110.props.userId, 
                    renderInsert = v122, 
                    insertSize = l_v40_0, 
                    isDistant = not v110.state.isInsideMaximizeDistance, 
                    clientSettings = l_clientSettings_0
                });
            end;
        elseif v22.AvatarChatEnabled or v22.ChromeEnabled then
            if v110:shouldRenderPlayerButtons() then
                local v133 = {
                    chatSettings = v110.props.chatSettings, 
                    isInsideMaximizeDistance = v110.state.isInsideMaximizeDistance, 
                    LayoutOrder = 2, 
                    isLocalPlayer = v115, 
                    userId = v110.props.userId, 
                    getIcon = v110.props.getIconVoiceIndicator, 
                    hasCameraPermissions = v110.props.hasCameraPermissions, 
                    hasMicPermissions = v110.props.hasMicPermissions, 
                    onClickedVoiceIndicator = v110.wrappedOnClickVoiceIndicator, 
                    onClickedCameraIndicator = v110.props.onClickedCameraIndicator, 
                    voiceEnabled = v110.props.voiceEnabled, 
                    displayCameraDeniedToast = v110.props.displayCameraDeniedToast, 
                    isCamEnabledForUserAndPlace = v110.props.isCamEnabledForUserAndPlace, 
                    setCameraPermissionStateFromControl = v110.props.setCameraPermissionStateFromControl, 
                    getPermissions = v110.props.getPermissions, 
                    isCameraOnlyUser = v110.props.isCameraOnlyUser, 
                    isVoiceServiceInitialized = v110.props.isVoiceServiceInitialized
                };
                v118.PlayerButtons = v3.createElement(v28, v133);
                v118.listLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, 8)
                });
                v118.padding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 8)
                });
            elseif v22.ShowLikelySpeakingBubbles and v110:shouldRenderLikelySpeakingBubble() and v110.state.isInsideLikelySpeakingDistance then
                local v134 = {
                    chatSettings = v110.props.chatSettings, 
                    isInsideMaximizeDistance = v110.state.isInsideMaximizeDistance, 
                    LayoutOrder = 2, 
                    onActivated = v110.props.onClickedLikelySpeakingBubble
                };
                v118.LikelySpeakingBubble = v3.createElement(v21, v134);
                v118.listLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, 8)
                });
                v118.padding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 8)
                });
            end;
        elseif v120 and v119 == false then
            v118.VoiceBubble = v3.createElement(v18, {
                chatSettings = v111, 
                userId = v110.props.userId, 
                renderInsert = v122, 
                insertSize = l_v40_0, 
                isDistant = not v110.state.isInsideMaximizeDistance, 
                clientSettings = l_clientSettings_0
            });
        end;
        local v135 = v110:shouldRenderCaret();
        if l_FFlagExpChatUseProximityStore_0 then
            v118.BubbleChatListContainer = v3.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                Visible = v116:map(function(v136) --[[ Line: 686 ]]
                    return v136.isInsideMaximizeDistance;
                end)
            }, {
                BubbleChatList = v3.createElement(v19, {
                    userId = v110.props.userId, 
                    isVisible = v116:map(function(v137) --[[ Line: 692 ]]
                        return v137.isInsideMaximizeDistance;
                    end), 
                    onLastBubbleFadeOut = v110.onLastBubbleFadeOut, 
                    chatSettings = v111, 
                    renderFirstInsert = if v121 then v122 else nil, 
                    insertSize = l_v40_0, 
                    messages = v110.state.filteredMessages, 
                    clientSettings = l_clientSettings_0, 
                    isTextChatServiceOn = v110.props.isTextChatServiceOn, 
                    showCaret = v110.voiceTimedOutBinding:map(function(v138) --[[ Line: 702 ]]
                        -- upvalues: v110 (copy)
                        return v110:shouldRenderCaretNew(v138);
                    end)
                })
            });
            if v119 then
                v118.DistantBubbleContainer = v3.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    Visible = v116:map(function(v139) --[[ Line: 712 ]]
                        return not v139.isInsideMaximizeDistance;
                    end)
                }, {
                    DistantBubble = v3.createElement(v20, {
                        fadingOut = not v110.state.filteredMessages or #v110.state.filteredMessages == 0, 
                        onFadeOut = v110.onLastBubbleFadeOut, 
                        chatSettings = v111, 
                        renderInsert = if v121 then v122 else nil, 
                        insertSize = l_v40_0, 
                        clientSettings = l_clientSettings_0, 
                        showCaret = v110.voiceTimedOutBinding:map(function(v140) --[[ Line: 723 ]]
                            -- upvalues: v110 (copy)
                            return v110:shouldRenderCaretNew(v140);
                        end)
                    })
                });
            end;
        elseif v110.state.isInsideMaximizeDistance then
            v118.BubbleChatList = v3.createElement(v19, {
                userId = v110.props.userId, 
                isVisible = v110.state.isInsideMaximizeDistance, 
                onLastBubbleFadeOut = v110.onLastBubbleFadeOut, 
                chatSettings = v111, 
                renderFirstInsert = if v121 then v122 else nil, 
                insertSize = l_v40_0, 
                messages = v110.state.filteredMessages, 
                clientSettings = l_clientSettings_0, 
                isTextChatServiceOn = v110.props.isTextChatServiceOn, 
                showCaret = v135
            });
        elseif v119 then
            v118.DistantBubble = v3.createElement(v20, {
                fadingOut = not v110.state.filteredMessages or #v110.state.filteredMessages == 0, 
                onFadeOut = v110.onLastBubbleFadeOut, 
                chatSettings = v111, 
                renderInsert = if v121 then v122 else nil, 
                insertSize = l_v40_0, 
                clientSettings = l_clientSettings_0, 
                showCaret = v135
            });
        end;
        local v141 = v115 and v111.LocalPlayerStudsOffset or Vector3.new(0, 1, 0.10000000149011612, 0);
        local v142 = v22.ShowLikelySpeakingBubbles and v110:shouldRenderLikelySpeakingBubble();
        if l_FFlagExpChatUseProximityStore_0 then
            return v3.createElement("BillboardGui", {
                Adornee = v114, 
                Active = if v22.AvatarChatEnabled then v110.voiceTimedOutBinding:map(function(v143) --[[ Line: 767 ]]
                    -- upvalues: v110 (copy), v142 (copy)
                    return v110:shouldRenderPlayerButtonsNew(v143) or v142;
                end) else v124:map(function(v144) --[[ Line: 770 ]]
                    -- upvalues: v142 (copy)
                    return v144 or v142;
                end), 
                Size = UDim2.fromOffset(500, 200), 
                SizeOffset = Vector2.new(0, 0.5), 
                StudsOffset = v141 + Vector3.new(0, v111.VerticalStudsOffset, 0), 
                StudsOffsetWorldSpace = v110.offset, 
                ResetOnSpawn = false, 
                MaxDistance = v110.renderDistanceBinding:map(function(v145) --[[ Line: 778 ]]
                    if v145 then
                        return 1e999;
                    else
                        return 0;
                    end;
                end)
            }, v118);
        else
            return v3.createElement("BillboardGui", {
                Adornee = v114, 
                Active = if v22.AvatarChatEnabled then v110:shouldRenderPlayerButtons() or v142 else v120 or v142, 
                Size = UDim2.fromOffset(500, 200), 
                SizeOffset = Vector2.new(0, 0.5), 
                StudsOffset = v141 + Vector3.new(0, v111.VerticalStudsOffset, 0), 
                StudsOffsetWorldSpace = v110.offset, 
                ResetOnSpawn = false
            }, v118);
        end;
    end;
end;
v50.didUpdate = function(v146, _, v148) --[[ Line: 797 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagExpChatUseProximityStore_0 (copy)
    if l_FFlagExpChatUseProximityStore_0 then
        if (not v146.state.filteredMessages or #v146.state.filteredMessages == 0) and not v146.renderDistanceBinding:getValue() then
            v146.onLastBubbleFadeOut();
        end;
    elseif (not v146.state.filteredMessages or #v146.state.filteredMessages == 0) and not v146.state.isInsideRenderDistance then
        v146.onLastBubbleFadeOut();
    end;
    if v146.state.filteredMessages and #v146.state.filteredMessages > 0 then
        v146.isFadingOut = false;
    end;
    if l_FFlagExpChatUseProximityStore_0 and v146.state.voiceStateCounter ~= v148.voiceStateCounter then
        v146.setVoiceTimedOutBinding(false);
    end;
    v146:checkCounterForTimeout(v148.voiceStateCounter);
end;
v50.didMount = function(v149) --[[ Line: 828 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagExpChatUseMessagesStore_0 (copy), l_createEffect_0 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v25 (copy), v49 (copy), v7 (copy), l_FFlagExpChatUseAdorneeStore_0 (copy), v2 (copy), l_Players_0 (copy), v29 (copy), l_FFlagExpChatUseProximityStore_0 (copy), l_RunService_0 (copy), v34 (copy), l_CurrentCamera_0 (ref), v22 (copy), v31 (copy), v51 (copy)
    v149.isMounted = true;
    if l_FFlagExpChatUseMessagesStore_0 and v149.MessagesStore then
        v149.messagesEffect = l_createEffect_0(function(v150) --[[ Line: 834 ]]
            -- upvalues: v149 (copy), l_FFlagExpChatUseChatConfigStore_0 (ref), v25 (ref), v49 (ref)
            local v151 = v149.props.userId or v149.props.partOrModel and v149.MessagesStore.getPartOrModelToMockUserId(v150)[v149.props.partOrModel];
            if v151 then
                local v152 = v149.MessagesStore.getUserBubbleMessages(v151)(v150);
                local v153 = if l_FFlagExpChatUseChatConfigStore_0 then v25(false).getBubbleChatSettings(v150) else v149.props.chatSettings;
                local l_MaxBubbles_0 = v153.MaxBubbles;
                local v155 = v153.BubbleDuration * 1000;
                local v156 = v49(v152, v155, l_MaxBubbles_0);
                v149:setState({
                    filteredMessages = v156
                });
                return;
            else
                v149:setState({
                    filteredMessages = {}
                });
                return;
            end;
        end);
    end;
    if l_FFlagExpChatUseChatConfigStore_0 then
        v149.chatConfigEffect = l_createEffect_0(function(v157) --[[ Line: 867 ]]
            -- upvalues: v25 (ref), v149 (copy)
            local v158 = v25(false).getBubbleChatSettings(v157);
            v149:setState({
                savedChatSettings = v158
            });
        end);
    end;
    local v159 = v149:getVerticalOffset();
    v149.offsetGoal = v159;
    v149.offsetMotor:setGoal(v7.instant(v159));
    if l_FFlagExpChatUseAdorneeStore_0 then
        local l_context_2 = v2.context;
        local v161 = l_context_2 and l_context_2.adorneeStore;
        local v162 = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.UserId else -1;
        if v161 and v149.props.userId and l_createEffect_0 then
            v149.adorneeEffect = l_createEffect_0(function(v163) --[[ Line: 884 ]]
                -- upvalues: v149 (copy)
                local v164 = v149:getEffectiveAdornee(v163);
                v149.updateAdorneeBinding(v164);
            end);
            if v29 then
                local v165 = v161.getAdornee(v162);
                if v165 then
                    v149.localAdorneeEffect = l_createEffect_0(function(v166) --[[ Line: 892 ]]
                        -- upvalues: v165 (copy), v149 (copy)
                        local v167 = v165(v166);
                        v149.updateLocalAdorneeBinding(v167);
                    end);
                end;
            end;
        end;
    end;
    if l_FFlagExpChatUseProximityStore_0 and v149.ProximityStore and v149.props.userId then
        v149.proximityEffect = l_createEffect_0(function(v168) --[[ Line: 904 ]]
            -- upvalues: v149 (copy)
            local v169 = v149.ProximityStore.getUserProximityState(v149.props.userId)(v168);
            v149.updateRenderDistanceBinding(v169.isInsideRenderDistance);
            v149.updateMaximizeDistanceBinding(v169.isInsideMaximizeDistance);
            v149.updateLikelySpeakingDistanceBinding(v169.isInsideLikelySpeakingDistance);
        end);
    end;
    v149.heartbeatConn = l_RunService_0.Heartbeat:Connect(function(v170) --[[ Line: 916 ]]
        -- upvalues: v149 (copy), v34 (ref), l_FFlagExpChatUseAdorneeStore_0 (ref), v29 (ref), l_Players_0 (ref), v2 (ref), l_CurrentCamera_0 (ref), v22 (ref), v31 (ref), l_FFlagExpChatUseProximityStore_0 (ref), v7 (ref), v51 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v49 (ref)
        if v149.props.billboardUpdateFrequency > 0 then
            v149.lastDistanceUpdate = v149.lastDistanceUpdate + v170;
            if v149.lastDistanceUpdate < v149.props.billboardUpdateFrequency then
                return;
            else
                v149.lastDistanceUpdate = 0;
            end;
        elseif not v149.props.tests_skipHeartbeatCheck then
            if v149.heartbeatCount < v34 then
                local l_v149_0 = v149;
                l_v149_0.heartbeatCount = l_v149_0.heartbeatCount + 1;
                return;
            else
                v149.heartbeatCount = 0;
            end;
        end;
        local v172 = nil;
        local v173 = nil;
        if l_FFlagExpChatUseAdorneeStore_0 then
            v172 = getAdorneeInstance(v149.adorneeBinding:getValue(), v149.state.savedChatSettings.AdorneeName);
            if v29 then
                local v174 = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.UserId else -1;
                local l_context_3 = v2.context;
                local v176 = l_context_3 and l_context_3.adorneeStore;
                if v176 and v176.getAdornee(v174) then
                    local v177 = v149.localAdorneeBinding and v149.localAdorneeBinding:getValue();
                    v173 = getAdorneeInstance(v177, v149.state.savedChatSettings.AdorneeName);
                end;
            end;
        else
            v172 = getAdorneeInstance(v149.props.adornee or v149.props.partOrModel, v149.state.savedChatSettings.AdorneeName);
            v173 = getAdorneeInstance(v149.props.localAdornee, v149.state.savedChatSettings.AdorneeName);
        end;
        local l_v172_0 = v172;
        if l_CurrentCamera_0 and l_v172_0 then
            local v179 = if l_v172_0:IsA("Attachment") then l_v172_0.WorldPosition else l_v172_0.Position;
            local l_Magnitude_0 = (l_CurrentCamera_0.CFrame.Position - v179).Magnitude;
            local v181 = l_Magnitude_0 < v149.state.savedChatSettings.MaxDistance;
            local v182 = l_Magnitude_0 < v149.state.savedChatSettings.MinimizeDistance;
            local v183 = false;
            local l_ShowLikelySpeakingBubbles_0 = v22.ShowLikelySpeakingBubbles;
            if l_ShowLikelySpeakingBubbles_0 and v149.props.isEligibleForLikelySpeakingBubbles then
                local v185 = nil;
                local l_v173_0 = v173;
                if l_v173_0 then
                    v185 = if l_v173_0:IsA("Attachment") then l_v173_0.WorldPosition else l_v173_0.Position;
                end;
                local v187 = getEasierUnmutingDistance(v179, v185);
                if v187 ~= nil and l_ShowLikelySpeakingBubbles_0 then
                    v183 = v187 < v31;
                end;
            end;
            if l_FFlagExpChatUseProximityStore_0 and v149.ProximityStore then
                if not v149._lastProximityState or v149._lastProximityState.isInsideRenderDistance ~= v181 or v149._lastProximityState.isInsideMaximizeDistance ~= v182 or v149._lastProximityState.isInsideLikelySpeakingDistance ~= v183 then
                    v149.ProximityStore.updateProximity(v149.props.userId, v181, v182, v183);
                    v149._lastProximityState = {
                        isInsideRenderDistance = v181, 
                        isInsideMaximizeDistance = v182, 
                        isInsideLikelySpeakingDistance = v183
                    };
                end;
            elseif v182 ~= v149.state.isInsideMaximizeDistance or v181 ~= v149.state.isInsideRenderDistance or l_ShowLikelySpeakingBubbles_0 and v149.props.isEligibleForLikelySpeakingBubbles and v183 ~= v149.state.isInsideLikelySpeakingDistance then
                v149:setState({
                    isInsideRenderDistance = v181, 
                    isInsideMaximizeDistance = v182, 
                    isInsideLikelySpeakingDistance = v183
                });
            end;
        end;
        local v188 = v149:getVerticalOffset();
        if math.abs(v188 - v149.offsetGoal) > 0.5 then
            v149.offsetGoal = v188;
            v149.offsetMotor:setGoal(v7.spring(v188, v51));
        end;
        local v189 = workspace:GetServerTimeNow() * 1000;
        local v190 = v149.state.savedChatSettings.BubbleDuration * 1000;
        for _, v192 in v149.state.filteredMessages do
            if v190 <= v189 - v192.timestamp.UnixTimestampMillis then
                if l_FFlagExpChatUseMessagesStore_0 then
                    v149:setState(function(v193) --[[ Line: 1043 ]]
                        -- upvalues: v189 (copy), v190 (copy)
                        local v194 = {};
                        for _, v196 in ipairs(v193.filteredMessages) do
                            if v189 - v196.timestamp.UnixTimestampMillis < v190 then
                                table.insert(v194, v196);
                            end;
                        end;
                        return {
                            filteredMessages = v194
                        };
                    end);
                    return;
                else
                    v149:setState(function(v197) --[[ Line: 1055 ]]
                        -- upvalues: v49 (ref), v190 (copy), v149 (ref)
                        return {
                            filteredMessages = v49(v197.filteredMessages, v190, v149.props.chatSettings.MaxBubbles)
                        };
                    end);
                    return;
                end;
            end;
        end;
    end);
    v149:checkCounterForTimeout(nil);
end;
v50.willUnmount = function(v198) --[[ Line: 1074 ]] --[[ Name: willUnmount ]]
    -- upvalues: v15 (copy), l_FFlagExpChatUseProximityStore_0 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy)
    v15:trace("Unmounting billboards for {}", v198.state.shortId);
    v198.isMounted = false;
    if v198.characterConn then
        v198.characterConn:Disconnect();
        v198.characterConn = nil;
    end;
    if v198.heartbeatConn then
        v198.heartbeatConn:Disconnect();
        v198.heartbeatConn = nil;
    end;
    if v198.humanoidDiedConn then
        v198.humanoidDiedConn:Disconnect();
        v198.humanoidDiedConn = nil;
    end;
    if v198.selfViewConnection then
        v198.selfViewConnection:disconnect();
        v198.selfViewConnection = nil;
    end;
    if v198.adorneeEffect then
        v198.adorneeEffect();
        v198.adorneeEffect = nil;
    end;
    if v198.localAdorneeEffect then
        v198.localAdorneeEffect();
        v198.localAdorneeEffect = nil;
    end;
    if l_FFlagExpChatUseProximityStore_0 and v198.proximityEffect then
        v198.proximityEffect();
        v198.proximityEffect = nil;
    end;
    if l_FFlagExpChatUseMessagesStore_0 and v198.messagesEffect then
        v198.messagesEffect();
        v198.messagesEffect = nil;
    end;
    if l_FFlagExpChatUseChatConfigStore_0 and v198.chatConfigEffect then
        v198.chatConfigEffect();
        v198.chatConfigEffect = nil;
    end;
    v198.offsetMotor:destroy();
end;
v50.getDerivedStateFromProps = function(v199, v200) --[[ Line: 1124 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: l_FFlagExpChatUseMessagesStore_0 (copy), v49 (copy)
    local v201 = "..." .. string.sub(tostring(v199.userId), -4);
    local v202 = nil;
    local v203 = nil;
    local v204 = nil;
    if v200.lastVoiceState ~= v199.voiceState then
        v203 = (v200.voiceStateCounter or 0) + 1;
        v204 = false;
        v202 = v199.voiceState;
    end;
    local v205 = nil;
    local v206 = v200.savedChatSettings.BubbleDuration * 1000;
    v205 = if l_FFlagExpChatUseMessagesStore_0 then v200.filteredMessages else v49(v199.messages, v206, v200.savedChatSettings.MaxBubbles);
    return {
        savedChatSettings = if l_FFlagExpChatUseMessagesStore_0 then v199.chatSettings else v199.lastMessage and v199.chatSettings, 
        shortId = v201, 
        filteredMessages = v205, 
        voiceStateCounter = v203, 
        voiceTimedOut = v204, 
        lastVoiceState = v202
    };
end;
local function v214(v207, v208) --[[ Line: 1165 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_Players_0 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v25 (copy), v26 (copy), v22 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), l_FFlagExpChatUseAdorneeStore_0 (copy), v29 (copy)
    local v209 = v207.Messages.messagesBySenderId[v208.userId];
    local v210 = if v209 ~= nil then v209[#v209] else nil;
    local v211 = if l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else "";
    local v212 = nil;
    v212 = if v208.isTextChatServiceOn then if l_FFlagExpChatUseChatConfigStore_0 then v25(false).getBubbleChatSettings(false) else v207.BubbleChatSettings else v26(v207.LegacyBubbleChatSettings, v210);
    local v213 = if v22.ShowLikelySpeakingBubbles then v207.Voice.likelySpeakingUsers[v208.userId] else false;
    return {
        messages = if l_FFlagExpChatUseMessagesStore_0 then nil else v209, 
        lastMessage = if l_FFlagExpChatUseMessagesStore_0 then nil else v210, 
        chatSettings = v212, 
        adornee = if l_FFlagExpChatUseAdorneeStore_0 then nil else v207.Adornees[v208.userId] or v208.partOrModel, 
        localAdornee = if l_FFlagExpChatUseAdorneeStore_0 then nil else if v29 then v207.Adornees[v211] else nil, 
        clientSettings = v207.ClientSettings, 
        isLikelySpeakingUser = v213, 
        isVoiceUIVisible = v207.Voice.isVoiceUIVisible
    };
end;
if l_FFlagExpChatUseAdorneeStore_0 then
    local v215 = v5.connect(v214)(v50);
    if v32 then
        return v4.memo(v215);
    else
        return v215;
    end;
elseif v32 then
    return v4.memo(v5.connect(v214)(v50));
else
    return v5.connect(v214)(v50);
end;