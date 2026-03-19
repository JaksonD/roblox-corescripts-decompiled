local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_Parent_0.Resources.Assets);
local v8 = require(l_Parent_0.GlobalConfig);
local v9 = l_t_0.strictInterface({
    Size = l_t_0.optional(l_t_0.UDim2), 
    AnchorPoint = l_t_0.optional(l_t_0.UDim2), 
    CanvasSize = l_t_0.optional(l_t_0.UDim2), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.table)
});
return function(v10) --[[ Line: 24 ]] --[[ Name: PaddedScrollFrame ]]
    -- upvalues: v8 (copy), v9 (copy), l_withStyle_0 (copy), l_Roact_0 (copy), v7 (copy)
    if v8.propValidation then
        assert(v9(v10));
    end;
    return l_withStyle_0(function(v11) --[[ Line: 28 ]]
        -- upvalues: l_Roact_0 (ref), v7 (ref), v10 (copy)
        return l_Roact_0.createElement("ScrollingFrame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ScrollBarImageColor3 = v11.Theme.UIEmphasis.Color, 
            ScrollBarImageTransparency = v11.Theme.UIEmphasis.Transparency, 
            BottomImage = v7.Images.ScrollBottom, 
            MidImage = v7.Images.ScrollMid, 
            TopImage = v7.Images.ScrollTop, 
            ClipsDescendants = false, 
            ScrollBarThickness = 12, 
            Size = v10.Size, 
            AnchorPoint = v10.AnchorPoint, 
            CanvasSize = v10.CanvasSize, 
            Position = v10.Position
        }, v10[l_Roact_0.Children]);
    end);
end;