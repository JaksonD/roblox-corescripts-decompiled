local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxGames");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.t);
local l_CreatorType_0 = require(l_script_FirstAncestor_0.Enums).CreatorType;
local v4 = {};
v4.new = function(v5) --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    assert(v4.isValid(v5));
    v4.__index = v4;
    setmetatable(v5, v4);
    return v5;
end;
v4.mock = function(v6) --[[ Line: 27 ]] --[[ Name: mock ]]
    -- upvalues: v4 (copy), l_CreatorType_0 (copy)
    v6 = v6 or {};
    return (v4.new({
        creatorId = v6.creatorId or "creatorId", 
        creatorName = v6.creatorName or "creatorName", 
        creatorType = v6.creatorType or l_CreatorType_0.User
    }));
end;
v4.format = function(v7) --[[ Line: 39 ]] --[[ Name: format ]]
    -- upvalues: v4 (copy), l_CreatorType_0 (copy)
    return (v4.new({
        creatorId = tostring(v7.id), 
        creatorName = v7.name, 
        creatorType = l_CreatorType_0.fromRawValue(v7.type)
    }));
end;
v4.isValid = v2.strictInterface({
    creatorId = v2.string, 
    creatorName = v2.string, 
    creatorType = v2.userdata
});
return v4;