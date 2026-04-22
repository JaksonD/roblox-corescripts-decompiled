local v0 = require(script.GlobalHelpCommand);
local v1 = require(script.GlobalClearCommand);
local v2 = require(script.GlobalMuteCommand);
local v3 = require(script.GlobalUnmuteCommand);
local _ = require(script.types);
local l_GetFFlagExpChatGlobalMuteCommandEnabled_0 = require(script.Parent.Flags).GetFFlagExpChatGlobalMuteCommandEnabled;
game:DefineFastFlag("ExpChatGlobalClearCommandEnabled", false);
game:DefineFastFlag("ExpChatGlobalHelpCommandEnabled", false);
return {
    getGlobalEnabledCommands = function() --[[ Line: 15 ]] --[[ Name: getGlobalEnabledCommands ]]
        -- upvalues: v1 (copy), v0 (copy), l_GetFFlagExpChatGlobalMuteCommandEnabled_0 (copy), v2 (copy), v3 (copy)
        local v6 = {};
        if game:GetFastFlag("ExpChatGlobalClearCommandEnabled") then
            table.insert(v6, v1);
        end;
        if game:GetFastFlag("ExpChatGlobalHelpCommandEnabled") then
            table.insert(v6, v0);
        end;
        if l_GetFFlagExpChatGlobalMuteCommandEnabled_0() then
            table.insert(v6, v2);
            table.insert(v6, v3);
        end;
        return v6;
    end, 
    GlobalHelpCommand = v0, 
    GlobalClearCommand = v1, 
    GlobalMuteCommand = v2, 
    GlobalUnmuteCommand = v3
};