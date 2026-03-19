local l_LocalizationService_0 = game:GetService("LocalizationService");
return {
    snakeToCamel = function(v1) --[[ Line: 16 ]] --[[ Name: snakeToCamel ]]
        return v1:gsub("_(%l)", function(v2) --[[ Line: 17 ]]
            return v2:upper();
        end);
    end, 
    protobufTimestampToLocalTimeString = function(v3) --[[ Line: 25 ]] --[[ Name: protobufTimestampToLocalTimeString ]]
        -- upvalues: l_LocalizationService_0 (copy)
        if v3 == nil then
            return nil;
        elseif v3.seconds then
            return DateTime.fromUnixTimestamp(v3.seconds):FormatLocalTime("ll", l_LocalizationService_0.RobloxLocaleId);
        else
            return (tostring(v3));
        end;
    end
};