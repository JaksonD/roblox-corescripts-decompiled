local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Lumberyak).Logger.new(nil, "PlayabilityRodux");
v1:addSink({
    maxLevel = v1.Levels.Warning, 
    log = function(_, v3, _) --[[ Line: 10 ]] --[[ Name: log ]]
        print(v3);
    end
});
return v1;