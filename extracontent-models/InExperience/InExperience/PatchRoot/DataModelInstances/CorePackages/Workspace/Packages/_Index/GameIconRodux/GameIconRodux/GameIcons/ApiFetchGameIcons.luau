local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameIconRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local l_ApiFetchThumbnails_0 = require(l_Parent_0.Http).Utils.ApiFetchThumbnails;
local v4 = require(l_script_FirstAncestor_0.GamesGetIcons);
local v5 = require(l_script_FirstAncestor_0.GameIcons.SetGameIcons);
local v6 = require(l_script_FirstAncestor_0.GameIcons.GameIconReducer);
return function(v7, v8, v9) --[[ Line: 12 ]]
    -- upvalues: v6 (copy), v2 (copy), l_ApiFetchThumbnails_0 (copy), v4 (copy), v5 (copy)
    return function(v10) --[[ Line: 13 ]]
        -- upvalues: v6 (ref), v8 (copy), v2 (ref), l_ApiFetchThumbnails_0 (ref), v7 (copy), v9 (copy), v4 (ref), v5 (ref)
        local v11 = v10:getState()[v6.key];
        local v12 = {};
        for _, v14 in pairs(v8) do
            if v11[v14] == nil then
                table.insert(v12, v14);
            end;
        end;
        if #v12 == 0 then
            return v2.resolve();
        else
            return l_ApiFetchThumbnails_0.Fetch(v7, v12, v9 or "150x150", "Game", v4, v5, v10);
        end;
    end;
end;