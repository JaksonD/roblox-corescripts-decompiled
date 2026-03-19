return function(v0, v1, v2) --[[ Line: 2 ]] --[[ Name: findAnalyticsField ]]
    if not v1 then
        return nil;
    elseif v1 and v1[v0] ~= nil then
        return v1[v0];
    elseif v2 ~= nil then
        return v2;
    else
        return nil;
    end;
end;