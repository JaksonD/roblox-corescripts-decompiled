local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
return function(v3) --[[ Line: 16 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v1 (copy)
    local v4 = l_useDesignTokens_0();
    local l_Size_450_0 = v4.Global.Size_450;
    local l_Space_200_0 = v4.Global.Space_200;
    local l_Font_0 = v4.Semantic.Typography.Subheader.Font;
    local l_FontSize_75_0 = v4.Global.FontSize_75;
    local l_Emphasis_0 = v4.Semantic.Color.Text.Emphasis;
    local l_OnHover_0 = v4.Semantic.Color.Background.OnHover;
    local v11, v12 = v1.useBinding(1e999);
    local function v14(v13) --[[ Line: 29 ]]
        -- upvalues: v12 (copy)
        v12(v13.AbsoluteSize.X);
    end;
    local function v17(v15) --[[ Line: 33 ]]
        -- upvalues: v1 (ref), l_Size_450_0 (copy), l_OnHover_0 (copy), l_Space_200_0 (copy), l_Font_0 (copy), l_FontSize_75_0 (copy), l_Emphasis_0 (copy), v11 (copy)
        return v1.createElement("TextButton", {
            Size = UDim2.fromOffset(0, l_Size_450_0), 
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundColor3 = l_OnHover_0.Color3, 
            BackgroundTransparency = l_OnHover_0.Transparency, 
            BorderSizePixel = 0, 
            Text = "", 
            Interactable = v15.onActivated and true or false, 
            [v1.Event.Activated] = v15.onActivated
        }, {
            Corner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            Padding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_Space_200_0), 
                PaddingRight = UDim.new(0, l_Space_200_0)
            }), 
            TextLabel = v1.createElement("TextLabel", {
                Size = UDim2.fromScale(0, 1), 
                AutomaticSize = Enum.AutomaticSize.X, 
                BackgroundTransparency = 1, 
                Text = v15.text, 
                Font = l_Font_0, 
                TextSize = l_FontSize_75_0, 
                TextColor3 = l_Emphasis_0.Color3, 
                TextTransparency = l_Emphasis_0.Transparency, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }, {
                UISizeConstraint = v1.createElement("UISizeConstraint", {
                    MaxSize = v11:map(function(v16) --[[ Line: 63 ]]
                        return Vector2.new(v16, 1e999);
                    end)
                })
            })
        });
    end;
    local l_Space_100_0 = v4.Global.Space_100;
    local v19 = {};
    for v20, v21 in v3.contents do
        v19["Pill" .. v20] = v17(v21);
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v3.LayoutOrder, 
        BackgroundTransparency = 1, 
        [v1.Change.AbsoluteSize] = v14
    }, {
        ListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, l_Space_100_0), 
            Wraps = true
        }), 
        Pills = v1.createElement(v1.Fragment, {}, v19)
    });
end;