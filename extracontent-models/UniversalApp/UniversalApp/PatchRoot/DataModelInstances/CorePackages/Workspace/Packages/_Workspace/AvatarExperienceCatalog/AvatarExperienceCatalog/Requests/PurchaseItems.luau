local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v2 = require(l_Parent_0.Http);
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents;
local v4 = ("%*cloud/v2/avatar-marketplace-orders"):format(v2.Url.APIS_URL);
return function(v5) --[[ Line: 29 ]] --[[ Name: purchaseItems ]]
    -- upvalues: l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), l_HttpService_0 (copy), v4 (copy)
    local v6 = {};
    if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
        if v5.lookId then
            table.insert(v6, v5.lookId);
        end;
        if v5.makeupLookId then
            table.insert(v6, v5.makeupLookId);
        end;
    end;
    local v7 = l_HttpService_0:JSONEncode({
        purchasingUser = ("users/%*"):format(v5.userId), 
        context = {
            productSurface = "MARKETPLACE_UA", 
            lookId = v5.lookId, 
            lookContext = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then {
                lookIds = v6
            } else nil
        }, 
        fulfillmentGroups = {
            {
                strategy = "BEST_EFFORT", 
                lineItems = v5.lineItems
            }
        }
    });
    local v8 = ("%*?idempotencyKey.key=%*"):format(v4, (l_HttpService_0:GenerateGUID(false)));
    return v5.networkImpl(v8, "POST", {
        postBody = v7
    });
end;