local l_CollectionService_0 = game:GetService("CollectionService");
local v1 = require(script.Parent.UnifiedEventLogConstants);
local v2 = {
    table = true, 
    string = true, 
    number = true, 
    boolean = true
};
return function(v3, v4, v5) --[[ Line: 18 ]]
    -- upvalues: l_CollectionService_0 (copy), v1 (copy), v2 (copy)
    if not v3.current then
        return;
    else
        l_CollectionService_0:AddTag(v3.current, v1.TAG_NAME);
        if v5 and v5.hasDeferredActions then
            v3.current:SetAttribute(v1.HAS_DEFERRED_ACTION, true);
        end;
        if v5 and v5.sessionTagName then
            v3.current:SetAttribute(v1.SESSION_TAG_NAME, v5.sessionTagName);
        end;
        if v4 then
            for v6, _ in v4 do
                if v2[type(v4[v6])] then
                    local v8 = if type(v4[v6]) == "table" then table.concat(v4[v6], ",") else v4[v6];
                    v3.current:SetAttribute(v1.ATTRIBUTE_PREFIX .. v6, v8);
                end;
            end;
        end;
        return;
    end;
end;