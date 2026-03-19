local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.tutils);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.ReactOtter);
local v5 = game:DefineFastInt("AXBuyDelayMilliseconds", 1000) / 1000;
return v1.memo(function(v6) --[[ Line: 20 ]] --[[ Name: CheckoutBuyButton ]]
    -- upvalues: v3 (copy), v1 (copy), v4 (copy), v5 (copy)
    local v7 = v3.Hooks.useTokens();
    local v8, v9 = v1.useState(false);
    local v10 = v1.useCallback(function() --[[ Line: 24 ]]
        -- upvalues: v9 (copy)
        v9(true);
    end, {
        v8
    });
    local v11, v12 = v4.useAnimatedBinding(1, v10);
    v1.useEffect(function() --[[ Line: 29 ]]
        -- upvalues: v8 (copy), v12 (copy), v4 (ref), v5 (ref)
        if not v8 then
            v12(v4.ease(0, {
                duration = v5, 
                easingStyle = Enum.EasingStyle.Linear
            }));
        end;
    end, {
        v8
    });
    return v1.createElement(v3.View, {
        tag = "size-full-0 auto-y fill"
    }, {
        BuyButton = v1.createElement(v3.Button, {
            text = v6.label, 
            onActivated = v6.onCheckoutButtonActivated, 
            variant = v3.Enums.ButtonVariant.Emphasis, 
            size = v3.Enums.ButtonSize.Medium, 
            fillBehavior = v3.Enums.FillBehavior.Fill, 
            isDisabled = not v8 or v6.isPurchasing, 
            isLoading = v6.isPurchasing, 
            testId = "CheckoutBuyButton_BuyButton"
        }), 
        CooldownBar = v1.createElement(v3.View, {
            isDisabled = true, 
            backgroundStyle = {
                Color3 = v7.Color.Surface.Surface_0.Color3, 
                Transparency = 0.5
            }, 
            Position = UDim2.fromScale(1, 0), 
            Size = v11:map(function(v13) --[[ Line: 58 ]]
                return UDim2.fromScale(-v13, 1);
            end)
        })
    });
end, v2.deepEqual);