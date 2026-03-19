return function(v0, v1) --[[ Line: 1 ]] --[[ Name: isInputInsideObject ]]
    if not v1 then
        return false;
    else
        local l_AbsolutePosition_0 = v1.AbsolutePosition;
        local l_AbsoluteSize_0 = v1.AbsoluteSize;
        local v4 = Rect.new(l_AbsolutePosition_0, l_AbsolutePosition_0 + l_AbsoluteSize_0);
        local v5 = false;
        if v0.X >= v4.Min.X then
            v5 = false;
            if v0.Y >= v4.Min.Y then
                v5 = false;
                if v0.X <= v4.Max.X then
                    v5 = v0.Y <= v4.Max.Y;
                end;
            end;
        end;
        return v5;
    end;
end;