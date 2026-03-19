local l_Parent_0 = script:FindFirstAncestor("BugReporting").Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.SystemInfoProtocol);
local _ = require(l_Parent_0.AppCommonLib);
local v5 = require(script.Parent.BugReporterModal);
local v6 = require(script.Parent.useBugReporterModalProps);
local _ = require(script.Parent.BugReporterTypes);
local v8 = game:DefineFastInt("InAppBugReporterMinCommentLength", 15);
return function(v9) --[[ Line: 33 ]] --[[ Name: BugReporterModalContainer ]]
    -- upvalues: v6 (copy), v1 (copy), v8 (copy), v2 (copy), v5 (copy)
    local v10 = v6(v1.assign(v9, {
        minCommentLength = v8
    }));
    return v2.createElement(v5, v10);
end;