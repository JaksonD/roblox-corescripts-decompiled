local v0 = require(script.RBXConsoleCommand);
local v1 = require(script.RBXHelpCommand);
local v2 = require(script.RBXMuteCommand);
local v3 = require(script.RBXUnmuteCommand);
local v4 = require(script.RBXVersionCommand);
local v5 = require(script.RBXEmoteCommand);
local v6 = require(script.RBXTeamCommand);
local l_RBXWhisperCommand_0 = require(script.Whisper).RBXWhisperCommand;
local v8 = require(script.RBXClearCommand);
local _ = require(script.types);
return {
    enabledCommands = {
        v0, 
        v1, 
        v2, 
        v3, 
        v4, 
        v5, 
        v6, 
        l_RBXWhisperCommand_0, 
        v8
    }, 
    autoCastCommand = require(script.autoCastCommand), 
    RBXClearCommand = v8, 
    RBXConsoleCommand = v0, 
    RBXEmoteCommand = v5, 
    RBXHelpCommand = v1, 
    RBXMuteCommand = v2, 
    RBXTeamCommand = v6, 
    RBXUnmuteCommand = v3, 
    RBXVersionCommand = v4, 
    Whisper = require(script.Whisper)
};