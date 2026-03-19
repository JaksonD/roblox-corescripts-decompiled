local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Actions.AddAvatarAutocompleteSuggestion);
return (require(l_CorePackages_0.Packages.Rodux).createReducer({}, {
    [v3.name] = function(v4, v5) --[[ Line: 24 ]]
        -- upvalues: v2 (copy)
        return (v2.Dictionary.join(v4, {
            [v5.prefix] = v5.autocompleteSuggestions
        }));
    end
}));