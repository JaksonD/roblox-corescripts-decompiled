local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_OmniRecommendationsContentType_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).OmniRecommendationsContentType;
local l_AddContentMetadata_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Actions.Games.AddContentMetadata;
return v1.createReducer({}, {
    [l_AddContentMetadata_0.name] = function(v5, v6) --[[ Line: 17 ]]
        -- upvalues: l_OmniRecommendationsContentType_0 (copy), v2 (copy)
        v5 = v5 or {};
        if v6.contentMetadata[l_OmniRecommendationsContentType_0.GameCoPlay] then
            v5 = v2.Dictionary.join(v5, v6.contentMetadata[l_OmniRecommendationsContentType_0.GameCoPlay]);
        end;
        return v5;
    end
});