local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
require(l_CorePackages_0.Packages.UIBlox).init(require(l_CorePackages_0.Workspace.Packages.RobloxAppUIBloxConfig));
v1.setGlobalConfig({
    elementTracing = true, 
    propValidation = true
});
return {
    roact = v1, 
    mapStory = function(v2) --[[ Line: 14 ]] --[[ Name: mapStory ]]
        -- upvalues: v1 (copy)
        return function(v3) --[[ Line: 15 ]]
            -- upvalues: v1 (ref), v2 (copy)
            return v1.createElement(v2, v3);
        end;
    end
};