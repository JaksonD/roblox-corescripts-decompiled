return function(v0, v1) --[[ Line: 1 ]] --[[ Name: formatExperienceIcon ]]
    if v0 then
        return v0;
    else
        return (("rbxthumb://type=GameIcon&id=%*&w=150&h=150"):format(v1));
    end;
end;