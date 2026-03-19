local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.Otter);
local v5 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local l_useLayoutValues_0 = v5.Common.useLayoutValues;
local l_Connection_0 = script.Parent.Parent.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v9 = require(script.Parent.DropDownButton);
local l_FFlagUseNewPlayerList_0 = v5.Flags.FFlagUseNewPlayerList;
local v11 = {
    dampingRatio = 1, 
    frequency = 4
};
local v12 = {
    dampingRatio = 1, 
    frequency = 4
};
local v13 = v2.PureComponent:extend("DropDownAnimator");
v13.validateProps = v3.strictInterface({
    text = v3.string, 
    icon = v3.union(v3.string, v3.table), 
    lastButton = v3.boolean, 
    layoutOrder = v3.integer, 
    onActivated = v3.callback, 
    forceShowOptions = v3.boolean, 
    selectedPlayer = v3.optional(v3.instanceIsA("Player")), 
    onDecline = v3.optional(v3.callback), 
    onDismiss = v3.optional(v3.callback), 
    contentVisible = v3.boolean, 
    layoutValues = v3.optional(v3.table), 
    onAnimationComplete = v3.optional(v3.callback), 
    forwardRef = v3.optional(v3.callback)
});
v13.init = function(v14) --[[ Line: 48 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v4 (copy), v11 (copy)
    v14.state = {
        lastButtonProps = nil, 
        onDeclineCalled = nil, 
        onActivatedCalled = nil, 
        overlayPercentage = 0
    };
    local v15, v16 = v2.createBinding(UDim2.new(0, 0, 0, 0));
    v14.currentButtonPosition = v15;
    v14.updateCurrentButtonPosition = v16;
    v15, v16 = v2.createBinding(UDim2.new(0, 0, 0, 0));
    v14.lastButtonPosition = v15;
    v14.updateLastButtonPosition = v16;
    v14.positionMotor = v4.createSingleMotor(0);
    v14.positionMotor:onStep(function(v17) --[[ Line: 60 ]]
        -- upvalues: v14 (copy)
        v14.updateCurrentButtonPosition(UDim2.new(v17, 0, 0, 0));
        if v14.animatingRight then
            v14.updateLastButtonPosition(UDim2.new(v17 + 1, 0, 0, 0));
            return;
        else
            v14.updateLastButtonPosition(UDim2.new(v17 - 1, 0, 0, 0));
            return;
        end;
    end);
    v14.positionMotor:onComplete(function(v18) --[[ Line: 68 ]]
        -- upvalues: v14 (copy), v2 (ref)
        if v18 == 0 then
            v14:setState({
                lastButtonProps = v2.None, 
                onDeclineCalled = v2.None, 
                onActivatedCalled = v2.None
            });
        end;
    end);
    v14.overlayMotor = v4.createSingleMotor(0);
    v14.overlayMotor:onStep(function(v19) --[[ Line: 79 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            overlayPercentage = v19
        });
    end);
    v14.overlayMotor:onComplete(function(v20) --[[ Line: 84 ]]
        -- upvalues: v14 (copy), v4 (ref), v11 (ref)
        if v20 == 1 then
            v14.positionMotor:setGoal(v4.spring(0, v11));
        end;
    end);
end;
v13.getButtonProps = function(v21, v22, v23) --[[ Line: 91 ]] --[[ Name: getButtonProps ]]
    local v24 = {
        text = v22.text, 
        icon = v22.icon, 
        lastButton = v22.lastButton, 
        forceShowOptions = v22.forceShowOptions, 
        onDismiss = v22.onDismiss
    };
    if v21.state.lastButtonProps ~= nil then
        if v23 then
            v24.animatingAccept = v21.state.onActivatedCalled;
            v24.animatingDecline = v21.state.onDeclineCalled;
            v24.animatingPercentage = v21.state.overlayPercentage;
            return v24;
        end;
    else
        if v22.onActivated and (v22.onDecline or v21.props.forceShowOptions) then
            v24.onActivated = function() --[[ Line: 108 ]]
                -- upvalues: v21 (copy), v22 (copy)
                v21:setState({
                    onActivatedCalled = true, 
                    onDeclineCalled = false
                });
                v22.onActivated();
            end;
        elseif v22.onActivated then
            v24.onActivated = v22.onActivated;
        end;
        if v22.onDecline then
            v24.onDecline = function() --[[ Line: 119 ]]
                -- upvalues: v21 (copy), v22 (copy)
                v21:setState({
                    onActivatedCalled = false, 
                    onDeclineCalled = true
                });
                v22.onDecline();
            end;
        end;
    end;
    return v24;
end;
v13.render = function(v25) --[[ Line: 132 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_FFlagUseNewPlayerList_0 (copy), v2 (copy), v9 (copy)
    return l_WithLayoutValues_0(function(v26) --[[ Line: 133 ]]
        -- upvalues: l_FFlagUseNewPlayerList_0 (ref), v25 (copy), v2 (ref), v9 (ref)
        if l_FFlagUseNewPlayerList_0 then
            v26 = v25.props.layoutValues;
        end;
        local v27 = {
            CurrentButtonContainer = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = v25.currentButtonPosition, 
                BackgroundTransparency = 1
            }, {
                DropDownButton = v2.createElement(v9, v25:getButtonProps(v25.props))
            })
        };
        if v25.state.lastButtonProps then
            v27.LastButtonContainer = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = v25.lastButtonPosition, 
                BackgroundTransparency = 1
            }, {
                DropDownButton = v2.createElement(v9, v25:getButtonProps(v25.state.lastButtonProps, true))
            });
        end;
        return v2.createElement("Frame", {
            Visible = v25.props.contentVisible, 
            ZIndex = 2, 
            Size = UDim2.new(1, 0, 0, v26.DropDownButtonSizeY), 
            BackgroundTransparency = 1, 
            LayoutOrder = v25.props.layoutOrder, 
            [v2.Ref] = v25.props.forwardRef
        }, v27);
    end);
end;
v13.didUpdate = function(v28, v29, v30) --[[ Line: 169 ]] --[[ Name: didUpdate ]]
    -- upvalues: v4 (copy), v12 (copy), v2 (copy)
    local v31 = v28.props.text ~= v29.text;
    local v32 = true;
    if v29.onDecline == nil then
        v32 = v28.props.forceShowOptions;
    end;
    local v33 = v28.state.onDeclineCalled or v28.state.onActivatedCalled;
    local v34 = false;
    if v28.state.lastButtonProps == nil then
        v34 = v30.lastButtonProps ~= nil;
    end;
    if v31 and v32 and v33 then
        if v28.state.onActivatedCalled and not v28.props.forceShowOptions then
            v28.animatingRight = true;
            v28.positionMotor:setGoal(v4.instant(-1));
        else
            v28.animatingRight = false;
            v28.positionMotor:setGoal(v4.instant(1));
        end;
        v28.overlayMotor:setGoal(v4.instant(0));
        v28.positionMotor:step(0);
        v28.overlayMotor:step(0);
        v28:setState({
            lastButtonProps = v29
        });
        v28.overlayMotor:setGoal(v4.spring(1, v12));
    end;
    if v34 and v28.props.onAnimationComplete then
        v28.props.onAnimationComplete();
    end;
    if v28.props.selectedPlayer ~= v29.selectedPlayer then
        v28.positionMotor:setGoal(v4.instant(0));
        v28.overlayMotor:setGoal(v4.instant(0));
        v28.positionMotor:step(0);
        v28.overlayMotor:step(0);
        v28:setState({
            lastButtonProps = v2.None
        });
    end;
end;
v13.willUnmount = function(v35) --[[ Line: 211 ]] --[[ Name: willUnmount ]]
    v35.positionMotor:destroy();
    v35.positionMotor = nil;
    v35.overlayMotor:destroy();
    v35.overlayMotor = nil;
end;
local function v38(v36) --[[ Line: 218 ]]
    -- upvalues: l_FFlagUseNewPlayerList_0 (copy), l_useLayoutValues_0 (copy), v2 (copy), v13 (copy), v1 (copy)
    local v37 = if l_FFlagUseNewPlayerList_0 then l_useLayoutValues_0() else nil;
    return v2.createElement(v13, v1.Dictionary.join(v36, {
        layoutValues = v37
    }));
end;
if l_FFlagUseNewPlayerList_0 then
    return v38;
else
    return v13;
end;