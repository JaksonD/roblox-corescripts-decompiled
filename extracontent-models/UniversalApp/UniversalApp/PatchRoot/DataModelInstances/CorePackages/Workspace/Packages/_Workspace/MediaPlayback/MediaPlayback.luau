local v0 = require(script.Stores.getAudioPlaybackStore);
return {
    useLazyFmod = require(script.Hooks.useLazyFmod), 
    getAudioPlaybackStore = v0, 
    useAudioStore = require(script.Hooks.useAudioStore), 
    useLastPlayedAudioStore = require(script.Hooks.useLastPlayedAudioStore), 
    enableAudioPlaybackInApp = require(script.Common.enableAudioPlaybackInApp), 
    ["jest.config"] = script["jest.config"]
};