local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_SessionType_0 = require(l_Parent_0.RobloxAppSessionization).SessionType;
return {
    generateUuid = function() --[[ Line: 8 ]]
        -- upvalues: l_HttpService_0 (copy)
        return l_HttpService_0:GenerateGUID(true);
    end, 
    create = function(v3, v4, v5, v6, v7, v8) --[[ Line: 12 ]]
        -- upvalues: l_SessionType_0 (copy)
        local v9 = true;
        if v3:SessionExists(l_SessionType_0.StructuralIdentifier.OmniSearch) and v3:GetMetadata(l_SessionType_0.StructuralIdentifier.OmniSearch, l_SessionType_0.Metadata.OmniSearch.OmniSearchUuid) == v4 then
            v9 = false;
        end;
        if v9 then
            v3:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.OmniSearch, l_SessionType_0.StructuralIdentifier.OmniSearch);
            v3:SetMetadata(l_SessionType_0.StructuralIdentifier.OmniSearch, l_SessionType_0.Metadata.OmniSearch.OmniSearchUuid, v4);
        end;
        v3:SetMetadata(l_SessionType_0.StructuralIdentifier.OmniSearch, l_SessionType_0.Metadata.OmniSearch.SearchKeyword, v5);
        v3:SetMetadata(l_SessionType_0.StructuralIdentifier.OmniSearch, l_SessionType_0.Metadata.OmniSearch.SearchType, v6);
        v3:SetMetadata(l_SessionType_0.StructuralIdentifier.OmniSearch, l_SessionType_0.Metadata.OmniSearch.SearchTabUuid, v7);
        v3:SetMetadata(l_SessionType_0.StructuralIdentifier.OmniSearch, l_SessionType_0.Metadata.OmniSearch.SearchSourceEvent, v8);
    end, 
    updateSearchType = function(v10, v11, v12, v13) --[[ Line: 63 ]]
        -- upvalues: l_SessionType_0 (copy)
        if v10:SessionExists(l_SessionType_0.StructuralIdentifier.OmniSearch) then
            v10:SetMetadata(l_SessionType_0.StructuralIdentifier.OmniSearch, l_SessionType_0.Metadata.OmniSearch.SearchType, v11);
            if v12 then
                v10:SetMetadata(l_SessionType_0.StructuralIdentifier.OmniSearch, l_SessionType_0.Metadata.OmniSearch.SearchTabUuid, v12);
            end;
            v10:SetMetadata(l_SessionType_0.StructuralIdentifier.OmniSearch, l_SessionType_0.Metadata.OmniSearch.SearchSourceEvent, v13);
        end;
    end
};