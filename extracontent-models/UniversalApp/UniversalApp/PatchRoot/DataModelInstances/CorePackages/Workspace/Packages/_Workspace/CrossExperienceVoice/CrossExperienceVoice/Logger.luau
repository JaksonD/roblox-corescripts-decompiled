local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local v1 = require(l_script_FirstAncestor_0.dependencies).Lumberyak.Logger.new(nil, "CrossExperienceVoice");
v1:addSink({
    maxLevel = v1.Levels.Info, 
    log = function(_, v3, _) --[[ Line: 10 ]] --[[ Name: log ]]
        print(v3);
    end
});
return v1;