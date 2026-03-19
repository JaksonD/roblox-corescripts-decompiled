local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(script.Parent.Parent.Actions.OpenOrUpdateCFM);
local v4 = require(script.Parent.Parent.Actions.CloseCFM);
return v2.createReducer({
    isOpen = false, 
    friend = {
        userId = nil, 
        combinedName = "", 
        userName = ""
    }
}, {
    [v3.name] = function(v5, v6) --[[ Line: 16 ]]
        -- upvalues: v1 (copy)
        if v6.friend and v6.friend.combinedName then
            return v1.Dictionary.join(v5, {
                isOpen = true, 
                friend = v6.friend
            });
        else
            return {
                isOpen = false, 
                friend = {
                    userId = nil, 
                    combinedName = "", 
                    userName = ""
                }
            };
        end;
    end, 
    [v4.name] = function(_, _) --[[ Line: 34 ]]
        return {
            isOpen = false, 
            friend = {
                userId = nil, 
                combinedName = "", 
                userName = ""
            }
        };
    end
});