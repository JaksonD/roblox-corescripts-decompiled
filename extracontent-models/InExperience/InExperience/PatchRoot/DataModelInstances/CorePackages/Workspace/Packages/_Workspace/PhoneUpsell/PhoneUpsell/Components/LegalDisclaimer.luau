local l_Parent_0 = script:FindFirstAncestor("PhoneUpsell").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_Checkbox_0 = v2.App.InputButton.Checkbox;
local l_LinkButton_0 = v2.App.Button.LinkButton;
local l_useStyle_0 = v2.Core.Style.useStyle;
return function(v6) --[[ Line: 28 ]]
    -- upvalues: l_useStyle_0 (copy), v1 (copy), l_Checkbox_0 (copy), l_LinkButton_0 (copy)
    local v7 = l_useStyle_0();
    local l_BaseSize_0 = v7.Font.BaseSize;
    local l_RelativeSize_0 = v7.Font.CaptionHeader.RelativeSize;
    local l_Space_75_0 = v7.Tokens.Global.Space_75;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        LayoutOrder = v6.LayoutOrder
    }, {
        ListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v7.Tokens.Global.Space_75)
        }), 
        LegalTextContainer = if v6.showLegalText and v6.showLegalTextCheckbox then v1.createElement("Frame", {
            LayoutOrder = 3, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, l_Space_75_0)
            }), 
            LegalCheckbox = v1.createElement(l_Checkbox_0, {
                onActivated = v6.setLegalTextChecked, 
                isSelected = v6.legalTextChecked, 
                text = ""
            }), 
            LegalText = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = v6.legalText, 
                TextSize = l_BaseSize_0 * l_RelativeSize_0, 
                TextColor3 = v7.Theme.TextDefault.Color, 
                TextTransparency = v7.Theme.TextDefault.Transparency, 
                Font = v7.Font.Body.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                Size = UDim2.new(1, -(26 + l_Space_75_0), 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            })
        }) else v6.showLegalText and v1.createElement("TextLabel", {
            LayoutOrder = 3, 
            BackgroundTransparency = 1, 
            Text = v6.legalText, 
            TextSize = l_BaseSize_0 * l_RelativeSize_0, 
            TextColor3 = v7.Theme.TextDefault.Color, 
            TextTransparency = v7.Theme.TextDefault.Transparency, 
            Font = v7.Font.Body.Font, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }), 
        LegalButtonsContainer = v6.showLegalButtons and v1.createElement("Frame", {
            LayoutOrder = 4, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 5)
            }), 
            TermsOfUseButton = v1.createElement(l_LinkButton_0, {
                text = v6.termsOfUse, 
                onActivated = v6.onTermsOfUseClick, 
                layoutOrder = 5, 
                fontStyle = "CaptionBody"
            }), 
            TextButtonDivider = v1.createElement("TextLabel", {
                LayoutOrder = 6, 
                BackgroundTransparency = 1, 
                Text = "-", 
                TextSize = l_BaseSize_0 * l_RelativeSize_0, 
                TextColor3 = v7.Theme.TextDefault.Color, 
                TextTransparency = v7.Theme.TextDefault.Transparency, 
                Font = v7.Font.Body.Font, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextWrapped = true, 
                AutomaticSize = Enum.AutomaticSize.XY
            }), 
            PrivacyPolicyButton = v1.createElement(l_LinkButton_0, {
                text = v6.privacyPolicy, 
                onActivated = v6.onPrivacyPolicyClick, 
                layoutOrder = 7, 
                fontStyle = "CaptionBody"
            })
        })
    });
end;