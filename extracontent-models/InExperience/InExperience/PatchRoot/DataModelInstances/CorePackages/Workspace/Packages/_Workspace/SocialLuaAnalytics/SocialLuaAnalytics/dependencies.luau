local l_Parent_0 = script:FindFirstAncestor("SocialLuaAnalytics").Parent;
local v1 = require(l_Parent_0.LuaSocialLibrariesDeps);
return {
    t = require(l_Parent_0.t), 
    tutils = require(l_Parent_0.tutils), 
    RoduxPresence = v1.RoduxPresence.config({
        keyPath = "SocialLuaAnalytics.Presence"
    }), 
    llama = v1.llama, 
    enumerate = require(l_Parent_0.enumerate), 
    LuauPolyfill = require(l_Parent_0.LuauPolyfill), 
    Rodux = require(l_Parent_0.Rodux), 
    Dash = require(l_Parent_0.Dash)
};