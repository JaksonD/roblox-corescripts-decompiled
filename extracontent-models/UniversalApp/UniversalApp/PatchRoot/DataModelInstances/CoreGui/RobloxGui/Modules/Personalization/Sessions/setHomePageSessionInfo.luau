local l_CorePackages_0 = game:GetService("CorePackages");
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
return function(v2, v3, v4) --[[ Line: 4 ]]
    -- upvalues: l_SessionType_0 (copy)
    if v2 == nil then
        return;
    else
        v2:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.HomePageSessionInfo, l_SessionType_0.StructuralIdentifier.HomePageSessionInfo);
        if v3 then
            v2:SetMetadata(l_SessionType_0.StructuralIdentifier.HomePageSessionInfo, l_SessionType_0.Metadata.HomePageSessionInfo.RequestId, v3);
        end;
        if v4 then
            v2:SetMetadata(l_SessionType_0.StructuralIdentifier.HomePageSessionInfo, l_SessionType_0.Metadata.HomePageSessionInfo.OmniSessionId, v4);
        end;
        return;
    end;
end;