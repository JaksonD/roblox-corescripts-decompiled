local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Common.RoactRodux);
local v3 = require(l_Modules_0.Luobu.Models.TencentAuthInfoModel);
local v4 = require(l_Modules_0.Luobu.Actions.SetTencentAuthInfo);
local _ = require(l_Modules_0.Luobu.Enum.TencentAuthType);
local v6 = v1.Component:extend("TencentAuthInfoEventReceiver");
v6.init = function(v7) --[[ Line: 11 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v7.connections = {
        v7.props.RobloxEventReceiver:observeEvent("SyncTencentAuthInfo", function(v8, _) --[[ Line: 13 ]]
            -- upvalues: v3 (ref), v7 (copy)
            local v10 = v3.fromJsonData(v8);
            v7.props.setTencentAuthInfo(v10);
        end)
    };
end;
v6.render = function(_) --[[ Line: 22 ]] --[[ Name: render ]]

end;
v6.willUnmount = function(v12) --[[ Line: 24 ]] --[[ Name: willUnmount ]]
    for _, v14 in pairs(v12.connections) do
        v14:disconnect();
    end;
end;
return (v2.connect(nil, function(v15) --[[ Line: 30 ]]
    -- upvalues: v4 (copy)
    return {
        setTencentAuthInfo = function(v16) --[[ Line: 32 ]] --[[ Name: setTencentAuthInfo ]]
            -- upvalues: v15 (copy), v4 (ref)
            return v15(v4(v16));
        end
    };
end)(v6));