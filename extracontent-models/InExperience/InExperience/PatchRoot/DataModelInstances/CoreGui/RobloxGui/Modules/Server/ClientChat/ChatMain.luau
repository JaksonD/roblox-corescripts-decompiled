local v0 = {
    Visible = nil, 
    IsCoreGuiEnabled = nil, 
    TopbarEnabled = nil, 
    VisibilityStateChanged = nil
};
local v1 = false;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 22 ]]
    return UserSettings():IsUserFeatureEnabled("UserHandleFriendJoinNotifierOnClient");
end);
if l_status_0 then
    v1 = l_result_0;
end;
l_status_0 = false;
local v4;
l_result_0, v4 = pcall(function() --[[ Line: 32 ]]
    return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2");
end);
l_status_0 = l_result_0 and v4;
l_result_0 = nil;
local v5;
v4, v5 = pcall(function() --[[ Line: 39 ]]
    return UserSettings():IsUserFeatureEnabled("UserAddBetterConsoleCheckForLegacyChat");
end);
l_result_0 = v4 and v5;
v4 = game:GetService("RunService");
v5 = game:GetService("ReplicatedStorage");
local l_Chat_0 = game:GetService("Chat");
local l_StarterGui_0 = game:GetService("StarterGui");
local _ = game:GetService("ContextActionService");
local l_DefaultChatSystemChatEvents_0 = v5:WaitForChild("DefaultChatSystemChatEvents");
local l_DefaultChatSystemChatEvents_1 = v5:WaitForChild("DefaultChatSystemChatEvents");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_ChatConstants_0 = require(l_ClientChatModules_0:WaitForChild("ChatConstants"));
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_MessageCreatorModules_0 = l_ClientChatModules_0:WaitForChild("MessageCreatorModules");
local l_Util_0 = require(l_MessageCreatorModules_0:WaitForChild("Util"));
local v16 = nil;
pcall(function() --[[ Line: 63 ]]
    -- upvalues: v16 (ref)
    v16 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if v16 == nil then
    v16 = {
        Get = function(_, _, v19) --[[ Line: 64 ]] --[[ Name: Get ]]
            return v19;
        end
    };
end;
local v20 = nil;
if l_status_0 then
    v20 = script:FindFirstChild("ChatTranslationEnabled");
    if v20 == nil then
        local v21 = nil;
        do
            local l_v21_0 = v21;
            l_v21_0 = script.ChildAdded:Connect(function(v23) --[[ Line: 71 ]]
                -- upvalues: v20 (ref), l_v21_0 (ref)
                if v23.Name == "ChatTranslationEnabled" then
                    v20 = v23;
                    l_v21_0:Disconnect();
                end;
            end);
        end;
    end;
end;
local v24 = 10;
local v25 = {
    OnNewMessage = "RemoteEvent", 
    OnMessageDoneFiltering = "RemoteEvent", 
    OnNewSystemMessage = "RemoteEvent", 
    OnChannelJoined = "RemoteEvent", 
    OnChannelLeft = "RemoteEvent", 
    OnMuted = "RemoteEvent", 
    OnUnmuted = "RemoteEvent", 
    OnMainChannelSet = "RemoteEvent", 
    SayMessageRequest = "RemoteEvent", 
    GetInitDataRequest = "RemoteFunction"
};
local v26 = {};
local l_BindableEvent_0 = Instance.new("BindableEvent");
TryRemoveChildWithVerifyingIsCorrectType = function(v28) --[[ Line: 104 ]] --[[ Name: TryRemoveChildWithVerifyingIsCorrectType ]]
    -- upvalues: v25 (copy), v26 (copy), v24 (ref)
    if v25[v28.Name] and v28:IsA(v25[v28.Name]) then
        v25[v28.Name] = nil;
        v26[v28.Name] = v28;
        v24 = v24 - 1;
    end;
end;
for _, v30 in pairs(l_DefaultChatSystemChatEvents_1:GetChildren()) do
    TryRemoveChildWithVerifyingIsCorrectType(v30);
end;
if v24 > 0 then
    local v32 = l_DefaultChatSystemChatEvents_1.ChildAdded:connect(function(v31) --[[ Line: 117 ]]
        -- upvalues: v24 (ref), l_BindableEvent_0 (copy)
        TryRemoveChildWithVerifyingIsCorrectType(v31);
        if v24 < 1 then
            l_BindableEvent_0:Fire();
        end;
    end);
    l_BindableEvent_0.Event:wait();
    v32:disconnect();
    l_BindableEvent_0:Destroy();
end;
l_DefaultChatSystemChatEvents_1 = v26;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v37 = true;
local v38 = 6;
if l_ChatSettings_0.ScreenGuiDisplayOrder ~= nil then
    v38 = l_ChatSettings_0.ScreenGuiDisplayOrder;
end;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_ScreenGui_0 = Instance.new("ScreenGui");
l_ScreenGui_0.Name = "Chat";
l_ScreenGui_0.ResetOnSpawn = false;
l_ScreenGui_0.DisplayOrder = v38;
l_ScreenGui_0.Parent = l_PlayerGui_0;
if l_result_0 and game:GetService("GuiService"):IsTenFootInterface() then
    l_ScreenGui_0.Enabled = false;
end;
local v41 = false;
local l_script_0 = script;
local l_ChatWindow_0 = require(l_script_0:WaitForChild("ChatWindow"));
local l_ChatBar_0 = require(l_script_0:WaitForChild("ChatBar"));
local l_ChannelsBar_0 = require(l_script_0:WaitForChild("ChannelsBar"));
local _ = require(l_script_0:WaitForChild("MessageLabelCreator"));
local l_MessageLogDisplay_0 = require(l_script_0:WaitForChild("MessageLogDisplay"));
local _ = require(l_script_0:WaitForChild("ChatChannel"));
local l_CommandProcessor_0 = require(l_script_0:WaitForChild("CommandProcessor"));
local v50 = l_ChatWindow_0.new();
local v51 = l_ChannelsBar_0.new();
local v52 = l_MessageLogDisplay_0.new();
local v53 = l_CommandProcessor_0.new();
local v54 = l_ChatBar_0.new(v53, v50);
v50:CreateGuiObjects(l_ScreenGui_0);
v50:RegisterChatBar(v54);
v50:RegisterChannelsBar(v51);
v50:RegisterMessageLogDisplay(v52);
l_Util_0:RegisterChatWindow(v50);
local l_MessageSender_0 = require(l_script_0:WaitForChild("MessageSender"));
l_MessageSender_0:RegisterSayMessageFunction(l_DefaultChatSystemChatEvents_1.SayMessageRequest);
if l_UserInputService_0.TouchEnabled then
    v54:SetTextLabelText(v16:Get("GameChat_ChatMain_ChatBarTextTouch", "Tap here to chat"));
else
    v54:SetTextLabelText(v16:Get("GameChat_ChatMain_ChatBarText", "To chat click here or press \"/\" key"));
end;
spawn(function() --[[ Line: 204 ]]
    -- upvalues: l_script_0 (copy), l_ChatSettings_0 (copy), v50 (copy)
    local l_CurveUtil_0 = require(l_script_0:WaitForChild("CurveUtil"));
    local v57 = 1 / (l_ChatSettings_0.ChatAnimationFPS or 20);
    local v58 = tick();
    while true do
        local v59 = tick();
        local v60 = l_CurveUtil_0:DeltaTimeToTimescale(v59 - v58);
        if v60 ~= 0 then
            v50:Update(v60);
        end;
        v58 = v59;
        wait(v57);
    end;
end);
CheckIfPointIsInSquare = function(v61, v62, v63) --[[ Line: 230 ]] --[[ Name: CheckIfPointIsInSquare ]]
    local v64 = false;
    if v62.X <= v61.X then
        v64 = false;
        if v61.X <= v63.X then
            v64 = false;
            if v62.Y <= v61.Y then
                v64 = v61.Y <= v63.Y;
            end;
        end;
    end;
    return v64;
end;
local v65 = false;
local v66 = false;
local v67 = 0;
local v68 = 0;
local l_BindableEvent_1 = Instance.new("BindableEvent");
local l_BindableEvent_2 = Instance.new("BindableEvent");
local l_BindableEvent_3 = Instance.new("BindableEvent");
DoBackgroundFadeIn = function(v72) --[[ Line: 244 ]] --[[ Name: DoBackgroundFadeIn ]]
    -- upvalues: v68 (ref), v65 (ref), l_BindableEvent_1 (copy), v50 (copy), l_ChatSettings_0 (copy), v52 (copy), l_MessageLogDisplay_0 (copy)
    v68 = tick();
    v65 = false;
    l_BindableEvent_1:Fire();
    v50:FadeInBackground(v72 or l_ChatSettings_0.ChatDefaultFadeDuration);
    if v50:GetCurrentChannel() then
        local l_Scroller_0 = v52.Scroller;
        l_Scroller_0.ScrollingEnabled = true;
        l_Scroller_0.ScrollBarThickness = l_MessageLogDisplay_0.ScrollBarThickness;
    end;
end;
DoBackgroundFadeOut = function(v74) --[[ Line: 259 ]] --[[ Name: DoBackgroundFadeOut ]]
    -- upvalues: v68 (ref), v65 (ref), l_BindableEvent_1 (copy), v50 (copy), l_ChatSettings_0 (copy), v52 (copy)
    v68 = tick();
    v65 = true;
    l_BindableEvent_1:Fire();
    v50:FadeOutBackground(v74 or l_ChatSettings_0.ChatDefaultFadeDuration);
    if v50:GetCurrentChannel() then
        local l_Scroller_1 = v52.Scroller;
        l_Scroller_1.ScrollingEnabled = false;
        l_Scroller_1.ScrollBarThickness = 0;
    end;
end;
DoTextFadeIn = function(v76) --[[ Line: 274 ]] --[[ Name: DoTextFadeIn ]]
    -- upvalues: v67 (ref), v66 (ref), l_BindableEvent_1 (copy), v50 (copy), l_ChatSettings_0 (copy)
    v67 = tick();
    v66 = false;
    l_BindableEvent_1:Fire();
    v50:FadeInText((v76 or l_ChatSettings_0.ChatDefaultFadeDuration) * 0);
end;
DoTextFadeOut = function(v77) --[[ Line: 281 ]] --[[ Name: DoTextFadeOut ]]
    -- upvalues: v67 (ref), v66 (ref), l_BindableEvent_1 (copy), v50 (copy), l_ChatSettings_0 (copy)
    v67 = tick();
    v66 = true;
    l_BindableEvent_1:Fire();
    v50:FadeOutText(v77 or l_ChatSettings_0.ChatDefaultFadeDuration);
end;
DoFadeInFromNewInformation = function() --[[ Line: 288 ]] --[[ Name: DoFadeInFromNewInformation ]]
    -- upvalues: l_ChatSettings_0 (copy)
    DoTextFadeIn();
    if l_ChatSettings_0.ChatShouldFadeInFromNewInformation then
        DoBackgroundFadeIn();
    end;
end;
InstantFadeIn = function() --[[ Line: 295 ]] --[[ Name: InstantFadeIn ]]
    DoBackgroundFadeIn(0);
    DoTextFadeIn(0);
end;
InstantFadeOut = function() --[[ Line: 300 ]] --[[ Name: InstantFadeOut ]]
    DoBackgroundFadeOut(0);
    DoTextFadeOut(0);
end;
local v78 = nil;
UpdateFadingForMouseState = function(v79) --[[ Line: 306 ]] --[[ Name: UpdateFadingForMouseState ]]
    -- upvalues: v78 (ref), l_BindableEvent_2 (copy), v54 (copy)
    v78 = v79;
    l_BindableEvent_2:Fire();
    if v54:IsFocused() then
        return;
    elseif v79 then
        DoBackgroundFadeIn();
        DoTextFadeIn();
        return;
    else
        DoBackgroundFadeIn();
        return;
    end;
end;
spawn(function() --[[ Line: 322 ]]
    -- upvalues: l_RunService_0 (copy), v78 (ref), v54 (copy), l_BindableEvent_2 (copy), l_BindableEvent_3 (copy), v65 (ref), v68 (ref), l_ChatSettings_0 (copy), v66 (ref), v67 (ref), l_BindableEvent_1 (copy)
    while true do
        l_RunService_0.RenderStepped:wait();
        while true do
            if v78 or v54:IsFocused() then
                if v78 then
                    l_BindableEvent_2.Event:wait();
                end;
                if v54:IsFocused() then
                    l_BindableEvent_3.Event:wait();
                end;
            elseif not v65 then
                if tick() - v68 > l_ChatSettings_0.ChatWindowBackgroundFadeOutTime then
                    DoBackgroundFadeOut();
                    break;
                else
                    break;
                end;
            elseif not v66 then
                if tick() - v67 > l_ChatSettings_0.ChatWindowTextFadeOutTime then
                    DoTextFadeOut();
                    break;
                else
                    break;
                end;
            else
                l_BindableEvent_1.Event:wait();
                break;
            end;
        end;
    end;
end);
getClassicChatEnabled = function() --[[ Line: 355 ]] --[[ Name: getClassicChatEnabled ]]
    -- upvalues: l_ChatSettings_0 (copy), l_Players_0 (copy)
    if l_ChatSettings_0.ClassicChatEnabled ~= nil then
        return l_ChatSettings_0.ClassicChatEnabled;
    else
        return l_Players_0.ClassicChat;
    end;
end;
getBubbleChatEnabled = function() --[[ Line: 362 ]] --[[ Name: getBubbleChatEnabled ]]
    -- upvalues: l_ChatSettings_0 (copy), l_Players_0 (copy)
    if l_ChatSettings_0.BubbleChatEnabled ~= nil then
        return l_ChatSettings_0.BubbleChatEnabled;
    else
        return l_Players_0.BubbleChat;
    end;
end;
bubbleChatOnly = function() --[[ Line: 369 ]] --[[ Name: bubbleChatOnly ]]
    return not getClassicChatEnabled() and getBubbleChatEnabled();
end;
UpdateMousePosition = function(v80) --[[ Line: 373 ]] --[[ Name: UpdateMousePosition ]]
    -- upvalues: v0 (copy), l_ChatSettings_0 (copy), v50 (copy), v78 (ref)
    if not v0.Visible or not v0.IsCoreGuiEnabled or not v0.TopbarEnabled and not l_ChatSettings_0.ChatOnWithTopBarOff then
        return;
    elseif bubbleChatOnly() then
        return;
    else
        local l_AbsolutePosition_0 = v50.GuiObject.AbsolutePosition;
        local l_AbsoluteSize_0 = v50.GuiObject.AbsoluteSize;
        local v83 = CheckIfPointIsInSquare(v80, l_AbsolutePosition_0, l_AbsolutePosition_0 + l_AbsoluteSize_0);
        if v83 ~= v78 then
            UpdateFadingForMouseState(v83);
        end;
        return;
    end;
end;
l_UserInputService_0.InputChanged:connect(function(v84, _) --[[ Line: 390 ]]
    if v84.UserInputType == Enum.UserInputType.MouseMovement then
        local v86 = Vector2.new(v84.Position.X, v84.Position.Y);
        UpdateMousePosition(v86);
    end;
end);
l_UserInputService_0.TouchTap:connect(function(v87, _) --[[ Line: 397 ]]
    UpdateMousePosition(v87[1]);
end);
l_UserInputService_0.TouchMoved:connect(function(v89, _) --[[ Line: 401 ]]
    local v91 = Vector2.new(v89.Position.X, v89.Position.Y);
    UpdateMousePosition(v91);
end);
l_UserInputService_0.Changed:connect(function(v92) --[[ Line: 406 ]]
    -- upvalues: l_UserInputService_0 (copy), v50 (copy), l_ScreenGui_0 (copy)
    if v92 == "MouseBehavior" and l_UserInputService_0.MouseBehavior == Enum.MouseBehavior.LockCenter then
        local l_AbsolutePosition_1 = v50.GuiObject.AbsolutePosition;
        local l_AbsoluteSize_1 = v50.GuiObject.AbsoluteSize;
        local l_AbsoluteSize_2 = l_ScreenGui_0.AbsoluteSize;
        if CheckIfPointIsInSquare(l_AbsoluteSize_2 / 2, l_AbsolutePosition_1, l_AbsolutePosition_1 + l_AbsoluteSize_1) then
            l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.Default;
        end;
    end;
end);
UpdateFadingForMouseState(true);
UpdateFadingForMouseState(false);
local v104 = {
    Signal = function() --[[ Line: 431 ]] --[[ Name: Signal ]]
        local v96 = {};
        local l_BindableEvent_4 = Instance.new("BindableEvent");
        local v98 = nil;
        local v99 = nil;
        v96.fire = function(_, ...) --[[ Line: 439 ]] --[[ Name: fire ]]
            -- upvalues: v98 (ref), v99 (ref), l_BindableEvent_4 (copy)
            v98 = {
                ...
            };
            v99 = select("#", ...);
            l_BindableEvent_4:Fire();
        end;
        v96.connect = function(_, v102) --[[ Line: 445 ]] --[[ Name: connect ]]
            -- upvalues: l_BindableEvent_4 (copy), v98 (ref), v99 (ref)
            if not v102 then
                error("connect(nil)", 2);
            end;
            return l_BindableEvent_4.Event:connect(function() --[[ Line: 447 ]]
                -- upvalues: v102 (copy), v98 (ref), v99 (ref)
                v102(unpack(v98, 1, v99));
            end);
        end;
        v96.wait = function(_) --[[ Line: 452 ]] --[[ Name: wait ]]
            -- upvalues: l_BindableEvent_4 (copy), v98 (ref), v99 (ref)
            l_BindableEvent_4.Event:wait();
            assert(v98, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.");
            return unpack(v98, 1, v99);
        end;
        return v96;
    end
};
SetVisibility = function(v105) --[[ Line: 463 ]] --[[ Name: SetVisibility ]]
    -- upvalues: v50 (copy), v0 (copy)
    v50:SetVisible(v105);
    v0.VisibilityStateChanged:fire(v105);
    v0.Visible = v105;
    if v0.IsCoreGuiEnabled then
        if v105 then
            InstantFadeIn();
            return;
        else
            InstantFadeOut();
        end;
    end;
end;
local v106 = nil;
v0.TopbarEnabled = true;
v0.MessageCount = 0;
v0.Visible = true;
v0.IsCoreGuiEnabled = true;
v0.ToggleVisibility = function(_) --[[ Line: 485 ]] --[[ Name: ToggleVisibility ]]
    -- upvalues: v50 (copy)
    SetVisibility(not v50:GetVisible());
end;
v0.SetVisible = function(_, v109) --[[ Line: 489 ]] --[[ Name: SetVisible ]]
    -- upvalues: v50 (copy)
    if v50:GetVisible() ~= v109 then
        SetVisibility(v109);
    end;
end;
v0.FocusChatBar = function(_) --[[ Line: 495 ]] --[[ Name: FocusChatBar ]]
    -- upvalues: v54 (copy)
    v54:CaptureFocus();
end;
v0.EnterWhisperState = function(_, v112) --[[ Line: 499 ]] --[[ Name: EnterWhisperState ]]
    -- upvalues: v54 (copy)
    v54:EnterWhisperState(v112);
end;
v0.GetVisibility = function(_) --[[ Line: 503 ]] --[[ Name: GetVisibility ]]
    -- upvalues: v50 (copy)
    return v50:GetVisible();
end;
v0.GetMessageCount = function(v114) --[[ Line: 507 ]] --[[ Name: GetMessageCount ]]
    return v114.MessageCount;
end;
v0.TopbarEnabledChanged = function(v115, v116) --[[ Line: 511 ]] --[[ Name: TopbarEnabledChanged ]]
    v115.TopbarEnabled = v116;
    v115.CoreGuiEnabled:fire(game:GetService("StarterGui"):GetCoreGuiEnabled(Enum.CoreGuiType.Chat));
end;
v0.IsFocused = function(_, _) --[[ Line: 516 ]] --[[ Name: IsFocused ]]
    -- upvalues: v54 (copy)
    return v54:IsFocused();
end;
v0.ChatBarFocusChanged = v104.Signal();
v0.VisibilityStateChanged = v104.Signal();
v0.MessagesChanged = v104.Signal();
v0.MessagePosted = v104.Signal();
v0.CoreGuiEnabled = v104.Signal();
v0.ChatMakeSystemMessageEvent = v104.Signal();
v0.ChatWindowPositionEvent = v104.Signal();
v0.ChatWindowSizeEvent = v104.Signal();
v0.ChatBarDisabledEvent = v104.Signal();
v0.fChatWindowPosition = function(_) --[[ Line: 534 ]] --[[ Name: fChatWindowPosition ]]
    -- upvalues: v50 (copy)
    return v50.GuiObject.Position;
end;
v0.fChatWindowSize = function(_) --[[ Line: 538 ]] --[[ Name: fChatWindowSize ]]
    -- upvalues: v50 (copy)
    return v50.GuiObject.Size;
end;
v0.fChatBarDisabled = function(_) --[[ Line: 542 ]] --[[ Name: fChatBarDisabled ]]
    -- upvalues: v54 (copy)
    return not v54:GetEnabled();
end;
v0.SpecialKeyPressed = function(_, v123, _) --[[ Line: 546 ]] --[[ Name: SpecialKeyPressed ]]
    -- upvalues: v37 (ref), v106 (ref)
    if v123 == Enum.SpecialKey.ChatHotkey and v37 then
        v106();
    end;
end;
v0.CoreGuiEnabled:connect(function(v125) --[[ Line: 555 ]]
    -- upvalues: v0 (copy), l_ChatSettings_0 (copy), v50 (copy), v54 (copy)
    v0.IsCoreGuiEnabled = v125;
    v125 = v125 and (v0.TopbarEnabled or l_ChatSettings_0.ChatOnWithTopBarOff);
    v50:SetCoreGuiEnabled(v125);
    if not v125 then
        v54:ReleaseFocus();
        InstantFadeOut();
        return;
    else
        InstantFadeIn();
        return;
    end;
end);
trimTrailingSpaces = function(v126) --[[ Line: 570 ]] --[[ Name: trimTrailingSpaces ]]
    local v127 = #v126;
    while v127 > 0 and v126:find("^%s", v127) do
        v127 = v127 - 1;
    end;
    return v126:sub(1, v127);
end;
v0.ChatMakeSystemMessageEvent:connect(function(v128) --[[ Line: 583 ]]
    -- upvalues: v41 (ref), l_ChatSettings_0 (copy), v50 (copy), l_ChatConstants_0 (copy), v51 (copy), v0 (copy)
    if v128.Text and type(v128.Text) == "string" then
        while not v41 do
            wait();
        end;
        local l_GeneralChannelName_0 = l_ChatSettings_0.GeneralChannelName;
        local l_v50_Channel_0 = v50:GetChannel(l_GeneralChannelName_0);
        if l_v50_Channel_0 then
            l_v50_Channel_0:AddMessageToChannel({
                ID = -1, 
                FromSpeaker = nil, 
                SpeakerUserId = 0, 
                OriginalChannel = l_GeneralChannelName_0, 
                IsFiltered = true, 
                MessageLength = string.len(v128.Text), 
                MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(v128.Text)), 
                Message = trimTrailingSpaces(v128.Text), 
                MessageType = l_ChatConstants_0.MessageTypeSetCore, 
                Time = os.time(), 
                ExtraData = v128
            });
            v51:UpdateMessagePostedInChannel(l_GeneralChannelName_0);
            v0.MessageCount = v0.MessageCount + 1;
            v0.MessagesChanged:fire(v0.MessageCount);
        end;
    end;
end);
v0.ChatBarDisabledEvent:connect(function(v131) --[[ Line: 613 ]]
    -- upvalues: v37 (ref), v54 (copy)
    if v37 then
        v54:SetEnabled(not v131);
        if v131 then
            v54:ReleaseFocus();
        end;
    end;
end);
v0.ChatWindowSizeEvent:connect(function(v132) --[[ Line: 622 ]]
    -- upvalues: v50 (copy)
    v50.GuiObject.Size = v132;
end);
v0.ChatWindowPositionEvent:connect(function(v133) --[[ Line: 626 ]]
    -- upvalues: v50 (copy)
    v50.GuiObject.Position = v133;
end);
v106 = function() --[[ Line: 634 ]] --[[ Name: DoChatBarFocus ]]
    -- upvalues: v50 (copy), v54 (copy), v0 (copy)
    if not v50:GetCoreGuiEnabled() then
        return;
    elseif not v54:GetEnabled() then
        return;
    else
        if not v54:IsFocused() and v54:GetVisible() then
            v0:SetVisible(true);
            InstantFadeIn();
            v54:CaptureFocus();
            v0.ChatBarFocusChanged:fire(true);
        end;
        return;
    end;
end;
l_BindableEvent_3.Event:connect(function(v134) --[[ Line: 646 ]]
    -- upvalues: v0 (copy)
    v0.ChatBarFocusChanged:fire(v134);
end);
DoSwitchCurrentChannel = function(v135) --[[ Line: 650 ]] --[[ Name: DoSwitchCurrentChannel ]]
    -- upvalues: v50 (copy)
    if v50:GetChannel(v135) then
        v50:SwitchCurrentChannel(v135);
    end;
end;
SendMessageToSelfInTargetChannel = function(v136, v137, v138) --[[ Line: 656 ]] --[[ Name: SendMessageToSelfInTargetChannel ]]
    -- upvalues: v50 (copy), l_ChatConstants_0 (copy)
    local l_v50_Channel_1 = v50:GetChannel(v137);
    if l_v50_Channel_1 then
        l_v50_Channel_1:AddMessageToChannel({
            ID = -1, 
            FromSpeaker = nil, 
            SpeakerUserId = 0, 
            OriginalChannel = v137, 
            IsFiltered = true, 
            MessageLength = string.len(v136), 
            MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(v136)), 
            Message = trimTrailingSpaces(v136), 
            MessageType = l_ChatConstants_0.MessageTypeSystem, 
            Time = os.time(), 
            ExtraData = v138
        });
    end;
end;
chatBarFocused = function() --[[ Line: 677 ]] --[[ Name: chatBarFocused ]]
    -- upvalues: v78 (ref), v66 (ref), l_BindableEvent_3 (copy)
    if not v78 then
        DoBackgroundFadeIn();
        if v66 then
            DoTextFadeIn();
        end;
    end;
    l_BindableEvent_3:Fire(true);
end;
chatBarFocusLost = function(v140, _) --[[ Line: 689 ]] --[[ Name: chatBarFocusLost ]]
    -- upvalues: l_BindableEvent_3 (copy), v54 (copy), v0 (copy), v53 (copy), v50 (copy), l_ChatSettings_0 (copy), l_MessageSender_0 (copy)
    DoBackgroundFadeIn();
    l_BindableEvent_3:Fire(false);
    if v140 then
        local l_Text_0 = v54:GetTextBox().Text;
        if v54:IsInCustomState() then
            local l_v54_CustomMessage_0 = v54:GetCustomMessage();
            if l_v54_CustomMessage_0 then
                l_Text_0 = l_v54_CustomMessage_0;
            end;
            local v144 = v54:CustomStateProcessCompletedMessage(l_Text_0);
            v54:ResetCustomState();
            if v144 then
                return;
            end;
        end;
        v54:GetTextBox().Text = "";
        if l_Text_0 ~= "" then
            v0.MessagePosted:fire(l_Text_0);
            if not v53:ProcessCompletedChatMessage(l_Text_0, v50) then
                if l_ChatSettings_0.DisallowedWhiteSpace then
                    for v145 = 1, #l_ChatSettings_0.DisallowedWhiteSpace do
                        if l_ChatSettings_0.DisallowedWhiteSpace[v145] == "\t" then
                            l_Text_0 = string.gsub(l_Text_0, l_ChatSettings_0.DisallowedWhiteSpace[v145], " ");
                        else
                            l_Text_0 = string.gsub(l_Text_0, l_ChatSettings_0.DisallowedWhiteSpace[v145], "");
                        end;
                    end;
                end;
                l_Text_0 = string.gsub(l_Text_0, "\n", "");
                l_Text_0 = string.gsub(l_Text_0, "[ ]+", " ");
                local l_v50_TargetMessageChannel_0 = v50:GetTargetMessageChannel();
                if l_v50_TargetMessageChannel_0 then
                    l_MessageSender_0:SendMessage(l_Text_0, l_v50_TargetMessageChannel_0);
                    return;
                else
                    l_MessageSender_0:SendMessage(l_Text_0, nil);
                end;
            end;
        end;
    end;
end;
local v147 = {};
setupChatBarConnections = function() --[[ Line: 740 ]] --[[ Name: setupChatBarConnections ]]
    -- upvalues: v147 (ref), v54 (copy)
    for v148 = 1, #v147 do
        v147[v148]:Disconnect();
    end;
    v147 = {};
    local v149 = v54:GetTextBox().FocusLost:connect(chatBarFocusLost);
    table.insert(v147, v149);
    local v150 = v54:GetTextBox().Focused:connect(chatBarFocused);
    table.insert(v147, v150);
end;
setupChatBarConnections();
v54.GuiObjectsChanged:connect(setupChatBarConnections);
getEchoMessagesInGeneral = function() --[[ Line: 756 ]] --[[ Name: getEchoMessagesInGeneral ]]
    -- upvalues: l_ChatSettings_0 (copy)
    if l_ChatSettings_0.EchoMessagesInGeneralChannel == nil then
        return true;
    else
        return l_ChatSettings_0.EchoMessagesInGeneralChannel;
    end;
end;
l_DefaultChatSystemChatEvents_1.OnMessageDoneFiltering.OnClientEvent:connect(function(v151) --[[ Line: 763 ]]
    -- upvalues: l_ChatSettings_0 (copy), l_LocalPlayer_0 (ref), v50 (copy)
    if not l_ChatSettings_0.ShowUserOwnFilteredMessage and v151.FromSpeaker == l_LocalPlayer_0.Name then
        return;
    else
        local l_OriginalChannel_0 = v151.OriginalChannel;
        local l_v50_Channel_2 = v50:GetChannel(l_OriginalChannel_0);
        if l_v50_Channel_2 then
            l_v50_Channel_2:UpdateMessageFiltered(v151);
        end;
        if getEchoMessagesInGeneral() and l_ChatSettings_0.GeneralChannelName and l_OriginalChannel_0 ~= l_ChatSettings_0.GeneralChannelName then
            local l_v50_Channel_3 = v50:GetChannel(l_ChatSettings_0.GeneralChannelName);
            if l_v50_Channel_3 then
                l_v50_Channel_3:UpdateMessageFiltered(v151);
            end;
        end;
        return;
    end;
end);
l_DefaultChatSystemChatEvents_1.OnNewMessage.OnClientEvent:connect(function(v155, v156) --[[ Line: 784 ]]
    -- upvalues: v50 (copy), l_LocalPlayer_0 (ref), v51 (copy), l_ChatSettings_0 (copy), v0 (copy)
    local l_v50_Channel_4 = v50:GetChannel(v156);
    if l_v50_Channel_4 then
        l_v50_Channel_4:AddMessageToChannel(v155);
        if v155.FromSpeaker ~= l_LocalPlayer_0.Name then
            v51:UpdateMessagePostedInChannel(v156);
        end;
        if getEchoMessagesInGeneral() and l_ChatSettings_0.GeneralChannelName and v156 ~= l_ChatSettings_0.GeneralChannelName then
            local l_v50_Channel_5 = v50:GetChannel(l_ChatSettings_0.GeneralChannelName);
            if l_v50_Channel_5 then
                l_v50_Channel_5:AddMessageToChannel(v155);
            end;
        end;
        v0.MessageCount = v0.MessageCount + 1;
        v0.MessagesChanged:fire(v0.MessageCount);
        DoFadeInFromNewInformation();
    end;
end);
l_DefaultChatSystemChatEvents_1.OnNewSystemMessage.OnClientEvent:connect(function(v159, v160) --[[ Line: 807 ]]
    -- upvalues: v50 (copy), v51 (copy), v0 (copy), l_ChatSettings_0 (copy)
    v160 = v160 or "System";
    local l_v50_Channel_6 = v50:GetChannel(v160);
    if l_v50_Channel_6 then
        l_v50_Channel_6:AddMessageToChannel(v159);
        v51:UpdateMessagePostedInChannel(v160);
        v0.MessageCount = v0.MessageCount + 1;
        v0.MessagesChanged:fire(v0.MessageCount);
        DoFadeInFromNewInformation();
        if getEchoMessagesInGeneral() and l_ChatSettings_0.GeneralChannelName and v160 ~= l_ChatSettings_0.GeneralChannelName then
            local l_v50_Channel_7 = v50:GetChannel(l_ChatSettings_0.GeneralChannelName);
            if l_v50_Channel_7 then
                l_v50_Channel_7:AddMessageToChannel(v159);
                return;
            end;
        end;
    else
        warn(string.format("Just received system message for channel I'm not in [%s]", v160));
    end;
end);
HandleChannelJoined = function(v163, v164, v165, v166, v167, v168) --[[ Line: 833 ]] --[[ Name: HandleChannelJoined ]]
    -- upvalues: v50 (copy), l_ChatSettings_0 (copy), v41 (ref), v54 (copy), l_ChatConstants_0 (copy), v16 (ref), l_status_0 (ref), v20 (ref)
    if v50:GetChannel(v163) then
        v50:RemoveChannel(v163);
    end;
    if v163 == l_ChatSettings_0.GeneralChannelName then
        v41 = true;
    end;
    if v166 then
        v54:SetChannelNameColor(v163, v166);
    end;
    local v169 = v50:AddChannel(v163);
    if v169 then
        if v163 == l_ChatSettings_0.GeneralChannelName then
            DoSwitchCurrentChannel(v163);
        end;
        if v165 then
            local v170 = 1;
            if #v165 > l_ChatSettings_0.MessageHistoryLengthPerChannel then
                v170 = #v165 - l_ChatSettings_0.MessageHistoryLengthPerChannel;
            end;
            for v171 = v170, #v165 do
                v169:AddMessageToChannel(v165[v171]);
            end;
            if getEchoMessagesInGeneral() and v167 and l_ChatSettings_0.GeneralChannelName and v163 ~= l_ChatSettings_0.GeneralChannelName then
                local l_v50_Channel_8 = v50:GetChannel(l_ChatSettings_0.GeneralChannelName);
                if l_v50_Channel_8 then
                    l_v50_Channel_8:AddMessagesToChannelByTimeStamp(v165, v170);
                end;
            end;
        end;
        if v164 ~= "" then
            local v173 = {
                ID = -1, 
                FromSpeaker = nil, 
                SpeakerUserId = 0, 
                OriginalChannel = v163, 
                IsFiltered = true, 
                MessageLength = string.len(v164), 
                MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(v164)), 
                Message = trimTrailingSpaces(v164), 
                MessageType = l_ChatConstants_0.MessageTypeWelcome, 
                Time = os.time(), 
                ExtraData = nil
            };
            v169:AddMessageToChannel(v173);
            if getEchoMessagesInGeneral() and v168 and not l_ChatSettings_0.ShowChannelsBar and v163 ~= l_ChatSettings_0.GeneralChannelName then
                local l_v50_Channel_9 = v50:GetChannel(l_ChatSettings_0.GeneralChannelName);
                if l_v50_Channel_9 then
                    l_v50_Channel_9:AddMessageToChannel(v173);
                end;
            end;
        end;
        local v175 = v16:Get("GameChat_ChatMain_ChatTranslationOnboarding", "Text chat will be translated into your language. Tap the symbol in front of the message to see the original. You can turn off translations in the Settings menu.");
        if l_status_0 and v175 ~= "" and v163 == l_ChatSettings_0.GeneralChannelName and v20 ~= nil and v20.Value then
            v169:AddMessageToChannel({
                ID = -2, 
                FromSpeaker = nil, 
                SpeakerUserId = 0, 
                OriginalChannel = v163, 
                IsFiltered = true, 
                MessageLength = string.len(v175), 
                MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(v175)), 
                Message = trimTrailingSpaces(v175), 
                MessageType = l_ChatConstants_0.MessageTypeWelcome, 
                Time = os.time(), 
                ExtraData = nil
            });
        end;
        DoFadeInFromNewInformation();
    end;
end;
l_DefaultChatSystemChatEvents_1.OnChannelJoined.OnClientEvent:connect(function(v176, v177, v178, v179) --[[ Line: 925 ]]
    HandleChannelJoined(v176, v177, v178, v179, false, true);
end);
l_DefaultChatSystemChatEvents_1.OnChannelLeft.OnClientEvent:connect(function(v180) --[[ Line: 929 ]]
    -- upvalues: v50 (copy)
    v50:RemoveChannel(v180);
    DoFadeInFromNewInformation();
end);
l_DefaultChatSystemChatEvents_1.OnMuted.OnClientEvent:connect(function(_) --[[ Line: 935 ]]

end);
l_DefaultChatSystemChatEvents_1.OnUnmuted.OnClientEvent:connect(function(_) --[[ Line: 941 ]]

end);
l_DefaultChatSystemChatEvents_1.OnMainChannelSet.OnClientEvent:connect(function(v183) --[[ Line: 945 ]]
    DoSwitchCurrentChannel(v183);
end);
coroutine.wrap(function() --[[ Line: 949 ]]
    -- upvalues: l_DefaultChatSystemChatEvents_0 (copy), v54 (copy)
    local v184 = l_DefaultChatSystemChatEvents_0:WaitForChild("ChannelNameColorUpdated", 5);
    if v184 then
        v184.OnClientEvent:connect(function(v185, v186) --[[ Line: 953 ]]
            -- upvalues: v54 (ref)
            v54:SetChannelNameColor(v185, v186);
        end);
    end;
end)();
local v187 = nil;
local v188 = nil;
local v189 = nil;
local v190 = nil;
pcall(function() --[[ Line: 969 ]]
    -- upvalues: v187 (ref), l_StarterGui_0 (copy), v188 (ref), v189 (ref), v190 (ref)
    v187 = l_StarterGui_0:GetCore("PlayerBlockedEvent");
    v188 = l_StarterGui_0:GetCore("PlayerMutedEvent");
    v189 = l_StarterGui_0:GetCore("PlayerUnblockedEvent");
    v190 = l_StarterGui_0:GetCore("PlayerUnmutedEvent");
end);
SendSystemMessageToSelf = function(v191) --[[ Line: 976 ]] --[[ Name: SendSystemMessageToSelf ]]
    -- upvalues: v50 (copy), l_ChatConstants_0 (copy)
    local l_v50_CurrentChannel_0 = v50:GetCurrentChannel();
    if l_v50_CurrentChannel_0 then
        l_v50_CurrentChannel_0:AddMessageToChannel({
            ID = -1, 
            FromSpeaker = nil, 
            SpeakerUserId = 0, 
            OriginalChannel = l_v50_CurrentChannel_0.Name, 
            IsFiltered = true, 
            MessageLength = string.len(v191), 
            MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(v191)), 
            Message = trimTrailingSpaces(v191), 
            MessageType = l_ChatConstants_0.MessageTypeSystem, 
            Time = os.time(), 
            ExtraData = nil
        });
    end;
end;
MutePlayer = function(v193) --[[ Line: 998 ]] --[[ Name: MutePlayer ]]
    -- upvalues: l_DefaultChatSystemChatEvents_0 (copy)
    local l_MutePlayerRequest_0 = l_DefaultChatSystemChatEvents_0:FindFirstChild("MutePlayerRequest");
    if l_MutePlayerRequest_0 then
        return l_MutePlayerRequest_0:InvokeServer(v193.Name);
    else
        return false;
    end;
end;
if v187 then
    v187.Event:connect(function(v195) --[[ Line: 1007 ]]
        -- upvalues: l_ChatSettings_0 (copy), v16 (ref)
        if MutePlayer(v195) then
            local v196 = nil;
            v196 = if l_ChatSettings_0.PlayerDisplayNamesEnabled then v195.DisplayName else v195.Name;
            SendSystemMessageToSelf(v16:Get("GameChat_ChatMain_SpeakerHasBeenBlocked", string.format("Speaker '%s' has been blocked.", v196), {
                RBX_NAME = v196
            }));
        end;
    end);
end;
if v1 then
    local function _() --[[ Line: 1029 ]] --[[ Name: ShowFriendJoinNotification ]]
        -- upvalues: l_ChatSettings_0 (copy)
        if l_ChatSettings_0.ShowFriendJoinNotification ~= nil then
            return l_ChatSettings_0.ShowFriendJoinNotification;
        else
            return false;
        end;
    end;
    if l_ChatSettings_0.ShowFriendJoinNotification ~= nil and l_ChatSettings_0.ShowFriendJoinNotification then
        l_Players_0.PlayerAdded:Connect(function(v198) --[[ Line: 1037 ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_ChatSettings_0 (copy), v16 (ref)
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 1038 ]]
                -- upvalues: v198 (copy), l_LocalPlayer_0 (ref)
                return v198:IsFriendsWith(l_LocalPlayer_0.UserId);
            end);
            if l_status_1 and l_result_1 then
                local l_Name_0 = v198.Name;
                if l_ChatSettings_0.PlayerDisplayNamesEnabled then
                    l_Name_0 = v198.DisplayName;
                end;
                local v202 = v16:FormatMessageToSend("GameChat_FriendChatNotifier_JoinMessage", string.format("Your friend %s has joined the game.", l_Name_0), "RBX_NAME", l_Name_0);
                SendSystemMessageToSelf(v202);
            end;
        end);
    end;
end;
if v188 then
    v188.Event:connect(function(v203) --[[ Line: 1060 ]]
        -- upvalues: l_ChatSettings_0 (copy), v16 (ref)
        if MutePlayer(v203) then
            local v204 = nil;
            v204 = if l_ChatSettings_0.PlayerDisplayNamesEnabled then v203.DisplayName else v203.Name;
            SendSystemMessageToSelf(v16:Get("GameChat_ChatMain_SpeakerHasBeenMuted", string.format("Speaker '%s' has been muted.", v204), {
                RBX_NAME = v204
            }));
        end;
    end);
end;
UnmutePlayer = function(v205) --[[ Line: 1081 ]] --[[ Name: UnmutePlayer ]]
    -- upvalues: l_DefaultChatSystemChatEvents_0 (copy)
    local l_UnMutePlayerRequest_0 = l_DefaultChatSystemChatEvents_0:FindFirstChild("UnMutePlayerRequest");
    if l_UnMutePlayerRequest_0 then
        return l_UnMutePlayerRequest_0:InvokeServer(v205.Name);
    else
        return false;
    end;
end;
if v189 then
    v189.Event:connect(function(v207) --[[ Line: 1090 ]]
        -- upvalues: l_ChatSettings_0 (copy), v16 (ref)
        if UnmutePlayer(v207) then
            local v208 = nil;
            v208 = if l_ChatSettings_0.PlayerDisplayNamesEnabled then v207.DisplayName else v207.Name;
            SendSystemMessageToSelf(v16:Get("GameChat_ChatMain_SpeakerHasBeenUnBlocked", string.format("Speaker '%s' has been unblocked.", v208), {
                RBX_NAME = v208
            }));
        end;
    end);
end;
if v190 then
    v190.Event:connect(function(v209) --[[ Line: 1112 ]]
        -- upvalues: l_ChatSettings_0 (copy), v16 (ref)
        if UnmutePlayer(v209) then
            local v210 = nil;
            v210 = if l_ChatSettings_0.PlayerDisplayNamesEnabled then v209.DisplayName else v209.Name;
            SendSystemMessageToSelf(v16:Get("GameChat_ChatMain_SpeakerHasBeenUnMuted", string.format("Speaker '%s' has been unmuted.", v210), {
                RBX_NAME = v210
            }));
        end;
    end);
end;
spawn(function() --[[ Line: 1135 ]]
    -- upvalues: l_LocalPlayer_0 (ref), l_StarterGui_0 (copy), l_DefaultChatSystemChatEvents_0 (copy)
    if l_LocalPlayer_0.UserId > 0 then
        pcall(function() --[[ Line: 1138 ]]
            -- upvalues: l_StarterGui_0 (ref), l_DefaultChatSystemChatEvents_0 (ref)
            local l_l_StarterGui_0_Core_0 = l_StarterGui_0:GetCore("GetBlockedUserIds");
            if #l_l_StarterGui_0_Core_0 > 0 then
                local l_SetBlockedUserIdsRequest_0 = l_DefaultChatSystemChatEvents_0:FindFirstChild("SetBlockedUserIdsRequest");
                if l_SetBlockedUserIdsRequest_0 then
                    l_SetBlockedUserIdsRequest_0:FireServer(l_l_StarterGui_0_Core_0);
                end;
            end;
        end);
    end;
end);
spawn(function() --[[ Line: 1150 ]]
    -- upvalues: l_Chat_0 (copy), l_LocalPlayer_0 (ref), v37 (ref), l_RunService_0 (copy)
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 1151 ]]
        -- upvalues: l_Chat_0 (ref), l_LocalPlayer_0 (ref)
        return l_Chat_0:CanUserChatAsync(l_LocalPlayer_0.UserId);
    end);
    if l_status_2 then
        v37 = l_RunService_0:IsStudio() or l_result_2;
    end;
end);
local v215 = l_DefaultChatSystemChatEvents_1.GetInitDataRequest:InvokeServer();
for _, v217 in pairs(v215.Channels) do
    if v217[1] == l_ChatSettings_0.GeneralChannelName then
        HandleChannelJoined(v217[1], v217[2], v217[3], v217[4], true, false);
    end;
end;
for _, v219 in pairs(v215.Channels) do
    if v219[1] ~= l_ChatSettings_0.GeneralChannelName then
        HandleChannelJoined(v219[1], v219[2], v219[3], v219[4], true, false);
    end;
end;
return v0;