local l_Parent_0 = script:FindFirstAncestor("AppShortcutBar").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.Motion);
local l_isBuilderIcon_0 = v2.Utility.isBuilderIcon;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_Icon_0 = v2.Icon;
local function v11(v7) --[[ Line: 35 ]] --[[ Name: useAnimationValues ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v8 = v1.useMemo(function() --[[ Line: 36 ]]
        -- upvalues: v3 (ref)
        return {
            initial = v3.createState({
                scale = 1, 
                ringScale = 1
            }, {
                default = v3.transition({
                    duration = 0.2
                })
            }), 
            target = v3.createState({
                scale = 0.8, 
                ringScale = 1.15
            }, {
                default = v3.transition({
                    duration = 0.3
                })
            })
        };
    end, {});
    local v9, v10 = v3.useMotion(v8.initial);
    v1.useEffect(function() --[[ Line: 55 ]]
        -- upvalues: v10 (copy), v7 (copy), v8 (copy)
        v10(if v7 then v8.target else v8.initial);
    end, {
        v7, 
        v10, 
        v8
    });
    return v9;
end;
local function v22(v12) --[[ Line: 62 ]] --[[ Name: CircularProgress ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy)
    local v13 = l_useTokens_0();
    local l_size_0 = v12.size;
    local l_progress_0 = v12.progress;
    local v16 = v1.useMemo(function() --[[ Line: 67 ]]
        -- upvalues: v13 (copy)
        return NumberSequence.new({
            NumberSequenceKeypoint.new(0, v13.Color.Content.Emphasis.Transparency), 
            NumberSequenceKeypoint.new(0.4999, v13.Color.Content.Emphasis.Transparency), 
            NumberSequenceKeypoint.new(0.5, 0.5), 
            NumberSequenceKeypoint.new(1, 0.5)
        });
    end, {
        v13
    });
    local v17 = v1.useMemo(function() --[[ Line: 76 ]]
        -- upvalues: v13 (copy)
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, v13.Color.Content.Emphasis.Color3), 
            ColorSequenceKeypoint.new(0.4999, v13.Color.Content.Emphasis.Color3), 
            ColorSequenceKeypoint.new(0.5, v13.Color.Content.Muted.Color3), 
            ColorSequenceKeypoint.new(1, v13.Color.Content.Muted.Color3)
        });
    end, {
        v13
    });
    local v19 = v1.useMemo(function() --[[ Line: 85 ]]
        -- upvalues: l_progress_0 (copy)
        if l_progress_0 then
            return (l_progress_0:map(function(v18) --[[ Line: 87 ]]
                return (math.clamp(v18 * 360, 180, 360));
            end));
        else
            return 180;
        end;
    end, {
        l_progress_0
    });
    local v21 = v1.useMemo(function() --[[ Line: 93 ]]
        -- upvalues: l_progress_0 (copy)
        if l_progress_0 then
            return (l_progress_0:map(function(v20) --[[ Line: 95 ]]
                return (math.clamp(v20 * 360, 0, 180));
            end));
        else
            return 0;
        end;
    end, {
        l_progress_0
    });
    return v1.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1
    }, {
        Left = v1.createElement("Frame", {
            Size = UDim2.fromScale(0.5, 1), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true
        }, {
            Image = v1.createElement("ImageLabel", {
                Image = "rbxasset://textures/ui/Controls/RadialFill@3x.png", 
                Size = UDim2.fromScale(2, 1), 
                BackgroundTransparency = 1
            }, {
                Gradient = v1.createElement("UIGradient", {
                    Transparency = v16, 
                    Color = v17, 
                    Rotation = v19
                })
            })
        }), 
        Right = v1.createElement("Frame", {
            Size = UDim2.fromScale(0.5, 1), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            Position = UDim2.fromScale(0.5, 0)
        }, {
            Image = v1.createElement("ImageLabel", {
                Image = "rbxasset://textures/ui/Controls/RadialFill@3x.png", 
                Size = UDim2.fromScale(2, 1), 
                Position = UDim2.fromScale(-1, 0), 
                BackgroundTransparency = 1
            }, {
                Gradient = v1.createElement("UIGradient", {
                    Transparency = v16, 
                    Color = v17, 
                    Rotation = v21
                })
            })
        })
    });
end;
IconWithHoldAnimation = function(v23) --[[ Line: 144 ]] --[[ Name: IconWithHoldAnimation ]]
    -- upvalues: v11 (copy), v1 (copy), l_useTokens_0 (copy), v22 (copy), l_isBuilderIcon_0 (copy), l_Icon_0 (copy)
    local l_layoutOrder_0 = v23.layoutOrder;
    local l_size_1 = v23.size;
    local l_position_0 = v23.position;
    local l_anchorPoint_0 = v23.anchorPoint;
    local l_progress_1 = v23.progress;
    local l_icon_0 = v23.icon;
    local l_iconSize_0 = v23.iconSize;
    local v31 = v11(l_progress_1);
    local v32, v33 = v1.useBinding(l_iconSize_0);
    v1.useEffect(function() --[[ Line: 156 ]]
        -- upvalues: v33 (copy), l_iconSize_0 (copy)
        v33(l_iconSize_0);
    end, {
        l_iconSize_0
    });
    local l_Default_0 = l_useTokens_0().Color.Content.Default;
    return v1.createElement("Frame", {
        LayoutOrder = l_layoutOrder_0, 
        Size = l_size_1, 
        Position = l_position_0, 
        AnchorPoint = l_anchorPoint_0, 
        BackgroundTransparency = 1
    }, {
        AnimationFrame = v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            BackgroundTransparency = 1
        }, {
            UIScale = v1.createElement("UIScale", {
                Scale = v31.scale
            }), 
            RingFrame = v1.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 1
            }, {
                RingScale = v1.createElement("UIScale", {
                    Scale = v31.ringScale
                }), 
                Progress = v1.createElement(v22, {
                    size = UDim2.fromScale(1, 1), 
                    progress = l_progress_1
                })
            }), 
            IconFrame = v1.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 1
            }, {
                Icon = if not l_isBuilderIcon_0(l_icon_0) then v1.createElement("ImageLabel", {
                    Image = l_icon_0, 
                    BackgroundTransparency = 1, 
                    ImageColor3 = l_Default_0.Color3, 
                    ImageTransparency = l_Default_0.Transparency, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.fromOffset(l_iconSize_0, l_iconSize_0)
                }) else v1.createElement(l_Icon_0, {
                    name = l_icon_0, 
                    size = v32, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5)
                })
            })
        })
    });
end;
return IconWithHoldAnimation;