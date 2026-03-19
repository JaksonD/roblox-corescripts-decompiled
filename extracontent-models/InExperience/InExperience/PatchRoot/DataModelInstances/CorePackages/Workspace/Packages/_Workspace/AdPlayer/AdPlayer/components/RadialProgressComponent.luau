local l_script_FirstAncestor_0 = script:FindFirstAncestor("AdPlayer");
if not require(l_script_FirstAncestor_0.Flags).GetEnableLuaRewardTimerUI() then
    return nil;
else
    local l_Parent_0 = l_script_FirstAncestor_0.Parent;
    local v2 = require(l_Parent_0.React);
    local function v4(v3) --[[ Line: 33 ]] --[[ Name: transparencyGradient ]]
        return NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0), 
            NumberSequenceKeypoint.new(v3 - 0.001, 0), 
            NumberSequenceKeypoint.new(v3 + 0.001, 1), 
            NumberSequenceKeypoint.new(1, 1)
        });
    end;
    local function v6(v5) --[[ Line: 42 ]] --[[ Name: rightRotation ]]
        return (math.clamp(v5 * 360, 0, 180));
    end;
    local function _(v7) --[[ Line: 46 ]] --[[ Name: leftRotation ]]
        return (math.clamp(v7 * 360 - 180, 0, 180));
    end;
    return function(v9) --[[ Line: 50 ]]
        -- upvalues: v2 (copy), v6 (copy), v4 (copy)
        local v10 = v9.thickness or 3;
        local v11 = if v9.children then table.clone(v9.children) else {};
        v11.rightClipper = v2.createElement("Frame", {
            Size = UDim2.fromScale(0.5, 1), 
            ClipsDescendants = true, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.fromScale(1, 0.5), 
            BackgroundTransparency = 1, 
            ZIndex = 0
        }, {
            arc = v2.createElement("Frame", {
                Size = UDim2.new(1, -v10 * 2, 1, -v10 * 2), 
                BackgroundTransparency = 1, 
                SizeConstraint = Enum.SizeConstraint.RelativeYY, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0, 0.5)
            }, {
                corner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                }), 
                stroke = v2.createElement("UIStroke", {
                    Color = v9.ImageColor3, 
                    Transparency = v9.ImageTransparency, 
                    Thickness = v10, 
                    Enabled = v9.alpha:map(function(v12) --[[ Line: 76 ]]
                        return math.clamp(v12 * 360, 0, 180) > 0;
                    end)
                }, {
                    gradient = v2.createElement("UIGradient", {
                        Rotation = v9.alpha:map(v6), 
                        Transparency = v4(0.5)
                    })
                })
            })
        });
        v11.leftClipper = v2.createElement("Frame", {
            Size = UDim2.fromScale(0.5, 1), 
            ClipsDescendants = true, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0, 0.5), 
            BackgroundTransparency = 1, 
            ZIndex = 0
        }, {
            arc = v2.createElement("Frame", {
                Size = UDim2.new(1, -v10 * 2, 1, -v10 * 2), 
                BackgroundTransparency = 1, 
                SizeConstraint = Enum.SizeConstraint.RelativeYY, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(1, 0.5)
            }, {
                corner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                }), 
                stroke = v2.createElement("UIStroke", {
                    Color = v9.ImageColor3, 
                    Transparency = v9.ImageTransparency, 
                    Thickness = v10, 
                    Enabled = v9.alpha:map(function(v13) --[[ Line: 110 ]]
                        return math.clamp(v13 * 360 - 180, 0, 180) > 0;
                    end)
                }, {
                    gradient = v2.createElement("UIGradient", {
                        Rotation = v9.alpha:map(function(v14) --[[ Line: 115 ]]
                            return math.clamp(v14 * 360 - 180, 0, 180) - 180;
                        end), 
                        Transparency = v9.alpha:map(function(v15) --[[ Line: 118 ]]
                            -- upvalues: v4 (ref)
                            return v4(math.clamp(math.clamp(v15 * 360 - 180, 0, 180) / 180, 0, 1) * 0.02 + 0.5);
                        end)
                    })
                })
            })
        });
        return v2.createElement("Frame", {
            Position = v9.Position, 
            AnchorPoint = v9.AnchorPoint, 
            Size = v9.Size, 
            SizeConstraint = v9.SizeConstraint, 
            BackgroundTransparency = v9.BackgroundTransparency, 
            BackgroundColor3 = v9.BackgroundColor3, 
            Rotation = v9.Rotation, 
            ZIndex = v9.ZIndex, 
            LayoutOrder = v9.LayoutOrder, 
            Visible = v9.Visible
        }, v11);
    end;
end;