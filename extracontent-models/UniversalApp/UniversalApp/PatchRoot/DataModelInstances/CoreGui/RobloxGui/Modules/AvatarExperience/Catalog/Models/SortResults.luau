local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v3 = {
    new = function() --[[ Line: 36 ]] --[[ Name: new ]]
        return {
            items = {}
        };
    end
};
v3.mock = function() --[[ Line: 44 ]] --[[ Name: mock ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v4 = v3.new();
    v4.items = {
        {
            id = "123", 
            type = v2.ItemType.Asset
        }
    };
    v4.keyword = "";
    v4.previousPageCursor = "";
    v4.nextPageCursor = "";
    return v4;
end;
v3.fromSearchItemsDetails = function(v5) --[[ Line: 62 ]] --[[ Name: fromSearchItemsDetails ]]
    -- upvalues: v3 (copy)
    local v6 = v3.new();
    v6.items = {};
    for _, v8 in v5.data do
        table.insert(v6.items, {
            id = tostring(v8.id), 
            type = v8.itemType, 
            productId = tostring(v8.productId)
        });
    end;
    v6.keyword = v5.keyword;
    v6.previousPageCursor = v5.previousPageCursor;
    v6.nextPageCursor = v5.nextPageCursor;
    return v6;
end;
return v3;