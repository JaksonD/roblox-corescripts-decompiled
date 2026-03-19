local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Skeleton);
local v4 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Components.View);
local v7 = require(l_script_FirstAncestor_0.Providers.Style.useTextSizeOffset);
local v8 = require(l_script_FirstAncestor_0.Components.Tile.useTile);
local v9 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v10 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local function v24(v11, v12, v13, v14, v15, v16, v17) --[[ Line: 31 ]] --[[ Name: getTypographyComponent ]]
    -- upvalues: v2 (copy), v3 (copy), v7 (copy), v4 (copy)
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    local v21 = nil;
    if typeof(v11) == "string" then
        v18 = v11;
        v19 = v12;
        v20 = v13;
        v21 = v15;
    elseif v11.isLoading then
        return v2.createElement(v3, {
            Size = UDim2.new(1 / v16, 0, 0, v12.FontSize), 
            LayoutOrder = v16
        });
    else
        v18 = v11.text;
        v19 = v11.fontStyle or v12;
        v20 = v11.colorStyle or v13;
        v21 = v11.numLines or v15;
    end;
    assert(v19 ~= nil, "fontStyle cannot be nil");
    assert(v20 ~= nil, "colorStyle cannot be nil");
    assert(v21 ~= nil, "numLines cannot be nil");
    v19.LineHeight = 1;
    local v22 = v7();
    local v23 = v21 * (v19.FontSize + (v22 or 0)) * v19.LineHeight;
    return v2.createElement(v4, {
        fontStyle = v19, 
        textStyle = v20, 
        Text = v18, 
        TextXAlignment = v14, 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextWrapped = v21 > 1, 
        Size = UDim2.new(1, 0, 0, v23), 
        LayoutOrder = v16, 
        testId = v17
    });
end;
local v25 = {
    TextXAlignment = Enum.TextXAlignment.Left
};
return function(v26) --[[ Line: 98 ]] --[[ Name: TileHeader ]]
    -- upvalues: v10 (copy), v25 (copy), v9 (copy), v8 (copy), v24 (copy), v2 (copy), v6 (copy)
    local v27 = v10(v26, v25);
    local v28 = v9();
    local v29 = v8();
    local v30 = v24(v27.title, v28.Typography.TitleLarge, v28.Color.Content.Emphasis, v27.TextXAlignment, v27.subtitle == nil and 2 or 1, 1, (("%*--header-title"):format(v29.testId)));
    return v2.createElement(v6, {
        flexItem = {
            FlexMode = Enum.UIFlexMode.Shrink
        }, 
        layout = {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }, 
        tag = "auto-y size-full-0 gap-xxsmall", 
        testId = ("%*--header"):format(v29.testId)
    }, {
        Title = v30, 
        Subtitle = if v27.subtitle ~= nil then v24(v27.subtitle, v28.Typography.CaptionLarge, v28.Color.Content.Default, v27.TextXAlignment, 1, 2, (("%*--header-subtitle"):format(v29.testId))) else nil
    });
end;