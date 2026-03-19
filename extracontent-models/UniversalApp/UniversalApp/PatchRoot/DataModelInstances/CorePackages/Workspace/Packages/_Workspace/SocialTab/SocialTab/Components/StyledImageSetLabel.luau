local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_validateColorInfo_0 = l_UIBlox_0.Style.Validator.validateColorInfo;
local l_validateImage_0 = l_UIBlox_0.Core.ImageSet.Validator.validateImage;
local l_llama_0 = v1.llama;
local v9 = l_Roact_0.PureComponent:extend("StyledImageSetLabel");
v9.defaultProps = {
    BackgroundStyle = {
        Color = Color3.fromRGB(0, 0, 0), 
        Transparency = 1
    }, 
    ImageStyle = {
        Color = Color3.fromRGB(255, 255, 255), 
        Transparency = 0
    }, 
    BorderSizePixel = 0, 
    Size = UDim2.new(1, 0, 1, 0), 
    Image = ""
};
v9.validateProps = l_t_0.interface({
    BackgroundStyle = l_t_0.optional(l_validateColorInfo_0), 
    ImageStyle = l_t_0.optional(l_validateColorInfo_0), 
    Image = l_t_0.optional(l_t_0.union(l_t_0.string, l_validateImage_0))
});
v9.render = function(v10) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), l_ImageSetLabel_0 (copy), l_llama_0 (copy)
    return l_Roact_0.createElement(l_ImageSetLabel_0, l_llama_0.Dictionary.join({
        BackgroundColor3 = v10.props.BackgroundStyle.Color, 
        BackgroundTransparency = v10.props.BackgroundStyle.Transparency, 
        ImageColor3 = v10.props.ImageStyle.Color, 
        ImageTransparency = v10.props.ImageStyle.Transparency
    }, v10.props, {
        BackgroundStyle = l_llama_0.None, 
        ImageStyle = l_llama_0.None, 
        [l_Roact_0.Children] = l_llama_0.None
    }), v10.props[l_Roact_0.Children]);
end;
return v9;