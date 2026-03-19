return function(v0, v1, v2) --[[ Line: 4 ]]
    assert(type(v1) == "string", "Expected eventContext to be a string");
    assert(type(v2) == "number", "Expected badgeCount to be a number");
    v0:setRBXEventStream(v1, "partyTabBadgeClick", {
        badgeCount = v2
    });
end;