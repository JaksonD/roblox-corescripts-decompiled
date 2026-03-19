local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local l_ArraySet_0 = require(l_script_FirstAncestor_0.DataStructures).ArraySet;
return function() --[[ Line: 35 ]] --[[ Name: createSelectedUsersStore ]]
    -- upvalues: v2 (copy), l_ArraySet_0 (copy), l_Signal_0 (copy)
    local v5, v6 = v2.createSignal(0);
    local v7, v8 = v2.createSignal(l_ArraySet_0.new({}));
    local v11 = v2.createComputed(function(v9) --[[ Line: 43 ]]
        -- upvalues: v7 (copy), v5 (copy)
        local v10 = v7(v9);
        return v5(v9) > v10:size();
    end);
    local v13 = v2.createComputed(function(v12) --[[ Line: 49 ]]
        -- upvalues: v7 (copy)
        return v7(v12):size();
    end);
    local v15 = v2.createComputed(function(v14) --[[ Line: 54 ]]
        -- upvalues: v7 (copy)
        return v7(v14):toArray();
    end);
    local v16 = l_Signal_0.new();
    local v17 = {};
    local v18 = {};
    local function _() --[[ Line: 66 ]] --[[ Name: emitMaxSizeExceeded ]]
        -- upvalues: v16 (ref)
        v16:fire();
    end;
    local function v22(v20) --[[ Line: 70 ]] --[[ Name: setMaxSize ]]
        -- upvalues: v6 (copy)
        v6(function(_) --[[ Line: 71 ]]
            -- upvalues: v20 (copy)
            return v20;
        end);
    end;
    local function v25(v23) --[[ Line: 76 ]] --[[ Name: onMaxSizeExceeded ]]
        -- upvalues: v16 (ref)
        local v24 = v16:connect(v23);
        return function() --[[ Line: 79 ]]
            -- upvalues: v24 (copy)
            v24:disconnect();
        end;
    end;
    local function v26() --[[ Line: 84 ]] --[[ Name: getSelectedUserIdsCount ]]
        -- upvalues: v13 (copy)
        return v13;
    end;
    local function v29(v27) --[[ Line: 88 ]] --[[ Name: getSelectedUserIdAtIndex ]]
        -- upvalues: v17 (ref), v2 (ref), v7 (copy)
        if not v17[v27] then
            v17[v27] = v2.createComputed(function(v28) --[[ Line: 90 ]]
                -- upvalues: v7 (ref), v27 (copy)
                return v7(v28):at(v27);
            end);
        end;
        return v17[v27];
    end;
    local function v32(v30) --[[ Line: 98 ]] --[[ Name: getIsUserSelected ]]
        -- upvalues: v18 (ref), v2 (ref), v7 (copy)
        if not v18[v30] then
            v18[v30] = v2.createComputed(function(v31) --[[ Line: 100 ]]
                -- upvalues: v7 (ref), v30 (copy)
                return v7(v31):has(v30);
            end);
        end;
        return v18[v30];
    end;
    local function v33() --[[ Line: 108 ]] --[[ Name: getMaxSize ]]
        -- upvalues: v5 (copy)
        return v5;
    end;
    local function v34() --[[ Line: 112 ]] --[[ Name: getSelectedUserIdsArray ]]
        -- upvalues: v15 (copy)
        return v15;
    end;
    local function v38(v35) --[[ Line: 116 ]] --[[ Name: addUserId ]]
        -- upvalues: v7 (copy), v11 (copy), v16 (ref), v8 (copy)
        if v7(false):has(v35) then
            return true;
        elseif not v11(false) then
            v16:fire();
            return false;
        else
            v8(function(v36) --[[ Line: 130 ]]
                -- upvalues: v35 (copy)
                local v37 = v36:clone();
                v37:add(v35);
                return v37;
            end);
            return true;
        end;
    end;
    local function v42(v39) --[[ Line: 139 ]] --[[ Name: removeUserId ]]
        -- upvalues: v8 (copy)
        v8(function(v40) --[[ Line: 140 ]]
            -- upvalues: v39 (copy)
            if v40:has(v39) then
                local v41 = v40:clone();
                v41:remove(v39);
                return v41;
            else
                return v40;
            end;
        end);
    end;
    local function v46(v43) --[[ Line: 150 ]] --[[ Name: toggleUserId ]]
        -- upvalues: v7 (copy), v8 (copy), v38 (copy)
        if v7(false):has(v43) then
            v8(function(v44) --[[ Line: 140 ]]
                -- upvalues: v43 (copy)
                if v44:has(v43) then
                    local v45 = v44:clone();
                    v45:remove(v43);
                    return v45;
                else
                    return v44;
                end;
            end);
            return true;
        else
            return (v38(v43));
        end;
    end;
    local function v48() --[[ Line: 161 ]] --[[ Name: clearStore ]]
        -- upvalues: v16 (ref), l_Signal_0 (ref), v17 (ref), v18 (ref), v8 (copy), l_ArraySet_0 (ref)
        v16 = l_Signal_0.new();
        v17 = {};
        v18 = {};
        v8(function(_) --[[ Line: 165 ]]
            -- upvalues: l_ArraySet_0 (ref)
            return l_ArraySet_0.new({});
        end);
    end;
    return {
        setMaxSize = v22, 
        getSelectedUserIdsCount = v26, 
        getSelectedUserIdAtIndex = v29, 
        getIsUserSelected = v32, 
        getMaxSize = v33, 
        getSelectedUserIdsArray = v34, 
        addUserId = v38, 
        removeUserId = v42, 
        toggleUserId = v46, 
        clearStore = v48, 
        onMaxSizeExceeded = v25, 
        hasUserId = function(v49) --[[ Line: 170 ]] --[[ Name: hasUserId ]]
            -- upvalues: v7 (copy)
            return v7(false):has(v49);
        end, 
        getCount = function() --[[ Line: 175 ]] --[[ Name: getCount ]]
            -- upvalues: v7 (copy)
            return v7(false):size();
        end
    };
end;