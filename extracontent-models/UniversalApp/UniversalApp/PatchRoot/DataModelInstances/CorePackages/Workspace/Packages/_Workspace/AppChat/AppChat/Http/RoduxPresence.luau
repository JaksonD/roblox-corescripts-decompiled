local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
return require(l_Parent_0.LuaSocialLibrariesDeps).RoduxPresence.config({
    keyPath = "ChatAppReducer.Presence"
});