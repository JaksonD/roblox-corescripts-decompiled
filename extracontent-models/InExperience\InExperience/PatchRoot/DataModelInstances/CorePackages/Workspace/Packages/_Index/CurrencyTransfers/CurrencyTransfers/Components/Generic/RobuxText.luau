local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Utils.formatNumber);
local v5 = require(l_Parent_0.Foundation);
local l_View_0 = v5.View;
local l_Text_0 = v5.Text;
local l_getIconRichText_0 = v5.Utility.getIconRichText;
return function(v9) --[[ Line: 20 ]] --[[ Name: RobuxText ]]
    -- upvalues: v3 (copy), v4 (copy), l_LocalizationService_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_getIconRichText_0 (copy)
    local v10 = v3.useMemo(function() --[[ Line: 21 ]]
        -- upvalues: v4 (ref), l_LocalizationService_0 (ref), v9 (copy)
        return v4(l_LocalizationService_0.RobloxLocaleId, v9.amount or 0);
    end, {
        v9.amount, 
        l_LocalizationService_0.RobloxLocaleId
    });
    return v3.createElement(l_View_0, {
        tag = "row align-x-center align-y-center auto-xy", 
        LayoutOrder = v9.layoutOrder
    }, {
        RobuxIcon = v3.createElement(l_Text_0, {
            Text = l_getIconRichText_0("robux"), 
            tag = "auto-xy text-heading-large content-emphasis text-align-x-center", 
            RichText = true, 
            LayoutOrder = 1
        }), 
        Spacer = v3.createElement(l_View_0, {
            tag = "auto-xy", 
            Size = UDim2.new(0, 4, 0, 0), 
            LayoutOrder = 2
        }), 
        RobuxAmount = v3.createElement(l_Text_0, {
            Text = v10, 
            tag = "auto-xy text-display-small content-emphasis text-align-x-center", 
            LayoutOrder = 3
        })
    });
end;