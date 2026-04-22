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
local l_SideSheetPlacement_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enums.SideSheetPlacement;
local v25 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
local v26 = v25.Stores.GetFocusNavigationStore(false);
local v27 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableConsoleExpControls_0 = v27.FFlagEnableConsoleExpControls;
local l_FFlagExpChatWindowSyncUnibar_0 = v27.FFlagExpChatWindowSyncUnibar;
local l_InExperienceAppChatModal_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatModal;
local v31 = require(l_RobloxGui_0.Modules.ChatSelector);
local l_getExperienceChatVisualConfig_0 = require(l_CorePackages_0.Workspace.Packages.ExpChat).getExperienceChatVisualConfig;
local l_GetFFlagSimpleChatUnreadMessageCount_0 = v27.GetFFlagSimpleChatUnreadMessageCount;
local l_GetFFlagDisableLegacyChatSimpleUnreadMessageCount_0 = v27.GetFFlagDisableLegacyChatSimpleUnreadMessageCount;
local l_GetFFlagTextChatEnableUniverseChatTabs_0 = require(l_CorePackages_0.Workspace.Packages.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs;
local v36 = game:DefineFastFlag("ExpChatUnibarThumbstickNavigate", false);
local v37 = game:DefineFastFlag("ExpChatUnibarAvailabilityRefactor", false);
local v38 = game:DefineFastFlag("HideChatButtonForChatDisabledUsers", false);
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local l_InExperienceUIVRIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP;
local l_FFlagExpChatPerfTracking_0 = v27.FFlagExpChatPerfTracking;
local l_ExpChatPerfTracker_0 = v25.ExpChatPerfTracker;
local v43 = 0;
local l_v31_Visibility_0 = v31:GetVisibility();
local v45 = nil;
local l_VisibilityStateChanged_0 = v31.VisibilityStateChanged;
local function _() --[[ Line: 62 ]] --[[ Name: localUserCanChat ]]
    -- upvalues: l_RunService_0 (copy), l_Chat_0 (copy), l_Players_0 (copy)
    if not l_RunService_0:IsStudio() then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 64 ]]
            -- upvalues: l_Chat_0 (ref), l_Players_0 (ref)
            return l_Chat_0:CanUserChatAsync(l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0);
        end);
        return l_status_0 and l_result_0;
    else
        return true;
    end;
end;
if not l_FFlagExpChatWindowSyncUnibar_0 then
    l_VisibilityStateChanged_0:connect(function(v50) --[[ Line: 75 ]]
        -- upvalues: v37 (copy), l_default_0 (copy), v45 (ref)
        if v37 then
            l_default_0.setVisibleViaChatSelector(v50);
            return;
        else
            if v50 then
                v45.availability:pinned();
            end;
            return;
        end;
    end);
    v31.ChatWindowToggled:connect(function(v51) --[[ Line: 86 ]]
        -- upvalues: v37 (copy), l_default_0 (copy), v45 (ref)
        if v37 then
            l_default_0.setVisibleViaChatSelector(v51);
            return;
        else
            if v51 then
                v45.availability:pinned();
            end;
            return;
        end;
    end);
end;
if l_FFlagExpChatWindowSyncUnibar_0 then
    l_GameSettings_0:GetPropertyChangedSignal("ChatVisible"):Connect(function() --[[ Line: 100 ]]
        -- upvalues: l_default_0 (copy), l_GameSettings_0 (copy)
        l_default_0.setGameSettingsChatVisible(l_GameSettings_0.ChatVisible);
    end);
    l_default_0.setGameSettingsChatVisible(l_GameSettings_0.ChatVisible);
end;
local v56 = l_MappedSignal_0.new(l_VisibilityStateChanged_0, function() --[[ Line: 106 ]]
    -- upvalues: l_v31_Visibility_0 (ref)
    return l_v31_Visibility_0;
end, function() --[[ Line: 108 ]]
    -- upvalues: v31 (copy), v37 (copy), v38 (copy), l_RunService_0 (copy), l_Chat_0 (copy), l_Players_0 (copy), v45 (ref), l_GuiService_0 (copy), l_GameSettings_0 (copy), l_v31_Visibility_0 (ref), l_GetFFlagSimpleChatUnreadMessageCount_0 (copy), v43 (ref)
    local v52 = v31.GetVisibility();
    if not v37 and v38 and not v52 then
        local v53;
        if not l_RunService_0:IsStudio() then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 64 ]]
                -- upvalues: l_Chat_0 (ref), l_Players_0 (ref)
                return l_Chat_0:CanUserChatAsync(l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0);
            end);
            v53 = l_status_1 and l_result_1;
        else
            v53 = true;
        end;
        if not v53 then
            v45.availability:unavailable();
        end;
    end;
    if not l_GuiService_0.MenuIsOpen then
        l_GameSettings_0.ChatVisible = v52;
    end;
    l_v31_Visibility_0 = v52;
    if l_GetFFlagSimpleChatUnreadMessageCount_0() then
        if v52 and v45.notification then
            v45.notification:clear();
            return;
        end;
    elseif v52 and v43 and v45.notification then
        v43 = 0;
        v45.notification:clear();
    end;
end);
local function _() --[[ Line: 135 ]]
    -- upvalues: l_InExperienceAppChatModal_0 (copy), v31 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v15 (copy), v45 (ref)
    if l_InExperienceAppChatModal_0:getVisible() then
        l_InExperienceAppChatModal_0.default:setVisible(false);
    end;
    v31:SetVisible(true);
    if l_FFlagEnableConsoleExpControls_0 then
        v15(v45.id);
    end;
end;
v45 = v11:register({
    id = "chat", 
    label = "CoreScripts.TopBar.Chat", 
    sideSheetPlacement = l_SideSheetPlacement_0.Unibar, 
    activated = function(_) --[[ Line: 151 ]] --[[ Name: activated ]]
        -- upvalues: l_v31_Visibility_0 (ref), v31 (copy), l_FFlagExpChatPerfTracking_0 (copy), l_ExpChatPerfTracker_0 (copy), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), l_InExperienceUIVRIXP_0 (copy), v10 (copy), l_InExperienceAppChatModal_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v15 (copy), v45 (ref)
        if l_v31_Visibility_0 then
            v31:SetVisible(false);
            return;
        else
            if l_FFlagExpChatPerfTracking_0 then
                l_ExpChatPerfTracker_0.start(l_ExpChatPerfTracker_0.Events.ChatWindowMountTTI, {});
            end;
            if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() and not l_InExperienceUIVRIXP_0:isMovePanelToCenter() then
                v31:SetVisible(true);
                return;
            else
                v10.dismissRobloxMenuAndRun(function() --[[ Line: 161 ]]
                    -- upvalues: l_InExperienceAppChatModal_0 (ref), v31 (ref), l_FFlagEnableConsoleExpControls_0 (ref), v15 (ref), v45 (ref)
                    if l_InExperienceAppChatModal_0:getVisible() then
                        l_InExperienceAppChatModal_0.default:setVisible(false);
                    end;
                    v31:SetVisible(true);
                    if l_FFlagEnableConsoleExpControls_0 then
                        v15(v45.id);
                    end;
                end);
                return;
            end;
        end;
    end, 
    isActivated = function() --[[ Line: 167 ]] --[[ Name: isActivated ]]
        -- upvalues: v56 (copy)
        return v56:get();
    end, 
    selected = l_FFlagEnableConsoleExpControls_0 and function(v59) --[[ Line: 171 ]]
        -- upvalues: v36 (copy), v11 (copy), l_UserInputService_0 (copy), l_GamepadUtils_0 (copy), v15 (copy), v45 (ref)
        if v36 then
            local v60 = nil;
            local v61 = nil;
            local v62 = nil;
            v60 = v11:selectedItem():connect(function(v63) --[[ Line: 177 ]]
                -- upvalues: v59 (copy), v60 (ref), v61 (ref), v62 (ref)
                assert(v63 ~= v59.id, "Expected selectedId to not be self.id on selection");
                v60:disconnect();
                v61:Disconnect();
                v62:Disconnect();
            end);
            v61 = l_UserInputService_0.InputChanged:Connect(function(v64) --[[ Line: 187 ]]
                -- upvalues: l_GamepadUtils_0 (ref), v15 (ref), v45 (ref)
                if v64.KeyCode == Enum.KeyCode.Thumbstick1 and l_GamepadUtils_0.mapPositionToDirection(Vector2.new(v64.Position.X, v64.Position.Y)) == Enum.KeyCode.Down then
                    v15(v45.id);
                end;
            end);
            v62 = l_UserInputService_0.InputBegan:Connect(function(v65) --[[ Line: 196 ]]
                -- upvalues: v15 (ref), v45 (ref)
                local l_KeyCode_0 = v65.KeyCode;
                if l_KeyCode_0 == Enum.KeyCode.DPadDown or l_KeyCode_0 == Enum.KeyCode.Down then
                    v15(v45.id);
                end;
            end);
            return;
        else
            local v67 = nil;
            v67 = l_UserInputService_0.InputEnded:Connect(function(v68) --[[ Line: 204 ]]
                -- upvalues: v15 (ref), v45 (ref), v67 (ref), v11 (ref), v59 (copy)
                if v68.KeyCode == Enum.KeyCode.DPadDown then
                    v15(v45.id);
                end;
                if v67 and v11:selectedItem():get() ~= v59.id then
                    v67:Disconnect();
                end;
            end);
            return;
        end;
    end or nil, 
    components = {
        Icon = function(_) --[[ Line: 217 ]] --[[ Name: Icon ]]
            -- upvalues: l_getExperienceChatVisualConfig_0 (copy), v13 (copy), v56 (copy)
            local v70 = l_getExperienceChatVisualConfig_0();
            return v13(v70.icon.off, v70.icon.on, v56);
        end
    }
});
if v37 then
    v23.createDetachedEffect(function(v71) --[[ Line: 228 ]]
        -- upvalues: l_default_0 (copy), v45 (ref), l_FFlagExpChatWindowSyncUnibar_0 (copy), v25 (copy)
        if l_default_0.getIsChatIconVisible(v71) then
            v45.availability:available();
        else
            v45.availability:unavailable();
        end;
        if l_FFlagExpChatWindowSyncUnibar_0 then
            local v72 = l_default_0.getIsChatWindowVisible(v71);
            v25.Events.ChatTopBarButtonActivated(v72);
        end;
    end);
    v12.setCoreGuiAvailability(v45, Enum.CoreGuiType.Chat, function(v73) --[[ Line: 245 ]]
        -- upvalues: l_default_0 (copy)
        l_default_0.setCoreGuiEnabled(v73);
    end);
end;
if v14 and l_FFlagEnableConsoleExpControls_0 then
    v23.createDetachedEffect(function(v74) --[[ Line: 251 ]]
        -- upvalues: v26 (copy), v11 (copy), v9 (copy)
        if v26.getChatInputBarFocused(v74) then
            v11:setShortcutBar(v9.UNIBAR_SHORTCUTBAR_ID);
            return;
        else
            v11:setShortcutBar(nil);
            return;
        end;
    end);
end;
if l_GetFFlagSimpleChatUnreadMessageCount_0() then
    l_TextChatService_0.MessageReceived:Connect(function() --[[ Line: 263 ]]
        -- upvalues: l_v31_Visibility_0 (ref), v45 (ref)
        if not l_v31_Visibility_0 and v45.notification:isEmpty() then
            v45.notification:fireCount(1);
        end;
    end);
    if l_GetFFlagTextChatEnableUniverseChatTabs_0() then
        l_TextChatService_0.UniverseChatMessageReceived:Connect(function() --[[ Line: 271 ]]
            -- upvalues: l_v31_Visibility_0 (ref), v45 (ref)
            if not l_v31_Visibility_0 and v45.notification:isEmpty() then
                v45.notification:fireCount(1);
            end;
        end);
    end;
    if not l_GetFFlagDisableLegacyChatSimpleUnreadMessageCount_0() then
        v31.MessagesChanged:connect(function(_) --[[ Line: 280 ]]
            -- upvalues: l_v31_Visibility_0 (ref), v45 (ref)
            if not l_v31_Visibility_0 and v45.notification:isEmpty() then
                v45.notification:fireCount(1);
            end;
        end);
    end;
else
    l_TextChatService_0.MessageReceived:Connect(function() --[[ Line: 287 ]]
        -- upvalues: l_v31_Visibility_0 (ref), v43 (ref), v45 (ref)
        if not l_v31_Visibility_0 then
            v43 = v43 + 1;
            v45.notification:fireCount(v43);
        end;
    end);
    if l_GetFFlagTextChatEnableUniverseChatTabs_0() then
        l_TextChatService_0.UniverseChatMessageReceived:Connect(function() --[[ Line: 296 ]]
            -- upvalues: l_v31_Visibility_0 (ref), v43 (ref), v45 (ref)
            if not l_v31_Visibility_0 then
                v43 = v43 + 1;
                v45.notification:fireCount(v43);
            end;
        end);
    end;
    local v76 = 0;
    do
        local l_v76_0 = v76;
        v31.MessagesChanged:connect(function(v78) --[[ Line: 305 ]]
            -- upvalues: l_v31_Visibility_0 (ref), v43 (ref), l_v76_0 (ref), v45 (ref)
            if not l_v31_Visibility_0 then
                v43 = v43 + (v78 - l_v76_0);
                v45.notification:fireCount(v43);
            end;
            l_v76_0 = v78;
        end);
    end;
end;
if not l_FFlagExpChatWindowSyncUnibar_0 then
    v31.ChatActiveChanged:connect(function(v79) --[[ Line: 315 ]]
        -- upvalues: v37 (copy), l_default_0 (copy), l_RunService_0 (copy), l_Chat_0 (copy), l_Players_0 (copy), v45 (ref)
        if v37 then
            l_default_0.setChatActiveCalledByDeveloper(v79);
            return;
        else
            if v79 then
                local v80;
                if not l_RunService_0:IsStudio() then
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 64 ]]
                        -- upvalues: l_Chat_0 (ref), l_Players_0 (ref)
                        return l_Chat_0:CanUserChatAsync(l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0);
                    end);
                    v80 = l_status_2 and l_result_2;
                else
                    v80 = true;
                end;
                if not v80 then
                    v45.availability:available();
                end;
            end;
            return;
        end;
    end);
end;
local function _() --[[ Line: 329 ]] --[[ Name: setChatVisibilityOnLoad ]]
    -- upvalues: l_GameSettings_0 (copy), v16 (copy), l_v31_Visibility_0 (ref), v31 (copy)
    local l_ChatVisible_0 = l_GameSettings_0.ChatVisible;
    if v16.isSmallTouchScreen() then
        l_ChatVisible_0 = false;
    end;
    l_v31_Visibility_0 = l_ChatVisible_0;
    v31:SetVisible(l_ChatVisible_0);
end;
coroutine.wrap(function() --[[ Line: 339 ]]
    -- upvalues: l_Players_0 (copy), l_RunService_0 (copy), l_Chat_0 (copy), v37 (copy), l_default_0 (copy), l_GameSettings_0 (copy), v16 (copy), l_v31_Visibility_0 (ref), v31 (copy), v45 (ref), v12 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    while not l_LocalPlayer_0 do
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    local v86;
    if not l_RunService_0:IsStudio() then
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 64 ]]
            -- upvalues: l_Chat_0 (ref), l_Players_0 (ref)
            return l_Chat_0:CanUserChatAsync(l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0);
        end);
        v86 = l_status_3 and l_result_3;
    else
        v86 = true;
    end;
    if v37 then
        l_default_0.setLocalUserChat(v86);
        if v86 then
            local l_ChatVisible_1 = l_GameSettings_0.ChatVisible;
            if v16.isSmallTouchScreen() then
                l_ChatVisible_1 = false;
            end;
            l_v31_Visibility_0 = l_ChatVisible_1;
            v31:SetVisible(l_ChatVisible_1);
            return;
        end;
    elseif v86 and v45.availability then
        v12.setCoreGuiAvailability(v45, Enum.CoreGuiType.Chat, function(v90) --[[ Line: 354 ]]
            -- upvalues: v45 (ref)
            if v90 then
                v45.availability:pinned();
                return;
            else
                v45.availability:unavailable();
                return;
            end;
        end);
        local l_ChatVisible_2 = l_GameSettings_0.ChatVisible;
        if v16.isSmallTouchScreen() then
            l_ChatVisible_2 = false;
        end;
        l_v31_Visibility_0 = l_ChatVisible_2;
        v31:SetVisible(l_ChatVisible_2);
    end;
end)();
_simulateChat = function() --[[ Line: 374 ]] --[[ Name: _simulateChat ]]
    -- upvalues: l_v31_Visibility_0 (ref), v43 (ref), v45 (ref)
    while true do
        task.wait(math.random(1, 15));
        if not l_v31_Visibility_0 then
            v43 = v43 + 1;
            v45.notification:fireCount(v43);
        end;
    end;
end;
return v45;