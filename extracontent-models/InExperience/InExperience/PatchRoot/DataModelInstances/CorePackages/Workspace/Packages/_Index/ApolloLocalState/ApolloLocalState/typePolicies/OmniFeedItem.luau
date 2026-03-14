local l_Parent_0 = script:FindFirstAncestor("ApolloLocalState").Parent;
local l_GetFFlagEnableMergeOmniFeedSorts_0 = require(script.Parent.Parent.Flags).GetFFlagEnableMergeOmniFeedSorts;
local _ = require(l_Parent_0.ApolloClient);
local v3 = require(script.Parent.utils.makeMergeOverlappingArraysPolicy);
local v4 = require(script.Parent.utils.makeDefaultReadPolicy);
return {
    fields = {
        topicLayoutData = {
            read = v4({})
        }, 
        recommendations = {
            read = v4({}), 
            merge = if l_GetFFlagEnableMergeOmniFeedSorts_0() then v3("contentId") else nil
        }, 
        experiences = {}, 
        hasMoreRows = {}
    }
};