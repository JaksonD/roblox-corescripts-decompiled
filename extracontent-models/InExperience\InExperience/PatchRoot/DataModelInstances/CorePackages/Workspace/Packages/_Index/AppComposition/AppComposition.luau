local l_Parent_0 = script.Parent;
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local v2 = require(script.CompositionTags);
local v3 = require(script.useCompositionLayout);
local v4 = if l_FFlagLuaAppCompositionSupport_0 then require(script.setupCompositionStyleRules) else nil;
local v5 = if l_FFlagLuaAppCompositionSupport_0 then require(script.CompositionStyleSheet) else nil;
local _ = require(script.AppCompositionTypes);
return {
    CompositionTags = v2, 
    useCompositionLayout = v3, 
    CompositionStyleSheet = v5, 
    setupCompositionStyleRules = v4, 
    ["jest.config"] = script["jest.config"]
};