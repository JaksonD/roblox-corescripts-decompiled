local v0 = {
    FFlagUsePlaceInfoController = game:DefineFastFlag("UsePlaceInfoController2", false), 
    FFlagUseUniverseVotesController = game:DefineFastFlag("UseUniverseVotesController", false)
};
return {
    Actions = require(script.Actions), 
    Flags = v0, 
    Models = require(script.Models), 
    PlaceInfoController = if v0.FFlagUsePlaceInfoController then require(script.PlaceInfoController) else nil, 
    UniverseVotesController = if v0.FFlagUseUniverseVotesController then require(script.UniverseVotesController) else nil, 
    Reducers = require(script.Reducers), 
    Thunks = require(script.Thunks)
};