local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Types);
local v4 = require(l_Modules_0.AvatarExperience.Common.Hooks.TileLatency.useTileLoadingLatencyInitializer);
local l_usePrevious_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.usePrevious;
local v6 = game:DefineFastFlag("AXFixOrganicTTILogging", false);
return function(v7, v8, v9) --[[ Line: 16 ]] --[[ Name: useTileLatencyTracker ]]
    -- upvalues: v4 (copy), l_usePrevious_0 (copy), v2 (copy), v6 (copy)
    local v10 = v4(v7);
    local v11 = l_usePrevious_0(v8);
    local v12, v13 = v2.useState(v10.currentCategory);
    local v14, v15 = v2.useState(v10.currentSubcategory);
    v2.useEffect(function() --[[ Line: 26 ]]
        -- upvalues: v9 (copy), v10 (copy)
        if not v9 or not v10 then
            return;
        else
            v10.fireTileLoadingLatencyTracker(v10, nil, true);
            return;
        end;
    end, {
        v9
    });
    v2.useEffect(function() --[[ Line: 34 ]]
        -- upvalues: v8 (copy), v10 (copy), v11 (copy), v12 (copy), v14 (copy), v6 (ref), v13 (copy), v15 (copy)
        if not v8 or #v8 == 0 then
            return;
        else
            if v10.trackerStartTime ~= nil and #v8 > 0 and v11 ~= v8 and (v12 ~= v10.currentCategory or v14 ~= v10.currentSubcategory or v6 and (not v11 or #v11 == 0)) then
                v10.fireTileLoadingLatencyTracker(v10);
            end;
            v13(v10.currentCategory);
            v15(v10.currentSubcategory);
            return;
        end;
    end, {
        v10.currentPageName, 
        v7, 
        v10.trackerStartTime, 
        v10.currentCategory, 
        v10.currentSubcategory, 
        v8, 
        v12
    });
end;