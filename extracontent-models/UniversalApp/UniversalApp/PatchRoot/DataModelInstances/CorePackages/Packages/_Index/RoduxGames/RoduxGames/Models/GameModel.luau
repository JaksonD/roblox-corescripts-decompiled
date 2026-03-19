local l_Parent_0 = script:FindFirstAncestor("RoduxGames").Parent;
local v1 = require(l_Parent_0.t);
local v2 = require(script.Parent.CreatorModel);
local v3 = {};
v3.new = function(v4) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    assert(v3.isValid(v4));
    v3.__index = v3;
    setmetatable(v4, v3);
    return v4;
end;
v3.mock = function(v5) --[[ Line: 30 ]] --[[ Name: mock ]]
    -- upvalues: v3 (copy), v2 (copy)
    v5 = v5 or {};
    return (v3.new({
        experienceId = v5.experienceId or "experienceId", 
        name = v5.name or "name", 
        description = v5.description or "description", 
        price = v5.price or 666, 
        rootPlaceId = v5.rootPlaceId or "rootPlaceId", 
        creator = v2.mock(v5.creator), 
        maxPlayers = v5.maxPlayers or 6, 
        playing = v5.playing or 1000
    }));
end;
v3.format = function(v6) --[[ Line: 47 ]] --[[ Name: format ]]
    -- upvalues: v3 (copy), v2 (copy)
    return (v3.new({
        experienceId = tostring(v6.id), 
        name = v6.name, 
        description = v6.description or "", 
        price = v6.price or 0, 
        rootPlaceId = tostring(v6.rootPlaceId), 
        creator = v2.format(v6.creator), 
        maxPlayers = v6.maxPlayers, 
        playing = v6.playing
    }));
end;
v3.isValid = v1.strictInterface({
    experienceId = v1.string, 
    name = v1.string, 
    description = v1.string, 
    price = v1.number, 
    rootPlaceId = v1.string, 
    creator = v2.isValid, 
    maxPlayers = v1.number, 
    playing = v1.number
});
return v3;