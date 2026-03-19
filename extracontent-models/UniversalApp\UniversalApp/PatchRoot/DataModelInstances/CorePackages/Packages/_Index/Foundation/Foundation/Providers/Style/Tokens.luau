local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RbxDesignFoundations);
local v3 = require(l_script_FirstAncestor_0.Enums.Device);
local v4 = require(l_script_FirstAncestor_0.Utility.Flags);
local v5 = require(l_script_FirstAncestor_0.Enums.Theme);
local function _(v6, v7) --[[ Line: 11 ]] --[[ Name: getPlatformScale ]]
    -- upvalues: v4 (copy), v3 (copy)
    if v4.FoundationDisableTokenScaling then
        return 1;
    else
        if v7 == nil then
            v7 = 1;
        end;
        v7 = math.clamp(v7, 0, 1e999);
        return (v6 == v3.Console and 1.5 or 1) * v7;
    end;
end;
local function v17(v9, v10, v11) --[[ Line: 26 ]] --[[ Name: getTokens ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy), v5 (copy)
    local l_Tokens_0 = v2.Tokens;
    local l_v11_0 = v11;
    local v14;
    if v4.FoundationDisableTokenScaling then
        v14 = 1;
    else
        if l_v11_0 == nil then
            l_v11_0 = 1;
        end;
        l_v11_0 = math.clamp(l_v11_0, 0, 1e999);
        v14 = (v9 == v3.Console and 1.5 or 1) * l_v11_0;
    end;
    local v15 = (if v10 == v5.Dark then l_Tokens_0.Dark else l_Tokens_0.Light)(v14);
    local v16 = {
        Color = v15.Color, 
        Config = v15.Config, 
        DarkMode = v15.DarkMode, 
        Ease = v15.Ease, 
        LightMode = v15.LightMode, 
        Inverse = v15.Inverse, 
        Semantic = v15.Semantic, 
        Size = v15.Size, 
        Padding = v15.Padding, 
        Margin = v15.Margin, 
        Gap = v15.Gap, 
        Gutter = v15.Gutter, 
        Radius = v15.Radius, 
        Stroke = v15.Stroke, 
        LineHeight = v15.LineHeight, 
        FontSize = v15.FontSize, 
        FontWeight = v15.FontWeight, 
        Time = v15.Time, 
        Typography = v15.Typography
    };
    v16.Config.UI.Scale = v14;
    return v16;
end;
local v18 = v17(v3.Desktop, v5.Dark);
return {
    getTokens = v17, 
    defaultTokens = v18
};