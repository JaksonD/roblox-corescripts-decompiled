local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_ImpressionsTagUtility_0 = require(l_Parent_0.Impressions).ImpressionsTagUtility;
local v3 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
SearchPill = function(v5) --[[ Line: 28 ]] --[[ Name: SearchPill ]]
    -- upvalues: l_useDesignTokens_0 (copy), v3 (copy), l_TextService_0 (copy), l_ImpressionsTagUtility_0 (copy)
    local v6 = l_useDesignTokens_0();
    local v7 = v5.font or v6.Semantic.Typography.Body.Font;
    local v8 = v5.textColor or v6.Semantic.Color.Text.Emphasis.Color3;
    local l_textSize_0 = v5.textSize;
    local v10 = v3.useMemo(function() --[[ Line: 35 ]]
        -- upvalues: l_TextService_0 (ref), v5 (copy), l_textSize_0 (copy), v7 (copy)
        return l_TextService_0:GetTextSize(v5.text, l_textSize_0, v7, Vector2.new(1e999, l_textSize_0));
    end, {
        v5.text, 
        l_textSize_0, 
        v7
    });
    local v11 = v3.useRef(nil);
    v3.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: v5 (copy), l_ImpressionsTagUtility_0 (ref), v11 (copy)
        local l_impressionsTag_0 = v5.impressionsTag;
        local l_index_0 = v5.index;
        if v5.impressionsTag and l_index_0 then
            l_ImpressionsTagUtility_0.AddTag(v11, l_impressionsTag_0, l_index_0);
        end;
        return function() --[[ Line: 47 ]]
            -- upvalues: v5 (ref), l_index_0 (copy), l_ImpressionsTagUtility_0 (ref), v11 (ref), l_impressionsTag_0 (copy)
            if v5.impressionsTag and l_index_0 then
                l_ImpressionsTagUtility_0.RemoveTag(v11, l_impressionsTag_0, l_index_0);
            end;
        end;
    end, {
        v5.impressionsTag, 
        v5.index
    });
    return v3.createElement("TextButton", {
        LayoutOrder = v5.layoutOrder or 1, 
        Size = UDim2.new(0, v10.X + v5.horizontalPadding * 2, 0, l_textSize_0 + v5.verticalPadding * 2), 
        BackgroundColor3 = v5.backgroundColor, 
        BackgroundTransparency = v5.backgroundTransparency, 
        BorderSizePixel = 0, 
        TextTransparency = 1, 
        Text = "", 
        Selectable = true, 
        [v3.Event.Activated] = v5.onActivated, 
        ref = v11
    }, {
        PillText = v3.createElement("TextLabel", {
            Size = UDim2.fromOffset(v10.X, v10.Y), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Font = v7, 
            Text = v5.text, 
            TextSize = l_textSize_0, 
            TextColor3 = v8
        }), 
        Corner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        })
    });
end;
return SearchPill;