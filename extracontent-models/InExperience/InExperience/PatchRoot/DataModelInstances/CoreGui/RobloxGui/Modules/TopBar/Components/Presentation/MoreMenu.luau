local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_VRService_0 = game:GetService("VRService");
local l_StarterGui_0 = game:GetService("StarterGui");
local _ = require(l_CorePackages_0.Packages.Signals);
local _ = require(l_CorePackages_0.Workspace.Packages.Display);
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local v11 = require(l_CorePackages_0.Packages.Signals);
local v12 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_ContextualMenu_0 = v10.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v10.App.Menu.MenuDirection;
local l_Images_0 = v10.App.ImageSet.Images;
local l_withStyle_0 = v10.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local v19 = require(l_Actions_0.SetKeepOutArea);
local v20 = require(l_Actions_0.RemoveKeepOutArea);
local v21 = require(l_Actions_0.SetMoreMenuOpen);
local v22 = require(l_Parent_0.Analytics);
local v23 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
local l_FFlagTopBarSignalizeKeepOutAreas_0 = v23.Flags.FFlagTopBarSignalizeKeepOutAreas;
local l_FFlagTopBarSignalizeScreenSize_0 = v23.Flags.FFlagTopBarSignalizeScreenSize;
local v26 = require(l_Parent_0.Flags.GetFFlagEnableTopBarAnalytics)();
local v27 = require(l_Parent_0.Flags.GetFFlagRemoveTopBarInputTypeRodux)();
local v28 = require(l_Parent_0.Constants);
local l_InputType_0 = v28.InputType;
local v30 = require(script.Parent.IconButton);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0.Modules;
local v33 = require(l_Modules_0.TenFootInterface);
local l_VRHub_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
local v35 = require(l_Modules_0.EmotesMenu.EmotesMenuMaster);
local v36 = require(l_Modules_0.BackpackScript);
local v37 = require(l_Modules_0.ChatSelector);
local v38 = require(l_Modules_0.PlayerList.PlayerListManager);
local v39 = require(l_Modules_0.EmotesMenu.Constants);
local v40 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v42 = require(l_Modules_0.Flags.FFlagMountCoreGuiBackpack);
local v43 = l_Images_0["icons/controls/emoteOn"];
local v44 = l_Images_0["icons/controls/emoteOff"];
local v45 = v7.PureComponent:extend("MoreMenu");
v45.validateProps = v9.strictInterface({
    layoutOrder = v9.integer, 
    moreMenuOpen = v9.boolean, 
    setMoreMenuOpen = v9.callback, 
    screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else v9.Vector2, 
    isSmallTouchDevice = v9.boolean, 
    topBarEnabled = v9.boolean, 
    leaderboardEnabled = v9.boolean, 
    emotesEnabled = v9.boolean, 
    backpackEnabled = if v42 then nil else v9.boolean, 
    leaderboardOpen = v9.boolean, 
    backpackOpen = v9.boolean, 
    emotesOpen = v9.boolean, 
    inputType = if v27 then nil else v9.string, 
    setKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else v9.callback, 
    removeKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else v9.callback
});
v45.init = function(v46) --[[ Line: 111 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v26 (copy), v22 (copy), v11 (copy), v12 (copy), v42 (copy), l_StarterGui_0 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v23 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy)
    v46.rootRef = v7.createRef();
    if v26 then
        v46.analytics = v22.default;
    end;
    v46.disposeUiScaleEffect = v11.createEffect(function(v47) --[[ Line: 116 ]]
        -- upvalues: v12 (ref), v46 (copy)
        local v48 = v12.GetDisplayStore(v47);
        v46:setState({
            UiScale = v48.getUIScale(v47)
        });
    end);
    if v42 then
        v46:setState({
            mountBackpack = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack), 
            vrShowMenuIcon = false
        });
        l_StarterGui_0.CoreGuiChangedSignal:Connect(function(v49, v50) --[[ Line: 129 ]]
            -- upvalues: v46 (copy)
            if v49 == Enum.CoreGuiType.Backpack or v49 == Enum.CoreGuiType.All then
                v46:setState({
                    mountBackpack = v50
                });
            end;
        end);
    else
        v46:setState({
            vrShowMenuIcon = false
        });
    end;
    v46.chatWasHidden = false;
    v46.boundAction = false;
    v46.moreButtonActivated = function() --[[ Line: 146 ]]
        -- upvalues: v46 (copy)
        v46.props.setMoreMenuOpen(not v46.props.moreMenuOpen);
        if v46.analytics then
            v46.analytics:onMoreMenuActivated();
        end;
    end;
    if l_FFlagTopBarSignalizeKeepOutAreas_0 then
        v46.keepOutAreasStore = v23.Stores.GetKeepOutAreasStore(false);
    end;
    if l_FFlagTopBarSignalizeScreenSize_0 then
        local l_getViewportSize_0 = v12.GetDisplayStore(false).getViewportSize;
        v46.disposeScreenSize = v11.createEffect(function(v52) --[[ Line: 160 ]]
            -- upvalues: v46 (copy), l_getViewportSize_0 (copy)
            v46:setState({
                screenSize = l_getViewportSize_0(v52)
            });
        end);
    end;
end;
v45.willUnmount = function(v53) --[[ Line: 168 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagTopBarSignalizeScreenSize_0 (copy)
    if l_FFlagTopBarSignalizeScreenSize_0 then
        v53.disposeScreenSize();
    end;
    if v53.disposeUiScaleEffect then
        v53.disposeUiScaleEffect();
    end;
end;
v45.renderWithStyle = function(v54, v55) --[[ Line: 177 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v27 (copy), l_InputType_0 (copy), v40 (copy), l_VRService_0 (copy), l_RobloxGui_0 (copy), v38 (copy), v43 (copy), v44 (copy), v39 (copy), v35 (copy), v37 (copy), v42 (copy), v36 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy), v33 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v28 (copy), v7 (copy), v30 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy), l_ExternalEventConnection_0 (copy), l_VRHub_0 (copy)
    local v56 = {};
    local v57 = false;
    local v58 = not v27 and v54.props.inputType == l_InputType_0.MouseAndKeyBoard;
    if v54.props.leaderboardEnabled then
        local v59 = "rbxasset://textures/ui/TopBar/leaderboardOn.png";
        if not v54.props.leaderboardOpen then
            v59 = "rbxasset://textures/ui/TopBar/leaderboardOff.png";
        end;
        table.insert(v56, {
            icon = v59, 
            text = v40:FormatByKey("CoreScripts.TopBar.Leaderboard"), 
            keyCodeLabel = v58 and Enum.KeyCode.Tab or nil, 
            onActivated = function() --[[ Line: 194 ]] --[[ Name: onActivated ]]
                -- upvalues: v54 (copy), l_VRService_0 (ref), l_RobloxGui_0 (ref), v38 (ref)
                local l_leaderboardOpen_0 = v54.props.leaderboardOpen;
                if l_VRService_0.VREnabled then
                    require(l_RobloxGui_0.Modules.InGameMenu).openPlayersPage();
                else
                    v38:SetVisibility(not v38:GetSetVisible());
                    v54.props.setMoreMenuOpen(false);
                end;
                if v54.analytics then
                    v54.analytics:onLeaderboardActivated(not l_leaderboardOpen_0);
                end;
            end
        });
        v57 = true;
    end;
    if v54.props.emotesEnabled then
        local l_v43_0 = v43;
        if not v54.props.emotesOpen then
            l_v43_0 = v44;
        end;
        local l_EmoteMenuOpenKey_0 = v39.EmoteMenuOpenKey;
        table.insert(v56, {
            icon = l_v43_0, 
            text = v40:FormatByKey("CoreScripts.TopBar.Emotes"), 
            keyCodeLabel = v58 and l_EmoteMenuOpenKey_0 or nil, 
            onActivated = function() --[[ Line: 223 ]] --[[ Name: onActivated ]]
                -- upvalues: v35 (ref), v54 (copy), v37 (ref)
                if v35:isOpen() then
                    v35:close();
                else
                    if v54.chatWasHidden then
                        v37:SetVisible(true);
                        v54.chatWasHidden = false;
                    end;
                    v35:open();
                end;
                v54.props.setMoreMenuOpen(false);
                if v54.analytics then
                    v54.analytics:onEmotesActivated(v35:isOpen());
                end;
            end
        });
        v57 = true;
    end;
    local _ = nil;
    if if v42 then v54.state.mountBackpack else v54.props.backpackEnabled then
        local v64 = "rbxasset://textures/ui/TopBar/inventoryOn.png";
        if not v54.props.backpackOpen then
            v64 = "rbxasset://textures/ui/TopBar/inventoryOff.png";
        end;
        table.insert(v56, {
            icon = v64, 
            text = v40:FormatByKey("CoreScripts.TopBar.Inventory"), 
            keyCodeLabel = v58 and Enum.KeyCode.Backquote or nil, 
            onActivated = function() --[[ Line: 259 ]] --[[ Name: onActivated ]]
                -- upvalues: v36 (ref), v54 (copy)
                v36:OpenClose();
                v54.props.setMoreMenuOpen(false);
                if v54.analytics then
                    v54.analytics:onInventoryActivated(v36.IsOpen);
                end;
            end
        });
        v57 = true;
    end;
    local v65 = if l_FFlagTopBarSignalizeScreenSize_0 then v54.state.screenSize else v54.props.screenSize;
    local v66 = UDim2.new(0, 324, 0, v65.Y);
    if v65.X < 450 then
        v66 = UDim2.new(0, v65.X - 24, 0, v65.Y);
    end;
    local v67 = "rbxasset://textures/ui/TopBar/moreOn.png";
    if not v54.props.moreMenuOpen then
        v67 = "rbxasset://textures/ui/TopBar/moreOff.png";
    end;
    local v68 = not v33:IsEnabled() and v54.props.topBarEnabled and v57 and not l_VRService_0.VREnabled;
    local function v70(v69) --[[ Line: 287 ]]
        -- upvalues: v68 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (ref), v54 (copy), v28 (ref)
        if v68 and v69 then
            if l_FFlagTopBarSignalizeKeepOutAreas_0 then
                v54.keepOutAreasStore.setKeepOutArea(v28.MoreMenuKeepOutAreaId, v69.AbsolutePosition, v69.AbsoluteSize);
                return;
            else
                v54.props.setKeepOutArea(v28.MoreMenuKeepOutAreaId, v69.AbsolutePosition, v69.AbsoluteSize);
                return;
            end;
        elseif l_FFlagTopBarSignalizeKeepOutAreas_0 then
            v54.keepOutAreasStore.removeKeepOutArea(v28.MoreMenuKeepOutAreaId);
            return;
        else
            v54.props.removeKeepOutArea(v28.MoreMenuKeepOutAreaId);
            return;
        end;
    end;
    if v54.rootRef.current then
        v70(v54.rootRef.current);
    end;
    return v7.createElement("Frame", {
        Visible = v68, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 32, 1, 0), 
        LayoutOrder = v54.props.layoutOrder, 
        [v7.Change.AbsoluteSize] = v70, 
        [v7.Change.AbsolutePosition] = v70, 
        [v7.Ref] = v54.rootRef
    }, {
        OpenButton = v7.createElement(v30, {
            icon = v67, 
            iconSize = 24, 
            onActivated = v54.moreButtonActivated
        }), 
        MoreMenuContainer = v7.createElement("Frame", {
            ZIndex = 3, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(1, 12, 0, 0), 
            Size = v66, 
            AnchorPoint = Vector2.new(1, 0)
        }, {
            ContextualMenu = v7.createElement(l_ContextualMenu_0, {
                buttonProps = v56, 
                open = v54.props.moreMenuOpen, 
                menuDirection = l_MenuDirection_0.Down, 
                openPositionY = UDim.new(0, v28.TopBarHeight * v54.state.UiScale + 12), 
                background = v55.Theme.BackgroundUIContrast, 
                closeBackgroundVisible = false, 
                screenSize = v65, 
                onDismiss = function() --[[ Line: 341 ]] --[[ Name: onDismiss ]]
                    -- upvalues: v54 (copy), v38 (ref)
                    v54.props.setMoreMenuOpen(false);
                    v38:SetMinimized(false);
                end
            })
        }), 
        ShowTopBarListener = v7.createElement(l_ExternalEventConnection_0, {
            event = l_VRHub_0.ShowTopBarChanged.Event, 
            callback = function() --[[ Line: 349 ]] --[[ Name: callback ]]
                -- upvalues: v54 (copy), l_VRService_0 (ref), l_VRHub_0 (ref), v57 (ref)
                v54:setState({
                    vrShowMenuIcon = l_VRService_0.VREnabled and l_VRHub_0.ShowTopBar and v57
                });
            end
        })
    });
end;
v45.render = function(v71) --[[ Line: 358 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v72) --[[ Line: 359 ]]
        -- upvalues: v71 (copy)
        return v71:renderWithStyle(v72);
    end);
end;
v45.updateActionBound = function(v73) --[[ Line: 364 ]] --[[ Name: updateActionBound ]]
    -- upvalues: l_ContextActionService_0 (copy)
    if v73.props.moreMenuOpen then
        l_ContextActionService_0:BindCoreAction("CloseMoreMenuAction", function(_, v75, _) --[[ Line: 366 ]]
            -- upvalues: v73 (copy)
            if v75 == Enum.UserInputState.Begin then
                v73.props.setMoreMenuOpen(false);
                return Enum.ContextActionResult.Sink;
            else
                return Enum.ContextActionResult.Pass;
            end;
        end, false, Enum.KeyCode.Escape);
        v73.boundAction = true;
        return;
    else
        if v73.boundAction then
            l_ContextActionService_0:UnbindCoreAction("CloseMoreMenuAction");
            v73.boundAction = false;
        end;
        return;
    end;
end;
v45.didUpdate = function(v77, v78, _) --[[ Line: 382 ]] --[[ Name: didUpdate ]]
    -- upvalues: v38 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy), v37 (copy)
    if v77.props.moreMenuOpen ~= v78.moreMenuOpen then
        v38:SetMinimized(v77.props.moreMenuOpen);
        v77:updateActionBound();
        if (if l_FFlagTopBarSignalizeScreenSize_0 then v77.state.screenSize else v77.props.screenSize).X < 600 then
            if v77.props.moreMenuOpen and v37:GetVisibility() then
                v77.chatWasHidden = true;
                v37:SetVisible(false);
                return;
            elseif not v77.props.moreMenuOpen and v77.chatWasHidden then
                v37:SetVisible(true);
                v77.chatWasHidden = false;
            end;
        end;
    end;
end;
return v8.UNSTABLE_connect2(function(v80) --[[ Line: 403 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagTopBarSignalizeScreenSize_0 (copy), v42 (copy), v27 (copy)
    return {
        screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else v80.displayOptions.screenSize, 
        moreMenuOpen = v80.moreMenu.open, 
        isSmallTouchDevice = v80.displayOptions.isSmallTouchDevice, 
        topBarEnabled = v80.displayOptions.topbarEnabled, 
        leaderboardEnabled = v80.coreGuiEnabled[Enum.CoreGuiType.PlayerList], 
        emotesEnabled = v80.moreMenu.emotesEnabled and v80.coreGuiEnabled[Enum.CoreGuiType.EmotesMenu], 
        backpackEnabled = if v42 then nil else v80.coreGuiEnabled[Enum.CoreGuiType.Backpack], 
        leaderboardOpen = v80.moreMenu.leaderboardOpen, 
        backpackOpen = v80.moreMenu.backpackOpen, 
        emotesOpen = v80.moreMenu.emotesOpen, 
        inputType = if v27 then nil else v80.displayOptions.inputType
    };
end, function(v81) --[[ Line: 423 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v21 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v19 (copy), v20 (copy)
    return {
        setMoreMenuOpen = function(v82) --[[ Line: 425 ]] --[[ Name: setMoreMenuOpen ]]
            -- upvalues: v81 (copy), v21 (ref)
            return v81(v21(v82));
        end, 
        setKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else function(v83, v84, v85) --[[ Line: 430 ]]
            -- upvalues: v81 (copy), v19 (ref)
            return v81(v19(v83, v84, v85));
        end, 
        removeKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else function(v86) --[[ Line: 435 ]]
            -- upvalues: v81 (copy), v20 (ref)
            return v81(v20(v86));
        end
    };
end)(v45);