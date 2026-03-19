local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local _ = require(l_Parent_0.Enums.PromptType);
local _ = require(l_Parent_0.Types);
return v2.makeActionCreator(script.Name, function(v5, v6, v7) --[[ Line: 15 ]]
    return {
        promptData = v7, 
        promptId = v5, 
        promptType = v6
    };
end);