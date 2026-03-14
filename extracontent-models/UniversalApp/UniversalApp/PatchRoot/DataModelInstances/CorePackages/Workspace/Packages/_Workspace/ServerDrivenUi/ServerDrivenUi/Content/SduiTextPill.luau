local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local l_Colors_0 = require(l_Parent_0.Style).Colors;
local l_useTokens_0 = v1.Hooks.useTokens;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v2.memo(function(v6) --[[ Line: 33 ]] --[[ Name: SduiTextPill ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_useTokens_0 (copy), v2 (copy), l_Colors_0 (copy)
    if not v6.text or v6.text == "" then
        return nil;
    else
        local v7 = nil;
        local v8 = nil;
        local v9 = nil;
        local v10 = nil;
        local v11 = nil;
        local v12 = nil;
        local v13 = nil;
        if l_FFlagSduiServerCompat_0 then
            v7 = v6.layoutOrder;
            v8 = v6.anchorPoint;
            v9 = v6.position;
            v10 = v6.zIndex;
            v11 = v6.backgroundColor3;
            v12 = v6.backgroundTransparency;
            v13 = v6.textColor3;
        else
            v7 = v6.LayoutOrder;
            v8 = v6.AnchorPoint;
            v9 = v6.Position;
            v10 = v6.ZIndex;
            v11 = v6.BackgroundColor3;
            v12 = v6.BackgroundTransparency;
            v13 = v6.TextColor3;
        end;
        local v14 = l_useTokens_0();
        local l_Small_0 = v14.Padding.Small;
        local l_XSmall_0 = v14.Padding.XSmall;
        local v17 = v6.fontStyle or v14.Typography.LabelSmall;
        local v18 = v17.FontSize * v17.LineHeight;
        return v2.createElement("Frame", {
            [v2.Tag] = "data-testid=--sdui-text-pill", 
            BackgroundColor3 = v11 or l_Colors_0.White, 
            BackgroundTransparency = v12 or 0, 
            Position = v9, 
            AnchorPoint = v8, 
            LayoutOrder = v7, 
            ZIndex = v10, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            Corner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            UIPadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_XSmall_0), 
                PaddingLeft = UDim.new(0, l_Small_0), 
                PaddingBottom = UDim.new(0, l_XSmall_0), 
                PaddingRight = UDim.new(0, l_Small_0)
            }), 
            TextLabel = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 0, 0, v18), 
                AutomaticSize = Enum.AutomaticSize.X, 
                Text = v6.text, 
                TextColor3 = v13 or v14.LightMode.Content.Emphasis.Color3, 
                Font = v17.Font, 
                TextSize = v17.FontSize, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextWrapped = false, 
                TextTruncate = Enum.TextTruncate.AtEnd
            })
        });
    end;
end);