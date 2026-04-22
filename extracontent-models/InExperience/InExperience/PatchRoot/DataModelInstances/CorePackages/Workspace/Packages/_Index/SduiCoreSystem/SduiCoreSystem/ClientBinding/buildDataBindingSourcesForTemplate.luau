local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.ServiceContractsProto);
local v3 = require(l_script_FirstAncestor_0.ClientBinding.tryGetPathFromData);
local v4 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingContentType);
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes);
local v6 = require(l_script_FirstAncestor_0.ClientBinding.ProtoVariableMapper);
local v7 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = v7.FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagSduiExperienceDetailsSupport_0 = v7.FFlagSduiExperienceDetailsSupport;
local l_FFlagSduiMarketplaceCatalogCategorySupport_0 = v7.FFlagSduiMarketplaceCatalogCategorySupport;
local l_FFlagSduiMarketplaceCatalogSortSupport_0 = v7.FFlagSduiMarketplaceCatalogSortSupport;
local l_FFlagSduiSongHydrationSupport_0 = v7.FFlagSduiSongHydrationSupport;
local v13 = {
    [v4.badge] = {
        "badge_id"
    }, 
    [v4.creator] = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then {
        "creator_key"
    } else nil, 
    [v4.universe] = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then {
        "universe_id"
    } else nil, 
    [v4.ageRecommendation] = if l_FFlagSduiExperienceDetailsSupport_0 then {
        "universe_id"
    } else nil, 
    [v4.socialLink] = if l_FFlagSduiExperienceDetailsSupport_0 then {
        "social_link_id"
    } else nil, 
    [v4.marketplaceCatalogCategory] = if l_FFlagSduiMarketplaceCatalogCategorySupport_0 then {
        "marketplace_catalog_category_item_id"
    } else nil, 
    [v4.song] = if l_FFlagSduiSongHydrationSupport_0 then {
        "song_id"
    } else nil, 
    [v4.marketplaceCatalogSort] = if l_FFlagSduiMarketplaceCatalogSortSupport_0 then {
        "catalog_sort_id"
    } else nil, 
    [v4.gamePass] = if l_FFlagSduiExperienceDetailsSupport_0 then {
        "game_pass_id"
    } else nil
};
return function(v14, v15) --[[ Line: 88 ]] --[[ Name: buildDataBindingSourcesForTemplate ]]
    -- upvalues: v6 (copy), v3 (copy), v13 (copy)
    local v16 = {};
    for _, v18 in v15 do
        local v19 = v6.mapHydrationContentTypeToLua(v18.content_type);
        if not v19 then
            error((("Unsupported contentType %*"):format(v18.content_type)));
        end;
        local v20 = v18.id_binding and v18.id_binding.kind and v18.id_binding.kind.type;
        local v21 = v18.id_binding and v18.id_binding.kind and v18.id_binding.kind.value;
        local v22 = nil;
        if v20 == "literal" and v21 then
            v22 = v21;
        elseif v20 == "input_path" and v21 then
            local v23 = string.split(v21, ".");
            local v24, v25 = v3(v14, v23);
            if v24 and v25 ~= nil then
                v22 = v25;
            else
                error((("Unable to resolve path from inputPath: %* in data"):format(v21)));
            end;
        else
            local v26 = v13[v19];
            if v26 then
                local v27, v28 = v3(v14, v26);
                if v27 and v28 ~= nil then
                    v22 = v28;
                else
                    local v29 = table.concat(v26, ",");
                    error((("Unable to resolve default path: %* in data for contentType %*"):format(v29, v19)));
                end;
            else
                error((("Unable to find default for unknown contentType: %*"):format(v19)));
            end;
        end;
        v16[if v18.alias and v18.alias ~= "" then v18.alias else v19] = {
            contentType = v19, 
            id = v22
        };
    end;
    return v16;
end;