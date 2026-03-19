return function(v0, v1) --[[ Line: 1 ]] --[[ Name: scaleValue ]]
    if v1 == nil then
        return v0;
    elseif typeof(v0) == "number" then
        return v0 * v1;
    elseif typeof(v0) == "UDim" then
        return UDim.new(v0.Scale, v0.Offset * v1);
    elseif typeof(v0) == "UDim2" then
        return UDim2.new(v0.X.Scale, v0.X.Offset * v1, v0.Y.Scale, v0.Y.Offset * v1);
    else
        return v0;
    end;
end;