return {
    Enums = require(script.Common.Enums), 
    IDVApiProvider = require(script.Utils.IDVApiProvider), 
    usePollIDVStatus = require(script.Hooks.usePollIDVStatus), 
    GetFIntIDVPollDelay = require(script.Flags.GetFIntIDVPollDelay), 
    GetFIntIDVMaxRetries = require(script.Flags.GetFIntIDVMaxRetries), 
    ["jest.config"] = script["jest.config"]
};