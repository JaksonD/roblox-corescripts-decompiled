local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Packages.Otter);
local l_withStyle_0 = v6.Style.withStyle;
local l_IconButton_0 = v6.App.Button.IconButton;
local l_IconSize_0 = v6.App.ImageSet.Enum.IconSize;
local v12 = v6.App.ImageSet.getIconSize(l_IconSize_0.Small);
local l_Images_0 = v6.App.ImageSet.Images;
local l_Parent_0 = script.Parent.Parent;
local l_Connection_0 = l_Parent_0.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v18 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
local l_Parent_1 = l_Parent_0.Parent;
local v21 = require(script.Parent.PlayerEntry);
local v22 = require(script.Parent.TeamEntry);
local v23 = require(script.Parent.PlayerDropDown);
local v24 = require(script.Parent.TitleBar);
local v25 = require(l_Parent_1.Actions.SetPlayerListVisibility);
local v26 = require(l_Parent_1.Flags.FFlagPlayerListReduceRerenders);
local v27 = require(l_Parent_1.Flags.FFlagPlayerListClosedNoRenderWithTenFoot);
local v28 = require(l_Parent_1.GetFakeNeutralTeam);
local v29 = game:DefineFastFlag("DisablePlayerListDisplayCloseBtn", false);
local v30 = l_Enabled_0() and not v29;
local v31 = {
    dampingRatio = 1, 
    frequency = 4
};
local v32 = v4.PureComponent:extend("PlayerListDisplay");
v32.validateProps = v7.strictInterface({
    isVisible = v7.boolean, 
    isMinimized = v7.boolean, 
    isTenFootInterface = v7.boolean, 
    isUsingGamepad = v7.boolean, 
    screenSizeY = v7.number, 
    entrySize = v7.integer, 
    sortedPlayers = v7.array(v18), 
    sortedTeams = v7.optional(v7.array(v7.strictInterface({
        team = v7.instanceIsA("Team"), 
        originalPos = v7.number
    }))), 
    teamColorToPlayerMap = v7.optional(v7.map(v7.integer, v7.array(v7.instanceIsA("Player")))), 
    teamScores = v7.optional(v7.map(v7.instanceIsA("Team"), v7.map(v7.string, v7.any))), 
    teamNames = v7.map(v7.instanceIsA("Team"), v7.string), 
    teamColors = v7.map(v7.instanceIsA("Team"), v7.BrickColor), 
    playerTeam = v7.map(v7.integer, v7.instanceIsA("Team")), 
    playerStats = v7.map(v7.integer, v7.map(v7.string, v7.any)), 
    gameStats = v7.array(v7.strictInterface({
        name = v7.string, 
        text = v7.string, 
        addId = v7.integer, 
        serverAddId = v7.integer, 
        isPrimary = v7.boolean, 
        priority = v7.number
    })), 
    playerIconInfo = v7.map(v7.integer, v7.strictInterface({
        isPlaceOwner = v7.boolean, 
        avatarIcon = v7.optional(v7.table), 
        specialGroupIcon = v7.optional(v7.table)
    })), 
    playerRelationship = v7.map(v7.integer, v7.strictInterface({
        isBlocked = v7.boolean, 
        friendStatus = v7.enum(Enum.FriendStatus), 
        isFollowing = v7.boolean, 
        isFollower = v7.boolean
    })), 
    dropDownPlayer = v7.optional(v7.instanceIsA("Player")), 
    dropDownVisible = v7.boolean, 
    dismissPlayerList = v7.callback
});
v32.init = function(v33) --[[ Line: 112 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v26 (copy), v8 (copy)
    v33.scrollingFrameRef = v4.createRef();
    v33.firstPlayerRef = v4.createRef();
    v33.state = {
        containerSizeY = 100, 
        scrollingFramePositionY = 0, 
        lastCanvasPosition = Vector2.new(0, 0), 
        contentsVisible = true
    };
    v33.absoluteSizeChanged = function(v34) --[[ Line: 123 ]]
        -- upvalues: v33 (copy)
        v33:setState({
            containerSizeY = v34.AbsoluteSize.Y
        });
    end;
    v33.canvasPositionChanged = function(v35) --[[ Line: 129 ]]
        -- upvalues: v33 (copy)
        v33:setState({
            lastCanvasPosition = v35.CanvasPosition
        });
    end;
    v33.absolutePositionChanged = function(v36) --[[ Line: 135 ]]
        -- upvalues: v33 (copy)
        v33:setState({
            scrollingFramePositionY = v36.AbsolutePosition.Y
        });
    end;
    local v37, v38 = v4.createBinding(0);
    v33.minimizedBinding = v37;
    v33.updateMinimizedBinding = v38;
    if v26 then
        v37, v38 = v4.createBinding(0);
        v33.defaultTransparencyBinding = v37;
        v33.updateDefaultTransparencyBinding = v38;
        v37, v38 = v4.createBinding(0);
        v33.fadedTransparencyBinding = v37;
        v33.updateFadedTransparencyBinding = v38;
        v33.transparencyBinding = v4.joinBindings({
            v33.minimizedBinding, 
            v33.defaultTransparencyBinding, 
            v33.fadedTransparencyBinding
        }):map(function(v39) --[[ Line: 152 ]]
            local v40 = v39[1];
            local v41 = v39[2];
            return v41 + (v39[3] - v41) * v40;
        end);
    end;
    v33.minimizedMotor = v8.createSingleMotor(0);
    v33.minimizedMotor:onStep(v33.updateMinimizedBinding);
    v33.minimizedMotor:onComplete(function(v42) --[[ Line: 163 ]]
        -- upvalues: v33 (copy)
        if v42 == 0 then
            v33:setState({
                contentsVisible = true
            });
        end;
    end);
end;
v32.inVerticalScrollWindow = function(v43, v44, v45) --[[ Line: 172 ]] --[[ Name: inVerticalScrollWindow ]]
    if v44 + v45 + v45 * 3 < v43.state.lastCanvasPosition.Y then
        return false;
    elseif v44 - v45 * 3 > v43.state.lastCanvasPosition.Y + v43.state.containerSizeY then
        return false;
    else
        return true;
    end;
end;
v32.calculateDropDownAbsPosition = function(v46, v47, v48) --[[ Line: 188 ]] --[[ Name: calculateDropDownAbsPosition ]]
    local l_current_0 = v46.scrollingFrameRef.current;
    if l_current_0 then
        v47 = v47 - l_current_0.CanvasPosition.Y;
        if v47 + v48 >= l_current_0.AbsoluteSize.Y then
            local v50 = v47 + v48 - l_current_0.AbsoluteSize.Y;
            return v47 - v50, Vector2.new(0, l_current_0.CanvasPosition.Y + v50);
        else
            return v47, nil;
        end;
    else
        return v47, nil;
    end;
end;
v32.render = function(v51) --[[ Line: 201 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v26 (copy), v4 (copy), v22 (copy), v28 (copy), v21 (copy), l_Enabled_0 (copy), v30 (copy), v12 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), v24 (copy), v23 (copy)
    return l_WithLayoutValues_0(function(v52) --[[ Line: 202 ]]
        -- upvalues: l_withStyle_0 (ref), v26 (ref), v51 (copy), v4 (ref), v22 (ref), v28 (ref), v21 (ref), l_Enabled_0 (ref), v30 (ref), v12 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v24 (ref), v23 (ref)
        return l_withStyle_0(function(v53) --[[ Line: 203 ]]
            -- upvalues: v52 (copy), v26 (ref), v51 (ref), v4 (ref), v22 (ref), v28 (ref), v21 (ref), l_Enabled_0 (ref), v30 (ref), v12 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v24 (ref), v23 (ref)
            local l_EntryPadding_0 = v52.EntryPadding;
            local l_TeamEntrySizeY_0 = v52.TeamEntrySizeY;
            local l_PlayerEntrySizeY_0 = v52.PlayerEntrySizeY;
            local v57 = {};
            local v58 = 0;
            local v59 = 0;
            local v60 = nil;
            if v26 then
                v60 = {};
                for _, v62 in v51.props.gameStats do
                    table.insert(v60, v62.name);
                end;
            end;
            if v51.props.sortedTeams then
                local v63 = 0;
                local v64 = true;
                for v65, v66 in ipairs(v51.props.sortedTeams) do
                    if v51:inVerticalScrollWindow(v58, l_TeamEntrySizeY_0) then
                        v57["t_" .. tostring(v65)] = v4.createElement("Frame", {
                            Position = UDim2.fromOffset(0, v58), 
                            Size = UDim2.new(1, v52.EntryXOffset, 0, v52.TeamEntrySizeY), 
                            BackgroundTransparency = 1
                        }, {
                            v4.createElement(v22, {
                                teamName = v51.props.teamNames[v66.team], 
                                teamColor = v51.props.teamColors[v66.team], 
                                leaderstats = v51.props.teamScores[v66.team], 
                                gameStats = if v26 then nil else v51.props.gameStats, 
                                gameStatNames = v60, 
                                entrySize = v51.props.entrySize
                            })
                        });
                    end;
                    v63 = v63 + 1;
                    v58 = v58 + l_TeamEntrySizeY_0 + l_EntryPadding_0;
                    local v67 = nil;
                    if v66.team == v28 then
                        v67 = {};
                        for _, v69 in ipairs(v51.props.sortedPlayers) do
                            if v51.props.playerTeam[v69.UserId] == nil then
                                table.insert(v67, v69);
                            end;
                        end;
                    else
                        v67 = v51.props.teamColorToPlayerMap[v66.team.TeamColor.Number] or {};
                    end;
                    for v70, v71 in ipairs(v67) do
                        if v64 or v51:inVerticalScrollWindow(v58, l_PlayerEntrySizeY_0) then
                            local l_UserId_0 = v71.UserId;
                            v57["p_" .. tostring(l_UserId_0)] = v4.createElement("Frame", {
                                Position = UDim2.fromOffset(0, v58), 
                                Size = UDim2.new(1, v52.EntryXOffset, 0, v52.PlayerEntrySizeY), 
                                BackgroundTransparency = 1
                            }, {
                                v4.createElement(v21, {
                                    player = v71, 
                                    playerStats = v51.props.playerStats[l_UserId_0], 
                                    playerIconInfo = v51.props.playerIconInfo[l_UserId_0], 
                                    playerRelationship = v51.props.playerRelationship[l_UserId_0], 
                                    titlePlayerEntry = false, 
                                    gameStats = if v26 then nil else v51.props.gameStats, 
                                    gameStatNames = v60, 
                                    hasDivider = not (v70 == #v67), 
                                    entrySize = v51.props.entrySize, 
                                    [v4.Ref] = v64 and v51.firstPlayerRef or nil
                                })
                            });
                        end;
                        v64 = false;
                        if v71 == v51.props.dropDownPlayer then
                            v59 = v58;
                        end;
                        v58 = v58 + l_PlayerEntrySizeY_0 + l_EntryPadding_0;
                        v63 = v63 + 1;
                    end;
                end;
            else
                for v73, v74 in ipairs(v51.props.sortedPlayers) do
                    if v73 == 1 or v51:inVerticalScrollWindow(v58, l_PlayerEntrySizeY_0) then
                        local l_UserId_1 = v74.UserId;
                        v57["p_" .. tostring(l_UserId_1)] = v4.createElement("Frame", {
                            Position = UDim2.fromOffset(0, v58), 
                            Size = UDim2.new(1, v52.EntryXOffset, 0, v52.PlayerEntrySizeY), 
                            BackgroundTransparency = 1
                        }, {
                            v4.createElement(v21, {
                                player = v74, 
                                playerStats = v51.props.playerStats[l_UserId_1], 
                                playerIconInfo = v51.props.playerIconInfo[l_UserId_1], 
                                playerRelationship = v51.props.playerRelationship[l_UserId_1], 
                                titlePlayerEntry = false, 
                                gameStats = if v26 then nil else v51.props.gameStats, 
                                gameStatNames = v60, 
                                hasDivider = v73 ~= #v51.props.sortedPlayers, 
                                entrySize = v51.props.entrySize, 
                                [v4.Ref] = v73 == 1 and v51.firstPlayerRef or nil
                            })
                        });
                    end;
                    if v74 == v51.props.dropDownPlayer then
                        v59 = v58;
                    end;
                    v58 = v58 + l_PlayerEntrySizeY_0 + l_EntryPadding_0;
                end;
            end;
            local v76, v77 = v51:calculateDropDownAbsPosition(v59, l_PlayerEntrySizeY_0);
            if v52.IsTenFoot then
                return v4.createElement("Frame", {
                    Position = v52.PlayerScrollListPosition, 
                    Size = v52.PlayerScrollListSize, 
                    BackgroundTransparency = 1, 
                    [v4.Change.AbsoluteSize] = v51.absoluteSizeChanged
                }, {
                    ScollingFrame = v4.createElement("ScrollingFrame", {
                        Position = UDim2.new(0, 0, 0, 0), 
                        Size = UDim2.new(1, 0, 1, 0), 
                        CanvasSize = UDim2.new(0, 0, 0, v58), 
                        BackgroundTransparency = 1, 
                        ScrollBarImageColor3 = v52.ScrollImageColor, 
                        ScrollBarImageTransparency = v52.ScrollImageTransparency, 
                        BorderSizePixel = 0, 
                        ScrollBarThickness = 6, 
                        ScrollingEnabled = not v51.props.dropDownVisible, 
                        Selectable = false, 
                        CanvasPosition = v51.props.dropDownVisible and v77 or v51.state.lastCanvasPosition, 
                        [v4.Change.CanvasPosition] = v51.canvasPositionChanged, 
                        [v4.Ref] = v51.scrollingFrameRef
                    }, v57)
                });
            else
                local v78 = v51.state.containerSizeY - 8;
                if #v51.props.gameStats > 0 then
                    v78 = v78 - v52.TitleBarSizeY;
                end;
                local v79 = if l_Enabled_0() then v53.Theme.BackgroundUIContrast.Color else v53.Theme.BackgroundContrast.Color;
                local v80 = nil;
                if v26 then
                    v51.updateDefaultTransparencyBinding(v52.OverrideBackgroundTransparency * v53.Settings.PreferredTransparency);
                    v51.updateFadedTransparencyBinding(v52.FadedBackgroundTransparency);
                    v80 = v51.transparencyBinding;
                else
                    v80 = v51.minimizedBinding:map(function(v81) --[[ Line: 371 ]]
                        -- upvalues: v52 (ref), v53 (copy)
                        local v82 = v52.OverrideBackgroundTransparency * v53.Settings.PreferredTransparency;
                        return v82 + (v52.FadedBackgroundTransparency - v82) * v81;
                    end);
                end;
                local l_contentsVisible_0 = v51.state.contentsVisible;
                local l_createElement_0 = v4.createElement;
                local v85 = "Frame";
                local v86 = {
                    Position = v52.PlayerScrollListPosition, 
                    Size = v52.PlayerScrollListSize, 
                    BackgroundTransparency = 1, 
                    [v4.Change.AbsoluteSize] = v51.absoluteSizeChanged
                };
                local v87 = {};
                local l_createElement_1 = v4.createElement;
                local v89 = "Frame";
                local v90 = {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5)
                };
                local v92 = {
                    UIScale = v4.createElement("UIScale", {
                        Scale = v51.minimizedBinding:map(function(v91) --[[ Line: 396 ]]
                            -- upvalues: v52 (ref)
                            return 1 - v52.FadedBackgroundScaleDelta * v91;
                        end)
                    }), 
                    UIListLayout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left
                    }), 
                    TopRoundedRect = if not v30 then v4.createElement("ImageLabel", {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        Image = "rbxasset://textures/ui/TopRoundedRect8px.png", 
                        ImageColor3 = v79, 
                        ImageTransparency = v80, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(8, 8, 24, 18), 
                        SliceScale = 0.5, 
                        Size = UDim2.new(1, 0, 0, 4)
                    }) else v4.createElement("Frame", {
                        LayoutOrder = 1, 
                        ClipsDescendants = true, 
                        Size = UDim2.new(1, 0, 0, v12 + 2), 
                        BackgroundTransparency = 1
                    }, {
                        DismissIconFrame = v4.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, (v12 + 2) * 2), 
                            BackgroundColor3 = v79, 
                            BackgroundTransparency = v80
                        }, {
                            DismissButton = v4.createElement(l_IconButton_0, {
                                position = UDim2.new(0, 1, 0, 1), 
                                iconSize = l_IconSize_0.Small, 
                                icon = l_Images_0["icons/navigation/close"], 
                                onActivated = v51.props.dismissPlayerList
                            }), 
                            UICorner = v4.createElement("UICorner", {
                                CornerRadius = UDim.new(0, 7)
                            })
                        })
                    })
                };
                local v93 = false;
                if #v51.props.gameStats > 0 then
                    v93 = v4.createElement(v24, {
                        LayoutOrder = 2, 
                        contentsVisible = v51.state.contentsVisible, 
                        showBackground = true, 
                        backgroundTransparency = v80, 
                        gameStats = v51.props.gameStats, 
                        Size = UDim2.new(1, 0, 0, v52.TitleBarSizeY), 
                        entrySize = v51.props.entrySize
                    });
                end;
                v92.TitleBar = v93;
                v92.ScrollingFrameContainer = v4.createElement("Frame", {
                    LayoutOrder = 3, 
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(1, 0, 0, (math.min(v58, v78))), 
                    BackgroundColor3 = v79, 
                    BackgroundTransparency = v80, 
                    BorderSizePixel = 0, 
                    [v4.Change.AbsolutePosition] = v51.absolutePositionChanged
                }, {
                    PlayerDropDown = v4.createElement(v23, {
                        contentsVisible = l_contentsVisible_0, 
                        selectedPlayer = v51.props.dropDownPlayer, 
                        positionY = v76, 
                        minPositionBoundY = -v51.state.scrollingFramePositionY + v52.DropDownScreenSidePadding, 
                        maxPositionBoundY = v51.props.screenSizeY - v51.state.scrollingFramePositionY - v52.DropDownScreenSidePadding
                    }), 
                    ScrollingFrameClippingFrame = v4.createElement("Frame", {
                        Visible = v51.state.contentsVisible, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        ClipsDescendants = true
                    }, {
                        ScollingFrame = v4.createElement("ScrollingFrame", {
                            Size = UDim2.new(1, -v52.ScrollBarOffset, 1, 0), 
                            CanvasSize = UDim2.new(0, 0, 0, v58), 
                            BackgroundTransparency = 1, 
                            ScrollBarImageColor3 = v52.ScrollImageColor, 
                            ScrollBarImageTransparency = v52.ScrollImageTransparency, 
                            BorderSizePixel = 0, 
                            ScrollBarThickness = v52.ScrollBarSize, 
                            VerticalScrollBarInset = Enum.ScrollBarInset.Always, 
                            ClipsDescendants = false, 
                            ScrollingEnabled = not v51.props.dropDownVisible, 
                            Selectable = false, 
                            CanvasPosition = v51.props.dropDownVisible and v77 or v51.state.lastCanvasPosition, 
                            [v4.Change.CanvasPosition] = v51.canvasPositionChanged, 
                            [v4.Ref] = v51.scrollingFrameRef
                        }, {
                            OffsetUndoFrame = v4.createElement("Frame", {
                                Size = UDim2.new(1, v52.ScrollBarOffset + v52.ScrollBarSize, 0, v58), 
                                BackgroundTransparency = 1
                            }, v57)
                        })
                    })
                });
                v92.BottomRoundedRect = if not v30 then v4.createElement("ImageLabel", {
                    LayoutOrder = 4, 
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/BottomRoundedRect8px.png", 
                    ImageColor3 = v79, 
                    ImageTransparency = v80, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 24, 16), 
                    SliceScale = 0.5, 
                    Size = UDim2.new(1, 0, 0, 4)
                }) else v4.createElement("Frame", {
                    LayoutOrder = 4, 
                    ClipsDescendants = true, 
                    Size = UDim2.new(1, 0, 0, 7), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    v4.createElement("Frame", {
                        Position = UDim2.new(0, 0, 0, -8), 
                        Size = UDim2.new(1, 0, 0, 14), 
                        BackgroundColor3 = v79, 
                        BackgroundTransparency = v80, 
                        BorderSizePixel = 0
                    }, {
                        v4.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 7)
                        })
                    })
                });
                v87.SizeOffsetFrame = l_createElement_1(v89, v90, v92);
                return l_createElement_0(v85, v86, v87);
            end;
        end);
    end);
end;
v32.didUpdate = function(v94, v95) --[[ Line: 552 ]] --[[ Name: didUpdate ]]
    -- upvalues: v27 (copy), l_GuiService_0 (copy), l_UserInputService_0 (copy), v8 (copy), v31 (copy)
    local v96 = false;
    if v27 and #v95.sortedPlayers == 0 and v95.sortedTeams == nil then
        v96 = true;
    end;
    if v94.props.isVisible ~= v95.isVisible or v96 then
        if v94.props.isVisible then
            if v94.props.isTenFootInterface and v94.props.isUsingGamepad then
                l_GuiService_0.SelectedCoreObject = v94.firstPlayerRef.current;
                l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
            end;
            l_GuiService_0:AddSelectionParent("PlayerlistGuiSelection", v94.scrollingFrameRef.current);
        else
            if v94.props.isTenFootInterface and v94.props.isUsingGamepad then
                l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
            end;
            if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject:IsDescendantOf(v94.scrollingFrameRef.current) then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
            l_GuiService_0:RemoveSelectionGroup("PlayerlistGuiSelection");
        end;
    end;
    if v94.props.isMinimized ~= v95.isMinimized then
        v94.minimizedMotor:setGoal(v8.spring(v94.props.isMinimized and 1 or 0, v31));
        if v94.props.isMinimized then
            v94:setState({
                contentsVisible = false
            });
        end;
    end;
end;
return v5.UNSTABLE_connect2(function(v97) --[[ Line: 601 ]] --[[ Name: mapStateToProps ]]
    local l_isMinimized_0 = v97.displayOptions.isMinimized;
    return {
        isVisible = v97.displayOptions.isVisible, 
        isMinimized = l_isMinimized_0, 
        isTenFootInterface = v97.displayOptions.isTenFootInterface, 
        isUsingGamepad = v97.displayOptions.isUsingGamepad, 
        gameStats = v97.gameStats, 
        teamNames = v97.teamNames, 
        teamColors = v97.teamColors, 
        playerStats = v97.playerStats, 
        playerIconInfo = v97.playerIconInfo, 
        playerRelationship = v97.playerRelationship, 
        playerTeam = v97.playerTeam, 
        dropDownPlayer = v97.playerDropDown.selectedPlayer, 
        dropDownVisible = v97.playerDropDown.isVisible
    };
end, function(v99) --[[ Line: 593 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v25 (copy)
    return {
        dismissPlayerList = function() --[[ Line: 595 ]] --[[ Name: dismissPlayerList ]]
            -- upvalues: v99 (copy), v25 (ref)
            return v99(v25(false));
        end
    };
end)(v32);