local v0 = require(script.Parent.FFlagDynamicHeadsMigration);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableFacsDisableOverride2");
return v0 and l_game_EngineFeature_0 and game:DefineFastFlag("HeadRefinementFacialAnimationToggle4", false);