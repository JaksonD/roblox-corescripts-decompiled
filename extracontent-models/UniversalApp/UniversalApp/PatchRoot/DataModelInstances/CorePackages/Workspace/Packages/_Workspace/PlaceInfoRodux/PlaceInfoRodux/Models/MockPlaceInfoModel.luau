local l_Parent_0 = script:FindFirstAncestor("PlaceInfoRodux").Parent;
local l_GenerateStringId_0 = require(l_Parent_0.AppCommonLib).GenerateStringId;
local v2 = require(script.Parent.PlaceInfoModel);
local v4 = {
    mock = function() --[[ Line: 11 ]] --[[ Name: mock ]]
        -- upvalues: v2 (copy), l_GenerateStringId_0 (copy)
        local v3 = v2.new();
        v3.builder = "builder";
        v3.builderId = l_GenerateStringId_0();
        v3.description = "description";
        v3.imageToken = l_GenerateStringId_0();
        v3.isPlayable = true;
        v3.name = "name";
        v3.placeId = l_GenerateStringId_0();
        v3.price = 0;
        v3.reasonProhibited = nil;
        v3.universeId = l_GenerateStringId_0();
        v3.universeRootPlaceId = l_GenerateStringId_0();
        v3.url = "url";
        return v3;
    end
};
setmetatable(v4, {
    __index = v2
});
return v4;