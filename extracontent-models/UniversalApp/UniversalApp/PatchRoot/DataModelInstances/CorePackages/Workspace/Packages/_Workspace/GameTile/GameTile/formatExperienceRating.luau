return function(v0, v1, v2, v3) --[[ Line: 1 ]] --[[ Name: formatExperienceRating ]]
    if v0 + v1 == 0 then
        return v2 or "--";
    else
        local v4 = math.round(v0 / (v0 + v1) * 100);
        if v3 then
            return (("%*%%"):format(v4));
        else
            return (tostring(v4));
        end;
    end;
end;