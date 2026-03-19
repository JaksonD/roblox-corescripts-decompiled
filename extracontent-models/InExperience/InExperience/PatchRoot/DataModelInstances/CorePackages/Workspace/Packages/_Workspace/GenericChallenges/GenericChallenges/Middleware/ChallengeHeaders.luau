local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local v1 = require(l_script_FirstAncestor_0.Utils.constants);
local v2 = require(l_script_FirstAncestor_0.Types.GenericType);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Base64_0 = require(l_Parent_0.AuthCommon).Utils.Base64;
local l_HttpService_0 = game:GetService("HttpService");
local v6 = {};
v6.__index = v6;
v6.new = function(v7) --[[ Line: 41 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), l_Base64_0 (copy), l_HttpService_0 (copy), v2 (copy), v6 (copy)
    local v8 = {
        challengeId = v7[v1.challengeIdHeader]
    };
    local v9 = l_Base64_0.Decode(v7[v1.challengeMetadataHeader]);
    v8.challengeMetadata = {
        raw = v7[v1.challengeMetadataHeader], 
        decoded = v9, 
        typed = l_HttpService_0:JSONDecode(v9)
    };
    v8.challengeType = {
        raw = v7[v1.challengeTypeHeader], 
        typed = v2.fromRawValue(v7[v1.challengeTypeHeader])
    };
    return (setmetatable(v8, v6));
end;
return v6;