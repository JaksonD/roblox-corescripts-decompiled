local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_ApiFetchThumbnails_0 = require(l_CorePackages_0.Workspace.Packages.Http).Utils.ApiFetchThumbnails;
local v4 = require(l_Modules_0.LuaApp.Http.Requests.DeveloperProductApi.DeveloperProductsGetThumbnails);
local v5 = require(l_Modules_0.LuaApp.Actions.DeveloperProduct.SetDeveloperProductsThumbnails);
return function(v6, v7) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), l_ApiFetchThumbnails_0 (copy), v4 (copy), v5 (copy)
    return function(v8) --[[ Line: 13 ]]
        -- upvalues: v7 (copy), v2 (ref), l_ApiFetchThumbnails_0 (ref), v6 (copy), v4 (ref), v5 (ref)
        local l_DeveloperProductsThumbnails_0 = v8:getState().DeveloperProductsThumbnails;
        local v10 = {};
        if l_DeveloperProductsThumbnails_0 then
            for _, v12 in v7 do
                if l_DeveloperProductsThumbnails_0[tostring(v12)] == nil then
                    table.insert(v10, v12);
                end;
            end;
        else
            v10 = v7;
        end;
        if #v10 == 0 then
            return v2.resolve();
        else
            return l_ApiFetchThumbnails_0.Fetch(v6, v10, "150x150", "DeveloperProducts", v4, v5, v8);
        end;
    end;
end;