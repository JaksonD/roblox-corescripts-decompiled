local l_Parent_0 = script:FindFirstAncestor("PurchasePrompt").Parent;
local v1 = require(l_Parent_0.PurchasePromptDeps);
local l_Roact_0 = v1.Roact;
local l_Otter_0 = v1.Otter;
local l_t_0 = v1.t;
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local v6 = l_Roact_0.Component:extend(script.Name);
local v7 = {
    dampingRatio = 1, 
    frequency = 1.6
};
v6.validateProps = l_t_0.interface({
    shouldShow = l_t_0.boolean, 
    skipAnimation = l_t_0.optional(l_t_0.boolean), 
    onShown = l_t_0.optional(l_t_0.callback), 
    onHidden = l_t_0.optional(l_t_0.callback)
});
v6.init = function(v8) --[[ Line: 26 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy), l_Otter_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v7 (copy)
    local v9, v10 = l_Roact_0.createBinding(1);
    v8.motor = l_Otter_0.createSingleMotor(1);
    v8.motor:start();
    v8.motor:onStep(v10);
    v8.animationProgress = v9;
    v8.setProgress = v10;
    v8.onComplete = function() --[[ Line: 36 ]]
        -- upvalues: v8 (copy)
        if v8.props.shouldShow then
            if v8.props.onShown then
                v8.props.onShown();
                return;
            end;
        elseif v8.props.onHidden then
            v8.props.onHidden();
        end;
    end;
    v8.motor:onComplete(v8.onComplete);
    local v11 = v8.props.shouldShow and 0 or 1;
    if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v8.props.skipAnimation then
        v8.motor:stop();
        v10(v11);
        task.defer(function() --[[ Line: 54 ]]
            -- upvalues: v8 (copy)
            v8.onComplete();
        end);
        return;
    else
        v8.motor:setGoal(l_Otter_0.spring(v11, v7));
        return;
    end;
end;
v6.didUpdate = function(v12, v13, _) --[[ Line: 62 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_Otter_0 (copy), v7 (copy)
    if v13.shouldShow ~= v12.props.shouldShow or l_FFlagEnableUnifiedProductPurchaseFlow_0 and v13.skipAnimation ~= v12.props.skipAnimation then
        local v15 = v12.props.shouldShow and 0 or 1;
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v12.props.skipAnimation then
            v12.motor:stop();
            v12.setProgress(v15);
            task.defer(function() --[[ Line: 72 ]]
                -- upvalues: v12 (copy)
                v12.onComplete();
            end);
            return;
        else
            v12.motor:setGoal(l_Otter_0.spring(v15, v7));
        end;
    end;
end;
v6.render = function(v16) --[[ Line: 81 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy)
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Position = v16.animationProgress:map(function(v17) --[[ Line: 86 ]]
            return UDim2.new(0, 0, -1 * v17, 0);
        end)
    }, v16.props[l_Roact_0.Children]);
end;
return v6;