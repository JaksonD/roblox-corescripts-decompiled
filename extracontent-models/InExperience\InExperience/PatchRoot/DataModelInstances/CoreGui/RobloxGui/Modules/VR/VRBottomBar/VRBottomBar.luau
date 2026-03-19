local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local _ = game:GetService("TelemetryService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_VRService_0 = game:GetService("VRService");
local v9 = require(l_CorePackages_0.Packages.Cryo);
local v10 = require(l_CorePackages_0.Packages.Otter);
local v11 = require(l_CorePackages_0.Packages.React);
local v12 = require(l_CorePackages_0.Packages.Roact);
local v13 = require(l_CorePackages_0.Packages.RoactRodux);
local v14 = require(l_CorePackages_0.Packages.UIBlox);
local l_BaseMenu_0 = v14.App.Menu.BaseMenu;
local l_SystemBar_0 = v14.App.Navigation.SystemBar;
local l_Placement_0 = v14.App.Navigation.Enum.Placement;
local l_Panel3D_0 = v14.Core.VR.Panel3D;
local l_Constants_0 = v14.Core.VR.Constants;
local l_ImageSetLabel_0 = v14.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v14.Core.Style.withStyle;
local l_Images_0 = v14.App.ImageSet.Images;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v24 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_VRHub_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
local l_VRUtil_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRUtil;
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_FFlagEnableUIManagerPackgify_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUIManagerPackgify;
local l_GetFFlagEnableVrVoiceParity_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableVrVoiceParity;
local l_GetFFlagEnableVrVoiceConnectDisconnect_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableVrVoiceConnectDisconnect;
local v32 = game:DefineFastFlag("EnableJoinVoiceVrTelemetry", false);
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
if l_FFlagEnableUIManagerPackgify_0 then
    local v37 = require(l_CorePackages_0.Workspace.Packages.VrSpatialUi);
    v36 = v37.Constants;
    v33 = v36.PanelType;
    v34 = v37.registerRoactPanel;
    v35 = v37.UIManager;
else
    local l_UIManager_0 = l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("UIManager");
    v33 = require(l_UIManager_0.Constants).PanelType;
    v34 = require(l_UIManager_0.registerRoactPanel);
    v35 = require(l_UIManager_0.UIManager);
    v36 = require(l_UIManager_0.Constants);
end;
local v39 = require(l_RobloxGui_0.Modules.InGameMenuConstants);
local l_GameSettings_0 = UserSettings().GameSettings;
local v41 = require(l_RobloxGui_0.Modules.InGameMenuInit);
local v42 = require(l_RobloxGui_0.Modules.ChatSelector);
local v43 = v12.PureComponent:extend("TopBarApp");
local v44 = require(script.Parent.VRBarSeparator);
local v45 = require(script.Parent.VRBarVoiceIcon);
local v46 = require(script.Parent.VRBottomBarAnalytics);
local v47 = require(script.Parent.VRBottomBarType);
local v48 = require(l_RobloxGui_0.Modules.EmotesMenu.EmotesMenuMaster);
local v49 = require(l_RobloxGui_0.Modules.BackpackScript);
local v50 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableVRBottomBarWorksBehindObjects");
local v53 = require(l_RobloxGui_0.Modules.Flags.FFlagVRBottomBarDebugPositionConfig);
local v54 = require(l_RobloxGui_0.Modules.Flags.FIntVRBottomBarPositionOffsetVerticalNumber);
local v55 = require(l_RobloxGui_0.Modules.Flags.FIntVRBottomBarPositionOffsetDepthNumber);
local v56 = require(l_RobloxGui_0.Modules.Flags.FFlagVRBottomBarHighlightedLeaveGameIcon);
local v57 = require(l_RobloxGui_0.Modules.VR.IsSpatialRobloxGuiEnabled);
local l_SplashScreenManager_0 = require(l_CorePackages_0.Workspace.Packages.SplashScreenManager).SplashScreenManager;
local v59 = (require(l_RobloxGui_0.Modules.Flags.GetFIntVRScaleGuiDistance) or 100)() * 0.01;
local v60 = game:DefineFastFlag("FixVRBottomBarAnalytics", false);
local function _(v61) --[[ Line: 102 ]] --[[ Name: safeRequire ]]
    local l_status_0, l_result_0 = pcall(require, v61);
    if l_status_0 then
        return l_result_0;
    else
        warn("Failure to Start CoreScript module " .. v61.Name .. ".\n" .. l_result_0);
        return;
    end;
end;
local v65 = {
    Y = v54 / 100, 
    Z = v55 / 100
};
local _ = 0.2 + v65.Z / 10;
local v67 = {
    Default = {
        dampingRatio = 1, 
        frequency = 4.5
    }, 
    Slower = {
        dampingRatio = 1, 
        frequency = 0.66
    }
};
local v69 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_menu.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_menu.png", 
    onActivated = function() --[[ Line: 137 ]] --[[ Name: onActivated ]]
        -- upvalues: l_VRHub_0 (copy), v41 (copy), v39 (copy), v60 (copy), v46 (copy), v47 (copy), l_RbxAnalyticsService_0 (copy)
        l_VRHub_0:SetShowTopBar(true);
        if not v41.getOpen() then
            v41.openInGameMenu(v39.MainPagePageKey);
            l_VRHub_0:SetShowMoreMenu(false);
        else
            v41.closeInGameMenu();
        end;
        if v60 then
            local v68 = v41.getOpen();
            v46.sendEventToTelemetryV2({
                integrationId = v47.ButtomName.MainMenu, 
                isToggleOn = v68, 
                source = v47.Source.VRBottomBar
            });
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-MainMenu");
    end
};
local v71 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_maximize.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_minimize.png", 
    onActivated = function() --[[ Line: 161 ]] --[[ Name: onActivated ]]
        -- upvalues: l_VRHub_0 (copy), v41 (copy), v60 (copy), v46 (copy), v47 (copy), l_RbxAnalyticsService_0 (copy)
        if not l_VRHub_0.ShowTopBar then
            l_VRHub_0:SetShowTopBar(false);
            l_VRHub_0:SetShowTopBar(true);
        else
            l_VRHub_0:SetShowTopBar(false);
            v41.closeInGameMenu();
        end;
        if v60 then
            local l_ShowTopBar_0 = l_VRHub_0.ShowTopBar;
            v46.sendEventToTelemetryV2({
                integrationId = v47.ButtomName.ToggleGui, 
                isToggleOn = l_ShowTopBar_0, 
                source = v47.Source.VRBottomBar
            });
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-ToggleGui");
    end
};
local v73 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon__backpack.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon__backpack.png", 
    onActivated = function() --[[ Line: 186 ]] --[[ Name: onActivated ]]
        -- upvalues: l_VRHub_0 (copy), v49 (copy), v60 (copy), v46 (copy), v47 (copy), l_RbxAnalyticsService_0 (copy)
        if not l_VRHub_0.ShowTopBar then
            l_VRHub_0:SetShowTopBar(true);
            if not v49.IsOpen then
                v49.OpenClose();
            end;
        else
            v49.OpenClose();
        end;
        if v60 then
            local l_IsOpen_0 = v49.IsOpen;
            v46.sendEventToTelemetryV2({
                integrationId = v47.ButtomName.Inventory, 
                isToggleOn = l_IsOpen_0, 
                source = v47.Source.MoreSubMenu
            });
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-Backpack");
    end
};
local v75 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_leaderboard.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_leaderboard.png", 
    onActivated = function() --[[ Line: 211 ]] --[[ Name: onActivated ]]
        -- upvalues: l_VRHub_0 (copy), v50 (copy), v60 (copy), v46 (copy), v47 (copy), l_RbxAnalyticsService_0 (copy)
        if not l_VRHub_0.ShowTopBar then
            l_VRHub_0:SetShowTopBar(true);
            if not v50:GetSetVisible() then
                v50:SetVisibility(true);
            end;
        else
            v50:SetVisibility(not v50:GetSetVisible());
        end;
        if v60 then
            local l_v50_SetVisible_0 = v50:GetSetVisible();
            v46.sendEventToTelemetryV2({
                integrationId = v47.ButtomName.Leaderboard, 
                isToggleOn = l_v50_SetVisible_0, 
                source = v47.Source.MoreSubMenu
            });
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-PlayerList");
    end
};
local v77 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_emote.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_emote.png", 
    onActivated = function() --[[ Line: 237 ]] --[[ Name: onActivated ]]
        -- upvalues: l_VRHub_0 (copy), v48 (copy), v60 (copy), v46 (copy), v47 (copy), l_RbxAnalyticsService_0 (copy)
        if not l_VRHub_0.ShowTopBar then
            l_VRHub_0:SetShowTopBar(true);
            if not v48:isOpen() then
                v48:open();
            end;
        elseif v48:isOpen() then
            v48:close();
        else
            v48:open();
        end;
        if v60 then
            local v76 = v48:isOpen();
            v46.sendEventToTelemetryV2({
                integrationId = v47.ButtomName.Emotes, 
                isToggleOn = v76, 
                source = v47.Source.MoreSubMenu
            });
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-Emotes");
    end
};
local v79 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_chat.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_chat.png", 
    onActivated = function() --[[ Line: 267 ]] --[[ Name: onActivated ]]
        -- upvalues: l_VRHub_0 (copy), v42 (copy), l_GameSettings_0 (copy), v60 (copy), v46 (copy), v47 (copy), l_RbxAnalyticsService_0 (copy)
        if not l_VRHub_0.ShowTopBar then
            l_VRHub_0:SetShowTopBar(true);
            if not v42:GetVisibility() then
                v42:ToggleVisibility();
                l_GameSettings_0.ChatVisible = v42:GetVisibility();
            end;
        else
            v42:ToggleVisibility();
            l_GameSettings_0.ChatVisible = v42:GetVisibility();
        end;
        if v60 then
            local l_ChatVisible_0 = l_GameSettings_0.ChatVisible;
            v46.sendEventToTelemetryV2({
                integrationId = v47.ButtomName.Chat, 
                isToggleOn = l_ChatVisible_0, 
                source = v47.Source.VRBottomBar
            });
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-Chat");
    end
};
local v81 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_safety_on.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_safety_on.png", 
    onActivated = function() --[[ Line: 295 ]] --[[ Name: onActivated ]]
        -- upvalues: l_VRHub_0 (copy), v60 (copy), v46 (copy), v47 (copy), l_RbxAnalyticsService_0 (copy)
        l_VRHub_0:ToggleSafetyBubble();
        if v60 then
            local l_enabled_0 = l_VRHub_0.SafetyBubble.enabled;
            v46.sendEventToTelemetryV2({
                integrationId = v47.ButtomName.Safety, 
                isToggleOn = l_enabled_0, 
                source = v47.Source.VRBottomBar
            });
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-Safety");
    end
};
local v83 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_safety_off.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_safety_off.png", 
    onActivated = function() --[[ Line: 313 ]] --[[ Name: onActivated ]]
        -- upvalues: l_VRHub_0 (copy), v60 (copy), v46 (copy), v47 (copy), l_RbxAnalyticsService_0 (copy)
        l_VRHub_0:ToggleSafetyBubble();
        if v60 then
            local l_enabled_1 = l_VRHub_0.SafetyBubble.enabled;
            v46.sendEventToTelemetryV2({
                integrationId = v47.ButtomName.Safety, 
                isToggleOn = l_enabled_1, 
                source = v47.Source.VRBottomBar
            });
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-Safety");
    end
};
local v85 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_leave.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_leave.png", 
    onActivated = function() --[[ Line: 331 ]] --[[ Name: onActivated ]]
        -- upvalues: l_VRHub_0 (copy), v41 (copy), v39 (copy), v60 (copy), v46 (copy), v47 (copy), l_RbxAnalyticsService_0 (copy)
        l_VRHub_0:SetShowTopBar(true);
        l_VRHub_0:SetShowMoreMenu(false);
        if v41 then
            if not v41.getOpen() then
                v41.openInGameMenu(v39.MainPagePageKey);
            end;
            v41.openGameLeavePage();
        end;
        if v60 then
            local v84 = v41.getOpen();
            v46.sendEventToTelemetryV2({
                integrationId = v47.ButtomName.Leave, 
                isToggleOn = v84, 
                source = v47.Source.VRBottomBar
            });
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-LeaveGame");
    end
};
local v86 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_leave_highlighted.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_leave_highlighted.png", 
    onActivated = v85.onActivated
};
local v88 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_more.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_more.png", 
    onActivated = function() --[[ Line: 363 ]] --[[ Name: onActivated ]]
        -- upvalues: l_VRHub_0 (copy), v60 (copy), v46 (copy), v47 (copy), l_RbxAnalyticsService_0 (copy)
        l_VRHub_0:SetShowTopBar(true);
        l_VRHub_0:SetShowMoreMenu(not l_VRHub_0.ShowMoreMenu);
        if v60 then
            local l_ShowMoreMenu_0 = l_VRHub_0.ShowMoreMenu;
            v46.sendEventToTelemetryV2({
                integrationId = v47.ButtomName.MoreSubMenu, 
                isToggleOn = l_ShowMoreMenu_0, 
                source = v47.Source.VRBottomBar
            });
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-More");
    end
};
local v89 = {
    iconComponent = v44, 
    itemSize = UDim2.new(0, 28, 0, 44)
};
local v90 = {
    icon = "rbxasset://textures/ui/MenuBar/icon_emote.png", 
    text = v24:FormatByKey("CoreScripts.TopBar.Emotes"), 
    onActivated = function() --[[ Line: 387 ]] --[[ Name: onActivated ]]
        -- upvalues: v77 (copy), l_RbxAnalyticsService_0 (copy)
        v77.onActivated();
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-MoreMenu-Emotes");
    end
};
local v91 = {
    icon = "rbxasset://textures/ui/MenuBar/icon_leaderboard.png", 
    text = v24:FormatByKey("CoreScripts.TopBar.Leaderboard"), 
    onActivated = function() --[[ Line: 396 ]] --[[ Name: onActivated ]]
        -- upvalues: v75 (copy), l_RbxAnalyticsService_0 (copy)
        v75.onActivated();
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-MoreMenu-PlayerList");
    end
};
local v92 = {
    icon = "rbxasset://textures/ui/MenuBar/icon__backpack.png", 
    text = v24:FormatByKey("CoreScripts.TopBar.Inventory"), 
    onActivated = function() --[[ Line: 405 ]] --[[ Name: onActivated ]]
        -- upvalues: v73 (copy), l_RbxAnalyticsService_0 (copy)
        v73.onActivated();
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-MoreMenu-Backpack");
    end
};
local v94 = {
    iconOn = l_Images_0["icons/controls/publicAudioJoin"], 
    iconOff = l_Images_0["icons/controls/publicAudioJoin"], 
    text = "Join Voice", 
    onActivated = function() --[[ Line: 415 ]] --[[ Name: onActivated ]]
        -- upvalues: l_default_0 (copy), v32 (copy), v46 (copy), v47 (copy)
        l_default_0:JoinVoice();
        if v32 then
            local v93 = l_default_0:ShouldShowJoinVoice();
            v46.sendEventToTelemetryV2({
                integrationId = v47.ButtomName.JoinVoice, 
                isToggleOn = v93, 
                source = v47.Source.VRBottomBar
            });
        end;
    end
};
local function _(v95) --[[ Line: 429 ]] --[[ Name: roundOffset ]]
    return v95 >= 0 and math.floor(v95 * 10 + 0.5) / 10 or math.ceil(v95 * 10 - 0.5) / 10;
end;
v43.init = function(v97) --[[ Line: 434 ]] --[[ Name: init ]]
    -- upvalues: v65 (copy), v59 (copy), l_VRService_0 (copy), l_RobloxGui_0 (copy), v12 (copy), l_SplashScreenManager_0 (copy), v11 (copy), v45 (copy), v9 (copy), l_Players_0 (copy), v60 (copy), v46 (copy), v47 (copy), l_RbxAnalyticsService_0 (copy), v69 (copy), v89 (copy), v71 (copy), v85 (copy), v57 (copy), l_VRHub_0 (copy), l_VRUtil_0 (copy), v10 (copy), v67 (copy), v53 (copy)
    local v98 = false;
    local v99 = {
        yOffset = v65.Y * v59, 
        zOffset = v65.Z * v59, 
        moreMenuOpen = false, 
        vrMenuOpen = true, 
        lookAway = false
    };
    local v100;
    if l_VRService_0.VREnabled then
        local l_UserGui_0 = l_RobloxGui_0.Modules.VR.UserGui;
        local l_status_1, l_result_1 = pcall(require, l_UserGui_0);
        if l_status_1 then
            v100 = l_result_1;
        else
            warn("Failure to Start CoreScript module " .. l_UserGui_0.Name .. ".\n" .. l_result_1);
            v100 = nil;
        end;
        v98 = v100;
    end;
    if not v98 then
        v100 = v12.None;
    end;
    v98 = false;
    v99.userGui = v100;
    v99.hidden = not l_SplashScreenManager_0.isFPSAtTarget();
    v97:setState(v99);
    v97.backpackHasItems = false;
    v97.emotesLoaded = false;
    v97.onTargetFPSSTateChange = function(v104) --[[ Line: 448 ]]
        -- upvalues: v97 (copy)
        v97:setState({
            hidden = not v104
        });
    end;
    l_SplashScreenManager_0.addStatusChangeListener(v97.onTargetFPSSTateChange);
    v97.getVoiceIcon = function() --[[ Line: 453 ]]
        -- upvalues: v11 (ref), v45 (ref), v9 (ref), l_Players_0 (ref), v97 (copy), v60 (ref), v46 (ref), v47 (ref), l_RbxAnalyticsService_0 (ref)
        return {
            iconImageComponent = function(v105) --[[ Line: 455 ]] --[[ Name: iconImageComponent ]]
                -- upvalues: v11 (ref), v45 (ref), v9 (ref), l_Players_0 (ref)
                return v11.createElement(v45, v9.Dictionary.join(v105, {
                    userId = tostring(l_Players_0.LocalPlayer.UserId), 
                    iconStyle = "MicLight"
                }));
            end, 
            onActivated = function() --[[ Line: 464 ]] --[[ Name: onActivated ]]
                -- upvalues: v97 (ref), v60 (ref), v46 (ref), v47 (ref), l_RbxAnalyticsService_0 (ref)
                if v97.props.voiceState == Enum.VoiceChatState.Failed then
                    v97.props.voiceChatServiceManager:RejoinPreviousChannel();
                else
                    v97.props.voiceChatServiceManager:ToggleMic("VRBottomBar");
                end;
                if v60 then
                    local v106 = false;
                    if v97.props.voiceState == Enum.VoiceChatState.Joined then
                        v106 = true;
                    end;
                    v46.sendEventToTelemetryV2({
                        integrationId = v47.ButtomName.Voice, 
                        isToggleOn = v106, 
                        source = v47.Source.VRBottomBar
                    });
                end;
                l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-Voice");
            end
        };
    end;
    v97.getDebugYOffsetUp = function() --[[ Line: 489 ]]
        -- upvalues: v97 (copy)
        return {
            iconOn = "rbxasset://textures/ui/MenuBar/arrow_up.png", 
            iconOff = "rbxasset://textures/ui/MenuBar/arrow_up.png", 
            onActivated = function() --[[ Line: 493 ]] --[[ Name: onActivated ]]
                -- upvalues: v97 (ref)
                v97:setState({
                    yOffset = v97.state.yOffset + 0.1
                });
            end
        };
    end;
    v97.getDebugYOffsetDown = function() --[[ Line: 502 ]]
        -- upvalues: v97 (copy)
        return {
            iconOn = "rbxasset://textures/ui/MenuBar/arrow_down.png", 
            iconOff = "rbxasset://textures/ui/MenuBar/arrow_down.png", 
            onActivated = function() --[[ Line: 506 ]] --[[ Name: onActivated ]]
                -- upvalues: v97 (ref)
                v97:setState({
                    yOffset = v97.state.yOffset - 0.1
                });
            end
        };
    end;
    v97.getDebugZOffsetUp = function() --[[ Line: 515 ]]
        -- upvalues: v97 (copy)
        return {
            iconOn = "rbxasset://textures/ui/MenuBar/arrow_left.png", 
            iconOff = "rbxasset://textures/ui/MenuBar/arrow_left.png", 
            onActivated = function() --[[ Line: 519 ]] --[[ Name: onActivated ]]
                -- upvalues: v97 (ref)
                v97:setState({
                    zOffset = v97.state.zOffset + 0.1
                });
            end
        };
    end;
    v97.getDebugZOffsetDown = function() --[[ Line: 528 ]]
        -- upvalues: v97 (copy)
        return {
            iconOn = "rbxasset://textures/ui/MenuBar/arrow_right.png", 
            iconOff = "rbxasset://textures/ui/MenuBar/arrow_right.png", 
            onActivated = function() --[[ Line: 532 ]] --[[ Name: onActivated ]]
                -- upvalues: v97 (ref)
                v97:setState({
                    zOffset = v97.state.zOffset - 0.1
                });
            end
        };
    end;
    v97.getDebugTextLabel = function() --[[ Line: 541 ]]
        -- upvalues: v97 (copy), v12 (ref)
        return {
            iconComponent = function(v107) --[[ Line: 543 ]] --[[ Name: iconComponent ]]
                -- upvalues: v97 (ref), v12 (ref)
                local l_yOffset_0 = v97.state.yOffset;
                local v109 = l_yOffset_0 >= 0 and math.floor(l_yOffset_0 * 10 + 0.5) / 10 or math.ceil(l_yOffset_0 * 10 - 0.5) / 10;
                local l_zOffset_0 = v97.state.zOffset;
                l_zOffset_0 = "Y " .. v109 .. ", Z " .. (l_zOffset_0 >= 0 and math.floor(l_zOffset_0 * 10 + 0.5) / 10 or math.ceil(l_zOffset_0 * 10 - 0.5) / 10);
                return v12.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Text = l_zOffset_0, 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextWrapped = true, 
                    TextScaled = true, 
                    Size = UDim2.fromScale(1, 1), 
                    [v12.Children] = v107[v12.Children]
                });
            end, 
            itemSize = UDim2.new(0, 44, 0, 44)
        };
    end;
    v97:setState({
        itemList = {
            v69, 
            v89, 
            v71, 
            v89, 
            v85
        }, 
        moreItemList = {}
    });
    v97.onShowTopBarChanged = function() --[[ Line: 566 ]]
        -- upvalues: v57 (ref), l_VRHub_0 (ref), v97 (copy)
        if v57 then
            return;
        else
            if not l_VRHub_0.ShowTopBar then
                l_VRHub_0:SetShowMoreMenu(false);
            end;
            v97:setState({
                vrMenuOpen = l_VRHub_0.ShowTopBar
            });
            return;
        end;
    end;
    v97.onShowMoreMenuChanged = function() --[[ Line: 578 ]]
        -- upvalues: v97 (copy), l_VRHub_0 (ref)
        v97:setState({
            moreMenuOpen = l_VRHub_0.ShowMoreMenu
        });
    end;
    v97.updateItemListState = function() --[[ Line: 584 ]]
        -- upvalues: v97 (copy)
        local v111, v112 = v97:updateItems();
        v97:setState({
            itemList = v111, 
            moreItemList = v112
        });
    end;
    v97.onBackpackItemAdded = function() --[[ Line: 592 ]]
        -- upvalues: v97 (copy)
        if not v97.backpackHasItems then
            v97.backpackHasItems = true;
            v97.updateItemListState();
        end;
    end;
    v97.onBackpackEmpty = function() --[[ Line: 599 ]]
        -- upvalues: v97 (copy)
        if v97.backpackHasItems then
            v97.backpackHasItems = false;
            v97.updateItemListState();
        end;
    end;
    v97.onEmotesLoaded = function(v113) --[[ Line: 606 ]]
        -- upvalues: v97 (copy)
        if v113 ~= v97.emotesLoaded then
            v97.emotesLoaded = v113;
            v97.updateItemListState();
        end;
    end;
    v97.onVREnabledChanged = function() --[[ Line: 613 ]]
        -- upvalues: v97 (copy), l_VRService_0 (ref), l_RobloxGui_0 (ref), v12 (ref)
        local v114 = false;
        local l_v97_0 = v97;
        local v116 = {};
        local v117;
        if l_VRService_0.VREnabled then
            local l_UserGui_1 = l_RobloxGui_0.Modules.VR.UserGui;
            local l_status_2, l_result_2 = pcall(require, l_UserGui_1);
            if l_status_2 then
                v117 = l_result_2;
            else
                warn("Failure to Start CoreScript module " .. l_UserGui_1.Name .. ".\n" .. l_result_2);
                v117 = nil;
            end;
            v114 = v117;
        end;
        if not v114 then
            v117 = v12.None;
        end;
        v114 = false;
        v116.userGui = v117;
        l_v97_0:setState(v116);
    end;
    v97.onRenderStepped = function() --[[ Line: 619 ]]
        -- upvalues: l_VRUtil_0 (ref), v97 (copy)
        local v121 = l_VRUtil_0.GetUserCFrameWorldSpace(Enum.UserCFrame.Head).LookVector.Y > -0.2;
        if v97.state.lookAway ~= v121 then
            v97:setState({
                lookAway = v121
            });
        end;
    end;
    local v122, v123 = v12.createBinding(0);
    v97.fadeTransparency = v122;
    v97.setFadeTransparency = v123;
    v97.fadeTransparencyMotor = v10.createSingleMotor(v97.fadeTransparency:getValue());
    v97.fadeTransparencyMotor:onStep(v97.setFadeTransparency);
    v97.fadeTransparencyMotor:setGoal(v10.spring(0, v67.Default));
    v97.getAlignedPanelPart = function() --[[ Line: 634 ]]
        -- upvalues: v97 (copy)
        local v124 = if v97.state.userGui then v97.state.userGui:getPanel() else nil;
        local v125 = v124 and v124:GetPart();
        if v125 and (v124:IsPositionLockedType() or v124:IsUIManagerManagedType()) and (v124:IsVisible() or v124.alwaysUpdatePosition) then
            return v125;
        else
            return;
        end;
    end;
    v97.bottomBarPanelOffsetCallback = function(v126) --[[ Line: 645 ]]
        -- upvalues: v97 (copy), l_VRUtil_0 (ref)
        local l_finalPosition_0 = v126.finalPosition;
        local l_cameraHeadScale_0 = v126.cameraHeadScale;
        local v129 = v97.getAlignedPanelPart();
        if v129 then
            local l_yOffset_1 = v97.state.yOffset;
            local l_zOffset_1 = v97.state.zOffset;
            local v132 = l_VRUtil_0.GetUserCFrameWorldSpace(Enum.UserCFrame.Head);
            local v133 = CFrame.new(0, 0, l_zOffset_1 * l_cameraHeadScale_0 - v129.Size.Z * 0.5);
            local v134 = v129.CFrame:ToWorldSpace(v133);
            l_finalPosition_0 = Vector3.new(v134.Position.X, v132.Position.Y + l_yOffset_1 * l_cameraHeadScale_0, v134.Position.Z);
        end;
        return l_finalPosition_0;
    end;
    v97.moreMenuPanelOffsetCallback = function(v135) --[[ Line: 668 ]]
        -- upvalues: v97 (copy), l_VRUtil_0 (ref), v59 (ref), v53 (ref)
        local l_finalPosition_1 = v135.finalPosition;
        local l_cameraHeadScale_1 = v135.cameraHeadScale;
        local v138 = v97.getAlignedPanelPart();
        if v138 then
            local v139 = v97.bottomBarPanelOffsetCallback(v135);
            local v140 = l_VRUtil_0.GetUserCFrameWorldSpace(Enum.UserCFrame.Head);
            local v141 = CFrame.new(v139, v140.Position);
            local v142 = (0.2 + v97.state.zOffset / 10) * v59;
            local v143 = v53 and (#v97.state.itemList - 3) / 2 * v142 or (#v97.state.itemList - 2.5) / 2 * v142;
            local v144 = v141:ToWorldSpace((CFrame.new(-v143 * l_cameraHeadScale_1, v142 / 2 * l_cameraHeadScale_1, -0.025)));
            l_finalPosition_1 = (CFrame.new(v144.Position) * v138.CFrame.Rotation):ToWorldSpace((CFrame.new(0, #v97.state.moreItemList * v142 / 2 * l_cameraHeadScale_1, 0.025))).Position;
        end;
        return l_finalPosition_1;
    end;
    v97.moreMenuPanelTiltCallback = function(v145) --[[ Line: 697 ]]
        -- upvalues: v97 (copy)
        local l_panelCFrame_0 = v145.panelCFrame;
        local v147 = v97.getAlignedPanelPart();
        if v147 then
            l_panelCFrame_0 = CFrame.new(l_panelCFrame_0.Position) * v147.CFrame.Rotation;
        end;
        return l_panelCFrame_0;
    end;
end;
v43.didMount = function(v148) --[[ Line: 708 ]] --[[ Name: didMount ]]
    -- upvalues: v48 (copy), v49 (copy)
    v148.emotesLoaded = v48:isEmotesLoaded();
    v148.backpackHasItems = v49.IsInventoryEmpty();
    v148.updateItemListState();
end;
v43.updateItems = function(v149) --[[ Line: 715 ]] --[[ Name: updateItems ]]
    -- upvalues: l_StarterGui_0 (copy), v57 (copy), v69 (copy), v89 (copy), v53 (copy), v71 (copy), l_StarterPlayer_0 (copy), v79 (copy), l_GetFFlagEnableVrVoiceConnectDisconnect_0 (copy), l_default_0 (copy), v94 (copy), l_GetFFlagEnableVrVoiceParity_0 (copy), l_VRHub_0 (copy), v81 (copy), v83 (copy), v56 (copy), v86 (copy), v85 (copy), v90 (copy), v91 (copy), v92 (copy), v88 (copy)
    local l_l_StarterGui_0_CoreGuiEnabled_0 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack);
    local l_l_StarterGui_0_CoreGuiEnabled_1 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu);
    local l_l_StarterGui_0_CoreGuiEnabled_2 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Chat);
    local l_l_StarterGui_0_CoreGuiEnabled_3 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList);
    local v154 = nil;
    if v57 then
        v154 = {
            v69, 
            v89
        };
        if v53 then
            v154 = {
                v149.getDebugYOffsetUp(), 
                v149.getDebugYOffsetDown(), 
                v149.getDebugZOffsetUp(), 
                v149.getDebugZOffsetDown(), 
                v149.getDebugTextLabel(), 
                v89, 
                v69, 
                v89
            };
        end;
    else
        v154 = {
            v69, 
            v89, 
            v71
        };
        if v53 then
            v154 = {
                v149.getDebugYOffsetUp(), 
                v149.getDebugYOffsetDown(), 
                v149.getDebugZOffsetUp(), 
                v149.getDebugZOffsetDown(), 
                v149.getDebugTextLabel(), 
                v89, 
                v69, 
                v89, 
                v71
            };
        end;
    end;
    local v155 = l_l_StarterGui_0_CoreGuiEnabled_1 and not (l_StarterPlayer_0.UserEmotesEnabled and v149.emotesLoaded == false);
    local v156 = l_l_StarterGui_0_CoreGuiEnabled_0 and v149.backpackHasItems;
    if l_l_StarterGui_0_CoreGuiEnabled_2 then
        table.insert(v154, v79);
    end;
    if l_GetFFlagEnableVrVoiceConnectDisconnect_0() and l_default_0:ShouldShowJoinVoiceOnDisconnect() then
        table.insert(v154, v94);
    elseif l_GetFFlagEnableVrVoiceParity_0() and l_default_0:ShouldShowJoinVoice() then
        table.insert(v154, v94);
    end;
    if v149.props.voiceEnabled then
        table.insert(v154, v149.getVoiceIcon());
    end;
    table.insert(v154, v89);
    if l_VRHub_0.SafetyBubble and l_VRHub_0.SafetyBubble.enabled then
        table.insert(v154, v81);
    else
        table.insert(v154, v83);
    end;
    if v56 then
        if l_VRHub_0.ShowHighlightedLeaveGameIcon then
            table.insert(v154, v86);
        else
            table.insert(v154, v85);
        end;
    else
        table.insert(v154, v85);
    end;
    local v157 = {};
    if v155 then
        table.insert(v157, v90);
    end;
    if l_l_StarterGui_0_CoreGuiEnabled_3 then
        table.insert(v157, v91);
    end;
    if v156 then
        table.insert(v157, v92);
    end;
    if #v157 > 0 then
        table.insert(v154, v88);
    end;
    return v154, v157;
end;
v43.renderWithStyle = function(v158, v159) --[[ Line: 809 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v59 (copy), v53 (copy), v12 (copy), l_Panel3D_0 (copy), v57 (copy), v36 (ref), l_Constants_0 (copy), l_game_EngineFeature_0 (copy), l_GuiService_0 (copy), v34 (ref), v33 (ref), v35 (ref), l_SystemBar_0 (copy), l_Placement_0 (copy), l_BaseMenu_0 (copy), l_ImageSetLabel_0 (copy), v56 (copy), l_ExternalEventConnection_0 (copy), l_VRHub_0 (copy), l_StarterGui_0 (copy), v49 (copy), v48 (copy), l_RunService_0 (copy), l_VRService_0 (copy)
    local v160 = (0.2 + v158.state.zOffset / 10) * v59;
    local l_itemList_0 = v158.state.itemList;
    local l_moreItemList_0 = v158.state.moreItemList;
    local v163 = v53 and 7 or 1;
    if not v158.state.vrMenuOpen then
        v163 = v53 and 9 or 3;
    elseif v158.state.moreMenuOpen and #l_moreItemList_0 > 0 then
        v163 = #l_itemList_0;
    end;
    return v12.createFragment({
        BottomBarPanel3D = v12.createElement(l_Panel3D_0, {
            panelName = "BottomBar", 
            partSize = if v57 then Vector2.new((#l_itemList_0 - 1) * v36.BOTTOM_BAR_BASE_PART_SIZE * workspace.CurrentCamera.HeadScale, v36.BOTTOM_BAR_BASE_PART_SIZE * workspace.CurrentCamera.HeadScale) else Vector2.new((#l_itemList_0 - 1) * v160, v160), 
            virtualScreenSize = Vector2.new((#l_itemList_0 - 1) * 50, 50), 
            offset = v158.state.vrMenuOpen and CFrame.new(0, 0, 0) or CFrame.new(0, -0.5, 0), 
            offsetCallback = v158.bottomBarPanelOffsetCallback, 
            lerp = true, 
            tilt = 0, 
            anchoring = if v57 then l_Constants_0.AnchoringTypes.PanelManaged else l_Constants_0.AnchoringTypes.Head, 
            faceCamera = true, 
            curvature = 0, 
            alwaysOnTop = l_game_EngineFeature_0 and true or nil, 
            parent = l_game_EngineFeature_0 and l_GuiService_0.CoreGuiFolder or nil, 
            zOffset = 1, 
            connectPanelManagerFunction = v57 and function(v164) --[[ Line: 846 ]]
                -- upvalues: v34 (ref), v33 (ref), v35 (ref)
                if v164 then
                    v34(v164, v33.BottomBar);
                    return;
                else
                    v35.getInstance():removeRoactPanel(v33.BottomBar);
                    return;
                end;
            end or nil
        }, {
            CanvasGroup = v12.createElement("CanvasGroup", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                GroupTransparency = v158.fadeTransparency, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                SystemBar = v12.createElement(l_SystemBar_0, {
                    itemList = l_itemList_0, 
                    selection = v163, 
                    placement = l_Placement_0.Bottom, 
                    hidden = v158.state.hidden, 
                    onSafeAreaChanged = function() --[[ Line: 866 ]] --[[ Name: onSafeAreaChanged ]]

                    end, 
                    size = UDim2.new(1, 0, 1, 0), 
                    position = UDim2.new(), 
                    layoutOrder = 1, 
                    roundCorners = true, 
                    buttonStroke = true, 
                    bgTransparency = 0, 
                    sortOrder = Enum.SortOrder.LayoutOrder
                })
            })
        }), 
        MoreMenuPanel3D = v158.state.moreMenuOpen and v12.createElement(l_Panel3D_0, {
            panelName = "MoreMenu", 
            partSize = if v57 then Vector2.new(5 * v36.BOTTOM_BAR_BASE_PART_SIZE * workspace.CurrentCamera.HeadScale, #l_moreItemList_0 * v36.BOTTOM_BAR_BASE_PART_SIZE * workspace.CurrentCamera.HeadScale) else Vector2.new(5 * v160, #l_moreItemList_0 * v160), 
            virtualScreenSize = Vector2.new(250, #l_moreItemList_0 * 56 + 8), 
            offset = v158.state.vrMenuOpen and CFrame.new(0, 0, 0) or CFrame.new(0, -0.5, 0), 
            offsetCallback = v158.moreMenuPanelOffsetCallback, 
            lerp = true, 
            tilt = 0, 
            tiltCallback = v158.moreMenuPanelTiltCallback, 
            anchoring = if v57 then l_Constants_0.AnchoringTypes.PanelManaged else l_Constants_0.AnchoringTypes.Head, 
            faceCamera = true, 
            alwaysOnTop = l_game_EngineFeature_0 and true or nil, 
            parent = l_game_EngineFeature_0 and l_GuiService_0.CoreGuiFolder or nil, 
            connectPanelManagerFunction = v57 and function(v165) --[[ Line: 898 ]]
                -- upvalues: v34 (ref), v33 (ref), v35 (ref)
                if v165 then
                    v34(v165, v33.MoreMenu);
                    return;
                else
                    v35.getInstance():removeRoactPanel(v33.MoreMenu);
                    return;
                end;
            end or nil, 
            zOffset = 2
        }, {
            Content = v12.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                MoreMenu = v12.createElement(l_BaseMenu_0, {
                    anchorPoint = Vector2.new(0.5, 1), 
                    buttonProps = l_moreItemList_0, 
                    position = UDim2.new(0.5, 0, 1, -8), 
                    background = v159.Theme.BackgroundContrast
                }), 
                Caret = v12.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 1), 
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/MenuBar/dropdown-arrow.png", 
                    ImageColor3 = Color3.fromRGB(25, 27, 29), 
                    Position = UDim2.new(0.5, 0, 1, 0), 
                    Size = UDim2.new(0, 24, 0, 10)
                })
            })
        }), 
        ShowHighlightedLeaveGameIconToggled = v56 and v12.createElement(l_ExternalEventConnection_0, {
            event = l_VRHub_0.ShowHighlightedLeaveGameIconToggled.Event, 
            callback = v158.updateItemListState
        }), 
        ShowTopBarChanged = v12.createElement(l_ExternalEventConnection_0, {
            event = l_VRHub_0.ShowTopBarChanged.Event, 
            callback = v158.onShowTopBarChanged
        }), 
        ShowMoreMenuChanged = v12.createElement(l_ExternalEventConnection_0, {
            event = l_VRHub_0.ShowMoreMenuChanged.Event, 
            callback = v158.onShowMoreMenuChanged
        }), 
        CoreGuiChanged = v12.createElement(l_ExternalEventConnection_0, {
            event = l_StarterGui_0.CoreGuiChangedSignal, 
            callback = v158.updateItemListState
        }), 
        SafetyBubbleToggled = l_VRHub_0.SafetyBubble and v12.createElement(l_ExternalEventConnection_0, {
            event = l_VRHub_0.SafetyBubble.Toggled.Event, 
            callback = v158.updateItemListState
        }), 
        BackpackItemAdded = v12.createElement(l_ExternalEventConnection_0, {
            event = v49.BackpackItemAdded.Event, 
            callback = v158.onBackpackItemAdded
        }), 
        BackpackEmpty = v12.createElement(l_ExternalEventConnection_0, {
            event = v49.BackpackEmpty.Event, 
            callback = v158.onBackpackEmpty
        }), 
        EmotesLoaded = v12.createElement(l_ExternalEventConnection_0, {
            event = v48.EmotesLoaded.Event, 
            callback = v158.onEmotesLoaded
        }), 
        RenderStepped = v12.createElement(l_ExternalEventConnection_0, {
            event = l_RunService_0.RenderStepped, 
            callback = v158.onRenderStepped
        }), 
        VREnabled = v12.createElement(l_ExternalEventConnection_0, {
            event = l_VRService_0:GetPropertyChangedSignal("VREnabled"), 
            callback = v158.onVREnabledChanged
        })
    });
end;
v43.render = function(v166) --[[ Line: 973 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v167) --[[ Line: 974 ]]
        -- upvalues: v166 (copy)
        return v166:renderWithStyle(v167);
    end);
end;
v43.didUpdate = function(v168, v169, v170) --[[ Line: 979 ]] --[[ Name: didUpdate ]]
    -- upvalues: v10 (copy), v67 (copy), l_VRHub_0 (copy)
    if v170.lookAway ~= v168.state.lookAway or v170.vrMenuOpen ~= v168.state.vrMenuOpen then
        if not v168.state.vrMenuOpen and v168.state.lookAway then
            v168.fadeTransparencyMotor:setGoal(v10.spring(1, v67.Slower));
        else
            v168.fadeTransparencyMotor:setGoal(v10.spring(0, v67.Default));
        end;
    end;
    if v168.state.moreMenuOpen and #v168.state.moreItemList == 0 then
        l_VRHub_0:SetShowMoreMenu(false);
    end;
    if v169.voiceEnabled ~= v168.props.voiceEnabled then
        v168.updateItemListState();
        return;
    else
        if v170.yOffset ~= v168.state.yOffset or v170.zOffset ~= v168.state.zOffset then
            v168.updateItemListState();
        end;
        return;
    end;
end;
v43.willUnmount = function(v171) --[[ Line: 1001 ]] --[[ Name: willUnmount ]]
    v171.fadeTransparencyMotor:stop();
end;
return v13.UNSTABLE_connect2(nil, nil)(v43);