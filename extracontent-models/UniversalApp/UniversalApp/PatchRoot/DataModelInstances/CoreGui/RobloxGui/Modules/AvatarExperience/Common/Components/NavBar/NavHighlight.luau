local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = v2.Style.withStyle;
local l_SpringAnimatedItem_0 = v2.Utility.SpringAnimatedItem;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v2.App.ImageSet.Images;
local v8 = v1.PureComponent:extend("NavHighlight");
local v9 = l_Images_0["component_assets/triangleUp_16"];
local v10 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v11 = Vector2.new(20, 8);
local function v13(v12) --[[ Line: 23 ]] --[[ Name: mapAnimatedValuesToProps ]]
    return {
        Size = UDim2.new(0, v12.width, 1, 0), 
        Position = UDim2.fromOffset(v12.position, 0)
    };
end;
v8.validateProps = v3.strictInterface({
    useArrowHighlight = v3.optional(v3.boolean), 
    selectedCategoryButtonInstance = v3.optional(v3.Instance), 
    scrollingFrameRef = v3.table
});
v8.render = function(v14) --[[ Line: 38 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy), l_ImageSetLabel_0 (copy), v11 (copy), v9 (copy), l_SpringAnimatedItem_0 (copy), v13 (copy), v10 (copy)
    local l_useArrowHighlight_0 = v14.props.useArrowHighlight;
    local v16 = 0;
    local v17 = 0;
    v16 = 0;
    v17 = 0;
    if v14.props.selectedCategoryButtonInstance then
        local l_selectedCategoryButtonInstance_0 = v14.props.selectedCategoryButtonInstance;
        if l_selectedCategoryButtonInstance_0 then
            v16 = l_selectedCategoryButtonInstance_0.AbsoluteSize.X;
            v17 = l_selectedCategoryButtonInstance_0.AbsolutePosition.X;
        end;
    end;
    local v19 = v14.props.scrollingFrameRef:getValue();
    if v19 then
        v17 = v17 + v19.CanvasPosition.X - v19.AbsolutePosition.X;
    end;
    return l_withStyle_0(function(v20) --[[ Line: 60 ]]
        -- upvalues: l_useArrowHighlight_0 (copy), v1 (ref), l_ImageSetLabel_0 (ref), v11 (ref), v9 (ref), l_SpringAnimatedItem_0 (ref), v16 (ref), v17 (ref), v13 (ref), v10 (ref)
        local l_Theme_0 = v20.Theme;
        local v22 = {
            Highlight = not l_useArrowHighlight_0 and v1.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, 3), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Theme_0.IconEmphasis.Color, 
                BackgroundTransparency = l_Theme_0.IconEmphasis.Transparency
            }), 
            ArrowHighlight = l_useArrowHighlight_0 and v1.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 1), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 1, 0), 
                Size = UDim2.new(0, v11.X, 0, v11.Y), 
                Image = v9, 
                ImageColor3 = l_Theme_0.BackgroundContrast.Color, 
                ImageTransparency = l_Theme_0.BackgroundContrast.Transparency
            })
        };
        return v1.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
            regularProps = {
                BackgroundTransparency = 1
            }, 
            animatedValues = {
                width = v16, 
                position = v17
            }, 
            mapValuesToProps = v13, 
            springOptions = v10
        }, v22);
    end);
end;
return v8;