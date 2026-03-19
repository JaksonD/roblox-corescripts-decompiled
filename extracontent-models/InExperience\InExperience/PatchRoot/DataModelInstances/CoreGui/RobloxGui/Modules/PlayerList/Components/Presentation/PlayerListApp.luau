local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.Signals);
local v7 = require(l_CorePackages_0.Packages.SignalsReact);
local v8 = require(l_CorePackages_0.Packages.Otter);
local v9 = require(l_CorePackages_0.Packages.Cryo);
local v10 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local _ = require(l_CorePackages_0.Workspace.Packages.LeaderboardStore);
local v12 = require(l_CorePackages_0.Workspace.Packages.Display);
local v13 = require(l_RobloxGui_0.Modules.Stats.StatsUtils);
local l_Parent_0 = script.Parent;
local l_PresentationCommon_0 = l_Parent_0.Parent.PresentationCommon;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_useLeaderboardStore_0 = v10.Hooks.useLeaderboardStore;
local v18 = require(l_Parent_1.Flags.FFlagPlayerListClosedNoRender);
local v19 = require(l_Parent_1.Flags.FFlagPlayerListClosedNoRenderWithTenFoot);
local v20 = require(l_Parent_0.PlayerListSorter);
local v21 = require(l_Parent_1.Components.Container.PlayerEntryContainer);
local v22 = require(l_Parent_1.Components.Container.PlayerListDisplayContainer);
local v23 = require(l_Parent_0.PlayerEntry);
local v24 = require(l_PresentationCommon_0.TenFootSideBar);
local l_Connection_0 = l_Parent_1.Components.Connection;
local v26 = require(l_Connection_0.EventConnections);
local v27 = require(l_Connection_0.ContextActionsBinder);
local v28 = require(l_Connection_0.TopStatConnector);
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v30 = require(l_Parent_1.Flags.FFlagPlayerListReduceRerenders);
local l_FFlagUseNewPlayerList_0 = v10.Flags.FFlagUseNewPlayerList;
local l_FFlagAddNewPlayerListFocusNav_0 = v10.Flags.FFlagAddNewPlayerListFocusNav;
local v33 = {
    dampingRatio = 1, 
    frequency = 7
};
local v34 = v4.PureComponent:extend("PlayerListApp");
local _ = function(v35) --[[ Line: 60 ]] --[[ Name: shouldShowNeutralTeam ]]
    for _, v37 in ipairs(v35) do
        if v37.Team == nil then
            return true;
        end;
    end;
    return false;
end;
local function v49(v39, v40) --[[ Line: 69 ]] --[[ Name: getTeamCount ]]
    local v41 = false;
    local v42 = {};
    local v43 = 0;
    for _, v45 in pairs(v39) do
        if not v42[v45.TeamColor.Number] then
            v42[v45.TeamColor.Number] = true;
            v43 = v43 + 1;
        end;
    end;
    if v43 > 0 then
        local v46;
        for _, v48 in ipairs(v40) do
            if v48.Team == nil then
                v46 = true;
                v41 = true;
            end;
            if v41 then
                break;
            end;
        end;
        if not v41 then
            v46 = false;
        end;
        v41 = false;
        if v46 then
            v43 = v43 + 1;
        end;
    end;
    return v43;
end;
v34.init = function(v50) --[[ Line: 84 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v8 (copy), v6 (copy), v12 (copy)
    v50.state = {
        visible = true
    };
    local v51, v52 = v4.createBinding(UDim2.new(0, 0, 0, 0));
    v50.positionOffset = v51;
    v50.updatePositionOffset = v52;
    v50.positionMotor = v8.createSingleMotor(0);
    v50.positionMotor:onStep(function(v53) --[[ Line: 92 ]]
        -- upvalues: v50 (copy)
        v50.updatePositionOffset(UDim2.new(v53, 0, 0, 0));
    end);
    v50.positionMotor:onComplete(function(_) --[[ Line: 95 ]]
        -- upvalues: v50 (copy)
        if not v50.props.displayOptions.isVisible then
            v50:setState({
                visible = false
            });
        end;
    end);
    v50.disposeUiScaleEffect = v6.createEffect(function(v55) --[[ Line: 102 ]]
        -- upvalues: v12 (ref), v50 (copy)
        local v56 = v12.GetDisplayStore(v55);
        v50:setState({
            UiScale = v56.getUIScale(v55)
        });
    end);
end;
v34.render = function(v57) --[[ Line: 110 ]] --[[ Name: render ]]
    -- upvalues: v18 (copy), v19 (copy), v4 (copy), v27 (copy), l_FFlagAddNewPlayerListFocusNav_0 (copy), v26 (copy), l_WithLayoutValues_0 (copy), v13 (copy), l_FFlagUseNewPlayerList_0 (copy), l_Players_0 (copy), v49 (copy), v30 (copy), v21 (copy), v23 (copy), v22 (copy), v20 (copy), v28 (copy), v24 (copy)
    if (v18 or v19) and not v57.state.visible then
        return v4.createFragment({
            v4.createElement(v27), 
            if l_FFlagAddNewPlayerListFocusNav_0 then v4.createElement(v26) else nil
        });
    else
        return l_WithLayoutValues_0(function(v58) --[[ Line: 118 ]]
            -- upvalues: v57 (copy), v13 (ref), l_FFlagUseNewPlayerList_0 (ref), l_Players_0 (ref), v49 (ref), v30 (ref), v4 (ref), v21 (ref), v23 (ref), v22 (ref), v20 (ref), l_FFlagAddNewPlayerListFocusNav_0 (ref), v26 (ref), v27 (ref), v28 (ref), v24 (ref)
            local l_ContainerPosition_0 = v58.ContainerPosition;
            local l_ContainerSize_0 = v58.ContainerSize;
            local l_AnchorPoint_0 = v58.AnchorPoint;
            if not v58.IsTenFoot and v57.props.displayOptions.performanceStatsVisible then
                l_ContainerPosition_0 = l_ContainerPosition_0 + UDim2.fromOffset(0, v13.ButtonHeight);
            end;
            l_ContainerPosition_0 = l_ContainerPosition_0 + UDim2.fromOffset(0, v58.TopBarOffset * v57.state.UiScale);
            local l_MaxLeaderstats_0 = v58.MaxLeaderstats;
            if v57.props.displayOptions.isSmallTouchDevice then
                l_MaxLeaderstats_0 = v58.MaxLeaderstatsSmallScreen;
            end;
            local v63 = 0;
            v63 = if l_FFlagUseNewPlayerList_0 then math.min(v57.props.gameStatsCount, l_MaxLeaderstats_0) else math.min(#v57.props.gameStats, l_MaxLeaderstats_0);
            if v63 > 0 then
                local v64 = v58.StatEntrySizeX + v58.EntryPadding;
                l_ContainerSize_0 = l_ContainerSize_0 + UDim2.new(0, v64 * v63, 0, 0);
            end;
            local v65 = nil;
            if v58.IsTenFoot then
                v65 = v58.EntrySizeX;
            else
                v65 = v58.EntryBaseSizeX + math.min(4, v63) * v58.EntrySizeIncreasePerStat;
                l_ContainerSize_0 = l_ContainerSize_0 + UDim2.new(0, v58.ExtraContainerPadding, 0, 0);
                local v66 = v58.PlayerDropDownSizeX + v58.PlayerDropDownOffset;
                local v67 = l_ContainerSize_0.X.Offset + v58.ContainerPadding * 2 + v66;
                if v57.props.screenSizeX - v67 < v65 then
                    v65 = v57.props.screenSizeX - v67;
                end;
                l_ContainerSize_0 = l_ContainerSize_0 + UDim2.new(0, v65, 0, 0);
            end;
            local v68 = 1e999;
            local v69 = false;
            if l_Players_0.MaxPlayers >= 6 then
                v69 = l_Players_0.MaxPlayers <= 12;
            end;
            if v69 then
                v68 = l_Players_0.MaxPlayers * 26 + v49(v57.props.teams, v57.props.players) * 20;
            end;
            local v70 = {};
            if v58.IsTenFoot then
                local v71 = nil;
                if v30 then
                    v71 = {};
                    for _, v73 in v57.props.gameStats do
                        table.insert(v71, v73.name);
                    end;
                end;
                for _, v75 in ipairs(v57.props.players) do
                    if v75 == l_Players_0.LocalPlayer then
                        v70.TitlePlayerEntry = v4.createElement("Frame", {
                            Position = UDim2.fromOffset(0, 0), 
                            Size = UDim2.new(1, v58.EntryXOffset, 0, v58.PlayerEntrySizeY), 
                            BackgroundTransparency = 1
                        }, {
                            PlayerEntry = if l_FFlagUseNewPlayerList_0 then v4.createElement(v21, {
                                entrySizeX = v65, 
                                titlePlayerEntry = true, 
                                player = v75, 
                                playerIconInfo = v57.props.playerIconInfo[v75.UserId], 
                                playerRelationship = v57.props.playerRelationship[v75.UserId]
                            }) else v4.createElement(v23, {
                                player = v75, 
                                playerStats = v57.props.playerStats[v75.UserId], 
                                playerIconInfo = v57.props.playerIconInfo[v75.UserId], 
                                playerRelationship = v57.props.playerRelationship[v75.UserId], 
                                titlePlayerEntry = true, 
                                hasDivider = false, 
                                gameStats = if v30 then nil else v57.props.gameStats, 
                                gameStatNames = v71, 
                                entrySize = v65
                            })
                        });
                        break;
                    end;
                end;
            end;
            v70.PlayerScrollList = v4.createElement(if l_FFlagUseNewPlayerList_0 then v22 else v20, {
                screenSizeY = v57.props.screenSizeY, 
                entrySize = v65, 
                isVisible = if l_FFlagAddNewPlayerListFocusNav_0 then v57.state.visible else nil
            });
            v70.EventConnections = v4.createElement(v26);
            v70.ContextActionsBindings = v4.createElement(v27);
            v70.TopStatConnector = v4.createElement(v28);
            if v57.props.displayOptions.isTenFootInterface then
                v70.TenFootSideBar = v4.createElement(v24);
            end;
            return v4.createElement("Frame", {
                Position = l_ContainerPosition_0, 
                AnchorPoint = l_AnchorPoint_0, 
                Size = l_ContainerSize_0, 
                BackgroundTransparency = 1, 
                Visible = v57.state.visible, 
                ZIndex = v58.IsTenFoot and 2 or 1, 
                AutoLocalize = false, 
                [v4.Ref] = v57.rootRef
            }, {
                OffsetFrame = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Position = v57.positionOffset, 
                    BackgroundTransparency = 1
                }, v70), 
                UISizeConstraint = v4.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, 0), 
                    MaxSize = Vector2.new(1e999, v68)
                }) or nil
            });
        end);
    end;
end;
v34.didMount = function(v76) --[[ Line: 253 ]] --[[ Name: didMount ]]
    v76:setState({
        visible = v76.props.displayOptions.isVisible
    });
end;
v34.didUpdate = function(v77, v78, _) --[[ Line: 259 ]] --[[ Name: didUpdate ]]
    -- upvalues: v8 (copy), v33 (copy)
    if v77.props.displayOptions.isVisible ~= v78.displayOptions.isVisible then
        if v77.props.displayOptions.isTenFootInterface then
            v77:setState({
                visible = v77.props.displayOptions.isVisible
            });
            return;
        elseif v77.props.displayOptions.isVisible then
            v77:setState({
                visible = true
            });
            v77.positionMotor:setGoal(v8.instant(0.2));
            v77.positionMotor:step(0);
            v77.positionMotor:setGoal(v8.spring(0, v33));
            return;
        else
            v77.positionMotor:setGoal(v8.spring(1.1, v33));
        end;
    end;
end;
v34.willUnmount = function(v80) --[[ Line: 280 ]] --[[ Name: willUnmount ]]
    v80.positionMotor:destroy();
    v80.positionMotor = nil;
    if v80.disposeUiScaleEffect then
        v80.disposeUiScaleEffect();
    end;
end;
local function v82(v81) --[[ Line: 289 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSizeX = v81.screenSize.X, 
        screenSizeY = v81.screenSize.Y, 
        displayOptions = v81.displayOptions, 
        players = v81.players, 
        playerStats = v81.playerStats, 
        playerIconInfo = v81.playerIconInfo, 
        playerRelationship = v81.playerRelationship, 
        gameStats = v81.gameStats, 
        teams = v81.teams
    };
end;
local function v88(v83) --[[ Line: 305 ]] --[[ Name: PlayerListAppWithLeaderboardStore ]]
    -- upvalues: l_useLeaderboardStore_0 (copy), v6 (copy), v7 (copy), v4 (copy), v34 (copy), v9 (copy)
    local v84 = l_useLeaderboardStore_0();
    local v86 = v6.createComputed(function(v85) --[[ Line: 308 ]]
        -- upvalues: v84 (copy), v83 (copy)
        if v84 then
            return (v84.getGameStatsList().getCount(v85));
        else
            return #v83.gameStats;
        end;
    end);
    local v87 = v7.useSignalState(v86);
    return v4.createElement(v34, v9.Dictionary.join(v83, {
        gameStatsCount = v87
    }));
end;
if l_FFlagUseNewPlayerList_0 then
    return v5.connect(v82, nil)(v88);
else
    return v5.UNSTABLE_connect2(v82, nil)(v34);
end;