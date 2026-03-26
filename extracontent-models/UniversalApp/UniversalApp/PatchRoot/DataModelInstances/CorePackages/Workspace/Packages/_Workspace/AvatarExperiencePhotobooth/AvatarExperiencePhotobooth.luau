local v0 = require(script.Stores.createPhotoboothStore);
local v1 = require(script.Context.PhotoboothContext);
local v2 = require(script.Context.PhotoboothContextProvider);
local v3 = require(script.PhotoboothStoreBridge);
local v4 = require(script.Enums.PhotoboothCategories);
local v5 = require(script.Enums.PhotoboothScenes);
return {
    ["jest.config"] = script["jest.config"], 
    Context = {
        PhotoboothContext = v1, 
        usePhotoboothContext = require(script.Context.usePhotoboothContext), 
        PhotoboothContextProvider = v2
    }, 
    Stores = {
        createPhotoboothStore = v0
    }, 
    Enums = {
        PhotoboothCategories = v4, 
        PhotoboothScenes = v5
    }, 
    PhotoboothStoreBridge = v3
};