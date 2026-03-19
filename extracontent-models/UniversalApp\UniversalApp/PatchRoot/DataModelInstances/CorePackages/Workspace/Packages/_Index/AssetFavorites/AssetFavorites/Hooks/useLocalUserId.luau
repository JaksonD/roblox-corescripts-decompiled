local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local v2 = if l_RunService_0:IsStudio() then game:GetService("StudioService") else nil;
return function(v3) --[[ Line: 5 ]] --[[ Name: useLocalUserId ]]
    -- upvalues: l_Players_0 (copy), v2 (copy)
    v3 = v3 or l_Players_0;
    if v3.LocalPlayer then
        return v3.LocalPlayer.UserId;
    elseif v2 then
        return v2:GetUserId();
    else
        return 0;
    end;
end;