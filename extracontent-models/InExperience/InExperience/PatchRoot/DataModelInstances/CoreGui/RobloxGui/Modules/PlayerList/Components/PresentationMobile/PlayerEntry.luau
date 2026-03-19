local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_InExperienceCapabilities_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities;
local l_SharedFlags_0 = l_CorePackages_0.Workspace.Packages.SharedFlags;
local l_withStyle_0 = v8.Style.withStyle;
local l_PlayerIconInfoStore_0 = require(l_CorePackages_0.Workspace.Packages.PlayerIconInfoStore).PlayerIconInfoStore;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v14 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local l_Parent_0 = script.Parent.Parent;
local l_Connection_0 = l_Parent_0.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v18 = require(l_Parent_0.PresentationCommon.PlayerIcon);
local v19 = require(script.Parent.PlayerNameTag);
local v20 = require(script.Parent.StatEntry);
local l_Parent_1 = l_Parent_0.Parent;
local v22 = require(l_Parent_1.Actions.ClosePlayerDropDown);
local v23 = require(l_Parent_1.Actions.OpenPlayerDropDown);
local l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0 = require(l_SharedFlags_0).GetFFlagGateLeaderboardPlayerDropdownViaGUAC;
local l_FFlagReplacePlayerIconRoduxWithSignal_0 = require(l_SharedFlags_0).FFlagReplacePlayerIconRoduxWithSignal;
local v26 = require(l_Parent_1.createShallowEqualAndTables);
local v27 = require(l_Parent_1.Flags.FFlagPlayerListReduceRerenders);
local v28 = v3.PureComponent:extend("PlayerEntry");
v28.validateProps = v7.strictInterface({
    topDiv = v7.optional(v7.boolean), 
    bottomDiv = v7.optional(v7.boolean), 
    player = v14, 
    titlePlayerEntry = v7.boolean, 
    entrySize = v7.integer, 
    layoutOrder = v7.optional(v7.integer), 
    playerStats = v7.map(v7.string, v7.any), 
    playerIconInfo = v7.strictInterface({
        isPlaceOwner = v7.boolean, 
        avatarIcon = v7.optional(v7.table), 
        specialGroupIcon = v7.optional(v7.table)
    }), 
    playerRelationship = v7.strictInterface({
        isBlocked = v7.boolean, 
        friendStatus = v7.enum(Enum.FriendStatus), 
        isFollowing = v7.boolean, 
        isFollower = v7.boolean
    }), 
    gameStats = if v27 then nil else v7.array(v7.strictInterface({
        name = v7.string, 
        text = v7.string, 
        addId = v7.integer, 
        serverAddId = v7.integer, 
        isPrimary = v7.boolean, 
        priority = v7.number
    })), 
    gameStatNames = if v27 then v7.array(v7.string) else nil, 
    [v3.Ref] = v7.optional(v7.table), 
    selectedPlayer = v7.optional(v7.instanceIsA("Player")), 
    dropDownOpen = v7.boolean, 
    isSmallTouchDevice = v7.boolean, 
    closeDropDown = v7.callback, 
    openDropDown = v7.callback, 
    Position = v7.optional(v7.UDim2)
});
v28.init = function(v29) --[[ Line: 96 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0 (copy), l_InExperienceCapabilities_0 (copy)
    v29.state = {
        isHovered = false, 
        isPressed = false
    };
    v29.onActivated = function() --[[ Line: 102 ]]
        -- upvalues: v29 (copy), l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0 (ref), l_InExperienceCapabilities_0 (ref)
        if v29.props.dropDownOpen then
            v29.props.closeDropDown();
            return;
        else
            if l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0() then
                if l_InExperienceCapabilities_0.canViewPlayerDropdownInLeaderboard then
                    v29.props.openDropDown(v29.props.player);
                    return;
                end;
            else
                v29.props.openDropDown(v29.props.player);
            end;
            return;
        end;
    end;
    v29.onSelectionGained = function() --[[ Line: 116 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            isHovered = true
        });
    end;
    v29.onSelectionLost = function() --[[ Line: 122 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            isHovered = false
        });
    end;
    v29.onMouseEnter = function() --[[ Line: 128 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            isHovered = true
        });
    end;
    v29.onMouseLeave = function() --[[ Line: 134 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            isHovered = false, 
            isPressed = false
        });
    end;
    v29.onMouseDown = function() --[[ Line: 141 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            isPressed = true
        });
    end;
    v29.onInputEnded = function() --[[ Line: 147 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            isPressed = false
        });
    end;
end;
v28.getBackgroundColor = function(v30, v31) --[[ Line: 154 ]] --[[ Name: getBackgroundColor ]]
    return (v30.state.isHovered or v30.state.isPressed) and v31.RowHoverColor or v31.RowDefaultColor;
end;
v28.getTextStyle = function(v32, v33, v34) --[[ Line: 159 ]] --[[ Name: getTextStyle ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    if v33.IsTenFoot then
        if v32.state.isHovered then
            return v33.HoveredTextStyle, v33.PlayerNameTextSizeMobile;
        else
            return v33.DefaultTextStyle, v33.PlayerNameTextSizeMobile;
        end;
    elseif v32.props.player == l_LocalPlayer_0 then
        return v34.Theme.TextEmphasis;
    else
        return v34.Theme.TextDefault;
    end;
end;
v28.getPlayerNameFont = function(v35, _, v37) --[[ Line: 175 ]] --[[ Name: getPlayerNameFont ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_AppFonts_0 (copy)
    if v35.props.player == l_LocalPlayer_0 then
        return {
            Font = l_AppFonts_0.default:getMedium(), 
            Size = v37.Font.CaptionHeader.RelativeSize * v37.Font.BaseSize, 
            MinSize = v37.Font.Footer.RelativeMinSize * v37.Font.BaseSize
        };
    else
        return {
            Font = l_AppFonts_0.default:getDefault(), 
            Size = v37.Font.CaptionBody.RelativeSize * v37.Font.BaseSize, 
            MinSize = v37.Font.Footer.RelativeMinSize * v37.Font.BaseSize
        };
    end;
end;
if l_FFlagReplacePlayerIconRoduxWithSignal_0 then
    v28.getPlayerIconInfo = function(v38) --[[ Line: 193 ]] --[[ Name: getPlayerIconInfo ]]
        -- upvalues: l_PlayerIconInfoStore_0 (copy)
        return l_PlayerIconInfoStore_0.getPlayerIconInfoReactive(v38.props.player.UserId)(false);
    end;
end;
v28.render = function(v39) --[[ Line: 199 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v3 (copy), v18 (copy), l_FFlagReplacePlayerIconRoduxWithSignal_0 (copy), v19 (copy), v27 (copy), v20 (copy)
    return l_WithLayoutValues_0(function(v40) --[[ Line: 200 ]]
        -- upvalues: l_withStyle_0 (ref), v39 (copy), v3 (ref), v18 (ref), l_FFlagReplacePlayerIconRoduxWithSignal_0 (ref), v19 (ref), v27 (ref), v20 (ref)
        return l_withStyle_0(function(v41) --[[ Line: 201 ]]
            -- upvalues: v39 (ref), v40 (copy), v3 (ref), v18 (ref), l_FFlagReplacePlayerIconRoduxWithSignal_0 (ref), v19 (ref), v27 (ref), v20 (ref)
            local v42 = v39:getTextStyle(v40, v41);
            local v43 = v39:getPlayerNameFont(v40, v41);
            local v44 = {
                Layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                NameFrame = v3.createElement("Frame", {
                    LayoutOrder = 0, 
                    Size = UDim2.new(0, v40.PlayerNameSizeXMobile, 0, v40.PlayerEntrySizeY), 
                    BackgroundTransparency = 1
                }, {
                    PlayerIcon = v3.createElement(v18, {
                        player = v39.props.player, 
                        playerIconInfo = if l_FFlagReplacePlayerIconRoduxWithSignal_0 then v39:getPlayerIconInfo() else v39.props.playerIconInfo, 
                        playerRelationship = v39.props.playerRelationship
                    }), 
                    PlayerName = v3.createElement(v19, {
                        player = v39.props.player, 
                        isTitleEntry = v39.props.titlePlayerEntry, 
                        isHovered = v39.state.isHovered, 
                        textStyle = v42, 
                        textFont = v43
                    })
                })
            };
            if v27 then
                for v45, v46 in v39.props.gameStatNames do
                    if v40.MaxLeaderstats >= v45 then
                        v44["GameStat_" .. v46] = v3.createElement(v20, {
                            statValue = v39.props.playerStats[v46], 
                            isTitleEntry = v39.props.titlePlayerEntry, 
                            isTeamEntry = false, 
                            layoutOrder = v45, 
                            textStyle = v42
                        });
                    else
                        break;
                    end;
                end;
            else
                for v47, v48 in ipairs(v39.props.gameStats) do
                    if v40.MaxLeaderstats >= v47 then
                        v44["GameStat_" .. v48.name] = v3.createElement(v20, {
                            statValue = v39.props.playerStats[v48.name], 
                            isTitleEntry = v39.props.titlePlayerEntry, 
                            isTeamEntry = false, 
                            layoutOrder = v47, 
                            textStyle = v42
                        });
                    else
                        break;
                    end;
                end;
            end;
            local v49 = v39.props.topDiv or false;
            local v50 = v39.props.bottomDiv or false;
            return v3.createElement("ImageButton", {
                Position = v39.props.Position, 
                Size = UDim2.new(1, v40.EntryXOffset, 0, v40.PlayerEntrySizeY), 
                AutoButtonColor = false, 
                BackgroundColor3 = v39:getBackgroundColor(v40), 
                BackgroundTransparency = 0.8, 
                BorderSizePixel = 0, 
                Image = "", 
                LayoutOrder = v39.props.layoutOrder, 
                [v3.Event.Activated] = v39.onActivated, 
                [v3.Event.SelectionGained] = v39.onSelectionGained, 
                [v3.Event.SelectionLost] = v39.onSelectionLost, 
                [v3.Event.MouseButton1Down] = v39.onMouseDown, 
                [v3.Event.InputEnded] = v39.onInputEnded
            }, {
                ChildrenFrame = v3.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    BackgroundTransparency = 1
                }, v44), 
                TopDiv = v49 and v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0, 0), 
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                    BackgroundTransparency = 0.8
                }) or nil, 
                BottomDiv = v50 and v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                    BackgroundTransparency = 0.8
                }) or nil
            });
        end);
    end);
end;
local function v52(v51) --[[ Line: 307 ]] --[[ Name: mapStateToProps ]]
    return {
        selectedPlayer = v51.playerDropDown.selectedPlayer, 
        dropDownOpen = v51.playerDropDown.isVisible, 
        isSmallTouchDevice = v51.displayOptions.isSmallTouchDevice
    };
end;
local function v55(v53) --[[ Line: 316 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v22 (copy), v23 (copy)
    return {
        closeDropDown = function() --[[ Line: 318 ]] --[[ Name: closeDropDown ]]
            -- upvalues: v53 (copy), v22 (ref)
            return v53(v22());
        end, 
        openDropDown = function(v54) --[[ Line: 321 ]] --[[ Name: openDropDown ]]
            -- upvalues: v53 (copy), v23 (ref)
            return v53(v23(v54));
        end
    };
end;
if v27 then
    return v4.memo(v5.connect(v52, v55)(v28), v26({
        "gameStatNames"
    }));
else
    return v5.connect(v52, v55)(v28);
end;