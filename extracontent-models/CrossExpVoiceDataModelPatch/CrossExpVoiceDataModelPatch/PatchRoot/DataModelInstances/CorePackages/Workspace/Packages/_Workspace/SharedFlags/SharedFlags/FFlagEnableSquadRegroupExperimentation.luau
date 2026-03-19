local v0 = require(script.Parent.FFlagForceEnableSquadRegroup);
local v1 = game:DefineFastFlag("EnableSquadRegroupExperimentation1", false);
local v2 = require(script.Parent.FFlagEnableSquadRegroupExperimentationSmallScreenFix);
return v0 or v1 or v2;