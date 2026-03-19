local l_CollectionService_0 = game:GetService("CollectionService");
local v1 = require(script.Parent.Constants);
return {
    AddTag = function(v2, v3, v4) --[[ Line: 4 ]]
        -- upvalues: v1 (copy), l_CollectionService_0 (copy)
        local v5 = v2 and v2.current or nil;
        if v3 and v5 then
            if v4 then
                v5:SetAttribute(v1.ItemIndex, v4);
                if not l_CollectionService_0:HasTag(v5, v3) then
                    l_CollectionService_0:AddTag(v5, v3);
                    return;
                end;
            else
                warn("addTag: impression instance not tagged, missing index");
            end;
        end;
    end, 
    RemoveTag = function(v6, v7, v8) --[[ Line: 18 ]]
        -- upvalues: v1 (copy), l_CollectionService_0 (copy)
        local v9 = v6 and v6.current or nil;
        if v7 and v9 then
            if v8 then
                v9:SetAttribute(v1.ItemIndex, nil);
            end;
            l_CollectionService_0:RemoveTag(v9, v7);
        end;
    end
};