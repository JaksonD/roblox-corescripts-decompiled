return function(v0, v1) --[[ Line: 1 ]]
    assert(type(v1) == "string", "Expected placeId to be a string");
    v0:setRBXEventStream("PlacesList", "openModalFromGameTile", {
        placeId = v1
    });
end;