local v0 = game:DefineFastString("RccInExperienceNameSettingsEnabledAllowList", "");
local v1 = nil;
return {
    isAllowListedUserId = function(v2) --[[ Line: 7 ]] --[[ Name: isAllowListedUserId ]]
        -- upvalues: v1 (ref), v0 (copy)
        local v3 = tostring(v2);
        if v1 == nil then
            v1 = {};
            for v4 in string.gmatch(v0, "[^,]+") do
                v1[v4] = true;
            end;
        end;
        return v1[v3] == true;
    end
};