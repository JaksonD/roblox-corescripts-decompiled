local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Lumberyak).Logger.new(nil, "Authentication");
v1:addSink({
    maxLevel = v1.Levels.Warning, 
    log = function(_, v3, _) --[[ Line: 9 ]] --[[ Name: log ]]
        print(v3);
    end
});
return v1;