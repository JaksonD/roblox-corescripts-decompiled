local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryHeroUnit");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.ArgCheck);
local v5 = require(l_script_FirstAncestor_0.ParallaxUtils);
local l_useNormalizedVerticalProgress_0 = v5.useNormalizedVerticalProgress;
local l_getYPositionOffsetForMotion_0 = v5.getYPositionOffsetForMotion;
local l_getNormalizedCenterPosition_0 = v5.getNormalizedCenterPosition;
local _ = require(l_script_FirstAncestor_0.HeroUnitTypes);
local function _(v10, v11) --[[ Line: 69 ]] --[[ Name: calculateModifiedNormalizedPosition ]]
    if v11 == nil or v11 <= 0 or v11 >= 1 then
        return v10;
    else
        return (math.clamp(v10 / v11, 0, 1));
    end;
end;
return v2.memo(function(v13) --[[ Line: 78 ]] --[[ Name: HeroImages ]]
    -- upvalues: v2 (copy), l_getNormalizedCenterPosition_0 (copy), l_useNormalizedVerticalProgress_0 (copy), v4 (copy), l_getYPositionOffsetForMotion_0 (copy)
    local v14 = v2.useRef(nil);
    local v15 = v2.useRef(nil);
    local v16, v17 = v2.useBinding(Vector2.new(0, 0));
    v2.useEffect(function() --[[ Line: 84 ]]
        -- upvalues: v14 (copy), v17 (copy)
        if v14 and v14.current then
            v17(v14.current.AbsoluteSize);
        end;
    end, {});
    local v19 = v2.useCallback(function(v18) --[[ Line: 90 ]]
        -- upvalues: v15 (copy), l_getNormalizedCenterPosition_0 (ref), v13 (copy), v17 (copy)
        if v18 then
            v15.current = l_getNormalizedCenterPosition_0(v13.verticalScrollingFrameRef.current, v18);
            v17(v18.AbsoluteSize);
        end;
    end, {
        v13.verticalScrollingFrameRef
    });
    local v20 = l_useNormalizedVerticalProgress_0(v13.verticalScrollingFrameRef, v14);
    local v21, v22 = v2.useBinding(Vector2.new(0, 0));
    local v30 = v2.useCallback(function(v23, v24, v25, v26, v27) --[[ Line: 102 ]]
        -- upvalues: v4 (ref)
        v4.assert(v26 > 0);
        v4.assert(v27 > 0);
        local v28 = v23 - v24 + v25 * 2;
        local v29 = v26 / v27 * v28;
        return Vector2.new(v29, v28);
    end, {});
    local v31 = v13.foregroundOverflow * 2;
    local v32 = v13.backgroundOverflow * 2;
    local v33 = -v13.foregroundOverflow * (if v13.gradientHeightPercent and v13.gradientHeightPercent > 0 then v13.gradientHeightPercent else 1) + (v13.gradientHeightPercent >= 0.9 and 1 or 0);
    return v2.createElement("Frame", {
        [v2.Change.AbsoluteSize] = v19, 
        ref = v14, 
        BackgroundTransparency = 1, 
        Size = v13.Size, 
        ZIndex = v13.ZIndex, 
        Position = v13.Position, 
        AnchorPoint = v13.AnchorPoint, 
        LayoutOrder = v13.LayoutOrder, 
        ClipsDescendants = true
    }, {
        BackgroundImage = v2.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 1), 
            Size = UDim2.new(1, 0, 1, -v13.foregroundOverflow), 
            Position = UDim2.new(0.5, 0, 1, 0), 
            BackgroundTransparency = 0, 
            BackgroundColor3 = v13.tokens.Color.Surface.Surface_100.Color3, 
            ZIndex = 0, 
            Image = v13.backgroundImage, 
            ScaleType = Enum.ScaleType.Crop, 
            [v2.Tag] = "data-testid=--hero-unit-background-image", 
            ImageRectOffset = if v13.enableBackgroundAnimation then v2.joinBindings({
                normalizedPosition = v20, 
                imageSize = v21, 
                frameSize = v16
            }):map(function(v34) --[[ Line: 161 ]]
                -- upvalues: v15 (copy), l_getNormalizedCenterPosition_0 (ref), v13 (copy), v14 (copy), l_getYPositionOffsetForMotion_0 (ref), v32 (copy), v30 (copy)
                if v15.current == nil then
                    v15.current = l_getNormalizedCenterPosition_0(v13.verticalScrollingFrameRef.current, v14.current);
                end;
                local l_normalizedPosition_0 = v34.normalizedPosition;
                local l_current_0 = v15.current;
                local v37 = if not (l_current_0 ~= nil and l_current_0 > 0) or l_current_0 >= 1 then l_normalizedPosition_0 else math.clamp(l_normalizedPosition_0 / l_current_0, 0, 1);
                l_normalizedPosition_0 = l_getYPositionOffsetForMotion_0(v37, v32, 0);
                l_current_0 = v34.imageSize;
                if l_current_0.X > 0 and l_current_0.Y > 0 and v14 and v14.current then
                    local l_frameSize_0 = v34.frameSize;
                    local v39 = v30(l_frameSize_0.Y, v13.foregroundOverflow, v13.backgroundOverflow, l_current_0.X, l_current_0.Y);
                    return Vector2.new((1 - l_frameSize_0.X / v39.X) * l_current_0.X * 0.5, (v32 - l_normalizedPosition_0) * (l_current_0.Y / v39.Y));
                else
                    return Vector2.new(0, 0);
                end;
            end) else nil, 
            ImageRectSize = if v13.enableBackgroundAnimation then v2.joinBindings({
                imageSize = v21, 
                frameSize = v16
            }):map(function(v40) --[[ Line: 199 ]]
                -- upvalues: v14 (copy), v30 (copy), v13 (copy)
                local l_imageSize_0 = v40.imageSize;
                if l_imageSize_0.X > 0 and l_imageSize_0.Y > 0 and v14 and v14.current then
                    local l_frameSize_1 = v40.frameSize;
                    local v43 = v30(l_frameSize_1.Y, v13.foregroundOverflow, v13.backgroundOverflow, l_imageSize_0.X, l_imageSize_0.Y);
                    local v44 = l_frameSize_1.X / v43.X * l_imageSize_0.X;
                    local v45 = l_imageSize_0.Y - v13.backgroundOverflow * 2 / v43.Y * l_imageSize_0.Y;
                    return Vector2.new(v44, v45);
                else
                    return Vector2.new(0, 0);
                end;
            end) else nil, 
            [v2.Change.ContentImageSize] = function(v46) --[[ Line: 228 ]]
                -- upvalues: v22 (copy)
                if v46 then
                    v22(v46.ContentImageSize);
                end;
            end
        }, {
            CornerRadius = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, v13.cornerRadius)
            })
        }), 
        ForegroundImage = v2.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = v13.foregroundHeightPercent:map(function(v47) --[[ Line: 242 ]]
                -- upvalues: v13 (copy)
                return UDim2.new(1, 0, v47, -v13.foregroundOverflow * v47);
            end), 
            SizeConstraint = Enum.SizeConstraint.RelativeYY, 
            Position = if v13.enableForegroundAnimation then v20:map(function(v48) --[[ Line: 247 ]]
                -- upvalues: v15 (copy), l_getNormalizedCenterPosition_0 (ref), v13 (copy), v14 (copy), l_getYPositionOffsetForMotion_0 (ref), v31 (copy)
                if v15.current == nil then
                    v15.current = l_getNormalizedCenterPosition_0(v13.verticalScrollingFrameRef.current, v14.current);
                end;
                local l_current_1 = v15.current;
                local v50 = if not (l_current_1 ~= nil and l_current_1 > 0) or l_current_1 >= 1 then v48 else math.clamp(v48 / l_current_1, 0, 1);
                l_current_1 = l_getYPositionOffsetForMotion_0(v50, 0, v31);
                return UDim2.new(0.5, 0, 0, l_current_1);
            end) else UDim2.new(0.5, 0, 0, 0), 
            Image = v13.foregroundImage, 
            ZIndex = 1, 
            BackgroundTransparency = 1, 
            [v2.Tag] = "data-testid=--hero-unit-foreground-image"
        }, {
            UIAspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {
                AspectRatio = v13.foregroundAspectRatio, 
                AspectType = Enum.AspectType.ScaleWithParentSize, 
                DominantAxis = Enum.DominantAxis.Height
            })
        }), 
        HeroGradientFrame = v13.gradient and v2.createElement("Frame", {
            ZIndex = 2, 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, 1), 
            Size = UDim2.new(v13.gradientWidthPercent, 0, v13.gradientHeightPercent, v33), 
            BackgroundColor3 = Color3.new(1, 1, 1), 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0
        }, {
            HeroGradient = v2.createElement("UIGradient", {
                Rotation = v13.gradient.degree, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, v13.gradient.startOpacity), 
                    NumberSequenceKeypoint.new(1, v13.gradient.endOpacity)
                }), 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v13.gradient.startColor), 
                    ColorSequenceKeypoint.new(1, v13.gradient.endColor)
                })
            }), 
            CornerRadius = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, v13.cornerRadius)
            })
        }) or nil
    });
end);