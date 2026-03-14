local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
local l_makeActionCreator_0 = require(l_CorePackages_0.Packages.Rodux).makeActionCreator;
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(script.Parent.Parent.Helpers.maybeAssert);
local v5 = v3.tuple(v3.string, v3.string);
return l_makeActionCreator_0(script.Name, function(v6, v7) --[[ Line: 10 ]]
    -- upvalues: v4 (copy), v5 (copy), v1 (copy)
    v4(v5(v6, v7));
    v1.Events.LegacyBubbleTextUpdated(v6, v7);
    return {
        messageId = v6, 
        newText = v7
    };
end);