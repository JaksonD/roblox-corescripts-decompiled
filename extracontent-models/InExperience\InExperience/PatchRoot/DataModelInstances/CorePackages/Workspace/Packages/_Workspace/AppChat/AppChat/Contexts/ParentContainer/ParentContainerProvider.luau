local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.ParentContainerContext);
return function(v3) --[[ Line: 11 ]] --[[ Name: ParentContainerProvider ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.Provider, {
        value = {
            getParentContainer = v3.getParentContainer, 
            visibilitySignal = v3.visibilitySignal, 
            getShouldSetAppChatVisible = v3.getShouldSetAppChatVisible, 
            entryPoint = v3.entryPoint, 
            hideParentContainer = v3.hideParentContainer, 
            showParentContainer = v3.showParentContainer, 
            updateCurrentSquadId = v3.updateCurrentSquadId
        }
    }, v3.children);
end;