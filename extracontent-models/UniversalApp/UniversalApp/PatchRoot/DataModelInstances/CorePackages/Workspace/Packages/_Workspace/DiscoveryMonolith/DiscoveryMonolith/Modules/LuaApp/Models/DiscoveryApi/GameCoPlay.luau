local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.Result);
local v2 = {
    new = function() --[[ Line: 31 ]] --[[ Name: new ]]
        return {};
    end
};
v2.mock = function() --[[ Line: 37 ]] --[[ Name: mock ]]
    -- upvalues: v2 (copy)
    local v3 = v2.new();
    v3.rootPlaceId = tostring(12345);
    v3.name = "Racing Game";
    v3.thumbnailAssetId = tostring(4948327354);
    v3.coplayUsers = {
        {
            userId = tostring(4340043999), 
            userDisplayName = "Mr Mittens"
        }
    };
    return v3;
end;
v2.fromJsonData = function(v4) --[[ Line: 53 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v5 = v2.new();
    v5.rootPlaceId = tostring(v4.rootPlaceId);
    v5.name = v4.name;
    v5.thumbnailAssetId = tostring(v4.thumbnailAssetId);
    local v6 = {};
    for v7 = 1, #v4.coplayUsers do
        local v8 = v4.coplayUsers[v7];
        table.insert(v6, {
            userId = tostring(v8.userId), 
            userDisplayName = v8.userDisplayName
        });
    end;
    v5.coplayUsers = v6;
    return v1.success(v5);
end;
return v2;