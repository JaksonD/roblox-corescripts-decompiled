local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
return {
    getEdpStoreKey = function(v2) --[[ Line: 9 ]] --[[ Name: getEdpStoreKey ]]
        -- upvalues: v1 (copy)
        return (("%*_%*"):format(v1.AppPage.ExperienceDetail, v2));
    end, 
    getUnprocessedEdpStoreKey = function(v3) --[[ Line: 4 ]] --[[ Name: getUnprocessedEdpStoreKey ]]
        -- upvalues: v1 (copy)
        return (("%*_%*_unprocessed"):format(v1.AppPage.ExperienceDetail, v3));
    end, 
    checkEdpDataStaleness = function(v4, v5) --[[ Line: 14 ]] --[[ Name: checkEdpDataStaleness ]]
        local v6 = v5 * 1000;
        if not v4 or v4 <= 0 then
            return true;
        else
            return v6 < tick() * 1000 - v4;
        end;
    end
};