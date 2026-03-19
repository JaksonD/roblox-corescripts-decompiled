return {
    mock = function() --[[ Line: 11 ]] --[[ Name: mock ]]
        return {
            taxRate = 0.3, 
            minimumFee = 1
        };
    end, 
    fromGetResaleTaxRate = function(v0) --[[ Line: 20 ]] --[[ Name: fromGetResaleTaxRate ]]
        return {
            taxRate = v0.taxRate, 
            minimumFee = v0.minimumFee
        };
    end
};