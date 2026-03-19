local l_CoreGui_0 = game:GetService("CoreGui");
return function() --[[ Line: 7 ]] --[[ Name: getVRSurfaceGui ]]
    -- upvalues: l_CoreGui_0 (copy)
    local l_LuaAppScreenGui_0 = l_CoreGui_0:FindFirstChild("LuaAppScreenGui");
    local v2 = if l_LuaAppScreenGui_0 then l_LuaAppScreenGui_0:FindFirstChild("MainAppScreen_SurfaceGui") else nil;
    if v2 and v2:IsA("SurfaceGui") then
        return v2;
    else
        return nil;
    end;
end;