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
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagEnablePressingCommunityOwnerInPeekView);
local v13 = require(l_script_FirstAncestor_0.Components.CommunityProfileHeader.CommunityProfileHeader);
return function(v14) --[[ Line: 38 ]] --[[ Name: CommunityProfileHeaderContainer ]]
    -- upvalues: v10 (copy), v9 (copy), v7 (copy), v6 (copy), v8 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), v12 (copy), v2 (copy), v13 (copy), v11 (copy)
    local l_profileId_0 = v10().profileId;
    local v16 = v9(v7.Components.CommunityProfileHeader);
    local v17 = if v16.isVerified then ("%*%*"):format(v16.name, v6.emoji.verified) else v16.name;
    local v18 = if v16.ownerIsVerified then ("%*%*"):format(v16.ownerName, v6.emoji.verified) else v16.ownerName;
    local v19 = v8(v16, "counts.membersCount") or 0;
    local v20 = l_getRbxthumbWithTypeSizeAndOptions_0(l_profileId_0, l_Constants_0.RbxthumbTypes.GroupIcon, 150);
    local v21 = if v12 then v16.ownerUserId else nil;
    return v2.createElement(v13, {
        layoutOrder = v14.layoutOrder, 
        name = v17, 
        ownerName = v18, 
        membersCount = v19, 
        hasSocialModules = if v11 then v16.hasSocialModules else nil, 
        thumbnail = v20, 
        ownerUserId = if v12 then v21 else nil
    });
end;