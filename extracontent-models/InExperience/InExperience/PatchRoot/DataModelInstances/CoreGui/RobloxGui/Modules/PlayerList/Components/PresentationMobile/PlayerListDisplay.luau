local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local v8 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = v7.Style.withStyle;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v11 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_0.Parent.Parent;
local l_Connection_0 = l_Parent_1.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v17 = require(script.Parent.PlayerEntry);
local v18 = require(script.Parent.TeamEntry);
local v19 = require(script.Parent.TitleBar);
local v20 = require(l_Parent_2.Flags.FFlagPlayerListReduceRerenders);
local v21 = require(l_Parent_2.Flags.FFlagPlayerListFixMobileScrolling);
local v22 = require(l_Parent_2.GetFakeNeutralTeam);
local v23 = v5.PureComponent:extend("PlayerListDisplay");
v23.validateProps = v8.strictInterface({
    isVisible = v8.boolean, 
    isMinimized = v8.boolean, 
    isTenFootInterface = v8.boolean, 
    isUsingGamepad = v8.boolean, 
    screenSizeY = v8.integer, 
    entrySize = v8.integer, 
    sortedPlayers = v8.array(v11), 
    sortedTeams = v8.optional(v8.any), 
    teamColorToPlayerMap = v8.optional(v8.map(v8.integer, v8.array(v11))), 
    teamScores = v8.optional(v8.map(v8.instanceIsA("Team"), v8.map(v8.string, v8.any))), 
    teamNames = v8.map(v8.instanceIsA("Team"), v8.string), 
    teamColors = v8.map(v8.instanceIsA("Team"), v8.BrickColor), 
    playerTeam = v8.map(v8.integer, v8.instanceIsA("Team")), 
    playerStats = v8.map(v8.integer, v8.map(v8.string, v8.any)), 
    gameStats = v8.array(v8.strictInterface({
        name = v8.string, 
        text = v8.string, 
        addId = v8.integer, 
        serverAddId = v8.integer, 
        isPrimary = v8.boolean, 
        priority = v8.number
    })), 
    playerIconInfo = v8.map(v8.integer, v8.strictInterface({
        isPlaceOwner = v8.boolean, 
        avatarIcon = v8.optional(v8.table), 
        specialGroupIcon = v8.optional(v8.table)
    })), 
    playerRelationship = v8.map(v8.integer, v8.strictInterface({
        isBlocked = v8.boolean, 
        friendStatus = v8.enum(Enum.FriendStatus), 
        isFollowing = v8.boolean, 
        isFollower = v8.boolean
    })), 
    dropDownPlayer = v8.optional(v11), 
    dropDownVisible = v8.boolean
});
v23.init = function(v24) --[[ Line: 92 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v24.scrollingFrameRef = v5.createRef();
    v24.firstPlayerRef = v5.createRef();
    v24.state = {
        lastCanvasPosition = Vector2.new(0, 0), 
        containerSizeY = 100, 
        contentsVisible = true
    };
    v24.absoluteSizeChanged = function(v25) --[[ Line: 102 ]]
        -- upvalues: v24 (copy)
        v24:setState({
            containerSizeY = v25.AbsoluteSize.Y
        });
    end;
    v24.canvasPositionChanged = function(v26) --[[ Line: 108 ]]
        -- upvalues: v24 (copy)
        v24:setState({
            lastCanvasPosition = v26.CanvasPosition
        });
    end;
end;
v23.getShowTitlePlayer = function(v27) --[[ Line: 115 ]] --[[ Name: getShowTitlePlayer ]]
    local v28 = v27.props.sortedPlayers and #v27.props.sortedPlayers > 1 or false;
    local v29 = v27.props.sortedTeams and #v27.props.sortedTeams > 0 or false;
    local v30 = #v27.props.gameStats > 0;
    return v28 or v29 or v30;
end;
v23.inVerticalScrollWindow = function(v31, v32, v33) --[[ Line: 122 ]] --[[ Name: inVerticalScrollWindow ]]
    if v32 + v33 + v33 * 3 < v31.state.lastCanvasPosition.Y then
        return false;
    elseif v32 - v33 * 3 > v31.state.lastCanvasPosition.Y + v31.state.containerSizeY then
        return false;
    else
        return true;
    end;
end;
v23.isPastEndOfContent = function(v34, v35, v36) --[[ Line: 136 ]] --[[ Name: isPastEndOfContent ]]
    if v35 - v36 * 3 > v34.state.lastCanvasPosition.Y + v34.state.containerSizeY then
        return true;
    else
        return false;
    end;
end;
v23.render = function(v37) --[[ Line: 145 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v20 (copy), v5 (copy), v17 (copy), l_LocalPlayer_0 (copy), v19 (copy), v22 (copy), v18 (copy), v21 (copy)
    return l_WithLayoutValues_0(function(v38) --[[ Line: 146 ]]
        -- upvalues: l_withStyle_0 (ref), v20 (ref), v37 (copy), v5 (ref), v17 (ref), l_LocalPlayer_0 (ref), v19 (ref), v22 (ref), v18 (ref), v21 (ref)
        return l_withStyle_0(function(_) --[[ Line: 147 ]]
            -- upvalues: v38 (copy), v20 (ref), v37 (ref), v5 (ref), v17 (ref), l_LocalPlayer_0 (ref), v19 (ref), v22 (ref), v18 (ref), v21 (ref)
            local l_EntryPadding_0 = v38.EntryPadding;
            local l_TeamEntrySizeY_0 = v38.TeamEntrySizeY;
            local l_PlayerEntrySizeY_0 = v38.PlayerEntrySizeY;
            local v43 = 0;
            local function _() --[[ Line: 153 ]] --[[ Name: getLayoutOrder ]]
                -- upvalues: v43 (ref)
                v43 = v43 + 1;
                return v43;
            end;
            local v45 = {};
            local v46 = 0;
            local v47 = nil;
            if v20 then
                v47 = {};
                for _, v49 in v37.props.gameStats do
                    table.insert(v47, v49.name);
                end;
            end;
            if v37:getShowTitlePlayer() then
                v45.TitlePlayer = v5.createElement(v17, {
                    player = l_LocalPlayer_0, 
                    playerStats = v37.props.playerStats[l_LocalPlayer_0.UserId] or {}, 
                    playerIconInfo = v37.props.playerIconInfo[l_LocalPlayer_0.UserId] or {
                        isPlaceOwner = false
                    }, 
                    playerRelationship = v37.props.playerRelationship[l_LocalPlayer_0.UserId] or {
                        isBlocked = false, 
                        friendStatus = Enum.FriendStatus.NotFriend, 
                        isFollowing = false, 
                        isFollower = false
                    }, 
                    titlePlayerEntry = true, 
                    gameStats = if v20 then nil else v37.props.gameStats, 
                    gameStatNames = v47, 
                    entrySize = v37.props.entrySize, 
                    topDiv = false, 
                    bottomDiv = true, 
                    Position = UDim2.fromOffset(0, v46)
                });
                v46 = v46 + (l_PlayerEntrySizeY_0 + l_EntryPadding_0);
            end;
            v45.TitleBar = v5.createElement(v19, {
                contentsVisible = v37.state.contentsVisible, 
                gameStats = v37.props.gameStats, 
                Size = UDim2.new(1, 0, 0, 24), 
                entrySize = v37.props.entrySize, 
                Position = UDim2.fromOffset(0, v46), 
                isSmallTouchDevice = true
            });
            v46 = v46 + (l_TeamEntrySizeY_0 + l_EntryPadding_0);
            local l_v46_0 = v46;
            if v37.props.sortedTeams then
                local v51 = true;
                for v52, v53 in ipairs(v37.props.sortedTeams) do
                    local v54 = nil;
                    if v53.team == v22 then
                        v54 = {};
                        for _, v56 in ipairs(v37.props.sortedPlayers) do
                            if v37.props.playerTeam[v56.UserId] == nil then
                                table.insert(v54, v56);
                            end;
                        end;
                    else
                        v54 = v37.props.teamColorToPlayerMap[v53.team.TeamColor.Number] or {};
                    end;
                    l_v46_0 = l_v46_0 + (l_TeamEntrySizeY_0 + (l_PlayerEntrySizeY_0 + l_EntryPadding_0) * #v54);
                    if v37:inVerticalScrollWindow(v46, l_TeamEntrySizeY_0) then
                        local v57 = "Team_" .. tostring(v52);
                        local l_createElement_0 = v5.createElement;
                        local l_v18_0 = v18;
                        local v60 = {
                            teamName = v37.props.teamNames[v53.team], 
                            teamColor = v37.props.teamColors[v53.team], 
                            leaderstats = v37.props.teamScores[v53.team], 
                            gameStats = if v20 then nil else v37.props.gameStats, 
                            gameStatNames = v47, 
                            entrySize = v37.props.entrySize
                        };
                        v43 = v43 + 1;
                        v60.layoutOrder = v43;
                        v60.Position = UDim2.fromOffset(0, v46);
                        v45[v57] = l_createElement_0(l_v18_0, v60);
                    end;
                    v46 = v46 + (l_TeamEntrySizeY_0 + l_EntryPadding_0);
                    for v61, v62 in ipairs(v54) do
                        if v51 or not v37:isPastEndOfContent(v46, l_TeamEntrySizeY_0) then
                            if v51 or v37:inVerticalScrollWindow(v46, l_PlayerEntrySizeY_0) then
                                local l_UserId_0 = v62.UserId;
                                v45["Player_" .. tostring(v62.UserId)] = v5.createElement(v17, {
                                    player = v62, 
                                    playerStats = v37.props.playerStats[l_UserId_0], 
                                    playerIconInfo = v37.props.playerIconInfo[l_UserId_0], 
                                    playerRelationship = v37.props.playerRelationship[l_UserId_0], 
                                    titlePlayerEntry = false, 
                                    gameStats = if v20 then nil else v37.props.gameStats, 
                                    gameStatNames = v47, 
                                    topDiv = true, 
                                    bottomDiv = v61 == #v54, 
                                    entrySize = v37.props.entrySize, 
                                    Position = UDim2.fromOffset(0, v46), 
                                    [v5.Ref] = v51 and v37.firstPlayerRef or nil
                                });
                                v51 = false;
                            end;
                            v46 = v46 + (l_PlayerEntrySizeY_0 + l_EntryPadding_0);
                        else
                            break;
                        end;
                    end;
                end;
            else
                l_v46_0 = l_v46_0 + (l_PlayerEntrySizeY_0 + l_EntryPadding_0) * #v37.props.sortedPlayers;
                for v64, v65 in ipairs(v37.props.sortedPlayers) do
                    if v64 == 1 or not v37:isPastEndOfContent(v46, l_PlayerEntrySizeY_0) then
                        if v64 == 1 or v37:inVerticalScrollWindow(v46, l_PlayerEntrySizeY_0) then
                            local l_UserId_1 = v65.UserId;
                            local v67 = "Player_" .. tostring(l_UserId_1);
                            local l_createElement_1 = v5.createElement;
                            local l_v17_0 = v17;
                            local v70 = {
                                player = v65, 
                                playerStats = v37.props.playerStats[l_UserId_1], 
                                playerIconInfo = v37.props.playerIconInfo[l_UserId_1], 
                                playerRelationship = v37.props.playerRelationship[l_UserId_1], 
                                titlePlayerEntry = false, 
                                gameStats = if v20 then nil else v37.props.gameStats, 
                                gameStatNames = v47, 
                                entrySize = v37.props.entrySize
                            };
                            v43 = v43 + 1;
                            v70.layoutOrder = v43;
                            v70.topDiv = true;
                            v70.bottomDiv = false;
                            v70.Position = UDim2.fromOffset(0, v46);
                            v70[v5.Ref] = v64 == 1 and v37.firstPlayerRef or nil;
                            v45[v67] = l_createElement_1(l_v17_0, v70);
                        end;
                        v46 = v46 + (l_PlayerEntrySizeY_0 + l_EntryPadding_0);
                    else
                        break;
                    end;
                end;
            end;
            local v71 = 1e999;
            if #v37.props.gameStats > 0 then
                v71 = v71 - v38.TitleBarSizeY;
            end;
            local v72 = true;
            if not v21 then
                v72 = not v37.props.dropDownVisible;
            end;
            return v5.createElement("ScrollingFrame", {
                Active = v21, 
                Size = UDim2.fromScale(1, 1), 
                CanvasSize = UDim2.fromOffset(0, l_v46_0), 
                BackgroundTransparency = 1, 
                ScrollBarImageColor3 = v38.ScrollImageColor, 
                ScrollBarImageTransparency = v38.ScrollImageTransparency, 
                BorderSizePixel = 0, 
                ScrollBarThickness = v38.ScrollBarSizeMobile, 
                VerticalScrollBarInset = Enum.ScrollBarInset.None, 
                HorizontalScrollBarInset = Enum.ScrollBarInset.None, 
                ClipsDescendants = true, 
                ScrollingEnabled = v72, 
                ElasticBehavior = Enum.ElasticBehavior.Never, 
                Selectable = false, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                [v5.Change.CanvasPosition] = v37.canvasPositionChanged, 
                [v5.Change.AbsoluteSize] = v37.absoluteSizeChanged
            }, v45);
        end);
    end);
end;
v23.didUpdate = function(v73, v74) --[[ Line: 327 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GuiService_0 (copy), l_UserInputService_0 (copy)
    if v73.props.isVisible ~= v74.isVisible then
        if v73.props.isVisible then
            if v73.props.isTenFootInterface and v73.props.isUsingGamepad then
                l_GuiService_0.SelectedCoreObject = v73.firstPlayerRef.current;
                l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
            end;
        else
            if v73.props.isTenFootInterface and v73.props.isUsingGamepad then
                l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
            end;
            if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject:IsDescendantOf(v73.scrollingFrameRef.current) then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        end;
    end;
    if v73.props.isMinimized ~= v74.isMinimized then
        v73:setState({
            contentsVisible = not v73.props.isMinimized
        });
    end;
end;
return v6.connect(function(v75) --[[ Line: 354 ]] --[[ Name: mapStateToProps ]]
    return {
        isVisible = v75.displayOptions.isVisible, 
        isMinimized = v75.displayOptions.isMinimized, 
        isTenFootInterface = v75.displayOptions.isTenFootInterface, 
        isUsingGamepad = v75.displayOptions.isUsingGamepad, 
        gameStats = v75.gameStats, 
        teamNames = v75.teamNames, 
        teamColors = v75.teamColors, 
        playerStats = v75.playerStats, 
        playerIconInfo = v75.playerIconInfo, 
        playerRelationship = v75.playerRelationship, 
        playerTeam = v75.playerTeam, 
        dropDownPlayer = v75.playerDropDown.selectedPlayer, 
        dropDownVisible = v75.playerDropDown.isVisible
    };
end, nil)(v23);