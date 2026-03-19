local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_FFlagEnableUIManagerPackgify_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUIManagerPackgify;
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v7 = nil;
local v8 = nil;
local v9 = nil;
if l_isInExperienceUIVREnabled_0 or l_FFlagEnableUIManagerPackgify_0 then
    local v10 = require(l_CorePackages_0.Workspace.Packages.VrSpatialUi);
    v7 = v10.Constants.PanelType;
    v8 = v10.UIManager;
    v9 = v10.Constants.SpatialUIType;
else
    local l_UIManager_0 = l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("UIManager");
    local v12 = require(l_UIManager_0.Constants);
    v7 = v12.PanelType;
    v8 = require(l_UIManager_0.UIManager);
    v9 = v12.SpatialUIType;
end;
if game:DefineFastFlag("DebugExpChat", false) then
    require(l_CorePackages_0.Workspace.Packages.ExpChatDebug).start();
end;
if not game:IsLoaded() then
    local _ = game.Loaded:Wait();
end;
local v14 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v15 = require(l_RobloxGui_0.Modules.GameTranslator);
local v16 = require(l_RobloxGui_0.Modules.ApolloClient);
local v17 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
local v18 = game:DefineFastFlag("FFlagEnableSetCoreGuiEnabledExpChat", false);
local v19 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatCoreScriptSupport();
local v20 = require(l_RobloxGui_0.Modules.Flags.getFFlagAddApolloClientToExperienceChat);
local v21 = require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
local v22 = require(l_RobloxGui_0.Modules.Flags.getFFlagEnableAlwaysAvailableCamera);
local v23 = require(l_RobloxGui_0.Modules.Flags.getFFlagRenderVoiceBubbleAfterAsyncInit);
local l_GetFFlagShowLikelySpeakingBubbles_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagShowLikelySpeakingBubbles;
local v25 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
local v26 = require(l_RobloxGui_0.Modules.VR.IsSpatialRobloxGuiEnabled);
local l_getFFlagExpChatAlwaysRunTCS_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagExpChatAlwaysRunTCS;
local v28 = require(l_RobloxGui_0.Modules.VoiceChat.Components.getIconVoiceIndicator);
local v29 = require(l_RobloxGui_0.Modules.VoiceChat.Components.onClickedVoiceIndicator);
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
if v19 then
    v30 = require(l_RobloxGui_0.Modules.VoiceChat.Components.onClickedCameraIndicator);
    v31 = require(l_RobloxGui_0.Modules.VoiceChat.Components.getPermissions);
    v32 = require(l_RobloxGui_0.Modules.VoiceChat.Components.selfViewListenerChanged);
    if v21() then
        v33 = require(l_RobloxGui_0.Modules.VoiceChat.Helpers.displayCameraDeniedToast);
        v34 = require(l_RobloxGui_0.Modules.Settings.isCamEnabledForUserAndPlace);
    end;
    if v22() then
        v35 = require(l_RobloxGui_0.Modules.Settings.isCameraOnlyUser);
    end;
    if v23() then
        v36 = require(l_RobloxGui_0.Modules.VoiceChat.Components.isVoiceServiceInitialized);
    end;
end;
if l_GetFFlagShowLikelySpeakingBubbles_0() then
    v37 = require(l_RobloxGui_0.Modules.VoiceChat.Components.onClickedLikelySpeakingBubble);
end;
if v25 then
    v31 = require(l_RobloxGui_0.Modules.VoiceChat.Components.getPermissions);
end;
local v38 = nil;
local v39 = nil;
if v26 then
    local v40 = {
        panelType = v7.Chat, 
        screenGuiProps = {
            Name = "ExperienceChat", 
            ResetOnSpawn = false, 
            DisplayOrder = -1, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }
    };
    local v41 = v8.getInstance():createUI(v40);
    v38 = v41.panelObject;
    v39 = v41;
    if l_isInExperienceUIVREnabled_0 then
        local v42 = require(l_CorePackages_0.Workspace.Packages.Observable);
        local v43 = require(l_CoreGui_0.RobloxGui.Modules.ChatSelector);
        local v44 = v42.ObservableValue.new(v43:GetVisibility());
        v43.VisibilityStateChanged:connect(function(v45) --[[ Line: 112 ]]
            -- upvalues: v44 (copy)
            v44:set(v45);
        end);
        v8.getInstance():connectPanelVisibility(v40.panelType, v44);
    end;
else
    v38 = Instance.new("ScreenGui");
    v38.Name = "ExperienceChat";
    v38.ResetOnSpawn = false;
    v38.DisplayOrder = -1;
    v38.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    v38.Parent = l_CoreGui_0;
end;
local function v48(v46) --[[ Line: 126 ]] --[[ Name: findTextChannel ]]
    -- upvalues: l_TextChatService_0 (copy)
    local l_l_TextChatService_0_FirstChild_0 = l_TextChatService_0:FindFirstChild(v46, true);
    while not l_l_TextChatService_0_FirstChild_0 do
        wait();
        l_l_TextChatService_0_FirstChild_0 = l_TextChatService_0:FindFirstChild(v46, true);
    end;
    return l_l_TextChatService_0_FirstChild_0;
end;
if v18 then
    l_StarterGui_0.CoreGuiChangedSignal:Connect(function(v49, v50) --[[ Line: 137 ]]
        -- upvalues: v17 (copy)
        if v49 == Enum.CoreGuiType.All or v49 == Enum.CoreGuiType.Chat then
            v17.Events.SetCoreGuiEnabledChanged(v50);
        end;
    end);
end;
local v51 = nil;
local l_IChatSettings_0 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Types).IChatSettings;
if l_getFFlagExpChatAlwaysRunTCS_0() then
    v51 = l_TextChatService_0.CreateDefaultTextChannels;
else
    local v53 = false;
    if l_TextChatService_0.ChatVersion == Enum.ChatVersion.TextChatService then
        v53 = l_TextChatService_0.CreateDefaultTextChannels;
    end;
    v51 = v53;
end;
v17.mountClientApp({
    apolloClient = if v20() then v16 else nil, 
    getIconVoiceIndicator = v28 or nil, 
    onClickedVoiceIndicator = v29 or nil, 
    onClickedCameraIndicator = v30 or nil, 
    displayCameraDeniedToast = v33 or nil, 
    isCamEnabledForUserAndPlace = v34 or nil, 
    isCameraOnlyUser = v35 or nil, 
    getPermissions = v31 or nil, 
    selfViewListenerChanged = v32 or nil, 
    defaultTargetTextChannel = if v51 then v48("RBXGeneral") else nil, 
    defaultSystemTextChannel = if v51 then v48("RBXSystem") else nil, 
    validateLegacyBubbleChatSettings = l_IChatSettings_0 or nil, 
    isVoiceServiceInitialized = v36 or nil, 
    onClickedLikelySpeakingBubble = v37 or nil, 
    translator = v14, 
    gameTranslator = v15, 
    parent = v38, 
    isSpatialUIEnabled = v39 and v39.type == v9.SpatialUI
});