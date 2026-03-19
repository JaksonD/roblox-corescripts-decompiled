local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Packages.Signals);
local v5 = require(l_CorePackages_0.Workspace.Packages.Display);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local v9 = require(l_CorePackages_0.Packages.Otter);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v11 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local l_useLayoutValues_0 = v11.Common.useLayoutValues;
local l_Constants_0 = v11.Common.Constants;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v15 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v16 = require(l_Modules_0.TopBar.Constants);
local v17 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v21 = require(l_Parent_1.Flags.FFlagPlayerListClosedNoRender);
local v22 = require(l_Parent_1.Actions.SetPlayerListVisibility);
local v23 = require(l_Parent_1.Actions.SetIsUsingGamepad);
local v24 = require(l_Parent_1.Components.Container.PlayerListDisplayContainer);
local v25 = require(l_Parent_0.PlayerDropDown);
local v26 = require(l_Parent_0.PlayerListSorter);
local l_Connection_0 = l_Parent_1.Components.Connection;
local v28 = require(l_Connection_0.EventConnections);
local v29 = require(l_Connection_0.ContextActionsBinder);
local v30 = require(l_Connection_0.TopStatConnector);
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v32 = require(l_Parent_1.Flags.FFlagPlayerListFixMobileScrolling);
local l_FFlagUseNewPlayerList_0 = v11.Flags.FFlagUseNewPlayerList;
local l_FFlagAddNewPlayerListFocusNav_0 = v11.Flags.FFlagAddNewPlayerListFocusNav;
local l_FFlagEnableMobilePlayerListOnConsole_0 = v11.Flags.FFlagEnableMobilePlayerListOnConsole;
local l_FFlagPlayerListIgnoreDevGamepadBindings_0 = v11.Flags.FFlagPlayerListIgnoreDevGamepadBindings;
local v37 = {
    dampingRatio = 1, 
    frequency = 4
};
local function _(v38, v39, v40, v41, v42) --[[ Line: 67 ]] --[[ Name: map ]]
    return (v38 - v39) * (v42 - v41) / (v40 - v39) + v41;
end;
local v44 = v7.PureComponent:extend("PlayerListApp");
local function v56(v45, v46, v47, v48, v49) --[[ Line: 73 ]] --[[ Name: playerListSizeFromViewportSize ]]
    -- upvalues: l_FFlagEnableMobilePlayerListOnConsole_0 (copy), l_FFlagUseNewPlayerList_0 (copy), v17 (copy), v16 (copy)
    local v50 = math.min(v46.x, v46.y);
    local v51 = math.max(v46.x, v46.y);
    local v52 = (v50 - 320) * 60 / 55 + 270;
    local v53 = (v51 - 480) * 46 / 190 + 434;
    v52 = if l_FFlagEnableMobilePlayerListOnConsole_0 and v52 > 500 then v48 else math.clamp(v52, math.min(270, v50 - 24), 500);
    v53 = if l_FFlagEnableMobilePlayerListOnConsole_0 and v53 > 600 then v49 else math.clamp(v53, math.min(434, v51 - 24), 600);
    local v54 = v46.x > v46.y and v53 or v52;
    local v55 = v46.y > v46.x and v53 or v52;
    if l_FFlagUseNewPlayerList_0 and not l_FFlagEnableMobilePlayerListOnConsole_0 then
        v54 = v54 * v47;
        v55 = v55 * v47;
    end;
    if v17 and v46.y < v46.x then
        v55 = v55 - (v16.TopBarHeight * v45.state.UiScale - 24);
    end;
    return UDim2.fromOffset(v54, v55);
end;
local _ = function(v57) --[[ Line: 119 ]] --[[ Name: shouldShowNeutralTeam ]]
    for _, v59 in ipairs(v57) do
        if v59.Team == nil then
            return true;
        end;
    end;
    return false;
end;
local function v71(v61, v62) --[[ Line: 128 ]] --[[ Name: getTeamCount ]]
    local v63 = false;
    local v64 = {};
    local v65 = 0;
    for _, v67 in pairs(v61) do
        if not v64[v67.TeamColor.Number] then
            v64[v67.TeamColor.Number] = true;
            v65 = v65 + 1;
        end;
    end;
    if v65 > 0 then
        local v68;
        for _, v70 in ipairs(v62) do
            if v70.Team == nil then
                v68 = true;
                v63 = true;
            end;
            if v63 then
                break;
            end;
        end;
        if not v63 then
            v68 = false;
        end;
        v63 = false;
        if v68 then
            v65 = v65 + 1;
        end;
    end;
    return v65;
end;
v44.init = function(v72) --[[ Line: 143 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v5 (copy), v7 (copy), v9 (copy), v21 (copy)
    v72.state = {
        visible = false
    };
    v72.disposeUiScaleEffect = v4.createEffect(function(v73) --[[ Line: 148 ]]
        -- upvalues: v5 (ref), v72 (copy)
        local v74 = v5.GetDisplayStore(v73);
        v72:setState({
            UiScale = v74.getUIScale(v73)
        });
    end);
    local v75, v76 = v7.createBinding(0.5);
    v72.bodyTransparency = v75;
    v72.updateBodyTransparency = v76;
    v72.bodyTransparencyMotor = v9.createSingleMotor(1);
    v72.bodyTransparencyMotor:onStep(function(v77) --[[ Line: 157 ]]
        -- upvalues: v72 (copy), v21 (ref)
        v72.updateBodyTransparency(v77);
        if not v21 then
            if v77 < 0.5 and v72.props.displayOptions.isVisible then
                if not v72.state.visible then
                    v72:setState({
                        visible = true
                    });
                end;
            elseif v72.state.visible then
                v72:setState({
                    visible = false
                });
            end;
        end;
        local l_setLayerCollectorEnabled_0 = v72.props.setLayerCollectorEnabled;
        local v79 = true;
        if v77 >= 0.99 then
            v79 = v72.props.displayOptions.isVisible;
        end;
        l_setLayerCollectorEnabled_0(v79);
    end);
    if v21 then
        v72.bodyTransparencyMotor:onComplete(function() --[[ Line: 175 ]]
            -- upvalues: v72 (copy)
            if not v72.props.displayOptions.isVisible then
                v72:setState({
                    visible = false
                });
            end;
        end);
    end;
    v75, v76 = v7.createBinding(0);
    v72.bgTransparency = v75;
    v72.updateBgTransparency = v76;
    v72.bgTransparencyMotor = v9.createSingleMotor(1);
    v72.bgTransparencyMotor:onStep(v72.updateBgTransparency);
    v75, v76 = v7.createBinding(1);
    v72.frameScale = v75;
    v72.updateFrameScale = v76;
    v72.frameScaleMotor = v9.createSingleMotor(0);
    v72.frameScaleMotor:onStep(function(v80) --[[ Line: 190 ]]
        -- upvalues: v72 (copy)
        v72.updateFrameScale(v80);
    end);
    v72.titleRef = v7.createRef();
    v72.closeRef = v7.createRef();
end;
v44.renderBodyChildren = function(v81, _, v83) --[[ Line: 198 ]] --[[ Name: renderBodyChildren ]]
    -- upvalues: l_FFlagUseNewPlayerList_0 (copy), v7 (copy), l_AppFonts_0 (copy), v15 (copy)
    local l_visible_0 = v81.state.visible;
    local l_isDropDownVisible_0 = v81.props.isDropDownVisible;
    local v86 = if l_FFlagUseNewPlayerList_0 then v81.props.tokens.Size.Size_1100 else 44;
    local v87 = if l_FFlagUseNewPlayerList_0 then v81.props.tokens.Size.Size_500 else 22;
    return {
        UIScale = v7.createElement("UIScale", {
            Scale = v81.frameScale
        }), 
        UICorner = v7.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        }), 
        TitleText = v7.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, v86), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            Font = l_AppFonts_0.default:getBold(), 
            Visible = l_visible_0 and not l_isDropDownVisible_0, 
            TextSize = if l_FFlagUseNewPlayerList_0 then v81.props.tokens.FontSize.FontSize_500 else 22, 
            TextColor3 = Color3.fromRGB(240, 240, 240), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Text = v15:FormatByKey("InGame.PlayerList.Leaderboard"), 
            [v7.Ref] = v81.titleRef
        }), 
        CloseButton = v7.createElement("ImageButton", {
            Image = "rbxasset://textures/ui/InspectMenu/x.png", 
            ImageColor3 = Color3.fromRGB(255, 255, 255), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.fromOffset(v87, v87), 
            Position = UDim2.fromOffset(v87 / 2, v87), 
            BackgroundTransparency = 1, 
            Visible = l_visible_0 and not l_isDropDownVisible_0, 
            ZIndex = 0, 
            [v7.Ref] = v81.closeRef, 
            [v7.Event.Activated] = function() --[[ Line: 239 ]]
                -- upvalues: v81 (copy)
                v81.props.setPlayerListVisible(false);
            end
        }), 
        ContentFrame = v7.createElement("Frame", {
            Position = UDim2.new(0.5, 0, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 1), 
            Size = UDim2.new(1, 0, 1, -v86), 
            BackgroundTransparency = 1, 
            Visible = l_visible_0 and not l_isDropDownVisible_0, 
            AutoLocalize = false
        }, v83)
    };
end;
v44.render = function(v88) --[[ Line: 255 ]] --[[ Name: render ]]
    -- upvalues: v21 (copy), v7 (copy), v29 (copy), l_WithLayoutValues_0 (copy), l_FFlagEnableMobilePlayerListOnConsole_0 (copy), l_Players_0 (copy), v71 (copy), v16 (copy), l_FFlagUseNewPlayerList_0 (copy), v24 (copy), v26 (copy), l_FFlagAddNewPlayerListFocusNav_0 (copy), v28 (copy), v30 (copy), v32 (copy), v25 (copy), v17 (copy), v56 (copy)
    if v21 and not v88.state.visible then
        return v7.createElement(v29);
    else
        return l_WithLayoutValues_0(function(v89) --[[ Line: 259 ]]
            -- upvalues: l_FFlagEnableMobilePlayerListOnConsole_0 (ref), v88 (copy), l_Players_0 (ref), v71 (ref), v16 (ref), v7 (ref), l_FFlagUseNewPlayerList_0 (ref), v24 (ref), v26 (ref), l_FFlagAddNewPlayerListFocusNav_0 (ref), v28 (ref), v29 (ref), v30 (ref), v32 (ref), v25 (ref), v17 (ref), v56 (ref)
            if l_FFlagEnableMobilePlayerListOnConsole_0 then
                v89 = v88.props.layoutValues;
            end;
            local v90 = nil;
            if v89.IsTenFoot then
                v90 = v89.EntrySizeX;
            else
                v90 = v89.EntryBaseSizeX + 4 * v89.EntrySizeIncreasePerStat;
                local v91 = v89.PlayerDropDownSizeXMobile + v89.PlayerDropDownOffset;
                local v92 = v89.ContainerPadding * 2 + v91;
                if v88.props.screenSizeX - v92 < v90 then
                    v90 = v88.props.screenSizeX - v92;
                end;
            end;
            local v93 = 1e999;
            local v94 = false;
            if l_Players_0.MaxPlayers >= 6 then
                v94 = l_Players_0.MaxPlayers <= 12;
            end;
            if v94 then
                v93 = l_Players_0.MaxPlayers * 26 + v71(v88.props.teams, v88.props.players) * 20;
            end;
            local v95 = v16.TopBarHeight * v88.state.UiScale;
            local v96 = {};
            if v88.state.visible then
                v96.PlayerScrollList = v7.createElement(if l_FFlagUseNewPlayerList_0 then v24 else v26, {
                    screenSizeY = v88.props.screenSizeY, 
                    entrySize = v90, 
                    isVisible = if l_FFlagAddNewPlayerListFocusNav_0 then v88.props.displayOptions.isVisible else nil
                });
            end;
            v96.EventConnections = v7.createElement(v28);
            v96.ContextActionsBindings = v7.createElement(v29);
            v96.TopStatConnector = v7.createElement(v30);
            return v7.createElement("ImageButton", {
                Active = v88.props.displayOptions.isVisible, 
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundColor3 = Color3.fromRGB(17, 18, 20), 
                BackgroundTransparency = v88.bgTransparency, 
                BorderColor3 = Color3.fromRGB(0, 0, 0), 
                BorderSizePixel = 0, 
                AutoLocalize = false, 
                AutoButtonColor = false, 
                Selectable = not v32, 
                Image = "", 
                [v7.Event.Activated] = function() --[[ Line: 311 ]]
                    -- upvalues: v88 (ref)
                    v88.props.setPlayerListVisible(false);
                end
            }, {
                PlayerDropDown = v7.createElement(v25, {
                    contentsVisible = true, 
                    selectedPlayer = v88.props.dropDownPlayer
                }), 
                BodyPadding = if v17 and v88.props.screenSizeY < v88.props.screenSizeX then v7.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v95)
                }) else nil, 
                BodyBackground = v7.createElement("Frame", {
                    Size = v56(v88, Vector2.new(v88.props.screenSizeX, v88.props.screenSizeY), v88.state.UiScale, if l_FFlagUseNewPlayerList_0 then v89.PlayerListSizeMin else nil, if l_FFlagUseNewPlayerList_0 then v89.PlayerListSizeMax else nil), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    BackgroundColor3 = Color3.fromRGB(17, 18, 20), 
                    BackgroundTransparency = v88.bodyTransparency, 
                    BorderColor3 = Color3.fromRGB(0, 0, 0), 
                    BorderSizePixel = 0
                }, v88:renderBodyChildren(v93, v96))
            });
        end);
    end;
end;
v44.didMount = function(v97) --[[ Line: 345 ]] --[[ Name: didMount ]]
    v97.props.setLayerCollectorEnabled(false);
    v97:setState({
        visible = v97.props.displayOptions.isVisible
    });
end;
v44.willUnmount = function(v98) --[[ Line: 352 ]] --[[ Name: willUnmount ]]
    v98.props.setLayerCollectorEnabled(true);
    if v98.disposeUiScaleEffect then
        v98.disposeUiScaleEffect();
    end;
end;
v44.didUpdate = function(v99, v100, _) --[[ Line: 359 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagPlayerListIgnoreDevGamepadBindings_0 (copy), l_GuiService_0 (copy), l_Constants_0 (copy), v21 (copy), l_UserInputService_0 (copy), v9 (copy), v37 (copy)
    local l_isVisible_0 = v99.props.displayOptions.isVisible;
    local l_isDropDownVisible_1 = v99.props.isDropDownVisible;
    if l_FFlagPlayerListIgnoreDevGamepadBindings_0 and l_isVisible_0 ~= v100.displayOptions.isVisible then
        l_GuiService_0:SetMenuIsOpen(l_isVisible_0, l_Constants_0.PLAYER_LIST_MENU);
    end;
    if not v21 and l_isVisible_0 ~= v100.displayOptions.isVisible and not l_isVisible_0 then
        v99:setState({
            visible = l_isVisible_0
        });
    end;
    if v21 and l_isVisible_0 then
        v99:setState({
            visible = true
        });
    end;
    if l_isVisible_0 ~= v100.displayOptions.isVisible and l_isVisible_0 then
        local v104 = l_UserInputService_0:GetLastInputType().Name:find("Gamepad") ~= nil;
        v99.props.setIsUsingGamepad(v104);
    end;
    local v105 = (not not l_isDropDownVisible_1 or l_isVisible_0) and 0.7 or 1;
    v99.bgTransparencyMotor:setGoal(v9.spring(v105, v37));
    local v106 = l_isDropDownVisible_1 and l_isVisible_0;
    local v107 = 1.25;
    if v106 then
        v107 = 0.95;
    elseif l_isVisible_0 then
        v107 = 1;
    end;
    v99.frameScaleMotor:setGoal(v9.spring(v107, v37));
    local v108 = 1;
    if v106 then
        v108 = 0.8 * v99.props.preferredTransparency;
    elseif l_isVisible_0 then
        v108 = 0.2 * v99.props.preferredTransparency;
    end;
    v99.bodyTransparencyMotor:setGoal(v9.spring(v108, v37));
end;
local function v110(v109) --[[ Line: 413 ]] --[[ Name: mapStateToProps ]]
    return {
        isDropDownVisible = v109.playerDropDown.isVisible, 
        screenSizeX = v109.screenSize.X, 
        screenSizeY = v109.screenSize.Y, 
        preferredTransparency = v109.settings.preferredTransparency, 
        displayOptions = v109.displayOptions, 
        players = v109.players, 
        playerStats = v109.playerStats, 
        playerIconInfo = v109.playerIconInfo, 
        playerRelationship = v109.playerRelationship, 
        gameStats = v109.gameStats, 
        teams = v109.teams
    };
end;
local function v114(v111) --[[ Line: 433 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v22 (copy), v23 (copy)
    return {
        setPlayerListVisible = function(v112) --[[ Line: 435 ]] --[[ Name: setPlayerListVisible ]]
            -- upvalues: v111 (copy), v22 (ref)
            return v111(v22(v112));
        end, 
        setIsUsingGamepad = function(v113) --[[ Line: 438 ]] --[[ Name: setIsUsingGamepad ]]
            -- upvalues: v111 (copy), v23 (ref)
            return v111(v23(v113));
        end
    };
end;
local function v118(v115) --[[ Line: 444 ]]
    -- upvalues: l_FFlagEnableMobilePlayerListOnConsole_0 (copy), l_useLayoutValues_0 (copy), l_FFlagUseNewPlayerList_0 (copy), l_useTokens_0 (copy), v7 (copy), v44 (copy), v6 (copy)
    local v116 = if l_FFlagEnableMobilePlayerListOnConsole_0 then l_useLayoutValues_0() else nil;
    local v117 = if l_FFlagUseNewPlayerList_0 then l_useTokens_0() else nil;
    return v7.createElement(v44, v6.Dictionary.join(v115, {
        layoutValues = if l_FFlagEnableMobilePlayerListOnConsole_0 then v116 else nil, 
        tokens = v117
    }));
end;
if l_FFlagUseNewPlayerList_0 or l_FFlagEnableMobilePlayerListOnConsole_0 then
    return v8.connect(v110, v114)(v118);
else
    return v8.connect(v110, v114)(v44);
end;