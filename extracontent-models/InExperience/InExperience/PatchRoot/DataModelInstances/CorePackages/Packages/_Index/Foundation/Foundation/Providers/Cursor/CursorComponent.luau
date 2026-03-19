local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local v3 = require(l_script_FirstAncestor_0.Utility.Flags);
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v10 = v4.forwardRef(function(v6, v7) --[[ Line: 20 ]]
    -- upvalues: v5 (copy), v3 (copy), v2 (copy), v4 (copy)
    local v8 = v5();
    local v9 = if v3.FoundationSupportPresentationContextInSelectionCursor then v6.colorMode else v2.Color;
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Position = UDim2.fromOffset(-v6.offset, -v6.offset), 
        Size = UDim2.new(1, v6.offset * 2, 1, v6.offset * 2), 
        ref = v7
    }, {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = v6.cornerRadius
        }), 
        UIStroke = v4.createElement("UIStroke", {
            Color = v8[v9].Selection.Start.Color3, 
            Transparency = v8[v9].Selection.Start.Transparency, 
            Thickness = v6.borderWidth
        }, {})
    });
end);
return v4.memo(v10);