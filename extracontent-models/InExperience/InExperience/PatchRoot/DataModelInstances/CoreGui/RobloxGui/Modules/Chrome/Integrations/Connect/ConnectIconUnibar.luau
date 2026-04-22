local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local v2 = require(l_script_FirstAncestor_0.Service);
local l_InExperienceAppChatModal_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatModal;
local v4 = require(script.Parent.registerConnectIntegration);
local v5 = require(script.Parent.isConnectUnibarEnabled);
local v6 = require(script.Parent.isConnectDropdownEnabled);
local l_GetFFlagIsSquadEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagIsSquadEnabledAMP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagIsSquadEnabledAMP;
local v9 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy);
local v10 = require(l_CorePackages_0.Packages.PolicyProvider);
local v11 = if l_FFlagIsSquadEnabledAMP_0 then v10.GetPolicyImplementations.MemStorageService("app-policy") else nil;
local function _() --[[ Line: 25 ]] --[[ Name: canAccessParty ]]
    -- upvalues: v9 (copy)
    return v9.getAppFeaturePolicies().getCanAccessParty();
end;
local function _() --[[ Line: 29 ]] --[[ Name: shouldEnableIntegrationForParty ]]
    -- upvalues: l_GetFFlagIsSquadEnabled_0 (copy), v9 (copy), v6 (copy)
    return l_GetFFlagIsSquadEnabled_0() and v9.getAppFeaturePolicies().getCanAccessParty() and v6();
end;
local v14 = nil;
local v15 = nil;
local function v19(v16) --[[ Line: 37 ]] --[[ Name: updateConnectIntegration ]]
    -- upvalues: v14 (ref), v4 (copy), v2 (copy), v15 (ref), l_InExperienceAppChatModal_0 (copy)
    if not v14 then
        v14 = v4("connect_unibar", if v16 then v2.AvailabilitySignal.Pinned else v2.AvailabilitySignal.Unavailable);
    end;
    if not v16 then
        v14.availability:unavailable();
        if v15 then
            v15();
            v15 = nil;
            return;
        end;
    else
        if l_InExperienceAppChatModal_0.default.currentSquadId ~= "" then
            v14.availability:pinned();
        end;
        if not v15 then
            local v18 = l_InExperienceAppChatModal_0.default.currentSquadIdSignal.Event:Connect(function(v17) --[[ Line: 65 ]]
                -- upvalues: v14 (ref)
                if v17 == "" then
                    v14.availability:unavailable();
                    return;
                else
                    v14.availability:pinned();
                    return;
                end;
            end);
            v15 = function() --[[ Line: 72 ]]
                -- upvalues: v18 (copy)
                v18:Disconnect();
            end;
        end;
    end;
end;
local function v20() --[[ Line: 79 ]] --[[ Name: handlePolicyUpdate ]]
    -- upvalues: v19 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v9 (copy), v6 (copy)
    v19(l_GetFFlagIsSquadEnabled_0() and v9.getAppFeaturePolicies().getCanAccessParty() and v6());
end;
if v5() then
    if l_FFlagIsSquadEnabledAMP_0 then
        v19(l_GetFFlagIsSquadEnabled_0() and v9.getAppFeaturePolicies().getCanAccessParty() and v6());
        v11.onPolicyChanged(v20);
    else
        local v21 = l_GetFFlagIsSquadEnabled_0() and v6();
        v14 = v4("connect_unibar", if v21 then v2.AvailabilitySignal.Unavailable else v2.AvailabilitySignal.Pinned);
        if v21 then
            if l_InExperienceAppChatModal_0.default.currentSquadId ~= "" then
                v14.availability:pinned();
            end;
            l_InExperienceAppChatModal_0.default.currentSquadIdSignal.Event:Connect(function(v22) --[[ Line: 110 ]]
                -- upvalues: v14 (ref)
                if v22 == "" then
                    v14.availability:unavailable();
                    return;
                else
                    v14.availability:pinned();
                    return;
                end;
            end);
        end;
    end;
end;
return v14;