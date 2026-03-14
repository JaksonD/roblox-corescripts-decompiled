local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Parent.SQUAD_URL);
local _ = require(script.Parent.Parent.networkingSquadTypes);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Packages");
local l_FFlagEnableSquadRegroupExperimentation_0 = require(l_script_FirstAncestor_0.SharedFlags).FFlagEnableSquadRegroupExperimentation;
return function(v5) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), l_HttpService_0 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy)
    return (v5.roduxNetworking.POST({
        Name = "CreateExperienceInvite"
    }, function(v6, v7) --[[ Line: 14 ]]
        -- upvalues: v1 (ref), l_HttpService_0 (ref), l_FFlagEnableSquadRegroupExperimentation_0 (ref)
        return v6(v1):path("group-up"):path("v1"):path("invite-to-experience"):body({
            membershipEntityId = v7.membershipEntityId, 
            placeId = v7.placeId, 
            requestId = l_HttpService_0:GenerateGUID(false), 
            voteIdentifier = v7.voteIdentifier, 
            source = if l_FFlagEnableSquadRegroupExperimentation_0 then v7.source else nil
        });
    end));
end;