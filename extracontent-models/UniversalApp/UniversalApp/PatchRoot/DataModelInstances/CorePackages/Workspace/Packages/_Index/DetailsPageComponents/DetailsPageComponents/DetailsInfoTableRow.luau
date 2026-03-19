local l_Parent_0 = script:FindFirstAncestor("DetailsPageComponents").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_Cell_0 = v2.App.Table.Cell;
local l_CellHeadDetail_0 = v2.App.Table.CellHeadDetail;
local l_CellTailDescription_0 = v2.App.Table.CellTailDescription;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
return v1.memo(function(v8) --[[ Line: 24 ]]
    -- upvalues: l_useStyle_0 (copy), l_useTokens_0 (copy), v1 (copy), l_Cell_0 (copy), l_CellHeadDetail_0 (copy), l_CellTailDescription_0 (copy)
    local v9 = l_useStyle_0();
    local v10 = l_useTokens_0();
    return v1.createElement(l_Cell_0, {
        head = v1.createElement(l_CellHeadDetail_0, {
            labelText = v8.infoName, 
            labelTextColor = v9.Theme.TextDefault, 
            labelTextFont = v10.Typography.TitleLarge
        }), 
        horizontalPadding = v8.horizontalPadding, 
        size = UDim2.new(1, 0, 0, 56), 
        tail = v1.createElement(l_CellTailDescription_0, {
            text = v8.infoData, 
            textColor = v9.Theme.TextEmphasis, 
            textFont = v10.Typography.TitleLarge
        }), 
        userInteractionEnabled = v8.userInteractionEnabled or false
    });
end);