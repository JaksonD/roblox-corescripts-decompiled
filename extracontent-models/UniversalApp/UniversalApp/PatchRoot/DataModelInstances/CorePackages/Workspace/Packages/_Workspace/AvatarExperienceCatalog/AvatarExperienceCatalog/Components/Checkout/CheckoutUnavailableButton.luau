local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.tutils);
local v3 = require(l_Parent_0.Foundation);
return v1.memo(function(v4) --[[ Line: 15 ]] --[[ Name: CheckoutUnavailableButton ]]
    -- upvalues: v1 (copy), v3 (copy)
    return v1.createElement(v3.View, {
        tag = "size-full-0 auto-y fill", 
        LayoutOrder = v4.LayoutOrder
    }, {
        UnavailableButton = v1.createElement(v3.Button, {
            text = v4.label, 
            onActivated = v4.onActivated, 
            variant = v3.Enums.ButtonVariant.Standard, 
            size = v3.Enums.ButtonSize.Medium, 
            fillBehavior = v3.Enums.FillBehavior.Fill
        })
    });
end, v2.deepEqual);