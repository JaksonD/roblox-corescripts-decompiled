local v0 = game:DefineFastInt("AXHeadRefinementTooltipExpirationDurationDays", 7);
return function(v1) --[[ Line: 4 ]] --[[ Name: getShouldShowAdjustmentTooltipFromTime ]]
    -- upvalues: v0 (copy)
    if not v1.prevTime then
        return true;
    else
        return (v1.expirationDurationSeconds or v0 * 24 * 60 * 60) <= os.difftime(v1.currentTime, v1.prevTime);
    end;
end;