local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local _ = l_RobloxGui_0:WaitForChild("Modules");
local l_StarterGui_0 = game:GetService("StarterGui");
local _ = game:GetService("UserInputService");
local _ = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local v8 = require(l_RobloxGui_0.Modules.ChatUtil);
local l_ClassicChat_0 = l_Players_0.ClassicChat;
local l_BubbleChat_0 = l_Players_0.BubbleChat;
local l_VRService_0 = game:GetService("VRService");
local v12 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableConsoleExpControls_0 = v12.FFlagEnableConsoleExpControls;
local _ = v12.FFlagChromeChatGamepadSupportFix;
local v15 = nil;
local v16 = nil;
local v17 = {};
local v18 = {
    Visible = not l_VRService_0.VREnabled
};
local v36 = {
    ToggleVisibility = function(_) --[[ Line: 39 ]] --[[ Name: ToggleVisibility ]]
        -- upvalues: v15 (ref), v18 (copy)
        if v15 then
            v15:ToggleVisibility();
            return;
        else
            v18.Visible = not v18.Visible;
            return;
        end;
    end, 
    SetVisible = function(_, v21) --[[ Line: 47 ]] --[[ Name: SetVisible ]]
        -- upvalues: v15 (ref), v18 (copy)
        if v15 then
            v15:SetVisible(v21);
            return;
        else
            v18.Visible = v21;
            return;
        end;
    end, 
    FocusChatBar = function(_) --[[ Line: 55 ]] --[[ Name: FocusChatBar ]]
        -- upvalues: v15 (ref)
        if v15 then
            v15:FocusChatBar();
        end;
    end, 
    FocusSelectChatBar = function(_, v24, v25) --[[ Line: 61 ]] --[[ Name: FocusSelectChatBar ]]
        -- upvalues: v15 (ref), l_FFlagEnableConsoleExpControls_0 (copy)
        if v15 and l_FFlagEnableConsoleExpControls_0 then
            v15:FocusSelectChatBar(v24, v25);
        end;
    end, 
    EnterWhisperState = function(_, v27) --[[ Line: 69 ]] --[[ Name: EnterWhisperState ]]
        -- upvalues: v15 (ref)
        if v15 then
            return v15:EnterWhisperState(v27);
        else
            return;
        end;
    end, 
    GetVisibility = function(_) --[[ Line: 75 ]] --[[ Name: GetVisibility ]]
        -- upvalues: v15 (ref), v18 (copy)
        if v15 then
            return v15:GetVisibility();
        else
            return v18.Visible;
        end;
    end, 
    GetMessageCount = function(_) --[[ Line: 83 ]] --[[ Name: GetMessageCount ]]
        -- upvalues: v15 (ref)
        if v15 then
            return v15:GetMessageCount();
        else
            return 0;
        end;
    end, 
    TopbarEnabledChanged = function(_, ...) --[[ Line: 91 ]] --[[ Name: TopbarEnabledChanged ]]
        -- upvalues: v15 (ref)
        if v15 then
            return v15:TopbarEnabledChanged(...);
        else
            return;
        end;
    end, 
    IsFocused = function(_, v32) --[[ Line: 97 ]] --[[ Name: IsFocused ]]
        -- upvalues: v15 (ref)
        if v15 then
            return v15:IsFocused(v32);
        else
            return false;
        end;
    end, 
    ClassicChatEnabled = function(_) --[[ Line: 105 ]] --[[ Name: ClassicChatEnabled ]]
        -- upvalues: v15 (ref), l_ClassicChat_0 (copy)
        if v15 then
            return v15:ClassicChatEnabled();
        else
            return l_ClassicChat_0;
        end;
    end, 
    IsBubbleChatOnly = function(_) --[[ Line: 113 ]] --[[ Name: IsBubbleChatOnly ]]
        -- upvalues: v15 (ref), l_BubbleChat_0 (copy), l_ClassicChat_0 (copy)
        if v15 then
            return v15:IsBubbleChatOnly();
        else
            return l_BubbleChat_0 and not l_ClassicChat_0;
        end;
    end, 
    IsDisabled = function(_) --[[ Line: 120 ]] --[[ Name: IsDisabled ]]
        -- upvalues: v15 (ref), l_BubbleChat_0 (copy), l_ClassicChat_0 (copy)
        if v15 then
            return v15:IsDisabled();
        else
            return not (l_BubbleChat_0 or l_ClassicChat_0);
        end;
    end
};
v36.HideTemp = function(_, v38, v39) --[[ Line: 127 ]] --[[ Name: HideTemp ]]
    -- upvalues: v17 (copy), v16 (ref), v36 (copy)
    local function _() --[[ Line: 128 ]] --[[ Name: isHideTempKeysEmpty ]]
        -- upvalues: v17 (ref)
        return next(v17) == nil;
    end;
    if next(v17) == nil then
        v16 = v36:GetVisibility();
    end;
    if v39 then
        v17[v38] = v39;
    else
        v17[v38] = nil;
    end;
    v36:SetVisible(v16 and next(v17) == nil);
end;
v36.ChatBarFocusChanged = v8.Signal();
v36.ChatWindowToggled = v8.Signal();
v36.ChatActiveChanged = v8.Signal();
v36.ChatActiveChanged:connect(function(v41) --[[ Line: 149 ]]
    -- upvalues: v36 (copy)
    v36:SetVisible(v41);
end);
v36.VisibilityStateChanged = v8.Signal();
v36.MessagesChanged = v8.Signal();
v36.BubbleChatOnlySet = v8.Signal();
v36.ChatDisabled = v8.Signal();
local v42 = false;
local v43 = {};
local function v45(v44) --[[ Line: 163 ]] --[[ Name: MakeSystemMessageQueueingFunction ]]
    -- upvalues: v42 (ref), v43 (copy)
    if v42 then
        return;
    else
        table.insert(v43, v44);
        return;
    end;
end;
local function v46() --[[ Line: 168 ]] --[[ Name: NonFunc ]]

end;
l_StarterGui_0:RegisterSetCore("ChatMakeSystemMessage", v45);
l_StarterGui_0:RegisterSetCore("ChatWindowPosition", v46);
l_StarterGui_0:RegisterGetCore("ChatWindowPosition", v46);
l_StarterGui_0:RegisterSetCore("ChatWindowSize", v46);
l_StarterGui_0:RegisterGetCore("ChatWindowSize", v46);
l_StarterGui_0:RegisterSetCore("ChatBarDisabled", v46);
l_StarterGui_0:RegisterGetCore("ChatBarDisabled", v46);
l_StarterGui_0:RegisterGetCore("ChatActive", function() --[[ Line: 178 ]]
    -- upvalues: v36 (copy)
    return v36:GetVisibility();
end);
l_StarterGui_0:RegisterSetCore("ChatActive", function(v47) --[[ Line: 181 ]]
    -- upvalues: v36 (copy)
    v36.ChatActiveChanged:fire(v47);
end);
local function _(v48, v49, v50) --[[ Line: 186 ]] --[[ Name: ConnectSignals ]]
    if v48[v50] then
        v48[v50]:connect(function(...) --[[ Line: 189 ]]
            -- upvalues: v49 (copy), v50 (copy)
            v49[v50]:fire(...);
        end);
    end;
end;
coroutine.wrap(function() --[[ Line: 193 ]]
    -- upvalues: v15 (ref), l_RobloxGui_0 (copy), v36 (copy), l_Players_0 (copy), l_StarterGui_0 (copy), v18 (copy), v42 (ref), v43 (copy)
    v15 = require(l_RobloxGui_0.Modules.NewChat);
    local l_v15_0 = v15;
    local l_v36_0 = v36;
    if l_v15_0.ChatBarFocusChanged then
        local l_ChatBarFocusChanged_0 = l_v15_0.ChatBarFocusChanged;
        local v55 = "ChatBarFocusChanged";
        local l_l_v36_0_0 = l_v36_0 --[[ copy: 1 -> 17 ]];
        local l_v55_0 = v55 --[[ copy: 5 -> 18 ]];
        l_ChatBarFocusChanged_0:connect(function(...) --[[ Line: 189 ]]
            -- upvalues: l_l_v36_0_0 (copy), l_v55_0 (copy)
            l_l_v36_0_0[l_v55_0]:fire(...);
        end);
    end;
    l_v15_0 = v15;
    l_v36_0 = v36;
    if l_v15_0.VisibilityStateChanged then
        local l_VisibilityStateChanged_0 = l_v15_0.VisibilityStateChanged;
        local v59 = "VisibilityStateChanged";
        local l_l_v36_0_1 = l_v36_0 --[[ copy: 1 -> 15 ]];
        local l_v59_0 = v59 --[[ copy: 5 -> 16 ]];
        l_VisibilityStateChanged_0:connect(function(...) --[[ Line: 189 ]]
            -- upvalues: l_l_v36_0_1 (copy), l_v59_0 (copy)
            l_l_v36_0_1[l_v59_0]:fire(...);
        end);
    end;
    l_v15_0 = v15;
    l_v36_0 = v36;
    if l_v15_0.ChatWindowToggled then
        local l_ChatWindowToggled_0 = l_v15_0.ChatWindowToggled;
        local v63 = "ChatWindowToggled";
        local l_l_v36_0_2 = l_v36_0 --[[ copy: 1 -> 13 ]];
        local l_v63_0 = v63 --[[ copy: 5 -> 14 ]];
        l_ChatWindowToggled_0:connect(function(...) --[[ Line: 189 ]]
            -- upvalues: l_l_v36_0_2 (copy), l_v63_0 (copy)
            l_l_v36_0_2[l_v63_0]:fire(...);
        end);
    end;
    l_v15_0 = v15;
    l_v36_0 = v36;
    if l_v15_0.ChatActiveChanged then
        local l_ChatActiveChanged_0 = l_v15_0.ChatActiveChanged;
        local v67 = "ChatActiveChanged";
        local l_l_v36_0_3 = l_v36_0 --[[ copy: 1 -> 11 ]];
        local l_v67_0 = v67 --[[ copy: 5 -> 12 ]];
        l_ChatActiveChanged_0:connect(function(...) --[[ Line: 189 ]]
            -- upvalues: l_l_v36_0_3 (copy), l_v67_0 (copy)
            l_l_v36_0_3[l_v67_0]:fire(...);
        end);
    end;
    l_v15_0 = v15;
    l_v36_0 = v36;
    if l_v15_0.BubbleChatOnlySet then
        local l_BubbleChatOnlySet_0 = l_v15_0.BubbleChatOnlySet;
        local v71 = "BubbleChatOnlySet";
        local l_l_v36_0_4 = l_v36_0 --[[ copy: 1 -> 9 ]];
        local l_v71_0 = v71 --[[ copy: 5 -> 10 ]];
        l_BubbleChatOnlySet_0:connect(function(...) --[[ Line: 189 ]]
            -- upvalues: l_l_v36_0_4 (copy), l_v71_0 (copy)
            l_l_v36_0_4[l_v71_0]:fire(...);
        end);
    end;
    l_v15_0 = v15;
    l_v36_0 = v36;
    if l_v15_0.ChatDisabled then
        local l_ChatDisabled_0 = l_v15_0.ChatDisabled;
        local v75 = "ChatDisabled";
        local l_l_v36_0_5 = l_v36_0 --[[ copy: 1 -> 7 ]];
        local l_v75_0 = v75 --[[ copy: 5 -> 8 ]];
        l_ChatDisabled_0:connect(function(...) --[[ Line: 189 ]]
            -- upvalues: l_l_v36_0_5 (copy), l_v75_0 (copy)
            l_l_v36_0_5[l_v75_0]:fire(...);
        end);
    end;
    while l_Players_0.LocalPlayer == nil do
        l_Players_0.ChildAdded:wait();
    end;
    l_v15_0 = l_Players_0.LocalPlayer;
    l_v36_0 = v15;
    local l_v36_1 = v36;
    if l_v36_0.MessagesChanged then
        local l_MessagesChanged_0 = l_v36_0.MessagesChanged;
        local v80 = "MessagesChanged";
        l_MessagesChanged_0:connect(function(...) --[[ Line: 189 ]]
            -- upvalues: l_v36_1 (copy), v80 (copy)
            l_v36_1[v80]:fire(...);
        end);
    end;
    l_StarterGui_0:RegisterGetCore("UseNewLuaChat", function() --[[ Line: 208 ]]
        return true;
    end);
    v15:SetVisible(v18.Visible);
    l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Chat));
    v42 = true;
    for _, v82 in pairs(v43) do
        pcall(function() --[[ Line: 215 ]]
            -- upvalues: l_StarterGui_0 (ref), v82 (copy)
            l_StarterGui_0:SetCore("ChatMakeSystemMessage", v82);
        end);
    end;
end)();
return v36;