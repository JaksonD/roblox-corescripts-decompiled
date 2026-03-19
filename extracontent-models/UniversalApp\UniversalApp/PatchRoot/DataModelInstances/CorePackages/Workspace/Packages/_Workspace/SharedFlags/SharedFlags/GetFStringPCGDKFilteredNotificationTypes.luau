game:DefineFastString("PCGDKFilteredNotificationTypes", "ExperienceInvitation,SquadExperienceInvitation");
return function() --[[ Line: 3 ]]
    local l_game_FastString_0 = game:GetFastString("PCGDKFilteredNotificationTypes");
    if l_game_FastString_0 == "" then
        return {};
    else
        local v1 = {};
        local v2 = string.split(l_game_FastString_0, ",");
        for _, v4 in ipairs(v2) do
            local v5 = v4:match("^%s*(.-)%s*$");
            if v5 ~= "" then
                v1[v5] = true;
            end;
        end;
        return v1;
    end;
end;