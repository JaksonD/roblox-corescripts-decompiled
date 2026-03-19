local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_InExperienceCapabilities_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities;
local l_SharedFlags_0 = l_CorePackages_0.Workspace.Packages.SharedFlags;
local l_withStyle_0 = v8.Style.withStyle;
local l_PlayerIconInfoStore_0 = require(l_CorePackages_0.Workspace.Packages.PlayerIconInfoStore).PlayerIconInfoStore;
local l_Parent_0 = script.Parent.Parent;
local l_Connection_0 = l_Parent_0.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v16 = require(script.Parent.EntryFrame);
local v17 = require(l_Parent_0.PresentationCommon.PlayerIcon);
local v18 = require(script.Parent.PlayerNameTag);
local v19 = require(script.Parent.StatEntry);
local v20 = require(script.Parent.CellExtender);
local l_Parent_1 = l_Parent_0.Parent;
local v22 = require(l_Parent_1.Actions.ClosePlayerDropDown);
local v23 = require(l_Parent_1.Actions.OpenPlayerDropDown);
local v24 = require(l_Parent_1.createShallowEqualAndTables);
local v25 = require(l_Parent_1.Flags.FFlagPlayerListReduceRerenders);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v27 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
local l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0 = require(l_SharedFlags_0).GetFFlagGateLeaderboardPlayerDropdownViaGUAC;
local l_FFlagReplacePlayerIconRoduxWithSignal_0 = require(l_SharedFlags_0).FFlagReplacePlayerIconRoduxWithSignal;
local l_validatePropsWithForwardRef_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).validatePropsWithForwardRef;
local v32 = v4.PureComponent:extend("PlayerEntry");
v32.validateProps = v7.strictInterface(l_validatePropsWithForwardRef_0({
    player = v27, 
    titlePlayerEntry = v7.boolean, 
    hasDivider = v7.boolean, 
    entrySize = v7.integer, 
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
    gameStats = if v25 then nil else v7.array(v7.strictInterface({
        name = v7.string, 
        text = v7.string, 
        addId = v7.integer, 
        serverAddId = v7.integer, 
        isPrimary = v7.boolean, 
        priority = v7.number
    })), 
    gameStatNames = if v25 then v7.array(v7.string) else nil, 
    [v4.Ref] = v7.optional(v7.table), 
    selectedPlayer = v7.optional(v7.instanceIsA("Player")), 
    dropDownOpen = v7.boolean, 
    isSmallTouchDevice = v7.boolean, 
    closeDropDown = v7.callback, 
    openDropDown = v7.callback
}));
v32.init = function(v33) --[[ Line: 93 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0 (copy), l_InExperienceCapabilities_0 (copy)
    v33.state = {
        isHovered = false, 
        isPressed = false
    };
    v33.onActivated = function() --[[ Line: 99 ]]
        -- upvalues: v33 (copy), l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0 (ref), l_InExperienceCapabilities_0 (ref)
        if v33.props.selectedPlayer == v33.props.player and v33.props.dropDownOpen then
            v33.props.closeDropDown();
            return;
        else
            if l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0() then
                if l_InExperienceCapabilities_0.canViewPlayerDropdownInLeaderboard then
                    v33.props.openDropDown(v33.props.player);
                    return;
                end;
            else
                v33.props.openDropDown(v33.props.player);
            end;
            return;
        end;
    end;
    v33.onSelectionGained = function() --[[ Line: 113 ]]
        -- upvalues: v33 (copy)
        v33:setState({
            isHovered = true
        });
    end;
    v33.onSelectionLost = function() --[[ Line: 119 ]]
        -- upvalues: v33 (copy)
        v33:setState({
            isHovered = false
        });
    end;
    v33.onMouseEnter = function() --[[ Line: 125 ]]
        -- upvalues: v33 (copy)
        v33:setState({
            isHovered = true
        });
    end;
    v33.onMouseLeave = function() --[[ Line: 131 ]]
        -- upvalues: v33 (copy)
        v33:setState({
            isHovered = false, 
            isPressed = false
        });
    end;
    v33.onMouseDown = function() --[[ Line: 138 ]]
        -- upvalues: v33 (copy)
        v33:setState({
            isPressed = true
        });
    end;
    v33.onInputEnded = function() --[[ Line: 144 ]]
        -- upvalues: v33 (copy)
        v33:setState({
            isPressed = false
        });
    end;
end;
v32.getBackgroundStyle = function(v34, v35, v36) --[[ Line: 151 ]] --[[ Name: getBackgroundStyle ]]
    -- upvalues: l_Enabled_0 (copy)
    local v37 = if l_Enabled_0() then v36.Theme.BackgroundUIContrast.Color else v36.Theme.BackgroundContrast.Color;
    if not v35.IsTenFoot then
        return {
            Color = v37, 
            Transparency = 1
        };
    else
        local v38 = v34.props.dropDownOpen and v34.props.selectedPlayer == v34.props.player;
        local l_isHovered_0 = v34.state.isHovered;
        if v34.props.titlePlayerEntry then
            if l_isHovered_0 and v35.BackgroundStyle.HoveredTitle then
                return v35.BackgroundStyle.HoveredTitle;
            elseif v35.BackgroundStyle.Title then
                return v35.BackgroundStyle.Title;
            end;
        end;
        if v38 and v35.BackgroundStyle.Selected then
            return v35.BackgroundStyle.Selected;
        elseif l_isHovered_0 and v35.BackgroundStyle.Hovered then
            return v35.BackgroundStyle.Hovered;
        else
            return v35.BackgroundStyle.Default;
        end;
    end;
end;
local v40 = if v25 then {
    Transparency = 1, 
    Color = Color3.new(1, 1, 1)
} else nil;
v32.getOverlayStyle = function(v41, v42, v43) --[[ Line: 190 ]] --[[ Name: getOverlayStyle ]]
    -- upvalues: v25 (copy), v40 (copy)
    if not v42.IsTenFoot then
        local v44 = v41.props.dropDownOpen and v41.props.selectedPlayer == v41.props.player;
        if v41.state.isPressed then
            return v43.Theme.BackgroundOnPress;
        elseif v44 then
            return v43.Theme.BackgroundOnPress;
        elseif v41.state.isHovered then
            return v43.Theme.BackgroundOnHover;
        end;
    end;
    if v25 then
        return v40;
    else
        return {
            Transparency = 1, 
            Color = Color3.new(1, 1, 1)
        };
    end;
end;
if l_FFlagReplacePlayerIconRoduxWithSignal_0 then
    v32.getPlayerIconInfo = function(v45) --[[ Line: 208 ]] --[[ Name: getPlayerIconInfo ]]
        -- upvalues: l_PlayerIconInfoStore_0 (copy)
        return l_PlayerIconInfoStore_0.getPlayerIconInfoReactive(v45.props.player.UserId)(false);
    end;
end;
v32.getTextStyle = function(v46, v47, v48) --[[ Line: 214 ]] --[[ Name: getTextStyle ]]
    -- upvalues: l_Players_0 (copy)
    if v47.IsTenFoot then
        if v46.state.isHovered then
            return v47.HoveredTextStyle, v47.PlayerNameTextSize;
        else
            return v47.DefaultTextStyle, v47.PlayerNameTextSize;
        end;
    elseif v46.props.player == l_Players_0.LocalPlayer then
        return v48.Theme.TextEmphasis;
    else
        return v48.Theme.TextDefault;
    end;
end;
v32.getPlayerNameFont = function(v49, v50, v51) --[[ Line: 230 ]] --[[ Name: getPlayerNameFont ]]
    -- upvalues: l_Players_0 (copy)
    if v50.IsTenFoot then
        if v49.props.titlePlayerEntry then
            return {
                Font = v50.TitlePlayerEntryFont, 
                Size = v50.PlayerNameTextSize, 
                MinSize = v50.PlayerNameTextSize
            };
        else
            return {
                Font = v50.PlayerEntryFont, 
                Size = v50.PlayerNameTextSize, 
                MinSize = v50.PlayerNameTextSize
            };
        end;
    elseif v49.props.player == l_Players_0.LocalPlayer then
        return {
            Font = v51.Font.CaptionHeader.Font, 
            Size = v51.Font.CaptionHeader.RelativeSize * v51.Font.BaseSize, 
            MinSize = v51.Font.Footer.RelativeMinSize * v51.Font.BaseSize
        };
    else
        return {
            Font = v51.Font.CaptionBody.Font, 
            Size = v51.Font.CaptionBody.RelativeSize * v51.Font.BaseSize, 
            MinSize = v51.Font.Footer.RelativeMinSize * v51.Font.BaseSize
        };
    end;
end;
v32.render = function(v52) --[[ Line: 262 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v4 (copy), v16 (copy), v17 (copy), l_FFlagReplacePlayerIconRoduxWithSignal_0 (copy), v18 (copy), v25 (copy), v19 (copy), v20 (copy)
    return l_WithLayoutValues_0(function(v53) --[[ Line: 263 ]]
        -- upvalues: l_withStyle_0 (ref), v52 (copy), v4 (ref), v16 (ref), v17 (ref), l_FFlagReplacePlayerIconRoduxWithSignal_0 (ref), v18 (ref), v25 (ref), v19 (ref), v20 (ref)
        return l_withStyle_0(function(v54) --[[ Line: 264 ]]
            -- upvalues: v52 (ref), v53 (copy), v4 (ref), v16 (ref), v17 (ref), l_FFlagReplacePlayerIconRoduxWithSignal_0 (ref), v18 (ref), v25 (ref), v19 (ref), v20 (ref)
            local v55 = v52:getBackgroundStyle(v53, v54);
            local v56 = v52:getTextStyle(v53, v54);
            local v57 = v52:getPlayerNameFont(v53, v54);
            local v58 = v52:getOverlayStyle(v53, v54);
            local l_entrySize_0 = v52.props.entrySize;
            local v60 = {};
            local v61 = nil;
            if v53.IsTenFoot then
                v61 = UDim.new(0, v53.PlayerEntryPadding);
            end;
            v60.Layout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = v61
            });
            local l_isPressed_0 = v52.state.isPressed;
            local l_forwardRef_0 = v52.props.forwardRef;
            v60.NameFrame = v4.createElement("Frame", {
                LayoutOrder = 0, 
                Size = UDim2.new(0, l_entrySize_0, 0, v53.PlayerEntrySizeY), 
                BackgroundTransparency = 1
            }, {
                Shadow = v4.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = v53.ShadowImage, 
                    Position = UDim2.new(0, -v53.ShadowSize, 0, 0), 
                    Size = UDim2.new(1, v53.ShadowSize * 2, 1, v53.ShadowSize), 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = v53.ShadowSliceRect, 
                    Visible = v53.IsTenFoot
                }), 
                BGFrame = v4.createElement(v16, {
                    sizeX = l_entrySize_0, 
                    sizeY = v53.PlayerEntrySizeY, 
                    isTeamFrame = false, 
                    backgroundStyle = v55, 
                    overlayStyle = v58, 
                    doubleOverlay = l_isPressed_0, 
                    onActivated = v52.onActivated, 
                    onSelectionGained = v52.onSelectionGained, 
                    onSelectionLost = v52.onSelectionLost, 
                    onMouseEnter = v52.onMouseEnter, 
                    onMouseLeave = v52.onMouseLeave, 
                    onMouseDown = v52.onMouseDown, 
                    onInputEnded = v52.onInputEnded, 
                    [v4.Ref] = l_forwardRef_0
                }, {
                    Layout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, v53.PlayerEntryNamePadding)
                    }), 
                    InitalPadding = v4.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v53.InitalPlayerEntryPadding)
                    }), 
                    PlayerIcon = v4.createElement(v17, {
                        player = v52.props.player, 
                        playerIconInfo = if l_FFlagReplacePlayerIconRoduxWithSignal_0 then v52:getPlayerIconInfo() else v52.props.playerIconInfo, 
                        playerRelationship = v52.props.playerRelationship, 
                        layoutOrder = 1
                    }), 
                    PlayerName = v4.createElement(v18, {
                        player = v52.props.player, 
                        isTitleEntry = v52.props.titlePlayerEntry, 
                        isHovered = v52.state.isHovered, 
                        layoutOrder = 3, 
                        textStyle = v56, 
                        textFont = v57
                    })
                })
            });
            local l_MaxLeaderstats_0 = v53.MaxLeaderstats;
            if v52.props.isSmallTouchDevice then
                l_MaxLeaderstats_0 = v53.MaxLeaderstatsSmallScreen;
            end;
            if v25 then
                for v65, v66 in v52.props.gameStatNames do
                    if l_MaxLeaderstats_0 >= v65 then
                        v60["GameStat_" .. v66] = v4.createElement(v19, {
                            statName = v66, 
                            statValue = v52.props.playerStats[v66], 
                            isTitleEntry = v52.props.titlePlayerEntry, 
                            isTeamEntry = false, 
                            layoutOrder = v65, 
                            backgroundStyle = v55, 
                            overlayStyle = v58, 
                            doubleOverlay = l_isPressed_0, 
                            textStyle = v56, 
                            onActivated = v52.onActivated, 
                            onSelectionGained = v52.onSelectionGained, 
                            onSelectionLost = v52.onSelectionLost, 
                            onMouseEnter = v52.onMouseEnter, 
                            onMouseLeave = v52.onMouseLeave, 
                            onMouseDown = v52.onMouseDown, 
                            onInputEnded = v52.onInputEnded
                        });
                    else
                        break;
                    end;
                end;
            else
                for v67, v68 in ipairs(v52.props.gameStats) do
                    if l_MaxLeaderstats_0 >= v67 then
                        v60["GameStat_" .. v68.name] = v4.createElement(v19, {
                            statName = v68.name, 
                            statValue = v52.props.playerStats[v68.name], 
                            isTitleEntry = v52.props.titlePlayerEntry, 
                            isTeamEntry = false, 
                            layoutOrder = v67, 
                            backgroundStyle = v55, 
                            overlayStyle = v58, 
                            doubleOverlay = l_isPressed_0, 
                            textStyle = v56, 
                            onActivated = v52.onActivated, 
                            onSelectionGained = v52.onSelectionGained, 
                            onSelectionLost = v52.onSelectionLost, 
                            onMouseEnter = v52.onMouseEnter, 
                            onMouseLeave = v52.onMouseLeave, 
                            onMouseDown = v52.onMouseDown, 
                            onInputEnded = v52.onInputEnded
                        });
                    else
                        break;
                    end;
                end;
            end;
            if not v53.IsTenFoot then
                v60.BackgroundExtender = v4.createElement(v20, {
                    layoutOrder = 100, 
                    size = UDim2.new(0, v53.ExtraContainerPadding, 1, 0), 
                    backgroundStyle = v55, 
                    overlayStyle = v58, 
                    doubleOverlay = l_isPressed_0
                });
            end;
            return v4.createFragment({
                ChildrenFrame = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, v60), 
                Divider = not v53.IsTenFoot and v52.props.hasDivider and v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = v54.Theme.Divider.Transparency, 
                    BackgroundColor3 = v54.Theme.Divider.Color, 
                    BorderSizePixel = 0
                })
            });
        end);
    end);
end;
v32 = v6.UNSTABLE_connect2(function(v69) --[[ Line: 446 ]] --[[ Name: mapStateToProps ]]
    return {
        selectedPlayer = v69.playerDropDown.selectedPlayer, 
        dropDownOpen = v69.playerDropDown.isVisible, 
        isSmallTouchDevice = v69.displayOptions.isSmallTouchDevice
    };
end, function(v70) --[[ Line: 455 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v22 (copy), v23 (copy)
    return {
        closeDropDown = function() --[[ Line: 457 ]] --[[ Name: closeDropDown ]]
            -- upvalues: v70 (copy), v22 (ref)
            return v70(v22());
        end, 
        openDropDown = function(v71) --[[ Line: 460 ]] --[[ Name: openDropDown ]]
            -- upvalues: v70 (copy), v23 (ref)
            return v70(v23(v71));
        end
    };
end)(v32);
local v74 = v4.forwardRef(function(v72, v73) --[[ Line: 468 ]]
    -- upvalues: v4 (copy), v32 (ref), v3 (copy)
    return v4.createElement(v32, v3.Dictionary.join(v72, {
        forwardRef = v73
    }));
end);
if v25 then
    return v5.memo(v74, v24({
        "gameStatNames"
    }));
else
    return v74;
end;