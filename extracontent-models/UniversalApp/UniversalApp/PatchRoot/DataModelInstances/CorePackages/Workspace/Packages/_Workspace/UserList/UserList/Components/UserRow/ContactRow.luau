local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserList");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local _ = require(l_script_FirstAncestor_0.Common.Enums);
local v5 = require(script.Parent.BaseRow);
local v6 = require(l_script_FirstAncestor_0.Hooks.useContactsData);
return v2.memo(function(v7) --[[ Line: 34 ]] --[[ Name: ContactRow ]]
    -- upvalues: v6 (copy), v2 (copy), v5 (copy)
    local v8 = v6(v7.entityId);
    if v8 == nil then
        return nil;
    else
        local v9 = if v7.loadingState and v7.loadingState.title ~= nil then v7.loadingState.title else v8.isLoading;
        local v10 = v7.loadingState and v7.loadingState.contextualInfo;
        return v2.createElement(v5, {
            avatarThumbnailUrl = v8.avatarThumbnailUrl, 
            title = v8.name, 
            layoutMode = v7.layoutMode, 
            onActivated = v7.onActivated, 
            isTitleLoading = v9, 
            isContextualInfoLoading = v10, 
            contextualInfo = v7.contextualInfo, 
            primaryCta = v7.primaryCta, 
            secondaryCta = v7.secondaryCta, 
            trailingContent = v7.trailingContent, 
            layoutOrder = v7.layoutOrder
        });
    end;
end);