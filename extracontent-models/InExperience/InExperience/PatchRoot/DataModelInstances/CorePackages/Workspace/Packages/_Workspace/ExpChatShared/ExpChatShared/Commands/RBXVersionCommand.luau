local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local v1 = require(l_script_FirstAncestor_0.Version);
local _ = require(script.Parent.types);
return {
    name = script.Name, 
    alias = {
        "/version", 
        "/v"
    }, 
    clientRun = function() --[[ Line: 8 ]] --[[ Name: clientRun ]]
        -- upvalues: v1 (copy)
        return {
            key = "CoreScripts.TextChat.Version.Success", 
            metadata = "Roblox.Version.Info.Success", 
            args = {
                RBX_VERSION = string.format("%s (%s)", v1[1], v1[2])
            }
        };
    end
};