local l_Parent_0 = script:FindFirstAncestor("CurrencyTransfers").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Button_0 = v2.Button;
local l_View_0 = v2.View;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_Enums_0 = v2.Enums;
return function(v7) --[[ Line: 25 ]] --[[ Name: TransferAmountOptionChips ]]
    -- upvalues: v1 (copy), l_Button_0 (copy), l_Enums_0 (copy), l_ButtonVariant_0 (copy), l_View_0 (copy)
    local v12 = v1.useMemo(function() --[[ Line: 26 ]]
        -- upvalues: v7 (copy), v1 (ref), l_Button_0 (ref), l_Enums_0 (ref), l_ButtonVariant_0 (ref)
        local v8 = {};
        for v9, v10 in ipairs(v7.chips) do
            local v11 = v7.selectedAmount == v10.amount;
            v8[v9] = v1.createElement(l_Button_0, {
                text = v10.text, 
                icon = l_Enums_0.IconName.Robux, 
                onActivated = function() --[[ Line: 34 ]] --[[ Name: onActivated ]]
                    -- upvalues: v7 (ref), v10 (copy)
                    v7.onChipSelected(v10.amount);
                end, 
                LayoutOrder = v9, 
                variant = if v11 then l_ButtonVariant_0.Subtle else l_ButtonVariant_0.Standard, 
                size = l_Enums_0.ChipSize.Medium
            });
        end;
        return v8;
    end, {
        v7.chips, 
        v7.selectedAmount, 
        v7.onChipSelected
    });
    return v1.createElement(l_View_0, {
        tag = "row gap-small auto-xy align-x-center align-y-center padding-y-large", 
        LayoutOrder = v7.layoutOrder or 1
    }, {
        ChipsContainer = v1.createElement(l_View_0, {
            tag = "row gap-small auto-xy align-x-center align-y-center"
        }, table.unpack(v12))
    });
end;