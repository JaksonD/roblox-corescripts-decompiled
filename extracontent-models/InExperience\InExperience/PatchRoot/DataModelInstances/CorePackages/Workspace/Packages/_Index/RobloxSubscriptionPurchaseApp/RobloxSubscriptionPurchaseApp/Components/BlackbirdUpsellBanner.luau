local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Icon_0 = v3.Icon;
local l_IconSize_0 = v3.Enums.IconSize;
local l_IconName_0 = v3.Enums.IconName;
local l_useTokens_0 = v3.Hooks.useTokens;
local v10 = require(l_script_FirstAncestor_0.Hooks.usePlaceholderLocalization);
return function(v11) --[[ Line: 27 ]] --[[ Name: BlackbirdUpsellBanner ]]
    -- upvalues: l_useTokens_0 (copy), v10 (copy), v2 (copy), l_View_0 (copy), l_Icon_0 (copy), l_IconName_0 (copy), l_IconSize_0 (copy), l_Text_0 (copy)
    local v12 = l_useTokens_0();
    local v13 = v10({
        bannerText = {
            "Feature.RobloxSubscription.Label.BlackbirdUpsellBanner"; 
            discountPercentage = v11.productInfo.initialDiscountPercentage or 10
        }, 
        getFreeTrialText = "Feature.RobloxSubscription.Label.FreeTrialText", 
        subscribe = "Feature.RobloxSubscription.Action.Subscribe"
    });
    local v14 = v2.useCallback(function() --[[ Line: 39 ]]
        -- upvalues: v11 (copy), v13 (copy)
        if v11.productInfo.isFreeTrial then
            return v13.getFreeTrialText;
        else
            return v13.subscribe;
        end;
    end, {
        v11.productInfo.isFreeTrial
    });
    return v2.createElement(l_View_0, {
        tag = "size-full-0 auto-y padding-medium", 
        onActivated = v11.onActivated, 
        LayoutOrder = v11.LayoutOrder
    }, {
        ContentContainer = v2.createElement(l_View_0, {
            tag = "auto-y size-full-0 row align-y-center gap-medium"
        }, {
            BlackbirdIcon = v2.createElement(l_Icon_0, {
                style = v12.Color.Content.Emphasis, 
                name = l_IconName_0.PaperAirplane, 
                size = l_IconSize_0.Small, 
                LayoutOrder = 1
            }), 
            BannerText = v2.createElement(l_Text_0, {
                Size = UDim2.new(0.7, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                tag = "text-body-small text-align-x-left content-emphasis", 
                Text = v13.bannerText, 
                LayoutOrder = 2
            })
        }), 
        SubscribeText = v2.createElement(l_Text_0, {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            tag = "auto-xy text-body-small content-default", 
            Text = "<u>" .. v14() .. "</u>", 
            RichText = true
        }), 
        UIStroke = v2.createElement("UIStroke", {
            Color = v12.Color.Stroke.Default.Color3, 
            Transparency = v12.Color.Stroke.Default.Transparency, 
            Thickness = v12.Stroke.Standard
        }), 
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, v12.Radius.Medium)
        })
    });
end;