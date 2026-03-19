local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v6 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Packages.Signals);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local v9 = require(l_CorePackages_0.Packages.Otter);
local v10 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local _ = require(l_CorePackages_0.Workspace.Packages.LeaderboardStore);
local v12 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
local l_useLayoutValues_0 = v12.Common.useLayoutValues;
local l_usePlayerListFocusNavigation_0 = v12.Hooks.usePlayerListFocusNavigation;
local l_useStyle_0 = v8.Core.Style.useStyle;
local l_useFocusGuiObject_0 = v10.useFocusGuiObject;
local l_useFocusedGuiObject_0 = v10.useFocusedGuiObject;
local l_IconButton_0 = v8.App.Button.IconButton;
local l_IconSize_0 = v8.App.ImageSet.Enum.IconSize;
local v21 = v8.App.ImageSet.getIconSize(l_IconSize_0.Small);
local l_Images_0 = v8.App.ImageSet.Images;
local v23 = require(l_Parent_1.Components.Container.PlayerEntryContainer);
local v24 = require(l_Parent_1.Components.Container.TeamListContainer);
local v25 = require(l_Parent_1.Components.Container.TitleBarContainer);
local v26 = require(l_Parent_0.Presentation.PlayerDropDown);
local v27 = require(l_Parent_1.Flags.FFlagPlayerListFixMobileScrolling);
local v28 = game:DefineFastFlag("DisablePlayerListDisplayCloseBtn", false);
local l_FFlagAddNewPlayerListFocusNav_0 = v12.Flags.FFlagAddNewPlayerListFocusNav;
local l_FFlagAddNewPlayerListMobileFocusNav_0 = v12.Flags.FFlagAddNewPlayerListMobileFocusNav;
local l_FFlagPlayerListUseFocusNavHook_0 = v12.Flags.FFlagPlayerListUseFocusNavHook;
local v32 = l_Enabled_0() and not v28;
local v33 = {
    dampingRatio = 1, 
    frequency = 4
};
return v6.memo(function(v34) --[[ Line: 88 ]] --[[ Name: PlayerListDisplayView ]]
    -- upvalues: l_useLayoutValues_0 (copy), l_useStyle_0 (copy), l_useFocusGuiObject_0 (copy), l_FFlagPlayerListUseFocusNavHook_0 (copy), l_useFocusedGuiObject_0 (copy), l_usePlayerListFocusNavigation_0 (copy), v6 (copy), v9 (copy), v33 (copy), l_FFlagAddNewPlayerListFocusNav_0 (copy), l_GuiService_0 (copy), l_UserInputService_0 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (copy), l_LocalPlayer_0 (copy), v23 (copy), v25 (copy), v24 (copy), v27 (copy), l_Enabled_0 (copy), v32 (copy), v21 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), v26 (copy)
    local v35 = l_useLayoutValues_0();
    local v36 = l_useStyle_0();
    local v37 = l_useFocusGuiObject_0();
    local v38 = if not l_FFlagPlayerListUseFocusNavHook_0 then l_useFocusedGuiObject_0() else nil;
    local v39 = if l_FFlagPlayerListUseFocusNavHook_0 then l_usePlayerListFocusNavigation_0() else nil;
    local v40 = v6.useRef(nil);
    local v41 = v6.useRef(nil);
    local v42 = if not l_FFlagPlayerListUseFocusNavHook_0 then v6.useRef(nil) else nil;
    local v43 = if not l_FFlagPlayerListUseFocusNavHook_0 then v6.useRef(nil) else nil;
    local v44 = v6.useRef(v9.createSingleMotor(0));
    local v45, v46 = v6.useState(Vector2.new(0, 0));
    local v47, v48 = v6.useState(100);
    local v49, v50 = v6.useState(0);
    local v51, v52 = v6.useState(true);
    local v53, v54 = v6.useState(Vector2.new(0, 0));
    local v55, v56 = v6.useState(0);
    local v57, v58 = v6.useState(0);
    local v59, v60 = v6.useState(0);
    local v61, v62 = v6.useState(nil);
    local v63, v64 = v6.createBinding(0);
    local v65, v66 = v6.createBinding(0);
    local v67, v68 = v6.createBinding(0);
    local v72 = v6.joinBindings({
        v63, 
        v65, 
        v67
    }):map(function(v69) --[[ Line: 125 ]]
        local v70 = v69[1];
        local v71 = v69[2];
        return v71 + (v69[3] - v71) * v70;
    end);
    local v74 = v6.useCallback(function(v73) --[[ Line: 133 ]]
        -- upvalues: v58 (copy)
        v58(v73.AbsoluteSize.Y);
    end, {});
    local v76 = v6.useCallback(function(v75) --[[ Line: 137 ]]
        -- upvalues: v48 (copy)
        v48(v75.AbsoluteSize.Y);
    end, {});
    local v78 = v6.useCallback(function(v77) --[[ Line: 141 ]]
        -- upvalues: v46 (copy)
        v46(v77.CanvasPosition);
    end, {});
    local v80 = v6.useCallback(function(v79) --[[ Line: 145 ]]
        -- upvalues: v50 (copy)
        v50(v79.AbsolutePosition.Y);
    end, {});
    local v83 = v6.useCallback(function() --[[ Line: 149 ]]
        -- upvalues: v34 (copy)
        if not v34.isSmallTouchDevice then
            return false;
        else
            local v81 = v34.teamList and v34.teamList.getCount(false) > 0 or false;
            local v82 = true;
            if v34.gameStatsCount <= 0 then
                v82 = false;
            end;
            return v81 or v82;
        end;
    end, {
        v34.gameStatsCount, 
        v34.isSmallTouchDevice, 
        v34.teamList
    });
    v6.useEffect(function() --[[ Line: 160 ]]
        -- upvalues: v44 (copy), v64 (copy), v52 (copy)
        v44.current:onStep(v64);
        v44.current:onComplete(function(v84) --[[ Line: 162 ]]
            -- upvalues: v52 (ref)
            if v84 == 0 then
                v52(true);
            end;
        end);
    end, {});
    v6.useEffect(function() --[[ Line: 169 ]]
        -- upvalues: v34 (copy), v52 (copy), v44 (copy), v9 (ref), v33 (ref)
        if v34.isSmallTouchDevice then
            v52(not v34.isMinimized);
            return;
        else
            if v44.current then
                v44.current:setGoal(v9.spring(v34.isMinimized and 1 or 0, v33));
            end;
            if v34.isMinimized then
                v52(false);
            end;
            return;
        end;
    end, {
        v34.isSmallTouchDevice, 
        v34.isMinimized, 
        v44.current
    });
    v6.useEffect(function() --[[ Line: 184 ]]
        -- upvalues: v47 (copy), v34 (copy), v35 (copy), v57 (copy), v56 (copy)
        local v85 = v47 - 8;
        if v34.gameStatsCount > 0 then
            v85 = v85 - (v35.TitleBarSizeY or 0);
        end;
        local v86 = math.min(v57, v85);
        v56(v86);
    end, {
        v47, 
        v57, 
        v34.gameStatsCount, 
        v35.TitleBarSizeY
    });
    v6.useEffect(function() --[[ Line: 195 ]]
        -- upvalues: v53 (copy), v40 (copy), v34 (copy), v60 (copy), v62 (copy)
        local l_X_0 = v53.X;
        local l_Y_0 = v53.Y;
        local l_current_0 = v40.current;
        if v34.isSmallTouchDevice or not l_current_0 then
            v60(l_X_0);
            v62(nil);
            return;
        else
            local v90 = l_X_0 - l_current_0.AbsolutePosition.Y;
            if v90 + l_Y_0 >= l_current_0.AbsoluteSize.Y then
                local v91 = v90 + l_Y_0 - l_current_0.AbsoluteSize.Y;
                v60(v90 - v91);
                v62(Vector2.new(0, l_current_0.CanvasPosition.Y + v91));
                return;
            else
                v60(v90);
                v62(nil);
                return;
            end;
        end;
    end, {
        v53, 
        v34.isSmallTouchDevice, 
        v40.current
    });
    if not l_FFlagPlayerListUseFocusNavHook_0 then
        v6.useEffect(function() --[[ Line: 218 ]]
            -- upvalues: l_FFlagAddNewPlayerListFocusNav_0 (ref), v34 (copy), l_GuiService_0 (ref), v41 (copy), l_UserInputService_0 (ref), v40 (copy)
            if not l_FFlagAddNewPlayerListFocusNav_0 then
                if v34.isVisible then
                    if v34.isDirectionalPreferred and v34.isUsingGamepad then
                        l_GuiService_0.SelectedCoreObject = v41.current;
                        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
                    end;
                    if v40.current and not v34.isSmallTouchDevice then
                        v40.current.SelectionGroup = true;
                        v40.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop;
                        v40.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop;
                        v40.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop;
                        v40.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop;
                        return;
                    end;
                else
                    if v34.isDirectionalPreferred and v34.isUsingGamepad then
                        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
                    end;
                    if v40.current and l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject:IsDescendantOf(v40.current) then
                        l_GuiService_0.SelectedCoreObject = nil;
                    end;
                    if v40.current and not v34.isSmallTouchDevice then
                        v40.current.SelectionGroup = false;
                    end;
                end;
            end;
        end, {
            v34.isVisible, 
            v34.isSmallTouchDevice, 
            v34.isDirectionalPreferred, 
            v34.isUsingGamepad, 
            v41.current, 
            v40.current
        });
        v6.useEffect(function() --[[ Line: 250 ]]
            -- upvalues: l_FFlagAddNewPlayerListFocusNav_0 (ref), v34 (copy), v40 (copy), v37 (copy), l_UserInputService_0 (ref)
            if l_FFlagAddNewPlayerListFocusNav_0 and v34.isVisible and v40.current then
                if v34.isDirectionalPreferred and v34.isUsingGamepad then
                    v37(nil);
                    v37(v40.current);
                    l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
                end;
                if not v34.isSmallTouchDevice then
                    v40.current.SelectionGroup = true;
                    v40.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop;
                    v40.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop;
                    v40.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop;
                    v40.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop;
                end;
            end;
        end, {
            v37, 
            v34.isVisible, 
            v34.isSmallTouchDevice, 
            v34.isDirectionalPreferred, 
            v34.isUsingGamepad, 
            v40.current
        });
        v6.useEffect(function() --[[ Line: 270 ]]
            -- upvalues: l_FFlagAddNewPlayerListMobileFocusNav_0 (ref), v34 (copy), v40 (copy), l_LocalPlayer_0 (ref), v37 (copy)
            if l_FFlagAddNewPlayerListMobileFocusNav_0 and v34.isVisible and v34.isSmallTouchDevice and v34.isUsingGamepad and v40.current then
                local v92 = false;
                if v34.dropDownPlayer and not v34.dropDownVisible then
                    local v93 = nil;
                    v93 = if l_LocalPlayer_0 and v34.dropDownPlayer.UserId == l_LocalPlayer_0.UserId then v40.current:FindFirstChild("TitlePlayer", true) else v40.current:FindFirstChild("PlayerEntry_" .. v34.dropDownPlayer.UserId, true);
                    if v93 and v93:IsA("GuiObject") then
                        v37(v93);
                        v92 = true;
                    end;
                end;
                if not v92 then
                    v37(nil);
                    v37(v40.current);
                end;
            end;
        end, {
            v37, 
            v34.isVisible, 
            v34.dropDownVisible, 
            v34.dropDownPlayer, 
            v34.isSmallTouchDevice, 
            v34.isUsingGamepad, 
            v40.current
        });
        v6.useEffect(function() --[[ Line: 296 ]]
            -- upvalues: l_FFlagAddNewPlayerListFocusNav_0 (ref), v34 (copy), v40 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (ref), l_UserInputService_0 (ref), v38 (copy), v37 (copy)
            if l_FFlagAddNewPlayerListFocusNav_0 and not v34.isVisible and v40.current then
                if (l_FFlagAddNewPlayerListMobileFocusNav_0 and v34.isSmallTouchDevice or v34.isDirectionalPreferred) and v34.isUsingGamepad then
                    l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
                end;
                if v38 and v38:IsDescendantOf(v40.current) then
                    v37(nil);
                end;
                if l_FFlagAddNewPlayerListMobileFocusNav_0 or not v34.isSmallTouchDevice then
                    v40.current.SelectionGroup = false;
                end;
            end;
        end, {
            v38, 
            v37, 
            v34.isVisible, 
            v34.isSmallTouchDevice, 
            v34.isDirectionalPreferred, 
            v34.isUsingGamepad, 
            v40.current
        });
        v6.useEffect(function() --[[ Line: 312 ]]
            -- upvalues: l_FFlagAddNewPlayerListFocusNav_0 (ref), v34 (copy), v38 (copy), v43 (copy), v40 (copy), v37 (copy), v42 (copy)
            if l_FFlagAddNewPlayerListFocusNav_0 and v34.isVisible and not v38 and v43.current and v40.current then
                local l_FirstChild_0 = v40.current:FindFirstChild("PlayerEntry_" .. v43.current, true);
                if l_FirstChild_0 and l_FirstChild_0:IsA("GuiObject") then
                    v37(l_FirstChild_0);
                elseif v42.current and v42.current:IsDescendantOf(v40.current) then
                    v37(v42.current);
                else
                    v37(v40.current);
                end;
                v43.current = nil;
            end;
        end, {
            v38, 
            v37, 
            v34.isVisible, 
            v42.current, 
            v43.current, 
            v40.current
        });
    end;
    if l_FFlagPlayerListUseFocusNavHook_0 then
        v6.useEffect(function() --[[ Line: 334 ]]
            -- upvalues: v34 (copy), v39 (copy)
            if v34.isVisible and v34.isSmallTouchDevice and v34.isUsingGamepad and not v34.dropDownVisible then
                v39.getFocus();
            end;
        end, {
            v39, 
            v34.isVisible, 
            v34.isSmallTouchDevice, 
            v34.isUsingGamepad, 
            v34.dropDownVisible
        });
        v6.useEffect(function() --[[ Line: 341 ]]
            -- upvalues: v34 (copy), v40 (copy), l_GuiService_0 (ref), v39 (copy)
            if not v34.isVisible then
                local v95 = v40.current and l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject:IsDescendantOf(v40.current);
                v39.cleanup(v95);
            end;
        end, {
            v39, 
            v34.isVisible
        });
    end;
    local v99 = if l_FFlagPlayerListUseFocusNavHook_0 then v6.useCallback(function(_, v97, _) --[[ Line: 351 ]]
        -- upvalues: v39 (copy)
        v39.setTitlePlayerInstance(v97);
    end, {
        v39
    }) else nil;
    local v101 = if l_FFlagPlayerListUseFocusNavHook_0 then v6.useCallback(function(_) --[[ Line: 357 ]]
        -- upvalues: v39 (copy)
        v39.setTitlePlayerInstance(nil);
    end, {
        v39
    }) else nil;
    local v102 = {
        UIListLayout = v6.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = if v34.isDirectionalPreferred then UDim.new(0, v35.EntryPadding) else nil
        })
    };
    if l_LocalPlayer_0 and v34.isSmallTouchDevice and v83() then
        v102.TitlePlayer = v6.createElement(v23, {
            entrySizeX = v34.entrySizeX, 
            layoutOrder = -3, 
            titlePlayerEntry = true, 
            player = l_LocalPlayer_0, 
            playerIconInfo = v34.playerIconInfo[l_LocalPlayer_0.UserId] or {
                isPlaceOwner = false
            }, 
            playerRelationship = v34.playerRelationship[l_LocalPlayer_0.UserId] or {
                isBlocked = false, 
                friendStatus = Enum.FriendStatus.NotFriend, 
                isFollowing = false, 
                isFollower = false
            }, 
            setDropDownPlayerDimensionY = v54, 
            registerPlayerInstance = if l_FFlagPlayerListUseFocusNavHook_0 then v99 else nil, 
            unregisterPlayerInstance = if l_FFlagPlayerListUseFocusNavHook_0 then v101 else nil, 
            setSelectedPlayerId = if l_FFlagPlayerListUseFocusNavHook_0 then v39.setSelectedPlayerId else nil
        });
        v102.BottomDiv = v6.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 0, 0), 
            AnchorPoint = Vector2.new(0, 0), 
            BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
            BackgroundTransparency = 0.8, 
            LayoutOrder = -2
        });
    end;
    if v34.isSmallTouchDevice then
        v102.TitleBar = v6.createElement(v25, {
            size = UDim2.new(1, 0, 0, v35.TitleBarSizeY), 
            entrySizeX = v34.entrySizeX, 
            layoutOrder = -1, 
            contentsVisible = v51, 
            isSmallTouchDevice = true
        });
    end;
    if v34.teamListCount > 0 then
        local v103 = 1e999;
        do
            local l_v103_0 = v103;
            v34.teamList.iterateData(function(v105, v106) --[[ Line: 412 ]]
                -- upvalues: l_FFlagAddNewPlayerListFocusNav_0 (ref), l_v103_0 (ref), v102 (copy), v6 (ref), v24 (ref), v34 (copy), l_FFlagPlayerListUseFocusNavHook_0 (ref), v41 (copy), v54 (copy), v42 (copy), v43 (copy), v39 (copy)
                local v107 = false;
                if not l_FFlagAddNewPlayerListFocusNav_0 and v106.order(false) <= l_v103_0 and v106.players.getCount(false) > 0 then
                    l_v103_0 = v106.order(false);
                    v107 = true;
                end;
                v102["TeamList_" .. tostring(v105)] = v6.createElement(v24, {
                    entrySizeX = v34.entrySizeX, 
                    teamId = if l_FFlagPlayerListUseFocusNavHook_0 then v105 else nil, 
                    teamData = v106, 
                    playerIconInfos = v34.playerIconInfo, 
                    playerRelationships = v34.playerRelationship, 
                    firstPlayerRef = if not l_FFlagAddNewPlayerListFocusNav_0 and v107 then v41 else nil, 
                    setDropDownPlayerDimensionY = v54, 
                    prevFocusedEntry = if not l_FFlagPlayerListUseFocusNavHook_0 and l_FFlagAddNewPlayerListFocusNav_0 then v42 else nil, 
                    destroyedFocusedPlayerId = if not l_FFlagPlayerListUseFocusNavHook_0 and l_FFlagAddNewPlayerListFocusNav_0 then v43 else nil, 
                    registerTeamInstance = if l_FFlagPlayerListUseFocusNavHook_0 then v39.registerTeamInstance else nil, 
                    unregisterTeamInstance = if l_FFlagPlayerListUseFocusNavHook_0 then v39.unregisterTeamInstance else nil, 
                    setSelectedPlayerId = if l_FFlagPlayerListUseFocusNavHook_0 then v39.setSelectedPlayerId else nil, 
                    isSmallTouchDevice = v34.isSmallTouchDevice, 
                    isDirectionalPreferred = v34.isDirectionalPreferred
                });
            end, false);
        end;
    end;
    if v34.isSmallTouchDevice then
        local v108 = true;
        if not v27 then
            v108 = not v34.dropDownVisible;
        end;
        return v6.createElement("ScrollingFrame", {
            Active = v27, 
            Size = UDim2.fromScale(1, 1), 
            CanvasSize = UDim2.new(0, 0, 0, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            ScrollBarImageColor3 = v35.ScrollImageColor, 
            ScrollBarImageTransparency = v35.ScrollImageTransparency, 
            BorderSizePixel = 0, 
            ScrollBarThickness = v35.ScrollBarSizeMobile, 
            VerticalScrollBarInset = Enum.ScrollBarInset.None, 
            HorizontalScrollBarInset = Enum.ScrollBarInset.None, 
            ClipsDescendants = true, 
            ScrollingEnabled = v108, 
            ElasticBehavior = Enum.ElasticBehavior.Never, 
            Selectable = false, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            SelectionGroup = l_FFlagAddNewPlayerListMobileFocusNav_0 and true or nil, 
            SelectionBehaviorUp = if l_FFlagAddNewPlayerListMobileFocusNav_0 then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorDown = if l_FFlagAddNewPlayerListMobileFocusNav_0 then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorLeft = if l_FFlagAddNewPlayerListMobileFocusNav_0 then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorRight = if l_FFlagAddNewPlayerListMobileFocusNav_0 then Enum.SelectionBehavior.Stop else nil, 
            ref = if l_FFlagAddNewPlayerListMobileFocusNav_0 then v40 else nil, 
            [v6.Change.CanvasPosition] = v78, 
            [v6.Change.AbsoluteSize] = v76
        }, v102);
    elseif v34.isDirectionalPreferred then
        return v6.createElement("Frame", {
            Position = v35.PlayerScrollListPosition, 
            Size = v35.PlayerScrollListSize, 
            BackgroundTransparency = 1, 
            [v6.Change.AbsoluteSize] = v76
        }, {
            TenFootScrollingFrame = v6.createElement("ScrollingFrame", {
                Size = UDim2.new(1, 0, 1, 0), 
                CanvasSize = UDim2.new(0, 0, 0, 0), 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                ScrollBarImageColor3 = v35.ScrollImageColor, 
                ScrollBarImageTransparency = v35.ScrollImageTransparency, 
                BorderSizePixel = 0, 
                ScrollBarThickness = 6, 
                VerticalScrollBarInset = Enum.ScrollBarInset.Always, 
                ClipsDescendants = true, 
                ScrollingEnabled = not v34.dropDownVisible, 
                Selectable = false, 
                CanvasPosition = v34.dropDownVisible and v61 or v45, 
                ref = v40, 
                [v6.Change.CanvasPosition] = v78
            }, v102)
        });
    else
        local v109 = v35.FadedBackgroundScaleDelta or 0;
        local v110 = v35.ScrollBarOffset or 0;
        local v111 = v35.ScrollBarSize or 0;
        local v112 = if l_Enabled_0() then v36.Theme.BackgroundUIContrast.Color else v36.Theme.BackgroundContrast.Color;
        v66(v35.OverrideBackgroundTransparency * v36.Settings.PreferredTransparency);
        v68(v35.FadedBackgroundTransparency or 0);
        local l_createElement_0 = v6.createElement;
        local v114 = "Frame";
        local v115 = {
            Position = v35.PlayerScrollListPosition, 
            Size = v35.PlayerScrollListSize, 
            BackgroundTransparency = 1, 
            [v6.Change.AbsoluteSize] = v76
        };
        local v116 = {};
        local l_createElement_1 = v6.createElement;
        local v118 = "Frame";
        local v119 = {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        };
        local v121 = {
            UIScale = v6.createElement("UIScale", {
                Scale = v63:map(function(v120) --[[ Line: 531 ]]
                    -- upvalues: v109 (copy)
                    return 1 - v109 * v120;
                end)
            }), 
            UIListLayout = v6.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }), 
            TopRoundedRect = if not v32 then v6.createElement("ImageLabel", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/TopRoundedRect8px.png", 
                ImageColor3 = v112, 
                ImageTransparency = v72, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 24, 18), 
                SliceScale = 0.5, 
                Size = UDim2.new(1, 0, 0, 4)
            }) else v6.createElement("Frame", {
                LayoutOrder = 1, 
                ClipsDescendants = true, 
                Size = UDim2.new(1, 0, 0, v21 + 2), 
                BackgroundTransparency = 1
            }, {
                DismissIconFrame = v6.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, (v21 + 2) * 2), 
                    BackgroundColor3 = v112, 
                    BackgroundTransparency = v72
                }, {
                    DismissButton = v6.createElement(l_IconButton_0, {
                        position = UDim2.new(0, 1, 0, 1), 
                        iconSize = l_IconSize_0.Small, 
                        icon = l_Images_0["icons/navigation/close"], 
                        onActivated = v34.dismissPlayerList
                    }), 
                    UICorner = v6.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 7)
                    })
                })
            })
        };
        local v122 = false;
        if v34.gameStatsCount > 0 then
            v122 = v6.createElement(v25, {
                size = UDim2.new(1, 0, 0, v35.TitleBarSizeY), 
                entrySizeX = v34.entrySizeX, 
                layoutOrder = 2, 
                contentsVisible = v51, 
                showBackground = true, 
                backgroundTransparency = v72
            });
        end;
        v121.TitleBar = v122;
        v121.ScrollingFrameContainer = v6.createElement("Frame", {
            LayoutOrder = 3, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 0, v55), 
            BackgroundColor3 = v112, 
            BackgroundTransparency = v72, 
            BorderSizePixel = 0, 
            [v6.Change.AbsolutePosition] = v80
        }, {
            PlayerDropDown = if v51 then v6.createElement(v26, {
                contentsVisible = v51, 
                selectedPlayer = v34.dropDownPlayer, 
                positionY = v59, 
                minPositionBoundY = -v49 + v35.DropDownScreenSidePadding, 
                maxPositionBoundY = v34.screenSizeY - v49 - v35.DropDownScreenSidePadding
            }) else nil, 
            ScrollingFrameClippingFrame = v6.createElement("Frame", {
                Visible = v51, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true
            }, {
                ScrollingFrame = v6.createElement("ScrollingFrame", {
                    Size = UDim2.new(1, -v110, 0, v55), 
                    CanvasSize = UDim2.new(0, 0, 0, 0), 
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    ScrollBarImageColor3 = v35.ScrollImageColor, 
                    ScrollBarImageTransparency = v35.ScrollImageTransparency, 
                    BorderSizePixel = 0, 
                    ScrollBarThickness = v35.ScrollBarSize, 
                    VerticalScrollBarInset = Enum.ScrollBarInset.Always, 
                    ClipsDescendants = false, 
                    ScrollingEnabled = not v34.dropDownVisible, 
                    Selectable = false, 
                    CanvasPosition = v34.dropDownVisible and v61 or v45, 
                    ref = v40, 
                    [v6.Change.CanvasPosition] = v78
                }, {
                    OffsetUndoFrame = v6.createElement("Frame", {
                        Size = UDim2.new(1, v110 + v111, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        [v6.Change.AbsoluteSize] = v74
                    }, v102)
                })
            })
        });
        v121.BottomRoundedRect = if not v32 then v6.createElement("ImageLabel", {
            LayoutOrder = 4, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/BottomRoundedRect8px.png", 
            ImageColor3 = v112, 
            ImageTransparency = v72, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 24, 16), 
            SliceScale = 0.5, 
            Size = UDim2.new(1, 0, 0, 4)
        }) else v6.createElement("Frame", {
            LayoutOrder = 4, 
            ClipsDescendants = true, 
            Size = UDim2.new(1, 0, 0, 7), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            v6.createElement("Frame", {
                Position = UDim2.new(0, 0, 0, -8), 
                Size = UDim2.new(1, 0, 0, 14), 
                BackgroundColor3 = v112, 
                BackgroundTransparency = v72, 
                BorderSizePixel = 0
            }, {
                v6.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 7)
                })
            })
        });
        v116.SizeOffsetFrame = l_createElement_1(v118, v119, v121);
        return l_createElement_0(v114, v115, v116);
    end;
end);