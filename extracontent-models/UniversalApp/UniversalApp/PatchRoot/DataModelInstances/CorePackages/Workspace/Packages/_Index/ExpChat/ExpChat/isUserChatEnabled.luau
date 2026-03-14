return function(v0) --[[ Line: 4 ]]
    local v1 = true;
    if string.sub(v0, 1, 7) ~= "Enabled" then
        v1 = v0 == "AllUsers";
    end;
    return v1;
end;