local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Service);
local v4 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils);
local v5 = require(l_script_FirstAncestor_0.Integrations.ChromeIntegrationUtils);
local v6 = require(l_script_FirstAncestor_0.Integrations.RespawnUtils);
local l_MappedSignal_0 = v4.MappedSignal;
local v8 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.UnibarStyle);
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
local v34 = require(l_script_FirstAncestor_0.Flags.FFlagEnableUnibarTooltipQueue)();
local l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 = require(l_script_FirstAncestor_0.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider;
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v37 = game:DefineFastFlag("AppChatEnabledChromeDropdownFtuxTooltip", false);
local v38 = game:DefineFastFlag("AvatarSwitcherFtuxTooltip", false);
local v39 = game:DefineFastInt("UnibarConnectTooltipPriority", 2000);
local v40 = l_GetFFlagEnableAppChatInExperience_0() and l_FFlagEnableUnibarFtuxTooltips_0 and v37 and v31();
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local l_InExperienceUIVRIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP;
local l_SELFIE_VIEW_ID_0 = v23.SELFIE_VIEW_ID;
local v44 = l_MappedSignal_0.new(v14:GetSetVisibleChangedEvent().Event, function() --[[ Line: 68 ]]
    -- upvalues: v14 (copy)
    return v14:GetSetVisible();
end);
local v47 = v3:register({
    id = "leaderboard", 
    label = "CoreScripts.TopBar.Leaderboard", 
    activated = function(_) --[[ Line: 75 ]] --[[ Name: activated ]]
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
            v5.dismissRobloxMenuAndRun(function() --[[ Line: 86 ]]
                -- upvalues: v14 (ref)
                v14:SetVisibility(not v14:GetSetVisible());
            end);
            return;
        end;
    end, 
    isActivated = function() --[[ Line: 93 ]] --[[ Name: isActivated ]]
        -- upvalues: v44 (copy)
        return v44:get();
    end, 
    components = {
        Icon = function(_) --[[ Line: 97 ]] --[[ Name: Icon ]]
            -- upvalues: v9 (copy), v44 (copy)
            return v9("icons/controls/leaderboardOff", "icons/controls/leaderboardOn", v44);
        end
    }
});
v4.setCoreGuiAvailability(v47, Enum.CoreGuiType.PlayerList);
local v48 = l_MappedSignal_0.new(v15.EmotesMenuToggled.Event, function() --[[ Line: 104 ]]
    -- upvalues: v15 (copy)
    return v15:isOpen();
end);
local v51 = v3:register({
    id = "emotes", 
    label = "CoreScripts.TopBar.Emotes", 
    activated = function(_) --[[ Line: 110 ]] --[[ Name: activated ]]
        -- upvalues: v15 (copy), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), l_InExperienceUIVRIXP_0 (copy), v5 (copy)
        if v15:isOpen() then
            v15:close();
            return;
        elseif l_isInExperienceUIVREnabled_0 and l_isSpatial_0() and not l_InExperienceUIVRIXP_0:isMovePanelToCenter() then
            v15:open();
            return;
        else
            v5.dismissRobloxMenuAndRun(function() --[[ Line: 117 ]]
                -- upvalues: v15 (ref)
                v15:open();
            end);
            return;
        end;
    end, 
    isActivated = function() --[[ Line: 123 ]] --[[ Name: isActivated ]]
        -- upvalues: v48 (copy)
        return v48:get();
    end, 
    components = {
        Icon = function(_) --[[ Line: 127 ]] --[[ Name: Icon ]]
            -- upvalues: v9 (copy), v48 (copy)
            return v9("icons/controls/emoteOff", "icons/controls/emoteOn", v48);
        end
    }
});
local v52 = false;
local l_MenuIsVisible_0 = v15.MenuIsVisible;
updateEmoteAvailability = function() --[[ Line: 136 ]] --[[ Name: updateEmoteAvailability ]]
    -- upvalues: v52 (ref), l_MenuIsVisible_0 (ref), v51 (copy)
    if v52 and l_MenuIsVisible_0 then
        v51.availability:available();
        return;
    else
        v51.availability:unavailable();
        return;
    end;
end;
v4.setCoreGuiAvailability(v51, Enum.CoreGuiType.EmotesMenu, function(v54) --[[ Line: 144 ]]
    -- upvalues: v52 (ref)
    v52 = v54;
    updateEmoteAvailability();
end);
v15.MenuVisibilityChanged.Event:Connect(function() --[[ Line: 149 ]]
    -- upvalues: l_MenuIsVisible_0 (ref), v15 (copy)
    l_MenuIsVisible_0 = v15.MenuIsVisible;
    updateEmoteAvailability();
end);
local v55 = l_MappedSignal_0.new(v16.StateChanged.Event, function() --[[ Line: 154 ]]
    -- upvalues: v16 (copy)
    return v16.IsOpen;
end);
local v58 = v3:register({
    id = "backpack", 
    label = "CoreScripts.TopBar.Inventory", 
    activated = function(_) --[[ Line: 160 ]] --[[ Name: activated ]]
        -- upvalues: v16 (copy), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), l_InExperienceUIVRIXP_0 (copy), v5 (copy)
        if v16.IsOpen then
            v16:OpenClose();
            return;
        elseif l_isInExperienceUIVREnabled_0 and l_isSpatial_0() and not l_InExperienceUIVRIXP_0:isMovePanelToCenter() then
            v16:OpenClose();
            return;
        else
            v5.dismissRobloxMenuAndRun(function() --[[ Line: 167 ]]
                -- upvalues: v16 (ref)
                v16:OpenClose();
            end);
            return;
        end;
    end, 
    isActivated = function() --[[ Line: 173 ]] --[[ Name: isActivated ]]
        -- upvalues: v55 (copy)
        return v55:get();
    end, 
    components = {
        Icon = function(_) --[[ Line: 177 ]] --[[ Name: Icon ]]
            -- upvalues: v9 (copy), v33 (copy), v55 (copy)
            return v9("icons/menu/inventoryOff", v33 and "icons/menu/inventoryOn" or "icons/menu/inventory", v55);
        end
    }
});
v4.setCoreGuiAvailability(v58, Enum.CoreGuiType.Backpack);
local v61 = v3:register({
    id = "respawn", 
    label = "CoreScripts.InGameMenu.QuickActions.Respawn", 
    activated = function(_) --[[ Line: 191 ]] --[[ Name: activated ]]
        -- upvalues: v6 (copy)
        v6.respawnPage();
    end, 
    isActivated = function() --[[ Line: 194 ]] --[[ Name: isActivated ]]
        -- upvalues: v6 (copy)
        return v6.respawnPageOpenSignal:get();
    end, 
    components = {
        Icon = function(_) --[[ Line: 198 ]] --[[ Name: Icon ]]
            -- upvalues: v9 (copy)
            return v9("icons/actions/respawn");
        end
    }
});
updateRespawn = function(v62) --[[ Line: 204 ]] --[[ Name: updateRespawn ]]
    -- upvalues: v61 (copy)
    if v62 then
        v61.availability:available();
        return;
    else
        v61.availability:unavailable();
        return;
    end;
end;
task.defer(function() --[[ Line: 212 ]]
    -- upvalues: l_RobloxGui_0 (copy)
    local v63 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
    v63.RespawnBehaviourChangedEvent.Event:connect(updateRespawn);
    updateRespawn(v63:GetRespawnBehaviour());
end);
local v64 = v3:currentSubMenu();
local v65 = l_MappedSignal_0.new(v64:signal(), function() --[[ Line: 219 ]]
    -- upvalues: v64 (copy)
    return v64:get() == "nine_dot";
end);
if v3:orderAlignment():get() == Enum.HorizontalAlignment.Right then
    v65:connect(function(v66) --[[ Line: 224 ]]
        -- upvalues: v14 (copy)
        v14:SetMinimized(v66);
    end);
end;
HamburgerButton = function(v67) --[[ Line: 229 ]] --[[ Name: HamburgerButton ]]
    -- upvalues: l_useStyle_0 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), v8 (copy), v23 (copy), v65 (copy), v17 (copy), v40 (copy), v10 (copy), v34 (copy), v39 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v26 (copy), v28 (copy), v29 (copy), v2 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v25 (copy), v3 (copy), l_SELFIE_VIEW_ID_0 (copy), v38 (copy), v11 (copy)
    local l_toggleTransition_0 = v67.toggleTransition;
    local v69 = l_useStyle_0();
    local v70 = nil;
    local v71 = nil;
    local v72 = nil;
    if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then
        v70 = v8.use();
        v71 = v70.ICON_SIZE;
        v72 = v70.MEDIUM_ICON_SIZE;
    else
        v71 = v23.ICON_SIZE;
        v72 = v23.MEDIUM_ICON_SIZE;
    end;
    local v73 = v65 and v17(v65) or false;
    local v74 = if v40 then v10({
        id = v34 and "CONNECT_TOOLTIP" or nil, 
        priority = if v34 then v39 else nil, 
        isIconVisible = v67.visible, 
        headerKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "CoreScripts.FTUX.Heading.CheckOutRobloxParty" or "CoreScripts.FTUX.Heading.CheckOutRobloxConnect", 
        bodyKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "CoreScripts.FTUX.Label.PartyWithYourFriendsAnytime" or "CoreScripts.FTUX.Label.ChatWithYourFriendsAnytime", 
        localStorageKey = v26(), 
        showDelay = v28(), 
        dismissDelay = v29()
    }) else nil;
    return v2.createElement("Frame", {
        Size = UDim2.new(0, v71, 0, v71), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v69.Theme.BackgroundOnHover.Color, 
        BackgroundTransparency = l_toggleTransition_0:map(function(v75) --[[ Line: 270 ]]
            -- upvalues: v69 (copy)
            return 1 - (1 - v69.Theme.BackgroundOnHover.Transparency) * v75;
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
            Size = l_toggleTransition_0:map(function(v76) --[[ Line: 284 ]]
                -- upvalues: v71 (ref)
                v76 = 1 - v76;
                return UDim2.new(0, v71 * v76, 0, v71 * v76);
            end), 
            ImageColor3 = v69.Theme.IconEmphasis.Color, 
            ImageTransparency = l_toggleTransition_0:map(function(v77) --[[ Line: 290 ]]
                -- upvalues: v69 (copy)
                return v77 * v69.Theme.IconEmphasis.Transparency;
            end)
        }), 
        v2.createElement(l_ImageSetLabel_0, {
            Name = "Close", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/navigation/close"], 
            Size = l_toggleTransition_0:map(function(v78) --[[ Line: 300 ]]
                -- upvalues: v72 (ref)
                return UDim2.new(0, v72 * v78, 0, v72 * v78);
            end), 
            ImageColor3 = v69.Theme.IconEmphasis.Color, 
            ImageTransparency = l_toggleTransition_0:map(function(v79) --[[ Line: 305 ]]
                -- upvalues: v69 (copy)
                return (1 - v79) * v69.Theme.IconEmphasis.Transparency;
            end)
        }), 
        if not v25.useCameraOn() or v3:isWindowOpen(l_SELFIE_VIEW_ID_0) or v73 then nil else v2.createElement(v25.CameraStatusDot, {
            Name = "CameraStatusDot", 
            Position = UDim2.new(1, -4, 1, -7), 
            ZIndex = 2
        }), 
        v74, 
        if v38 then v2.createElement(v11, {
            visible = v67.visible
        }) else nil
    });
end;
return v3:register({
    initialAvailability = v3.AvailabilitySignal.Pinned, 
    id = "nine_dot", 
    label = "CoreScripts.TopBar.MoreMenu", 
    isActivated = v32 and function() --[[ Line: 332 ]]
        -- upvalues: v65 (copy)
        return v65:get();
    end or nil, 
    components = {
        Icon = function(v80) --[[ Line: 337 ]] --[[ Name: Icon ]]
            -- upvalues: v2 (copy)
            return v2.createElement(HamburgerButton, v80);
        end
    }
});