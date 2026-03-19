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
local v27 = require(l_Parent_0.Constants);
local _ = v27.InputType;
local v29 = require(script.Parent.IconButton);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0.Modules;
local v32 = require(l_Modules_0.TenFootInterface);
local l_VRHub_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
local v34 = require(l_Modules_0.EmotesMenu.EmotesMenuMaster);
local v35 = require(l_Modules_0.BackpackScript);
local v36 = require(l_Modules_0.ChatSelector);
local v37 = require(l_Modules_0.PlayerList.PlayerListManager);
local v38 = require(l_Modules_0.EmotesMenu.Constants);
local v39 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v41 = require(l_Modules_0.Flags.FFlagMountCoreGuiBackpack);
local v42 = l_Images_0["icons/controls/emoteOn"];
local v43 = l_Images_0["icons/controls/emoteOff"];
local v44 = v7.PureComponent:extend("MoreMenu");
v44.validateProps = v9.strictInterface({
    layoutOrder = v9.integer, 
    moreMenuOpen = v9.boolean, 
    setMoreMenuOpen = v9.callback, 
    screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else v9.Vector2, 
    isSmallTouchDevice = v9.boolean, 
    topBarEnabled = v9.boolean, 
    leaderboardEnabled = v9.boolean, 
    emotesEnabled = v9.boolean, 
    backpackEnabled = if v41 then nil else v9.boolean, 
    leaderboardOpen = v9.boolean, 
    backpackOpen = v9.boolean, 
    emotesOpen = v9.boolean, 
    setKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else v9.callback, 
    removeKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else v9.callback
});
v44.init = function(v45) --[[ Line: 108 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v26 (copy), v22 (copy), v11 (copy), v12 (copy), v41 (copy), l_StarterGui_0 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v23 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy)
    v45.rootRef = v7.createRef();
    if v26 then
        v45.analytics = v22.default;
    end;
    v45.disposeUiScaleEffect = v11.createEffect(function(v46) --[[ Line: 113 ]]
        -- upvalues: v12 (ref), v45 (copy)
        local v47 = v12.GetDisplayStore(v46);
        v45:setState({
            UiScale = v47.getUIScale(v46)
        });
    end);
    if v41 then
        v45:setState({
            mountBackpack = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack), 
            vrShowMenuIcon = false
        });
        l_StarterGui_0.CoreGuiChangedSignal:Connect(function(v48, v49) --[[ Line: 126 ]]
            -- upvalues: v45 (copy)
            if v48 == Enum.CoreGuiType.Backpack or v48 == Enum.CoreGuiType.All then
                v45:setState({
                    mountBackpack = v49
                });
            end;
        end);
    else
        v45:setState({
            vrShowMenuIcon = false
        });
    end;
    v45.chatWasHidden = false;
    v45.boundAction = false;
    v45.moreButtonActivated = function() --[[ Line: 143 ]]
        -- upvalues: v45 (copy)
        v45.props.setMoreMenuOpen(not v45.props.moreMenuOpen);
        if v45.analytics then
            v45.analytics:onMoreMenuActivated();
        end;
    end;
    if l_FFlagTopBarSignalizeKeepOutAreas_0 then
        v45.keepOutAreasStore = v23.Stores.GetKeepOutAreasStore(false);
    end;
    if l_FFlagTopBarSignalizeScreenSize_0 then
        local l_getViewportSize_0 = v12.GetDisplayStore(false).getViewportSize;
        v45.disposeScreenSize = v11.createEffect(function(v51) --[[ Line: 157 ]]
            -- upvalues: v45 (copy), l_getViewportSize_0 (copy)
            v45:setState({
                screenSize = l_getViewportSize_0(v51)
            });
        end);
    end;
end;
v44.willUnmount = function(v52) --[[ Line: 165 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagTopBarSignalizeScreenSize_0 (copy)
    if l_FFlagTopBarSignalizeScreenSize_0 then
        v52.disposeScreenSize();
    end;
    if v52.disposeUiScaleEffect then
        v52.disposeUiScaleEffect();
    end;
end;
v44.renderWithStyle = function(v53, v54) --[[ Line: 174 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v39 (copy), l_VRService_0 (copy), l_RobloxGui_0 (copy), v37 (copy), v42 (copy), v43 (copy), v38 (copy), v34 (copy), v36 (copy), v41 (copy), v35 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy), v32 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v27 (copy), v7 (copy), v29 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy), l_ExternalEventConnection_0 (copy), l_VRHub_0 (copy)
    local v55 = {};
    local v56 = false;
    if v53.props.leaderboardEnabled then
        local v57 = "rbxasset://textures/ui/TopBar/leaderboardOn.png";
        if not v53.props.leaderboardOpen then
            v57 = "rbxasset://textures/ui/TopBar/leaderboardOff.png";
        end;
        table.insert(v55, {
            icon = v57, 
            text = v39:FormatByKey("CoreScripts.TopBar.Leaderboard"), 
            onActivated = function() --[[ Line: 187 ]] --[[ Name: onActivated ]]
                -- upvalues: v53 (copy), l_VRService_0 (ref), l_RobloxGui_0 (ref), v37 (ref)
                local l_leaderboardOpen_0 = v53.props.leaderboardOpen;
                if l_VRService_0.VREnabled then
                    require(l_RobloxGui_0.Modules.InGameMenu).openPlayersPage();
                else
                    v37:SetVisibility(not v37:GetSetVisible());
                    v53.props.setMoreMenuOpen(false);
                end;
                if v53.analytics then
                    v53.analytics:onLeaderboardActivated(not l_leaderboardOpen_0);
                end;
            end
        });
        v56 = true;
    end;
    if v53.props.emotesEnabled then
        local l_v42_0 = v42;
        if not v53.props.emotesOpen then
            l_v42_0 = v43;
        end;
        local _ = v38.EmoteMenuOpenKey;
        table.insert(v55, {
            icon = l_v42_0, 
            text = v39:FormatByKey("CoreScripts.TopBar.Emotes"), 
            onActivated = function() --[[ Line: 215 ]] --[[ Name: onActivated ]]
                -- upvalues: v34 (ref), v53 (copy), v36 (ref)
                if v34:isOpen() then
                    v34:close();
                else
                    if v53.chatWasHidden then
                        v36:SetVisible(true);
                        v53.chatWasHidden = false;
                    end;
                    v34:open();
                end;
                v53.props.setMoreMenuOpen(false);
                if v53.analytics then
                    v53.analytics:onEmotesActivated(v34:isOpen());
                end;
            end
        });
        v56 = true;
    end;
    local _ = nil;
    if if v41 then v53.state.mountBackpack else v53.props.backpackEnabled then
        local v62 = "rbxasset://textures/ui/TopBar/inventoryOn.png";
        if not v53.props.backpackOpen then
            v62 = "rbxasset://textures/ui/TopBar/inventoryOff.png";
        end;
        table.insert(v55, {
            icon = v62, 
            text = v39:FormatByKey("CoreScripts.TopBar.Inventory"), 
            onActivated = function() --[[ Line: 250 ]] --[[ Name: onActivated ]]
                -- upvalues: v35 (ref), v53 (copy)
                v35:OpenClose();
                v53.props.setMoreMenuOpen(false);
                if v53.analytics then
                    v53.analytics:onInventoryActivated(v35.IsOpen);
                end;
            end
        });
        v56 = true;
    end;
    local v63 = if l_FFlagTopBarSignalizeScreenSize_0 then v53.state.screenSize else v53.props.screenSize;
    local v64 = UDim2.new(0, 324, 0, v63.Y);
    if v63.X < 450 then
        v64 = UDim2.new(0, v63.X - 24, 0, v63.Y);
    end;
    local v65 = "rbxasset://textures/ui/TopBar/moreOn.png";
    if not v53.props.moreMenuOpen then
        v65 = "rbxasset://textures/ui/TopBar/moreOff.png";
    end;
    local v66 = not v32:IsEnabled() and v53.props.topBarEnabled and v56 and not l_VRService_0.VREnabled;
    local function v68(v67) --[[ Line: 278 ]]
        -- upvalues: v66 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (ref), v53 (copy), v27 (ref)
        if v66 and v67 then
            if l_FFlagTopBarSignalizeKeepOutAreas_0 then
                v53.keepOutAreasStore.setKeepOutArea(v27.MoreMenuKeepOutAreaId, v67.AbsolutePosition, v67.AbsoluteSize);
                return;
            else
                v53.props.setKeepOutArea(v27.MoreMenuKeepOutAreaId, v67.AbsolutePosition, v67.AbsoluteSize);
                return;
            end;
        elseif l_FFlagTopBarSignalizeKeepOutAreas_0 then
            v53.keepOutAreasStore.removeKeepOutArea(v27.MoreMenuKeepOutAreaId);
            return;
        else
            v53.props.removeKeepOutArea(v27.MoreMenuKeepOutAreaId);
            return;
        end;
    end;
    if v53.rootRef.current then
        v68(v53.rootRef.current);
    end;
    return v7.createElement("Frame", {
        Visible = v66, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 32, 1, 0), 
        LayoutOrder = v53.props.layoutOrder, 
        [v7.Change.AbsoluteSize] = v68, 
        [v7.Change.AbsolutePosition] = v68, 
        [v7.Ref] = v53.rootRef
    }, {
        OpenButton = v7.createElement(v29, {
            icon = v65, 
            iconSize = 24, 
            onActivated = v53.moreButtonActivated
        }), 
        MoreMenuContainer = v7.createElement("Frame", {
            ZIndex = 3, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(1, 12, 0, 0), 
            Size = v64, 
            AnchorPoint = Vector2.new(1, 0)
        }, {
            ContextualMenu = v7.createElement(l_ContextualMenu_0, {
                buttonProps = v55, 
                open = v53.props.moreMenuOpen, 
                menuDirection = l_MenuDirection_0.Down, 
                openPositionY = UDim.new(0, v27.TopBarHeight * v53.state.UiScale + 12), 
                background = v54.Theme.BackgroundUIContrast, 
                closeBackgroundVisible = false, 
                screenSize = v63, 
                onDismiss = function() --[[ Line: 332 ]] --[[ Name: onDismiss ]]
                    -- upvalues: v53 (copy), v37 (ref)
                    v53.props.setMoreMenuOpen(false);
                    v37:SetMinimized(false);
                end
            })
        }), 
        ShowTopBarListener = v7.createElement(l_ExternalEventConnection_0, {
            event = l_VRHub_0.ShowTopBarChanged.Event, 
            callback = function() --[[ Line: 340 ]] --[[ Name: callback ]]
                -- upvalues: v53 (copy), l_VRService_0 (ref), l_VRHub_0 (ref), v56 (ref)
                v53:setState({
                    vrShowMenuIcon = l_VRService_0.VREnabled and l_VRHub_0.ShowTopBar and v56
                });
            end
        })
    });
end;
v44.render = function(v69) --[[ Line: 349 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v70) --[[ Line: 350 ]]
        -- upvalues: v69 (copy)
        return v69:renderWithStyle(v70);
    end);
end;
v44.updateActionBound = function(v71) --[[ Line: 355 ]] --[[ Name: updateActionBound ]]
    -- upvalues: l_ContextActionService_0 (copy)
    if v71.props.moreMenuOpen then
        l_ContextActionService_0:BindCoreAction("CloseMoreMenuAction", function(_, v73, _) --[[ Line: 357 ]]
            -- upvalues: v71 (copy)
            if v73 == Enum.UserInputState.Begin then
                v71.props.setMoreMenuOpen(false);
                return Enum.ContextActionResult.Sink;
            else
                return Enum.ContextActionResult.Pass;
            end;
        end, false, Enum.KeyCode.Escape);
        v71.boundAction = true;
        return;
    else
        if v71.boundAction then
            l_ContextActionService_0:UnbindCoreAction("CloseMoreMenuAction");
            v71.boundAction = false;
        end;
        return;
    end;
end;
v44.didUpdate = function(v75, v76, _) --[[ Line: 373 ]] --[[ Name: didUpdate ]]
    -- upvalues: v37 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy), v36 (copy)
    if v75.props.moreMenuOpen ~= v76.moreMenuOpen then
        v37:SetMinimized(v75.props.moreMenuOpen);
        v75:updateActionBound();
        if (if l_FFlagTopBarSignalizeScreenSize_0 then v75.state.screenSize else v75.props.screenSize).X < 600 then
            if v75.props.moreMenuOpen and v36:GetVisibility() then
                v75.chatWasHidden = true;
                v36:SetVisible(false);
                return;
            elseif not v75.props.moreMenuOpen and v75.chatWasHidden then
                v36:SetVisible(true);
                v75.chatWasHidden = false;
            end;
        end;
    end;
end;
return v8.UNSTABLE_connect2(function(v78) --[[ Line: 394 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagTopBarSignalizeScreenSize_0 (copy), v41 (copy)
    return {
        screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else v78.displayOptions.screenSize, 
        moreMenuOpen = v78.moreMenu.open, 
        isSmallTouchDevice = v78.displayOptions.isSmallTouchDevice, 
        topBarEnabled = v78.displayOptions.topbarEnabled, 
        leaderboardEnabled = v78.coreGuiEnabled[Enum.CoreGuiType.PlayerList], 
        emotesEnabled = v78.moreMenu.emotesEnabled and v78.coreGuiEnabled[Enum.CoreGuiType.EmotesMenu], 
        backpackEnabled = if v41 then nil else v78.coreGuiEnabled[Enum.CoreGuiType.Backpack], 
        leaderboardOpen = v78.moreMenu.leaderboardOpen, 
        backpackOpen = v78.moreMenu.backpackOpen, 
        emotesOpen = v78.moreMenu.emotesOpen
    };
end, function(v79) --[[ Line: 412 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v21 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v19 (copy), v20 (copy)
    return {
        setMoreMenuOpen = function(v80) --[[ Line: 414 ]] --[[ Name: setMoreMenuOpen ]]
            -- upvalues: v79 (copy), v21 (ref)
            return v79(v21(v80));
        end, 
        setKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else function(v81, v82, v83) --[[ Line: 419 ]]
            -- upvalues: v79 (copy), v19 (ref)
            return v79(v19(v81, v82, v83));
        end, 
        removeKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else function(v84) --[[ Line: 424 ]]
            -- upvalues: v79 (copy), v20 (ref)
            return v79(v20(v84));
        end
    };
end)(v44);