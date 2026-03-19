return {
    extractFieldsFromGameEntry = function(v0) --[[ Line: 6 ]]
        if not v0 then
            return {};
        else
            local l_universeId_0 = v0.universeId;
            local l_placeId_0 = v0.placeId;
            return {
                universeId = l_universeId_0, 
                placeId = l_placeId_0
            };
        end;
    end
};