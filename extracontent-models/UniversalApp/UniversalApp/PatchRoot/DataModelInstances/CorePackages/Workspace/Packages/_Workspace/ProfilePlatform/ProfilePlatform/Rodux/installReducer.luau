local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Rodux.Games);
local v4 = require(l_script_FirstAncestor_0.Rodux.ItemDetails);
local v5 = require(l_script_FirstAncestor_0.Rodux.BundleDetails);
local v6 = require(l_script_FirstAncestor_0.Rodux.AssetDetails);
local v7 = require(l_script_FirstAncestor_0.Rodux.AssetData);
local v8 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworking);
local v9 = require(l_script_FirstAncestor_0.Rodux.Presence);
local v10 = game:DefineFastFlag("ProfilePlatformFixPresenceReducer", false);
local v11 = if v10 then require(l_script_FirstAncestor_0.Rodux.PresenceReducer) else nil;
local v12 = require(l_script_FirstAncestor_0.Rodux.Profiles);
local l_FFlagEnableProfilePlatformCatalogNetworking_0 = require(l_Parent_0.SharedFlags).FFlagEnableProfilePlatformCatalogNetworking;
local l_FFlagAddVideoToCommunityProfile_0 = require(l_Parent_0.SharedFlags).FFlagAddVideoToCommunityProfile;
return function() --[[ Line: 26 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), l_FFlagEnableProfilePlatformCatalogNetworking_0 (copy), v5 (copy), v6 (copy), l_FFlagAddVideoToCommunityProfile_0 (copy), v7 (copy), v8 (copy), v10 (copy), v11 (copy), v9 (copy), v12 (copy)
    return v2.combineReducers({
        Games = v3.installReducer(), 
        ItemAssets = v4, 
        BundleDetails = if l_FFlagEnableProfilePlatformCatalogNetworking_0 then v5 else nil, 
        AssetDetails = if l_FFlagEnableProfilePlatformCatalogNetworking_0 then v6 else nil, 
        AssetData = if l_FFlagAddVideoToCommunityProfile_0 then v7 else nil, 
        NetworkStatus = v8.installReducer(), 
        Presence = if v10 then v11 else v9.installReducer(), 
        Profiles = v12
    });
end;