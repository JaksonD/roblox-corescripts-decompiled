local l_CorePackages_0 = game:GetService("CorePackages");
local l_SetConnectionState_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Actions.SetConnectionState;
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: l_SetConnectionState_0 (copy)
    v2 = v2 or Enum.ConnectionState.Connected;
    if v3.type == l_SetConnectionState_0.name then
        v2 = v3.connectionState;
    end;
    return v2;
end;