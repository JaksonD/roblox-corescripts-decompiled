local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialProof");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SocialProofNetworking);
local v3 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworking);
return (v2.config({
    roduxNetworking = v3
}));