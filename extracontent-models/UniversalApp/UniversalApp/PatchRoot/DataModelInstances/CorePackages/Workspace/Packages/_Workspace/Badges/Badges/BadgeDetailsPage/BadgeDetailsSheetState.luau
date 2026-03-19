local v0 = false;
local function v1() --[[ Line: 3 ]] --[[ Name: getIsBadgeDetailsSheetOpen ]]
    -- upvalues: v0 (ref)
    return v0;
end;
local function v3(v2) --[[ Line: 7 ]] --[[ Name: setIsBadgeDetailsSheetOpen ]]
    -- upvalues: v0 (ref)
    v0 = v2;
end;
return {
    getIsBadgeDetailsSheetOpen = v1, 
    setIsBadgeDetailsSheetOpen = v3
};