local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.BadgeVariant);
local v2 = require(l_script_FirstAncestor_0.Enums.BadgeSize);
local v3 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = {
    [v2.Small] = "text-caption-small", 
    [v2.Medium] = "text-label-small"
};
return function(v6, v7, v8, v9) --[[ Line: 24 ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy), v5 (copy)
    local v10 = v3();
    local v11 = {
        [v1.Primary] = {
            backgroundStyle = v10.Color.System.Contrast, 
            contentStyle = v10.Inverse.Content.Emphasis
        }, 
        [v1.Secondary] = {
            backgroundStyle = v10.Color.Shift.Shift_200, 
            contentStyle = v10.Color.Content.Emphasis
        }, 
        [v1.Alert] = {
            backgroundStyle = v10.Color.System.Alert, 
            contentStyle = v10.DarkMode.Content.Emphasis
        }, 
        [v1.Success] = {
            backgroundStyle = v10.Color.System.Success, 
            contentStyle = v10.LightMode.Content.Emphasis
        }, 
        [v1.Warning] = {
            backgroundStyle = v10.Color.System.Warning, 
            contentStyle = v10.LightMode.Content.Emphasis
        }, 
        [v1.Contrast] = {
            backgroundStyle = v10.Color.System.Contrast, 
            contentStyle = v10.Inverse.Content.Emphasis
        }, 
        [v1.Neutral] = {
            backgroundStyle = v10.Color.Shift.Shift_300, 
            contentStyle = v10.Color.Content.Emphasis
        }, 
        [v1.OverMedia] = {
            backgroundStyle = v10.LightMode.Surface.Surface_100, 
            contentStyle = v10.LightMode.Content.Emphasis
        }
    };
    local v12 = {
        [v2.Small] = v10.Size.Size_300 - v10.Padding.XXSmall * 2, 
        [v2.Medium] = v10.Size.Size_600 - v10.Stroke.Standard * 2 - v10.Padding.XXSmall * 2
    };
    local v13 = (not not v8 or v9) and "padding-xxsmall" or "";
    local v14 = v5[v7];
    local v15 = {
        MaxSize = if v8 then Vector2.new(1e999, 1e999) else nil
    };
    local v16 = if not not v9 or v8 then v12[v7] else v10.Size.Size_200;
    local v17 = {
        MinSize = Vector2.new(v16, v16), 
        MaxSize = Vector2.new(1e999, 1e999)
    };
    local v18 = ("auto-xy radius-circle row align-y-center align-x-center stroke-thick %*"):format(v13);
    local v19 = ("auto-xy padding-x-xsmall %*"):format(v14);
    return v11[v6], v17, v15, v18, v19;
end;