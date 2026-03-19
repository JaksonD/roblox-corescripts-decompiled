local l_Parent_0 = script.Parent.Parent.Parent;
local l_IconSize_0 = require(l_Parent_0.Foundation).Enums.IconSize;
return function(v2, v3) --[[ Line: 15 ]] --[[ Name: getLoadingIconSize ]]
    -- upvalues: l_IconSize_0 (copy)
    if v2 == nil then
        return nil;
    else
        local l_Offset_0 = v2.Y.Offset;
        if v2.Y.Scale > 0 and l_Offset_0 <= 0 then
            return l_IconSize_0.Large;
        else
            local v5 = {
                {
                    l_IconSize_0.XSmall, 
                    v3.Size.Size_200
                }, 
                {
                    l_IconSize_0.Small, 
                    v3.Size.Size_400
                }, 
                {
                    l_IconSize_0.Medium, 
                    v3.Size.Size_900
                }, 
                {
                    l_IconSize_0.Large, 
                    v3.Size.Size_1200
                }
            };
            local v6 = v5[1][1];
            local v7 = math.abs(l_Offset_0 - v5[1][2]);
            for v8 = 2, #v5 do
                local v9 = math.abs(l_Offset_0 - v5[v8][2]);
                if v9 < v7 then
                    v6 = v5[v8][1];
                    v7 = v9;
                end;
            end;
            return v6;
        end;
    end;
end;