local v0 = require(script.Parent.constants);
local l_Parent_0 = script:FindFirstAncestor("GenericChallenges").Parent;
local l_Base64_0 = require(l_Parent_0.AuthCommon).Utils.Base64;
local l_HttpService_0 = game:GetService("HttpService");
return function(v4) --[[ Line: 11 ]]
    -- upvalues: v0 (copy), l_Base64_0 (copy), l_HttpService_0 (copy)
    assert(v4.challengeId ~= nil, "challenge id must not be nil");
    assert(v4.challengeType ~= nil, "challenge type must not be nil");
    assert(v4.metadata ~= nil, "metadata must not be nil");
    return {
        [v0.challengeIdHeader] = v4.challengeId, 
        [v0.challengeTypeHeader] = v4.challengeType, 
        [v0.challengeMetadataHeader] = l_Base64_0.Encode(l_HttpService_0:JSONEncode(v4.metadata))
    };
end;