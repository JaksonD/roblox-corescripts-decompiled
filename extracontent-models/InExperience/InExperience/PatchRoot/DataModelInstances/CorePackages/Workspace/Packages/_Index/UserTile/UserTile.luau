local v0 = game:DefineFastFlag("UserTileAddDataHydrationWrapper", false);
return {
    ["jest.config"] = script["jest.config"], 
    UserTileEventHandlers = require(script.Components.UserTileEventHandlers), 
    UserTile = if v0 then require(script.UserTileEntry.UserTileContainer) else require(script.Components.UserTile), 
    LayoutMode = require(script.Enums.LayoutMode)
};