local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v2 = ("%*cloud/v2/avatar-marketplace-orders"):format(require(l_Parent_0.Http).Url.APIS_URL);
return function(v3) --[[ Line: 26 ]] --[[ Name: purchaseItems ]]
    -- upvalues: l_HttpService_0 (copy), v2 (copy)
    local v4 = l_HttpService_0:JSONEncode({
        purchasingUser = ("users/%*"):format(v3.userId), 
        context = {
            productSurface = "MARKETPLACE_UA", 
            lookId = v3.lookId
        }, 
        fulfillmentGroups = {
            {
                strategy = "BEST_EFFORT", 
                lineItems = v3.lineItems
            }
        }
    });
    local v5 = ("%*?idempotencyKey.key=%*"):format(v2, (l_HttpService_0:GenerateGUID(false)));
    return v3.networkImpl(v5, "POST", {
        postBody = v4
    });
end;