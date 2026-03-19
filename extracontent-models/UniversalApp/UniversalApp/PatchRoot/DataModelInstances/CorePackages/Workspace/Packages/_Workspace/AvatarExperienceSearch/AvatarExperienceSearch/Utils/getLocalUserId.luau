return function(v0) --[[ Line: 1 ]] --[[ Name: getLocalUserId ]]
    if v0.LocalPlayer then
        return (tostring(v0.LocalPlayer.UserId));
    else
        return nil;
    end;
end;