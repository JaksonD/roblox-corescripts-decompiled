local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserList");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v5 = require(script.Parent.UserRow);
local v6 = require(script.Parent.ContactRow);
return v2.memo(function(v7) --[[ Line: 37 ]] --[[ Name: EntityRow ]]
    -- upvalues: v2 (copy), v3 (copy), v6 (copy), v5 (copy)
    local l_entity_0 = v7.entity;
    local v9 = v2.useCallback(function() --[[ Line: 40 ]]
        -- upvalues: v7 (copy), l_entity_0 (copy)
        if v7.onActivated then
            v7.onActivated(l_entity_0.id, l_entity_0.type);
        end;
    end, {
        v7.onActivated, 
        l_entity_0.id, 
        l_entity_0.type
    });
    local v10 = if v7.layoutMode == v3.LayoutMode.Horizontal then v3.RowLayoutMode.Compact else v3.RowLayoutMode.Wide;
    if l_entity_0.type == v3.EntityType.Contact then
        return v2.createElement(v6, {
            entityId = l_entity_0.id, 
            layoutMode = v10, 
            onActivated = v9, 
            layoutOrder = v7.layoutOrder, 
            primaryCta = v7.primaryCta, 
            secondaryCta = v7.secondaryCta, 
            contextualInfo = v7.contextualInfo, 
            loadingState = v7.loadingState, 
            trailingContent = v7.trailingContent, 
            configs = v7.configs
        });
    else
        return v2.createElement(v5, {
            entityId = l_entity_0.id, 
            layoutMode = v10, 
            onActivated = v9, 
            primaryCta = v7.primaryCta, 
            secondaryCta = v7.secondaryCta, 
            contextualInfo = v7.contextualInfo, 
            layoutOrder = v7.layoutOrder, 
            loadingState = v7.loadingState, 
            presence = v7.presence, 
            trailingContent = v7.trailingContent, 
            configs = v7.configs
        });
    end;
end);