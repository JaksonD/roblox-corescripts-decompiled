local l_script_FirstAncestor_0 = script:FindFirstAncestor("Groups");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v5 = require(l_script_FirstAncestor_0.Networking.GroupsWebApi);
local v6 = {
    isLoading = false, 
    loadFailure = false, 
    groupsList = nil, 
    canCreateGroup = true
};
local function v13(v7, v8) --[[ Line: 38 ]] --[[ Name: translateResultToGroup ]]
    local v9 = v7.group or {};
    local v10 = v7.role or {};
    local v11 = if v10.rank then v10.rank else 0;
    local l_owner_0 = v9.owner;
    return {
        id = if v9.id then v9.id else 0, 
        name = v9.name, 
        memberCount = v9.memberCount, 
        role = {
            name = v10.name, 
            rank = v11
        }, 
        isPrimary = v7.isPrimaryGroup or false, 
        isOwner = if l_owner_0 and l_owner_0.userId then tostring(l_owner_0.userId) == v8 else false, 
        groupHasVerifiedBadge = v9.hasVerifiedBadge or false, 
        hasSocialModules = v9.hasSocialModules or false, 
        thumbnail = v9.emblemUrl
    };
end;
local function v22(v14, v15) --[[ Line: 62 ]] --[[ Name: compareNames ]]
    local v16 = string.lower(v14);
    local v17 = string.lower(v15);
    local v18 = string.sub(v16, 1, 1);
    local v19 = string.sub(v17, 1, 1);
    local v20 = false;
    if v18 >= "a" then
        v20 = v18 <= "z";
    end;
    local v21 = false;
    if v19 >= "a" then
        v21 = v19 <= "z";
    end;
    if not v20 and v21 then
        return true;
    elseif v20 and not v21 then
        return false;
    else
        return v16 < v17;
    end;
end;
local function _(v23) --[[ Line: 82 ]] --[[ Name: sortGroups ]]
    -- upvalues: v22 (copy)
    local v24 = table.clone(v23);
    table.sort(v24, function(v25, v26) --[[ Line: 84 ]]
        -- upvalues: v22 (ref)
        local v27 = v25.isOwner or false;
        local v28 = v26.isOwner or false;
        local v29 = v25.name or "";
        local v30 = v26.name or "";
        if v27 and v28 then
            return (v22(v29, v30));
        elseif v27 then
            return true;
        elseif v28 then
            return false;
        else
            return (v22(v29, v30));
        end;
    end);
    return v24;
end;
local function v41(v32, v33) --[[ Line: 107 ]] --[[ Name: getVisibleGroups ]]
    if not v33 or not v33.groups then
        return {};
    else
        local v34 = {};
        for _, v36 in ipairs(v32) do
            v34[v36.id] = v36;
        end;
        local v37 = {};
        for _, v39 in ipairs(v33.groups) do
            if v39 and v39.canViewGroup and v39.groupId then
                local v40 = tonumber(v39.groupId);
                if v40 and v34[v40] then
                    table.insert(v37, v34[v40]);
                end;
            end;
        end;
        return v37;
    end;
end;
local function v49(v42) --[[ Line: 133 ]] --[[ Name: movePrimaryGroupToFront ]]
    local v43 = nil;
    for v44, v45 in ipairs(v42) do
        if v45.isPrimary then
            v43 = v44;
            break;
        end;
    end;
    if not v43 then
        return v42;
    else
        local v46 = {};
        table.insert(v46, v42[v43]);
        for v47, v48 in ipairs(v42) do
            if v47 ~= v43 then
                table.insert(v46, v48);
            end;
        end;
        return v46;
    end;
end;
local function _(v50) --[[ Line: 159 ]] --[[ Name: deriveCanCreateGroup ]]
    if not v50 then
        return true;
    else
        local l_groupLimit_0 = v50.groupLimit;
        local l_currentGroupCount_0 = v50.currentGroupCount;
        if l_groupLimit_0 and l_currentGroupCount_0 then
            return l_currentGroupCount_0 < l_groupLimit_0;
        else
            return true;
        end;
    end;
end;
local function v58(v54) --[[ Line: 171 ]] --[[ Name: collectGroupIds ]]
    if not v54 then
        return {};
    else
        local v55 = {};
        for _, v57 in ipairs(v54) do
            if v57.group and v57.group.id then
                table.insert(v55, v57.group.id);
            end;
        end;
        return v55;
    end;
end;
return function() --[[ Line: 184 ]] --[[ Name: createGroupsListStore ]]
    -- upvalues: v2 (copy), v6 (copy), v5 (copy), v58 (copy), v3 (copy), v13 (copy), v41 (copy), v22 (copy), v49 (copy)
    local v59, v60 = v2.createSignal(v6);
    local v61 = {};
    local v62 = {};
    local function v67() --[[ Line: 190 ]] --[[ Name: cleanup ]]
        -- upvalues: v61 (ref), v62 (ref)
        for _, v64 in v61 do
            v64();
        end;
        for _, v66 in v62 do
            v66();
        end;
        v61 = {};
        v62 = {};
    end;
    local function v107(v68) --[[ Line: 201 ]] --[[ Name: fetchGroups ]]
        -- upvalues: v67 (copy), v60 (copy), v5 (ref), v62 (ref), v2 (ref), v58 (ref), v3 (ref), v13 (ref), v41 (ref), v22 (ref), v49 (ref), v61 (ref)
        v67();
        v60({
            isLoading = true, 
            loadFailure = false, 
            groupsList = nil, 
            canCreateGroup = true
        });
        local v69, v70 = v5.GetUserGroupsWithRoles(v68);
        local v71, v72 = v5.GetGroupsMetadata();
        table.insert(v62, v70);
        table.insert(v62, v72);
        local v73 = false;
        local v106 = v2.createEffect(function(v74) --[[ Line: 220 ]]
            -- upvalues: v73 (ref), v69 (copy), v60 (ref), v58 (ref), v5 (ref), v62 (ref), v2 (ref), v71 (copy), v3 (ref), v13 (ref), v68 (copy), v41 (ref), v22 (ref), v49 (ref), v61 (ref)
            if v73 then
                return;
            else
                local v75 = v69(v74);
                if v75.status == "Loading" then
                    return;
                elseif v75.status == "Failed" then
                    v73 = true;
                    v60({
                        isLoading = false, 
                        loadFailure = true, 
                        groupsList = nil, 
                        canCreateGroup = true
                    });
                    return;
                else
                    local v76 = if v75.data and v75.data.data then v75.data.data else {};
                    if #v76 == 0 then
                        v73 = true;
                        v60({
                            isLoading = false, 
                            loadFailure = false, 
                            groupsList = {}, 
                            canCreateGroup = true
                        });
                        return;
                    else
                        local v77 = v58(v76);
                        local v78, v79 = v5.GetGroupPolicies(v77);
                        table.insert(v62, v79);
                        local v105 = v2.createEffect(function(v80) --[[ Line: 260 ]]
                            -- upvalues: v73 (ref), v78 (copy), v71 (ref), v3 (ref), v76 (copy), v13 (ref), v68 (ref), v41 (ref), v22 (ref), v60 (ref), v49 (ref)
                            if v73 then
                                return;
                            else
                                local v81 = v78(v80);
                                if v81.status == "Loading" then
                                    return;
                                else
                                    local v82 = v71(v80);
                                    local v83 = if v82.status == "Success" then v82.data else nil;
                                    v73 = true;
                                    local v84 = if v81.status == "Success" then v81.data else nil;
                                    local v86 = v3.List.map(v76, function(v85) --[[ Line: 278 ]]
                                        -- upvalues: v13 (ref), v68 (ref)
                                        return (v13(v85, v68));
                                    end);
                                    local v87 = if v84 then v41(v86, v84) else {};
                                    local v88 = table.clone(v87);
                                    table.sort(v88, function(v89, v90) --[[ Line: 84 ]]
                                        -- upvalues: v22 (ref)
                                        local v91 = v89.isOwner or false;
                                        local v92 = v90.isOwner or false;
                                        local v93 = v89.name or "";
                                        local v94 = v90.name or "";
                                        if v91 and v92 then
                                            return (v22(v93, v94));
                                        elseif v91 then
                                            return true;
                                        elseif v92 then
                                            return false;
                                        else
                                            return (v22(v93, v94));
                                        end;
                                    end);
                                    local l_v88_0 = v88;
                                    if #l_v88_0 == 0 then
                                        v88 = v60;
                                        local v96 = {
                                            isLoading = false, 
                                            loadFailure = false, 
                                            groupsList = {}
                                        };
                                        local v97;
                                        if not v83 then
                                            v97 = true;
                                        else
                                            local l_groupLimit_1 = v83.groupLimit;
                                            local l_currentGroupCount_1 = v83.currentGroupCount;
                                            v97 = not l_groupLimit_1 or not l_currentGroupCount_1 or l_currentGroupCount_1 < l_groupLimit_1;
                                        end;
                                        v96.canCreateGroup = v97;
                                        v88(v96);
                                        return;
                                    else
                                        v88 = v49(l_v88_0);
                                        local l_v60_0 = v60;
                                        local v101 = {
                                            isLoading = false, 
                                            loadFailure = false, 
                                            groupsList = v88
                                        };
                                        local v102;
                                        if not v83 then
                                            v102 = true;
                                        else
                                            local l_groupLimit_2 = v83.groupLimit;
                                            local l_currentGroupCount_2 = v83.currentGroupCount;
                                            v102 = not l_groupLimit_2 or not l_currentGroupCount_2 or l_currentGroupCount_2 < l_groupLimit_2;
                                        end;
                                        v101.canCreateGroup = v102;
                                        l_v60_0(v101);
                                        return;
                                    end;
                                end;
                            end;
                        end);
                        table.insert(v61, v105);
                        return;
                    end;
                end;
            end;
        end);
        table.insert(v61, v106);
    end;
    local function v108() --[[ Line: 311 ]] --[[ Name: reset ]]
        -- upvalues: v67 (copy), v60 (copy), v6 (ref)
        v67();
        v60(v6);
    end;
    return {
        getState = v59, 
        fetchGroups = v107, 
        reset = v108
    };
end;