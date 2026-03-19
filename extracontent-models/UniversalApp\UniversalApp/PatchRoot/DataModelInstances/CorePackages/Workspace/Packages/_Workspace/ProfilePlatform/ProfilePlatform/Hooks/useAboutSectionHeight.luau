local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Responsive);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useIsSpatial_0 = v4.useIsSpatial;
local l_usePreferredInput_0 = v4.usePreferredInput;
return function(v8, v9, v10) --[[ Line: 11 ]]
    -- upvalues: l_useTokens_0 (copy), l_useIsSpatial_0 (copy), l_usePreferredInput_0 (copy), v4 (copy), v2 (copy), l_TextService_0 (copy)
    local v11 = l_useTokens_0();
    local l_BodyMedium_0 = v11.Typography.BodyMedium;
    local v13 = l_useIsSpatial_0();
    local v14 = l_usePreferredInput_0() == v4.Input.Directional;
    local v15 = v13 or v14;
    local v20, v21 = v2.useMemo(function() --[[ Line: 19 ]]
        -- upvalues: v8 (copy), l_TextService_0 (ref), l_BodyMedium_0 (copy), v15 (copy), v9 (copy), v11 (copy)
        local v16 = string.gsub(v8 or "", "[\r\n]+", " ");
        local l_Y_0 = l_TextService_0:GetTextSize(v16, l_BodyMedium_0.FontSize, l_BodyMedium_0.Font, Vector2.new(1e999, 1e999)).Y;
        local v18 = l_Y_0 * ((v15 and 1.3 or 1) * l_BodyMedium_0.LineHeight) + l_Y_0;
        if v8 and v8 ~= "" then
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v8, l_BodyMedium_0.FontSize, l_BodyMedium_0.Font, Vector2.new(v9, 1e999));
            return if v18 < l_l_TextService_0_TextSize_0.Y then v18 + l_Y_0 + v11.Gap.XSmall else l_l_TextService_0_TextSize_0.Y, v18;
        else
            return 0, v18;
        end;
    end, {
        v8, 
        l_BodyMedium_0.FontSize, 
        l_BodyMedium_0.Font, 
        v9, 
        v10, 
        v15, 
        v11.Gap.XSmall
    });
    return v20, v21;
end;