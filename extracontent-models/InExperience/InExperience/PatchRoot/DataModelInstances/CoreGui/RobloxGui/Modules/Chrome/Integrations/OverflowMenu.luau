local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Service);
local v4 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils);
local v5 = require(l_script_FirstAncestor_0.Integrations.ChromeIntegrationUtils);
local v6 = require(l_script_FirstAncestor_0.Integrations.RespawnUtils);
local l_MappedSignal_0 = v4.MappedSignal;
local l_UnibarStyle_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).UnibarStyle;
local l_SideSheetPlacement_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enums.SideSheetPlacement;
local v10 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local v11 = require(l_script_FirstAncestor_0.Integrations.CommonFtuxTooltip);
local v12 = require(l_script_FirstAncestor_0.Integrations.AvatarSwitcher.AvatarSwitcherFtuxTooltip);
local l_VRService_0 = game:GetService("VRService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v15 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v16 = require(l_RobloxGui_0.Modules.EmotesMenu.EmotesMenuMaster);
local l_FFlagEnableNewBackpack_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack;
local v18 = if l_FFlagEnableNewBackpack_0 then require(l_CorePackages_0.Workspace.Packages.System).Features else nil;
local v19 = if not l_FFlagEnableNewBackpack_0 then require(l_RobloxGui_0.Modules.BackpackScript) else nil;
local v20 = require(l_script_FirstAncestor_0.ChromeShared.Hooks.useMappedSignal);
local l_GetFFlagIsSquadEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled;
local v22 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v22.App.ImageSet.Images;
local l_useStyle_0 = v22.Core.Style.useStyle;
local l_ImageSetLabel_0 = v22.Core.ImageSet.ImageSetLabel;
local v26 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local v28 = require(l_RobloxGui_0.Modules.SelfieView);
local v29 = require(l_script_FirstAncestor_0.Flags.GetFStringConnectTooltipLocalStorageKey);
local v30 = require(l_script_FirstAncestor_0.Flags.GetFIntRobloxConnectFtuxShowDelayMs);
local v31 = require(l_script_FirstAncestor_0.Flags.GetFIntRobloxConnectFtuxDismissDelayMs);
local l_GetFFlagEnableAppChatInExperience_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience;
local v33 = require(l_script_FirstAncestor_0.Flags.GetShouldShowPlatformChatBasedOnPolicy);
local v34 = game:DefineFastFlag("FixIntegrationActivated1", false);
local v35 = game:DefineFastFlag("FixInventoryFilledIcon", false);
local l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 = require(l_script_FirstAncestor_0.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider;
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v38 = game:DefineFastFlag("AppChatEnabledChromeDropdownFtuxTooltip", false);
local v39 = game:DefineFastFlag("AvatarSwitcherFtuxTooltip", false);
local v40 = game:DefineFastInt("UnibarConnectTooltipPriority", 2000);
local v41 = l_GetFFlagEnableAppChatInExperience_0() and v38 and v33();
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local l_InExperienceUIVRIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP;
local l_SELFIE_VIEW_ID_0 = v26.SELFIE_VIEW_ID;
local v45 = l_MappedSignal_0.new(v15:GetSetVisibleChangedEvent().Event, function() --[[ Line: 70 ]]
    -- upvalues: v15 (copy)
    return v15:GetSetVisible();
end);
local v48 = v3:register({
    id = "leaderboard", 
    label = "CoreScripts.TopBar.Leaderboard", 
    sideSheetPlacement = l_SideSheetPlacement_0.Vertical, 
    activated = function(_) --[[ Line: 78 ]] --[[ Name: activated ]]
        -- upvalues: l_isInExperienceUIVREnabled_0 (copy), l_VRService_0 (copy), l_RobloxGui_0 (copy), v15 (copy), l_isSpatial_0 (copy), l_InExperienceUIVRIXP_0 (copy), v5 (copy)
        if not l_isInExperienceUIVREnabled_0 and l_VRService_0.VREnabled then
            require(l_RobloxGui_0.Modules.InGameMenu).openPlayersPage();
            return;
        elseif v15:GetSetVisible() then
            v15:SetVisibility(not v15:GetSetVisible());
            return;
        elseif l_isInExperienceUIVREnabled_0 and l_isSpatial_0() and not l_InExperienceUIVRIXP_0:isMovePanelToCenter() then
            v15:SetVisibility(not v15:GetSetVisible());
            return;
        else
            v5.dismissRobloxMenuAndRun(function() --[[ Line: 89 ]]
                -- upvalues: v15 (ref)
                v15:SetVisibility(not v15:GetSetVisible());
            end);
            return;
        end;
    end, 
    isActivated = function() --[[ Line: 96 ]] --[[ Name: isActivated ]]
        -- upvalues: v45 (copy)
        return v45:get();
    end, 
    components = {
        Icon = function(_) --[[ Line: 100 ]] --[[ Name: Icon ]]
            -- upvalues: v10 (copy), v45 (copy)
            return v10("icons/controls/leaderboardOff", "icons/controls/leaderboardOn", v45);
        end
    }
});
v4.setCoreGuiAvailability(v48, Enum.CoreGuiType.PlayerList);
local v49 = l_MappedSignal_0.new(v16.EmotesMenuToggled.Event, function() --[[ Line: 107 ]]
    -- upvalues: v16 (copy)
    return v16:isOpen();
end);
local v52 = v3:register({
    id = "emotes", 
    label = "CoreScripts.TopBar.Emotes", 
    sideSheetPlacement = l_SideSheetPlacement_0.Vertical, 
    activated = function(_) --[[ Line: 114 ]] --[[ Name: activated ]]
        -- upvalues: v16 (copy), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), l_InExperienceUIVRIXP_0 (copy), v5 (copy)
        if v16:isOpen() then
            v16:close();
            return;
        elseif l_isInExperienceUIVREnabled_0 and l_isSpatial_0() and not l_InExperienceUIVRIXP_0:isMovePanelToCenter() then
            v16:open();
            return;
        else
            v5.dismissRobloxMenuAndRun(function() --[[ Line: 121 ]]
                -- upvalues: v16 (ref)
                v16:open();
            end);
            return;
        end;
    end, 
    isActivated = function() --[[ Line: 127 ]] --[[ Name: isActivated ]]
        -- upvalues: v49 (copy)
        return v49:get();
    end, 
    components = {
        Icon = function(_) --[[ Line: 131 ]] --[[ Name: Icon ]]
            -- upvalues: v10 (copy), v49 (copy)
            return v10("icons/controls/emoteOff", "icons/controls/emoteOn", v49);
        end
    }
});
local v53 = false;
local l_MenuIsVisible_0 = v16.MenuIsVisible;
updateEmoteAvailability = function() --[[ Line: 140 ]] --[[ Name: updateEmoteAvailability ]]
    -- upvalues: v53 (ref), l_MenuIsVisible_0 (ref), v52 (copy)
    if v53 and l_MenuIsVisible_0 then
        v52.availability:available();
        return;
    else
        v52.availability:unavailable();
        return;
    end;
end;
v4.setCoreGuiAvailability(v52, Enum.CoreGuiType.EmotesMenu, function(v55) --[[ Line: 148 ]]
    -- upvalues: v53 (ref)
    v53 = v55;
    updateEmoteAvailability();
end);
v16.MenuVisibilityChanged.Event:Connect(function() --[[ Line: 153 ]]
    -- upvalues: l_MenuIsVisible_0 (ref), v16 (copy)
    l_MenuIsVisible_0 = v16.MenuIsVisible;
    updateEmoteAvailability();
end);
local v56 = if not l_FFlagEnableNewBackpack_0 then l_MappedSignal_0.new(v19.StateChanged.Event, function() --[[ Line: 159 ]]
    -- upvalues: v19 (copy)
    return v19.IsOpen;
end) else nil;
local v59 = v3:register({
    id = "backpack", 
    label = "CoreScripts.TopBar.Inventory", 
    sideSheetPlacement = l_SideSheetPlacement_0.Vertical, 
    activated = function(_) --[[ Line: 167 ]] --[[ Name: activated ]]
        -- upvalues: l_FFlagEnableNewBackpack_0 (copy), v18 (copy), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), l_InExperienceUIVRIXP_0 (copy), v5 (copy), v19 (copy)
        if l_FFlagEnableNewBackpack_0 then
            if v18.getVisibility(v18.FeatureName.Backpack) then
                v18.toggleVisibility(v18.FeatureName.Backpack);
                return;
            elseif l_isInExperienceUIVREnabled_0 and l_isSpatial_0() and not l_InExperienceUIVRIXP_0:isMovePanelToCenter() then
                v18.toggleVisibility(v18.FeatureName.Backpack);
                return;
            else
                v5.dismissRobloxMenuAndRun(function() --[[ Line: 175 ]]
                    -- upvalues: v18 (ref)
                    v18.toggleVisibility(v18.FeatureName.Backpack);
                end);
                return;
            end;
        elseif v19.IsOpen then
            v19:OpenClose();
            return;
        elseif l_isInExperienceUIVREnabled_0 and l_isSpatial_0() and not l_InExperienceUIVRIXP_0:isMovePanelToCenter() then
            v19:OpenClose();
            return;
        else
            v5.dismissRobloxMenuAndRun(function() --[[ Line: 187 ]]
                -- upvalues: v19 (ref)
                v19:OpenClose();
            end);
            return;
        end;
    end, 
    isActivated = function() --[[ Line: 194 ]] --[[ Name: isActivated ]]
        -- upvalues: l_FFlagEnableNewBackpack_0 (copy), v18 (copy), v56 (copy)
        if l_FFlagEnableNewBackpack_0 then
            return v18.getVisibility(v18.FeatureName.Backpack);
        else
            return v56:get();
        end;
    end, 
    components = {
        Icon = function(_) --[[ Line: 201 ]] --[[ Name: Icon ]]
            -- upvalues: v10 (copy), v35 (copy), v56 (copy)
            return v10("icons/menu/inventoryOff", v35 and "icons/menu/inventoryOn" or "icons/menu/inventory", v56);
        end
    }
});
v4.setCoreGuiAvailability(v59, Enum.CoreGuiType.Backpack);
local v62 = v3:register({
    id = "respawn", 
    label = "CoreScripts.InGameMenu.QuickActions.Respawn", 
    sideSheetPlacement = l_SideSheetPlacement_0.Vertical, 
    activated = function(_) --[[ Line: 216 ]] --[[ Name: activated ]]
        -- upvalues: v6 (copy)
        v6.respawnPage();
    end, 
    isActivated = function() --[[ Line: 219 ]] --[[ Name: isActivated ]]
        -- upvalues: v6 (copy)
        return v6.respawnPageOpenSignal:get();
    end, 
    components = {
        Icon = function(_) --[[ Line: 223 ]] --[[ Name: Icon ]]
            -- upvalues: v10 (copy)
            return v10("icons/actions/respawn");
        end
    }
});
updateRespawn = function(v63) --[[ Line: 229 ]] --[[ Name: updateRespawn ]]
    -- upvalues: v62 (copy)
    if v63 then
        v62.availability:available();
        return;
    else
        v62.availability:unavailable();
        return;
    end;
end;
task.defer(function() --[[ Line: 237 ]]
    -- upvalues: l_RobloxGui_0 (copy)
    local v64 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
    v64.RespawnBehaviourChangedEvent.Event:connect(updateRespawn);
    updateRespawn(v64:GetRespawnBehaviour());
end);
local v65 = v3:currentSubMenu();
local v66 = l_MappedSignal_0.new(v65:signal(), function() --[[ Line: 244 ]]
    -- upvalues: v65 (copy)
    return v65:get() == "nine_dot";
end);
if v3:orderAlignment():get() == Enum.HorizontalAlignment.Right then
    v66:connect(function(v67) --[[ Line: 249 ]]
        -- upvalues: v15 (copy)
        v15:SetMinimized(v67);
    end);
end;
HamburgerButton = function(v68) --[[ Line: 254 ]] --[[ Name: HamburgerButton ]]
    -- upvalues: l_useStyle_0 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v26 (copy), v66 (copy), v20 (copy), v41 (copy), v11 (copy), v40 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v29 (copy), v30 (copy), v31 (copy), v2 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v28 (copy), v3 (copy), l_SELFIE_VIEW_ID_0 (copy), v39 (copy), v12 (copy)
    local l_toggleTransition_0 = v68.toggleTransition;
    local v70 = l_useStyle_0();
    local v71 = nil;
    local v72 = nil;
    local v73 = nil;
    if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then
        v71 = l_UnibarStyle_0.use();
        v72 = v71.ICON_SIZE;
        v73 = v71.MEDIUM_ICON_SIZE;
    else
        v72 = v26.ICON_SIZE;
        v73 = v26.MEDIUM_ICON_SIZE;
    end;
    local v74 = v66 and v20(v66) or false;
    local v75 = if v41 then v11({
        id = "CONNECT_TOOLTIP", 
        priority = v40, 
        isIconVisible = v68.visible, 
        headerKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "CoreScripts.FTUX.Heading.CheckOutRobloxParty" or "CoreScripts.FTUX.Heading.CheckOutRobloxConnect", 
        bodyKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "CoreScripts.FTUX.Label.PartyWithYourFriendsAnytime" or "CoreScripts.FTUX.Label.ChatWithYourFriendsAnytime", 
        localStorageKey = v29(), 
        showDelay = v30(), 
        dismissDelay = v31()
    }) else nil;
    return v2.createElement("Frame", {
        Size = UDim2.new(0, v72, 0, v72), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v70.Theme.BackgroundOnHover.Color, 
        BackgroundTransparency = l_toggleTransition_0:map(function(v76) --[[ Line: 295 ]]
            -- upvalues: v70 (copy)
            return 1 - (1 - v70.Theme.BackgroundOnHover.Transparency) * v76;
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
            Size = l_toggleTransition_0:map(function(v77) --[[ Line: 309 ]]
                -- upvalues: v72 (ref)
                v77 = 1 - v77;
                return UDim2.new(0, v72 * v77, 0, v72 * v77);
            end), 
            ImageColor3 = v70.Theme.IconEmphasis.Color, 
            ImageTransparency = l_toggleTransition_0:map(function(v78) --[[ Line: 315 ]]
                -- upvalues: v70 (copy)
                return v78 * v70.Theme.IconEmphasis.Transparency;
            end)
        }), 
        v2.createElement(l_ImageSetLabel_0, {
            Name = "Close", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/navigation/close"], 
            Size = l_toggleTransition_0:map(function(v79) --[[ Line: 325 ]]
                -- upvalues: v73 (ref)
                return UDim2.new(0, v73 * v79, 0, v73 * v79);
            end), 
            ImageColor3 = v70.Theme.IconEmphasis.Color, 
            ImageTransparency = l_toggleTransition_0:map(function(v80) --[[ Line: 330 ]]
                -- upvalues: v70 (copy)
                return (1 - v80) * v70.Theme.IconEmphasis.Transparency;
            end)
        }), 
        if not v28.useCameraOn() or v3:isWindowOpen(l_SELFIE_VIEW_ID_0) or v74 then nil else v2.createElement(v28.CameraStatusDot, {
            Name = "CameraStatusDot", 
            Position = UDim2.new(1, -4, 1, -7), 
            ZIndex = 2
        }), 
        v75, 
        if v39 then v2.createElement(v12, {
            visible = v68.visible
        }) else nil
    });
end;
return v3:register({
    initialAvailability = v3.AvailabilitySignal.Pinned, 
    id = "nine_dot", 
    label = "CoreScripts.TopBar.MoreMenu", 
    sideSheetPlacement = l_SideSheetPlacement_0.None, 
    isActivated = v34 and function() --[[ Line: 358 ]]
        -- upvalues: v66 (copy)
        return v66:get();
    end or nil, 
    components = {
        Icon = function(v81) --[[ Line: 363 ]] --[[ Name: Icon ]]
            -- upvalues: v2 (copy)
            return v2.createElement(HamburgerButton, v81);
        end
    }
});