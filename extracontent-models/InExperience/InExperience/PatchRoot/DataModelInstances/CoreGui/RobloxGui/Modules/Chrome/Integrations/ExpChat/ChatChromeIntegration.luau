local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Chat_0 = game:GetService("Chat");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local v9 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local v10 = require(l_script_FirstAncestor_0.Integrations.ChromeIntegrationUtils);
local v11 = require(l_script_FirstAncestor_0.Service);
local v12 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils);
local v13 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local v14 = require(l_script_FirstAncestor_0.Flags.FFlagChatIntegrationFixShortcut);
local v15 = require(l_script_FirstAncestor_0.ChromeShared.Utility.FocusSelectExpChat);
local v16 = require(l_script_FirstAncestor_0.ChromeShared.Service.ViewportUtil);
local l_MappedSignal_0 = v12.MappedSignal;
local l_GameSettings_0 = UserSettings().GameSettings;
local l_GuiService_0 = game:GetService("GuiService");
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).Gamepad.GamepadUtils;
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local l_default_0 = require(script.Parent.ChatIconVisibleSignals).default;
local v23 = require(l_CorePackages_0.Packages.SignalsRoblox);
local v24 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
local v25 = v24.Stores.GetFocusNavigationStore(false);
local v26 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableConsoleExpControls_0 = v26.FFlagEnableConsoleExpControls;
local l_FFlagExpChatWindowSyncUnibar_0 = v26.FFlagExpChatWindowSyncUnibar;
local l_InExperienceAppChatModal_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatModal;
local v30 = require(l_RobloxGui_0.Modules.ChatSelector);
local l_getExperienceChatVisualConfig_0 = require(l_CorePackages_0.Workspace.Packages.ExpChat).getExperienceChatVisualConfig;
local l_GetFFlagSimpleChatUnreadMessageCount_0 = v26.GetFFlagSimpleChatUnreadMessageCount;
local l_GetFFlagDisableLegacyChatSimpleUnreadMessageCount_0 = v26.GetFFlagDisableLegacyChatSimpleUnreadMessageCount;
local v34 = game:DefineFastFlag("ExpChatUnibarThumbstickNavigate", false);
local v35 = game:DefineFastFlag("ExpChatUnibarAvailabilityRefactor", false);
local v36 = game:DefineFastFlag("HideChatButtonForChatDisabledUsers", false);
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local l_InExperienceUIVRIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP;
local l_FFlagExpChatPerfTracking_0 = v26.FFlagExpChatPerfTracking;
local l_ExpChatPerfTracker_0 = v24.ExpChatPerfTracker;
local v41 = 0;
local l_v30_Visibility_0 = v30:GetVisibility();
local v43 = nil;
local l_VisibilityStateChanged_0 = v30.VisibilityStateChanged;
local function _() --[[ Line: 57 ]] --[[ Name: localUserCanChat ]]
    -- upvalues: l_RunService_0 (copy), l_Chat_0 (copy), l_Players_0 (copy)
    if not l_RunService_0:IsStudio() then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 59 ]]
            -- upvalues: l_Chat_0 (ref), l_Players_0 (ref)
            return l_Chat_0:CanUserChatAsync(l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0);
        end);
        return l_status_0 and l_result_0;
    else
        return true;
    end;
end;
if not l_FFlagExpChatWindowSyncUnibar_0 then
    l_VisibilityStateChanged_0:connect(function(v48) --[[ Line: 70 ]]
        -- upvalues: v35 (copy), l_default_0 (copy), v43 (ref)
        if v35 then
            l_default_0.setVisibleViaChatSelector(v48);
            return;
        else
            if v48 then
                v43.availability:pinned();
            end;
            return;
        end;
    end);
    v30.ChatWindowToggled:connect(function(v49) --[[ Line: 81 ]]
        -- upvalues: v35 (copy), l_default_0 (copy), v43 (ref)
        if v35 then
            l_default_0.setVisibleViaChatSelector(v49);
            return;
        else
            if v49 then
                v43.availability:pinned();
            end;
            return;
        end;
    end);
end;
if l_FFlagExpChatWindowSyncUnibar_0 then
    l_GameSettings_0:GetPropertyChangedSignal("ChatVisible"):Connect(function() --[[ Line: 95 ]]
        -- upvalues: l_default_0 (copy), l_GameSettings_0 (copy)
        l_default_0.setGameSettingsChatVisible(l_GameSettings_0.ChatVisible);
    end);
    l_default_0.setGameSettingsChatVisible(l_GameSettings_0.ChatVisible);
end;
local v54 = l_MappedSignal_0.new(l_VisibilityStateChanged_0, function() --[[ Line: 101 ]]
    -- upvalues: l_v30_Visibility_0 (ref)
    return l_v30_Visibility_0;
end, function() --[[ Line: 103 ]]
    -- upvalues: v30 (copy), v35 (copy), v36 (copy), l_RunService_0 (copy), l_Chat_0 (copy), l_Players_0 (copy), v43 (ref), l_GuiService_0 (copy), l_GameSettings_0 (copy), l_v30_Visibility_0 (ref), l_GetFFlagSimpleChatUnreadMessageCount_0 (copy), v41 (ref)
    local v50 = v30.GetVisibility();
    if not v35 and v36 and not v50 then
        local v51;
        if not l_RunService_0:IsStudio() then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 59 ]]
                -- upvalues: l_Chat_0 (ref), l_Players_0 (ref)
                return l_Chat_0:CanUserChatAsync(l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0);
            end);
            v51 = l_status_1 and l_result_1;
        else
            v51 = true;
        end;
        if not v51 then
            v43.availability:unavailable();
        end;
    end;
    if not l_GuiService_0.MenuIsOpen then
        l_GameSettings_0.ChatVisible = v50;
    end;
    l_v30_Visibility_0 = v50;
    if l_GetFFlagSimpleChatUnreadMessageCount_0() then
        if v50 and v43.notification then
            v43.notification:clear();
            return;
        end;
    elseif v50 and v41 and v43.notification then
        v41 = 0;
        v43.notification:clear();
    end;
end);
local function _() --[[ Line: 130 ]]
    -- upvalues: l_InExperienceAppChatModal_0 (copy), v30 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v15 (copy), v43 (ref)
    if l_InExperienceAppChatModal_0:getVisible() then
        l_InExperienceAppChatModal_0.default:setVisible(false);
    end;
    v30:SetVisible(true);
    if l_FFlagEnableConsoleExpControls_0 then
        v15(v43.id);
    end;
end;
v43 = v11:register({
    id = "chat", 
    label = "CoreScripts.TopBar.Chat", 
    activated = function(_) --[[ Line: 145 ]] --[[ Name: activated ]]
        -- upvalues: l_v30_Visibility_0 (ref), v30 (copy), l_FFlagExpChatPerfTracking_0 (copy), l_ExpChatPerfTracker_0 (copy), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), l_InExperienceUIVRIXP_0 (copy), v10 (copy), l_InExperienceAppChatModal_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v15 (copy), v43 (ref)
        if l_v30_Visibility_0 then
            v30:SetVisible(false);
            return;
        else
            if l_FFlagExpChatPerfTracking_0 then
                l_ExpChatPerfTracker_0.start(l_ExpChatPerfTracker_0.Events.ChatWindowMountTTI, {});
            end;
            if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() and not l_InExperienceUIVRIXP_0:isMovePanelToCenter() then
                v30:SetVisible(true);
                return;
            else
                v10.dismissRobloxMenuAndRun(function() --[[ Line: 155 ]]
                    -- upvalues: l_InExperienceAppChatModal_0 (ref), v30 (ref), l_FFlagEnableConsoleExpControls_0 (ref), v15 (ref), v43 (ref)
                    if l_InExperienceAppChatModal_0:getVisible() then
                        l_InExperienceAppChatModal_0.default:setVisible(false);
                    end;
                    v30:SetVisible(true);
                    if l_FFlagEnableConsoleExpControls_0 then
                        v15(v43.id);
                    end;
                end);
                return;
            end;
        end;
    end, 
    isActivated = function() --[[ Line: 161 ]] --[[ Name: isActivated ]]
        -- upvalues: v54 (copy)
        return v54:get();
    end, 
    selected = l_FFlagEnableConsoleExpControls_0 and function(v57) --[[ Line: 165 ]]
        -- upvalues: v34 (copy), v11 (copy), l_UserInputService_0 (copy), l_GamepadUtils_0 (copy), v15 (copy), v43 (ref)
        if v34 then
            local v58 = nil;
            local v59 = nil;
            local v60 = nil;
            v58 = v11:selectedItem():connect(function(v61) --[[ Line: 171 ]]
                -- upvalues: v57 (copy), v58 (ref), v59 (ref), v60 (ref)
                assert(v61 ~= v57.id, "Expected selectedId to not be self.id on selection");
                v58:disconnect();
                v59:Disconnect();
                v60:Disconnect();
            end);
            v59 = l_UserInputService_0.InputChanged:Connect(function(v62) --[[ Line: 181 ]]
                -- upvalues: l_GamepadUtils_0 (ref), v15 (ref), v43 (ref)
                if v62.KeyCode == Enum.KeyCode.Thumbstick1 and l_GamepadUtils_0.mapPositionToDirection(Vector2.new(v62.Position.X, v62.Position.Y)) == Enum.KeyCode.Down then
                    v15(v43.id);
                end;
            end);
            v60 = l_UserInputService_0.InputBegan:Connect(function(v63) --[[ Line: 190 ]]
                -- upvalues: v15 (ref), v43 (ref)
                local l_KeyCode_0 = v63.KeyCode;
                if l_KeyCode_0 == Enum.KeyCode.DPadDown or l_KeyCode_0 == Enum.KeyCode.Down then
                    v15(v43.id);
                end;
            end);
            return;
        else
            local v65 = nil;
            v65 = l_UserInputService_0.InputEnded:Connect(function(v66) --[[ Line: 198 ]]
                -- upvalues: v15 (ref), v43 (ref), v65 (ref), v11 (ref), v57 (copy)
                if v66.KeyCode == Enum.KeyCode.DPadDown then
                    v15(v43.id);
                end;
                if v65 and v11:selectedItem():get() ~= v57.id then
                    v65:Disconnect();
                end;
            end);
            return;
        end;
    end or nil, 
    components = {
        Icon = function(_) --[[ Line: 211 ]] --[[ Name: Icon ]]
            -- upvalues: l_getExperienceChatVisualConfig_0 (copy), v13 (copy), v54 (copy)
            local v68 = l_getExperienceChatVisualConfig_0();
            return v13(v68.icon.off, v68.icon.on, v54);
        end
    }
});
if v35 then
    v23.createDetachedEffect(function(v69) --[[ Line: 222 ]]
        -- upvalues: l_default_0 (copy), v43 (ref), l_FFlagExpChatWindowSyncUnibar_0 (copy), v24 (copy)
        if l_default_0.getIsChatIconVisible(v69) then
            v43.availability:available();
        else
            v43.availability:unavailable();
        end;
        if l_FFlagExpChatWindowSyncUnibar_0 then
            local v70 = l_default_0.getIsChatWindowVisible(v69);
            v24.Events.ChatTopBarButtonActivated(v70);
        end;
    end);
    v12.setCoreGuiAvailability(v43, Enum.CoreGuiType.Chat, function(v71) --[[ Line: 239 ]]
        -- upvalues: l_default_0 (copy)
        l_default_0.setCoreGuiEnabled(v71);
    end);
end;
if v14 and l_FFlagEnableConsoleExpControls_0 then
    v23.createDetachedEffect(function(v72) --[[ Line: 245 ]]
        -- upvalues: v25 (copy), v11 (copy), v9 (copy)
        if v25.getChatInputBarFocused(v72) then
            v11:setShortcutBar(v9.UNIBAR_SHORTCUTBAR_ID);
            return;
        else
            v11:setShortcutBar(nil);
            return;
        end;
    end);
end;
if l_GetFFlagSimpleChatUnreadMessageCount_0() then
    l_TextChatService_0.MessageReceived:Connect(function() --[[ Line: 257 ]]
        -- upvalues: l_v30_Visibility_0 (ref), v43 (ref)
        if not l_v30_Visibility_0 and v43.notification:isEmpty() then
            v43.notification:fireCount(1);
        end;
    end);
    if not l_GetFFlagDisableLegacyChatSimpleUnreadMessageCount_0() then
        v30.MessagesChanged:connect(function(_) --[[ Line: 265 ]]
            -- upvalues: l_v30_Visibility_0 (ref), v43 (ref)
            if not l_v30_Visibility_0 and v43.notification:isEmpty() then
                v43.notification:fireCount(1);
            end;
        end);
    end;
else
    l_TextChatService_0.MessageReceived:Connect(function() --[[ Line: 272 ]]
        -- upvalues: l_v30_Visibility_0 (ref), v41 (ref), v43 (ref)
        if not l_v30_Visibility_0 then
            v41 = v41 + 1;
            v43.notification:fireCount(v41);
        end;
    end);
    local v74 = 0;
    do
        local l_v74_0 = v74;
        v30.MessagesChanged:connect(function(v76) --[[ Line: 280 ]]
            -- upvalues: l_v30_Visibility_0 (ref), v41 (ref), l_v74_0 (ref), v43 (ref)
            if not l_v30_Visibility_0 then
                v41 = v41 + (v76 - l_v74_0);
                v43.notification:fireCount(v41);
            end;
            l_v74_0 = v76;
        end);
    end;
end;
if not l_FFlagExpChatWindowSyncUnibar_0 then
    v30.ChatActiveChanged:connect(function(v77) --[[ Line: 290 ]]
        -- upvalues: v35 (copy), l_default_0 (copy), l_RunService_0 (copy), l_Chat_0 (copy), l_Players_0 (copy), v43 (ref)
        if v35 then
            l_default_0.setChatActiveCalledByDeveloper(v77);
            return;
        else
            if v77 then
                local v78;
                if not l_RunService_0:IsStudio() then
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 59 ]]
                        -- upvalues: l_Chat_0 (ref), l_Players_0 (ref)
                        return l_Chat_0:CanUserChatAsync(l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0);
                    end);
                    v78 = l_status_2 and l_result_2;
                else
                    v78 = true;
                end;
                if not v78 then
                    v43.availability:available();
                end;
            end;
            return;
        end;
    end);
end;
local function _() --[[ Line: 304 ]] --[[ Name: setChatVisibilityOnLoad ]]
    -- upvalues: l_GameSettings_0 (copy), v16 (copy), l_v30_Visibility_0 (ref), v30 (copy)
    local l_ChatVisible_0 = l_GameSettings_0.ChatVisible;
    if v16.isSmallTouchScreen() then
        l_ChatVisible_0 = false;
    end;
    l_v30_Visibility_0 = l_ChatVisible_0;
    v30:SetVisible(l_ChatVisible_0);
end;
coroutine.wrap(function() --[[ Line: 314 ]]
    -- upvalues: l_Players_0 (copy), l_RunService_0 (copy), l_Chat_0 (copy), v35 (copy), l_default_0 (copy), l_GameSettings_0 (copy), v16 (copy), l_v30_Visibility_0 (ref), v30 (copy), v43 (ref), v12 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    while not l_LocalPlayer_0 do
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    local v84;
    if not l_RunService_0:IsStudio() then
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 59 ]]
            -- upvalues: l_Chat_0 (ref), l_Players_0 (ref)
            return l_Chat_0:CanUserChatAsync(l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0);
        end);
        v84 = l_status_3 and l_result_3;
    else
        v84 = true;
    end;
    if v35 then
        l_default_0.setLocalUserChat(v84);
        if v84 then
            local l_ChatVisible_1 = l_GameSettings_0.ChatVisible;
            if v16.isSmallTouchScreen() then
                l_ChatVisible_1 = false;
            end;
            l_v30_Visibility_0 = l_ChatVisible_1;
            v30:SetVisible(l_ChatVisible_1);
            return;
        end;
    elseif v84 and v43.availability then
        v12.setCoreGuiAvailability(v43, Enum.CoreGuiType.Chat, function(v88) --[[ Line: 329 ]]
            -- upvalues: v43 (ref)
            if v88 then
                v43.availability:pinned();
                return;
            else
                v43.availability:unavailable();
                return;
            end;
        end);
        local l_ChatVisible_2 = l_GameSettings_0.ChatVisible;
        if v16.isSmallTouchScreen() then
            l_ChatVisible_2 = false;
        end;
        l_v30_Visibility_0 = l_ChatVisible_2;
        v30:SetVisible(l_ChatVisible_2);
    end;
end)();
_simulateChat = function() --[[ Line: 349 ]] --[[ Name: _simulateChat ]]
    -- upvalues: l_v30_Visibility_0 (ref), v41 (ref), v43 (ref)
    while true do
        task.wait(math.random(1, 15));
        if not l_v30_Visibility_0 then
            v41 = v41 + 1;
            v43.notification:fireCount(v41);
        end;
    end;
end;
return v43;