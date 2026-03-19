local v0 = require(script.Context.AvatarSaveContext);
local v1 = require(script.Context.AvatarSaveContextProvider);
local v2 = require(script.Context.useAvatarSaveContext);
return {
    Context = {
        AvatarSaveContext = v0, 
        AvatarSaveContextProvider = v1, 
        useAvatarSaveContext = v2
    }, 
    Components = {
        SaveButton = require(script.SaveButton.SaveButtonContainer)
    }, 
    Selectors = {
        selectCharacterData = require(script.Selectors.selectCharacterData)
    }, 
    Enums = {
        SaveStatusEnum = require(script.Enums.SaveStatusEnum)
    }, 
    ["jest.config"] = script["jest.config"]
};