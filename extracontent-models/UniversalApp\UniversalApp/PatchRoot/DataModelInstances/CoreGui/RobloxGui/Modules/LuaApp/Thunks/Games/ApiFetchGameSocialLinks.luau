local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Actions_0 = l_Modules_0.LuaApp.Actions;
local v3 = require(l_Actions_0.Games.SetGameSocialLinks);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.GamesApi.GamesGetSocialLinks);
local v5 = require(l_Modules_0.LuaApp.Models.GamesApi.GameSocialLink);
local v6 = require(l_Modules_0.LuaApp.Enum.SocialMediaType);
local l_EnableCommunityProfilePageIXP_0 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform).EnableCommunityProfilePageIXP;
local v8 = require(script.Parent.ProcessGameSocialLinks);
local l_FFlagLuaAppProcessGameSocialLinks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppProcessGameSocialLinks;
local _ = function(v10) --[[ Line: 14 ]]
    -- upvalues: v6 (copy)
    for _, v12 in pairs(v6) do
        if v10 == v12 then
            return true;
        end;
    end;
    return false;
end;
return function(v14, v15) --[[ Line: 23 ]]
    -- upvalues: v4 (copy), l_FFlagLuaAppProcessGameSocialLinks_0 (copy), v8 (copy), v3 (copy), v5 (copy), v6 (copy), l_EnableCommunityProfilePageIXP_0 (copy)
    return function(v16) --[[ Line: 24 ]]
        -- upvalues: v4 (ref), v14 (copy), v15 (copy), l_FFlagLuaAppProcessGameSocialLinks_0 (ref), v8 (ref), v3 (ref), v5 (ref), v6 (ref), l_EnableCommunityProfilePageIXP_0 (ref)
        return v4(v14, v15):andThen(function(v17) --[[ Line: 25 ]]
            -- upvalues: l_FFlagLuaAppProcessGameSocialLinks_0 (ref), v8 (ref), v15 (ref), v16 (copy), v3 (ref), v5 (ref), v6 (ref), l_EnableCommunityProfilePageIXP_0 (ref)
            local v18 = false;
            local l_data_0 = v17.responseBody.data;
            local v20 = {};
            local v21 = nil;
            if l_FFlagLuaAppProcessGameSocialLinks_0 then
                local v22 = v8(l_data_0, (tostring(v15)));
                v16:dispatch(v3(v15, v22));
                return;
            else
                for _, v24 in ipairs(l_data_0) do
                    local v25 = v5.fromJsonData(v24);
                    local l_type_0 = v25.type;
                    local v27;
                    for _, v29 in pairs(v6) do
                        if l_type_0 == v29 then
                            v27 = true;
                            v18 = true;
                        end;
                        if v18 then
                            break;
                        end;
                    end;
                    if not v18 then
                        v27 = false;
                    end;
                    v18 = false;
                    if not v27 then
                        warn("Can NOT recognize " .. v25.type .. " as a valid Social Link Type!");
                    elseif v25.type == v6.RobloxGroup then
                        if not v21 then
                            v21 = v25;
                            if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled and v21.url ~= nil then
                                v27 = string.split(v21.url, "/");
                                l_type_0 = v27[#v27];
                                if tonumber(l_type_0) ~= nil then
                                    v21.communityId = l_type_0;
                                end;
                            end;
                        else
                            warn("Detected multiple " .. v25.type .. " links for universe " .. v15 .. "!");
                        end;
                    else
                        table.insert(v20, v25);
                    end;
                end;
                local v30 = {
                    externalLinks = v20, 
                    groupLink = v21
                };
                v16:dispatch(v3(v15, v30));
                return;
            end;
        end);
    end;
end;