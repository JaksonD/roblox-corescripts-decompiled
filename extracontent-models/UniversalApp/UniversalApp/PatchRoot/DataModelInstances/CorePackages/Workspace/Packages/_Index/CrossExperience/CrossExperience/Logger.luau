local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local l_Lumberyak_0 = require(l_script_FirstAncestor_0.dependencies).Lumberyak;
local v2 = l_Lumberyak_0.Logger.new(nil, "CrossExperience");
v2:addSink({
    maxLevel = game:DefineFastString("CrossExpEventLoggingLevel", l_Lumberyak_0.Logger.Levels.Warning), 
    log = function(_, v4, _) --[[ Line: 13 ]] --[[ Name: log ]]
        print(v4);
    end
});
return v2;