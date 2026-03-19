local l_Workspace_0 = game:GetService("Workspace");
return function(v1) --[[ Line: 7 ]]
    -- upvalues: l_Workspace_0 (copy)
    if v1 ~= nil and v1.Created ~= nil then
        local v2 = DateTime.fromIsoDate(v1.Created);
        if v2 then
            local l_UnixTimestampMillis_0 = v2.UnixTimestampMillis;
            if l_Workspace_0:GetServerTimeNow() * 1000 - l_UnixTimestampMillis_0 > 604800000 then
                return true;
            end;
        end;
    end;
    return false;
end;