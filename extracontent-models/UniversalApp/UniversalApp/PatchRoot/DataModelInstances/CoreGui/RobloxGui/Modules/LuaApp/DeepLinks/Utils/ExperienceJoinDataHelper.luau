local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
return {
    mergeExperienceJoinData = function(v2, v3) --[[ Line: 4 ]]
        -- upvalues: v1 (copy)
        if v3 then
            return (v1.Dictionary.join(v2, {
                experienceJoinData = {
                    eventId = v3.experienceEventId, 
                    launchData = v3.launchData
                }
            }));
        else
            return v2;
        end;
    end
};