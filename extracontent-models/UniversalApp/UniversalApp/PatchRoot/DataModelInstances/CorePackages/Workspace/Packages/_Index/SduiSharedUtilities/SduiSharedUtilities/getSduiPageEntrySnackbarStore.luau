local l_Parent_0 = script:FindFirstAncestor("SduiSharedUtilities").Parent;
local v1 = require(l_Parent_0.Signals);
local function v19() --[[ Line: 20 ]] --[[ Name: createSduiPageEntrySnackbarStore ]]
    -- upvalues: v1 (copy)
    local v2 = {};
    local function v7(v3) --[[ Line: 23 ]] --[[ Name: getSignal ]]
        -- upvalues: v2 (copy), v1 (ref)
        local v4 = v2[v3];
        if v4 then
            return v4.get;
        else
            local v5, v6 = v1.createSignal(nil);
            v2[v3] = {
                get = v5, 
                set = v6
            };
            return v5;
        end;
    end;
    local function v13(v8, v9) --[[ Line: 37 ]] --[[ Name: show ]]
        -- upvalues: v2 (copy), v1 (ref)
        local v10 = v2[v8];
        if v10 then
            v10.set(v9);
            return;
        else
            local v11, v12 = v1.createSignal(nil);
            v2[v8] = {
                get = v11, 
                set = v12
            };
            v12(v9);
            return;
        end;
    end;
    local function v18(v14) --[[ Line: 51 ]] --[[ Name: hide ]]
        -- upvalues: v2 (copy), v1 (ref)
        local v15 = v2[v14];
        if v15 then
            v15.set(nil);
            return;
        else
            local v16, v17 = v1.createSignal(nil);
            v2[v14] = {
                get = v16, 
                set = v17
            };
            v17(nil);
            return;
        end;
    end;
    return {
        getSignal = v7, 
        show = v13, 
        hide = v18
    };
end;
local v20 = nil;
return function() --[[ Line: 74 ]] --[[ Name: getSduiPageEntrySnackbarStore ]]
    -- upvalues: v20 (ref), v19 (copy)
    if v20 == nil then
        v20 = v19();
    end;
    return v20;
end;