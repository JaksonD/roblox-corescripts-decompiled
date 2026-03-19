return function(v0) --[[ Line: 1 ]] --[[ Name: getFirstFocusableDescendant ]]
    for _, v2 in v0:GetDescendants() do
        if v2:IsA("GuiObject") and v2.Selectable and v2.Visible then
            return v2;
        end;
    end;
    return nil;
end;