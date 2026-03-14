local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Icon_0 = v3.Icon;
local l_Enums_0 = v3.Enums;
local v6 = require(l_script_FirstAncestor_0.Constants);
local v7 = require(l_script_FirstAncestor_0.Hooks.useArrowNavScrollBehavior);
return function(v8) --[[ Line: 39 ]] --[[ Name: ArrowNavV2 ]]
    -- upvalues: v7 (copy), v2 (copy), v6 (copy), v3 (copy), l_Icon_0 (copy), l_Enums_0 (copy)
    local v9 = v7({
        navDirection = v8.navDirection, 
        onPressHoldInputBegan = v8.onPressHoldInputBegan, 
        onPressHoldInputEnded = v8.onPressHoldInputEnded, 
        defaultUseProps = v8.defaultUseProps
    });
    local l_handleInputBegan_0 = v9.handleInputBegan;
    local l_handleInputEnded_0 = v9.handleInputEnded;
    local v12 = v2.useCallback(function() --[[ Line: 52 ]]

    end, {});
    local v13 = "chevron-small-right";
    if v8.navDirection == v6.NAVIGATION_DIRECTION.IS_LEFT then
        v13 = "chevron-small-left";
    end;
    local l_ActionStandard_0 = v8.tokens.Color.ActionStandard;
    local l_Color3_0 = v8.tokens.Color.Surface.Surface_0.Color3;
    local l_Transparency_0 = v8.tokens.Color.Surface.Surface_0.Transparency;
    local l_Size_900_0 = v8.tokens.Size.Size_900;
    local l_Medium_0 = v8.tokens.Padding.Medium;
    local l_Size_700_0 = v8.tokens.Size.Size_700;
    local l_Size_100_0 = v8.tokens.Size.Size_100;
    return v2.createElement("Frame", {
        AnchorPoint = v8.AnchorPoint, 
        Position = v8.Position, 
        Visible = v8.Visible, 
        Size = UDim2.fromOffset(l_Size_900_0, l_Size_900_0 + l_Medium_0), 
        BackgroundColor3 = l_Color3_0, 
        BackgroundTransparency = l_Transparency_0, 
        BorderSizePixel = 0
    }, {
        GradientFrame = v2.createElement("Frame", {
            AnchorPoint = if v8.navDirection == v6.NAVIGATION_DIRECTION.IS_LEFT then Vector2.new(0, 0.5) else Vector2.new(1, 0.5), 
            Position = if v8.navDirection == v6.NAVIGATION_DIRECTION.IS_LEFT then UDim2.new(1, 0, 0.5, 0) else UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.fromOffset(l_Size_700_0, l_Size_900_0 + l_Medium_0), 
            BackgroundColor3 = l_Color3_0, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0
        }, {
            UIGradient = v2.createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(0.9, 0), 
                    NumberSequenceKeypoint.new(1, 0)
                }), 
                Rotation = v8.navDirection == v6.NAVIGATION_DIRECTION.IS_LEFT and 180 or 0
            })
        }), 
        InnerFrame = v2.createElement(v3.View, {
            AnchorPoint = if v8.navDirection == v6.NAVIGATION_DIRECTION.IS_LEFT then Vector2.new(0, 0.5) else Vector2.new(1, 0.5), 
            Position = if v8.navDirection == v6.NAVIGATION_DIRECTION.IS_LEFT then UDim2.new(0, l_Size_100_0, 0.5, 0) else UDim2.new(1, 0, 0.5, 0), 
            Size = UDim2.fromOffset(l_Size_900_0, l_Size_900_0), 
            backgroundStyle = l_ActionStandard_0.Background, 
            cornerRadius = UDim.new(0.5, 0), 
            onActivated = v12
        }, {
            ArrowIcon = v2.createElement(l_Icon_0, {
                name = v13, 
                size = l_Enums_0.IconSize.Medium, 
                style = l_ActionStandard_0.Foreground, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5)
            }), 
            StopPropagationOverlay = v2.createElement("TextButton", {
                Active = false, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Selectable = false, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = "", 
                ZIndex = 0, 
                [v2.Event.InputBegan] = l_handleInputBegan_0, 
                [v2.Event.InputEnded] = l_handleInputEnded_0
            })
        })
    });
end;