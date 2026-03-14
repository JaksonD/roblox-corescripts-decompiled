return function(v0) --[[ Line: 3 ]] --[[ Name: parseEconomicRestrictionsExpirationTimeInMinutes ]]
    if not v0 then
        return nil;
    else
        return v0.ExpirationTimeInMinutes or v0.expirationTimeInMinutes or v0.timeoutMinutes;
    end;
end;