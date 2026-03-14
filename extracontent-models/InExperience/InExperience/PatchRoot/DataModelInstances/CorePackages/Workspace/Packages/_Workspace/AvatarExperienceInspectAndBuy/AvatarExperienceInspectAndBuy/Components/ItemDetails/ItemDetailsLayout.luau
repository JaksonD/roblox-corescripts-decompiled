local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.Components.ItemDetails.ItemDetailsView);
local v5 = require(l_script_FirstAncestor_0.Components.ItemsView.BuyActionBarLayout);
local _ = require(l_script_FirstAncestor_0.Components.Common.BuyActionBar);
local l_useTokens_0 = v3.Hooks.useTokens;
local v8 = require(l_script_FirstAncestor_0.Enums.ViewType);
local v9 = require(l_Parent_0.Cryo);
return function(v10) --[[ Line: 21 ]] --[[ Name: ItemDetailsLayout ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v9 (copy), v8 (copy), v3 (copy), v4 (copy), v5 (copy)
    local v11 = l_useTokens_0();
    local l_Size_2700_0 = v11.Size.Size_2700;
    local v13 = v2.useMemo(function() --[[ Line: 27 ]]
        -- upvalues: v9 (ref), v10 (copy), l_Size_2700_0 (copy)
        return v9.Dictionary.join(v10.itemDetailsViewProps, {
            buyActionBarOffset = l_Size_2700_0
        });
    end, {
        v10.itemDetailsViewProps, 
        l_Size_2700_0
    });
    local v14 = v10.view == v8.Compact;
    return v2.createElement(v3.View, {
        tag = "size-full"
    }, {
        ItemDetailsView = v2.createElement(v4, v13), 
        BuyActionBarLayout = if v14 then v2.createElement(v5, {
            buyActionBarProps = v10.buyActionBarProps, 
            enableTopBorder = true, 
            ZIndex = 2, 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            padding = UDim.new(0, v11.Padding.Medium), 
            Size = UDim2.new(1, 0, 0, l_Size_2700_0)
        }) else nil
    });
end;