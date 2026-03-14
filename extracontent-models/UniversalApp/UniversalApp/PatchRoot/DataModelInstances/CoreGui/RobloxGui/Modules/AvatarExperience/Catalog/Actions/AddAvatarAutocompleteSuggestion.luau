local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v2, v3) --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    v1.isType(v2, "string", "Actions.AddAutocompleteSuggestion.prefix");
    v1.isType(v3, "table", "Actions.AddAutocompleteSuggestion.autocompleteSuggestions");
    return {
        prefix = v2, 
        autocompleteSuggestions = v3
    };
end);