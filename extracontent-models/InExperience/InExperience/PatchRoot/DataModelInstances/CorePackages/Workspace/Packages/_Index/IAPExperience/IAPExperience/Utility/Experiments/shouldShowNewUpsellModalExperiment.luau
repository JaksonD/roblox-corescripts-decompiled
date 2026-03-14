local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Flags.FFlagNewUpsellModalExperiment);
local v2 = game:DefineFastFlag("NewUpsellModalExperimentForPlatform", false);
return function() --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1 or v2;
end;