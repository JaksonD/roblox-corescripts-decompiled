local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Actions_0 = script.Parent.Parent.Actions;
local v4 = require(l_Actions_0.ShowMenu);
local v5 = require(l_Actions_0.HideMenu);
local v6 = require(l_Actions_0.ShowError);
local v7 = require(l_Actions_0.HideError);
local v8 = require(l_Actions_0.SetGuiInset);
local v9 = {
    menuVisible = false, 
    guiInset = 0, 
    errorVisible = false, 
    errorText = ""
};
return v2.createReducer(v9, {
    [v4.name] = function(v10, _) --[[ Line: 30 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v10, {
            menuVisible = true
        });
    end, 
    [v5.name] = function(v12, _) --[[ Line: 36 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v12, {
            menuVisible = false
        });
    end, 
    [v6.name] = function(v14, v15) --[[ Line: 42 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v14, {
            errorVisible = true, 
            errorText = v15.errorText
        });
    end, 
    [v7.name] = function(v16, _) --[[ Line: 49 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v16, {
            errorVisible = false
        });
    end, 
    [v8.name] = function(v18, v19) --[[ Line: 55 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v18, {
            guiInset = v19.guiInset
        });
    end
});