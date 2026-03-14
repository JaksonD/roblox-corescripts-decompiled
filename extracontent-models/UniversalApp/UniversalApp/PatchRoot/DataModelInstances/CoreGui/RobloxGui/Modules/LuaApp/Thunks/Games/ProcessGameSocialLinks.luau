local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Models.GamesApi.GameSocialLink);
local v3 = require(l_Modules_0.LuaApp.Enum.SocialMediaType);
local l_EnableCommunityProfilePageIXP_0 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform).EnableCommunityProfilePageIXP;
local _ = function(v5) --[[ Line: 8 ]]
    -- upvalues: v3 (copy)
    for _, v7 in pairs(v3) do
        if v5 == v7 then
            return true;
        end;
    end;
    return false;
end;
return function(v9, v10) --[[ Line: 17 ]] --[[ Name: ProcessGameSocialLinks ]]
    -- upvalues: v2 (copy), v3 (copy), l_EnableCommunityProfilePageIXP_0 (copy)
    local v11 = false;
    local v12 = {};
    local v13 = nil;
    for _, v15 in ipairs(v9) do
        local v16 = v2.fromJsonData(v15);
        local l_type_0 = v16.type;
        local v18;
        for _, v20 in pairs(v3) do
            if l_type_0 == v20 then
                v18 = true;
                v11 = true;
            end;
            if v11 then
                break;
            end;
        end;
        if not v11 then
            v18 = false;
        end;
        v11 = false;
        if not v18 then
            warn("Can NOT recognize " .. v16.type .. " as a valid Social Link Type!");
        elseif v16.type == v3.RobloxGroup then
            if not v13 then
                v13 = v16;
                if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled and v13.url ~= nil then
                    v18 = string.split(v13.url, "/");
                    l_type_0 = v18[#v18];
                    if tonumber(l_type_0) ~= nil then
                        v13.communityId = l_type_0;
                    end;
                end;
            else
                warn("Detected multiple " .. v16.type .. " links for universe " .. v10 .. "!");
            end;
        else
            table.insert(v12, v16);
        end;
    end;
    return {
        externalLinks = v12, 
        groupLink = v13
    };
end;