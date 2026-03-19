return function(v0, v1) --[[ Line: 1 ]] --[[ Name: isScrollingFrameOverflowingY ]]
    local v2 = if v1 ~= nil then v1 else 1;
    return v0.AbsoluteCanvasSize.Y > v0.AbsoluteWindowSize.Y + v2;
end;