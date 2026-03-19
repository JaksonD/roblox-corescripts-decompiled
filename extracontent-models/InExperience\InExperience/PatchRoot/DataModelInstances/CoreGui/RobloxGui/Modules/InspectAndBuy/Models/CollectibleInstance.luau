return {
    new = function() --[[ Line: 13 ]] --[[ Name: new ]]
        return {};
    end, 
    fromGetCollectibleItemInstances = function(v0) --[[ Line: 19 ]] --[[ Name: fromGetCollectibleItemInstances ]]
        return {
            collectibleInstanceId = v0.collectibleInstanceId, 
            collectibleItemId = v0.collectibleItemId, 
            collectibleProductId = v0.collectibleProductId, 
            serialNumber = v0.serialNumber, 
            instanceState = v0.instanceState, 
            saleState = v0.saleState, 
            price = v0.price
        };
    end
};