local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
return function(v1) --[[ Line: 3 ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    if l_LocalPlayer_0 and l_LocalPlayer_0.UserId % 10000 < v1 then
        return true;
    else
        return false;
    end;
end;