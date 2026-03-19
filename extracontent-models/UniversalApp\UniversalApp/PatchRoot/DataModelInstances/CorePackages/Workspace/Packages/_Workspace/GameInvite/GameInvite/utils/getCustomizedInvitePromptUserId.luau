return function(v0) --[[ Line: 1 ]]
    if v0 and v0.InviteUser ~= 0 then
        return v0.InviteUser;
    else
        return nil;
    end;
end;