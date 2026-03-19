game:DefineFastInt("LuaAppBacktraceErrorReportPercentage", 5);
local v0 = math.random(1, 100);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return math.clamp(game:GetFastInt("LuaAppBacktraceErrorReportPercentage"), 0, 100) >= v0;
end;