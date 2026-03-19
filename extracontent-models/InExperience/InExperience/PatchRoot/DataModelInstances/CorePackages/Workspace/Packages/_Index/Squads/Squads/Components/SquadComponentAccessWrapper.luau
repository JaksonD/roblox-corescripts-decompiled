local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v1.React;
local l_SquadExternalContractContext_0 = v1.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagIsSquadEnabledAMP_0 = require(l_Parent_0.SharedFlags).FFlagIsSquadEnabledAMP;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
return function(v7) --[[ Line: 17 ]]
    -- upvalues: l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useAppPolicy_0 (copy), l_FFlagIsSquadEnabledAMP_0 (copy)
    local v8 = l_React_0.useContext(l_SquadExternalContractContext_0).useParentChannelHasSquadAccess(v7.parentChannelId);
    local v10 = l_useAppPolicy_0(function(v9) --[[ Line: 21 ]]
        return v9.getCanAccessParty();
    end);
    if (l_FFlagIsSquadEnabledAMP_0 and v10 or not l_FFlagIsSquadEnabledAMP_0) and v8 then
        return v7.children;
    else
        return nil;
    end;
end;