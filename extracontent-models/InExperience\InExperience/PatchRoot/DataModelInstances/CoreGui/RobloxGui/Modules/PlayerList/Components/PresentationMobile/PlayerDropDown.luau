local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.t);
local v9 = require(l_CorePackages_0.Packages.Otter);
local v10 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v11 = require(l_CorePackages_0.Packages.UIBlox);
local v12 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local l_useLayoutValues_0 = v12.Common.useLayoutValues;
local l_Parent_0 = script.Parent.Parent;
local l_Connection_0 = l_Parent_0.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v17 = require(script.Parent.DropDownButton);
local v18 = require(script.Parent.DropDownPlayerHeader);
local v19 = require(script.Parent.FriendDropDownButton);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v22 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v23 = require(l_RobloxGui_0.Modules.Settings.onBlockButtonActivated);
local l_Images_0 = v11.App.ImageSet.Images;
local v25 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local l_Parent_1 = l_Parent_0.Parent;
local v27 = require(l_Parent_1.Actions.ClosePlayerDropDown);
local v28 = require(l_Parent_1.Actions.SetPlayerListVisibility);
local v29 = require(l_Parent_1.Flags.FFlagPlayerListReduceRerenders);
local l_FFlagAddNewPlayerListMobileFocusNav_0 = v12.Flags.FFlagAddNewPlayerListMobileFocusNav;
local l_FFlagUseNewPlayerList_0 = v12.Flags.FFlagUseNewPlayerList;
local v32 = require(l_Parent_1.Thunks.UnblockPlayer);
local v33 = require(l_Parent_1.Thunks.RequestFriendship);
local v34 = require(l_Parent_1.Actions.SetPlayerIsBlocked);
local v35 = v5.PureComponent:extend("PlayerDropDown");
v35.validateProps = v8.strictInterface({
    contentsVisible = v8.boolean, 
    selectedPlayer = v8.optional(v8.instanceIsA("Player")), 
    isVisible = v8.boolean, 
    playerRelationship = v8.optional(v8.strictInterface({
        isBlocked = v8.boolean, 
        friendStatus = v8.enum(Enum.FriendStatus), 
        isFollowing = v8.boolean, 
        isFollower = v8.boolean
    })), 
    inspectMenuEnabled = v8.boolean, 
    isTenFootInterface = v8.boolean, 
    isUsingGamepad = v8.optional(v8.boolean), 
    subjectToChinaPolicies = v8.boolean, 
    preferredTransparency = v8.number, 
    closeDropDown = v8.callback, 
    blockPlayerSuccess = v8.callback, 
    unblockPlayer = v8.callback, 
    requestFriendship = v8.callback, 
    setPlayerListVisibility = v8.callback, 
    focusGuiObject = v8.optional(v8.callback), 
    focusedGuiObject = v8.optional(v8.instanceIsA("GuiObject")), 
    layoutValues = v8.optional(v8.table)
});
local v36 = {
    dampingRatio = 1, 
    frequency = 4
};
v35.init = function(v37) --[[ Line: 88 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), v5 (copy), v9 (copy)
    v37.state = {
        allVisible = false, 
        contentVisible = false
    };
    v37.buttonsContainerRef = v6.createRef();
    local v38, v39 = v5.createBinding(1);
    v37.containerScale = v38;
    v37.updateContainerScale = v39;
    v37.containerScaleMotor = v9.createSingleMotor(0);
    v37.containerScaleMotor:onStep(function(v40) --[[ Line: 98 ]]
        -- upvalues: v37 (copy)
        v37.updateContainerScale(v40);
    end);
    v38, v39 = v5.createBinding(1);
    v37.transparency = v38;
    v37.updateTransparency = v39;
    v37.transparencyMotor = v9.createSingleMotor(0);
    v37.transparencyMotor:onStep(function(v41) --[[ Line: 104 ]]
        -- upvalues: v37 (copy)
        v37.updateTransparency(v41);
        if v41 < 0.5 and v37.props.isVisible and v37.props.contentsVisible then
            v37:setState({
                contentVisible = true
            });
        else
            v37:setState({
                contentVisible = false
            });
        end;
        v37:setState({
            allVisible = v41 < 1
        });
    end);
    v38, v39 = v5.createBinding(1);
    v37.buttonTransparency = v38;
    v37.updateButtonTransparency = v39;
    v37.buttonTransparencyMotor = v9.createSingleMotor(0);
    v37.buttonTransparencyMotor:onStep(function(v42) --[[ Line: 122 ]]
        -- upvalues: v37 (copy)
        v37.updateButtonTransparency(v42);
    end);
end;
v35.createFriendButton = function(v43, v44) --[[ Line: 127 ]] --[[ Name: createFriendButton ]]
    -- upvalues: v5 (copy), v19 (copy)
    local l_selectedPlayer_0 = v43.props.selectedPlayer;
    return v5.createElement(v19, {
        layoutOrder = 1, 
        playerRelationship = v44, 
        selectedPlayer = l_selectedPlayer_0, 
        dropDownOpen = v43.props.isVisible, 
        requestFriendship = v43.props.requestFriendship, 
        contentVisible = v43.state.contentVisible, 
        isUsingGamepad = v43.props.isUsingGamepad
    });
end;
v35.createBlockButton = function(v46, v47) --[[ Line: 140 ]] --[[ Name: createBlockButton ]]
    -- upvalues: v22 (copy), l_Images_0 (copy), v5 (copy), v17 (copy), v23 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (copy)
    local l_selectedPlayer_1 = v46.props.selectedPlayer;
    local v49 = v22:FormatByKey("InGame.PlayerDropDown.Block");
    local v50 = v22:FormatByKey("InGame.PlayerDropDown.UnBlock");
    local v51 = l_Images_0["icons/actions/block"];
    return v5.createElement(v17, {
        contentVisible = v46.state.contentVisible, 
        buttonTransparency = v46.buttonTransparency, 
        layoutOrder = 4, 
        text = v47.isBlocked and v50 or v49, 
        icon = v51, 
        lastButton = false, 
        forceShowOptions = false, 
        onActivated = function() --[[ Line: 154 ]] --[[ Name: onActivated ]]
            -- upvalues: v47 (copy), v46 (copy), l_selectedPlayer_1 (copy), v23 (ref), l_FFlagAddNewPlayerListMobileFocusNav_0 (ref)
            if v47.isBlocked then
                v46.props.unblockPlayer(l_selectedPlayer_1);
                return;
            else
                v23(l_selectedPlayer_1, nil, v46.__componentName, {
                    onBlockingSuccess = function() --[[ Line: 159 ]] --[[ Name: onBlockingSuccess ]]
                        -- upvalues: v46 (ref), l_selectedPlayer_1 (ref)
                        v46.props.blockPlayerSuccess(l_selectedPlayer_1);
                    end, 
                    onBlockingModalClose = l_FFlagAddNewPlayerListMobileFocusNav_0 and function() --[[ Line: 163 ]]
                        -- upvalues: v46 (ref)
                        if v46.props.isUsingGamepad then
                            v46.props.focusGuiObject(v46.buttonsContainerRef.current);
                        end;
                    end or nil
                });
                return;
            end;
        end
    });
end;
v35.createReportButton = function(v52) --[[ Line: 175 ]] --[[ Name: createReportButton ]]
    -- upvalues: l_Images_0 (copy), v5 (copy), v17 (copy), v22 (copy), v25 (copy), l_RobloxGui_0 (copy)
    local l_selectedPlayer_2 = v52.props.selectedPlayer;
    local v54 = l_Images_0["icons/actions/feedback"];
    return v5.createElement(v17, {
        contentVisible = v52.state.contentVisible, 
        buttonTransparency = v52.buttonTransparency, 
        layoutOrder = 5, 
        text = v22:FormatByKey("InGame.PlayerDropDown.Report"), 
        icon = v54, 
        lastButton = true, 
        forceShowOptions = false, 
        onActivated = function() --[[ Line: 187 ]] --[[ Name: onActivated ]]
            -- upvalues: v25 (ref), l_RobloxGui_0 (ref), l_selectedPlayer_2 (copy), v52 (copy)
            if v25() then
                require(l_RobloxGui_0.Modules.InGameMenuInit).openReportDialog(l_selectedPlayer_2, v52.__componentName);
                return;
            else
                require(l_RobloxGui_0.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(l_selectedPlayer_2, v52.__componentName);
                v52.props.closeDropDown();
                return;
            end;
        end
    });
end;
v35.createInspectButton = function(v55) --[[ Line: 201 ]] --[[ Name: createInspectButton ]]
    -- upvalues: l_Images_0 (copy), v5 (copy), v17 (copy), v22 (copy), l_LocalPlayer_0 (copy), l_GuiService_0 (copy)
    local l_selectedPlayer_3 = v55.props.selectedPlayer;
    local v57 = l_Images_0["icons/actions/zoomIn"];
    return v5.createElement(v17, {
        contentVisible = v55.state.contentVisible, 
        buttonTransparency = v55.buttonTransparency, 
        layoutOrder = 3, 
        text = v22:FormatByKey("InGame.PlayerDropDown.Examine"), 
        icon = v57, 
        lastButton = l_selectedPlayer_3 == l_LocalPlayer_0, 
        forceShowOptions = false, 
        onActivated = function() --[[ Line: 213 ]] --[[ Name: onActivated ]]
            -- upvalues: l_GuiService_0 (ref), l_selectedPlayer_3 (copy), v55 (copy)
            l_GuiService_0:InspectPlayerFromUserIdWithCtx(l_selectedPlayer_3.UserId, "leaderBoard");
            v55.props.closeDropDown();
            v55.props.setPlayerListVisibility(false);
        end
    });
end;
v35.render = function(v58) --[[ Line: 221 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_FFlagUseNewPlayerList_0 (copy), v5 (copy), v18 (copy), l_LocalPlayer_0 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (copy)
    return l_WithLayoutValues_0(function(v59) --[[ Line: 222 ]]
        -- upvalues: l_FFlagUseNewPlayerList_0 (ref), v58 (copy), v5 (ref), v18 (ref), l_LocalPlayer_0 (ref), l_FFlagAddNewPlayerListMobileFocusNav_0 (ref)
        if l_FFlagUseNewPlayerList_0 then
            v59 = v58.props.layoutValues;
        end;
        local l_selectedPlayer_4 = v58.props.selectedPlayer;
        if not l_selectedPlayer_4 or v58.props.isTenFootInterface then
            return nil;
        else
            local v61 = {
                UIScale = v5.createElement("UIScale", {
                    Scale = v58.containerScale
                }), 
                UIListLayout = v5.createElement("UIListLayout", {
                    Padding = UDim.new(0, v59.DropDownButtonPadding), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                PlayerHeader = v5.createElement(v18, {
                    player = v58.props.selectedPlayer, 
                    contentVisible = v58.state.contentVisible, 
                    transparency = v58.transparency
                })
            };
            local v62 = 4 * v59.DropDownButtonSizeY + v59.DropDownHeaderSizeY;
            local v63 = v59.DropDownButtonPadding + v59.DropDownHeaderSizeY;
            local l_playerRelationship_0 = v58.props.playerRelationship;
            if l_selectedPlayer_4 ~= l_LocalPlayer_0 then
                if not l_playerRelationship_0.isBlocked then
                    v61.FriendButton = v58:createFriendButton(l_playerRelationship_0);
                    v63 = v63 + v59.DropDownButtonPadding + v59.DropDownButtonSizeY;
                end;
                v61.BlockButton = v58:createBlockButton(l_playerRelationship_0);
                v63 = v63 + v59.DropDownButtonPadding + v59.DropDownButtonSizeY;
                v61.ReportButton = v58:createReportButton();
                v63 = v63 + v59.DropDownButtonPadding + v59.DropDownButtonSizeY;
            end;
            if v58.props.inspectMenuEnabled then
                v61.InspectButton = v58:createInspectButton();
                v63 = v63 + v59.DropDownButtonPadding + v59.DropDownButtonSizeY;
            end;
            v63 = v63 - v59.DropDownButtonPadding;
            return v5.createElement("ImageButton", {
                LayoutOrder = v58.props.layoutOrder, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Selectable = false, 
                Modal = false, 
                Visible = v58.state.allVisible, 
                AutoButtonColor = false, 
                Active = v58.props.isVisible, 
                Image = "", 
                SelectionGroup = l_FFlagAddNewPlayerListMobileFocusNav_0 and true or nil, 
                SelectionBehaviorUp = if l_FFlagAddNewPlayerListMobileFocusNav_0 then Enum.SelectionBehavior.Stop else nil, 
                SelectionBehaviorDown = if l_FFlagAddNewPlayerListMobileFocusNav_0 then Enum.SelectionBehavior.Stop else nil, 
                SelectionBehaviorLeft = if l_FFlagAddNewPlayerListMobileFocusNav_0 then Enum.SelectionBehavior.Stop else nil, 
                SelectionBehaviorRight = if l_FFlagAddNewPlayerListMobileFocusNav_0 then Enum.SelectionBehavior.Stop else nil, 
                [v5.Event.Activated] = v58.props.closeDropDown, 
                [v5.Ref] = v58.imageButtonRef
            }, {
                Container = v5.createElement("Frame", {
                    LayoutOrder = v58.props.layoutOrder, 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    Position = UDim2.new(0.5, 0, 0.5, -v62 / 2), 
                    Size = UDim2.new(0, v59.PlayerDropDownSizeXMobile, 0, v63), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true, 
                    [v5.Ref] = if l_FFlagAddNewPlayerListMobileFocusNav_0 then v58.buttonsContainerRef else nil
                }, v61)
            });
        end;
    end);
end;
v35.getScale = function(v65) --[[ Line: 305 ]] --[[ Name: getScale ]]
    if v65.props.isVisible and v65.props.contentsVisible then
        return 1;
    else
        return 1.25;
    end;
end;
v35.getTransparency = function(v66) --[[ Line: 312 ]] --[[ Name: getTransparency ]]
    if v66.props.isVisible and v66.props.contentsVisible then
        return 0;
    else
        return 1;
    end;
end;
v35.getButtonTransparency = function(v67) --[[ Line: 319 ]] --[[ Name: getButtonTransparency ]]
    if v67.props.isVisible and v67.props.contentsVisible then
        return v67.props.preferredTransparency * 0.3;
    else
        return 1;
    end;
end;
v35.didUpdate = function(v68, _, v70) --[[ Line: 326 ]] --[[ Name: didUpdate ]]
    -- upvalues: v9 (copy), v36 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (copy)
    v68.containerScaleMotor:setGoal(v9.spring(v68:getScale(), v36));
    v68.transparencyMotor:setGoal(v9.spring(v68:getTransparency(), v36));
    v68.buttonTransparencyMotor:setGoal(v9.spring(v68:getButtonTransparency(), v36));
    if l_FFlagAddNewPlayerListMobileFocusNav_0 and v68.props.isUsingGamepad and (v70.contentVisible ~= v68.state.contentVisible or not v68.props.focusedGuiObject) and v68.state.contentVisible and v68.buttonsContainerRef.current then
        v68.props.focusGuiObject(v68.buttonsContainerRef.current);
        if not l_FFlagAddNewPlayerListMobileFocusNav_0 then
            v68.buttonsContainerRef.current.SelectionGroup = true;
            v68.buttonsContainerRef.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop;
            v68.buttonsContainerRef.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop;
            v68.buttonsContainerRef.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop;
            v68.buttonsContainerRef.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop;
        end;
    end;
end;
v35.didMount = function(_) --[[ Line: 347 ]] --[[ Name: didMount ]]

end;
v35.willUnmount = function(v72) --[[ Line: 349 ]] --[[ Name: willUnmount ]]
    v72.transparencyMotor:destroy();
    v72.containerScaleMotor:destroy();
    v72.buttonTransparencyMotor:destroy();
    v72.transparencyMotor = nil;
    v72.containerScaleMotor = nil;
    v72.buttonTransparencyMotor = nil;
end;
local function v76(v73) --[[ Line: 359 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagAddNewPlayerListMobileFocusNav_0 (copy)
    local l_selectedPlayer_5 = v73.playerDropDown.selectedPlayer;
    local v75 = v73.playerDropDown.isVisible and v73.displayOptions.isVisible;
    return {
        selectedPlayer = l_selectedPlayer_5, 
        isVisible = v75, 
        playerRelationship = l_selectedPlayer_5 and v73.playerRelationship[l_selectedPlayer_5.UserId], 
        inspectMenuEnabled = v73.displayOptions.inspectMenuEnabled, 
        isTenFootInterface = v73.displayOptions.isTenFootInterface, 
        isUsingGamepad = if l_FFlagAddNewPlayerListMobileFocusNav_0 then v73.displayOptions.isUsingGamepad else nil, 
        subjectToChinaPolicies = v73.displayOptions.subjectToChinaPolicies, 
        preferredTransparency = v73.settings.preferredTransparency
    };
end;
local function v83(v77) --[[ Line: 376 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v27 (copy), v28 (copy), v34 (copy), v32 (copy), v33 (copy)
    return {
        closeDropDown = function() --[[ Line: 378 ]] --[[ Name: closeDropDown ]]
            -- upvalues: v77 (copy), v27 (ref)
            return v77(v27());
        end, 
        setPlayerListVisibility = function(v78) --[[ Line: 382 ]] --[[ Name: setPlayerListVisibility ]]
            -- upvalues: v77 (copy), v28 (ref)
            return v77(v28(v78));
        end, 
        blockPlayerSuccess = function(v79) --[[ Line: 386 ]] --[[ Name: blockPlayerSuccess ]]
            -- upvalues: v77 (copy), v34 (ref)
            v77(v34(v79, true));
        end, 
        unblockPlayer = function(v80) --[[ Line: 390 ]] --[[ Name: unblockPlayer ]]
            -- upvalues: v77 (copy), v32 (ref)
            return v77(v32(v80));
        end, 
        requestFriendship = function(v81, _) --[[ Line: 394 ]] --[[ Name: requestFriendship ]]
            -- upvalues: v77 (copy), v33 (ref)
            return v77(v33(v81));
        end
    };
end;
local function v88(v84) --[[ Line: 400 ]] --[[ Name: PlayerDropDownWrapper ]]
    -- upvalues: l_FFlagUseNewPlayerList_0 (copy), l_useLayoutValues_0 (copy), v10 (copy), v5 (copy), v35 (copy), v4 (copy)
    local v85 = if l_FFlagUseNewPlayerList_0 then l_useLayoutValues_0() else nil;
    local v86 = v10.useFocusGuiObject();
    local v87 = v10.useFocusedGuiObject();
    return v5.createElement(v35, v4.Dictionary.join(v84, {
        focusGuiObject = v86, 
        focusedGuiObject = v87, 
        layoutValues = v85
    }));
end;
if l_FFlagAddNewPlayerListMobileFocusNav_0 or l_FFlagUseNewPlayerList_0 then
    if v29 then
        return v6.memo(v7.connect(v76, v83)(v88));
    else
        return v7.connect(v76, v83)(v88);
    end;
elseif v29 then
    return v6.memo(v7.connect(v76, v83)(v35));
else
    return v7.connect(v76, v83)(v35);
end;