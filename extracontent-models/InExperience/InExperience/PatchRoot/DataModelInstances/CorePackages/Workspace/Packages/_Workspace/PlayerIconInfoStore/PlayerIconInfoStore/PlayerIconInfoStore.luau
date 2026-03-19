local l_Parent_0 = script.Parent.Parent;
local l_createSignal_0 = require(l_Parent_0.Signals).createSignal;
local v2 = {};
local function _(v3) --[[ Line: 25 ]] --[[ Name: createDefaultPlayerIconInfo ]]
    local v4 = {};
    local v5 = false;
    if game.CreatorType == Enum.CreatorType.User then
        v5 = v3 == game.CreatorId;
    end;
    v4.isPlaceOwner = v5;
    v4.avatarIcon = nil;
    v4.specialGroupIcon = nil;
    return v4;
end;
local function _(v7) --[[ Line: 33 ]] --[[ Name: getOrCreatePlayerSignal ]]
    -- upvalues: v2 (ref), l_createSignal_0 (copy)
    if not v2[v7] then
        local l_l_createSignal_0_0 = l_createSignal_0;
        local v9 = {};
        local v10 = false;
        if game.CreatorType == Enum.CreatorType.User then
            v10 = v7 == game.CreatorId;
        end;
        v9.isPlaceOwner = v10;
        v9.avatarIcon = nil;
        v9.specialGroupIcon = nil;
        l_l_createSignal_0_0, v9 = l_l_createSignal_0_0(v9);
        v2[v7] = {
            getter = l_l_createSignal_0_0, 
            setter = v9
        };
    end;
    return v2[v7];
end;
local function v16(v12) --[[ Line: 41 ]] --[[ Name: getPlayerIconInfoReactive ]]
    -- upvalues: v2 (ref), l_createSignal_0 (copy)
    if not v2[v12] then
        local l_l_createSignal_0_1 = l_createSignal_0;
        local v14 = {};
        local v15 = false;
        if game.CreatorType == Enum.CreatorType.User then
            v15 = v12 == game.CreatorId;
        end;
        v14.isPlaceOwner = v15;
        v14.avatarIcon = nil;
        v14.specialGroupIcon = nil;
        l_l_createSignal_0_1, v14 = l_l_createSignal_0_1(v14);
        v2[v12] = {
            getter = l_l_createSignal_0_1, 
            setter = v14
        };
    end;
    return v2[v12].getter;
end;
local function v22(v17, v18) --[[ Line: 46 ]] --[[ Name: setPlayerIconInfo ]]
    -- upvalues: v2 (ref), l_createSignal_0 (copy)
    if not v2[v17] then
        local l_l_createSignal_0_2 = l_createSignal_0;
        local v20 = {};
        local v21 = false;
        if game.CreatorType == Enum.CreatorType.User then
            v21 = v17 == game.CreatorId;
        end;
        v20.isPlaceOwner = v21;
        v20.avatarIcon = nil;
        v20.specialGroupIcon = nil;
        l_l_createSignal_0_2, v20 = l_l_createSignal_0_2(v20);
        v2[v17] = {
            getter = l_l_createSignal_0_2, 
            setter = v20
        };
    end;
    v2[v17].setter(v18);
end;
local function v28(v23) --[[ Line: 51 ]] --[[ Name: addPlayer ]]
    -- upvalues: v2 (ref), l_createSignal_0 (copy)
    if not v2[v23] then
        local l_l_createSignal_0_3 = l_createSignal_0;
        local v25 = {};
        local v26 = false;
        if game.CreatorType == Enum.CreatorType.User then
            v26 = v23 == game.CreatorId;
        end;
        v25.isPlaceOwner = v26;
        v25.avatarIcon = nil;
        v25.specialGroupIcon = nil;
        l_l_createSignal_0_3, v25 = l_l_createSignal_0_3(v25);
        v2[v23] = {
            getter = l_l_createSignal_0_3, 
            setter = v25
        };
    end;
    local _ = v2[v23];
end;
local function v30(v29) --[[ Line: 56 ]] --[[ Name: removePlayer ]]
    -- upvalues: v2 (ref)
    v2[v29] = nil;
end;
local function v31() --[[ Line: 60 ]] --[[ Name: cleanUp ]]
    -- upvalues: v2 (ref)
    v2 = {};
end;
return {
    getPlayerIconInfoReactive = v16, 
    setPlayerIconInfo = v22, 
    addPlayer = v28, 
    removePlayer = v30, 
    cleanUp = v31
};