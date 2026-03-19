local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Types);
local v4 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableWidgetsTTI);
local v5 = require(l_Modules_0.AvatarExperience.Common.Hooks.TileLatency.useTileLoadingLatencyInitializer);
local l_usePrevious_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.usePrevious;
local v7 = game:DefineFastFlag("AXFixOrganicTTILogging", false);
return function(v8, v9, v10) --[[ Line: 17 ]] --[[ Name: useTileLatencyTracker ]]
    -- upvalues: v5 (copy), l_usePrevious_0 (copy), v2 (copy), v4 (copy), v7 (copy)
    local v11 = v5(v8);
    local v12 = l_usePrevious_0(v9);
    local v13, v14 = v2.useState(v11.currentCategory);
    local v15, v16 = v2.useState(v11.currentSubcategory);
    if v4() then
        v2.useEffect(function() --[[ Line: 28 ]]
            -- upvalues: v10 (copy), v11 (copy)
            if not v10 or not v11 then
                return;
            else
                v11.fireTileLoadingLatencyTracker(v11, nil, true);
                return;
            end;
        end, {
            v10
        });
    end;
    v2.useEffect(function() --[[ Line: 37 ]]
        -- upvalues: v9 (copy), v11 (copy), v12 (copy), v13 (copy), v15 (copy), v7 (ref), v14 (copy), v16 (copy)
        if not v9 or #v9 == 0 then
            return;
        else
            if v11.trackerStartTime ~= nil and #v9 > 0 and v12 ~= v9 and (v13 ~= v11.currentCategory or v15 ~= v11.currentSubcategory or v7 and (not v12 or #v12 == 0)) then
                v11.fireTileLoadingLatencyTracker(v11);
            end;
            v14(v11.currentCategory);
            v16(v11.currentSubcategory);
            return;
        end;
    end, {
        v11.currentPageName, 
        v8, 
        v11.trackerStartTime, 
        v11.currentCategory, 
        v11.currentSubcategory, 
        v9, 
        v13
    });
end;