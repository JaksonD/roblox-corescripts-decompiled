local l_Players_0 = game:GetService("Players");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_script_FirstAncestor_0.IXPServiceWrapper);
local v5 = require(l_Parent_0.ExpChatShared);
local v6 = require(l_Parent_0.Roact);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.RoactRodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_None_0 = require(l_Parent_0.llama).None;
local v11 = require(l_Parent_0.SharedFlags);
local v12 = v5.Logger:new("ExpChat/" .. script.Name);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("BubbleChat");
local v14 = require(script.Parent.withSignalsData);
local l_Permissions_0 = require(l_script_FirstAncestor_0.Config).Permissions;
local v16 = require(l_script_FirstAncestor_0.GlobalFlags);
local l_getFFlagUseCharacterStore_0 = v5.Flags.getFFlagUseCharacterStore;
local v18 = game:DefineFastFlag("ExpChatRemoveBubbleChatAppUserMessagesState", false);
local l_FFlagExpChatUseMessagesStore_0 = require(l_Parent_0.SharedFlags).FFlagExpChatUseMessagesStore;
local v20 = game:DefineFastFlag("MemoizeBubbleChatApp", false);
local l_GetFFlagExpChatUseVoiceParticipantsStore_0 = v11.GetFFlagExpChatUseVoiceParticipantsStore;
local v22 = v6.PureComponent:extend("BubbleChatApp");
local v23 = require(l_script_FirstAncestor_0.Flags.GetFStringVoicePerformanceIXPLayerName);
local v24 = game:DefineFastString("BillboardUpdateFrequencyIXPLayerValue", "BillboardUpdateFrequency");
local v25 = require(l_script_FirstAncestor_1.BillboardGui);
if not v18 then
    v22.getDerivedStateFromProps = function(v26, v27) --[[ Line: 40 ]] --[[ Name: getDerivedStateFromProps ]]
        -- upvalues: l_Dictionary_0 (copy)
        return {
            userMessages = l_Dictionary_0.join(v27.userMessages or {}, v26.userMessages)
        };
    end;
end;
v22.init = function(v28) --[[ Line: 50 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy), v18 (copy), l_Dictionary_0 (copy), l_None_0 (copy), v16 (copy), v4 (copy), v23 (copy), v24 (copy)
    v12:debug("Initializing");
    v28:setState({
        userMessages = if v18 then nil else {}, 
        localPlayerVoiceEnabled = false, 
        billboardUpdateFrequency = -1
    });
    v28.onBillboardFadeOut = function(v29) --[[ Line: 58 ]]
        -- upvalues: v18 (ref), v28 (copy), l_Dictionary_0 (ref), l_None_0 (ref)
        if not v18 then
            v28:setState({
                userMessages = l_Dictionary_0.join(v28.state.userMessages, {
                    [v29] = l_None_0
                })
            });
        end;
    end;
    v28.setCameraPermissionStateFromControl = function(v30) --[[ Line: 66 ]]
        -- upvalues: v16 (ref), v28 (copy)
        if v16.DoNotPromptCameraPermissionsOnMount then
            v28:setState({
                hasCameraPermissions = v30
            });
        end;
    end;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 74 ]]
        -- upvalues: v4 (ref), v23 (ref)
        return v4:GetLayerData(v23());
    end);
    if l_status_0 and l_result_0 and l_result_0[v24] then
        v28:setState({
            billboardUpdateFrequency = l_result_0[v24]
        });
    end;
end;
v22.getPermissions = function(v33) --[[ Line: 88 ]] --[[ Name: getPermissions ]]
    local function v36(v34, v35) --[[ Line: 89 ]]
        -- upvalues: v33 (copy)
        v33:setState({
            hasCameraPermissions = v34, 
            hasMicPermissions = v35
        });
    end;
    if v33.props.getPermissions then
        v33.props.getPermissions(v36);
    end;
end;
v22.getMicPermission = function(v37) --[[ Line: 104 ]] --[[ Name: getMicPermission ]]
    -- upvalues: l_Permissions_0 (copy)
    local function v40(_, v39) --[[ Line: 105 ]]
        -- upvalues: v37 (copy)
        v37:setState({
            hasMicPermissions = v39
        });
    end;
    if v37.props.getPermissions then
        v37.props.getPermissions(v40, l_Permissions_0.MICROPHONE_ACCESS);
    end;
end;
v22.getCameraPermissionWithoutRequest = function(v41) --[[ Line: 119 ]] --[[ Name: getCameraPermissionWithoutRequest ]]
    -- upvalues: l_Permissions_0 (copy)
    local function v44(v42, _) --[[ Line: 120 ]]
        -- upvalues: v41 (copy)
        v41:setState({
            hasCameraPermissions = v42
        });
    end;
    if v41.props.getPermissions then
        v41.props.getPermissions(v44, l_Permissions_0.CAMERA_ACCESS, true);
    end;
end;
v22.didMount = function(v45) --[[ Line: 132 ]] --[[ Name: didMount ]]
    -- upvalues: v16 (copy), v12 (copy), l_Players_0 (copy), l_VoiceChatService_0 (copy), v4 (copy), v23 (copy)
    if v16.AvatarChatEnabled or v16.ChromeEnabled then
        if v16.DoNotPromptCameraPermissionsOnMount then
            if v45.props.isVoiceServiceInitialized and v16.RenderVoiceBubbleAfterAsyncInit then
                v45.props.isVoiceServiceInitialized():andThen(function() --[[ Line: 140 ]]
                    -- upvalues: v45 (copy)
                    v45:getMicPermission();
                end):catch(function() --[[ Line: 143 ]]
                    -- upvalues: v12 (ref)
                    v12:debug("VoiceChatServiceManager failed to initialize inside TextChatService bubblechat");
                end);
            else
                v45:getMicPermission();
            end;
            v45:getCameraPermissionWithoutRequest();
        else
            v45:getPermissions();
        end;
    end;
    task.spawn(function() --[[ Line: 155 ]]
        -- upvalues: l_Players_0 (ref), l_VoiceChatService_0 (ref), v12 (ref), v45 (copy), v4 (ref), v23 (ref)
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 156 ]]
            -- upvalues: l_Players_0 (ref), l_VoiceChatService_0 (ref)
            if l_Players_0.LocalPlayer then
                return l_VoiceChatService_0:IsVoiceEnabledForUserIdAsync(l_Players_0.LocalPlayer.UserId);
            else
                return false;
            end;
        end);
        if not l_status_1 then
            v12:debug("Unable to get voice enabled status: ", l_result_1);
            return;
        else
            if l_result_1 then
                v45:setState({
                    localPlayerVoiceEnabled = true
                });
                v4:LogUserLayerExposure(v23());
            end;
            return;
        end;
    end);
end;
v22.render = function(v48) --[[ Line: 177 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy), l_Players_0 (copy), v6 (copy), l_Dictionary_0 (copy), v25 (copy), l_FFlagExpChatUseMessagesStore_0 (copy)
    local v49 = {};
    if v48.props.characters then
        for v50, v51 in pairs(v48.props.characters) do
            if v51 and v51:IsDescendantOf(workspace) then
                v49[v50] = false;
            end;
        end;
    end;
    if v48.props.mockUserIdToPartOrModel then
        for v52, v53 in pairs(v48.props.mockUserIdToPartOrModel) do
            if v53 and v53:IsDescendantOf(workspace) then
                v49[v52] = false;
            end;
        end;
    end;
    if v48.props.voiceParticipants then
        for v54, v55 in pairs(v48.props.voiceParticipants) do
            if v55 ~= "Hidden" then
                v49[v54] = true;
            end;
        end;
    end;
    if v16.AvatarChatEnabled and v48.state.hasCameraPermissions and l_Players_0.LocalPlayer then
        v49[tostring(l_Players_0.LocalPlayer.UserId)] = true;
    end;
    return v6.createElement("ScreenGui", {
        ResetOnSpawn = false
    }, l_Dictionary_0.map(v49, function(v56, v57) --[[ Line: 222 ]]
        -- upvalues: v6 (ref), v25 (ref), v48 (copy), l_FFlagExpChatUseMessagesStore_0 (ref)
        return v6.createElement(v25, {
            userId = v57, 
            onFadeOut = v48.onBillboardFadeOut, 
            voiceEnabled = v48.props.voiceEnabled and v56, 
            getIconVoiceIndicator = v48.props.getIconVoiceIndicator, 
            onClickedVoiceIndicator = v48.props.onClickedVoiceIndicator, 
            onClickedCameraIndicator = v48.props.onClickedCameraIndicator, 
            selfViewListenerChanged = v48.props.selfViewListenerChanged, 
            hasCameraPermissions = v48.state.hasCameraPermissions, 
            hasMicPermissions = v48.state.hasMicPermissions, 
            displayCameraDeniedToast = v48.props.displayCameraDeniedToast, 
            isCamEnabledForUserAndPlace = v48.props.isCamEnabledForUserAndPlace, 
            isCameraOnlyUser = v48.props.isCameraOnlyUser, 
            setCameraPermissionStateFromControl = v48.setCameraPermissionStateFromControl, 
            getPermissions = v48.props.getPermissions, 
            isBubbleChatEnabled = if l_FFlagExpChatUseMessagesStore_0 then nil else v48.props.isBubbleChatEnabled, 
            voiceState = v48.props.voiceParticipants[v57], 
            partOrModel = v48.props.mockUserIdToPartOrModel[v57], 
            isTextChatServiceOn = v48.props.isTextChatServiceOn, 
            billboardUpdateFrequency = v48.state.billboardUpdateFrequency, 
            isEligibleForLikelySpeakingBubbles = v48.props.showLikelySpeakingBubbles, 
            onClickedLikelySpeakingBubble = v48.props.onClickedLikelySpeakingBubble
        }), "BubbleChat_" .. v57;
    end));
end;
local function v64(v58, v59) --[[ Line: 251 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagExpChatUseMessagesStore_0 (copy), v5 (copy), v18 (copy), l_getFFlagUseCharacterStore_0 (copy), l_GetFFlagExpChatUseVoiceParticipantsStore_0 (copy)
    local v60 = nil;
    if not l_FFlagExpChatUseMessagesStore_0 then
        v60 = if v59.isTextChatServiceOn then v58.BubbleChatSettings.Enabled else v58.LegacyBubbleChatSettings.Enabled;
    end;
    local l_mockUserIdToPartOrModel_0 = v58.Messages.mockUserIdToPartOrModel;
    if l_FFlagExpChatUseMessagesStore_0 then
        if v59.mockUserIdToPartOrModel then
            l_mockUserIdToPartOrModel_0 = v59.mockUserIdToPartOrModel;
        else
            local l_context_0 = v5.context;
            local v63 = l_context_0 and l_context_0.messagesStore;
            if v63 then
                l_mockUserIdToPartOrModel_0 = v63.getMockUserIdToPartOrModel(false);
            end;
        end;
    end;
    return {
        isBubbleChatEnabled = if l_FFlagExpChatUseMessagesStore_0 then nil else v60, 
        userMessages = if v18 then nil else v58.Messages.messagesBySenderId, 
        voiceEnabled = v58.Voice.isEnabled, 
        characters = if l_getFFlagUseCharacterStore_0() then nil else v58.Players.charactersByUserId, 
        voiceParticipants = if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then nil else v58.Voice.participants, 
        mockUserIdToPartOrModel = l_mockUserIdToPartOrModel_0, 
        showLikelySpeakingBubbles = v58.Voice.showLikelySpeakingBubbles
    };
end;
if l_getFFlagUseCharacterStore_0() or l_GetFFlagExpChatUseVoiceParticipantsStore_0() then
    local v65 = v8.connect(v64)(v22);
    if v20 then
        return (v7.memo(v14(v65)));
    else
        return (v14(v65));
    end;
elseif v20 then
    return (v7.memo(v8.connect(v64)(v22)));
else
    return (v8.connect(v64)(v22));
end;