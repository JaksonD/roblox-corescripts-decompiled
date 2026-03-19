local l_CorePackages_0 = game:GetService("CorePackages");
local l_makeActionCreator_0 = require(l_CorePackages_0.Packages.Rodux).makeActionCreator;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return l_makeActionCreator_0(script.Name, function(v3, v4) --[[ Line: 5 ]]
    -- upvalues: v2 (copy)
    v2.isType(v3, "string", "Actions.AddAutocompleteSuggestion.prefix");
    v2.isType(v4, "table", "Actions.AddAutocompleteSuggestion.autocompleteSuggestion");
    return {
        prefix = v3, 
        autocompleteSuggestion = v4
    };
end);