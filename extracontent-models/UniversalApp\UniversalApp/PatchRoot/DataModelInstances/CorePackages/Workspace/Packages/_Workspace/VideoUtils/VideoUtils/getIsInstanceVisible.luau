return function(v0, v1, v2) --[[ Line: 1 ]] --[[ Name: getIsInstanceVisible ]]
    if not v0 then
        return false;
    else
        local l_AbsoluteSize_0 = v0.AbsoluteSize;
        if l_AbsoluteSize_0.X <= 0 or l_AbsoluteSize_0.Y <= 0 then
            return false;
        else
            local l_AbsolutePosition_0 = v0.AbsolutePosition;
            local v5 = l_AbsolutePosition_0 + l_AbsoluteSize_0;
            local v6 = math.max(l_AbsolutePosition_0.X, v1.min.X);
            local v7 = math.min(v5.X, v1.max.X) - v6;
            if v7 <= 0 then
                return false;
            else
                local v8 = math.max(l_AbsolutePosition_0.Y, v1.min.Y);
                local v9 = math.min(v5.Y, v1.max.Y) - v8;
                if v9 <= 0 then
                    return false;
                else
                    local v10 = v7 * v9;
                    local v11 = l_AbsoluteSize_0.X * l_AbsoluteSize_0.Y;
                    return v2 <= v10 * 100 / v11;
                end;
            end;
        end;
    end;
end;