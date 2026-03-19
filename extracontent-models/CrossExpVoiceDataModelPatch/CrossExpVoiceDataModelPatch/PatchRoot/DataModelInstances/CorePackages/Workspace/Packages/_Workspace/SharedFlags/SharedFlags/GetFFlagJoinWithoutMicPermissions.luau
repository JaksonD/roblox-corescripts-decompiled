game:DefineFastFlag("JoinWithoutMicPermissions3", false);
local v0 = true;
return function(v1) --[[ Line: 14 ]]
    -- upvalues: v0 (ref)
    if v1 ~= nil then
        v0 = v1;
    end;
    return game:GetFastFlag("JoinWithoutMicPermissions3") and v0;
end;