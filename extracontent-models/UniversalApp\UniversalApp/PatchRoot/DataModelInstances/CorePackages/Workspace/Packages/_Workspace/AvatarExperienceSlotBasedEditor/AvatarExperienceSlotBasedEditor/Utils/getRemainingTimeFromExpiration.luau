local function v1(v0) --[[ Line: 26 ]] --[[ Name: convertSecondsToTimeFrames ]]
    if v0 >= 86400 then
        return {
            value = math.ceil(v0 / 86400), 
            unit = "days"
        };
    elseif v0 >= 3600 then
        return {
            value = math.ceil(v0 / 3600), 
            unit = "hours"
        };
    else
        return {
            value = math.ceil(v0 / 60), 
            unit = "minutes"
        };
    end;
end;
return function(v2) --[[ Line: 36 ]] --[[ Name: getRemainingTimeFromExpiration ]]
    -- upvalues: v1 (copy)
    if not v2 then
        return nil;
    else
        local v3 = DateTime.fromIsoDate(v2);
        if not v3 then
            return nil;
        else
            local v4 = DateTime.now();
            local v5 = math.max(v3.UnixTimestamp - v4.UnixTimestamp, 0);
            if v5 <= 0 then
                return nil;
            else
                return (v1(v5));
            end;
        end;
    end;
end;