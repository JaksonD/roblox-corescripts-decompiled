local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_VRService_0 = game:GetService("VRService");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local l_MouseIconOverrideService_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService;
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Actions_0 = l_Parent_1.Actions;
local l_Thunks_0 = l_Parent_1.Thunks;
local l_Utility_0 = l_Parent_1.Utility;
local v13 = require(l_Parent_1.Constants);
local v14 = require(l_Utility_0.GetSegmentFromPosition);
local v15 = require(l_Parent_0.EmotesButtons);
local v16 = require(l_Parent_0.SlotNumbers);
local v17 = require(l_Parent_0.WheelBackground);
local v18 = require(l_Actions_0.FocusSegment);
local v19 = require(l_Actions_0.HideMenu);
local v20 = require(l_Thunks_0.PlayEmote);
local l_Value_0 = Enum.ContextActionPriority.High.Value;
local v22 = v5.PureComponent:extend("EmotesWheel");
local function _(v23) --[[ Line: 36 ]] --[[ Name: getRandomAssetId ]]
    if #v23 == 0 then
        return;
    else
        return v23[math.random(1, #v23)];
    end;
end;
v22.bindActions = function(v25) --[[ Line: 45 ]] --[[ Name: bindActions ]]
    -- upvalues: v13 (copy), v14 (copy), l_ContextActionService_0 (copy), l_Value_0 (copy)
    if v25.actionsBound then
        return;
    else
        local function v31(_, _, v28) --[[ Line: 50 ]] --[[ Name: selectEmote ]]
            -- upvalues: v13 (ref), v14 (ref), v25 (copy)
            local v29 = Vector2.new(v28.Position.X, v28.Position.Y);
            if v29.Magnitude < v13.ThumbstickThreshold then
                return;
            else
                local v30 = v14(v29);
                if v30 == v25.props.emotesWheel.focusedSegmentIndex then
                    return;
                elseif v25.props.emotesPage.currentEmotes[v30] then
                    v25.props.focusSegment(v30);
                    return;
                else
                    v25.props.focusSegment(0);
                    return;
                end;
            end;
        end;
        l_ContextActionService_0:BindActionAtPriority(v13.EmoteSelectionAction, v31, false, l_Value_0, v13.SelectionThumbstick);
        l_ContextActionService_0:BindActionAtPriority(v13.PlaySelectedAction, function(_, v33, _) --[[ Line: 78 ]] --[[ Name: playSelected ]]
            -- upvalues: v25 (copy)
            if v33 == Enum.UserInputState.Begin then
                local l_focusedSegmentIndex_0 = v25.props.emotesWheel.focusedSegmentIndex;
                local v36 = v25.props.emotesPage.currentEmotes[l_focusedSegmentIndex_0];
                if not v36 then
                    return;
                else
                    local v37 = v25.props.emotesPage.emotesInfo[v36];
                    if not v37 then
                        return;
                    else
                        local v38 = if #v37 == 0 then nil else v37[math.random(1, #v37)];
                        v25.props.playEmote(v36, l_focusedSegmentIndex_0, v38);
                    end;
                end;
            end;
        end, false, l_Value_0, v13.PlayEmoteButton);
        local function v42(_, v40, _) --[[ Line: 106 ]] --[[ Name: closeMenu ]]
            -- upvalues: v25 (copy)
            if v40 == Enum.UserInputState.Begin then
                v25.props.hideMenu();
            end;
        end;
        local v43 = {
            v13.EmoteMenuCloseKey, 
            v13.EmoteMenuCloseButton, 
            v13.EmoteMenuCloseButtonSecondary
        };
        l_ContextActionService_0:BindActionAtPriority(v13.CloseMenuAction, v42, false, l_Value_0, unpack(v43));
        l_ContextActionService_0:BindActionAtPriority(v13.LeaveMenuDontSinkInputAction, function(_, v45, _) --[[ Line: 126 ]] --[[ Name: closeMenuNoSink ]]
            -- upvalues: v25 (copy)
            if v45 == Enum.UserInputState.Begin then
                v25.props.hideMenu();
            end;
            return Enum.ContextActionResult.Pass;
        end, false, l_Value_0, unpack(v13.LeaveMenuNoSinkInputs));
        local function v56(_, v48, v49) --[[ Line: 141 ]] --[[ Name: activateEmoteByNumber ]]
            -- upvalues: v13 (ref), v25 (copy)
            if v48 ~= Enum.UserInputState.Begin then
                return;
            else
                local v50 = nil;
                for v51, v52 in ipairs(v13.EmoteSlotKeys) do
                    if v52 == v49.KeyCode then
                        v50 = v51;
                        break;
                    end;
                end;
                if not v50 then
                    return;
                else
                    local v53 = v25.props.emotesPage.currentEmotes[v50];
                    if not v53 then
                        return;
                    else
                        local v54 = v25.props.emotesPage.emotesInfo[v53];
                        if not v54 then
                            return;
                        else
                            local v55 = if #v54 == 0 then nil else v54[math.random(1, #v54)];
                            v25.props.playEmote(v53, v50, v55);
                            return;
                        end;
                    end;
                end;
            end;
        end;
        l_ContextActionService_0:BindActionAtPriority(v13.ActivateEmoteSlotAction, v56, false, l_Value_0, unpack(v13.EmoteSlotKeys));
        l_ContextActionService_0:BindCoreActionAtPriority(v13.VirtualCursorSinkAction, function(_, _, _) --[[ Line: 182 ]] --[[ Name: sinkInput ]]
            return Enum.ContextActionResult.Sink;
        end, false, l_Value_0, Enum.KeyCode.ButtonSelect);
        v25.actionsBound = true;
        return;
    end;
end;
v22.unbindActions = function(v60) --[[ Line: 196 ]] --[[ Name: unbindActions ]]
    -- upvalues: l_ContextActionService_0 (copy), v13 (copy)
    if v60.actionsBound then
        l_ContextActionService_0:UnbindAction(v13.CloseMenuAction);
        l_ContextActionService_0:UnbindAction(v13.EmoteSelectionAction);
        l_ContextActionService_0:UnbindAction(v13.PlaySelectedAction);
        l_ContextActionService_0:UnbindAction(v13.LeaveMenuDontSinkInputAction);
        l_ContextActionService_0:UnbindAction(v13.ActivateEmoteSlotAction);
        l_ContextActionService_0:UnbindCoreAction(v13.VirtualCursorSinkAction);
        v60.actionsBound = false;
    end;
end;
v22.addCursorOverride = function(v61) --[[ Line: 209 ]] --[[ Name: addCursorOverride ]]
    -- upvalues: l_VRService_0 (copy), l_MouseIconOverrideService_0 (copy), v13 (copy), l_GamepadService_0 (copy)
    if l_VRService_0.VREnabled then
        return;
    else
        if v61.isUsingGamepad and not v61.isCursorHidden then
            l_MouseIconOverrideService_0.push(v13.CursorOverrideName, Enum.OverrideMouseIconBehavior.ForceHide);
            l_GamepadService_0.GamepadCursorEnabled = false;
            v61.isCursorHidden = true;
        end;
        return;
    end;
end;
v22.removeCursorOverride = function(v62) --[[ Line: 222 ]] --[[ Name: removeCursorOverride ]]
    -- upvalues: l_MouseIconOverrideService_0 (copy), v13 (copy)
    if v62.isCursorHidden then
        l_MouseIconOverrideService_0.pop(v13.CursorOverrideName);
        v62.isCursorHidden = false;
    end;
end;
v22.connectListeners = function(v63) --[[ Line: 230 ]] --[[ Name: connectListeners ]]
    -- upvalues: l_UserInputService_0 (copy), v13 (copy)
    v63.inputTypeChangedListener = l_UserInputService_0.LastInputTypeChanged:Connect(function(v64) --[[ Line: 231 ]]
        -- upvalues: v13 (ref), v63 (copy)
        if v13.GamepadInputTypes[v64] then
            v63.isUsingGamepad = true;
            if v63.props.displayOptions.menuVisible then
                v63:addCursorOverride();
                return;
            end;
        else
            v63.isUsingGamepad = false;
            v63:removeCursorOverride();
        end;
    end);
end;
v22.disconnectListeners = function(v65) --[[ Line: 246 ]] --[[ Name: disconnectListeners ]]
    v65.inputTypeChangedListener:Disconnect();
end;
v22.didUpdate = function(v66) --[[ Line: 250 ]] --[[ Name: didUpdate ]]
    if v66.props.displayOptions.menuVisible then
        v66:bindActions();
        v66:addCursorOverride();
        return;
    else
        v66:unbindActions();
        v66:removeCursorOverride();
        return;
    end;
end;
v22.didMount = function(v67) --[[ Line: 262 ]] --[[ Name: didMount ]]
    if v67.props.displayOptions.menuVisible then
        v67:bindActions();
    end;
    v67:connectListeners();
end;
v22.willUnmount = function(v68) --[[ Line: 270 ]] --[[ Name: willUnmount ]]
    v68:unbindActions();
    v68:disconnectListeners();
end;
v22.render = function(v69) --[[ Line: 276 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v17 (copy), v15 (copy), v16 (copy)
    return v5.createElement("Frame", {
        Active = true, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Visible = v69.props.displayOptions.menuVisible
    }, {
        MouseUnlock = v5.createElement("TextButton", {
            Modal = true, 
            Size = UDim2.new(0, 0, 0, 0), 
            Text = "", 
            Transparency = 1
        }), 
        Back = v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 1
        }, {
            Background = v5.createElement(v17)
        }), 
        Front = v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }, {
            EmotesButtons = v5.createElement(v15), 
            SlotNumbers = v5.createElement(v16)
        })
    });
end;
return v6.connect(function(v70) --[[ Line: 309 ]] --[[ Name: mapStateToProps ]]
    return {
        displayOptions = v70.displayOptions, 
        emotesWheel = v70.emotesWheel, 
        emotesPage = v70.emotesPage
    };
end, function(v71) --[[ Line: 317 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v20 (copy), v18 (copy), v19 (copy)
    return {
        playEmote = function(v72, v73, v74) --[[ Line: 319 ]] --[[ Name: playEmote ]]
            -- upvalues: v71 (copy), v20 (ref)
            return v71(v20(v72, v73, v74));
        end, 
        focusSegment = function(v75) --[[ Line: 323 ]] --[[ Name: focusSegment ]]
            -- upvalues: v71 (copy), v18 (ref)
            return v71(v18(v75));
        end, 
        hideMenu = function() --[[ Line: 327 ]] --[[ Name: hideMenu ]]
            -- upvalues: v71 (copy), v19 (ref)
            return v71(v19());
        end
    };
end)(v22);