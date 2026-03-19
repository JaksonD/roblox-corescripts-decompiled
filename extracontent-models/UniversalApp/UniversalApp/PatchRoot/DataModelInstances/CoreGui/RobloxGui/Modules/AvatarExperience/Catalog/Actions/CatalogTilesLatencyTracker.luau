local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.Experiments.AXCatalogPerfReduxReductionIXP);
return {
    StartTracking = v2.makeActionCreator("StartTracking", function(v4) --[[ Line: 17 ]]
        return {
            type = "StartTracking", 
            searchUuid = v4, 
            startTime = os.clock()
        };
    end), 
    PercievedTrackingStarted = v2.makeActionCreator("PercievedTrackingStarted", function() --[[ Line: 26 ]]
        return {
            type = "PercievedTrackingStarted", 
            startPerceivedTime = os.clock()
        };
    end), 
    EndTracking = v2.makeActionCreator("EndTracking", function(v5, v6) --[[ Line: 33 ]]
        return {
            type = "EndTracking", 
            searchUuid = v5, 
            endTime = v6
        };
    end), 
    AppendThumbnail = v2.makeActionCreator("AppendThumbnail", function(v7, v8) --[[ Line: 41 ]]
        return {
            type = "AppendThumbnail", 
            searchUuid = v7, 
            thumbnailId = v8
        };
    end), 
    SetLoadedThumbnail = v2.makeActionCreator("SetLoadedThumbnail", function(v9, v10) --[[ Line: 51 ]]
        return {
            type = "SetLoadedThumbnail", 
            searchUuid = v9, 
            thumbnailId = v10
        };
    end), 
    AppendThumbnails = v2.makeActionCreator("AppendThumbnails", function(v11) --[[ Line: 60 ]]
        -- upvalues: v3 (copy)
        if not v3.isEnabled() then
            return {};
        else
            return {
                type = "AppendThumbnails", 
                thumbnailsMap = v11
            };
        end;
    end), 
    SetLoadedThumbnails = v2.makeActionCreator("SetLoadedThumbnails", function(v12, v13) --[[ Line: 73 ]]
        -- upvalues: v3 (copy)
        if not v3.isEnabled() then
            return {};
        else
            return {
                type = "SetLoadedThumbnails", 
                searchUuid = v12, 
                thumbnailIds = v13
            };
        end;
    end)
};