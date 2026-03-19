local l_CorePackages_0 = game:GetService("CorePackages");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).GameProtocol.default;
local v2 = require(script.Parent.Parent.Utils.ExperienceJoinDataHelper);
local _ = require(script.Parent.Types);
local v4 = require(script.Parent.ShareLinkTypes);
return function(v5, v6) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v4 (copy), l_default_0 (copy)
    local v7 = v5 and v5.responseBody and v5.responseBody.experienceEventData or {};
    if not v7 or not v7.universeId or not v7.placeId then
        return;
    else
        local v8 = {};
        local l_joinData_0 = v7.joinData;
        if l_joinData_0 then
            v8 = v2.mergeExperienceJoinData(v8, l_joinData_0);
        end;
        v6.launchGame(v7.placeId, v4.ExperienceEvent, v8.experienceJoinData, l_default_0, "ExperienceEventShareLink");
        return;
    end;
end;