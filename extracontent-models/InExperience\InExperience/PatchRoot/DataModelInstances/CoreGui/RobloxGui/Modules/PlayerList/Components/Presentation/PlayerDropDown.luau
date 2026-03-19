local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Packages.Otter);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local v10 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local l_Parent_0 = script.Parent.Parent;
local l_Connection_0 = l_Parent_0.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v14 = require(script.Parent.DropDownButton);
local v15 = require(script.Parent.DropDownPlayerHeader);
local v16 = require(script.Parent.FriendDropDownButton);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v19 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v20 = require(l_RobloxGui_0.Modules.Settings.onBlockButtonActivated);
local l_Images_0 = v9.App.ImageSet.Images;
local v22 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local l_Parent_1 = l_Parent_0.Parent;
local v24 = require(l_Parent_1.Actions.ClosePlayerDropDown);
local v25 = require(l_Parent_1.Flags.FFlagPlayerListReduceRerenders);
local l_FFlagUseNewPlayerList_0 = v10.Flags.FFlagUseNewPlayerList;
local v27 = require(l_Parent_1.Thunks.UnblockPlayer);
local v28 = require(l_Parent_1.Thunks.RequestFriendship);
local v29 = require(l_Parent_1.Actions.SetPlayerIsBlocked);
local v30 = v4.PureComponent:extend("PlayerDropDown");
v30.validateProps = v7.strictInterface({
    positionY = v7.number, 
    minPositionBoundY = v7.number, 
    maxPositionBoundY = v7.number, 
    contentsVisible = v7.boolean, 
    selectedPlayer = v7.optional(v7.instanceIsA("Player")), 
    isVisible = v7.boolean, 
    playerRelationship = v7.optional(v7.strictInterface({
        isBlocked = v7.boolean, 
        friendStatus = v7.enum(Enum.FriendStatus), 
        isFollowing = v7.boolean, 
        isFollower = v7.boolean
    })), 
    inspectMenuEnabled = v7.boolean, 
    isTenFootInterface = v7.boolean, 
    subjectToChinaPolicies = v7.boolean, 
    closeDropDown = v7.callback, 
    blockPlayerSuccess = v7.callback, 
    unblockPlayer = v7.callback, 
    requestFriendship = v7.callback
});
v30.init = function(v31) --[[ Line: 72 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v8 (copy)
    v31.innerFrameRef = v4.createRef();
    v31.motorOptions = {
        dampingRatio = 1, 
        frequency = 4
    };
    v31.motor = v8.createSingleMotor(1);
    v31.motor:onStep(function(v32) --[[ Line: 82 ]]
        -- upvalues: v31 (copy)
        local l_current_0 = v31.innerFrameRef.current;
        if l_current_0 then
            if v32 == 1 then
                l_current_0.Visible = false;
            else
                l_current_0.Visible = true;
            end;
            l_current_0.Position = UDim2.new(v32, 0, 0, 0);
        end;
    end);
    v31.dropDownPosition = 0;
end;
v30.createFriendButton = function(v34, v35) --[[ Line: 98 ]] --[[ Name: createFriendButton ]]
    -- upvalues: v4 (copy), v16 (copy)
    local l_selectedPlayer_0 = v34.props.selectedPlayer;
    return v4.createElement(v16, {
        layoutOrder = 1, 
        playerRelationship = v35, 
        selectedPlayer = l_selectedPlayer_0, 
        dropDownOpen = v34.props.isVisible, 
        requestFriendship = v34.props.requestFriendship, 
        contentVisible = true
    });
end;
v30.createBlockButton = function(v37, v38) --[[ Line: 110 ]] --[[ Name: createBlockButton ]]
    -- upvalues: v19 (copy), l_Images_0 (copy), v4 (copy), v14 (copy), v20 (copy)
    local l_selectedPlayer_1 = v37.props.selectedPlayer;
    local v40 = v19:FormatByKey("InGame.PlayerDropDown.Block");
    local v41 = v19:FormatByKey("InGame.PlayerDropDown.UnBlock");
    local v42 = l_Images_0["icons/actions/block"];
    return v4.createElement(v14, {
        layoutOrder = 4, 
        text = v38.isBlocked and v41 or v40, 
        icon = v42, 
        lastButton = false, 
        forceShowOptions = false, 
        onActivated = function() --[[ Line: 122 ]] --[[ Name: onActivated ]]
            -- upvalues: v38 (copy), v37 (copy), l_selectedPlayer_1 (copy), v20 (ref)
            if v38.isBlocked then
                v37.props.unblockPlayer(l_selectedPlayer_1);
                return;
            else
                v20(l_selectedPlayer_1, nil, v37.__componentName, {
                    onBlockingSuccess = function() --[[ Line: 127 ]] --[[ Name: onBlockingSuccess ]]
                        -- upvalues: v37 (ref), l_selectedPlayer_1 (ref)
                        v37.props.blockPlayerSuccess(l_selectedPlayer_1);
                    end
                });
                return;
            end;
        end
    });
end;
v30.createReportButton = function(v43) --[[ Line: 136 ]] --[[ Name: createReportButton ]]
    -- upvalues: l_Images_0 (copy), v4 (copy), v14 (copy), v19 (copy), v22 (copy), l_RobloxGui_0 (copy)
    local l_selectedPlayer_2 = v43.props.selectedPlayer;
    local v45 = l_Images_0["icons/actions/feedback"];
    return v4.createElement(v14, {
        layoutOrder = 5, 
        text = v19:FormatByKey("InGame.PlayerDropDown.Report"), 
        icon = v45, 
        lastButton = true, 
        forceShowOptions = false, 
        onActivated = function() --[[ Line: 146 ]] --[[ Name: onActivated ]]
            -- upvalues: v22 (ref), l_RobloxGui_0 (ref), l_selectedPlayer_2 (copy), v43 (copy)
            if v22() then
                require(l_RobloxGui_0.Modules.InGameMenuInit).openReportDialog(l_selectedPlayer_2, v43.__componentName);
                return;
            else
                require(l_RobloxGui_0.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(l_selectedPlayer_2, v43.__componentName);
                v43.props.closeDropDown();
                return;
            end;
        end
    });
end;
v30.createInspectButton = function(v46) --[[ Line: 160 ]] --[[ Name: createInspectButton ]]
    -- upvalues: l_Images_0 (copy), v4 (copy), v14 (copy), v19 (copy), l_LocalPlayer_0 (copy), l_GuiService_0 (copy)
    local l_selectedPlayer_3 = v46.props.selectedPlayer;
    local v48 = l_Images_0["icons/actions/zoomIn"];
    return v4.createElement(v14, {
        layoutOrder = 3, 
        text = v19:FormatByKey("InGame.PlayerDropDown.Examine"), 
        icon = v48, 
        lastButton = l_selectedPlayer_3 == l_LocalPlayer_0, 
        forceShowOptions = false, 
        onActivated = function() --[[ Line: 170 ]] --[[ Name: onActivated ]]
            -- upvalues: l_GuiService_0 (ref), l_selectedPlayer_3 (copy), v46 (copy)
            l_GuiService_0:InspectPlayerFromUserIdWithCtx(l_selectedPlayer_3.UserId, "leaderBoard");
            v46.props.closeDropDown();
        end
    });
end;
v30.render = function(v49) --[[ Line: 177 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), v4 (copy), v15 (copy), l_LocalPlayer_0 (copy)
    return l_WithLayoutValues_0(function(v50) --[[ Line: 178 ]]
        -- upvalues: v49 (copy), v4 (ref), v15 (ref), l_LocalPlayer_0 (ref)
        local l_selectedPlayer_4 = v49.props.selectedPlayer;
        if not l_selectedPlayer_4 or v49.props.isTenFootInterface then
            return nil;
        else
            local v52 = {
                UIListLayout = v4.createElement("UIListLayout", {
                    Padding = UDim.new(0, v50.DropDownButtonPadding), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                PlayerHeader = v4.createElement(v15, {
                    player = v49.props.selectedPlayer
                })
            };
            local v53 = v50.DropDownButtonPadding + v50.DropDownHeaderSizeY;
            local l_playerRelationship_0 = v49.props.playerRelationship;
            if l_selectedPlayer_4 ~= l_LocalPlayer_0 then
                if not l_playerRelationship_0.isBlocked then
                    v52.FriendButton = v49:createFriendButton(l_playerRelationship_0);
                    v53 = v53 + v50.DropDownButtonPadding + v50.DropDownButtonSizeY;
                end;
                v52.BlockButton = v49:createBlockButton(l_playerRelationship_0);
                v53 = v53 + v50.DropDownButtonPadding + v50.DropDownButtonSizeY;
                v52.ReportButton = v49:createReportButton();
                v53 = v53 + v50.DropDownButtonPadding + v50.DropDownButtonSizeY;
            end;
            if v49.props.inspectMenuEnabled then
                v52.InspectButton = v49:createInspectButton();
                v53 = v53 + v50.DropDownButtonPadding + v50.DropDownButtonSizeY;
            end;
            v53 = v53 - v50.DropDownButtonPadding;
            local v55 = v49.dropDownPosition + (v50.DropDownHeaderBackgroundSize - v50.DropDownHeaderSizeY);
            if v55 + v53 > v49.props.maxPositionBoundY then
                v55 = v55 - (v55 + v53 - v49.props.maxPositionBoundY);
            elseif v55 < v49.props.minPositionBoundY then
                v55 = v55 + (v49.props.minPositionBoundY - v55);
            end;
            return v4.createElement("Frame", {
                LayoutOrder = v49.props.layoutOrder, 
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(0, 0, 0, v55), 
                Size = UDim2.new(0, v50.PlayerDropDownSizeX + v50.PlayerDropDownOffset, 0, v53), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true
            }, {
                InnerFrame = v4.createElement("Frame", {
                    Size = UDim2.new(1, -v50.PlayerDropDownOffset, 1, 0), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true, 
                    [v4.Ref] = v49.innerFrameRef
                }, v52)
            });
        end;
    end);
end;
v30.getDropDownPosition = function(v56) --[[ Line: 252 ]] --[[ Name: getDropDownPosition ]]
    if v56.props.isVisible and v56.props.contentsVisible then
        return 0;
    else
        return 1;
    end;
end;
v30.didMount = function(v57) --[[ Line: 259 ]] --[[ Name: didMount ]]
    -- upvalues: v8 (copy)
    local v58 = v57:getDropDownPosition();
    v57.motor:start();
    v57.motor:setGoal(v8.spring(v58, v57.motorOptions));
end;
v30.willUpdate = function(v59, v60, _) --[[ Line: 265 ]] --[[ Name: willUpdate ]]
    -- upvalues: l_FFlagUseNewPlayerList_0 (copy)
    if l_FFlagUseNewPlayerList_0 then
        v59.dropDownPosition = v60.positionY;
        return;
    else
        if v60.selectedPlayer ~= v59.props.selectedPlayer then
            v59.dropDownPosition = v60.positionY;
        end;
        return;
    end;
end;
v30.didUpdate = function(v62, v63, _) --[[ Line: 275 ]] --[[ Name: didUpdate ]]
    -- upvalues: v8 (copy)
    if v63.selectedPlayer ~= v62.props.selectedPlayer then
        v62.motor:setGoal(v8.instant(1));
        v62.motor:step(0);
    end;
    local v65 = v62:getDropDownPosition();
    v62.motor:setGoal(v8.spring(v65, v62.motorOptions));
end;
v30.willUnmount = function(v66) --[[ Line: 285 ]] --[[ Name: willUnmount ]]
    v66.motor:destroy();
end;
local function v70(v67) --[[ Line: 289 ]] --[[ Name: mapStateToProps ]]
    local l_selectedPlayer_5 = v67.playerDropDown.selectedPlayer;
    local v69 = v67.playerDropDown.isVisible and v67.displayOptions.isVisible;
    return {
        selectedPlayer = l_selectedPlayer_5, 
        isVisible = v69, 
        playerRelationship = l_selectedPlayer_5 and v67.playerRelationship[l_selectedPlayer_5.UserId], 
        inspectMenuEnabled = v67.displayOptions.inspectMenuEnabled, 
        isTenFootInterface = v67.displayOptions.isTenFootInterface, 
        subjectToChinaPolicies = v67.displayOptions.subjectToChinaPolicies
    };
end;
local function v76(v71) --[[ Line: 303 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v24 (copy), v29 (copy), v27 (copy), v28 (copy)
    return {
        closeDropDown = function() --[[ Line: 305 ]] --[[ Name: closeDropDown ]]
            -- upvalues: v71 (copy), v24 (ref)
            return v71(v24());
        end, 
        blockPlayerSuccess = function(v72) --[[ Line: 309 ]] --[[ Name: blockPlayerSuccess ]]
            -- upvalues: v71 (copy), v29 (ref)
            v71(v29(v72, true));
        end, 
        unblockPlayer = function(v73) --[[ Line: 313 ]] --[[ Name: unblockPlayer ]]
            -- upvalues: v71 (copy), v27 (ref)
            return v71(v27(v73));
        end, 
        requestFriendship = function(v74, _) --[[ Line: 317 ]] --[[ Name: requestFriendship ]]
            -- upvalues: v71 (copy), v28 (ref)
            return v71(v28(v74));
        end
    };
end;
if v25 then
    return v5.memo(v6.connect(v70, v76)(v30));
else
    return v6.UNSTABLE_connect2(v70, v76)(v30);
end;