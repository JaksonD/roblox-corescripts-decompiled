local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local v5 = require(l_script_FirstAncestor_0.Components.Common.BackButton);
local _ = require(l_script_FirstAncestor_0.Components.Common.BuyActionBar);
local _ = require(l_script_FirstAncestor_0.Types);
return function(v8) --[[ Line: 39 ]] --[[ Name: ItemHeader ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v3 (copy), v5 (copy)
    local v9 = l_useTokens_0();
    return v2.createElement(v3.View, {
        tag = "auto-xy size-full-0", 
        LayoutOrder = v8.LayoutOrder
    }, {
        UIPadding = if v8.padding then v2.createElement("UIPadding", {
            PaddingLeft = v8.padding.left, 
            PaddingRight = v8.padding.right, 
            PaddingTop = v8.padding.top, 
            PaddingBottom = v8.padding.bottom
        }) else nil, 
        UIListLayout = if v8.purchaseButtonProps then v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
        }) else nil, 
        InnerFrame = v2.createElement(v3.View, {
            tag = "auto-xy col align-y-center", 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            BackButton = if v8.onBackButtonClick then v2.createElement(v5, {
                onBackButtonClick = v8.onBackButtonClick, 
                LayoutOrder = 1
            }) else nil, 
            HeaderAndSubheader = v2.createElement(v3.View, {
                tag = "auto-xy col", 
                LayoutOrder = 2
            }, {
                UIPadding = if v8.onBackButtonClick then v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v9.Padding.Large)
                }) else nil, 
                Header = if v8.header then v8.header else nil, 
                Subheader = if v8.subheader then v8.subheader else nil
            })
        }), 
        BuyButton = if v8.purchaseButtonProps then v2.createElement(v3.Button, {
            size = v3.Enums.InputSize.Medium, 
            width = UDim.new(0, v9.Size.Size_3000), 
            text = v8.purchaseButtonProps.purchaseButtonText, 
            variant = v8.purchaseButtonProps.variant, 
            isDisabled = v8.purchaseButtonProps.isDisabled, 
            onActivated = v8.purchaseButtonProps.onPurchase, 
            LayoutOrder = 2
        }) else nil
    });
end;