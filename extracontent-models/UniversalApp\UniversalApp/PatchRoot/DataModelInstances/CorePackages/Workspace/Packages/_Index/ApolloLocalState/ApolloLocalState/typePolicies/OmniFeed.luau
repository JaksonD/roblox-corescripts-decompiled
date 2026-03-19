local v0 = require(script.Parent.utils.makeDefaultReadPolicy);
local l_GetFFlagEnableMergeOmniFeedSorts_0 = require(script.Parent.Parent.Flags).GetFFlagEnableMergeOmniFeedSorts;
local v2 = require(script.Parent.utils.makeMergeOverlappingArraysPolicy);
return {
    keyFields = {
        "pageType"
    }, 
    fields = {
        sorts = {
            merge = if l_GetFFlagEnableMergeOmniFeedSorts_0() then v2("topicId") else nil
        }, 
        nextPageToken = {
            read = v0("")
        }, 
        globalLayoutData = {
            read = v0({})
        }
    }
};