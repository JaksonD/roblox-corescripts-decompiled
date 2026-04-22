local _ = require(script.Parent.types);
return {
    name = script.Name, 
    alias = {
        "/help"
    }, 
    clientRun = function() --[[ Line: 5 ]] --[[ Name: clientRun ]]
        return {
            key = {
                "CoreScripts.TextChat.Help.FirstLine", 
                "CoreScripts.TextChat.ChatCommands.Mute.Description", 
                "CoreScripts.TextChat.ChatCommands.Unmute.Description", 
                "CoreScripts.TextChat.Clear.Help.Description"
            }, 
            metadata = "Roblox.GlobalHelp.Info", 
            args = nil
        };
    end
};