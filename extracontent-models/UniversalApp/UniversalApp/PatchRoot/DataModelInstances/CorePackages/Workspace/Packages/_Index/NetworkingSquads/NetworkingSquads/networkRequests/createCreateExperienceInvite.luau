local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Parent.SQUAD_URL);
local _ = require(script.Parent.Parent.networkingSquadTypes);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Packages");
local l_FFlagEnableSquadRegroupExperimentation_0 = require(l_script_FirstAncestor_0.SharedFlags).FFlagEnableSquadRegroupExperimentation;
local l_FFlagEnablePrivatePartyStartJoin_0 = require(l_script_FirstAncestor_0.SharedFlags).FFlagEnablePrivatePartyStartJoin;
return function(v6) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), l_HttpService_0 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy), l_FFlagEnablePrivatePartyStartJoin_0 (copy)
    return (v6.roduxNetworking.POST({
        Name = "CreateExperienceInvite"
    }, function(v7, v8) --[[ Line: 15 ]]
        -- upvalues: v1 (ref), l_HttpService_0 (ref), l_FFlagEnableSquadRegroupExperimentation_0 (ref), l_FFlagEnablePrivatePartyStartJoin_0 (ref)
        return v7(v1):path("group-up"):path("v1"):path("invite-to-experience"):body({
            membershipEntityId = v8.membershipEntityId, 
            placeId = v8.placeId, 
            requestId = l_HttpService_0:GenerateGUID(false), 
            voteIdentifier = v8.voteIdentifier, 
            source = if l_FFlagEnableSquadRegroupExperimentation_0 then v8.source else nil, 
            inviteType = if l_FFlagEnablePrivatePartyStartJoin_0 then v8.inviteType else nil
        });
    end));
end;