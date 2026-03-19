return function(v0, v1, v2) --[[ Line: 1 ]] --[[ Name: formatExperienceThumbnail ]]
    local v3 = 384;
    local v4 = 216;
    if v2 then
        v3 = 768;
        v4 = 432;
    end;
    if v0 and v0 ~= "0" then
        return (("rbxthumb://type=Asset&id=%*&w=%*&h=%*"):format(v0, v3, v4));
    else
        return (("rbxthumb://type=GameThumbnail&id=%*&w=%*&h=%*"):format(v1, v3, v4));
    end;
end;