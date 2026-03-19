local l_CorePackages_0 = game:GetService("CorePackages");
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_SearchLandingPageSession_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.Sessions.SearchLandingPageSession;
return function(v3, v4) --[[ Line: 6 ]]
    -- upvalues: l_SessionType_0 (copy), l_SearchLandingPageSession_0 (copy)
    if not v3:SessionExists(l_SessionType_0.StructuralIdentifier.SearchLandingPage) then
        l_SearchLandingPageSession_0:Refresh();
        v3:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.SearchLandingPage, l_SessionType_0.StructuralIdentifier.SearchLandingPage);
    elseif v4 then
        l_SearchLandingPageSession_0:Refresh();
    end;
    v3:SetMetadata(l_SessionType_0.StructuralIdentifier.SearchLandingPage, l_SessionType_0.Metadata.SearchLandingPage.SearchLandingPageSessionId, l_SearchLandingPageSession_0:Get());
end;