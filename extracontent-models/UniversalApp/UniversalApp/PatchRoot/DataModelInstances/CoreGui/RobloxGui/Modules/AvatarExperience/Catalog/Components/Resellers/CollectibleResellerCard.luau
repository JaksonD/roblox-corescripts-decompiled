local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Components.ResellerCard);
local v6 = v3.PureComponent:extend("CollectibleResellerCard");
v6.render = function(v7) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v5 (copy)
    local l_collectibleInstance_0 = v7.props.collectibleInstance;
    if not l_collectibleInstance_0 then
        return;
    else
        return v3.createElement(v5, {
            LayoutOrder = v7.props.LayoutOrder, 
            itemId = v7.props.itemId, 
            itemType = v7.props.itemType, 
            itemPrice = l_collectibleInstance_0.price, 
            productId = l_collectibleInstance_0.collectibleProductId, 
            sellerId = tostring(l_collectibleInstance_0.seller.sellerId), 
            sellerName = l_collectibleInstance_0.seller.name, 
            sellerHasVerifiedBadge = l_collectibleInstance_0.seller.hasVerifiedBadge, 
            serialNumber = l_collectibleInstance_0.serialNumber, 
            hasDivider = v7.props.hasDivider, 
            horizontalPadding = v7.props.horizontalPadding, 
            focusController = v7.props.focusController, 
            collectibleInstanceId = l_collectibleInstance_0.collectibleInstanceId
        });
    end;
end;
return v4.connect(function(v9, v10) --[[ Line: 40 ]]
    local l_CollectiblesResellersInstances_0 = v9.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances;
    local v12 = if v10.collectibleItemId then l_CollectiblesResellersInstances_0[v10.collectibleItemId] else nil;
    return {
        collectibleInstance = if v12 and v10.collectibleInstanceId then v12.Instances[v10.collectibleInstanceId] else nil
    };
end)(v6);