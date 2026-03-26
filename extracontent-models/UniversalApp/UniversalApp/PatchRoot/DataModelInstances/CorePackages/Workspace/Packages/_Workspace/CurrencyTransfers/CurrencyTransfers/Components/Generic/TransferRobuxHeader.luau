local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_getIconRichText_0 = v3.Utility.getIconRichText;
local l_Enums_0 = v3.Enums;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v9 = require(l_script_FirstAncestor_0.Utils.formatNumber);
return function(v10) --[[ Line: 24 ]] --[[ Name: TransferRobuxHeader ]]
    -- upvalues: v2 (copy), v9 (copy), l_LocalizationService_0 (copy), l_getIconRichText_0 (copy), l_Enums_0 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v12 = v2.useMemo(function() --[[ Line: 25 ]]
        -- upvalues: v9 (ref), l_LocalizationService_0 (ref), v10 (copy), l_getIconRichText_0 (ref), l_Enums_0 (ref)
        local v11 = v9(l_LocalizationService_0.RobloxLocaleId, v10.robuxBalanceAmount or 0);
        return (("%* %*"):format(l_getIconRichText_0(l_Enums_0.IconName.Robux), v11));
    end, {
        v10.robuxBalanceAmount, 
        l_LocalizationService_0.RobloxLocaleId
    });
    return v2.createElement(l_View_0, {
        tag = "auto-xy align-y-center align-x-start row"
    }, {
        LeftSide = v2.createElement(l_View_0, {
            LayoutOrder = 1, 
            tag = "row gap-small align-y-center align-x-start", 
            Size = UDim2.new(0.5, 0, 1, 0)
        }, {
            Title = v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = ("%* %*"):format(l_getIconRichText_0(l_Enums_0.IconName.PaperAirplane), v10.titleText), 
                tag = "auto-xy text-heading-small content-default text-align-x-left", 
                RichText = true
            })
        }), 
        RightSide = v2.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "row align-y-center align-x-right gap-large", 
            Size = UDim2.new(0.5, 0, 1, 0)
        }, {
            RobuxPrice = v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = v12, 
                tag = "auto-xy text-label-large content-emphasis text-align-x-right", 
                RichText = true
            })
        })
    });
end;