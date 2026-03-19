local l_Players_0 = game:GetService("Players");
return function(v1) --[[ Line: 3 ]] --[[ Name: getLocalUserId ]]
    -- upvalues: l_Players_0 (copy)
    local l_LocalPlayer_0 = (v1 or l_Players_0).LocalPlayer;
    if l_LocalPlayer_0 then
        return (tostring(l_LocalPlayer_0.UserId));
    else
        return nil;
    end;
end;