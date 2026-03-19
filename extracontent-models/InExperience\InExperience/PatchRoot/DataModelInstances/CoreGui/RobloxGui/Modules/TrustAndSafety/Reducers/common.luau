local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Actions.ShowToast);
return v2.createReducer({
    toastTitle = nil, 
    toastSubtitle = nil
}, {
    [v4.name] = function(v5, v6) --[[ Line: 14 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v5, {
            toastTitle = v6.toastTitle, 
            toastSubtitle = v6.toastSubtitle
        });
    end
});