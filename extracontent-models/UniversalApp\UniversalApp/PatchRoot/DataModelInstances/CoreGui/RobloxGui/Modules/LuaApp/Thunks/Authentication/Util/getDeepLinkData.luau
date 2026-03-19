local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.Authentication.AuthIntent.GetMetaDataFromShareLink);
getDeepLinkData = function(v2, v3) --[[ Line: 11 ]] --[[ Name: getDeepLinkData ]]
    -- upvalues: v1 (copy)
    local v4, v5, v6 = v3:match("code=(.-)&type=(.-)&stamp=(.*)");
    if not v6 then
        local v7, v8 = v3:match("code=(.-)&type=(.*)");
        v4 = v7;
        v5 = v8;
    end;
    if v4 and v5 then
        local v9, v10 = v1(v2, v4, v5):await();
        if v9 and v10 then
            return {
                universeId = v10.universeId, 
                inviterId = v10.inviterId, 
                placeId = v10.placeId
            };
        else
            warn("Failed to get deep link data for url:", v3, "Got:", v10);
            return nil;
        end;
    else
        warn("Failed to parse deep link data for url:", v3);
        return nil;
    end;
end;
return getDeepLinkData;