local l_Parent_0 = script:FindFirstAncestor("UserList").Parent;
local v1 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
return function() --[[ Line: 21 ]] --[[ Name: useCompactTileHeight ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy)
    local v3 = l_useTokens_0();
    return (v1.useMemo(function() --[[ Line: 24 ]]
        -- upvalues: v3 (copy)
        local l_Size_1400_0 = v3.Size.Size_1400;
        local l_Medium_0 = v3.Padding.Medium;
        local l_Small_0 = v3.Gap.Small;
        local l_FontSize_0 = v3.Typography.TitleSmall.FontSize;
        local l_FontSize_1 = v3.Typography.LabelSmall.FontSize;
        local l_FontSize_2 = v3.Typography.BodySmall.FontSize;
        local l_Size_800_0 = v3.Size.Size_800;
        local v11 = l_FontSize_0 + l_FontSize_1 + l_FontSize_2;
        return l_Medium_0 + l_Size_1400_0 + l_Small_0 + v11 + l_Small_0 + l_Size_800_0 + l_Medium_0;
    end, {
        v3
    }));
end;