local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v5 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v5.Roact;
local l_UIBlox_0 = v5.UIBlox;
local l_Cryo_0 = v5.Cryo;
local l_RoactRodux_0 = v5.RoactRodux;
local l_t_0 = v5.t;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_Parent_0 = script.Parent.Parent.Parent;
local v16 = require(l_Parent_0.Localization.withLocalization);
local l_Flags_0 = l_Parent_0.Flags;
local v18 = require(l_Flags_0.GetFFlagIGMGamepadSelectionHistory);
local v19 = require(script.Parent.Parent.Connection.FocusHandler);
local v20 = require(l_RobloxGui_0.Modules.VoiceChat.Components.VoiceIndicator);
local v21 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v22 = require(l_Parent_0.Components.PlayerLabelV2);
local v23 = require(l_Parent_0.Components.PlayerContextualMenu);
local v24 = require(l_Parent_0.Flags.FFlagLuaMenuPerfImprovements);
local v25 = require(l_Parent_0.Components.PageNavigationWatcher);
local v26 = require(l_Parent_0.Components.Divider);
local v27 = require(l_Parent_0.Components.BarOnTopScrollingFrame);
local v28 = require(l_Parent_0.Components.Page);
local v29 = require(l_Parent_0.Thunks.CloseMenu);
local v30 = require(l_Parent_0.Resources.Assets);
local v31 = require(l_Parent_0.Resources.Constants);
local v32 = require(l_Parent_0.Utility.SendAnalytics);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v34 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local v35 = require(l_RobloxGui_0.Modules.PlayerList.Thunks.UnblockPlayer);
local v36 = require(l_RobloxGui_0.Modules.TrustAndSafety);
local v37 = require(l_RobloxGui_0.Modules.Settings.onBlockButtonActivated);
local v38 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v39 = settings():GetFVariable("InGameGlobalGuiInset") + 24;
local v40 = l_Roact_0.PureComponent:extend("PlayersPage");
v40.validateProps = l_t_0.strictInterface({
    isMenuOpen = l_t_0.boolean, 
    voiceEnabled = l_t_0.optional(l_t_0.boolean), 
    inspectMenuEnabled = l_t_0.boolean, 
    friends = l_t_0.map(l_t_0.integer, l_t_0.enum(Enum.FriendStatus)), 
    closeMenu = l_t_0.callback, 
    unblockPlayer = l_t_0.callback, 
    pageTitle = l_t_0.string, 
    screenSize = l_t_0.Vector2, 
    currentPage = l_t_0.optional(l_t_0.string), 
    isRespawnDialogOpen = l_t_0.optional(l_t_0.boolean), 
    isReportDialogOpen = l_t_0.optional(l_t_0.boolean), 
    isGamepadLastInput = l_t_0.optional(l_t_0.boolean), 
    isCurrentZoneActive = l_t_0.optional(l_t_0.boolean)
});
v40.init = function(v41) --[[ Line: 89 ]] --[[ Name: init ]]
    -- upvalues: l_Players_0 (copy), v18 (copy), l_Roact_0 (copy), v24 (copy)
    v41:setState({
        players = l_Players_0:GetPlayers(), 
        selectedPlayer = nil, 
        selectedPlayerPosition = Vector2.new(0, 0), 
        pageSizeY = 0, 
        voiceChatEnabled = false, 
        allMuted = false, 
        selectedPlayerRef = nil, 
        firstPlayerRef = nil
    });
    v41.setSelectedPlayerRef = function(v42) --[[ Line: 101 ]]
        -- upvalues: v18 (ref), v41 (copy), l_Roact_0 (ref)
        if v18() then
            v41:setState({
                selectedPlayerRef = v42
            });
            return;
        else
            v41:setState({
                selectedPlayerRef = v42, 
                firstPlayerRef = l_Roact_0.None
            });
            return;
        end;
    end;
    v41.setFirstPlayerRef = function(v43) --[[ Line: 114 ]]
        -- upvalues: v41 (copy)
        v41:setState({
            firstPlayerRef = v43
        });
    end;
    if v24 then
        v41.positionChanged = function(v44) --[[ Line: 121 ]]
            -- upvalues: v41 (copy)
            v41:setState({
                selectedPlayerPosition = v44.AbsolutePosition
            });
        end;
        v41.toggleMoreActions = function(v45) --[[ Line: 126 ]]
            -- upvalues: l_Players_0 (ref), v41 (copy), l_Roact_0 (ref)
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v45);
            if v41.state.selectedPlayer == l_l_Players_0_PlayerByUserId_0 then
                v41:setState({
                    selectedPlayer = l_Roact_0.None
                });
                return;
            else
                v41:setState({
                    selectedPlayer = l_l_Players_0_PlayerByUserId_0
                });
                return;
            end;
        end;
    end;
end;
local function v49(v47, v48) --[[ Line: 141 ]] --[[ Name: sortPlayers ]]
    return v47.Name:lower() < v48.Name:lower();
end;
v40.renderListEntries = function(v50, v51) --[[ Line: 145 ]] --[[ Name: renderListEntries ]]
    -- upvalues: l_Cryo_0 (copy), v49 (copy), l_Roact_0 (copy), v24 (copy), l_Players_0 (copy), v22 (copy), v20 (copy), v26 (copy)
    local v52 = l_Cryo_0.List.sort(v51, v49);
    local v53 = 0;
    local v54 = {
        ListLayout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right
        })
    };
    for v55, v56 in pairs(v52) do
        local v57 = v24 and v56.UserId or v55;
        local v59 = v24 and v50.positionChanged or function(v58) --[[ Line: 160 ]]
            -- upvalues: v50 (copy)
            v50:setState({
                selectedPlayerPosition = v58.AbsolutePosition
            });
        end;
        local v60 = v24 and v50.toggleMoreActions or function() --[[ Line: 167 ]]
            -- upvalues: v50 (copy), v56 (copy), l_Roact_0 (ref)
            if v50.state.selectedPlayer == v56 then
                v50:setState({
                    selectedPlayer = l_Roact_0.None
                });
                return;
            else
                v50:setState({
                    selectedPlayer = v56
                });
                return;
            end;
        end;
        local v61 = nil;
        if v55 == 1 and not v50.state.selectedPlayer then
            v61 = v50.setFirstPlayerRef;
        elseif v50.state.selectedPlayer == v56 then
            v61 = v50.setSelectedPlayerRef;
        end;
        local v62 = v56 ~= l_Players_0.LocalPlayer and "SpeakerLight" or "MicLight";
        v54["player_" .. v57] = l_Roact_0.createElement(v22, {
            username = v56.Name, 
            displayName = v56.DisplayName, 
            userId = v56.UserId, 
            isOnline = true, 
            isSelected = v50.state.selectedPlayer == v56, 
            LayoutOrder = v53, 
            onActivated = v60, 
            [l_Roact_0.Change.AbsolutePosition] = v50.state.selectedPlayer == v56 and v59 or nil, 
            [l_Roact_0.Ref] = v61
        }, {
            Icon = v50.props.voiceEnabled and v56 ~= l_Players_0.LocalPlayer and l_Roact_0.createElement(v20, {
                userId = tostring(v56.UserId), 
                hideOnError = true, 
                iconStyle = v62, 
                onClicked = v60
            })
        });
        v53 = v53 + 1;
        if v55 < #v52 then
            v54["divider_" .. v57] = l_Roact_0.createElement(v26, {
                LayoutOrder = v53, 
                Size = UDim2.new(1, -104, 0, 1)
            });
            v53 = v53 + 1;
        end;
    end;
    return v54;
end;
v40.getMoreActions = function(v63, v64) --[[ Line: 224 ]] --[[ Name: getMoreActions ]]
    -- upvalues: l_Players_0 (copy), l_Images_0 (copy), l_RbxAnalyticsService_0 (copy), v32 (copy), v31 (copy), l_Roact_0 (copy), v30 (copy), l_GuiService_0 (copy), v36 (copy), l_default_0 (copy), v38 (copy), v21 (copy), v34 (copy), v37 (copy)
    local v65 = {};
    if v63.state.selectedPlayer ~= nil then
        if v63.state.selectedPlayer ~= l_Players_0.LocalPlayer then
            local l_Unknown_0 = Enum.FriendStatus.Unknown;
            if v63.props.friends[v63.state.selectedPlayer.UserId] then
                l_Unknown_0 = v63.props.friends[v63.state.selectedPlayer.UserId];
            end;
            local l_addFriend_0 = v64.addFriend;
            local v68 = l_Images_0["icons/actions/friends/friendAdd"];
            if l_Unknown_0 == Enum.FriendStatus.Friend then
                l_addFriend_0 = v64.unfriend;
                v68 = l_Images_0["icons/actions/friends/friendRemove"];
            elseif l_Unknown_0 == Enum.FriendStatus.FriendRequestSent then
                l_addFriend_0 = v64.cancelFriend;
                v68 = l_Images_0["icons/actions/friends/friendRemove"];
            elseif l_Unknown_0 == Enum.FriendStatus.FriendRequestReceived then
                l_addFriend_0 = v64.acceptFriend;
            end;
            do
                local l_l_Unknown_0_0 = l_Unknown_0;
                table.insert(v65, {
                    text = l_addFriend_0, 
                    icon = v68, 
                    onActivated = function() --[[ Line: 249 ]] --[[ Name: onActivated ]]
                        -- upvalues: v63 (copy), l_l_Unknown_0_0 (ref), l_Players_0 (ref), l_RbxAnalyticsService_0 (ref), v32 (ref), v31 (ref), l_Roact_0 (ref)
                        local l_selectedPlayer_0 = v63.state.selectedPlayer;
                        if l_l_Unknown_0_0 == Enum.FriendStatus.Friend or l_l_Unknown_0_0 == Enum.FriendStatus.FriendRequestSent then
                            l_Players_0.LocalPlayer:RevokeFriendship(l_selectedPlayer_0);
                        else
                            l_Players_0.LocalPlayer:RequestFriendship(l_selectedPlayer_0);
                            l_RbxAnalyticsService_0:ReportCounter("PlayersMenu-RequestFriendship");
                            v32(v31.AnalyticsMenuActionName, v31.AnalyticsRequestFriendName, {});
                        end;
                        v63:setState({
                            selectedPlayer = l_Roact_0.None
                        });
                    end
                });
            end;
        end;
        table.insert(v65, {
            text = v64.viewAvatar, 
            icon = v30.Images.ViewAvatar, 
            onActivated = function() --[[ Line: 271 ]] --[[ Name: onActivated ]]
                -- upvalues: l_GuiService_0 (ref), v63 (copy), l_Roact_0 (ref), v32 (ref), v31 (ref)
                l_GuiService_0:InspectPlayerFromUserIdWithCtx(v63.state.selectedPlayer.UserId, "escapeMenu");
                v63:setState({
                    selectedPlayer = l_Roact_0.None
                });
                v63.props.closeMenu();
                v32(v31.AnalyticsMenuActionName, v31.AnalyticsExamineAvatarName, {});
            end
        });
        if v63.state.selectedPlayer ~= l_Players_0.LocalPlayer then
            table.insert(v65, {
                text = v64.reportAbuse, 
                icon = l_Images_0["icons/actions/feedback"], 
                onActivated = function() --[[ Line: 285 ]] --[[ Name: onActivated ]]
                    -- upvalues: v63 (copy), v36 (ref), v31 (ref), l_Roact_0 (ref)
                    local l_selectedPlayer_1 = v63.state.selectedPlayer;
                    v36.openReportDialogForPlayer(l_selectedPlayer_1, v31.AnalyticsMenuActionName);
                    v63:setState({
                        selectedPlayer = l_Roact_0.None
                    });
                end
            });
            if v63.props.voiceEnabled then
                local v72 = l_default_0.participants[tostring(v63.state.selectedPlayer.UserId)];
                if v72 then
                    local l_isMutedLocally_0 = v72.isMutedLocally;
                    table.insert(v65, {
                        text = l_isMutedLocally_0 and "Unmute Player" or "Mute Player", 
                        icon = l_default_0:GetIcon(l_isMutedLocally_0 and "Unmute" or "Mute", "Misc"), 
                        onActivated = function() --[[ Line: 302 ]] --[[ Name: onActivated ]]
                            -- upvalues: v63 (copy), v38 (ref), l_default_0 (ref), v21 (ref), l_Roact_0 (ref)
                            local l_selectedPlayer_2 = v63.state.selectedPlayer;
                            v38:debug("Muting Player {}", l_selectedPlayer_2.UserId);
                            l_default_0:ToggleMutePlayer(l_selectedPlayer_2.UserId, v21.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
                            v63:setState({
                                selectedPlayer = l_Roact_0.None
                            });
                        end
                    });
                end;
            end;
            local l_selectedPlayer_3 = v63.state.selectedPlayer;
            local v76 = v34:IsPlayerBlockedByUserId(l_selectedPlayer_3.UserId);
            table.insert(v65, {
                text = v76 and v64.unblockPlayer or v64.blockPlayer, 
                icon = l_Images_0["icons/actions/block"], 
                onActivated = function() --[[ Line: 322 ]] --[[ Name: onActivated ]]
                    -- upvalues: v76 (copy), v63 (copy), l_selectedPlayer_3 (copy), v37 (ref), l_Roact_0 (ref)
                    if v76 then
                        v63.props.unblockPlayer(l_selectedPlayer_3);
                    else
                        v37(l_selectedPlayer_3, nil, v63.__componentName);
                    end;
                    v63:setState({
                        selectedPlayer = l_Roact_0.None
                    });
                end
            });
        end;
    end;
    return v65;
end;
v40.renderFocusHandler = function(v77, v78) --[[ Line: 340 ]] --[[ Name: renderFocusHandler ]]
    -- upvalues: v18 (copy), v31 (copy), l_Roact_0 (copy), v19 (copy), l_GuiService_0 (copy)
    local v79 = nil;
    if v18() then
        local v80 = true;
        if v77.props.currentPage ~= v31.MainPagePageKey then
            v80 = not v77.props.isCurrentZoneActive;
        end;
        v79 = v80;
    end;
    return l_Roact_0.createElement(v19, {
        isFocused = v78 and v77.props.currentPage == "Players" and v77.props.isMenuOpen and not v77.props.isReportDialogOpen and not v77.state.selectedPlayer and (v77.state.selectedPlayerRef or v77.state.firstPlayerRef) ~= nil, 
        shouldForgetPreviousSelection = v79, 
        didFocus = v18() and function(v81) --[[ Line: 356 ]]
            -- upvalues: l_GuiService_0 (ref), v77 (copy)
            l_GuiService_0.SelectedCoreObject = v81 or v77.state.firstPlayerRef;
        end or function() --[[ Line: 360 ]]
            -- upvalues: l_GuiService_0 (ref), v77 (copy)
            l_GuiService_0.SelectedCoreObject = v77.state.selectedPlayerRef or v77.state.firstPlayerRef;
        end
    });
end;
v40.renderWithLocalizedAndSelectionCursor = function(v82, v83, v84) --[[ Line: 367 ]] --[[ Name: renderWithLocalizedAndSelectionCursor ]]
    -- upvalues: v39 (copy), l_Roact_0 (copy), v23 (copy), v28 (copy), l_default_0 (copy), v21 (copy), l_CursorKind_0 (copy), l_withStyle_0 (copy), v27 (copy), v25 (copy), l_Players_0 (copy)
    local v85 = 0;
    local v86 = 0;
    local v87 = {};
    if v82.state.selectedPlayer ~= nil then
        v87 = v82:getMoreActions(v83);
        local v88 = #v87 * 56;
        local l_X_0 = v82.props.screenSize.X;
        local l_Y_0 = v82.props.screenSize.Y;
        v85 = if v82.state.selectedPlayerPosition.Y + v88 + v39 < l_Y_0 then v82.state.selectedPlayerPosition.Y else l_Y_0 - v88 - v39;
        v86 = if v82.state.selectedPlayerPosition.X + 400 + 20 + 352 + 24 <= l_X_0 then v82.state.selectedPlayerPosition.X + 400 + 20 else l_X_0 - 352 - 24;
    end;
    local v91 = nil;
    local v92 = v82.props.isGamepadLastInput and not v82.props.isRespawnDialogOpen and v82.props.isCurrentZoneActive;
    v91 = v82.state.selectedPlayer and l_Roact_0.createElement(v23, {
        moreActions = v87, 
        actionWidth = 352, 
        xOffset = v86, 
        yOffset = v85, 
        canCaptureFocus = v92, 
        onClose = function() --[[ Line: 411 ]] --[[ Name: onClose ]]
            -- upvalues: v82 (copy), l_Roact_0 (ref)
            v82:setState({
                selectedPlayer = l_Roact_0.None
            });
        end
    }) or nil;
    return l_Roact_0.createElement(v28, {
        pageTitle = v82.props.pageTitle, 
        titleChildren = v82.props.voiceEnabled and l_Roact_0.createElement("ImageButton", {
            Size = UDim2.fromOffset(36, 36), 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(1, 0.5), 
            BorderSizePixel = 0, 
            Position = UDim2.new(1, 4, 0.5, 0), 
            Image = l_default_0:GetIcon(v82.state.allMuted and "UnmuteAll" or "MuteAll", "Misc"), 
            [l_Roact_0.Event.Activated] = function() --[[ Line: 426 ]]
                -- upvalues: l_default_0 (ref), v82 (copy), v21 (ref)
                l_default_0:MuteAll(not v82.state.allMuted, v21.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
                v82:setState({
                    allMuted = not v82.state.allMuted
                });
            end, 
            SelectionImageObject = v84(l_CursorKind_0.RoundedRect)
        })
    }, {
        PlayerListContent = l_withStyle_0(function(_) --[[ Line: 435 ]]
            -- upvalues: l_Roact_0 (ref), v82 (copy), v27 (ref), v91 (ref)
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                [l_Roact_0.Change.AbsoluteSize] = function(v94) --[[ Line: 440 ]]
                    -- upvalues: v82 (ref)
                    v82:setState({
                        pageSizeY = v94.AbsoluteSize.Y
                    });
                end
            }, {
                PlayerList = l_Roact_0.createElement(v27, {
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    CanvasSize = UDim2.new(1, 0, 0, #v82.state.players * 72), 
                    ScrollingEnabled = v82.state.selectedPlayer == nil
                }, v82:renderListEntries(v82.state.players)), 
                MoreActionsMenu = v91
            });
        end), 
        FocusHandler = v82:renderFocusHandler(v92), 
        Watcher = l_Roact_0.createElement(v25, {
            desiredPage = "Players", 
            onNavigateTo = function() --[[ Line: 459 ]] --[[ Name: onNavigateTo ]]
                -- upvalues: v82 (copy), l_Players_0 (ref)
                v82:setState({
                    players = l_Players_0:GetPlayers()
                });
            end, 
            onNavigateAway = function() --[[ Line: 464 ]] --[[ Name: onNavigateAway ]]
                -- upvalues: v82 (copy), l_Roact_0 (ref)
                v82:setState({
                    selectedPlayer = l_Roact_0.None
                });
            end
        })
    });
end;
v40.renderWithLocalized = function(v95, v96) --[[ Line: 473 ]] --[[ Name: renderWithLocalized ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v97) --[[ Line: 474 ]]
        -- upvalues: v95 (copy), v96 (copy)
        return v95:renderWithLocalizedAndSelectionCursor(v96, v97);
    end);
end;
v40.render = function(v98) --[[ Line: 479 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy)
    return v16({
        addFriend = "CoreScripts.InGameMenu.Actions.AddFriend", 
        acceptFriend = "CoreScripts.InGameMenu.Actions.AcceptFriend", 
        unfriend = "CoreScripts.InGameMenu.Actions.Unfriend", 
        cancelFriend = "CoreScripts.InGameMenu.Actions.CancelFriend", 
        viewAvatar = "CoreScripts.InGameMenu.Actions.ViewAvatar", 
        reportAbuse = "CoreScripts.InGameMenu.Actions.ReportAbuse", 
        blockPlayer = "CoreScripts.InGameMenu.Actions.BlockPlayer", 
        unblockPlayer = "CoreScripts.InGameMenu.Actions.UnblockPlayer"
    })(function(v99) --[[ Line: 489 ]]
        -- upvalues: v98 (copy)
        return v98:renderWithLocalized(v99);
    end);
end;
v40.didUpdate = function(v100, v101, _) --[[ Line: 494 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_Players_0 (copy), l_Roact_0 (copy)
    if v100.props.isMenuOpen and not v101.isMenuOpen then
        v100:setState({
            players = l_Players_0:GetPlayers(), 
            selectedPlayer = l_Roact_0.None
        });
    end;
    local l_selectedPlayerRef_0 = v100.state.selectedPlayerRef;
    if l_selectedPlayerRef_0 and v100.state.selectedPlayerPosition ~= l_selectedPlayerRef_0.AbsolutePosition then
        v100:setState({
            selectedPlayerPosition = l_selectedPlayerRef_0.AbsolutePosition
        });
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v104, _) --[[ Line: 512 ]]
    -- upvalues: v31 (copy)
    return {
        isMenuOpen = v104.isMenuOpen, 
        voiceEnabled = v104.voiceState.voiceEnabled, 
        friends = v104.friends, 
        inspectMenuEnabled = v104.displayOptions.inspectMenuEnabled, 
        screenSize = v104.screenSize, 
        currentPage = v104.menuPage, 
        isRespawnDialogOpen = v104.respawn.dialogOpen, 
        isReportDialogOpen = v104.report.dialogOpen or v104.report.reportSentOpen, 
        isGamepadLastInput = v104.displayOptions.inputType == v31.InputType.Gamepad, 
        isCurrentZoneActive = v104.currentZone == 1
    };
end, function(v106) --[[ Line: 525 ]]
    -- upvalues: v29 (copy), v35 (copy)
    return {
        closeMenu = function() --[[ Line: 527 ]] --[[ Name: closeMenu ]]
            -- upvalues: v106 (copy), v29 (ref)
            v106(v29);
        end, 
        unblockPlayer = function(v107) --[[ Line: 531 ]] --[[ Name: unblockPlayer ]]
            -- upvalues: v106 (copy), v35 (ref)
            return v106(v35(v107));
        end
    };
end)(v40);