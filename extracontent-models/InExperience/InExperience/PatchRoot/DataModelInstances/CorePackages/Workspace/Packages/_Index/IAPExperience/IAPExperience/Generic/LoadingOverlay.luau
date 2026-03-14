local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local _ = require(l_Parent_2.React);
local v5 = require(l_Parent_2.Otter);
local v6 = require(l_Parent_2.UIBlox);
local l_LoadingSpinner_0 = v6.App.Loading.LoadingSpinner;
local l_withStyle_0 = v6.Core.Style.withStyle;
local v9 = require(l_Parent_1.Locale.MultiTextLocalizer);
local v10 = require(l_Parent_0.LoadingOverlayState);
local v11 = v3.Component:extend(script.Name);
local v12 = {
    dampingRatio = 1, 
    frequency = 1
};
v11.init = function(v13) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v5 (copy), v12 (copy)
    local v14, v15 = v3.createBinding(0);
    v13.motor = v5.createSingleMotor(0);
    v13.motor:start();
    v13.motor:onStep(v15);
    v13.animationProgress = v14;
    v13.motor:setGoal(v5.spring(v13.props.loadingState ~= nil and 1 or 0, v12));
end;
v11.getLoadingMessage = function(_, v17, v18) --[[ Line: 45 ]] --[[ Name: getLoadingMessage ]]
    -- upvalues: v10 (copy)
    if v18 == v10.PurchasingItem then
        return v17.PurchasingItem;
    elseif v18 == v10.PurchasingRobux then
        return v17.PurchasingRobux;
    elseif v18 == v10.WaitingForPurchase then
        return v17.WaitingForPurchase;
    elseif v18 == v10.WaitingForRobux then
        return v17.WaitingForRobux;
    else
        return nil;
    end;
end;
v11.didUpdate = function(v19, v20, _) --[[ Line: 58 ]] --[[ Name: didUpdate ]]
    -- upvalues: v5 (copy), v12 (copy)
    local l_props_0 = v19.props;
    if v20.loadingState ~= l_props_0.loadingState then
        v19.motor:setGoal(v5.spring(l_props_0.loadingState ~= nil and 1 or 0, v12));
    end;
end;
v11.willUnmount = function(v23) --[[ Line: 66 ]] --[[ Name: willUnmount ]]
    v23.motor:destroy();
end;
v11.render = function(v24) --[[ Line: 70 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v9 (copy)
    return v3.createElement(v9, {
        keys = {
            PurchasingItem = {
                key = "IAPExperience.Loading.Text.PurchasingItem"
            }, 
            PurchasingRobux = {
                key = "IAPExperience.Loading.Text.PurchasingRobux"
            }, 
            WaitingForPurchase = {
                key = "IAPExperience.Loading.Text.WaitingForPurchase"
            }, 
            WaitingForRobux = {
                key = "IAPExperience.Loading.Text.WaitingForRobux"
            }
        }, 
        render = function(v25) --[[ Line: 86 ]] --[[ Name: render ]]
            -- upvalues: v24 (copy)
            return v24:renderAlert(v25);
        end
    });
end;
v11.renderAlert = function(v26, v27) --[[ Line: 92 ]] --[[ Name: renderAlert ]]
    -- upvalues: v10 (copy), l_withStyle_0 (copy), v3 (copy), l_LoadingSpinner_0 (copy)
    local l_props_1 = v26.props;
    local v29 = false;
    if l_props_1.loadingState ~= v10.None then
        v29 = l_props_1.loadingState ~= nil;
    end;
    local v30 = v26:getLoadingMessage(v27, l_props_1.loadingState);
    return l_withStyle_0(function(v31) --[[ Line: 98 ]]
        -- upvalues: v3 (ref), v26 (copy), l_props_1 (copy), v29 (copy), l_LoadingSpinner_0 (ref), v30 (copy)
        local l_Theme_0 = v31.Theme;
        local l_Font_0 = v31.Font;
        return v3.createElement("Frame", {
            BackgroundColor3 = l_Theme_0.BackgroundUIContrast.Color, 
            BackgroundTransparency = v26.animationProgress:map(function(v34) --[[ Line: 103 ]]
                -- upvalues: l_props_1 (ref), l_Theme_0 (copy)
                if l_props_1.showOverlay then
                    if l_props_1.shouldAnimate then
                        return 1 - (1 - l_Theme_0.BackgroundUIContrast.Transparency) * v34;
                    else
                        return l_Theme_0.BackgroundUIContrast.Transparency;
                    end;
                else
                    return 1;
                end;
            end), 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = l_props_1.showOverlay
        }, {
            StopPropagationOverlay = v3.createElement("TextButton", {
                Active = false, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Selectable = false, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = "", 
                ZIndex = 0
            }), 
            MiddleContent = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                ZIndex = 1
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 20), 
                    [v3.Change.AbsoluteContentSize] = v26.onListLayoutAbsoluteContentSizeChanged
                }), 
                Spinner = v29 and v3.createElement(l_LoadingSpinner_0, {
                    size = UDim2.fromOffset(48, 48), 
                    position = UDim2.fromScale(0.5, 0.5), 
                    anchorPoint = Vector2.new(0.5, 0.5)
                }) or nil, 
                PreText = v30 and v3.createElement("TextLabel", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextWrapped = true, 
                    Font = l_Font_0.Body.Font, 
                    Text = v30, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency
                }) or nil
            }), 
            Children = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, v26.props[v3.Children])
        });
    end);
end;
return v11;