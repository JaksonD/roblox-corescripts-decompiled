local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local _ = require(l_script_FirstAncestor_0.Enums.HeadShape);
return v2.makeActionCreator(script.Name, function(v4) --[[ Line: 13 ]]
    return {
        headShape = v4
    };
end);