local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local v1 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/Command/Team");
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v3 = require(l_Actions_0.ChatInputBarActivatedTeamMode);
local _ = require(script.Parent.types);
return {
    name = script.Name, 
    alias = {
        "/team", 
        "/t", 
        "%%"
    }, 
    clientRun = function(v5, _, _) --[[ Line: 12 ]] --[[ Name: clientRun ]]
        -- upvalues: v3 (copy), v1 (copy)
        if v5:getState().LocalTeam then
            v5:dispatch(v3());
            return {
                key = "", 
                metadata = "Roblox.Team.Info.Success"
            };
        else
            v1:debug("Could not team chat because not in team");
            return {
                key = "CoreScripts.TextChat.TeamChat.Error.NotOnTeam", 
                metadata = "Roblox.Team.Error.CannotTeamChatIfNotInTeam"
            };
        end;
    end
};