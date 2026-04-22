local v0 = require(script.Components.PromptFriendRequestModalContainer);
local v1 = require(script.InExperience.launchUserRelationshipModal);
return {
    ["jest.config"] = script["jest.config"], 
    launchPromptFriendRequestModal = function(v2) --[[ Line: 6 ]] --[[ Name: launchPromptFriendRequestModal ]]
        -- upvalues: v1 (copy), v0 (copy)
        v1(v0, {
            userId = v2
        });
    end
};