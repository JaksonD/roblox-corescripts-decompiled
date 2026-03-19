local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(script.Parent.Parent.Actions.OpenOrUpdateDialog);
local v4 = require(script.Parent.Parent.Actions.CloseDialog);
return v2.createReducer({
    isOpen = false, 
    title = "", 
    bodyText = "", 
    dismissCallback = nil
}, {
    [v3.name] = function(v5, v6) --[[ Line: 14 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v5, {
            isOpen = true, 
            title = v6.title, 
            bodyText = v6.bodyText, 
            dismissCallback = v6.dismissCallback
        });
    end, 
    [v4.name] = function(v7, _) --[[ Line: 22 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v7, {
            isOpen = false, 
            title = "", 
            bodyText = "", 
            dismissCallback = v1.None
        });
    end
});