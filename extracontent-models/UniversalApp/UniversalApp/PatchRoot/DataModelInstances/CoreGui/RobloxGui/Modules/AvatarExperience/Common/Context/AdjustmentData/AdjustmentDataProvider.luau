local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Common.Util.makeEvents);
local v5 = require(script.Parent.AdjustmentDataCallbacksContext);
local v6 = require(script.Parent.AdjustmentDataEventsContext);
return function(v7) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), v4 (copy), v5 (copy), v6 (copy)
    local v8, v9 = v2.useState({});
    local v10, v11 = v2.useState({});
    v2.useEffect(function() --[[ Line: 18 ]]
        -- upvalues: v4 (ref), v9 (copy), v11 (copy)
        local v12, v13, v14 = v4({
            "setAdjustments"
        });
        v9(v12);
        v11(v13);
        return function() --[[ Line: 24 ]]
            -- upvalues: v14 (copy)
            for _, v16 in v14 do
                v16();
            end;
        end;
    end, {});
    return v2.createElement(v5.Provider, {
        value = v10
    }, {
        AdjustmentDataEventsContextProvider = v2.createElement(v6.Provider, {
            value = v8
        }, v7.children)
    });
end;