return function(v0) --[[ Line: 1 ]] --[[ Name: isValidFocusTarget ]]
    if not v0 then
        return false, "`nil` value provided to isValidFocusTarget";
    elseif not v0:IsA("GuiBase2d") then
        return false, string.format("provided Instance is of class %s, which is not a GuiBase2d", v0.ClassName);
    elseif not v0:FindFirstAncestorWhichIsA("LayerCollector") then
        return false, "provided Instance is not a descendant of a LayerCollector like a ScreenGui or SurfaceGui";
    elseif not v0:FindFirstAncestorWhichIsA("BasePlayerGui") then
        return false, "provided Instance is not a descendant of a BasePlayerGui like PlayerGui or CoreGui";
    else
        return true;
    end;
end;