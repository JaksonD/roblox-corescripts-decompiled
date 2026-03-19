local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.tutils);
local v3 = require(script.Parent.InventoryItemCard);
local v4 = require(script.Parent.useInventoryItemCardProps);
local v5 = game:DefineFastFlag("AXInventoryItemCardPerf", false);
return v1.memo(function(v6) --[[ Line: 15 ]] --[[ Name: InventoryItemCardContainer ]]
    -- upvalues: v4 (copy), v1 (copy), v3 (copy)
    local v7 = v4(v6);
    return v1.createElement(v3, v7);
end, if v5 then v2.deepEqual else nil);