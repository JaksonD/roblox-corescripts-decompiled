local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
return function(v4) --[[ Line: 15 ]] --[[ Name: CheckoutTotalLines ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), v2 (copy)
    local v5 = l_useLocalization_0({
        totalItemsLabel = {
            "Feature.Catalog.Label.TotalItemsParenthesis"; 
            itemCount = v4.itemCount
        }
    });
    return v1.createElement(v2.View, {
        tag = "size-full-0 auto-y col gap-small"
    }, {
        TotalLine = v1.createElement(v2.View, {
            tag = "size-full-0 auto-y fill flex-between items-center row gap-small"
        }, {
            ItemCount = v1.createElement(v2.Text, {
                tag = "auto-xy text-title-medium content-emphasis", 
                Text = v5.totalItemsLabel, 
                LayoutOrder = 1
            }), 
            TotalPrice = v1.createElement(v2.View, {
                tag = "auto-xy row items-center gap-small", 
                LayoutOrder = 2
            }, {
                RobuxIcon = v1.createElement(v2.Icon, {
                    name = v2.Enums.IconName.Robux, 
                    size = v2.Enums.IconSize.Small, 
                    LayoutOrder = 1
                }), 
                TotalPriceText = v1.createElement(v2.Text, {
                    tag = "auto-xy text-title-medium content-emphasis", 
                    Text = ("%*"):format(v4.totalPrice), 
                    LayoutOrder = 2
                })
            })
        })
    });
end;