local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UserLib);
local l_Constants_0 = v3.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v3.Utils.getRbxthumbWithTypeSizeAndOptions;
local v6 = require(l_Parent_0.VerifiedBadges);
local v7 = require(l_script_FirstAncestor_0.Common.Enums);
local v8 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v9 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v10 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities);
local v12 = require(l_script_FirstAncestor_0.Components.CommunityProfileHeader.CommunityProfileHeader);
return function(v13) --[[ Line: 35 ]] --[[ Name: CommunityProfileHeaderContainer ]]
    -- upvalues: v10 (copy), v9 (copy), v7 (copy), v6 (copy), v8 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), v2 (copy), v12 (copy), v11 (copy)
    local l_profileId_0 = v10().profileId;
    local v15 = v9(v7.Components.CommunityProfileHeader);
    local v16 = if v15.isVerified then ("%*%*"):format(v15.name, v6.emoji.verified) else v15.name;
    local v17 = if v15.ownerIsVerified then ("%*%*"):format(v15.ownerName, v6.emoji.verified) else v15.ownerName;
    local v18 = v8(v15, "counts.membersCount") or 0;
    local v19 = l_getRbxthumbWithTypeSizeAndOptions_0(l_profileId_0, l_Constants_0.RbxthumbTypes.GroupIcon, 150);
    return v2.createElement(v12, {
        layoutOrder = v13.layoutOrder, 
        name = v16, 
        ownerName = v17, 
        membersCount = v18, 
        hasSocialModules = if v11 then v15.hasSocialModules else nil, 
        thumbnail = v19
    });
end;