return function(v0) --[[ Line: 9 ]] --[[ Name: getFontFace ]]
    local v1 = v0 and v0.Font;
    if typeof(v1) == "EnumItem" and v1:IsA("Font") then
        return Font.fromEnum(v1);
    else
        return v1;
    end;
end;