local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Enums.ColorMode);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v9 = v3.forwardRef(function(v5, v6) --[[ Line: 19 ]]
    -- upvalues: v4 (copy), v3 (copy)
    local v7 = v4();
    local l_colorMode_0 = v5.colorMode;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Position = UDim2.fromOffset(-v5.offset, -v5.offset), 
        Size = UDim2.new(1, v5.offset * 2, 1, v5.offset * 2), 
        ref = v6
    }, {
        UICorner = v3.createElement("UICorner", {
            CornerRadius = v5.cornerRadius
        }), 
        UIStroke = v3.createElement("UIStroke", {
            Color = v7[l_colorMode_0].Selection.Start.Color3, 
            Transparency = v7[l_colorMode_0].Selection.Start.Transparency, 
            Thickness = v5.borderWidth
        }, {})
    });
end);
return v3.memo(v9);