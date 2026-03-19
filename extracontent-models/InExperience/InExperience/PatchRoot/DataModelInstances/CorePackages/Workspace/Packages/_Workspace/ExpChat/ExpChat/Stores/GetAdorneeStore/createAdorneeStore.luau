local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local l_createSignal_0 = require(l_Parent_0.Signals).createSignal;
local function v7(v2, v3, v4) --[[ Line: 20 ]] --[[ Name: findFirstChildByNameAndClass ]]
    if not v2 then
        return nil;
    else
        for _, v6 in ipairs(v2:GetChildren()) do
            if v6.Name == v3 and v6:IsA(v4) then
                return v6;
            end;
        end;
        return nil;
    end;
end;
return function() --[[ Line: 32 ]] --[[ Name: createAdorneeStore ]]
    -- upvalues: l_createSignal_0 (copy), v7 (copy)
    local v8 = {};
    local function _(v9) --[[ Line: 37 ]] --[[ Name: getKey ]]
        return (tostring(v9));
    end;
    local function v15(v11) --[[ Line: 41 ]] --[[ Name: getAdornee ]]
        -- upvalues: v8 (copy), l_createSignal_0 (ref)
        local v12 = tostring(v11);
        if not v8[v12] then
            local v13, v14 = l_createSignal_0(nil);
            v8[v12] = {
                getter = v13, 
                setter = v14
            };
        end;
        return v8[v12].getter;
    end;
    local function v26(v16, v17, v18) --[[ Line: 50 ]] --[[ Name: handleAdorneeAdded ]]
        -- upvalues: v7 (ref), v8 (copy), l_createSignal_0 (ref)
        local v19 = tostring(v16);
        local v20 = v7(v17, "Head", "BasePart");
        local v21 = if v18.Health == 0 then v20 else v17;
        if not v8[v19] then
            local v22 = tostring(v16);
            if not v8[v22] then
                local v23, v24 = l_createSignal_0(nil);
                v8[v22] = {
                    getter = v23, 
                    setter = v24
                };
            end;
            local _ = v8[v22].getter;
        end;
        v8[v19].setter(v21);
    end;
    local function v31(v27) --[[ Line: 61 ]] --[[ Name: handleHumanoidDied ]]
        -- upvalues: v8 (copy), v7 (ref)
        local v28 = tostring(v27);
        local v29 = nil;
        if v8[v28] then
            local v30 = v8[v28].getter(false);
            v29 = if v30 then v7(v30, "Head", "BasePart") or v30 else nil;
            v8[v28].setter(v29);
        end;
    end;
    return {
        getAdornee = v15, 
        handleAdorneeAdded = v26, 
        handleHumanoidDied = v31, 
        handlePlayerRemoved = function(v32) --[[ Line: 77 ]] --[[ Name: handlePlayerRemoved ]]
            -- upvalues: v8 (copy)
            local v33 = tostring(v32);
            if v8[v33] then
                v8[v33].setter(nil);
            end;
            v8[v33] = nil;
        end
    };
end;