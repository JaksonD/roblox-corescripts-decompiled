local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.Components.ItemsView.ItemsViewHeader);
local v5 = require(l_script_FirstAncestor_0.Components.ItemsView.AvatarItemsView);
local v6 = require(l_script_FirstAncestor_0.Components.ItemsView.BuyActionBarLayout);
local _ = require(l_script_FirstAncestor_0.Components.Common.SubheaderLabelPrice);
local _ = require(l_script_FirstAncestor_0.Components.Common.BuyActionBar);
local _ = require(l_script_FirstAncestor_0.Types);
local v10 = require(l_script_FirstAncestor_0.Enums.ViewType);
local l_useTokens_0 = v3.Hooks.useTokens;
local function v14(v12, v13) --[[ Line: 64 ]]
    -- upvalues: v10 (copy)
    if v12 == v10.Compact then
        return {
            left = UDim.new(0, v13.Padding.Medium), 
            right = UDim.new(0, v13.Padding.Medium)
        };
    elseif v12 == v10.Wide then
        return {
            top = UDim.new(0, v13.Padding.XLarge), 
            left = UDim.new(0, v13.Margin.Large * 2), 
            right = UDim.new(0, v13.Margin.Large * 2), 
            bottom = UDim.new(0, v13.Padding.XLarge)
        };
    elseif v12 == v10.WideLandscape then
        return {
            left = UDim.new(0, v13.Padding.Small), 
            right = UDim.new(0, v13.Padding.Medium), 
            top = UDim.new(0, v13.Padding.XSmall)
        };
    else
        return nil;
    end;
end;
return (v2.forwardRef(function(v15, v16) --[[ Line: 89 ]]
    -- upvalues: l_useTokens_0 (copy), v10 (copy), v2 (copy), v4 (copy), v14 (copy), v5 (copy), v6 (copy)
    local l_view_0 = v15.view;
    local v18 = l_useTokens_0();
    local l_items_0 = v15.items;
    local l_onInspectMenuClosed_0 = v15.onInspectMenuClosed;
    local v21 = v15.view == v10.Compact;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Header = v2.createElement(v4, {
            view = l_view_0, 
            headerHeight = v18.Size.Size_1300, 
            padding = v14(l_view_0, v18), 
            headerText = v15.headerText, 
            subheaderText = v15.subheaderText, 
            onBackButtonClick = function() --[[ Line: 107 ]] --[[ Name: onBackButtonClick ]]
                -- upvalues: l_onInspectMenuClosed_0 (copy)
                l_onInspectMenuClosed_0();
            end, 
            purchaseButtonProps = v15.buyActionBarProps.purchaseButtonProps
        }), 
        List = v2.createElement(v5, {
            items = l_items_0, 
            view = l_view_0, 
            headerHeightOffset = v18.Size.Size_1300, 
            actionBarHeightOffset = v18.Size.Size_2700, 
            onItemCardActivated = v15.onItemCardActivated, 
            ref = v16
        }), 
        BuyActionBarLayout = if v21 then v2.createElement(v6, {
            buyActionBarProps = v15.buyActionBarProps, 
            enableTopBorder = true, 
            ZIndex = 2, 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            padding = UDim.new(0, v18.Padding.Medium), 
            Size = UDim2.new(1, 0, 0, v18.Size.Size_2700)
        }) else nil
    });
end));