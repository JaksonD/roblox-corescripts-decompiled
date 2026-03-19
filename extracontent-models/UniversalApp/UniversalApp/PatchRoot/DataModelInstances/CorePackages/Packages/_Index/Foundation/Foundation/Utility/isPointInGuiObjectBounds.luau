return function(v0, v1) --[[ Line: 1 ]] --[[ Name: isPointInGuiObjectBounds ]]
    if not v0 then
        return false;
    else
        local l_AbsolutePosition_0 = v0.AbsolutePosition;
        local l_AbsoluteSize_0 = v0.AbsoluteSize;
        local l_X_0 = l_AbsolutePosition_0.X;
        local l_Y_0 = l_AbsolutePosition_0.Y;
        local v6 = l_AbsolutePosition_0.X + l_AbsoluteSize_0.X;
        local v7 = l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y;
        local v8 = false;
        if l_X_0 <= v1.X then
            v8 = false;
            if v1.X <= v6 then
                v8 = false;
                if l_Y_0 <= v1.Y then
                    v8 = v1.Y <= v7;
                end;
            end;
        end;
        return v8;
    end;
end;