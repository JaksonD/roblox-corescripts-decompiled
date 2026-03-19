local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = {
    Unknown = "Unknown", 
    ConnectTab = "ConnectTab", 
    ChatTab = "ChatTab", 
    InExperienceDefault = "InExperienceDefault"
};
local v3 = v1.createContext({
    chatPlacement = v2.Unknown
});
local l_Provider_0 = v3.Provider;
local l_Consumer_0 = v3.Consumer;
return {
    Provider = l_Provider_0, 
    Consumer = l_Consumer_0, 
    Context = v3, 
    Enum = v2, 
    useChatPlacementContext = function() --[[ Line: 38 ]] --[[ Name: useChatPlacementContext ]]
        -- upvalues: v1 (copy), v3 (copy)
        return v1.useContext(v3);
    end, 
    withChatPlacementContext = function(v6) --[[ Line: 41 ]] --[[ Name: withChatPlacementContext ]]
        -- upvalues: v1 (copy), l_Consumer_0 (copy)
        return v1.createElement(l_Consumer_0, {
            render = function(v7) --[[ Line: 43 ]] --[[ Name: render ]]
                -- upvalues: v6 (copy)
                return v6(v7);
            end
        });
    end, 
    isPlacementInExperience = function(v8) --[[ Line: 48 ]] --[[ Name: isPlacementInExperience ]]
        -- upvalues: v2 (copy)
        return v8 == v2.InExperienceDefault;
    end
};