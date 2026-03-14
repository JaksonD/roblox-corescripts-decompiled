local v0 = require(script.Parent.PageLoadConfig);
isElementInScreenBounds = function(v1, v2, v3) --[[ Line: 3 ]] --[[ Name: isElementInScreenBounds ]]
    -- upvalues: v0 (copy)
    local l_AbsolutePosition_0 = v1.AbsolutePosition;
    local l_AbsoluteSize_0 = v1.AbsoluteSize;
    if l_AbsoluteSize_0.X <= 0 or l_AbsoluteSize_0.Y <= 0 then
        return false;
    else
        local l_X_0 = l_AbsolutePosition_0.X;
        local v7 = l_AbsolutePosition_0.X + l_AbsoluteSize_0.X;
        local l_X_1 = v2.X;
        local v9 = math.max(l_X_0, 0);
        local v10 = math.max(0, math.min(v7, l_X_1) - v9);
        local l_Y_0 = l_AbsolutePosition_0.Y;
        local v12 = l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y;
        local l_Y_1 = v2.Y;
        local v14 = math.max(l_Y_0, v3);
        local v15 = math.max(0, math.min(v12, l_Y_1) - v14);
        local v16 = l_AbsoluteSize_0.X * v0.SCREEN_BOUNDS.MIN_VISIBILITY_RATIO <= v10;
        local v17 = l_AbsoluteSize_0.Y * v0.SCREEN_BOUNDS.MIN_VISIBILITY_RATIO <= v15;
        return v16 and v17;
    end;
end;
return isElementInScreenBounds;