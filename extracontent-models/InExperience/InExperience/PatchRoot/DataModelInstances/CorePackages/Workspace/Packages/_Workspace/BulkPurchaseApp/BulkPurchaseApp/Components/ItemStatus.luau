local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_StyledTextLabel_0 = require(l_Parent_0.UIBlox).App.Text.StyledTextLabel;
local v6 = require(l_script_FirstAncestor_0.Enums.ItemStatusToItemStatusKey);
local v7 = require(l_script_FirstAncestor_0.Enums.ItemStatusKeyToLocalizationKey);
local function v9(v8) --[[ Line: 11 ]] --[[ Name: mapTokens ]]
    return {
        successColor = v8.Semantic.Color.Common.Success, 
        failureColor = v8.Semantic.Color.Common.Alert, 
        fontStyle = v8.Semantic.Typography.CaptionBody
    };
end;
return function(v10) --[[ Line: 23 ]] --[[ Name: ItemStatus ]]
    -- upvalues: l_useDesignTokens_0 (copy), v9 (copy), l_useLocalization_0 (copy), v7 (copy), v6 (copy), v2 (copy), l_StyledTextLabel_0 (copy)
    local v11 = l_useDesignTokens_0(v9);
    local v12 = l_useLocalization_0(v7);
    local v13 = if v10.status == Enum.MarketplaceItemPurchaseStatus.Success then v11.successColor else v11.failureColor;
    local v14 = v12[v6[v10.status]];
    return v2.createElement(l_StyledTextLabel_0, {
        fontStyle = v11.fontStyle, 
        colorStyle = v13, 
        text = v14, 
        textWrapped = true, 
        size = UDim2.fromScale(1, 1), 
        textXAlignment = Enum.TextXAlignment.Right, 
        textYAlignment = Enum.TextYAlignment.Top, 
        lineHeight = v11.fontStyle.LineHeight
    });
end;