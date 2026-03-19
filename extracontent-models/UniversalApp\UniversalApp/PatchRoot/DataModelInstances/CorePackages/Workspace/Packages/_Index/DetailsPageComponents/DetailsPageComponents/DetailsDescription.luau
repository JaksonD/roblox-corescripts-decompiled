local l_Parent_0 = script:FindFirstAncestor("DetailsPageComponents").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_RetrievalStatus_0 = v2.App.Loading.Enum.RetrievalStatus;
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
return v1.memo(function(v7) --[[ Line: 21 ]]
    -- upvalues: l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_RetrievalStatus_0 (copy), v1 (copy), l_StyledTextLabel_0 (copy)
    local v8 = l_useStyle_0();
    local v9 = l_useDesignTokens_0();
    local v10 = v9.Semantic.Typography.Body or {};
    local v11 = v9.Semantic.Typography.Header or {};
    local v12 = v7.dataStatus == l_RetrievalStatus_0.Done;
    local v13 = v7.descriptionText and #v7.descriptionText > 0;
    if not v12 or not v13 then
        return nil;
    else
        return v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v7.LayoutOrder
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v7.listPadding or 16)
            }), 
            Title = v1.createElement(l_StyledTextLabel_0, {
                text = v7.titleText, 
                size = UDim2.fromScale(1, 0), 
                fontStyle = v11, 
                colorStyle = v8.Theme.TextEmphasis, 
                automaticSize = Enum.AutomaticSize.Y, 
                richText = false, 
                fluidSizing = false
            }), 
            Description = v1.createElement(l_StyledTextLabel_0, {
                text = v7.descriptionText, 
                size = UDim2.new(1, 0, 0, 0), 
                textYAlignment = Enum.TextYAlignment.Top, 
                fontStyle = v10, 
                colorStyle = v8.Theme.TextDefault, 
                automaticSize = Enum.AutomaticSize.Y, 
                lineHeight = v10.LineHeight, 
                richText = false, 
                fluidSizing = false
            })
        });
    end;
end);