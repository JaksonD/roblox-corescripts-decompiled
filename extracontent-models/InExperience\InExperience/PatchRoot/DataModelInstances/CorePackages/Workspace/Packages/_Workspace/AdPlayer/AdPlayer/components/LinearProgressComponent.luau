local l_Parent_0 = script:FindFirstAncestor("AdPlayer").Parent;
local v1 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
return function(v3) --[[ Line: 16 ]] --[[ Name: LinearProgressComponent ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy)
    local v4 = l_useTokens_0();
    return v1.createElement("Frame", {
        Position = v3.Position, 
        AnchorPoint = v3.AnchorPoint, 
        Size = v3.Size, 
        ZIndex = v3.ZIndex, 
        BackgroundColor3 = v4.Color.Extended.White.White_30.Color3, 
        BackgroundTransparency = v4.Color.Extended.White.White_30.Transparency, 
        BorderSizePixel = 0
    }, {
        progressFill = v1.createElement("Frame", {
            BorderSizePixel = 0, 
            Size = v3.alpha:map(function(v5) --[[ Line: 31 ]]
                return UDim2.fromScale(v5, 1);
            end), 
            BackgroundColor3 = v4.Color.Extended.White.White_100.Color3
        })
    });
end;