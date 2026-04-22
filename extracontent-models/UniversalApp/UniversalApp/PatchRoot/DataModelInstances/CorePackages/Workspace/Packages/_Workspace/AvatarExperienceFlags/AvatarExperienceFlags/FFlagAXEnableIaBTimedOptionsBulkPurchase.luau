local l_game_EngineFeature_0 = game:GetEngineFeature("EconomyBulkPurchaseOptionsEnabled");
return game:DefineFastFlag("AXEnableIaBTimedOptionsBulkPurchase", false) and l_game_EngineFeature_0;