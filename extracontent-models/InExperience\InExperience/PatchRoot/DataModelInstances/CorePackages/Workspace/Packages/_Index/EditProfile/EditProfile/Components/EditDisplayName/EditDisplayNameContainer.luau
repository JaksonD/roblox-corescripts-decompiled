local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.EditDisplayName);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v5 = require(l_Parent_0.UserProfiles).Stores.UserProfileStore.get();
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v7 = require(l_script_FirstAncestor_0.Stores.Requests.updateUserDisplayName);
local v8 = require(l_script_FirstAncestor_0.Stores.Requests.validateUserDisplayName);
local v9 = require(l_script_FirstAncestor_0.Analytics.AnalyticsServiceV2);
return function(v10) --[[ Line: 21 ]]
    -- upvalues: l_useLocalUserId_0 (copy), v2 (copy), v5 (copy), l_useSignalState_0 (copy), v9 (copy), v7 (copy), v8 (copy), v3 (copy)
    local v11 = l_useLocalUserId_0();
    local v12 = v2.useMemo(function() --[[ Line: 23 ]]
        -- upvalues: v5 (ref), v11 (copy)
        return v5.fetchNamesByUserIds({
            (tostring(v11))
        });
    end, {
        v11
    });
    local v13 = l_useSignalState_0(v12);
    local v14 = v2.useMemo(function() --[[ Line: 28 ]]
        -- upvalues: v13 (copy)
        if v13 and v13.status == "success" and v13.data and #v13.data > 0 then
            return v13.data[1].names.getDisplayName(false) or "";
        else
            return "";
        end;
    end, {
        v13
    });
    local v15, v16 = v2.useState(v14);
    local v18 = v2.useCallback(function(v17) --[[ Line: 36 ]]
        -- upvalues: v16 (copy)
        v16(v17);
    end, {});
    v2.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: v9 (ref)
        v9.sendDisplayNameModalLoaded();
    end, {});
    v2.useEffect(function() --[[ Line: 44 ]]
        -- upvalues: v10 (copy), v7 (ref), v11 (copy), v15 (copy), v9 (ref), v13 (copy)
        v10.registerSaveHandler(function() --[[ Line: 45 ]]
            -- upvalues: v7 (ref), v11 (ref), v15 (ref), v9 (ref), v13 (ref)
            return v7(tostring(v11), v15):andThen(function(v19) --[[ Line: 46 ]]
                -- upvalues: v9 (ref), v15 (ref), v13 (ref)
                v9.sendDisplayNameSaved(v15);
                if v13 and v13.data and #v13.data > 0 then
                    local v20 = v13.data[1];
                    if v20.names.setDisplayName then
                        v20.names.setDisplayName(v19);
                    end;
                end;
            end);
        end);
    end, {
        v10.registerSaveHandler, 
        v11, 
        v15, 
        v13
    });
    local function v22(v21) --[[ Line: 58 ]] --[[ Name: validateDisplayName ]]
        -- upvalues: v8 (ref), v11 (copy)
        return v8(tostring(v11), v21);
    end;
    return v2.createElement(v3, {
        initialDisplayName = v14, 
        onDataChange = v18, 
        validateDisplayName = v22, 
        updateErrorState = v10.updateErrorState, 
        textBoxRef = v10.textBoxRef
    });
end;