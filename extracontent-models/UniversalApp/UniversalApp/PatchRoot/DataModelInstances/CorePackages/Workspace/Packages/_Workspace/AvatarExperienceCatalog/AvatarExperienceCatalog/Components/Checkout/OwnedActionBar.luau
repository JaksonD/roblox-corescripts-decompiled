local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v10 = v1.forwardRef(function(v4, v5) --[[ Line: 15 ]]
    -- upvalues: v2 (copy), l_useLocalization_0 (copy), v1 (copy)
    local v6 = v2.Hooks.useTokens();
    local v7 = UDim2.fromScale(1, 0);
    local v8 = UDim2.fromScale(0, 1);
    local v9 = l_useLocalization_0({
        manageInCustomize = "Feature.Catalog.Action.Checkout.ManageInCustomize"
    });
    return v1.createElement(v2.View, {
        tag = "row items-center auto-y size-full-0 padding-y-large padding-x-xlarge bg-surface-0 anchor-bottom-left", 
        ref = v5, 
        backgroundStyle = {
            Color3 = v6.Color.Surface.Surface_0.Color3, 
            Transparency = v6.Color.Surface.Surface_0.Transparency
        }, 
        Size = v7, 
        Position = v8, 
        ZIndex = 3
    }, {
        ActionButton = v1.createElement(v2.Button, {
            text = v9.manageInCustomize, 
            onActivated = v4.onActivated, 
            variant = v2.Enums.ButtonVariant.Standard, 
            size = v2.Enums.ButtonSize.Medium, 
            fillBehavior = v2.Enums.FillBehavior.Fill
        })
    });
end);
return v1.memo(v10);