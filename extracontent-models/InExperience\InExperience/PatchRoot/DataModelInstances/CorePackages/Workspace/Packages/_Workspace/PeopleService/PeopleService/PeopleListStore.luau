local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Cryo);
local v3 = require(l_Parent_1.Signals);
local l_createSignalMap_0 = require(l_Parent_1.CoreScriptsRoactCommon).Utilities.createSignalMap;
local v5 = require(l_Parent_0.createPersonStore);
local v6 = require(l_Parent_0.PeopleUtility);
local l_GetFFlagPeoplePageEnablePersonSignalStore_0 = require(l_Parent_0.Flags).GetFFlagPeoplePageEnablePersonSignalStore;
local function v62(v8) --[[ Line: 36 ]] --[[ Name: createPeopleListStore ]]
    -- upvalues: l_GetFFlagPeoplePageEnablePersonSignalStore_0 (copy), l_createSignalMap_0 (copy), v6 (copy), v3 (copy), v2 (copy), v5 (copy)
    local v9 = v8 or game:GetService("Players");
    local l_v9_Players_0 = v9:GetPlayers();
    local v11 = if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then {} else nil;
    local v12 = if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then l_createSignalMap_0() else nil;
    l_v9_Players_0 = v6.sortPeople(l_v9_Players_0);
    local v13, v14 = v3.createSignal(l_v9_Players_0);
    local v15, v16 = v3.createSignal({});
    local v17 = {};
    local v18 = {};
    local v20 = v2.List.map(l_v9_Players_0, function(v19) --[[ Line: 62 ]]
        return v19.UserId;
    end);
    local function v27(v21) --[[ Line: 67 ]] --[[ Name: fetchProfiles ]]
        -- upvalues: v17 (ref), v6 (ref), v2 (ref), v16 (copy)
        local v22 = {};
        for _, v24 in v21 do
            local v25 = tostring(v24);
            if not v17[v25] then
                table.insert(v22, v25);
            end;
        end;
        if #v22 > 0 then
            local v26 = v6.getInExperienceCombinedName(v22);
            v17 = v2.Dictionary.join(v17, v26);
            v16(v17);
        end;
    end;
    local function v34(v28) --[[ Line: 90 ]] --[[ Name: fetchPlatformData ]]
        -- upvalues: v18 (ref), v6 (ref), v2 (ref)
        local v29 = {};
        for _, v31 in v28 do
            local v32 = tostring(v31);
            if not v18[v32] then
                table.insert(v29, v32);
            end;
        end;
        if #v29 > 0 then
            local v33 = v6.getPlatformData(v29);
            v18 = v2.Dictionary.join(v18, v33);
        end;
    end;
    local v37 = l_GetFFlagPeoplePageEnablePersonSignalStore_0() and function(v35) --[[ Line: 112 ]]
        -- upvalues: v11 (copy), v5 (ref), v12 (copy), v6 (ref)
        if v11[v35.UserId] then
            return;
        else
            local v36 = v5(v35);
            v11[v35.UserId] = v36;
            v12.setData(v35.UserId, {
                getPerson = v36.getPerson, 
                getOrder = v36.getOrder
            }, false);
            v6.sortPersonStores(v11);
            return;
        end;
    end or nil;
    local function v43(v38) --[[ Line: 130 ]] --[[ Name: addPerson ]]
        -- upvalues: l_GetFFlagPeoplePageEnablePersonSignalStore_0 (ref), v37 (copy), l_v9_Players_0 (ref), v6 (ref), v2 (ref), v14 (copy), v20 (ref), v27 (copy), v34 (copy)
        if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then
            v37(v38);
        end;
        local v39 = 1;
        for v40, v41 in l_v9_Players_0 do
            if v6.comparePeople(v38, v41) then
                v39 = v40;
                break;
            else
                v39 = v40 + 1;
            end;
        end;
        local _ = nil;
        l_v9_Players_0 = if #l_v9_Players_0 < v39 then v2.List.join(l_v9_Players_0, {
            v38
        }) else if l_GetFFlagPeoplePageEnablePersonSignalStore_0() and v39 == 1 then v2.List.join({
            v38
        }, l_v9_Players_0) else v2.List.join(v2.List.getRange(l_v9_Players_0, 1, v39 - 1), {
            v38
        }, v2.List.getRange(l_v9_Players_0, v39, #l_v9_Players_0));
        v14(l_v9_Players_0);
        v20 = v2.List.join(v20, {
            v38.UserId
        });
        v27({
            v38.UserId
        });
        v34({
            v38.UserId
        });
    end;
    local function v50(v44) --[[ Line: 171 ]] --[[ Name: removePerson ]]
        -- upvalues: l_GetFFlagPeoplePageEnablePersonSignalStore_0 (ref), v11 (copy), v12 (copy), v2 (ref), l_v9_Players_0 (ref), v14 (copy), v20 (ref), v17 (ref), v18 (ref), v16 (copy)
        if l_GetFFlagPeoplePageEnablePersonSignalStore_0() and v11[v44.UserId] then
            v11[v44.UserId] = nil;
            v12.removeData(v44.UserId, false);
        end;
        local v46 = v2.List.filter(l_v9_Players_0, function(v45) --[[ Line: 180 ]]
            -- upvalues: v44 (copy)
            return v45 ~= v44;
        end);
        if #v46 == #l_v9_Players_0 then
            return;
        else
            l_v9_Players_0 = v46;
            v14(l_v9_Players_0);
            local l_UserId_0 = v44.UserId;
            v20 = v2.List.filter(v20, function(v48) --[[ Line: 195 ]]
                -- upvalues: l_UserId_0 (copy)
                return v48 ~= l_UserId_0;
            end);
            local v49 = tostring(l_UserId_0);
            v17[v49] = nil;
            v18[v49] = nil;
            v16(v17);
            return;
        end;
    end;
    local function v53(v51) --[[ Line: 207 ]] --[[ Name: getProfile ]]
        -- upvalues: v17 (ref), v27 (copy)
        local v52 = tostring(v51);
        if not v17[v52] then
            v27({
                v51
            });
        end;
        return v17[v52];
    end;
    local function v56(v54) --[[ Line: 219 ]] --[[ Name: getPlatformName ]]
        -- upvalues: v18 (ref), v34 (copy)
        local v55 = tostring(v54);
        if not v18[v55] then
            v34({
                v54
            });
        end;
        return v18[v55].platformName;
    end;
    local function v59(v57) --[[ Line: 231 ]] --[[ Name: getPlatformProfileId ]]
        -- upvalues: v18 (ref), v34 (copy)
        local v58 = tostring(v57);
        if not v18[v58] then
            v34({
                v57
            });
        end;
        return v18[v58].platformProfileId;
    end;
    v27(v20);
    v34(v20);
    v9.PlayerAdded:Connect(v43);
    v9.PlayerRemoving:Connect(v50);
    if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then
        for _, v61 in v9:GetPlayers() do
            v37(v61);
        end;
    end;
    return {
        people = v13, 
        peopleSignalMap = if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then v12 else nil, 
        peopleProfiles = v15, 
        getProfile = v53, 
        getPlatformName = v56, 
        getPlatformProfileId = v59
    };
end;
if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then
    return v62;
else
    return (v62());
end;