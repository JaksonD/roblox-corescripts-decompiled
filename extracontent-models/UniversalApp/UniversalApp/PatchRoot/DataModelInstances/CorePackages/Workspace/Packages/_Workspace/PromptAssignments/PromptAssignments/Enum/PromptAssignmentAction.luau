local l_Parent_0 = script:FindFirstAncestor("PromptAssignments").Parent;
local v1 = require(script.Parent.addRawValueMethodToEnum);
local v2 = require(l_Parent_0.enumerate);
local v3 = {
    DismissPrompt = "DISMISS_PROMPT", 
    DisablePrompt = "DISABLE_PROMPT"
};
local v4 = v2(script.Name, v3);
v1(v4, v3);
return v4;