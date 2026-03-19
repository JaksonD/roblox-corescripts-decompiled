return function(v0, v1) --[[ Line: 3 ]] --[[ Name: getSettingsForMessage ]]
    local v2 = v0 and v0.UserSpecificSettings;
    if not v1 or not v2 then
        return v0;
    elseif v2[v1.userId] then
        return v2[v1.userId];
    elseif v1.partOrModel and v2[v1.partOrModel:GetFullName()] then
        return v2[v1.partOrModel:GetFullName()];
    else
        return v0;
    end;
end;