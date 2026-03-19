local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.UserProfiles);
local l_sortTableByValue_0 = require(l_Parent_1.CoreScriptsRoactCommon).Utilities.sortTableByValue;
local _ = require(l_Parent_0.createPersonStore);
local l_GetFFlagPeoplePageEnablePersonSignalStore_0 = require(l_Parent_0.Flags).GetFFlagPeoplePageEnablePersonSignalStore;
local _, l_result_0 = pcall(function() --[[ Line: 20 ]]
    return game:GetService("PlatformFriendsService");
end);
local l_UserProfileStore_0 = v3.Stores.UserProfileStore;
local function v15(v10) --[[ Line: 27 ]] --[[ Name: getInExperienceCombinedName ]]
    -- upvalues: l_UserProfileStore_0 (copy)
    local l_data_0 = l_UserProfileStore_0.get().fetchNamesByUserIds(v10)(false).data;
    local v12 = {};
    for v13, v14 in l_data_0 do
        v12[v10[v13]] = v14.names.getInExperienceCombinedName;
    end;
    return v12;
end;
local function v21(v16) --[[ Line: 41 ]] --[[ Name: getPlatformData ]]
    -- upvalues: l_UserProfileStore_0 (copy)
    local l_data_1 = l_UserProfileStore_0.get().fetchNamesByUserIds(v16)(false).data;
    local v18 = {};
    for v19, v20 in l_data_1 do
        v18[v16[v19]] = {
            platformName = v20.names.getPlatformName, 
            platformProfileId = v20.getPlatformProfileId
        };
    end;
    return v18;
end;
local function v23(v22) --[[ Line: 58 ]] --[[ Name: canShowPlatformProfile ]]
    -- upvalues: l_result_0 (copy)
    return game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") and l_result_0 and l_result_0:IsProfileEnabled() and v22 and v22 ~= "";
end;
local function v25(v24) --[[ Line: 67 ]] --[[ Name: showPlatformProfile ]]
    -- upvalues: l_result_0 (copy)
    if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") and l_result_0 and l_result_0:IsProfileEnabled() and v24 and v24 ~= "" then
        l_result_0:ShowProfile(v24);
    end;
end;
local function v31(v26, v27) --[[ Line: 73 ]] --[[ Name: comparePeople ]]
    -- upvalues: l_Players_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local v29 = v26.Name:lower();
    local v30 = v27.Name:lower();
    if v26 == l_LocalPlayer_0 then
        v29 = " ";
    end;
    if v27 == l_LocalPlayer_0 then
        v30 = " ";
    end;
    return v29 < v30;
end;
local function v33(v32) --[[ Line: 90 ]] --[[ Name: sortPeople ]]
    -- upvalues: v31 (copy)
    table.sort(v32, v31);
    return v32;
end;
local v45 = l_GetFFlagPeoplePageEnablePersonSignalStore_0() and function(v34) --[[ Line: 96 ]]
    -- upvalues: l_sortTableByValue_0 (copy), l_Players_0 (copy)
    for v42, v43 in (l_sortTableByValue_0(v34, function(v35, v36) --[[ Line: 97 ]]
        -- upvalues: l_Players_0 (ref)
        local v37 = v35.value.getPerson();
        local v38 = v36.value.getPerson();
        local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
        local v40 = v37.Name:lower();
        local v41 = v38.Name:lower();
        if v37 == l_LocalPlayer_1 then
            v40 = " ";
        end;
        if v38 == l_LocalPlayer_1 then
            v41 = " ";
        end;
        return v40 < v41;
    end)) do
        local v44 = v34[v43.key];
        if v44 then
            v44.setOrder(v42);
        end;
    end;
end or nil;
return {
    getInExperienceCombinedName = v15, 
    getPlatformData = v21, 
    canShowPlatformProfile = v23, 
    showPlatformProfile = v25, 
    comparePeople = v31, 
    sortPeople = v33, 
    sortPersonStores = if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then v45 else nil, 
    showPersonButtons = function(v46, v47) --[[ Line: 111 ]] --[[ Name: showPersonButtons ]]
        -- upvalues: l_Players_0 (copy)
        local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
        local v49 = false;
        if v46 ~= nil then
            v49 = false;
            if l_LocalPlayer_2 ~= nil then
                v49 = false;
                if v46 ~= l_LocalPlayer_2 then
                    v49 = false;
                    if v47 > 0 then
                        v49 = l_LocalPlayer_2.UserId > 0;
                    end;
                end;
            end;
        end;
        return v49;
    end
};