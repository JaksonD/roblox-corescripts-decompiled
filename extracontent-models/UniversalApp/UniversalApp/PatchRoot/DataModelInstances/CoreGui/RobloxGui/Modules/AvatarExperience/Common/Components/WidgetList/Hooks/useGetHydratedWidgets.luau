local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Utils.getHydratedWidgetItems);
return function(v5) --[[ Line: 34 ]] --[[ Name: useHydratedWidgetItems ]]
    -- upvalues: v3 (copy), v4 (copy)
    return (v3.useMemo(function() --[[ Line: 35 ]]
        -- upvalues: v4 (ref), v5 (copy)
        return v4(v5);
    end, {
        v5.hydratedWidgetData, 
        v5.widgetInfoDetails, 
        v5.selectedWidgetIndex
    }));
end;