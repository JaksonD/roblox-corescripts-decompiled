local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.Otter);
local l_Connection_0 = script.Parent.Parent.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v6 = require(script.Parent.DropDownButton);
local v7 = {
    dampingRatio = 1, 
    frequency = 4
};
local v8 = {
    dampingRatio = 1, 
    frequency = 4
};
local v9 = v1.PureComponent:extend("DropDownAnimator");
v9.validateProps = v2.strictInterface({
    text = v2.string, 
    icon = v2.union(v2.string, v2.table), 
    lastButton = v2.boolean, 
    layoutOrder = v2.integer, 
    onActivated = v2.callback, 
    forceShowOptions = v2.boolean, 
    selectedPlayer = v2.optional(v2.instanceIsA("Player")), 
    onDecline = v2.optional(v2.callback), 
    onDismiss = v2.optional(v2.callback)
});
v9.init = function(v10) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v3 (copy), v7 (copy)
    v10.state = {
        lastButtonProps = nil, 
        onDeclineCalled = nil, 
        onActivatedCalled = nil, 
        overlayPercentage = 0
    };
    local v11, v12 = v1.createBinding(UDim2.new(0, 0, 0, 0));
    v10.currentButtonPosition = v11;
    v10.updateCurrentButtonPosition = v12;
    v11, v12 = v1.createBinding(UDim2.new(0, 0, 0, 0));
    v10.lastButtonPosition = v11;
    v10.updateLastButtonPosition = v12;
    v10.positionMotor = v3.createSingleMotor(0);
    v10.positionMotor:onStep(function(v13) --[[ Line: 50 ]]
        -- upvalues: v10 (copy)
        v10.updateCurrentButtonPosition(UDim2.new(v13, 0, 0, 0));
        if v10.animatingRight then
            v10.updateLastButtonPosition(UDim2.new(v13 + 1, 0, 0, 0));
            return;
        else
            v10.updateLastButtonPosition(UDim2.new(v13 - 1, 0, 0, 0));
            return;
        end;
    end);
    v10.positionMotor:onComplete(function(v14) --[[ Line: 58 ]]
        -- upvalues: v10 (copy), v1 (ref)
        if v14 == 0 then
            v10:setState({
                lastButtonProps = v1.None, 
                onDeclineCalled = v1.None, 
                onActivatedCalled = v1.None
            });
        end;
    end);
    v10.overlayMotor = v3.createSingleMotor(0);
    v10.overlayMotor:onStep(function(v15) --[[ Line: 69 ]]
        -- upvalues: v10 (copy)
        v10:setState({
            overlayPercentage = v15
        });
    end);
    v10.overlayMotor:onComplete(function(v16) --[[ Line: 74 ]]
        -- upvalues: v10 (copy), v3 (ref), v7 (ref)
        if v16 == 1 then
            v10.positionMotor:setGoal(v3.spring(0, v7));
        end;
    end);
end;
v9.getButtonProps = function(v17, v18, v19) --[[ Line: 81 ]] --[[ Name: getButtonProps ]]
    local v20 = {
        text = v18.text, 
        icon = v18.icon, 
        lastButton = v18.lastButton, 
        forceShowOptions = v18.forceShowOptions, 
        onDismiss = v18.onDismiss
    };
    if v17.state.lastButtonProps ~= nil then
        if v19 then
            v20.animatingAccept = v17.state.onActivatedCalled;
            v20.animatingDecline = v17.state.onDeclineCalled;
            v20.animatingPercentage = v17.state.overlayPercentage;
            return v20;
        end;
    else
        if v18.onActivated and (v18.onDecline or v17.props.forceShowOptions) then
            v20.onActivated = function() --[[ Line: 98 ]]
                -- upvalues: v17 (copy), v18 (copy)
                v17:setState({
                    onActivatedCalled = true, 
                    onDeclineCalled = false
                });
                v18.onActivated();
            end;
        elseif v18.onActivated then
            v20.onActivated = v18.onActivated;
        end;
        if v18.onDecline then
            v20.onDecline = function() --[[ Line: 109 ]]
                -- upvalues: v17 (copy), v18 (copy)
                v17:setState({
                    onActivatedCalled = false, 
                    onDeclineCalled = true
                });
                v18.onDecline();
            end;
        end;
    end;
    return v20;
end;
v9.render = function(v21) --[[ Line: 122 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), v1 (copy), v6 (copy)
    return l_WithLayoutValues_0(function(v22) --[[ Line: 123 ]]
        -- upvalues: v1 (ref), v21 (copy), v6 (ref)
        local v23 = {
            CurrentButtonContainer = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = v21.currentButtonPosition, 
                BackgroundTransparency = 1
            }, {
                DropDownButton = v1.createElement(v6, v21:getButtonProps(v21.props))
            })
        };
        if v21.state.lastButtonProps then
            v23.LastButtonContainer = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = v21.lastButtonPosition, 
                BackgroundTransparency = 1
            }, {
                DropDownButton = v1.createElement(v6, v21:getButtonProps(v21.state.lastButtonProps, true))
            });
        end;
        return v1.createElement("Frame", {
            ZIndex = 2, 
            Size = UDim2.new(1, 0, 0, v22.DropDownButtonSizeY), 
            BackgroundTransparency = 1, 
            LayoutOrder = v21.props.layoutOrder
        }, v23);
    end);
end;
v9.didUpdate = function(v24, v25, _) --[[ Line: 156 ]] --[[ Name: didUpdate ]]
    -- upvalues: v3 (copy), v8 (copy), v1 (copy)
    local v27 = v24.props.text ~= v25.text;
    local v28 = true;
    if v25.onDecline == nil then
        v28 = v24.props.forceShowOptions;
    end;
    local v29 = v24.state.onDeclineCalled or v24.state.onActivatedCalled;
    if v27 and v28 and v29 then
        if v24.state.onActivatedCalled and not v24.props.forceShowOptions then
            v24.animatingRight = true;
            v24.positionMotor:setGoal(v3.instant(-1));
        else
            v24.animatingRight = false;
            v24.positionMotor:setGoal(v3.instant(1));
        end;
        v24.overlayMotor:setGoal(v3.instant(0));
        v24.positionMotor:step(0);
        v24.overlayMotor:step(0);
        v24:setState({
            lastButtonProps = v25
        });
        v24.overlayMotor:setGoal(v3.spring(1, v8));
    end;
    if v24.props.selectedPlayer ~= v25.selectedPlayer then
        v24.positionMotor:setGoal(v3.instant(0));
        v24.overlayMotor:setGoal(v3.instant(0));
        v24.positionMotor:step(0);
        v24.overlayMotor:step(0);
        v24:setState({
            lastButtonProps = v1.None
        });
    end;
end;
v9.willUnmount = function(v30) --[[ Line: 191 ]] --[[ Name: willUnmount ]]
    v30.positionMotor:destroy();
    v30.positionMotor = nil;
    v30.overlayMotor:destroy();
    v30.overlayMotor = nil;
end;
return v9;