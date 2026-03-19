local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_Enums_0 = v3.Enums;
local l_IconSize_0 = l_Enums_0.IconSize;
local _ = require(l_script_FirstAncestor_0.Types);
return function(v8) --[[ Line: 26 ]] --[[ Name: ResellableInstancesLabel ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v3 (copy), l_Enums_0 (copy), l_IconSize_0 (copy)
    local v9 = l_useTokens_0();
    return v2.createElement(v3.View, {
        LayoutOrder = v8.LayoutOrder, 
        tag = "auto-xy size-full-0"
    }, {
        UIPadding = if v8.padding then v2.createElement("UIPadding", {
            PaddingLeft = v8.padding.left, 
            PaddingRight = v8.padding.right, 
            PaddingTop = v8.padding.top, 
            PaddingBottom = v8.padding.bottom
        }) else nil, 
        Inner = v2.createElement(v3.View, {
            tag = "auto-y padding-medium size-full-0 row align-x-left align-y-center gap-small radius-medium", 
            backgroundStyle = v9.Color.Surface.Surface_300
        }, {
            Icon = v2.createElement(v3.Icon, {
                name = l_Enums_0.IconName.ShoppingBasketCheck, 
                variant = l_Enums_0.IconVariant.Filled, 
                size = l_IconSize_0.Medium, 
                LayoutOrder = 1
            }), 
            Text = v2.createElement(v3.Text, {
                LayoutOrder = 2, 
                tag = "auto-xy text-body-medium content-emphasis text-truncate-end", 
                Text = v8.ownedItemsLabel
            })
        })
    });
end;