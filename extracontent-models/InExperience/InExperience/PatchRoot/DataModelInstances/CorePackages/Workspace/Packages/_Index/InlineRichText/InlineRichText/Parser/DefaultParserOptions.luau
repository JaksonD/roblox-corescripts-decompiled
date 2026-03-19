local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local _ = require(l_script_FirstAncestor_0.Types);
local v2 = require(l_script_FirstAncestor_0.Enums.NodeType);
return {
    TagConfigurations = {
        b = {
            NodeType = v2.EngineTag
        }, 
        i = {
            NodeType = v2.EngineTag
        }, 
        u = {
            NodeType = v2.EngineTag
        }, 
        s = {
            NodeType = v2.EngineTag
        }, 
        font = {
            NodeType = v2.EngineTag
        }, 
        stroke = {
            NodeType = v2.EngineTag
        }, 
        uc = {
            NodeType = v2.EngineTag
        }, 
        sc = {
            NodeType = v2.EngineTag
        }, 
        mark = {
            NodeType = v2.EngineTag
        }, 
        a = {
            NodeType = v2.InlineCustom, 
            OverrideName = "LINK"
        }, 
        icon = {
            NodeType = v2.InlineCustom, 
            OverrideName = "ICON"
        }
    }, 
    TagAliases = {
        strong = "b", 
        em = "i", 
        strike = "s", 
        del = "s", 
        uppercase = "uc", 
        smallcaps = "sc"
    }
};