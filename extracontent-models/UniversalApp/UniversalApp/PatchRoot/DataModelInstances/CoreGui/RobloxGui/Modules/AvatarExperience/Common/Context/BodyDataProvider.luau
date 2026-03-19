local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Common.Util.makeEvents);
local v5 = require(script.Parent.BodyDataCallbacksContext);
local v6 = require(script.Parent.BodyDataEventsContext);
local v7 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixBodyScaleReduxUpdates);
local v8 = {
    "setBodyColors"
};
if v7 then
    table.insert(v8, "setAvatarScales");
end;
return function(v9) --[[ Line: 26 ]]
    -- upvalues: v2 (copy), v4 (copy), v8 (copy), v5 (copy), v6 (copy)
    local v10, v11 = v2.useState({});
    local v12, v13 = v2.useState({});
    v2.useEffect(function() --[[ Line: 30 ]]
        -- upvalues: v4 (ref), v8 (ref), v11 (copy), v13 (copy)
        local v14, v15, v16 = v4(v8);
        v11(v14);
        v13(v15);
        return function() --[[ Line: 34 ]]
            -- upvalues: v16 (copy)
            for _, v18 in v16 do
                v18();
            end;
        end;
    end, {});
    return v2.createElement(v5.Provider, {
        value = v12
    }, {
        BodyDataEventsContextProvider = v2.createElement(v6.Provider, {
            value = v10
        }, v9.children)
    });
end;