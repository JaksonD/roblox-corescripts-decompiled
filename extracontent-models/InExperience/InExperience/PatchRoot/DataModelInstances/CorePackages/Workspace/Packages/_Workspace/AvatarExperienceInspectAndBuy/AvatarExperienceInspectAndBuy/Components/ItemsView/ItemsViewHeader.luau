local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local v5 = require(l_script_FirstAncestor_0.Enums.ViewType);
local v6 = require(l_script_FirstAncestor_0.Components.Common.BackButton);
local _ = require(l_script_FirstAncestor_0.Components.Common.BuyActionBar);
local v8 = require(l_script_FirstAncestor_0.Components.Common.SubheaderLabelPrice);
local _ = require(l_script_FirstAncestor_0.Types);
return function(v10) --[[ Line: 50 ]] --[[ Name: ItemsViewHeader ]]
    -- upvalues: l_useTokens_0 (copy), v5 (copy), v2 (copy), v3 (copy), v6 (copy), v8 (copy)
    local v11 = l_useTokens_0();
    local v12 = v10.view == v5.WideLandscape;
    local v13 = v10.view == v5.Compact;
    return v2.createElement(v3.View, {
        Size = UDim2.new(1, 0, 0, v10.headerHeight)
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, if not not v12 or v13 then v11.Padding.Medium else v11.Margin.Large * 2), 
            HorizontalFlex = if not v12 then Enum.UIFlexAlignment.SpaceBetween else nil
        }), 
        UIPadding = if v10.padding then v2.createElement("UIPadding", {
            PaddingLeft = v10.padding.left, 
            PaddingRight = v10.padding.right, 
            PaddingTop = v10.padding.top, 
            PaddingBottom = v10.padding.bottom
        }) else nil, 
        BackButton = if v12 then v2.createElement(v6, {
            onBackButtonClick = v10.onBackButtonClick, 
            Position = UDim2.new(0, v11.Padding.Small, 0, v11.Padding.Small)
        }) else nil, 
        HeaderTextAndSubheader = v2.createElement(v3.View, {
            BackgroundTransparency = 1, 
            tag = "size-0-full auto-x col align-y-center", 
            LayoutOrder = 2
        }, {
            HeaderText = v2.createElement(v3.Text, {
                LayoutOrder = 1, 
                tag = "auto-xy text-heading-small content-emphasis text-truncate-end", 
                Text = v10.headerText
            }), 
            SubheaderText = if not v10.subheaderText or v12 or v13 then nil else v2.createElement(v8, {
                subheaderText = v10.subheaderText, 
                LayoutOrder = 2
            })
        }), 
        BuyButton = if not not v12 or v13 then nil else v2.createElement(v3.Button, {
            size = v3.Enums.InputSize.Medium, 
            width = if v13 then UDim.new(0, v11.Size.Size_2100) else UDim.new(0, v11.Size.Size_3000), 
            LayoutOrder = 3, 
            text = v10.purchaseButtonProps.purchaseButtonText, 
            variant = v3.Enums.ButtonVariant.Emphasis, 
            isDisabled = v10.purchaseButtonProps.isDisabled, 
            onActivated = v10.purchaseButtonProps.onPurchase
        })
    });
end;