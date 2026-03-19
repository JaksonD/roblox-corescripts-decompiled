local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RbxDesignFoundations);
local v3 = require(l_script_FirstAncestor_0.Enums.Device);
local v4 = require(l_script_FirstAncestor_0.Enums.Theme);
local function _(v5, v6) --[[ Line: 10 ]] --[[ Name: getPlatformScale ]]
    -- upvalues: v3 (copy)
    if v6 == nil then
        v6 = 1;
    end;
    v6 = math.clamp(v6, 0, 1e999);
    return (v5 == v3.Console and 1.5 or 1) * v6;
end;
local function v16(v8, v9, v10) --[[ Line: 21 ]] --[[ Name: getTokens ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    local l_Tokens_0 = v2.Tokens;
    local l_v10_0 = v10;
    if l_v10_0 == nil then
        l_v10_0 = 1;
    end;
    l_v10_0 = math.clamp(l_v10_0, 0, 1e999);
    local v13 = (v8 == v3.Console and 1.5 or 1) * l_v10_0;
    local v14 = (if v9 == v4.Dark then l_Tokens_0.Dark else l_Tokens_0.Light)(v13);
    local v15 = {
        Color = v14.Color, 
        Config = v14.Config, 
        DarkMode = v14.DarkMode, 
        Ease = v14.Ease, 
        LightMode = v14.LightMode, 
        Inverse = v14.Inverse, 
        Semantic = v14.Semantic, 
        Size = v14.Size, 
        Padding = v14.Padding, 
        Margin = v14.Margin, 
        Gap = v14.Gap, 
        Gutter = v14.Gutter, 
        Radius = v14.Radius, 
        Stroke = v14.Stroke, 
        LineHeight = v14.LineHeight, 
        FontSize = v14.FontSize, 
        FontWeight = v14.FontWeight, 
        Time = v14.Time, 
        Typography = v14.Typography
    };
    v15.Config.UI.Scale = v13;
    return v15;
end;
local v17 = v16(v3.Desktop, v4.Dark);
return {
    getTokens = v16, 
    defaultTokens = v17
};