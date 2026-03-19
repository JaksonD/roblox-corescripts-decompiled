local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(script.Parent.Parent.Enums.Pages);
local v4 = require(script.Parent.Parent.Actions.SetCurrentPage);
local v5 = require(script.Parent.Parent.Actions.SetCurrentTag);
return v2.createReducer({
    currentPage = nil, 
    currentTag = ""
}, {
    [v4.name] = function(v6, v7) --[[ Line: 16 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v6, {
            currentPage = if v7.page == nil then v1.None else v7.page
        });
    end, 
    [v5.name] = function(v8, v9) --[[ Line: 21 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v8, {
            currentTag = v9.tag
        });
    end
});