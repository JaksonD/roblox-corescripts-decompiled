local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Packages.Signals);
local v9 = require(l_CorePackages_0.Packages.SignalsReact);
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local l_InExperienceCapabilities_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities;
local v12 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_SharedFlags_0 = l_CorePackages_0.Workspace.Packages.SharedFlags;
local v14 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local _ = require(l_CorePackages_0.Workspace.Packages.LeaderboardStore);
local _ = require(l_CorePackages_0.Workspace.Packages.PlayerIconInfoStore);
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
local l_useLayoutValues_0 = v14.Common.useLayoutValues;
local l_useStyle_0 = v10.Core.Style.useStyle;
local l_useFocusGuiObject_0 = v12.useFocusGuiObject;
local v21 = require(l_CorePackages_0.Packages.Foundation);
local l_ControlState_0 = v21.Enums.ControlState;
local l_View_0 = v21.View;
local l_EntryFrameView_0 = v14.Presentation.EntryFrameView;
local v25 = require(l_Parent_2.Components.Container.StatEntryContainer);
local v26 = require(l_Parent_1.Presentation.CellExtender);
local v27 = require(l_Parent_0.PlayerIcon);
local v28 = require(l_Parent_1.Presentation.PlayerNameTag);
local l_Constants_0 = v14.Common.Constants;
local l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0 = require(l_SharedFlags_0).GetFFlagGateLeaderboardPlayerDropdownViaGUAC;
local l_FFlagAddNewPlayerListFocusNav_0 = v14.Flags.FFlagAddNewPlayerListFocusNav;
local l_FFlagAddNewPlayerListMobileFocusNav_0 = v14.Flags.FFlagAddNewPlayerListMobileFocusNav;
local l_FFlagRemoveNewPlayerListOverlay_0 = v14.Flags.FFlagRemoveNewPlayerListOverlay;
local l_FFlagEnableMobilePlayerListOnConsole_0 = v14.Flags.FFlagEnableMobilePlayerListOnConsole;
local l_FFlagPlayerListFixLeaderstatsStacking_0 = require(l_SharedFlags_0).FFlagPlayerListFixLeaderstatsStacking;
local l_FFlagPlayerListUseFocusNavHook_0 = v14.Flags.FFlagPlayerListUseFocusNavHook;
local v37 = {
    Transparency = 1, 
    Color = Color3.new(1, 1, 1)
};
local v39 = v7.memo(function(v38) --[[ Line: 118 ]] --[[ Name: IconAndName ]]
    -- upvalues: v7 (copy), v27 (copy), v28 (copy)
    return v7.createElement(v7.Fragment, {}, {
        Layout = v7.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v38.layoutValues.InitalPlayerEntryPadding)
        }), 
        InitalPadding = v7.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v38.layoutValues.InitalPlayerEntryPadding)
        }), 
        PlayerIcon = v7.createElement(v27, {
            player = v38.player, 
            playerIconInfo = v38.playerIconInfo, 
            playerRelationship = v38.playerRelationship, 
            layoutOrder = 1
        }), 
        PlayerName = v7.createElement(v28, {
            player = v38.player, 
            isTitleEntry = v38.titlePlayerEntry, 
            isHovered = v38.isHovered, 
            textStyle = v38.textStyle, 
            textFont = v38.playerNameFont, 
            layoutOrder = 3
        })
    });
end);
local function v69(v40) --[[ Line: 173 ]] --[[ Name: PlayerEntryChildren ]]
    -- upvalues: v7 (copy), v39 (ref), l_EntryFrameView_0 (copy), l_FFlagRemoveNewPlayerListOverlay_0 (copy), l_FFlagPlayerListFixLeaderstatsStacking_0 (copy), v9 (copy), v8 (copy), v25 (copy), v6 (copy), v26 (copy)
    local v41 = v40.isSmallTouchDevice or false;
    local v42 = v40.isDirectionalPreferred or false;
    local l_layoutValues_0 = v40.layoutValues;
    local l_textStyle_0 = v40.textStyle;
    local l_playerNameFont_0 = v40.playerNameFont;
    local l_isHovered_0 = v40.isHovered;
    local l_backgroundStyle_0 = v40.backgroundStyle;
    local l_overlayStyle_0 = v40.overlayStyle;
    local l_isPressed_0 = v40.isPressed;
    local l_gameStats_0 = v40.gameStats;
    local l_playerStats_0 = v40.playerStats;
    local l_gameStatsCount_0 = v40.gameStatsCount;
    local l_playerStatsCount_0 = v40.playerStatsCount;
    local v54 = {};
    local v55 = {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        FillDirection = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    };
    if v42 then
        v55.Padding = UDim.new(0, l_layoutValues_0.PlayerEntryPadding);
    end;
    v54.Layout = v7.createElement("UIListLayout", v55);
    local v56 = v7.createElement(v39, {
        player = v40.player, 
        playerIconInfo = v40.playerIconInfo, 
        playerRelationship = v40.playerRelationship, 
        titlePlayerEntry = v40.titlePlayerEntry, 
        isHovered = l_isHovered_0, 
        textStyle = l_textStyle_0, 
        playerNameFont = l_playerNameFont_0, 
        layoutValues = l_layoutValues_0
    });
    local v57 = {
        LayoutOrder = 0, 
        BackgroundTransparency = 1
    };
    if v41 then
        v57.Size = UDim2.new(0, l_layoutValues_0.PlayerNameSizeXMobile, 0, l_layoutValues_0.PlayerEntrySizeY);
    else
        v57.Size = UDim2.new(0, v40.entrySizeX, 0, l_layoutValues_0.PlayerEntrySizeY);
    end;
    v54.NameFrame = v7.createElement("Frame", v57, v56);
    if v42 then
        v54.NameFrame = v7.createElement("Frame", v57, {
            Shadow = v7.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = l_layoutValues_0.ShadowImage, 
                Position = UDim2.new(0, -l_layoutValues_0.ShadowSize, 0, 0), 
                Size = UDim2.new(1, l_layoutValues_0.ShadowSize * 2, 1, l_layoutValues_0.ShadowSize), 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = l_layoutValues_0.ShadowSliceRect, 
                Visible = v42
            }), 
            BackgroundFrame = v7.createElement(l_EntryFrameView_0, v40.backgroundFrameProps, v56)
        });
    end;
    local l_MaxLeaderstats_0 = l_layoutValues_0.MaxLeaderstats;
    local v59 = {
        isTeamEntry = false, 
        showStatTitle = v40.titlePlayerEntry and v42, 
        textStyle = l_textStyle_0
    };
    if v42 then
        v59.backgroundStyle = l_backgroundStyle_0;
        if not l_FFlagRemoveNewPlayerListOverlay_0 then
            v59.overlayStyle = l_overlayStyle_0;
            v59.doubleOverlay = l_isPressed_0;
        end;
    end;
    if l_FFlagPlayerListFixLeaderstatsStacking_0 then
        local v61 = v9.useSignalState(v8.createComputed(function(v60) --[[ Line: 265 ]]
            -- upvalues: l_gameStats_0 (copy)
            if l_gameStats_0 then
                return (l_gameStats_0.getAllData(v60));
            else
                return {};
            end;
        end));
        local v63 = v9.useSignalState(v8.createComputed(function(v62) --[[ Line: 269 ]]
            -- upvalues: l_playerStats_0 (copy)
            if l_playerStats_0 then
                return (l_playerStats_0.getAllData(v62));
            else
                return {};
            end;
        end));
        for v64, v65 in v61 do
            if l_MaxLeaderstats_0 >= v65.order(false) then
                v54["GameStat_" .. v64] = v7.createElement(v25, v6.Dictionary.join(v59, {
                    statName = v64, 
                    stat = v63[v64]
                }));
            end;
        end;
    elseif l_gameStats_0 and l_gameStatsCount_0 and l_gameStatsCount_0 > 0 and l_playerStats_0 and l_playerStatsCount_0 and l_playerStatsCount_0 >= 0 then
        l_gameStats_0.iterateData(function(v66, v67) --[[ Line: 288 ]]
            -- upvalues: l_MaxLeaderstats_0 (copy), l_playerStats_0 (copy), v54 (copy), v7 (ref), v25 (ref), v6 (ref), v59 (copy)
            if v67.order(false) > l_MaxLeaderstats_0 then
                return;
            else
                local v68 = l_playerStats_0.getData(v66, false);
                v54["GameStat_" .. v66] = v7.createElement(v25, v6.Dictionary.join(v59, {
                    statName = v66, 
                    stat = v68
                }));
                return;
            end;
        end, false);
    end;
    if not l_FFlagRemoveNewPlayerListOverlay_0 and not v41 and not v42 then
        v54.BackgroundExtender = v7.createElement(v26, {
            layoutOrder = 100, 
            size = UDim2.new(0, l_layoutValues_0.ExtraContainerPadding, 1, 0), 
            backgroundStyle = {
                Color = Color3.new(1, 1, 1), 
                Transparency = 1
            }, 
            overlayStyle = {
                Color = Color3.new(1, 1, 1), 
                Transparency = 1
            }, 
            doubleOverlay = l_isPressed_0
        });
    end;
    return v7.createElement(v7.Fragment, {}, v54);
end;
v69 = v7.memo(v69);
local function v115(v70) --[[ Line: 328 ]] --[[ Name: PlayerEntryView ]]
    -- upvalues: l_FFlagPlayerListFixLeaderstatsStacking_0 (copy), v9 (copy), v8 (copy), v7 (copy), l_FFlagPlayerListUseFocusNavHook_0 (copy), l_useFocusGuiObject_0 (copy), l_Enabled_0 (copy), l_useLayoutValues_0 (copy), l_useStyle_0 (copy), l_Players_0 (copy), l_Constants_0 (copy), l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0 (copy), l_InExperienceCapabilities_0 (copy), l_ControlState_0 (copy), v37 (copy), l_FFlagEnableMobilePlayerListOnConsole_0 (copy), l_FFlagRemoveNewPlayerListOverlay_0 (copy), l_FFlagAddNewPlayerListFocusNav_0 (copy), l_GuiService_0 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (copy), l_View_0 (copy), v69 (ref), l_EntryFrameView_0 (copy), v6 (copy)
    local v71 = if l_FFlagPlayerListFixLeaderstatsStacking_0 then nil else v9.useSignalState(v70.playerData.stats.getCount);
    local v73 = v9.useSignalBinding(v8.createComputed(function(v72) --[[ Line: 332 ]]
        -- upvalues: v70 (copy)
        return v70.playerData.order(v72) * 2 - 1;
    end));
    local v74 = v7.useMemo(function() --[[ Line: 336 ]]
        -- upvalues: v70 (copy), v73 (copy)
        if v70.layoutOrder then
            return v70.layoutOrder;
        else
            return v73;
        end;
    end, {
        v70.layoutOrder, 
        v73
    });
    local v75 = v7.useMemo(function() --[[ Line: 340 ]]
        -- upvalues: v70 (copy)
        if v70.playerData.order(false) == 1 then
            return v70.firstPlayerRef;
        else
            return nil;
        end;
    end, {
        v70.playerData.order, 
        v70.firstPlayerRef
    });
    local v76, v77 = v7.useState(false);
    local v78, v79 = v7.useState(false);
    local v80 = v7.useRef(nil);
    local v81 = if not l_FFlagPlayerListUseFocusNavHook_0 then v7.useRef(nil) else nil;
    local v82 = l_useFocusGuiObject_0();
    local v83 = l_Enabled_0();
    local v84 = l_useLayoutValues_0();
    local v85 = l_useStyle_0();
    local v86 = if v70.size then v70.size else UDim2.new(1, v84.EntryXOffset, 0, v84.PlayerEntrySizeY);
    local l_isSmallTouchDevice_0 = v70.isSmallTouchDevice;
    local l_IsTenFoot_0 = v84.IsTenFoot;
    local v89 = v70.player == l_Players_0.LocalPlayer;
    local v92 = v7.useCallback(function() --[[ Line: 362 ]]
        -- upvalues: v70 (copy), l_FFlagPlayerListUseFocusNavHook_0 (ref), l_Constants_0 (ref), l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0 (ref), l_InExperienceCapabilities_0 (ref), v80 (copy)
        if not v70.openDropdown or not v70.closeDropdown then
            return;
        elseif v70.dropdownOpen and v70.selectedPlayer == v70.player then
            v70.closeDropdown();
            return;
        else
            if l_FFlagPlayerListUseFocusNavHook_0 and v70.setSelectedPlayerId then
                if v70.titlePlayerEntry then
                    v70.setSelectedPlayerId(l_Constants_0.SELECTED_TITLE_PLAYER_ID);
                else
                    v70.setSelectedPlayerId(v70.player.UserId);
                end;
            end;
            if l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0() then
                if l_InExperienceCapabilities_0.canViewPlayerDropdownInLeaderboard then
                    v70.openDropdown(v70.player);
                    if v80.current then
                        local v90 = Vector2.new(v80.current.AbsolutePosition.Y, v80.current.AbsoluteSize.Y);
                        if v70.setDropDownPlayerDimensionY then
                            v70.setDropDownPlayerDimensionY(v90);
                            return;
                        end;
                    end;
                end;
            else
                v70.openDropdown(v70.player);
                if v80.current then
                    local v91 = Vector2.new(v80.current.AbsolutePosition.Y, v80.current.AbsoluteSize.Y);
                    if v70.setDropDownPlayerDimensionY then
                        v70.setDropDownPlayerDimensionY(v91);
                    end;
                end;
            end;
            return;
        end;
    end, {
        v70.dropdownOpen, 
        v70.selectedPlayer, 
        v70.player, 
        v70.openDropdown, 
        v70.closeDropdown, 
        v70.setDropDownPlayerDimensionY, 
        v70.titlePlayerEntry, 
        v70.setSelectedPlayerId, 
        v80.current
    });
    local v94 = v7.useCallback(function(v93) --[[ Line: 403 ]]
        -- upvalues: l_ControlState_0 (ref), v79 (copy), v77 (copy)
        if v93 == l_ControlState_0.Pressed or v93 == l_ControlState_0.SelectedPressed then
            v79(true);
            return;
        elseif v93 == l_ControlState_0.Hover or v93 == l_ControlState_0.Selected then
            v77(true);
            return;
        else
            if v93 == l_ControlState_0.Default then
                v77(false);
                v79(false);
            end;
            return;
        end;
    end, {});
    local v95 = v7.useMemo(function() --[[ Line: 414 ]]
        -- upvalues: v83 (copy), v85 (copy)
        return {
            Color = if v83 then v85.Theme.BackgroundUIContrast.Color else v85.Theme.BackgroundContrast.Color, 
            Transparency = 1
        };
    end, {
        v83, 
        l_IsTenFoot_0
    });
    local v96 = v7.useMemo(function() --[[ Line: 424 ]]
        -- upvalues: v84 (copy)
        return {
            Color = v84.RowHoverColor, 
            Transparency = 0.8
        };
    end, {
        v84
    });
    local v97 = v7.useMemo(function() --[[ Line: 431 ]]
        -- upvalues: v84 (copy)
        return {
            Color = v84.RowDefaultColor, 
            Transparency = 0.8
        };
    end, {
        v84
    });
    local v100 = v7.useCallback(function() --[[ Line: 439 ]]
        -- upvalues: l_isSmallTouchDevice_0 (copy), v76 (copy), v78 (copy), v96 (copy), v97 (copy), l_IsTenFoot_0 (copy), v95 (copy), v70 (copy), v84 (copy)
        if l_isSmallTouchDevice_0 then
            return (v76 or v78) and v96 or v97;
        elseif not l_IsTenFoot_0 then
            return v95;
        else
            local v98 = v70.dropdownOpen and v70.selectedPlayer == v70.player;
            local l_v76_0 = v76;
            if v70.titlePlayerEntry and v84.BackgroundStyle then
                if l_v76_0 and v84.BackgroundStyle.HoveredTitle then
                    return v84.BackgroundStyle.HoveredTitle;
                elseif v84.BackgroundStyle.Title then
                    return v84.BackgroundStyle.Title;
                end;
            end;
            if v98 and v84.BackgroundStyle and v84.BackgroundStyle.Selected then
                return v84.BackgroundStyle.Selected or v84.BackgroundStyle.Default;
            elseif l_v76_0 and v84.BackgroundStyle and v84.BackgroundStyle.Hovered then
                return v84.BackgroundStyle.Hovered;
            elseif v84.BackgroundStyle and v84.BackgroundStyle.Default then
                return v84.BackgroundStyle.Default;
            else
                return v95;
            end;
        end;
    end, {
        v95, 
        l_isSmallTouchDevice_0, 
        v70.dropdownOpen, 
        v70.selectedPlayer, 
        v70.player, 
        v70.titlePlayerEntry, 
        v76, 
        v78
    });
    local v101 = v7.useCallback(function() --[[ Line: 484 ]]
        -- upvalues: l_IsTenFoot_0 (copy), v76 (copy), v84 (copy), v89 (copy), v85 (copy)
        if l_IsTenFoot_0 then
            if v76 then
                return v84.HoveredTextStyle, v84.PlayerNameTextSize;
            else
                return v84.DefaultTextStyle, v84.PlayerNameTextSize;
            end;
        elseif v89 then
            return v85.Theme.TextEmphasis, v84.PlayerNameTextSize;
        else
            return v85.Theme.TextDefault, v84.PlayerNameTextSize;
        end;
    end, {
        v76, 
        v89, 
        l_IsTenFoot_0, 
        v84, 
        v85
    });
    local v103 = v7.useCallback(function() --[[ Line: 505 ]]
        -- upvalues: l_IsTenFoot_0 (copy), v70 (copy), v78 (copy), v85 (copy), v76 (copy), v37 (ref)
        if not l_IsTenFoot_0 then
            local v102 = v70.dropdownOpen and v70.selectedPlayer == v70.player;
            if v78 then
                return v85.Theme.BackgroundOnPress;
            elseif v102 then
                return v85.Theme.BackgroundOnPress;
            elseif v76 then
                return v85.Theme.BackgroundOnHover;
            end;
        end;
        return v37;
    end, {
        v76, 
        v78, 
        v70.dropdownOpen, 
        v70.selectedPlayer, 
        v70.player, 
        v85, 
        l_IsTenFoot_0
    });
    local v104 = v7.useMemo(function() --[[ Line: 528 ]]
        -- upvalues: l_isSmallTouchDevice_0 (copy), v89 (copy), v85 (copy), l_FFlagEnableMobilePlayerListOnConsole_0 (ref), v84 (copy), l_IsTenFoot_0 (copy), v70 (copy)
        if l_isSmallTouchDevice_0 then
            if v89 then
                return {
                    Font = v85.Font.CaptionHeader.Font, 
                    Size = if l_FFlagEnableMobilePlayerListOnConsole_0 then v84.PlayerNameTextSize else v85.Font.CaptionHeader.RelativeSize * v85.Font.BaseSize, 
                    MinSize = if l_FFlagEnableMobilePlayerListOnConsole_0 then v84.PlayerNameTextSize else v85.Font.Footer.RelativeMinSize * v85.Font.BaseSize
                };
            else
                return {
                    Font = v85.Font.CaptionBody.Font, 
                    Size = if l_FFlagEnableMobilePlayerListOnConsole_0 then v84.PlayerNameTextSize else v85.Font.CaptionBody.RelativeSize * v85.Font.BaseSize, 
                    MinSize = if l_FFlagEnableMobilePlayerListOnConsole_0 then v84.PlayerNameTextSize else v85.Font.Footer.RelativeMinSize * v85.Font.BaseSize
                };
            end;
        elseif l_IsTenFoot_0 then
            if v70.titlePlayerEntry then
                return {
                    Font = v84.TitlePlayerEntryFont, 
                    Size = v84.PlayerNameTextSize, 
                    MinSize = v84.PlayerNameTextSize
                };
            else
                return {
                    Font = v84.PlayerEntryFont, 
                    Size = v84.PlayerNameTextSize, 
                    MinSize = v84.PlayerNameTextSize
                };
            end;
        elseif v89 then
            return {
                Font = v85.Font.CaptionHeader.Font, 
                Size = v85.Font.CaptionHeader.RelativeSize * v85.Font.BaseSize, 
                MinSize = v85.Font.Footer.RelativeMinSize * v85.Font.BaseSize
            };
        else
            return {
                Font = v85.Font.CaptionBody.Font, 
                Size = v85.Font.CaptionBody.RelativeSize * v85.Font.BaseSize, 
                MinSize = v85.Font.Footer.RelativeMinSize * v85.Font.BaseSize
            };
        end;
    end, {
        l_isSmallTouchDevice_0, 
        l_IsTenFoot_0, 
        v89, 
        v85, 
        v84
    });
    local v105 = v100();
    local v106 = v101();
    local v107 = nil;
    if not l_FFlagRemoveNewPlayerListOverlay_0 then
        v107 = v103();
    end;
    local v108 = v7.useMemo(function() --[[ Line: 581 ]]
        -- upvalues: v70 (copy), v84 (copy), v105 (copy), l_FFlagRemoveNewPlayerListOverlay_0 (ref), v107 (ref), v78 (copy), v75 (copy), l_FFlagPlayerListUseFocusNavHook_0 (ref), l_FFlagAddNewPlayerListFocusNav_0 (ref), v81 (copy), v92 (copy), v94 (copy)
        return {
            size = UDim2.new(0, v70.entrySizeX, 0, v84.PlayerEntrySizeY), 
            isTeamFrame = false, 
            backgroundStyle = v105, 
            overlayStyle = if l_FFlagRemoveNewPlayerListOverlay_0 then nil else v107, 
            doubleOverlay = if l_FFlagRemoveNewPlayerListOverlay_0 then nil else v78, 
            firstPlayerRef = v75, 
            ref = if not l_FFlagPlayerListUseFocusNavHook_0 and l_FFlagAddNewPlayerListFocusNav_0 then v81 else nil, 
            onActivated = v92, 
            onStateChanged = v94
        };
    end, {
        v70.entrySizeX, 
        v84.PlayerEntrySizeY, 
        v105, 
        v107, 
        v78, 
        v81, 
        v92, 
        v94
    });
    local v109 = v7.useMemo(function() --[[ Line: 605 ]]
        -- upvalues: l_isSmallTouchDevice_0 (copy), l_IsTenFoot_0 (copy), v84 (copy), v106 (copy), v104 (copy), v76 (copy), v105 (copy), l_FFlagRemoveNewPlayerListOverlay_0 (ref), v107 (ref), v78 (copy), v70 (copy), v71 (copy), v108 (copy)
        return {
            isSmallTouchDevice = l_isSmallTouchDevice_0, 
            isDirectionalPreferred = l_IsTenFoot_0, 
            layoutValues = v84, 
            textStyle = v106, 
            playerNameFont = v104, 
            isHovered = v76, 
            backgroundStyle = v105, 
            overlayStyle = if l_FFlagRemoveNewPlayerListOverlay_0 then nil else v107, 
            isPressed = if l_FFlagRemoveNewPlayerListOverlay_0 then nil else v78, 
            player = v70.player, 
            playerIconInfo = v70.playerIconInfo, 
            playerRelationship = v70.playerRelationship, 
            titlePlayerEntry = v70.titlePlayerEntry, 
            entrySizeX = v70.entrySizeX, 
            gameStats = v70.gameStats, 
            playerStats = v70.playerData.stats, 
            playerStatsCount = v71, 
            gameStatsCount = v70.gameStatsCount, 
            backgroundFrameProps = v108
        };
    end, {
        l_isSmallTouchDevice_0, 
        l_IsTenFoot_0, 
        v84, 
        v106, 
        v104, 
        v76, 
        v105, 
        v107, 
        v78, 
        v70.player, 
        v70.playerIconInfo, 
        v70.playerRelationship, 
        v70.titlePlayerEntry, 
        v70.entrySizeX, 
        v70.playerData.stats, 
        v70.gameStats, 
        v71, 
        v70.gameStatsCount, 
        v108
    });
    if not l_FFlagPlayerListUseFocusNavHook_0 then
        v7.useEffect(function() --[[ Line: 650 ]]
            -- upvalues: l_FFlagAddNewPlayerListFocusNav_0 (ref), v81 (copy), v70 (copy), l_GuiService_0 (ref), v82 (copy)
            local v110 = nil;
            local v111 = nil;
            if l_FFlagAddNewPlayerListFocusNav_0 and v81.current and v70.prevFocusedEntry and v70.destroyedFocusedPlayerId then
                local l_current_0 = v81.current;
                v110 = v81.current.SelectionLost:Connect(function() --[[ Line: 658 ]]
                    -- upvalues: v70 (ref), l_current_0 (copy)
                    v70.prevFocusedEntry.current = l_current_0;
                end);
                v111 = v81.current.Destroying:Connect(function() --[[ Line: 663 ]]
                    -- upvalues: v110 (ref), l_GuiService_0 (ref), l_current_0 (copy), v70 (ref), v82 (ref), v111 (ref)
                    v110:Disconnect();
                    if l_GuiService_0.SelectedCoreObject == l_current_0 then
                        v70.destroyedFocusedPlayerId.current = v70.player.UserId;
                        v82(nil);
                    end;
                    v111:Disconnect();
                end);
            end;
            return function() --[[ Line: 677 ]]
                -- upvalues: v110 (ref)
                if v110 then
                    v110:Disconnect();
                end;
            end;
        end, {
            v82, 
            v70.player, 
            v70.prevFocusedEntry, 
            v70.destroyedFocusedPlayerId, 
            v81.current
        });
    end;
    if l_FFlagPlayerListUseFocusNavHook_0 then
        v7.useEffect(function() --[[ Line: 686 ]]
            -- upvalues: v70 (copy)
            return function() --[[ Line: 687 ]]
                -- upvalues: v70 (ref)
                if v70.unregisterPlayerInstance then
                    v70.unregisterPlayerInstance(v70.player.UserId);
                end;
            end;
        end, {
            v70.unregisterPlayerInstance, 
            v70.player
        });
    end;
    local v114 = v7.useCallback(function(v113) --[[ Line: 695 ]]
        -- upvalues: l_FFlagPlayerListUseFocusNavHook_0 (ref), v70 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (ref), v81 (copy), v80 (copy)
        if l_FFlagPlayerListUseFocusNavHook_0 and v70.registerPlayerInstance then
            v70.registerPlayerInstance(v70.player.UserId, v113, v70.playerData.order);
        end;
        if not l_FFlagPlayerListUseFocusNavHook_0 and l_FFlagAddNewPlayerListMobileFocusNav_0 then
            v81.current = v113;
            return;
        else
            v80.current = v113;
            return;
        end;
    end, {
        v70.player, 
        v70.playerData, 
        v70.registerPlayerInstance
    });
    if l_isSmallTouchDevice_0 then
        return v7.createElement(l_View_0, {
            Size = v86, 
            BackgroundColor3 = v105.Color, 
            BackgroundTransparency = v105.Transparency, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            Image = "", 
            LayoutOrder = v74, 
            ref = v114, 
            onActivated = v92, 
            onStateChanged = v94
        }, {
            ChildrenFrame = v7.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1
            }, v7.createElement(v69, v109))
        });
    elseif l_IsTenFoot_0 then
        return v7.createElement("Frame", {
            Size = v86, 
            BackgroundTransparency = 1, 
            LayoutOrder = v74, 
            ref = if l_FFlagPlayerListUseFocusNavHook_0 then v114 else v80
        }, v7.createElement(v69, v109));
    else
        return v7.createElement("Frame", {
            Size = v86, 
            BackgroundTransparency = 1, 
            LayoutOrder = v74, 
            ref = if l_FFlagPlayerListUseFocusNavHook_0 then v114 else v80
        }, {
            PlayerEntryContentFrame = v7.createElement(l_EntryFrameView_0, v6.Dictionary.join(v108, {
                size = UDim2.new(1, 0, 0, v84.PlayerEntrySizeY)
            }), v7.createElement(v69, v109))
        });
    end;
end;
return v7.memo(v115);