local v0 = require(script.Parent.GetFFlagIsSquadEnabled);
return game:GetEngineFeature("PrivatePartyJoin") and v0() and game:DefineFastFlag("EnablePrivatePartyAcceptInvite", false);