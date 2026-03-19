local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local _ = require(l_Parent_0.LuauPolyfill);
return function(v5, v6) --[[ Line: 37 ]] --[[ Name: createMakeupLook ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy)
    local v7, v8 = v5(("%*v3/outfits/create"):format(l_Url_0.AVATAR_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode(v6)
    });
    return v7, v8;
end;