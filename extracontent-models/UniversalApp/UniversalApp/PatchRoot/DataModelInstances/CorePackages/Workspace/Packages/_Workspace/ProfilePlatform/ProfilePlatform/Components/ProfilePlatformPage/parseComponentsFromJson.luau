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
local v22 = require(l_script_FirstAncestor_0.Components.CurrentlyPlaying);
local v23 = require(l_Parent_0.ProfilePlatform.Common.Constants);
local v24 = require(l_Parent_0.ProfilePlatform.Common.Enums);
local v25 = require(l_script_FirstAncestor_0.Utils.getPeekViewOpenHeightByProfileType);
local v26 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableFavoriteExperiences);
local l_FFlagProfilePlatformEnableStore_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableStore;
local v28 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCommunityProfilePage);
local l_FFlagProfilePlatformEnableInventory_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableInventory;
local l_FFlagAddSocialLinksToCommunityProfile_0 = require(l_Parent_0.SharedFlags).FFlagAddSocialLinksToCommunityProfile;
local l_FFlagAddVideoToCommunityProfile_0 = require(l_Parent_0.SharedFlags).FFlagAddVideoToCommunityProfile;
local v32 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCoverPhoto);
local l_FFlagAddCommunityLockedToCommunityProfile_0 = require(l_Parent_0.SharedFlags).FFlagAddCommunityLockedToCommunityProfile;
local l_FFlagExperiencesOnProfile_0 = require(l_Parent_0.SharedFlags).FFlagExperiencesOnProfile;
local v35 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableLazyLoadingComponents);
local v36 = require(l_script_FirstAncestor_0.Flags.FFlagAddEventsToCommunityProfile);
local v37 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformAddCurrentlyPlaying);
local v38 = require(l_script_FirstAncestor_0.Flags.FFlagAboutBeforeActionClient);
local function v47(v39) --[[ Line: 49 ]] --[[ Name: orderWithAboutBeforeActions ]]
    -- upvalues: v38 (copy), v24 (copy), v2 (copy)
    if not v38 then
        return v39;
    else
        local v40 = nil;
        local v41 = nil;
        for v42, v43 in ipairs(v39) do
            if v43 == v24.Components.About then
                v40 = v42;
            elseif v43 == v24.Components.Actions then
                v41 = v42;
            end;
        end;
        if v40 == nil or v41 == nil or v40 < v41 then
            return v39;
        else
            local v44 = v2.List.join({}, v39);
            local v45 = v44[v41];
            local v46 = v44[v40];
            v44[v40] = v45;
            v44[v41] = v46;
            return v44;
        end;
    end;
end;
local v48 = {
    [v24.Components.UserProfileHeader] = v4, 
    [v24.Components.CurrentlyWearing] = v10, 
    [v24.Components.Actions] = v7, 
    [v24.Components.Experiences] = if l_FFlagExperiencesOnProfile_0 then v17 else v16, 
    [v24.Components.ViewFullProfile] = v12, 
    [v24.Components.About] = v5.About, 
    [v24.Components.FavoriteExperiences] = if v26 then v14 else nil, 
    [v24.Components.Inventory] = if l_FFlagProfilePlatformEnableInventory_0 then v13 else nil, 
    [v24.Components.Store] = if l_FFlagProfilePlatformEnableStore_0 then v11 else nil, 
    [v24.Components.CurrentlyPlaying] = if v37 then v22 else nil
};
local v49 = if v28 then {
    [v24.Components.CoverPhoto] = if v32 then v9 else nil, 
    [v24.Components.CommunityProfileHeader] = v8, 
    [v24.Components.About] = v5.About, 
    [v24.Components.Actions] = v7, 
    [v24.Components.Experiences] = v16, 
    [v24.Components.Store] = v11, 
    [v24.Components.SocialLinks] = if l_FFlagAddSocialLinksToCommunityProfile_0 then v18 else nil, 
    [v24.Components.Videos] = if l_FFlagAddVideoToCommunityProfile_0 then v19 else nil, 
    [v24.Components.ViewFullProfile] = v12, 
    [v24.Components.CommunityLocked] = if l_FFlagAddCommunityLockedToCommunityProfile_0 then v20 else nil, 
    [v24.Components.Events] = if v36 then v21 else nil
} else nil;
local v50 = {
    [v24.Components.ContactProfileHeader] = v15, 
    [v24.Components.ContactDescription] = v6, 
    [v24.Components.Actions] = v7
};
return function(v51, v52, v53) --[[ Line: 106 ]]
    -- upvalues: v3 (copy), v23 (copy), v2 (copy), v25 (copy), v24 (copy), v48 (copy), v28 (copy), v49 (copy), v50 (copy), v38 (copy), v47 (copy), v35 (copy)
    local v54 = v52 or {};
    local v55 = {
        Layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, v23.PAGE_PADDING)
        })
    };
    if v2.isEmpty(v54) then
        v55.loadingView = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v25(v53)), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        });
        return v55;
    else
        local v56 = {};
        if v53 == v24.ProfileTypes.User then
            v56 = v48;
        elseif v28 and v53 == v24.ProfileTypes.Community then
            v56 = v49;
        elseif v53 == v24.ProfileTypes.Contact then
            v56 = v50;
        end;
        local v57 = if v38 and v53 == v24.ProfileTypes.User then v47(v54) else v54;
        for v58, v59 in v57 do
            local v60 = v56[v59];
            if v35 then
                if v60 ~= nil and v51[v59] ~= nil then
                    v55[v59] = v3.createElement(v60, {
                        layoutOrder = v58
                    });
                end;
            elseif v60 ~= nil then
                v55[v59] = v3.createElement(v60, {
                    layoutOrder = v58
                });
            end;
        end;
        return v55;
    end;
end;