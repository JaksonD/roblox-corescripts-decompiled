local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Components.UserProfileHeader);
local v5 = require(l_script_FirstAncestor_0.Components.About);
local v6 = require(l_script_FirstAncestor_0.Components.ContactDescription);
local v7 = require(l_script_FirstAncestor_0.Components.ProfileActionBar);
local v8 = require(l_script_FirstAncestor_0.Components.CommunityProfileHeader);
local v9 = require(l_script_FirstAncestor_0.Components.CoverPhoto);
local v10 = require(l_script_FirstAncestor_0.Components.CurrentlyWearing);
local v11 = require(l_script_FirstAncestor_0.Components.Store);
local v12 = require(l_script_FirstAncestor_0.Components.ViewFullProfile);
local v13 = require(l_script_FirstAncestor_0.Components.Inventory);
local v14 = require(l_script_FirstAncestor_0.Components.FavoriteExperiences);
local v15 = require(l_script_FirstAncestor_0.Components.ContactProfileHeader);
local v16 = require(l_script_FirstAncestor_0.Components.Experiences);
local v17 = require(l_script_FirstAncestor_0.Components.ExperiencesWideCarousel);
local v18 = require(l_script_FirstAncestor_0.Components.SocialLinks);
local v19 = require(l_script_FirstAncestor_0.Components.Videos);
local v20 = require(l_script_FirstAncestor_0.Components.CommunityLocked);
local v21 = require(l_script_FirstAncestor_0.Components.Events);
local v22 = require(l_script_FirstAncestor_0.Components.ProfileCompletion);
local v23 = require(l_script_FirstAncestor_0.Components.CurrentlyPlaying);
local v24 = require(l_Parent_0.ProfilePlatform.Common.Constants);
local v25 = require(l_Parent_0.ProfilePlatform.Common.Enums);
local v26 = require(l_script_FirstAncestor_0.Utils.getPeekViewOpenHeightByProfileType);
local v27 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableFavoriteExperiences);
local l_FFlagProfilePlatformEnableStore_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableStore;
local v29 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCommunityProfilePage);
local l_FFlagProfilePlatformEnableInventory_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableInventory;
local l_FFlagAddSocialLinksToCommunityProfile_0 = require(l_Parent_0.SharedFlags).FFlagAddSocialLinksToCommunityProfile;
local l_FFlagAddVideoToCommunityProfile_0 = require(l_Parent_0.SharedFlags).FFlagAddVideoToCommunityProfile;
local v33 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCoverPhoto);
local l_FFlagAddCommunityLockedToCommunityProfile_0 = require(l_Parent_0.SharedFlags).FFlagAddCommunityLockedToCommunityProfile;
local l_FFlagExperiencesOnProfile_0 = require(l_Parent_0.SharedFlags).FFlagExperiencesOnProfile;
local l_FFlagEnableProfileCompletion_0 = require(l_Parent_0.SharedFlags).FFlagEnableProfileCompletion;
local v37 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableLazyLoadingComponents);
local v38 = require(l_script_FirstAncestor_0.Flags.FFlagAddEventsToCommunityProfile);
local v39 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformAddCurrentlyPlaying);
local v40 = require(l_script_FirstAncestor_0.Flags.FFlagAboutBeforeActionClient);
local function v49(v41) --[[ Line: 51 ]] --[[ Name: orderWithAboutBeforeActions ]]
    -- upvalues: v40 (copy), v25 (copy), v2 (copy)
    if not v40 then
        return v41;
    else
        local v42 = nil;
        local v43 = nil;
        for v44, v45 in ipairs(v41) do
            if v45 == v25.Components.About then
                v42 = v44;
            elseif v45 == v25.Components.Actions then
                v43 = v44;
            end;
        end;
        if v42 == nil or v43 == nil or v42 < v43 then
            return v41;
        else
            local v46 = v2.List.join({}, v41);
            local v47 = v46[v43];
            local v48 = v46[v42];
            v46[v42] = v47;
            v46[v43] = v48;
            return v46;
        end;
    end;
end;
local v50 = {
    [v25.Components.UserProfileHeader] = v4, 
    [v25.Components.CurrentlyWearing] = v10, 
    [v25.Components.Actions] = v7, 
    [v25.Components.Experiences] = if l_FFlagExperiencesOnProfile_0 then v17 else v16, 
    [v25.Components.ViewFullProfile] = v12, 
    [v25.Components.About] = v5.About, 
    [v25.Components.FavoriteExperiences] = if v27 then v14 else nil, 
    [v25.Components.Inventory] = if l_FFlagProfilePlatformEnableInventory_0 then v13 else nil, 
    [v25.Components.Store] = if l_FFlagProfilePlatformEnableStore_0 then v11 else nil, 
    [v25.Components.ProfileCompletion] = if l_FFlagEnableProfileCompletion_0 then v22 else nil, 
    [v25.Components.CurrentlyPlaying] = if v39 then v23 else nil
};
local v51 = if v29 then {
    [v25.Components.CoverPhoto] = if v33 then v9 else nil, 
    [v25.Components.CommunityProfileHeader] = v8, 
    [v25.Components.About] = v5.About, 
    [v25.Components.Actions] = v7, 
    [v25.Components.Experiences] = v16, 
    [v25.Components.Store] = v11, 
    [v25.Components.SocialLinks] = if l_FFlagAddSocialLinksToCommunityProfile_0 then v18 else nil, 
    [v25.Components.Videos] = if l_FFlagAddVideoToCommunityProfile_0 then v19 else nil, 
    [v25.Components.ViewFullProfile] = v12, 
    [v25.Components.CommunityLocked] = if l_FFlagAddCommunityLockedToCommunityProfile_0 then v20 else nil, 
    [v25.Components.Events] = if v38 then v21 else nil
} else nil;
local v52 = {
    [v25.Components.ContactProfileHeader] = v15, 
    [v25.Components.ContactDescription] = v6, 
    [v25.Components.Actions] = v7
};
return function(v53, v54, v55) --[[ Line: 109 ]]
    -- upvalues: v3 (copy), v24 (copy), v2 (copy), v26 (copy), v25 (copy), v50 (copy), v29 (copy), v51 (copy), v52 (copy), v40 (copy), v49 (copy), v37 (copy)
    local v56 = v54 or {};
    local v57 = {
        Layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, v24.PAGE_PADDING)
        })
    };
    if v2.isEmpty(v56) then
        v57.loadingView = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v26(v55)), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        });
        return v57;
    else
        local v58 = {};
        if v55 == v25.ProfileTypes.User then
            v58 = v50;
        elseif v29 and v55 == v25.ProfileTypes.Community then
            v58 = v51;
        elseif v55 == v25.ProfileTypes.Contact then
            v58 = v52;
        end;
        local v59 = if v40 and v55 == v25.ProfileTypes.User then v49(v56) else v56;
        for v60, v61 in v59 do
            local v62 = v58[v61];
            if v37 then
                if v62 ~= nil and v53[v61] ~= nil then
                    v57[v61] = v3.createElement(v62, {
                        layoutOrder = v60
                    });
                end;
            elseif v62 ~= nil then
                v57[v61] = v3.createElement(v62, {
                    layoutOrder = v60
                });
            end;
        end;
        return v57;
    end;
end;