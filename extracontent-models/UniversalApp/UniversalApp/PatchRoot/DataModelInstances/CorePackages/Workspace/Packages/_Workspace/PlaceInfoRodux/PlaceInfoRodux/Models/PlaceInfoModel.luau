return {
    new = function() --[[ Line: 3 ]] --[[ Name: new ]]
        return {};
    end, 
    fromWeb = function(v0) --[[ Line: 9 ]] --[[ Name: fromWeb ]]
        local v1 = v0 or {};
        v1.placeId = tostring(v1.placeId);
        return v1;
    end
};