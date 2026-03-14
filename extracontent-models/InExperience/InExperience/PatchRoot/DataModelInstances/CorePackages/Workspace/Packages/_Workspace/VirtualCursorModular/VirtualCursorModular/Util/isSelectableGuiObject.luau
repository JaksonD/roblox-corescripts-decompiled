return function(v0) --[[ Line: 3 ]] --[[ Name: isSelectableGuiObject ]]
    if not v0:IsA("GuiButton") and not v0:IsA("TextBox") then
        return false;
    elseif not v0.Active or not v0.Selectable then
        return false;
    elseif v0.AbsoluteSize.X == 0 or v0.AbsoluteSize.Y == 0 then
        return false;
    else
        return true;
    end;
end;