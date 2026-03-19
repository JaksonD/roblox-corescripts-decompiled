return function(v0, v1) --[[ Line: 3 ]]
    v0 = v0 or Vector2.new(0, 0);
    assert(v0, "");
    if v1 and v1.screenSize then
        return v1.screenSize;
    else
        return v0;
    end;
end;