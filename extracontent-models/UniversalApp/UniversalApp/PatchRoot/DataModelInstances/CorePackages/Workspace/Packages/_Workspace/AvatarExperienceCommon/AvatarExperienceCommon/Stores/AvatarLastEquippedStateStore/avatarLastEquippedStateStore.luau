local v0 = nil;
local v1 = false;
local v2 = true;
local function v3() --[[ Line: 25 ]]
    -- upvalues: v0 (ref)
    return v0;
end;
local function v5(v4) --[[ Line: 29 ]]
    -- upvalues: v0 (ref)
    v0 = v4;
end;
local function v6() --[[ Line: 33 ]]
    -- upvalues: v1 (ref)
    return v1;
end;
local function v8(v7) --[[ Line: 37 ]]
    -- upvalues: v1 (ref)
    v1 = v7;
end;
local function v9() --[[ Line: 41 ]]
    -- upvalues: v2 (ref)
    return v2;
end;
local function v11(v10) --[[ Line: 45 ]]
    -- upvalues: v2 (ref)
    v2 = v10;
end;
return {
    getAvatarLastEquippedState = v3, 
    setAvatarLastEquippedState = v5, 
    getChangedLayeredMakeupSorting = v6, 
    setChangedLayeredMakeupSorting = v8, 
    getShouldRevertLastEquippedState = v9, 
    setShouldRevertLastEquippedState = v11
};