local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_UIBlox_0 = v1.UIBlox;
local l_llama_0 = v1.llama;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_validateColorInfo_0 = l_UIBlox_0.Style.Validator.validateColorInfo;
local l_validateFontInfo_0 = l_UIBlox_0.Style.Validator.validateFontInfo;
local v9 = l_Roact_0.PureComponent:extend("StyledTextLabel");
v9.defaultProps = {
    BackgroundStyle = {
        Color = Color3.fromRGB(0, 0, 0), 
        Transparency = 1
    }, 
    FontStyle = {
        Font = Enum.Font.Gotham, 
        RelativeSize = 1, 
        RelativeMinSize = 1
    }, 
    TextStyle = {
        Color = Color3.fromRGB(0, 0, 0), 
        Transparency = 1
    }, 
    BorderSizePixel = 0, 
    Size = UDim2.new(1, 0, 1, 0), 
    Text = "Text"
};
v9.validateProps = l_t_0.interface({
    BackgroundStyle = l_t_0.optional(l_validateColorInfo_0), 
    FontStyle = l_t_0.optional(l_validateFontInfo_0), 
    TextStyle = l_t_0.optional(l_validateColorInfo_0), 
    Text = l_t_0.optional(l_t_0.string)
});
v9.render = function(v10) --[[ Line: 40 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), l_llama_0 (copy)
    return l_withStyle_0(function(v11) --[[ Line: 41 ]]
        -- upvalues: v10 (copy), l_Roact_0 (ref), l_llama_0 (ref)
        local v12 = v10.props.FontStyle.RelativeSize * v11.Font.BaseSize;
        return l_Roact_0.createElement("TextLabel", l_llama_0.Dictionary.join({
            BackgroundColor3 = v10.props.BackgroundStyle.Color, 
            BackgroundTransparency = v10.props.BackgroundStyle.Transparency, 
            Font = v10.props.FontStyle.Font, 
            TextSize = v12, 
            TextColor3 = v10.props.TextStyle.Color, 
            TextTransparency = v10.props.TextStyle.Transparency
        }, v10.props, {
            BackgroundStyle = l_llama_0.None, 
            FontStyle = l_llama_0.None, 
            TextStyle = l_llama_0.None
        }));
    end);
end;
return v9;