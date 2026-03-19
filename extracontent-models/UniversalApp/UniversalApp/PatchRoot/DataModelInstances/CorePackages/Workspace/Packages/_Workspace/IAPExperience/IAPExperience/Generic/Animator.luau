local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Localization_0 = require(l_Parent_1.RobloxAppLocales).Localization;
local v4 = require(l_Parent_0.Locale.LocaleProvider);
local l_LocalizationProvider_0 = require(l_Parent_1.Localization).LocalizationProvider;
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_1.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local v7 = require(l_Parent_1.Roact);
local v8 = require(l_Parent_1.Otter);
local v9 = v7.Component:extend(script.Name);
local v10 = {
    dampingRatio = 1, 
    frequency = 1.6
};
v9.init = function(v11) --[[ Line: 36 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v8 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v10 (copy)
    v11.state = {
        shouldRenderChildren = v11.props.shouldShow
    };
    local v12, v13 = v7.createBinding(1);
    v11.motor = v8.createSingleMotor(1);
    v11.motor:start();
    v11.motor:onStep(v13);
    v11.animationProgress = v12;
    v11.motor:onComplete(function() --[[ Line: 49 ]]
        -- upvalues: v11 (copy)
        local l_props_0 = v11.props;
        if l_props_0.shouldShow then
            if l_props_0.onShown ~= nil then
                l_props_0.onShown();
                return;
            end;
        else
            v11:setState({
                shouldRenderChildren = false
            });
            if l_props_0.onHidden ~= nil then
                l_props_0.onHidden();
            end;
        end;
    end);
    local v15 = v11.props.shouldShow and 0 or 1;
    if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v11.props.skipAnimation then
        v11.motor:setGoal(v8.instant(v15));
        return;
    else
        v11.motor:setGoal(v8.spring(v15, v10));
        return;
    end;
end;
v9.didUpdate = function(v16, v17, _) --[[ Line: 73 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v8 (copy), v10 (copy)
    local l_props_1 = v16.props;
    if v17.shouldShow ~= l_props_1.shouldShow then
        if l_props_1.shouldShow then
            v16:setState({
                shouldRenderChildren = l_props_1.shouldShow
            });
        end;
        local v20 = v16.props.shouldShow and 0 or 1;
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v16.props.skipAnimation then
            v16.motor:setGoal(v8.instant(v20));
            return;
        else
            v16.motor:setGoal(v8.spring(v20, v10));
        end;
    end;
end;
v9.willUnmount = function(v21) --[[ Line: 91 ]] --[[ Name: willUnmount ]]
    v21.motor:destroy();
end;
v9.renderWithoutLocale = function(v22) --[[ Line: 95 ]] --[[ Name: renderWithoutLocale ]]
    -- upvalues: v7 (copy)
    local l_props_2 = v22.props;
    if l_props_2.shouldAnimate then
        return v7.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Position = v22.animationProgress:map(function(v24) --[[ Line: 103 ]]
                -- upvalues: l_props_2 (copy)
                if l_props_2.animateDown then
                    return UDim2.new(0, 0, -1 * v24, 0);
                else
                    return UDim2.new(0, 0, 1 * v24, 0);
                end;
            end), 
            ZIndex = l_props_2.ZIndex
        }, v22.state.shouldRenderChildren and l_props_2.renderChildren() or nil);
    elseif l_props_2.shouldShow then
        return l_props_2.renderChildren();
    else
        return nil;
    end;
end;
v9.render = function(v25) --[[ Line: 121 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v4 (copy), l_LocalizationService_0 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy)
    return v7.createElement(v4, {
        locale = l_LocalizationService_0 and l_LocalizationService_0.RobloxLocaleId
    }, {
        v7.createElement(l_LocalizationProvider_0, {
            localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
        }, {
            v25:renderWithoutLocale()
        })
    });
end;
return v9;