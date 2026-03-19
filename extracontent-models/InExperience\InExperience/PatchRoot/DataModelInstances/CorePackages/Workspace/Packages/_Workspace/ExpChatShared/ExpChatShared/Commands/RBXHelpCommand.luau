local _ = require(script.Parent.types);
return {
    name = script.Name, 
    alias = {
        "/help", 
        "/?"
    }, 
    clientRun = function() --[[ Line: 5 ]] --[[ Name: clientRun ]]
        return {
            key = {
                "CoreScripts.TextChat.Help.FirstLine", 
                "InGame.UnknownNamespace.GameChat_ChatCommandsTeller_WhisperCommand", 
                "InGame.UnknownNamespace.GameChat_ChatCommandsTeller_TeamCommand", 
                "InGame.UnknownNamespace.GameChat_ChatCommandsTeller_MuteCommand", 
                "InGame.UnknownNamespace.GameChat_ChatCommandsTeller_UnMuteCommand", 
                "CoreScripts.TextChat.Clear.Help.Description"
            }, 
            metadata = "Roblox.Help.Info", 
            args = nil
        };
    end
};