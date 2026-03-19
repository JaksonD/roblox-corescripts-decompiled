local l_Parent_0 = script:FindFirstAncestor("VideoUtils").Parent;
local v1 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
return function(v3) --[[ Line: 17 ]] --[[ Name: VideoProgressBar ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy)
    local v4 = l_useTokens_0();
    local l_Muted_0 = v4.DarkMode.Content.Muted;
    local l_Emphasis_0 = v4.Color.Content.Emphasis;
    return v1.createElement("Frame", {
        AnchorPoint = v3.AnchorPoint, 
        Position = v3.Position, 
        Size = v3.Size, 
        BackgroundColor3 = l_Muted_0.Color3, 
        BackgroundTransparency = l_Muted_0.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v3.LayoutOrder
    }, {
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        }), 
        ProgressFill = v1.createElement("Frame", {
            Size = v3.progressBinding:map(function(v7) --[[ Line: 37 ]]
                return UDim2.fromScale(v7, 1);
            end), 
            BackgroundColor3 = l_Emphasis_0.Color3, 
            BackgroundTransparency = l_Emphasis_0.Transparency, 
            BorderSizePixel = 0
        }, {
            UICorner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        })
    });
end;