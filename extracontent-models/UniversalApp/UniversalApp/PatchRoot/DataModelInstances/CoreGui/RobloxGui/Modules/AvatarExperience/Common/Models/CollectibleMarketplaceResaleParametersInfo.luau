return {
    mock = function() --[[ Line: 13 ]] --[[ Name: mock ]]
        return {
            resalePercentageFee = 30, 
            minimumFee = 1, 
            priceFloor = 0
        };
    end, 
    fromGetCollectibleMarketplaceResaleParameters = function(v0, _) --[[ Line: 23 ]] --[[ Name: fromGetCollectibleMarketplaceResaleParameters ]]
        return {
            resalePercentageFee = v0.resalePercentageFee, 
            minimumFee = v0.minimumFee, 
            priceFloor = v0.priceFloor
        };
    end
};