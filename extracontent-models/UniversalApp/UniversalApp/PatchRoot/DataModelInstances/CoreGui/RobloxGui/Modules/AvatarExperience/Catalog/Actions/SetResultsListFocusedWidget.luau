local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v2, v3, v4) --[[ Line: 17 ]]
    -- upvalues: v1 (copy)
    v1.isTypeOrNil(v3, "string", "focusedWidgetId expects widget.id");
    v1.isNotNil(v4, "focusedWidgetTemplate");
    return {
        searchUuid = v2, 
        id = v3, 
        title = v4.title, 
        description = v4.description, 
        localizedTitle = v4.localizedTitle, 
        localizedDescription = v4.localizedDescription, 
        localizedTooltip = v4.localizedTooltip, 
        tooltip = v4.tooltip
    };
end);