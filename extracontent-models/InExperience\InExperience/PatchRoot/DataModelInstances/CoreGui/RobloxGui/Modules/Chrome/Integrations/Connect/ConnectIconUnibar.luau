local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local v2 = require(l_script_FirstAncestor_0.Service);
local l_GetFFlagAppChatAddConnectUnibarForActiveSquad_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAppChatAddConnectUnibarForActiveSquad;
local l_InExperienceAppChatModal_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatModal;
local v5 = require(script.Parent.registerConnectIntegration);
local v6 = require(script.Parent.isConnectUnibarEnabled);
local v7 = require(script.Parent.isConnectDropdownEnabled);
local l_GetFFlagIsSquadEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagIsSquadEnabledAMP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagIsSquadEnabledAMP;
local v10 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy);
local v11 = require(l_CorePackages_0.Packages.PolicyProvider);
local v12 = if l_FFlagIsSquadEnabledAMP_0 then v11.GetPolicyImplementations.MemStorageService("app-policy") else nil;
local function _() --[[ Line: 27 ]] --[[ Name: canAccessParty ]]
    -- upvalues: v10 (copy)
    return v10.getAppFeaturePolicies().getCanAccessParty();
end;
local function _() --[[ Line: 31 ]] --[[ Name: shouldEnableIntegrationForParty ]]
    -- upvalues: l_GetFFlagAppChatAddConnectUnibarForActiveSquad_0 (copy), v10 (copy), v7 (copy)
    return l_GetFFlagAppChatAddConnectUnibarForActiveSquad_0() and v10.getAppFeaturePolicies().getCanAccessParty() and v7();
end;
local v15 = nil;
local v16 = nil;
local function v20(v17) --[[ Line: 39 ]] --[[ Name: updateConnectIntegration ]]
    -- upvalues: v15 (ref), v5 (copy), v2 (copy), v16 (ref), l_InExperienceAppChatModal_0 (copy)
    if not v15 then
        v15 = v5("connect_unibar", if v17 then v2.AvailabilitySignal.Pinned else v2.AvailabilitySignal.Unavailable);
    end;
    if not v17 then
        v15.availability:unavailable();
        if v16 then
            v16();
            v16 = nil;
            return;
        end;
    else
        if l_InExperienceAppChatModal_0.default.currentSquadId ~= "" then
            v15.availability:pinned();
        end;
        if not v16 then
            local v19 = l_InExperienceAppChatModal_0.default.currentSquadIdSignal.Event:Connect(function(v18) --[[ Line: 67 ]]
                -- upvalues: v15 (ref)
                if v18 == "" then
                    v15.availability:unavailable();
                    return;
                else
                    v15.availability:pinned();
                    return;
                end;
            end);
            v16 = function() --[[ Line: 74 ]]
                -- upvalues: v19 (copy)
                v19:Disconnect();
            end;
        end;
    end;
end;
local function v21() --[[ Line: 81 ]] --[[ Name: handlePolicyUpdate ]]
    -- upvalues: v20 (copy), l_GetFFlagAppChatAddConnectUnibarForActiveSquad_0 (copy), v10 (copy), v7 (copy)
    v20(l_GetFFlagAppChatAddConnectUnibarForActiveSquad_0() and v10.getAppFeaturePolicies().getCanAccessParty() and v7());
end;
if v6() then
    if l_FFlagIsSquadEnabledAMP_0 then
        v20(l_GetFFlagAppChatAddConnectUnibarForActiveSquad_0() and v10.getAppFeaturePolicies().getCanAccessParty() and v7());
        v12.onPolicyChanged(v21);
    else
        local v22 = l_GetFFlagAppChatAddConnectUnibarForActiveSquad_0() and l_GetFFlagIsSquadEnabled_0() and v7();
        v15 = v5("connect_unibar", if v22 then v2.AvailabilitySignal.Unavailable else v2.AvailabilitySignal.Pinned);
        if v22 then
            if l_InExperienceAppChatModal_0.default.currentSquadId ~= "" then
                v15.availability:pinned();
            end;
            l_InExperienceAppChatModal_0.default.currentSquadIdSignal.Event:Connect(function(v23) --[[ Line: 114 ]]
                -- upvalues: v15 (ref)
                if v23 == "" then
                    v15.availability:unavailable();
                    return;
                else
                    v15.availability:pinned();
                    return;
                end;
            end);
        end;
    end;
end;
return v15;