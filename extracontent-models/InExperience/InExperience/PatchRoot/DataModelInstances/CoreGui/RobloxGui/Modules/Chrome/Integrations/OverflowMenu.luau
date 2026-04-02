local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Service);
local v4 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils);
local v5 = require(l_script_FirstAncestor_0.Integrations.ChromeIntegrationUtils);
local v6 = require(l_script_FirstAncestor_0.Integrations.RespawnUtils);
local l_MappedSignal_0 = v4.MappedSignal;
local l_UnibarStyle_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).UnibarStyle;
local v9 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local v10 = require(l_script_FirstAncestor_0.Integrations.CommonFtuxTooltip);
local v11 = require(l_script_FirstAncestor_0.Integrations.AvatarSwitcher.AvatarSwitcherFtuxTooltip);
local l_VRService_0 = game:GetService("VRService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v14 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v15 = require(l_RobloxGui_0.Modules.EmotesMenu.EmotesMenuMaster);
local v16 = require(l_RobloxGui_0.Modules.BackpackScript);
local v17 = require(l_script_FirstAncestor_0.ChromeShared.Hooks.useMappedSignal);
local l_GetFFlagIsSquadEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled;
local v19 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v19.App.ImageSet.Images;
local l_useStyle_0 = v19.Core.Style.useStyle;
local l_ImageSetLabel_0 = v19.Core.ImageSet.ImageSetLabel;
local v23 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local v25 = require(l_RobloxGui_0.Modules.SelfieView);
local v26 = require(l_script_FirstAncestor_0.Flags.GetFStringConnectTooltipLocalStorageKey);
local l_FFlagEnableUnibarFtuxTooltips_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUnibarFtuxTooltips;
local v28 = require(l_script_FirstAncestor_0.Flags.GetFIntRobloxConnectFtuxShowDelayMs);
local v29 = require(l_script_FirstAncestor_0.Flags.GetFIntRobloxConnectFtuxDismissDelayMs);
local l_GetFFlagEnableAppChatInExperience_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience;
local v31 = require(l_script_FirstAncestor_0.Flags.GetShouldShowPlatformChatBasedOnPolicy);
local v32 = game:DefineFastFlag("FixIntegrationActivated1", false);
local v33 = game:DefineFastFlag("FixInventoryFilledIcon", false);
local l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 = require(l_script_FirstAncestor_0.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider;
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v36 = game:DefineFastFlag("AppChatEnabledChromeDropdownFtuxTooltip", false);
local v37 = game:DefineFastFlag("AvatarSwitcherFtuxTooltip", false);
local v38 = game:DefineFastInt("UnibarConnectTooltipPriority", 2000);
local v39 = l_GetFFlagEnableAppChatInExperience_0() and l_FFlagEnableUnibarFtuxTooltips_0 and v36 and v31();
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local l_InExperienceUIVRIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP;
local l_SELFIE_VIEW_ID_0 = v23.SELFIE_VIEW_ID;
local v43 = l_MappedSignal_0.new(v14:GetSetVisibleChangedEvent().Event, function() --[[ Line: 67 ]]
    -- upvalues: v14 (copy)
    return v14:GetSetVisible();
end);
local v46 = v3:register({
    id = "leaderboard", 
    label = "CoreScripts.TopBar.Leaderboard", 
    activated = function(_) --[[ Line: 74 ]] --[[ Name: activated ]]
        -- upvalues: l_isInExperienceUIVREnabled_0 (copy), l_VRService_0 (copy), l_RobloxGui_0 (copy), v14 (copy), l_isSpatial_0 (copy), l_InExperienceUIVRIXP_0 (copy), v5 (copy)
        if not l_isInExperienceUIVREnabled_0 and l_VRService_0.VREnabled then
            require(l_RobloxGui_0.Modules.InGameMenu).openPlayersPage();
            return;
        elseif v14:GetSetVisible() then
            v14:SetVisibility(not v14:GetSetVisible());
            return;
        elseif l_isInExperienceUIVREnabled_0 and l_isSpatial_0() and not l_InExperienceUIVRIXP_0:isMovePanelToCenter() then
            v14:SetVisibility(not v14:GetSetVisible());
            return;
        else
            v5.dismissRobloxMenuAndRun(function() --[[ Line: 85 ]]
                -- upvalues: v14 (ref)
                v14:SetVisibility(not v14:GetSetVisible());
            end);
            return;
        end;
    end, 
    isActivated = function() --[[ Line: 92 ]] --[[ Name: isActivated ]]
        -- upvalues: v43 (copy)
        return v43:get();
    end, 
    components = {
        Icon = function(_) --[[ Line: 96 ]] --[[ Name: Icon ]]
            -- upvalues: v9 (copy), v43 (copy)
            return v9("icons/controls/leaderboardOff", "icons/controls/leaderboardOn", v43);
        end
    }
});
v4.setCoreGuiAvailability(v46, Enum.CoreGuiType.PlayerList);
local v47 = l_MappedSignal_0.new(v15.EmotesMenuToggled.Event, function() --[[ Line: 103 ]]
    -- upvalues: v15 (copy)
    return v15:isOpen();
end);
local v50 = v3:register({
    id = "emotes", 
    label = "CoreScripts.TopBar.Emotes", 
    activated = function(_) --[[ Line: 109 ]] --[[ Name: activated ]]
        -- upvalues: v15 (copy), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), l_InExperienceUIVRIXP_0 (copy), v5 (copy)
        if v15:isOpen() then
            v15:close();
            return;
        elseif l_isInExperienceUIVREnabled_0 and l_isSpatial_0() and not l_InExperienceUIVRIXP_0:isMovePanelToCenter() then
            v15:open();
            return;
        else
            v5.dismissRobloxMenuAndRun(function() --[[ Line: 116 ]]
                -- upvalues: v15 (ref)
                v15:open();
            end);
            return;
        end;
    end, 
    isActivated = function() --[[ Line: 122 ]] --[[ Name: isActivated ]]
        -- upvalues: v47 (copy)
        return v47:get();
    end, 
    components = {
        Icon = function(_) --[[ Line: 126 ]] --[[ Name: Icon ]]
            -- upvalues: v9 (copy), v47 (copy)
            return v9("icons/controls/emoteOff", "icons/controls/emoteOn", v47);
        end
    }
});
local v51 = false;
local l_MenuIsVisible_0 = v15.MenuIsVisible;
updateEmoteAvailability = function() --[[ Line: 135 ]] --[[ Name: updateEmoteAvailability ]]
    -- upvalues: v51 (ref), l_MenuIsVisible_0 (ref), v50 (copy)
    if v51 and l_MenuIsVisible_0 then
        v50.availability:available();
        return;
    else
        v50.availability:unavailable();
        return;
    end;
end;
v4.setCoreGuiAvailability(v50, Enum.CoreGuiType.EmotesMenu, function(v53) --[[ Line: 143 ]]
    -- upvalues: v51 (ref)
    v51 = v53;
    updateEmoteAvailability();
end);
v15.MenuVisibilityChanged.Event:Connect(function() --[[ Line: 148 ]]
    -- upvalues: l_MenuIsVisible_0 (ref), v15 (copy)
    l_MenuIsVisible_0 = v15.MenuIsVisible;
    updateEmoteAvailability();
end);
local v54 = l_MappedSignal_0.new(v16.StateChanged.Event, function() --[[ Line: 153 ]]
    -- upvalues: v16 (copy)
    return v16.IsOpen;
end);
local v57 = v3:register({
    id = "backpack", 
    label = "CoreScripts.TopBar.Inventory", 
    activated = function(_) --[[ Line: 159 ]] --[[ Name: activated ]]
        -- upvalues: v16 (copy), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), l_InExperienceUIVRIXP_0 (copy), v5 (copy)
        if v16.IsOpen then
            v16:OpenClose();
            return;
        elseif l_isInExperienceUIVREnabled_0 and l_isSpatial_0() and not l_InExperienceUIVRIXP_0:isMovePanelToCenter() then
            v16:OpenClose();
            return;
        else
            v5.dismissRobloxMenuAndRun(function() --[[ Line: 166 ]]
                -- upvalues: v16 (ref)
                v16:OpenClose();
            end);
            return;
        end;
    end, 
    isActivated = function() --[[ Line: 172 ]] --[[ Name: isActivated ]]
        -- upvalues: v54 (copy)
        return v54:get();
    end, 
    components = {
        Icon = function(_) --[[ Line: 176 ]] --[[ Name: Icon ]]
            -- upvalues: v9 (copy), v33 (copy), v54 (copy)
            return v9("icons/menu/inventoryOff", v33 and "icons/menu/inventoryOn" or "icons/menu/inventory", v54);
        end
    }
});
v4.setCoreGuiAvailability(v57, Enum.CoreGuiType.Backpack);
local v60 = v3:register({
    id = "respawn", 
    label = "CoreScripts.InGameMenu.QuickActions.Respawn", 
    activated = function(_) --[[ Line: 190 ]] --[[ Name: activated ]]
        -- upvalues: v6 (copy)
        v6.respawnPage();
    end, 
    isActivated = function() --[[ Line: 193 ]] --[[ Name: isActivated ]]
        -- upvalues: v6 (copy)
        return v6.respawnPageOpenSignal:get();
    end, 
    components = {
        Icon = function(_) --[[ Line: 197 ]] --[[ Name: Icon ]]
            -- upvalues: v9 (copy)
            return v9("icons/actions/respawn");
        end
    }
});
updateRespawn = function(v61) --[[ Line: 203 ]] --[[ Name: updateRespawn ]]
    -- upvalues: v60 (copy)
    if v61 then
        v60.availability:available();
        return;
    else
        v60.availability:unavailable();
        return;
    end;
end;
task.defer(function() --[[ Line: 211 ]]
    -- upvalues: l_RobloxGui_0 (copy)
    local v62 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
    v62.RespawnBehaviourChangedEvent.Event:connect(updateRespawn);
    updateRespawn(v62:GetRespawnBehaviour());
end);
local v63 = v3:currentSubMenu();
local v64 = l_MappedSignal_0.new(v63:signal(), function() --[[ Line: 218 ]]
    -- upvalues: v63 (copy)
    return v63:get() == "nine_dot";
end);
if v3:orderAlignment():get() == Enum.HorizontalAlignment.Right then
    v64:connect(function(v65) --[[ Line: 223 ]]
        -- upvalues: v14 (copy)
        v14:SetMinimized(v65);
    end);
end;
HamburgerButton = function(v66) --[[ Line: 228 ]] --[[ Name: HamburgerButton ]]
    -- upvalues: l_useStyle_0 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v23 (copy), v64 (copy), v17 (copy), v39 (copy), v10 (copy), v38 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v26 (copy), v28 (copy), v29 (copy), v2 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v25 (copy), v3 (copy), l_SELFIE_VIEW_ID_0 (copy), v37 (copy), v11 (copy)
    local l_toggleTransition_0 = v66.toggleTransition;
    local v68 = l_useStyle_0();
    local v69 = nil;
    local v70 = nil;
    local v71 = nil;
    if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then
        v69 = l_UnibarStyle_0.use();
        v70 = v69.ICON_SIZE;
        v71 = v69.MEDIUM_ICON_SIZE;
    else
        v70 = v23.ICON_SIZE;
        v71 = v23.MEDIUM_ICON_SIZE;
    end;
    local v72 = v64 and v17(v64) or false;
    local v73 = if v39 then v10({
        id = "CONNECT_TOOLTIP", 
        priority = v38, 
        isIconVisible = v66.visible, 
        headerKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "CoreScripts.FTUX.Heading.CheckOutRobloxParty" or "CoreScripts.FTUX.Heading.CheckOutRobloxConnect", 
        bodyKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "CoreScripts.FTUX.Label.PartyWithYourFriendsAnytime" or "CoreScripts.FTUX.Label.ChatWithYourFriendsAnytime", 
        localStorageKey = v26(), 
        showDelay = v28(), 
        dismissDelay = v29()
    }) else nil;
    return v2.createElement("Frame", {
        Size = UDim2.new(0, v70, 0, v70), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v68.Theme.BackgroundOnHover.Color, 
        BackgroundTransparency = l_toggleTransition_0:map(function(v74) --[[ Line: 269 ]]
            -- upvalues: v68 (copy)
            return 1 - (1 - v68.Theme.BackgroundOnHover.Transparency) * v74;
        end)
    }, {
        v2.createElement("UICorner", {
            Name = "Corner", 
            CornerRadius = UDim.new(1, 0)
        }), 
        v2.createElement(l_ImageSetLabel_0, {
            Name = "Overflow", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/common/hamburgermenu"], 
            Size = l_toggleTransition_0:map(function(v75) --[[ Line: 283 ]]
                -- upvalues: v70 (ref)
                v75 = 1 - v75;
                return UDim2.new(0, v70 * v75, 0, v70 * v75);
            end), 
            ImageColor3 = v68.Theme.IconEmphasis.Color, 
            ImageTransparency = l_toggleTransition_0:map(function(v76) --[[ Line: 289 ]]
                -- upvalues: v68 (copy)
                return v76 * v68.Theme.IconEmphasis.Transparency;
            end)
        }), 
        v2.createElement(l_ImageSetLabel_0, {
            Name = "Close", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/navigation/close"], 
            Size = l_toggleTransition_0:map(function(v77) --[[ Line: 299 ]]
                -- upvalues: v71 (ref)
                return UDim2.new(0, v71 * v77, 0, v71 * v77);
            end), 
            ImageColor3 = v68.Theme.IconEmphasis.Color, 
            ImageTransparency = l_toggleTransition_0:map(function(v78) --[[ Line: 304 ]]
                -- upvalues: v68 (copy)
                return (1 - v78) * v68.Theme.IconEmphasis.Transparency;
            end)
        }), 
        if not v25.useCameraOn() or v3:isWindowOpen(l_SELFIE_VIEW_ID_0) or v72 then nil else v2.createElement(v25.CameraStatusDot, {
            Name = "CameraStatusDot", 
            Position = UDim2.new(1, -4, 1, -7), 
            ZIndex = 2
        }), 
        v73, 
        if v37 then v2.createElement(v11, {
            visible = v66.visible
        }) else nil
    });
end;
return v3:register({
    initialAvailability = v3.AvailabilitySignal.Pinned, 
    id = "nine_dot", 
    label = "CoreScripts.TopBar.MoreMenu", 
    isActivated = v32 and function() --[[ Line: 331 ]]
        -- upvalues: v64 (copy)
        return v64:get();
    end or nil, 
    components = {
        Icon = function(v79) --[[ Line: 336 ]] --[[ Name: Icon ]]
            -- upvalues: v2 (copy)
            return v2.createElement(HamburgerButton, v79);
        end
    }
});