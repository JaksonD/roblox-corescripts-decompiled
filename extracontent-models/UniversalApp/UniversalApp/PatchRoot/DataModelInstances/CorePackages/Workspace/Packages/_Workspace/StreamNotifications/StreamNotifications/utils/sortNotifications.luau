local function v4(v0, v1) --[[ Line: 1 ]]
    if v0.eventDate == "" or v0.eventDate == nil or v1.eventDate == "" or v1.eventDate == nil then
        return true;
    else
        local v2 = DateTime.fromIsoDate(v0.eventDate) or nil;
        local v3 = DateTime.fromIsoDate(v1.eventDate) or nil;
        if v2 == nil or v3 == nil then
            return true;
        else
            return v2.UnixTimestampMillis > v3.UnixTimestampMillis;
        end;
    end;
end;
return function(v5) --[[ Line: 16 ]]
    -- upvalues: v4 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 17 ]]
        -- upvalues: v5 (copy), v4 (ref)
        local v6 = table.clone(v5);
        table.sort(v6, v4);
        return v6;
    end);
    if l_status_0 then
        return l_result_0;
    else
        return v5;
    end;
end;