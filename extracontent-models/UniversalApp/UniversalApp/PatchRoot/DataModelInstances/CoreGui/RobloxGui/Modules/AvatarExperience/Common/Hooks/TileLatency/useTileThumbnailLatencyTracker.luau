local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.Common.Hooks.TileLatency.useTileLoadingLatencyInitializer);
local l_FFlagAXDisableOrganicThumbnailLatencyWhenWidgetsEnabled_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDisableOrganicThumbnailLatencyWhenWidgetsEnabled;
return function(v5, v6) --[[ Line: 16 ]] --[[ Name: useTileThumbnailLatencyTracker ]]
    -- upvalues: v3 (copy), v2 (copy), l_FFlagAXDisableOrganicThumbnailLatencyWhenWidgetsEnabled_0 (copy)
    local v7 = v3(v5);
    v2.useEffect(function() --[[ Line: 19 ]]
        -- upvalues: l_FFlagAXDisableOrganicThumbnailLatencyWhenWidgetsEnabled_0 (ref), v6 (copy), v7 (copy)
        if l_FFlagAXDisableOrganicThumbnailLatencyWhenWidgetsEnabled_0 and v6 == false then
            return;
        elseif v7.trackerLoadedThumbnails == nil then
            return;
        elseif v7.prevImpressionResults == v7.trackerLoadedThumbnails then
            return;
        else
            local v8 = false;
            for _, v10 in v7.trackerLoadedThumbnails do
                if v10 == true then
                    v8 = true;
                    break;
                end;
            end;
            if not v8 or not v7.trackerStartTime then
                return;
            else
                if v8 and not v7.trackerEndTime then
                    v7.fireTileLoadingLatencyTracker(v7, true);
                end;
                return;
            end;
        end;
    end, {
        v5, 
        v7.currentPageName, 
        v7.trackerLoadedThumbnails, 
        v7.trackerStartTime, 
        v7.trackerEndTime, 
        v7.coldStart, 
        v7.currentCategory, 
        v7.currentSubcategory, 
        if l_FFlagAXDisableOrganicThumbnailLatencyWhenWidgetsEnabled_0 then v6 else nil
    });
end;