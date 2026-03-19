local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.SocialCommon);
return v1.createContext({
    getParentContainer = function() --[[ Line: 18 ]] --[[ Name: getParentContainer ]]
        return nil;
    end, 
    visibilitySignal = Instance.new("BindableEvent"), 
    getShouldSetAppChatVisible = function() --[[ Line: 22 ]] --[[ Name: getShouldSetAppChatVisible ]]
        return false;
    end, 
    entryPoint = v2.Enums.ChatEntryPointNames.Unknown, 
    showParentContainer = function() --[[ Line: 26 ]] --[[ Name: showParentContainer ]]

    end, 
    hideParentContainer = function() --[[ Line: 27 ]] --[[ Name: hideParentContainer ]]

    end, 
    updateCurrentSquadId = function() --[[ Line: 28 ]] --[[ Name: updateCurrentSquadId ]]

    end
});