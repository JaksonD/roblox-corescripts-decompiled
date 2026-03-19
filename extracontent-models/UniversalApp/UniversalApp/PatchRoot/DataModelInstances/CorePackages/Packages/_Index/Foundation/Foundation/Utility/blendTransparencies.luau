return function(v0, v1) --[[ Line: 1 ]] --[[ Name: blendTransparencies ]]
    if v0 == nil then
        return v1 or 0;
    elseif v1 == nil then
        return v0 or 0;
    else
        return 1 - (1 - v0) * (1 - v1);
    end;
end;