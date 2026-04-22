local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceTimedOptions");
local v1 = require(script.Parent.useWearTimeSelectedOptionViewModel);
local v2 = require(script.Parent.WearTimeSelectedOptionView);
local _ = require(l_script_FirstAncestor_0.Types.TimedOptionType);
return function(v4) --[[ Line: 18 ]] --[[ Name: WearTimeSelectedOptionContainer ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v5 = v1(v4);
    return v2(v5);
end;