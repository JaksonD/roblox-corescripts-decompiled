local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Hooks.usePlaceholderLocalization);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local l_View_0 = v4.View;
local l_Text_0 = v4.Text;
local l_Icon_0 = v4.Icon;
local l_IconName_0 = v4.Enums.IconName;
local l_IconSize_0 = v4.Enums.IconSize;
return function(v10) --[[ Line: 17 ]] --[[ Name: RobloxSubscriptionFeatureList ]]
    -- upvalues: v2 (copy), l_IconName_0 (copy), v3 (copy), l_View_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_Text_0 (copy)
    local v11 = v2({
        feature1 = "Feature.RobloxSubscription.Label.BlackbirdDiscountFirst", 
        feature2 = "Feature.RobloxSubscription.Label.BlackbirdDiscountSecond", 
        feature3 = "Feature.RobloxSubscription.Label.BlackbirdTr", 
        feature4 = "Feature.RobloxSubscription.Label.BlackbirdFPS"
    });
    local v12 = {
        {
            icon = l_IconName_0.TagSparkle, 
            text = v11.feature1
        }, 
        {
            icon = l_IconName_0.CalendarStar, 
            text = v11.feature2
        }, 
        {
            icon = l_IconName_0.Robux, 
            text = v11.feature3
        }, 
        {
            icon = l_IconName_0.BuildingStore, 
            text = v11.feature4
        }
    };
    local v13 = {};
    for v14, v15 in ipairs(v12) do
        v13[tostring(v14)] = v3.createElement(l_View_0, {
            tag = "row auto-y size-full-0 align-y-center align-x-left gap-medium", 
            LayoutOrder = v14
        }, {
            CheckIcon = v3.createElement(l_Icon_0, {
                name = v15.icon, 
                size = l_IconSize_0.Small
            }), 
            FeatureText = v3.createElement(l_Text_0, {
                Text = v15.text, 
                tag = "size-full-0 auto-y text-body-medium content-default text-align-x-left"
            })
        });
    end;
    return v3.createElement(l_View_0, {
        tag = "col auto-y size-full-0 align-x-left gap-small padding-top-large", 
        LayoutOrder = v10.layoutOrder
    }, v13);
end;