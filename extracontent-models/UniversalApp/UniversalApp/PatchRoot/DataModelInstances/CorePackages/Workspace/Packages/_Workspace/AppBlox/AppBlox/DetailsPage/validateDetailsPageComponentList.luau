local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(script.Parent.ContentPosition);
local v2 = require(l_Parent_0.t);
return v2.map(v2.string, v2.strictInterface({
    portraitLayoutOrder = v2.integer, 
    landscapeLayoutOrder = v2.integer, 
    landscapePosition = v1.isEnumValue, 
    renderComponent = v2.callback, 
    showCornerGradient = v2.optional(v2.boolean), 
    useSelectionBumper = v2.optional(v2.boolean), 
    visible = v2.optional(v2.boolean)
}));