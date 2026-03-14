return function(v0, v1) --[[ Line: 1 ]] --[[ Name: getCropSize ]]
    if v0.X == 0 or v0.Y == 0 or v1.X == 0 or v1.Y == 0 then
        return UDim2.fromScale(1, 1);
    else
        local v2 = v0.X / v0.Y;
        local v3 = v1.X / v1.Y;
        if v3 < v2 then
            return UDim2.fromScale(1, v2 / v3);
        else
            return UDim2.fromScale(v3 / v2, 1);
        end;
    end;
end;