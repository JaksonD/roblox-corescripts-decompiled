return function(v0) --[[ Line: 11 ]] --[[ Name: toRect ]]
    local v1 = typeof(v0);
    if v1 == "Rect" then
        return v0;
    elseif v1 == "Instance" then
        return Rect.new(v0.AbsolutePosition, v0.AbsolutePosition + v0.AbsoluteSize);
    else
        return;
    end;
end;