local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local l_React_0 = v1.React;
local v4 = require(l_Parent_0.Components.PYMKCarouselUserTile.usePYMKCarouselUserButtons);
local l_EntityType_0 = require(l_Parent_1.UserList).Enums.EntityType;
return function(v6) --[[ Line: 20 ]] --[[ Name: usePrimaryCta ]]
    -- upvalues: v4 (copy), l_EntityType_0 (copy), l_React_0 (copy)
    local v7 = v4({
        userId = v6.entityId, 
        showToast = v6.showToast, 
        fireAnalyticsEvent = v6.fireAnalyticsEvent, 
        absolutePosition = v6.absolutePosition, 
        contactId = if v6.entityType == l_EntityType_0.Contact then v6.entityId else nil
    });
    return l_React_0.useMemo(function() --[[ Line: 29 ]]
        -- upvalues: v7 (copy)
        local v8 = v7()[1];
        if not v8 then
            return nil;
        else
            return {
                type = v8.buttonType, 
                onActivated = v8.onActivated, 
                isDisabled = v8.isDisabled, 
                isLoading = v8.isLoading, 
                icon = nil, 
                focusEventName = v8.focusEvent, 
                disabledReason = nil
            };
        end;
    end, {
        v7
    });
end;