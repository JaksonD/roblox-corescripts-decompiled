local v0 = require(script.Parent.IsVRAppBuild);
return function() --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    if v0() then
        return Enum.QualityLevel.Level07;
    else
        return Enum.QualityLevel.Automatic;
    end;
end;