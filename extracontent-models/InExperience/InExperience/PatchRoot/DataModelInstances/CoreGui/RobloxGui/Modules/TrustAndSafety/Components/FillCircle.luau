local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local v7 = Color3.fromRGB(98, 98, 99);
local v8 = Color3.fromRGB(255, 255, 255);
local v9 = Color3.fromRGB(196, 0, 1);
local v10 = l_Images_0["component_assets/circle_29"];
local v11 = v2.PureComponent:extend("FillCircle");
v11.validateProps = v4.strictInterface({
    Position = v4.UDim2, 
    AnchorPoint = v4.Vector2, 
    fillFraction = v4.number, 
    largerCircleFraction = v4.number, 
    popCircleFraction = v4.number, 
    shakeCircleFraction = v4.number, 
    BackgroundColor = v4.Color3
});
local function _(v12) --[[ Line: 36 ]] --[[ Name: getFillRingZIndex ]]
    if v12 > 0.75 then
        return 8;
    elseif v12 > 0.5 then
        return 6;
    elseif v12 > 0.25 then
        return 4;
    elseif v12 > 0 then
        return 2;
    else
        return 0;
    end;
end;
local function _(v14, v15, v16) --[[ Line: 49 ]] --[[ Name: linearTween ]]
    local v17 = (v16 - v15) / 30;
    return (v14 - v15 / 30) / v17;
end;
local function _(v19, v20, v21) --[[ Line: 54 ]] --[[ Name: isBetweenFrames ]]
    local v22 = false;
    if v20 / 30 <= v19 then
        v22 = v19 <= v21 / 30;
    end;
    return v22;
end;
local function v30(v24, v25, v26, v27) --[[ Line: 58 ]] --[[ Name: largerCircleAnimation ]]
    if v26 then
        v24 = 0.26666666666666666 - v24;
    end;
    local l_v24_0 = v24;
    local v29 = false;
    if l_v24_0 >= 0 then
        v29 = l_v24_0 <= 0.16666666666666666;
    end;
    if v29 then
        l_v24_0 = 16 + 6 * ((v24 - 0) / 0.16666666666666666);
        v25.size(UDim2.new(0, l_v24_0, 0, l_v24_0));
        return;
    else
        l_v24_0 = v24;
        v29 = false;
        if l_v24_0 >= 0.16666666666666666 then
            v29 = l_v24_0 <= 0.26666666666666666;
        end;
        if v29 then
            l_v24_0 = 22 - 2 * ((v24 - 0.16666666666666666) / 0.1);
            v25.size(UDim2.new(0, l_v24_0, 0, l_v24_0));
            return;
        elseif v24 < 0 then
            v25.size(UDim2.new(0, 16, 0, 16));
            v27();
            return;
        else
            v25.size(UDim2.new(0, 20, 0, 20));
            v27();
            return;
        end;
    end;
end;
local function v38(v31, v32, _, v34) --[[ Line: 86 ]] --[[ Name: popCircleAnimation ]]
    local v35 = false;
    if v31 >= 0 then
        v35 = v31 <= 0.1;
    end;
    if v35 then
        local v36 = 20 + 4 * ((v31 - 0) / 0.1);
        v32.size(UDim2.new(0, v36, 0, v36));
        return;
    else
        v35 = false;
        if v31 >= 0.1 then
            v35 = v31 <= 0.2;
        end;
        if v35 then
            local v37 = 24 - 4 * ((v31 - 0.1) / 0.1);
            v32.size(UDim2.new(0, v37, 0, v37));
            return;
        else
            v32.size(UDim2.new(0, 20, 0, 20));
            v34();
            return;
        end;
    end;
end;
local function v44(v39, v40, _, v42) --[[ Line: 107 ]] --[[ Name: shakeCircleAnimation ]]
    local v43 = false;
    if v39 >= 0 then
        v43 = v39 <= 0.1;
    end;
    if v43 then
        v43 = (v39 - 0) / 0.1;
        v40.positionOffset(UDim2.new(0, -4 * v43, 0, 0));
        return;
    else
        v43 = false;
        if v39 >= 0.1 then
            v43 = v39 <= 0.2;
        end;
        if v43 then
            v43 = (v39 - 0.1) / 0.1;
            v40.positionOffset(UDim2.new(0, -4 + 12 * v43, 0, 0));
            return;
        else
            v43 = false;
            if v39 >= 0.2 then
                v43 = v39 <= 0.26666666666666666;
            end;
            if v43 then
                v43 = (v39 - 0.2) / 0.06666666666666667;
                v40.positionOffset(UDim2.new(0, 8 - 16 * v43, 0, 0));
                return;
            else
                v43 = false;
                if v39 >= 0.26666666666666666 then
                    v43 = v39 <= 0.3333333333333333;
                end;
                if v43 then
                    v43 = (v39 - 0.26666666666666666) / 0.06666666666666667;
                    v40.positionOffset(UDim2.new(0, -8 + 16 * v43, 0, 0));
                    return;
                else
                    v43 = false;
                    if v39 >= 0.3333333333333333 then
                        v43 = v39 <= 0.4;
                    end;
                    if v43 then
                        v43 = (v39 - 0.3333333333333333) / 0.06666666666666667;
                        v40.positionOffset(UDim2.new(0, 8 - 16 * v43, 0, 0));
                        return;
                    else
                        v43 = false;
                        if v39 >= 0.4 then
                            v43 = v39 <= 0.4666666666666667;
                        end;
                        if v43 then
                            v43 = (v39 - 0.4) / 0.06666666666666667;
                            v40.positionOffset(UDim2.new(0, -8 + 8 * v43, 0, 0));
                            return;
                        else
                            v40.positionOffset(UDim2.new(0, 0, 0, 0));
                            v42();
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v11.init = function(v45) --[[ Line: 142 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    local v46, v47 = v2.createBinding(UDim2.new(0, 16, 0, 16));
    v45.sizeBinding = v46;
    v45.sizeBindingUpdate = v47;
    v45.largerSizeBinding = v45.sizeBinding:map(function(v48) --[[ Line: 145 ]]
        return v48 + UDim2.new(0, 2, 0, 2);
    end);
    v46, v47 = v2.createBinding(UDim2.new(0, 0, 0, 0));
    v45.positionOffsetBinding = v46;
    v45.positionOffsetBindingUpdate = v47;
    v45.updateBindings = {
        size = v45.sizeBindingUpdate, 
        positionOffset = v45.positionOffsetBindingUpdate
    };
    v45.animationStartTime = nil;
    v45.animationFunction = nil;
    v45.reverseAnimation = false;
    v45.renderSteppedConnection = nil;
end;
v11.render = function(v49) --[[ Line: 161 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v8 (copy), v2 (copy), v7 (copy), l_ImageSetLabel_0 (copy), v10 (copy)
    local l_props_0 = v49.props;
    local v51 = l_props_0.fillFraction >= 1 and v9 or v8;
    local l_createElement_0 = v2.createElement;
    local v53 = "Frame";
    local v54 = {
        Size = v49.sizeBinding, 
        Position = l_props_0.Position, 
        AnchorPoint = l_props_0.AnchorPoint, 
        BackgroundTransparency = 1
    };
    local v55 = {};
    local l_createElement_1 = v2.createElement;
    local v57 = "Frame";
    local v58 = {
        Position = v49.positionOffsetBinding, 
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v7
    };
    local v59 = {
        OuterRing = v2.createElement(l_ImageSetLabel_0, {
            Image = "rbxasset://textures/ui/InGameMenu/CircleCutout.png", 
            Size = UDim2.new(1, 0, 1, 0), 
            ImageColor3 = l_props_0.BackgroundColor, 
            BackgroundTransparency = 1, 
            ZIndex = 10
        }), 
        InnerRing = v2.createElement(l_ImageSetLabel_0, {
            Image = v10, 
            Size = UDim2.new(1, -4, 1, -4), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ImageColor3 = l_props_0.BackgroundColor, 
            BackgroundTransparency = 1, 
            ZIndex = 10
        })
    };
    local l_createElement_2 = v2.createElement;
    local v61 = "Frame";
    local v62 = {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Rotation = l_props_0.fillFraction * 360
    };
    local l_fillFraction_0 = l_props_0.fillFraction;
    v62.ZIndex = l_fillFraction_0 > 0.75 and 8 or l_fillFraction_0 > 0.5 and 6 or l_fillFraction_0 > 0.25 and 4 or l_fillFraction_0 > 0 and 2 or 0;
    v59.FillRingRotationFrame = l_createElement_2(v61, v62, {
        FillRing = v2.createElement(l_ImageSetLabel_0, {
            Image = "rbxasset://textures/ui/InGameMenu/QuarterCircle.png", 
            Size = v49.largerSizeBinding, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ImageColor3 = v51, 
            BackgroundTransparency = 1
        })
    });
    v59.EdgeBlockers = v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = 10
    }, {
        Top = v2.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 1), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            Size = UDim2.new(1, 4, 0, 2), 
            BackgroundColor3 = l_props_0.BackgroundColor, 
            BorderSizePixel = 0
        }), 
        Right = v2.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Size = UDim2.new(0, 2, 1, 4), 
            BackgroundColor3 = l_props_0.BackgroundColor, 
            BorderSizePixel = 0
        }), 
        Bottom = v2.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 1, 0), 
            Size = UDim2.new(1, 4, 0, 2), 
            BackgroundColor3 = l_props_0.BackgroundColor, 
            BorderSizePixel = 0
        }), 
        Left = v2.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(0, 2, 1, 4), 
            BackgroundColor3 = l_props_0.BackgroundColor, 
            BorderSizePixel = 0
        })
    });
    v59.TopLeftFill = v2.createElement("Frame", {
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundColor3 = l_props_0.fillFraction >= 1 and v51 or v7, 
        BorderSizePixel = 0, 
        ZIndex = l_props_0.fillFraction >= 1 and 9 or 7
    });
    v59.BottomLeftFill = v2.createElement("Frame", {
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0, 0, 0.5, 0), 
        BackgroundColor3 = l_props_0.fillFraction >= 0.75 and v51 or v7, 
        BorderSizePixel = 0, 
        ZIndex = l_props_0.fillFraction >= 0.75 and 9 or 5
    });
    v59.BottomRightFill = v2.createElement("Frame", {
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundColor3 = l_props_0.fillFraction >= 0.5 and v51 or v7, 
        BorderSizePixel = 0, 
        ZIndex = l_props_0.fillFraction >= 0.5 and 9 or 3
    });
    v59.TopRightFill = v2.createElement("Frame", {
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        BackgroundColor3 = l_props_0.fillFraction >= 0.25 and v51 or v7, 
        BorderSizePixel = 0, 
        ZIndex = l_props_0.fillFraction >= 0.25 and 9 or 1
    });
    v55.PositionOffsetFrame = l_createElement_1(v57, v58, v59);
    return l_createElement_0(v53, v54, v55);
end;
v11.didUpdate = function(v64, v65, _) --[[ Line: 284 ]] --[[ Name: didUpdate ]]
    -- upvalues: v30 (copy), v38 (copy), v44 (copy)
    local v67 = v65.fillFraction >= v65.largerCircleFraction;
    local v68 = v64.props.fillFraction >= v64.props.largerCircleFraction;
    if v67 ~= v68 then
        v64:playAnimation(v30, not v68);
    end;
    local v69 = v65.fillFraction >= v65.popCircleFraction;
    if v64.props.fillFraction >= v64.props.popCircleFraction and not v69 then
        v64:playAnimation(v38, false);
    end;
    local v70 = v65.fillFraction >= v65.shakeCircleFraction;
    if v64.props.fillFraction >= v64.props.shakeCircleFraction and not v70 then
        v64:playAnimation(v44, false);
    end;
end;
v11.playAnimation = function(v71, v72, v73) --[[ Line: 304 ]] --[[ Name: playAnimation ]]
    -- upvalues: l_RunService_0 (copy)
    if v71.animationFunction then
        v71.animationFunction(100, v71.updateBindings, v71.reverseAnimation, function() --[[ Line: 307 ]]

        end);
    end;
    v71.animationStartTime = tick();
    v71.animationFunction = v72;
    v71.reverseAnimation = v73;
    if not v71.renderSteppedConnection then
        v71.renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 313 ]]
            -- upvalues: v71 (copy)
            v71.animationFunction(tick() - v71.animationStartTime, v71.updateBindings, v71.reverseAnimation, function() --[[ Line: 318 ]]
                -- upvalues: v71 (ref)
                v71:stopAnimation();
            end);
        end);
    end;
end;
v11.stopAnimation = function(v74) --[[ Line: 326 ]] --[[ Name: stopAnimation ]]
    if v74.renderSteppedConnection then
        v74.renderSteppedConnection:Disconnect();
        v74.renderSteppedConnection = nil;
    end;
end;
v11.willUnmount = function(v75) --[[ Line: 333 ]] --[[ Name: willUnmount ]]
    v75:stopAnimation();
end;
return v11;