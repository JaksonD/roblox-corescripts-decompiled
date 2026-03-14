return function(v0, v1) --[[ Line: 1 ]]
    if v1 < #v0 then
        return false;
    elseif v0:match("^%s*$") then
        return false;
    else
        return true;
    end;
end;