local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(script.Parent.Parent.Actions.AddMessage);
local v4 = require(script.Parent.Parent.Actions.RemoveMessage);
local v5 = require(script.Parent.Parent.Actions.SetMessageText);
return (v2.createReducer({}, {
    [v3.name] = function(v6, v7) --[[ Line: 13 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v6, {
            [v7.message.id] = v7.message
        });
    end, 
    [v4.name] = function(v8, v9) --[[ Line: 19 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v8, {
            [v9.message.id] = v1.None
        });
    end, 
    [v5.name] = function(v10, v11) --[[ Line: 25 ]]
        -- upvalues: v1 (copy)
        local v12 = v10[v11.messageId];
        if not v12 then
            return v10;
        else
            return v1.Dictionary.join(v10, {
                [v11.messageId] = v1.Dictionary.join(v12, {
                    text = v11.newText
                })
            });
        end;
    end
}));