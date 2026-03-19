local l_Parent_0 = script:FindFirstAncestor("UserList").Parent;
local v1 = require(l_Parent_0.Signals);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v3 = require(l_Parent_0.UserProfiles);
local v4 = require(l_Parent_0.React);
local function _(v5, v6, v7) --[[ Line: 17 ]] --[[ Name: createUserProfileNameGetter ]]
    -- upvalues: v1 (copy)
    return v1.createComputed(function(v8) --[[ Line: 18 ]]
        -- upvalues: v6 (copy), v5 (copy), v7 (copy)
        if v6(v8) then
            return "";
        else
            local v9 = v5(v8);
            if not v9.data or #v9.data == 0 then
                return "";
            else
                local l_names_0 = v9.data[1].names;
                return v7(l_names_0) or "";
            end;
        end;
    end);
end;
return function(v12) --[[ Line: 31 ]] --[[ Name: useUserDataValues ]]
    -- upvalues: v3 (copy), v1 (copy), l_useSignalState_0 (copy), v4 (copy)
    local v13 = v3.Stores.UserProfileStore.get();
    local v14 = if v12 and v12 ~= "" then v13.fetchNamesByUserIds({
        v12
    }) else nil;
    local v16 = v1.createComputed(function(v15) --[[ Line: 35 ]]
        -- upvalues: v14 (copy)
        if not v14 then
            return true;
        else
            return v14(v15).status ~= "success";
        end;
    end);
    local v17 = l_useSignalState_0(v16);
    local function v21(v18) --[[ Line: 44 ]]
        local v19 = v18.getDisplayName(false);
        local v20 = v18.getUsername(false);
        return v19 or v20;
    end;
    local l_v21_0 = v21 --[[ copy: 6 -> 11 ]];
    local v26 = v1.createComputed(function(v23) --[[ Line: 18 ]]
        -- upvalues: v16 (copy), v14 (copy), l_v21_0 (copy)
        if v16(v23) then
            return "";
        else
            local v24 = v14(v23);
            if not v24.data or #v24.data == 0 then
                return "";
            else
                local l_names_1 = v24.data[1].names;
                return l_v21_0(l_names_1) or "";
            end;
        end;
    end);
    v21 = l_useSignalState_0(v26);
    local function v28(v27) --[[ Line: 51 ]]
        return v27.getUsername(false);
    end;
    local l_v28_0 = v28 --[[ copy: 8 -> 12 ]];
    local v33 = v1.createComputed(function(v30) --[[ Line: 18 ]]
        -- upvalues: v16 (copy), v14 (copy), l_v28_0 (copy)
        if v16(v30) then
            return "";
        else
            local v31 = v14(v30);
            if not v31.data or #v31.data == 0 then
                return "";
            else
                local l_names_2 = v31.data[1].names;
                return l_v28_0(l_names_2) or "";
            end;
        end;
    end);
    v28 = l_useSignalState_0(v33);
    local function v35(v34) --[[ Line: 56 ]]
        return v34.getCombinedName(false);
    end;
    local l_v35_0 = v35 --[[ copy: 10 -> 13 ]];
    local v40 = v1.createComputed(function(v37) --[[ Line: 18 ]]
        -- upvalues: v16 (copy), v14 (copy), l_v35_0 (copy)
        if v16(v37) then
            return "";
        else
            local v38 = v14(v37);
            if not v38.data or #v38.data == 0 then
                return "";
            else
                local l_names_3 = v38.data[1].names;
                return l_v35_0(l_names_3) or "";
            end;
        end;
    end);
    v35 = l_useSignalState_0(v40);
    return v4.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: v17 (copy), v21 (copy), v35 (copy), v28 (copy)
        return {
            isLoading = v17 or false, 
            displayName = v21 or "", 
            combinedName = v35 or "", 
            username = v28 or ""
        };
    end, {
        v12, 
        v17, 
        v21, 
        v35, 
        v28
    });
end;