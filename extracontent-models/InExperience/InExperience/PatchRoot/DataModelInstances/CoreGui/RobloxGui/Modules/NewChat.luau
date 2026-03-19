local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_TextChatService_0 = game:GetService("TextChatService");
local v5 = l_TextChatService_0.ChatVersion == Enum.ChatVersion.LegacyChatService;
local v6 = false;
local l_ClassicChat_0 = l_Players_0.ClassicChat;
local l_BubbleChat_0 = l_Players_0.BubbleChat;
local v9 = require(l_RobloxGui_0.Modules.ChatUtil);
local l_CorePackages_0 = game:GetService("CorePackages");
local v11 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
local v12 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_getFFlagExpChatAlwaysRunTCS_0 = v12.getFFlagExpChatAlwaysRunTCS;
local l_FFlagEnableConsoleExpControls_0 = v12.FFlagEnableConsoleExpControls;
local l_FFlagExpChatWindowSyncUnibar_0 = v12.FFlagExpChatWindowSyncUnibar;
local v16 = v11.Stores.GetTransparencyStore(false);
local function _() --[[ Line: 35 ]] --[[ Name: shouldForceLegacyChatToBeHidden ]]
    -- upvalues: v5 (ref), l_TextChatService_0 (copy), l_getFFlagExpChatAlwaysRunTCS_0 (copy)
    v5 = l_TextChatService_0.ChatVersion == Enum.ChatVersion.LegacyChatService;
    if l_getFFlagExpChatAlwaysRunTCS_0() then
        return v5;
    else
        return false;
    end;
end;
local v18 = {};
local v19 = {
    Visible = true, 
    MessageCount = 0, 
    TopbarEnabled = true, 
    CoreGuiEnabled = true
};
local v20 = {
    ChatWindow = nil, 
    GetCore = nil, 
    SetCore = nil
};
local v21 = {};
local v22 = {};
local function _(v23, v24, v25) --[[ Line: 62 ]] --[[ Name: FindInCollectionByKeyAndType ]]
    if v23 and v23[v24] and v23[v24]:IsA(v25) then
        return v23[v24];
    else
        return nil;
    end;
end;
local function v30(v27, ...) --[[ Line: 69 ]] --[[ Name: DispatchEvent ]]
    -- upvalues: v20 (copy)
    local l_ChatWindow_0 = v20.ChatWindow;
    local v29 = if l_ChatWindow_0 and l_ChatWindow_0[v27] and l_ChatWindow_0[v27]:IsA("BindableEvent") then l_ChatWindow_0[v27] else nil;
    if v29 then
        v29:Fire(...);
        return true;
    else
        return false;
    end;
end;
local function v34(v31, ...) --[[ Line: 78 ]] --[[ Name: AttemptInvokeFunction ]]
    -- upvalues: v20 (copy)
    local l_ChatWindow_1 = v20.ChatWindow;
    local v33 = if l_ChatWindow_1 and l_ChatWindow_1[v31] and l_ChatWindow_1[v31]:IsA("BindableFunction") then l_ChatWindow_1[v31] else nil;
    if v33 then
        return true, v33:Invoke();
    else
        return false, nil;
    end;
end;
local function _(v35) --[[ Line: 87 ]] --[[ Name: DoConnectGetCore ]]
    -- upvalues: l_StarterGui_0 (copy), v20 (copy)
    l_StarterGui_0:RegisterGetCore(v35, function(v36) --[[ Line: 88 ]]
        -- upvalues: v20 (ref), v35 (copy)
        local l_GetCore_0 = v20.GetCore;
        local l_v35_0 = v35;
        local v39 = if l_GetCore_0 and l_GetCore_0[l_v35_0] and l_GetCore_0[l_v35_0]:IsA("BindableFunction") then l_GetCore_0[l_v35_0] else nil;
        l_GetCore_0 = nil;
        if v39 then
            l_GetCore_0 = v39:Invoke(v36);
        end;
        return l_GetCore_0;
    end);
end;
v18.ToggleVisibility = function(_) --[[ Line: 99 ]] --[[ Name: ToggleVisibility ]]
    -- upvalues: v19 (copy), v5 (ref), l_TextChatService_0 (copy), l_getFFlagExpChatAlwaysRunTCS_0 (copy), v18 (copy), v30 (copy), l_FFlagExpChatWindowSyncUnibar_0 (copy), v11 (copy), v16 (copy)
    v19.Visible = not v19.Visible;
    v5 = l_TextChatService_0.ChatVersion == Enum.ChatVersion.LegacyChatService;
    if if l_getFFlagExpChatAlwaysRunTCS_0() then v5 else false then
        v18.VisibilityStateChanged:fire(v19.Visible);
    elseif not v30("ToggleVisibility") then
        v18.VisibilityStateChanged:fire(v19.Visible);
    end;
    if not l_FFlagExpChatWindowSyncUnibar_0 then
        v11.Events.ChatTopBarButtonActivated(v19.Visible);
    end;
    if v19.Visible then
        v16.resetAllTransparency();
    end;
    v18.ChatWindowToggled:fire(v19.Visible);
end;
v18.SetVisible = function(_, v43) --[[ Line: 121 ]] --[[ Name: SetVisible ]]
    -- upvalues: v19 (copy), l_FFlagExpChatWindowSyncUnibar_0 (copy), v11 (copy), v16 (copy), v18 (copy), v5 (ref), l_TextChatService_0 (copy), l_getFFlagExpChatAlwaysRunTCS_0 (copy), v30 (copy)
    v19.Visible = v43;
    if not l_FFlagExpChatWindowSyncUnibar_0 then
        v11.Events.ChatTopBarButtonActivated(v19.Visible);
    end;
    if v19.Visible then
        v16.resetAllTransparency();
    end;
    v18.ChatWindowToggled:fire(v19.Visible);
    v5 = l_TextChatService_0.ChatVersion == Enum.ChatVersion.LegacyChatService;
    if if l_getFFlagExpChatAlwaysRunTCS_0() then v5 else false then
        v30("SetVisible", false);
        v18.VisibilityStateChanged:fire(false);
        return;
    else
        if not v30("SetVisible", v19.Visible) then
            v18.VisibilityStateChanged:fire(v19.Visible);
        end;
        return;
    end;
end;
v18.FocusChatBar = function(_) --[[ Line: 144 ]] --[[ Name: FocusChatBar ]]
    -- upvalues: v30 (copy), v11 (copy)
    v30("FocusChatBar");
    v11.Events.ChatTopBarFocusActivated();
end;
v18.FocusSelectChatBar = function(_, v46, v47) --[[ Line: 150 ]] --[[ Name: FocusSelectChatBar ]]
    -- upvalues: l_FFlagEnableConsoleExpControls_0 (copy), v11 (copy)
    if l_FFlagEnableConsoleExpControls_0 then
        v11.Events.ChatTopBarFocusSelect(v46, v47);
    end;
end;
v18.EnterWhisperState = function(_, v49) --[[ Line: 156 ]] --[[ Name: EnterWhisperState ]]
    -- upvalues: v30 (copy)
    return v30("EnterWhisperState", v49);
end;
v18.GetVisibility = function(_) --[[ Line: 160 ]] --[[ Name: GetVisibility ]]
    -- upvalues: v34 (copy), v19 (copy)
    local v51, v52 = v34("GetVisibility");
    if v51 then
        return v52;
    else
        return v19.Visible;
    end;
end;
v18.GetMessageCount = function(_) --[[ Line: 169 ]] --[[ Name: GetMessageCount ]]
    -- upvalues: v34 (copy), v19 (copy)
    local v54, v55 = v34("GetMessageCount");
    if v54 then
        return v55;
    else
        return v19.MessageCount;
    end;
end;
v18.TopbarEnabledChanged = function(_, v57) --[[ Line: 178 ]] --[[ Name: TopbarEnabledChanged ]]
    -- upvalues: v19 (copy), v30 (copy)
    v19.TopbarEnabled = v57;
    v30("TopbarEnabledChanged", v19.TopbarEnabled);
end;
v18.IsFocused = function(_, v59) --[[ Line: 183 ]] --[[ Name: IsFocused ]]
    -- upvalues: v34 (copy)
    local v60, v61 = v34("IsFocused", v59);
    if v60 then
        return v61;
    else
        return false;
    end;
end;
v18.ClassicChatEnabled = function(_) --[[ Line: 192 ]] --[[ Name: ClassicChatEnabled ]]
    -- upvalues: l_ClassicChat_0 (ref)
    return l_ClassicChat_0;
end;
v18.IsBubbleChatOnly = function(_) --[[ Line: 196 ]] --[[ Name: IsBubbleChatOnly ]]
    -- upvalues: l_BubbleChat_0 (ref), l_ClassicChat_0 (ref)
    return l_BubbleChat_0 and not l_ClassicChat_0;
end;
v18.IsDisabled = function(_) --[[ Line: 200 ]] --[[ Name: IsDisabled ]]
    -- upvalues: l_BubbleChat_0 (ref), l_ClassicChat_0 (ref)
    return not (l_BubbleChat_0 or l_ClassicChat_0);
end;
SetInitialChatTypes = function(v65) --[[ Line: 204 ]] --[[ Name: SetInitialChatTypes ]]
    -- upvalues: v6 (ref), l_BubbleChat_0 (ref), l_ClassicChat_0 (ref), v18 (copy)
    if v6 then
        return;
    else
        v6 = true;
        local l_BubbleChatEnabled_0 = v65.BubbleChatEnabled;
        local l_ClassicChatEnabled_0 = v65.ClassicChatEnabled;
        if type(l_BubbleChatEnabled_0) == "boolean" then
            l_BubbleChat_0 = l_BubbleChatEnabled_0;
        end;
        if type(l_ClassicChatEnabled_0) == "boolean" then
            l_ClassicChat_0 = l_ClassicChatEnabled_0;
        end;
        if not l_ClassicChat_0 and not l_BubbleChat_0 then
            v18.ChatDisabled:fire();
        end;
        if l_BubbleChat_0 and not l_ClassicChat_0 then
            v18.BubbleChatOnlySet:fire();
        end;
        return;
    end;
end;
v18.ChatBarFocusChanged = v9.Signal();
v18.VisibilityStateChanged = v9.Signal();
v18.ChatWindowToggled = v9.Signal();
v18.MessagesChanged = v9.Signal();
v18.BubbleChatOnlySet = v9.Signal();
v18.ChatDisabled = v9.Signal();
local l_Chat_0 = game:GetService("Chat");
l_Chat_0:GetPropertyChangedSignal("IsAutoMigrated"):Connect(function() --[[ Line: 237 ]]
    -- upvalues: l_Chat_0 (copy), v30 (copy), v18 (copy)
    if l_Chat_0.IsAutoMigrated and not v30("SetVisible", false) then
        v18.VisibilityStateChanged:fire(false);
    end;
end);
l_StarterGui_0.CoreGuiChangedSignal:connect(function(v69, v70) --[[ Line: 246 ]]
    -- upvalues: v19 (copy), v30 (copy)
    if v69 == Enum.CoreGuiType.All or v69 == Enum.CoreGuiType.Chat then
        v19.CoreGuiEnabled = v70;
        v30("CoreGuiEnabled", v19.CoreGuiEnabled);
    end;
end);
l_GuiService_0:AddSpecialKey(Enum.SpecialKey.ChatHotkey);
l_GuiService_0.SpecialKeyPressed:connect(function(v71, v72) --[[ Line: 254 ]]
    -- upvalues: l_GuiService_0 (copy), v5 (ref), l_TextChatService_0 (copy), l_getFFlagExpChatAlwaysRunTCS_0 (copy), v30 (copy)
    if l_GuiService_0.MenuIsOpen then
        return;
    else
        v5 = l_TextChatService_0.ChatVersion == Enum.ChatVersion.LegacyChatService;
        if not if l_getFFlagExpChatAlwaysRunTCS_0() then v5 else false then
            v30("SpecialKeyPressed", v71, v72);
        end;
        return;
    end;
end);
DoConnectSetCore = function(v73) --[[ Line: 264 ]] --[[ Name: DoConnectSetCore ]]
    -- upvalues: l_StarterGui_0 (copy), v20 (copy), v22 (copy)
    l_StarterGui_0:RegisterSetCore(v73, function(v74) --[[ Line: 265 ]]
        -- upvalues: v20 (ref), v73 (copy), v22 (ref)
        local l_SetCore_0 = v20.SetCore;
        local l_v73_0 = v73;
        local v77 = if l_SetCore_0 and l_SetCore_0[l_v73_0] and l_SetCore_0[l_v73_0]:IsA("BindableEvent") then l_SetCore_0[l_v73_0] else nil;
        if v77 then
            v77:Fire(v74);
            return;
        else
            if v22[v73] == nil then
                v22[v73] = {};
            end;
            table.insert(v22[v73], v74);
            return;
        end;
    end);
end;
DoConnectSetCore("ChatMakeSystemMessage");
DoConnectSetCore("ChatWindowPosition");
DoConnectSetCore("ChatWindowSize");
DoConnectSetCore("ChatBarDisabled");
local v78 = "ChatWindowPosition";
local v79 = "ChatWindowPosition";
local l_v79_0 = v79 --[[ copy: 33 -> 34 ]];
l_StarterGui_0:RegisterGetCore(v78, function(v81) --[[ Line: 88 ]]
    -- upvalues: v20 (copy), l_v79_0 (copy)
    local l_GetCore_1 = v20.GetCore;
    local l_l_v79_0_0 = l_v79_0;
    local v84 = if l_GetCore_1 and l_GetCore_1[l_l_v79_0_0] and l_GetCore_1[l_l_v79_0_0]:IsA("BindableFunction") then l_GetCore_1[l_l_v79_0_0] else nil;
    l_GetCore_1 = nil;
    if v84 then
        l_GetCore_1 = v84:Invoke(v81);
    end;
    return l_GetCore_1;
end);
v78 = "ChatWindowSize";
v79 = "ChatWindowSize";
local l_v79_1 = v79 --[[ copy: 33 -> 35 ]];
l_StarterGui_0:RegisterGetCore(v78, function(v86) --[[ Line: 88 ]]
    -- upvalues: v20 (copy), l_v79_1 (copy)
    local l_GetCore_2 = v20.GetCore;
    local l_l_v79_1_0 = l_v79_1;
    local v89 = if l_GetCore_2 and l_GetCore_2[l_l_v79_1_0] and l_GetCore_2[l_l_v79_1_0]:IsA("BindableFunction") then l_GetCore_2[l_l_v79_1_0] else nil;
    l_GetCore_2 = nil;
    if v89 then
        l_GetCore_2 = v89:Invoke(v86);
    end;
    return l_GetCore_2;
end);
v78 = "ChatBarDisabled";
v79 = "ChatBarDisabled";
l_StarterGui_0:RegisterGetCore(v78, function(v90) --[[ Line: 88 ]]
    -- upvalues: v20 (copy), v79 (copy)
    local l_GetCore_3 = v20.GetCore;
    local l_v79_2 = v79;
    local v93 = if l_GetCore_3 and l_GetCore_3[l_v79_2] and l_GetCore_3[l_v79_2]:IsA("BindableFunction") then l_GetCore_3[l_v79_2] else nil;
    l_GetCore_3 = nil;
    if v93 then
        l_GetCore_3 = v93:Invoke(v90);
    end;
    return l_GetCore_3;
end);
do
    local l_v21_0 = v21;
    local function v114(v95) --[[ Line: 287 ]] --[[ Name: RegisterCoreGuiConnections ]]
        -- upvalues: l_v21_0 (ref), v20 (copy), v18 (copy), v19 (copy), v22 (copy)
        if type(v95) == "table" then
            local l_ChatWindow_2 = v95.ChatWindow;
            local l_SetCore_1 = v95.SetCore;
            local l_GetCore_4 = v95.GetCore;
            if type(l_ChatWindow_2) == "table" then
                for _, v100 in pairs(l_v21_0) do
                    v100:disconnect();
                end;
                if type(l_ChatWindow_2.ChatTypes) == "table" then
                    SetInitialChatTypes(l_ChatWindow_2.ChatTypes);
                end;
                l_v21_0 = {};
                v20.ChatWindow = {};
                v20.ChatWindow.ToggleVisibility = if l_ChatWindow_2 and l_ChatWindow_2.ToggleVisibility and l_ChatWindow_2.ToggleVisibility:IsA("BindableEvent") then l_ChatWindow_2.ToggleVisibility else nil;
                v20.ChatWindow.SetVisible = if l_ChatWindow_2 and l_ChatWindow_2.SetVisible and l_ChatWindow_2.SetVisible:IsA("BindableEvent") then l_ChatWindow_2.SetVisible else nil;
                v20.ChatWindow.FocusChatBar = if l_ChatWindow_2 and l_ChatWindow_2.FocusChatBar and l_ChatWindow_2.FocusChatBar:IsA("BindableEvent") then l_ChatWindow_2.FocusChatBar else nil;
                v20.ChatWindow.EnterWhisperState = if l_ChatWindow_2 and l_ChatWindow_2.EnterWhisperState and l_ChatWindow_2.EnterWhisperState:IsA("BindableEvent") then l_ChatWindow_2.EnterWhisperState else nil;
                v20.ChatWindow.TopbarEnabledChanged = if l_ChatWindow_2 and l_ChatWindow_2.TopbarEnabledChanged and l_ChatWindow_2.TopbarEnabledChanged:IsA("BindableEvent") then l_ChatWindow_2.TopbarEnabledChanged else nil;
                v20.ChatWindow.IsFocused = if l_ChatWindow_2 and l_ChatWindow_2.IsFocused and l_ChatWindow_2.IsFocused:IsA("BindableFunction") then l_ChatWindow_2.IsFocused else nil;
                v20.ChatWindow.SpecialKeyPressed = if l_ChatWindow_2 and l_ChatWindow_2.SpecialKeyPressed and l_ChatWindow_2.SpecialKeyPressed:IsA("BindableEvent") then l_ChatWindow_2.SpecialKeyPressed else nil;
                local function v104(v101) --[[ Line: 320 ]] --[[ Name: DoConnect ]]
                    -- upvalues: v20 (ref), l_ChatWindow_2 (copy), v18 (ref), l_v21_0 (ref)
                    local l_ChatWindow_3 = v20.ChatWindow;
                    local l_l_ChatWindow_2_0 = l_ChatWindow_2;
                    l_ChatWindow_3[v101] = if l_l_ChatWindow_2_0 and l_l_ChatWindow_2_0[v101] and l_l_ChatWindow_2_0[v101]:IsA("BindableEvent") then l_l_ChatWindow_2_0[v101] else nil;
                    if v20.ChatWindow[v101] then
                        l_ChatWindow_3 = v20.ChatWindow[v101].Event:connect(function(...) --[[ Line: 324 ]]
                            -- upvalues: v18 (ref), v101 (copy)
                            v18[v101]:fire(...);
                        end);
                        table.insert(l_v21_0, l_ChatWindow_3);
                    end;
                end;
                v104("ChatBarFocusChanged");
                v104("VisibilityStateChanged");
                v104("ChatWindowToggled");
                v104("MessagesChanged");
                v20.ChatWindow.MessagePosted = if l_ChatWindow_2 and l_ChatWindow_2.MessagePosted and l_ChatWindow_2.MessagePosted:IsA("BindableEvent") then l_ChatWindow_2.MessagePosted else nil;
                if v20.ChatWindow.MessagePosted then
                    local v106 = v20.ChatWindow.MessagePosted.Event:connect(function(v105) --[[ Line: 340 ]]
                        game:GetService("Players"):Chat(v105);
                    end);
                    table.insert(l_v21_0, v106);
                end;
                v18:SetVisible(v19.Visible);
                v18:TopbarEnabledChanged(v19.TopbarEnabled);
                local v107 = if l_ChatWindow_2 and l_ChatWindow_2.CoreGuiEnabled and l_ChatWindow_2.CoreGuiEnabled:IsA("BindableEvent") then l_ChatWindow_2.CoreGuiEnabled else nil;
                if v107 then
                    v20.ChatWindow.CoreGuiEnabled = v107;
                    v107:Fire(v19.CoreGuiEnabled);
                end;
            else
                error("Table 'ChatWindow' must be provided!");
            end;
            if type(l_SetCore_1) == "table" and type(l_GetCore_4) == "table" then
                v20.SetCore = {};
                v20.GetCore = {};
                local function v113(v108) --[[ Line: 362 ]] --[[ Name: addSetCore ]]
                    -- upvalues: l_SetCore_1 (copy), v20 (ref), v22 (ref)
                    local l_l_SetCore_1_0 = l_SetCore_1;
                    local v110 = if l_l_SetCore_1_0 and l_l_SetCore_1_0[v108] and l_l_SetCore_1_0[v108]:IsA("BindableEvent") then l_l_SetCore_1_0[v108] else nil;
                    if v110 then
                        v20.SetCore[v108] = v110;
                        if v22[v108] then
                            for _, v112 in pairs(v22[v108]) do
                                v110:Fire(v112);
                            end;
                            v22[v108] = nil;
                        end;
                    end;
                end;
                v113("ChatMakeSystemMessage");
                v113("ChatWindowPosition");
                v113("ChatWindowSize");
                v113("ChatBarDisabled");
                v20.GetCore.ChatWindowPosition = if l_GetCore_4 and l_GetCore_4.ChatWindowPosition and l_GetCore_4.ChatWindowPosition:IsA("BindableFunction") then l_GetCore_4.ChatWindowPosition else nil;
                v20.GetCore.ChatWindowSize = if l_GetCore_4 and l_GetCore_4.ChatWindowSize and l_GetCore_4.ChatWindowSize:IsA("BindableFunction") then l_GetCore_4.ChatWindowSize else nil;
                v20.GetCore.ChatBarDisabled = if l_GetCore_4 and l_GetCore_4.ChatBarDisabled and l_GetCore_4.ChatBarDisabled:IsA("BindableFunction") then l_GetCore_4.ChatBarDisabled else nil;
                return;
            elseif type(l_SetCore_1) ~= "nil" or type(l_GetCore_4) ~= "nil" then
                error("Both 'SetCore' and 'GetCore' must be tables if provided!");
            end;
        end;
    end;
    v11.listenToDispatch(function(v115) --[[ Line: 392 ]]
        -- upvalues: v18 (copy)
        if v115.type == "FocusChatHotKeyActivated" then
            v18:SetVisible(true);
        end;
    end);
    l_StarterGui_0:RegisterSetCore("CoreGuiChatConnections", v114);
end;
return v18;