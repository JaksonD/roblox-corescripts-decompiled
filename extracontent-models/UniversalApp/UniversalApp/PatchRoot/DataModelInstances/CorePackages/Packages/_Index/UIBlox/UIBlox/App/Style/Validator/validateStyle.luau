local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.t);
local v3 = require(l_Parent_0.validateFont);
local v4 = require(l_Parent_0.validateSettings);
local v5 = require(l_Parent_0.validateTheme);
local v6 = require(l_Parent_0.validateTokens);
return (v2.strictInterface({
    Theme = v2.optional(v5), 
    Font = v2.optional(v3), 
    Tokens = v2.optional(v6), 
    Settings = v2.optional(v4)
}));