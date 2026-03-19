local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_1.Core;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.t);
local v5 = require(l_Core_0.Style.Validator.validateColorInfo);
local v6 = require(l_Core_0.Style.Validator.validateFontInfo);
local v7 = require(l_Core_0.Style.Validator.validateTypographyInfo);
local v8 = require(l_Parent_2.Roact);
local v9 = require(l_Parent_2.React);
local v10 = require(l_Core_0.Style.withStyle);
local v11 = require(l_Parent_1.Core.Text.GenericTextLabel.GenericTextLabel);
local v12 = require(l_Core_0.ImageSet.ImageSetComponent);
local v13 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v14 = require(l_Parent_0.ImageSet.getIconSize);
local v15 = require(l_Parent_0.ImageSet.Images);
local v16 = require(l_Parent_1.UIBloxConfig);
local v17 = v8.PureComponent:extend("CellTailDescription");
v17.validateProps = v4.strictInterface({
    text = v4.optional(v4.string), 
    textColor = v4.optional(v5), 
    textFont = v4.optional(v4.union(v6, v7)), 
    renderTextOverride = v4.optional(v4.callback), 
    showArrow = v4.optional(v4.boolean), 
    infoIcon = v4.optional(v4.string), 
    testId = v4.optional(v4.string)
});
v17.defaultProps = {
    showArrow = false, 
    infoIcon = nil, 
    testId = "--uiblox-cell-tail-description"
};
v17.init = function(v18) --[[ Line: 44 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), v11 (copy)
    v18.getDescription = function(v19, v20, v21, v22, v23) --[[ Line: 45 ]]
        -- upvalues: v8 (ref), v11 (ref)
        local v24 = nil;
        if v19 then
            if v23 then
                v24 = v23();
            end;
            if not v24 then
                v24 = v8.createElement(v11, {
                    LayoutOrder = v22, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v19, 
                    colorStyle = v20, 
                    fontStyle = v21, 
                    BackgroundTransparency = 1
                });
            end;
        end;
        return v24;
    end;
end;
v17.render = function(v25) --[[ Line: 69 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v8 (copy), v9 (copy), v12 (copy), v16 (copy), v14 (copy), v13 (copy), v15 (copy)
    local l_text_0 = v25.props.text;
    local l_renderTextOverride_0 = v25.props.renderTextOverride;
    local l_showArrow_0 = v25.props.showArrow;
    local v29 = v25.props.infoIcon ~= nil;
    if not l_text_0 and not l_showArrow_0 and not v29 then
        return nil;
    else
        return v10(function(v30) --[[ Line: 79 ]]
            -- upvalues: v25 (copy), v8 (ref), v9 (ref), l_text_0 (copy), l_renderTextOverride_0 (copy), l_showArrow_0 (copy), v12 (ref), v16 (ref), v14 (ref), v13 (ref), v15 (ref), v29 (copy)
            local v31 = v25.props.textColor or v30.Theme.TextDefault;
            local v32 = v25.props.textFont or v30.Font.Body;
            return v8.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                [v9.Tag] = if v25.props.testId then ("data-testid=%*"):format(v25.props.testId) else nil
            }, {
                ListLayout = v8.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 8)
                }), 
                Description = v25.getDescription(l_text_0, v31, v32, 1, l_renderTextOverride_0), 
                RightArrow = l_showArrow_0 and v8.createElement(v12.Label, {
                    LayoutOrder = 2, 
                    Size = if v16.enableScalingForSomeEdpIcons then UDim2.fromOffset(v14(v13.Small, v30), v14(v13.Small, v30)) else UDim2.fromOffset(v14(v13.Small), v14(v13.Small)), 
                    BackgroundTransparency = 1, 
                    Image = v15["icons/navigation/pushRight_small"], 
                    ImageColor3 = v30.Theme.TextEmphasis.Color, 
                    ImageTransparency = v30.Theme.TextEmphasis.Transparency
                }) or nil, 
                InfoIcon = v29 and v8.createElement(v12.Label, {
                    LayoutOrder = 2, 
                    Size = if v16.enableScalingForSomeEdpIcons then UDim2.fromOffset(v14(v13.Small, v30), v14(v13.Small, v30)) else UDim2.fromOffset(v14(v13.Small), v14(v13.Small)), 
                    Image = v25.props.infoIcon, 
                    ImageColor3 = v30.Theme.IconEmphasis.Color, 
                    ImageTransparency = v30.Theme.IconEmphasis.Transparency, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }) or nil
            });
        end);
    end;
end;
return v17;