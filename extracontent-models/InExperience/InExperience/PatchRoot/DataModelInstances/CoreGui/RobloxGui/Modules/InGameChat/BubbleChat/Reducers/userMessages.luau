local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(script.Parent.Parent.Actions.AddMessage);
local v5 = require(script.Parent.Parent.Actions.RemoveMessage);
local v6 = require(l_RobloxGui_0.Modules.VoiceChat.Actions.PlayerRemoved);
return (v3.createReducer({}, {
    [v4.name] = function(v7, v8) --[[ Line: 18 ]]
        -- upvalues: v2 (copy)
        local v9 = v7[v8.message.userId] or {};
        return v2.Dictionary.join(v7, {
            [v8.message.userId] = v2.List.join(v9, {
                v8.message.id
            })
        });
    end, 
    [v5.name] = function(v10, v11) --[[ Line: 26 ]]
        -- upvalues: v2 (copy)
        local v12 = v10[v11.message.userId];
        if v12 then
            if #v12 == 1 and v12[1] == v11.message.id then
                return v2.Dictionary.join(v10, {
                    [v11.message.userId] = v2.None
                });
            else
                return v2.Dictionary.join(v10, {
                    [v11.message.userId] = v2.List.filter(v12, function(v13) --[[ Line: 36 ]]
                        -- upvalues: v11 (copy)
                        return v13 ~= v11.message.id;
                    end)
                });
            end;
        else
            return v10;
        end;
    end, 
    [v6.name] = function(v14, v15) --[[ Line: 46 ]]
        -- upvalues: v2 (copy)
        if v14[v15.userId] then
            return v2.Dictionary.join(v14, {
                [v15.userId] = v2.None
            });
        else
            return v14;
        end;
    end
}));