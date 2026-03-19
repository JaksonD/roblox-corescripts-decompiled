return function(v0) --[[ Line: 3 ]] --[[ Name: parseEconomicRestrictionsFailureReason ]]
    if not v0 then
        return nil;
    else
        return v0.FailureReason or v0.failureReason or v0.violationType;
    end;
end;