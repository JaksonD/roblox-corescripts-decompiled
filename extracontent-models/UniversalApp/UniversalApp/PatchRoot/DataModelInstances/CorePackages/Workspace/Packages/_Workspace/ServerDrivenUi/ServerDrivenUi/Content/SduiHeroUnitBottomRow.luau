local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_FFlagLuaAppAlignHeroUnitBottomRowCtaButton_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAlignHeroUnitBottomRowCtaButton;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v1.memo(function(v5) --[[ Line: 32 ]] --[[ Name: SduiHeroUnitBottomRow ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_useTokens_0 (copy), v1 (copy), l_FFlagLuaAppAlignHeroUnitBottomRowCtaButton_0 (copy)
    local v6 = nil;
    local v7 = nil;
    local v8 = nil;
    if l_FFlagSduiServerCompat_0 then
        v6 = v5.layoutOrder;
        v7 = v5.zIndex;
        v8 = v5.position;
    else
        v6 = v5.LayoutOrder;
        v7 = v5.ZIndex;
        v8 = v5.Position;
    end;
    local v9 = l_useTokens_0();
    local l_BodySmall_0 = v9.Typography.BodySmall;
    local l_Color3_0 = v9.Color.Extended.Gray.Gray_400.Color3;
    local v12 = v1.useMemo(function() --[[ Line: 48 ]]
        -- upvalues: v5 (copy), v1 (ref), l_BodySmall_0 (copy), l_Color3_0 (copy)
        if v5.rightLabelContent then
            return v1.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AnchorPoint = Vector2.new(1, 1), 
                Position = UDim2.new(1, 0, 1, 0)
            }, {
                Content = v5.rightLabelContent
            });
        elseif v5.labelText and v5.labelText ~= "" then
            return v1.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.X, 
                Size = UDim2.new(0, 0, 0, l_BodySmall_0.FontSize * l_BodySmall_0.LineHeight), 
                BackgroundTransparency = 1, 
                Text = v5.labelText, 
                TextSize = l_BodySmall_0.FontSize, 
                Font = l_BodySmall_0.Font, 
                TextColor3 = l_Color3_0, 
                TextXAlignment = Enum.TextXAlignment.Right, 
                TextTruncate = Enum.TextTruncate.SplitWord, 
                AnchorPoint = Vector2.new(1, 1), 
                Position = UDim2.new(1, 0, 1, 0)
            });
        else
            return nil;
        end;
    end, {
        v5.rightLabelContent, 
        v5.labelText, 
        l_BodySmall_0, 
        l_Color3_0
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v9.Size.Size_1000), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v6, 
        ZIndex = v7, 
        Position = v8, 
        [v1.Tag] = if v5.testId then ("data-testid=%*"):format(v5.testId) else nil
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            ItemLineAlignment = if l_FFlagLuaAppAlignHeroUnitBottomRowCtaButton_0 then Enum.ItemLineAlignment.Automatic else Enum.ItemLineAlignment.Center
        }), 
        CTAButtonContainer = if l_FFlagLuaAppAlignHeroUnitBottomRowCtaButton_0 then v5.ctaButton else v1.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 1
        }, {
            ButtonContent = v5.ctaButton
        }), 
        LabelContainer = v1.createElement("Frame", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            UIFlexItem = v1.createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Fill
            }), 
            Label = v12
        })
    });
end);