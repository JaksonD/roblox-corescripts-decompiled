return function(v0, v1, v2, v3, v4) --[[ Line: 4 ]] --[[ Name: isSeeAllTileEnabled ]]
    if v0 then
        return false;
    elseif not v4 then
        return false;
    elseif v1 == nil or v1 <= v2 or v3 <= v2 then
        return false;
    else
        return true;
    end;
end;