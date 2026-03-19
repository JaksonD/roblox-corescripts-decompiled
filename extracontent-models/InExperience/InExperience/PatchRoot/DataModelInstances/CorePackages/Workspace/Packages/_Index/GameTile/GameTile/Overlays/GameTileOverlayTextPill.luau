local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Style);
local l_Colors_0 = v2.Colors;
local l_LightTheme_0 = v2.Themes.LightTheme;
local l_GetTextSize_0 = v2.GetTextSize;
local l_useDesignTokens_0 = v2.useDesignTokens;
return function(v7) --[[ Line: 18 ]] --[[ Name: GameTileOverlayTextPill ]]
    -- upvalues: l_useDesignTokens_0 (copy), v1 (copy), l_GetTextSize_0 (copy), l_Colors_0 (copy), l_LightTheme_0 (copy)
    if not v7.text or string.len(v7.text) == 0 then
        return nil;
    else
        local v8 = l_useDesignTokens_0();
        local l_Space_100_0 = v8.Global.Space_100;
        local l_Space_75_0 = v8.Global.Space_75;
        local l_Font_0 = v8.Semantic.Typography.Title.Font;
        local l_FontSize_0 = v8.Semantic.Typography.CaptionHeader.FontSize;
        local v13 = v1.useMemo(function() --[[ Line: 31 ]]
            -- upvalues: l_GetTextSize_0 (ref), v7 (copy), l_FontSize_0 (copy), l_Font_0 (copy)
            return l_GetTextSize_0(v7.text, l_FontSize_0, l_Font_0, Vector2.new(1e999, 1e999));
        end, {
            v7.text, 
            l_FontSize_0, 
            l_Font_0
        });
        return v1.createElement("Frame", {
            BackgroundColor3 = l_Colors_0.White, 
            BackgroundTransparency = 0.1, 
            Position = v7.Position, 
            AnchorPoint = v7.AnchorPoint, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            Corner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            UIPadding = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_Space_75_0), 
                PaddingLeft = UDim.new(0, l_Space_100_0), 
                PaddingBottom = UDim.new(0, l_Space_75_0), 
                PaddingRight = UDim.new(0, l_Space_100_0)
            }), 
            TextLabel = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(v13.X, v13.Y), 
                Text = v7.text, 
                TextColor3 = l_LightTheme_0.TextEmphasis.Color3, 
                Font = l_Font_0, 
                TextSize = l_FontSize_0, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextWrapped = false, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }, {
                UISizeConstraint = v1.createElement("UISizeConstraint", {
                    MaxSize = v7.maxWidthBinding:map(function(v14) --[[ Line: 64 ]]
                        -- upvalues: l_Space_100_0 (copy), v13 (copy)
                        local v15 = v14 - l_Space_100_0 * 2;
                        if v15 > 0 then
                            return (Vector2.new(v15, v13.Y));
                        else
                            return nil;
                        end;
                    end)
                })
            })
        });
    end;
end;