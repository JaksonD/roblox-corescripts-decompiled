local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Rodux_0 = v1.Rodux;
local l_Cryo_0 = v1.Cryo;
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Actions.OpenReportDialog);
local v6 = require(l_Parent_0.Actions.CloseReportDialog);
local v7 = require(l_Parent_0.Actions.OpenReportSentDialog);
local v8 = require(l_Parent_0.Actions.CloseReportSentDialog);
local v9 = require(l_Parent_0.Actions.SetCurrentPage);
return l_Rodux_0.createReducer({
    dialogOpen = false, 
    reportSentOpen = false, 
    userId = nil, 
    userName = nil
}, {
    [v5.name] = function(v10, v11) --[[ Line: 21 ]]
        return {
            dialogOpen = true, 
            reportSentOpen = v10.reportSentOpen, 
            userId = v11.userId, 
            userName = v11.userName
        };
    end, 
    [v9.name] = function(v12, _) --[[ Line: 31 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v12, {
            dialogOpen = false
        });
    end, 
    [v6.name] = function(v14, _) --[[ Line: 36 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v14, {
            dialogOpen = false
        });
    end, 
    [v7.name] = function(v16, _) --[[ Line: 41 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v16, {
            reportSentOpen = true
        });
    end, 
    [v8.name] = function(v18, _) --[[ Line: 46 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v18, {
            reportSentOpen = false
        });
    end
});