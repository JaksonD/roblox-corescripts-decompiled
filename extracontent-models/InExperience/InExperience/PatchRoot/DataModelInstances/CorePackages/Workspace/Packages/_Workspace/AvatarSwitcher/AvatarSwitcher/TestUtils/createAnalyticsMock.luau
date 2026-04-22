local l_Parent_0 = script:FindFirstAncestor("AvatarSwitcher").Parent;
local l_jest_0 = require(l_Parent_0.Dev.JestGlobals).jest;
return function() --[[ Line: 7 ]] --[[ Name: createAnalyticsMock ]]
    -- upvalues: l_jest_0 (copy)
    local v2 = l_jest_0.fn();
    return {
        addUnifiedEventLogging = v2, 
        sendAXCounterV2 = l_jest_0.fn(), 
        useUnifiedEventListener = {
            useUnifiedEventListenerInExperience = l_jest_0.fn()
        }, 
        UnifiedEventLogEnums = {
            MarketplaceUnifiedAction = {
                UI_ELEMENT_CLICK = "UI_ELEMENT_CLICK"
            }
        }
    }, v2;
end;