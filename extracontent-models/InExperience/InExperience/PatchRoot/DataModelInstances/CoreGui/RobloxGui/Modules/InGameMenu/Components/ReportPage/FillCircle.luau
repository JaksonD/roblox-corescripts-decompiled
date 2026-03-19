local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_t_0 = v2.t;
local l_UIBlox_0 = v2.UIBlox;
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(l_Parent_0.Resources.Assets);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v9 = Color3.fromRGB(98, 98, 99);
local v10 = Color3.fromRGB(255, 255, 255);
local v11 = Color3.fromRGB(196, 0, 1);
local v12 = l_Roact_0.PureComponent:extend("FillCircle");
v12.validateProps = l_t_0.strictInterface({
    Position = l_t_0.UDim2, 
    AnchorPoint = l_t_0.Vector2, 
    fillFraction = l_t_0.number, 
    largerCircleFraction = l_t_0.number, 
    popCircleFraction = l_t_0.number, 
    shakeCircleFraction = l_t_0.number, 
    BackgroundColor = l_t_0.Color3
});
local function _(v13) --[[ Line: 37 ]] --[[ Name: getFillRingZIndex ]]
    if v13 > 0.75 then
        return 8;
    elseif v13 > 0.5 then
        return 6;
    elseif v13 > 0.25 then
        return 4;
    elseif v13 > 0 then
        return 2;
    else
        return 0;
    end;
end;
local function _(v15, v16, v17) --[[ Line: 50 ]] --[[ Name: linearTween ]]
    local v18 = (v17 - v16) / 30;
    return (v15 - v16 / 30) / v18;
end;
local function _(v20, v21, v22) --[[ Line: 55 ]] --[[ Name: isBetweenFrames ]]
    local v23 = false;
    if v21 / 30 <= v20 then
        v23 = v20 <= v22 / 30;
    end;
    return v23;
end;
local function v31(v25, v26, v27, v28) --[[ Line: 59 ]] --[[ Name: largerCircleAnimation ]]
    if v27 then
        v25 = 0.26666666666666666 - v25;
    end;
    local l_v25_0 = v25;
    local v30 = false;
    if l_v25_0 >= 0 then
        v30 = l_v25_0 <= 0.16666666666666666;
    end;
    if v30 then
        l_v25_0 = 16 + 6 * ((v25 - 0) / 0.16666666666666666);
        v26.size(UDim2.new(0, l_v25_0, 0, l_v25_0));
        return;
    else
        l_v25_0 = v25;
        v30 = false;
        if l_v25_0 >= 0.16666666666666666 then
            v30 = l_v25_0 <= 0.26666666666666666;
        end;
        if v30 then
            l_v25_0 = 22 - 2 * ((v25 - 0.16666666666666666) / 0.1);
            v26.size(UDim2.new(0, l_v25_0, 0, l_v25_0));
            return;
        elseif v25 < 0 then
            v26.size(UDim2.new(0, 16, 0, 16));
            v28();
            return;
        else
            v26.size(UDim2.new(0, 20, 0, 20));
            v28();
            return;
        end;
    end;
end;
local function v39(v32, v33, _, v35) --[[ Line: 87 ]] --[[ Name: popCircleAnimation ]]
    local v36 = false;
    if v32 >= 0 then
        v36 = v32 <= 0.1;
    end;
    if v36 then
        local v37 = 20 + 4 * ((v32 - 0) / 0.1);
        v33.size(UDim2.new(0, v37, 0, v37));
        return;
    else
        v36 = false;
        if v32 >= 0.1 then
            v36 = v32 <= 0.2;
        end;
        if v36 then
            local v38 = 24 - 4 * ((v32 - 0.1) / 0.1);
            v33.size(UDim2.new(0, v38, 0, v38));
            return;
        else
            v33.size(UDim2.new(0, 20, 0, 20));
            v35();
            return;
        end;
    end;
end;
local function v45(v40, v41, _, v43) --[[ Line: 108 ]] --[[ Name: shakeCircleAnimation ]]
    local v44 = false;
    if v40 >= 0 then
        v44 = v40 <= 0.1;
    end;
    if v44 then
        v44 = (v40 - 0) / 0.1;
        v41.positionOffset(UDim2.new(0, -4 * v44, 0, 0));
        return;
    else
        v44 = false;
        if v40 >= 0.1 then
            v44 = v40 <= 0.2;
        end;
        if v44 then
            v44 = (v40 - 0.1) / 0.1;
            v41.positionOffset(UDim2.new(0, -4 + 12 * v44, 0, 0));
            return;
        else
            v44 = false;
            if v40 >= 0.2 then
                v44 = v40 <= 0.26666666666666666;
            end;
            if v44 then
                v44 = (v40 - 0.2) / 0.06666666666666667;
                v41.positionOffset(UDim2.new(0, 8 - 16 * v44, 0, 0));
                return;
            else
                v44 = false;
                if v40 >= 0.26666666666666666 then
                    v44 = v40 <= 0.3333333333333333;
                end;
                if v44 then
                    v44 = (v40 - 0.26666666666666666) / 0.06666666666666667;
                    v41.positionOffset(UDim2.new(0, -8 + 16 * v44, 0, 0));
                    return;
                else
                    v44 = false;
                    if v40 >= 0.3333333333333333 then
                        v44 = v40 <= 0.4;
                    end;
                    if v44 then
                        v44 = (v40 - 0.3333333333333333) / 0.06666666666666667;
                        v41.positionOffset(UDim2.new(0, 8 - 16 * v44, 0, 0));
                        return;
                    else
                        v44 = false;
                        if v40 >= 0.4 then
                            v44 = v40 <= 0.4666666666666667;
                        end;
                        if v44 then
                            v44 = (v40 - 0.4) / 0.06666666666666667;
                            v41.positionOffset(UDim2.new(0, -8 + 8 * v44, 0, 0));
                            return;
                        else
                            v41.positionOffset(UDim2.new(0, 0, 0, 0));
                            v43();
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v12.init = function(v46) --[[ Line: 143 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy)
    local v47, v48 = l_Roact_0.createBinding(UDim2.new(0, 16, 0, 16));
    v46.sizeBinding = v47;
    v46.sizeBindingUpdate = v48;
    v46.largerSizeBinding = v46.sizeBinding:map(function(v49) --[[ Line: 146 ]]
        return v49 + UDim2.new(0, 2, 0, 2);
    end);
    v47, v48 = l_Roact_0.createBinding(UDim2.new(0, 0, 0, 0));
    v46.positionOffsetBinding = v47;
    v46.positionOffsetBindingUpdate = v48;
    v46.updateBindings = {
        size = v46.sizeBindingUpdate, 
        positionOffset = v46.positionOffsetBindingUpdate
    };
    v46.animationStartTime = nil;
    v46.animationFunction = nil;
    v46.reverseAnimation = false;
    v46.renderSteppedConnection = nil;
end;
v12.render = function(v50) --[[ Line: 162 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v10 (copy), l_Roact_0 (copy), v9 (copy), l_ImageSetLabel_0 (copy), v7 (copy)
    local l_props_0 = v50.props;
    local v52 = l_props_0.fillFraction >= 1 and v11 or v10;
    local l_createElement_0 = l_Roact_0.createElement;
    local v54 = "Frame";
    local v55 = {
        Size = v50.sizeBinding, 
        Position = l_props_0.Position, 
        AnchorPoint = l_props_0.AnchorPoint, 
        BackgroundTransparency = 1
    };
    local v56 = {};
    local l_createElement_1 = l_Roact_0.createElement;
    local v58 = "Frame";
    local v59 = {
        Position = v50.positionOffsetBinding, 
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v9
    };
    local v60 = {
        OuterRing = l_Roact_0.createElement(l_ImageSetLabel_0, {
            Image = v7.Images.CircleCutout, 
            Size = UDim2.new(1, 0, 1, 0), 
            ImageColor3 = l_props_0.BackgroundColor, 
            BackgroundTransparency = 1, 
            ZIndex = 10
        }), 
        InnerRing = l_Roact_0.createElement(l_ImageSetLabel_0, {
            Image = v7.Images.Circle, 
            Size = UDim2.new(1, -4, 1, -4), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ImageColor3 = l_props_0.BackgroundColor, 
            BackgroundTransparency = 1, 
            ZIndex = 10
        })
    };
    local l_createElement_2 = l_Roact_0.createElement;
    local v62 = "Frame";
    local v63 = {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Rotation = l_props_0.fillFraction * 360
    };
    local l_fillFraction_0 = l_props_0.fillFraction;
    v63.ZIndex = l_fillFraction_0 > 0.75 and 8 or l_fillFraction_0 > 0.5 and 6 or l_fillFraction_0 > 0.25 and 4 or l_fillFraction_0 > 0 and 2 or 0;
    v60.FillRingRotationFrame = l_createElement_2(v62, v63, {
        FillRing = l_Roact_0.createElement(l_ImageSetLabel_0, {
            Image = v7.Images.QuarterCircle, 
            Size = v50.largerSizeBinding, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ImageColor3 = v52, 
            BackgroundTransparency = 1
        })
    });
    v60.EdgeBlockers = l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = 10
    }, {
        Top = l_Roact_0.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 1), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            Size = UDim2.new(1, 4, 0, 2), 
            BackgroundColor3 = l_props_0.BackgroundColor, 
            BorderSizePixel = 0
        }), 
        Right = l_Roact_0.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Size = UDim2.new(0, 2, 1, 4), 
            BackgroundColor3 = l_props_0.BackgroundColor, 
            BorderSizePixel = 0
        }), 
        Bottom = l_Roact_0.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 1, 0), 
            Size = UDim2.new(1, 4, 0, 2), 
            BackgroundColor3 = l_props_0.BackgroundColor, 
            BorderSizePixel = 0
        }), 
        Left = l_Roact_0.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(0, 2, 1, 4), 
            BackgroundColor3 = l_props_0.BackgroundColor, 
            BorderSizePixel = 0
        })
    });
    v60.TopLeftFill = l_Roact_0.createElement("Frame", {
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundColor3 = l_props_0.fillFraction >= 1 and v52 or v9, 
        BorderSizePixel = 0, 
        ZIndex = l_props_0.fillFraction >= 1 and 9 or 7
    });
    v60.BottomLeftFill = l_Roact_0.createElement("Frame", {
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0, 0, 0.5, 0), 
        BackgroundColor3 = l_props_0.fillFraction >= 0.75 and v52 or v9, 
        BorderSizePixel = 0, 
        ZIndex = l_props_0.fillFraction >= 0.75 and 9 or 5
    });
    v60.BottomRightFill = l_Roact_0.createElement("Frame", {
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundColor3 = l_props_0.fillFraction >= 0.5 and v52 or v9, 
        BorderSizePixel = 0, 
        ZIndex = l_props_0.fillFraction >= 0.5 and 9 or 3
    });
    v60.TopRightFill = l_Roact_0.createElement("Frame", {
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        BackgroundColor3 = l_props_0.fillFraction >= 0.25 and v52 or v9, 
        BorderSizePixel = 0, 
        ZIndex = l_props_0.fillFraction >= 0.25 and 9 or 1
    });
    v56.PositionOffsetFrame = l_createElement_1(v58, v59, v60);
    return l_createElement_0(v54, v55, v56);
end;
v12.didUpdate = function(v65, v66, _) --[[ Line: 285 ]] --[[ Name: didUpdate ]]
    -- upvalues: v31 (copy), v39 (copy), v45 (copy)
    local v68 = v66.fillFraction >= v66.largerCircleFraction;
    local v69 = v65.props.fillFraction >= v65.props.largerCircleFraction;
    if v68 ~= v69 then
        v65:playAnimation(v31, not v69);
    end;
    local v70 = v66.fillFraction >= v66.popCircleFraction;
    if v65.props.fillFraction >= v65.props.popCircleFraction and not v70 then
        v65:playAnimation(v39, false);
    end;
    local v71 = v66.fillFraction >= v66.shakeCircleFraction;
    if v65.props.fillFraction >= v65.props.shakeCircleFraction and not v71 then
        v65:playAnimation(v45, false);
    end;
end;
v12.playAnimation = function(v72, v73, v74) --[[ Line: 305 ]] --[[ Name: playAnimation ]]
    -- upvalues: l_RunService_0 (copy)
    if v72.animationFunction then
        v72.animationFunction(100, v72.updateBindings, v72.reverseAnimation, function() --[[ Line: 308 ]]

        end);
    end;
    v72.animationStartTime = tick();
    v72.animationFunction = v73;
    v72.reverseAnimation = v74;
    if not v72.renderSteppedConnection then
        v72.renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 314 ]]
            -- upvalues: v72 (copy)
            v72.animationFunction(tick() - v72.animationStartTime, v72.updateBindings, v72.reverseAnimation, function() --[[ Line: 319 ]]
                -- upvalues: v72 (ref)
                v72:stopAnimation();
            end);
        end);
    end;
end;
v12.stopAnimation = function(v75) --[[ Line: 327 ]] --[[ Name: stopAnimation ]]
    if v75.renderSteppedConnection then
        v75.renderSteppedConnection:Disconnect();
        v75.renderSteppedConnection = nil;
    end;
end;
v12.willUnmount = function(v76) --[[ Line: 334 ]] --[[ Name: willUnmount ]]
    v76:stopAnimation();
end;
return v12;