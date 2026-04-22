local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent;
local v2 = require(script.Parent.UnifiedEventLogConstants);
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents;
local v4 = {
    table = true, 
    string = true, 
    number = true, 
    boolean = true
};
return function(v5, v6, v7) --[[ Line: 23 ]]
    -- upvalues: l_CollectionService_0 (copy), v2 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), v4 (copy)
    if not v5.current then
        return;
    else
        l_CollectionService_0:AddTag(v5.current, v2.TAG_NAME);
        if v7 and v7.hasDeferredActions then
            v5.current:SetAttribute(v2.HAS_DEFERRED_ACTION, true);
        end;
        if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 and v7 and v7.isSelected ~= nil then
            v5.current:SetAttribute(v2.IS_SELECTED, v7.isSelected);
        end;
        if v7 and v7.sessionTagName then
            v5.current:SetAttribute(v2.SESSION_TAG_NAME, v7.sessionTagName);
        end;
        if v6 then
            for v8, _ in v6 do
                if v4[type(v6[v8])] then
                    local v10 = if type(v6[v8]) == "table" then table.concat(v6[v8], ",") else v6[v8];
                    v5.current:SetAttribute(v2.ATTRIBUTE_PREFIX .. v8, v10);
                end;
            end;
        end;
        return;
    end;
end;