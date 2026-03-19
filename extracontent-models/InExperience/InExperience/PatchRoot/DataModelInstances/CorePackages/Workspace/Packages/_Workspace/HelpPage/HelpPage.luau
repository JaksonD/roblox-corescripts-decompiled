local v0 = require(script.HelpReactView);
local v1 = require(script.Constants);
return {
    HelpReactView = v0, 
    Constants = v1, 
    Flags = {
        FFlagRefactorHelpPage = require(script.Flags.FFlagRefactorHelpPage), 
        FFlagHelpPageMountVR = require(script.Flags.FFlagHelpPageMountVR), 
        FFlagHelpPageIXPExposure = require(script.Flags.FFlagHelpPageIXPExposure), 
        FStringHelpPageIXPLayer = require(script.Flags.FStringHelpPageIXPLayer)
    }, 
    ["jest.config"] = script["jest.config"]
};