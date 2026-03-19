local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local l_useSignalBinding_0 = require(l_Parent_0.SignalsReact).useSignalBinding;
local v4 = require(l_Parent_0.UserProfiles);
local v5 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.types);
local v7 = require(script.Parent.useFoundationPresence);
local function _(v8, v9, v10) --[[ Line: 14 ]] --[[ Name: createUserProfileNameGetter ]]
    -- upvalues: v2 (copy)
    return v2.createComputed(function(v11) --[[ Line: 15 ]]
        -- upvalues: v9 (copy), v8 (copy), v10 (copy)
        if v9(v11) then
            return "";
        else
            local v12 = v8(v11);
            if not v12.data or #v12.data == 0 then
                return "";
            else
                local l_names_0 = v12.data[1].names;
                return v10(l_names_0) or "";
            end;
        end;
    end);
end;
return function(v15) --[[ Line: 28 ]] --[[ Name: useUserData ]]
    -- upvalues: v4 (copy), v2 (copy), l_useSignalBinding_0 (copy), v7 (copy), v5 (copy)
    local v16 = v4.Stores.UserProfileStore.get();
    local v17 = if v15 and v15 ~= "" then v16.fetchNamesByUserIds({
        v15
    }) else nil;
    local v19 = v2.createComputed(function(v18) --[[ Line: 31 ]]
        -- upvalues: v17 (copy)
        if not v17 then
            return true;
        else
            return v17(v18).status ~= "success";
        end;
    end);
    local v20 = l_useSignalBinding_0(v19);
    local function v24(v21) --[[ Line: 40 ]]
        local v22 = v21.getDisplayName(false);
        local v23 = v21.getUsername(false);
        return v22 or v23;
    end;
    local l_v24_0 = v24 --[[ copy: 6 -> 12 ]];
    local v29 = v2.createComputed(function(v26) --[[ Line: 15 ]]
        -- upvalues: v19 (copy), v17 (copy), l_v24_0 (copy)
        if v19(v26) then
            return "";
        else
            local v27 = v17(v26);
            if not v27.data or #v27.data == 0 then
                return "";
            else
                local l_names_1 = v27.data[1].names;
                return l_v24_0(l_names_1) or "";
            end;
        end;
    end);
    v24 = l_useSignalBinding_0(v29);
    local function v31(v30) --[[ Line: 47 ]]
        return v30.getUsername(false);
    end;
    local l_v31_0 = v31 --[[ copy: 8 -> 13 ]];
    local v36 = v2.createComputed(function(v33) --[[ Line: 15 ]]
        -- upvalues: v19 (copy), v17 (copy), l_v31_0 (copy)
        if v19(v33) then
            return "";
        else
            local v34 = v17(v33);
            if not v34.data or #v34.data == 0 then
                return "";
            else
                local l_names_2 = v34.data[1].names;
                return l_v31_0(l_names_2) or "";
            end;
        end;
    end);
    v31 = l_useSignalBinding_0(v36);
    local function v38(v37) --[[ Line: 52 ]]
        return v37.getCombinedName(false);
    end;
    local l_v38_0 = v38 --[[ copy: 10 -> 14 ]];
    local v43 = v2.createComputed(function(v40) --[[ Line: 15 ]]
        -- upvalues: v19 (copy), v17 (copy), l_v38_0 (copy)
        if v19(v40) then
            return "";
        else
            local v41 = v17(v40);
            if not v41.data or #v41.data == 0 then
                return "";
            else
                local l_names_3 = v41.data[1].names;
                return l_v38_0(l_names_3) or "";
            end;
        end;
    end);
    v38 = l_useSignalBinding_0(v43);
    local v44 = v7(v15);
    return v5.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: v20 (copy), v15 (copy), v24 (copy), v38 (copy), v31 (copy), v44 (copy)
        return {
            isLoading = v20, 
            id = tonumber(v15) or -1, 
            displayName = v24, 
            combinedName = v38, 
            username = v31, 
            presenceText = v44.presenceText, 
            presence = v44.presence
        };
    end, {
        v15, 
        v44
    });
end;