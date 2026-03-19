local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSearch);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v5 = require(l_Modules_0.LuaApp.Analytics.Events.searchAutocompleteEventNew);
local v6 = require(l_Modules_0.LuaApp.Analytics.Events.searchTextTrim);
local v7 = require(l_Modules_0.LuaApp.Analytics.Events.searchClear);
local v8 = require(l_Modules_0.LuaApp.Analytics.Events.searchSuggestionClicked);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v10 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v11 = require(l_Modules_0.LuaApp.getCurrentPage);
local l_normalizeKeyword_0 = v3.Utils.normalizeKeyword;
local l_getUseSelectorDeepEquals_0 = v4.Utils.getUseSelectorDeepEquals;
local v14 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v15 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local function _() --[[ Line: 31 ]] --[[ Name: getDefaultAnalyticsQueryState ]]
    return {
        query = nil, 
        time = tick()
    };
end;
return function() --[[ Line: 38 ]] --[[ Name: useSearchAnalytics ]]
    -- upvalues: v2 (copy), v10 (copy), v14 (copy), l_useSelector_0 (copy), v11 (copy), l_getUseSelectorDeepEquals_0 (copy), v5 (copy), v15 (copy), v7 (copy), l_normalizeKeyword_0 (copy), v8 (copy), v6 (copy)
    local v17 = v2.useRef({
        query = nil, 
        time = tick()
    });
    local v18 = v2.useRef("");
    local v19 = v10(v14);
    local v20 = l_useSelector_0(v11);
    local v22 = l_useSelector_0(function(v21) --[[ Line: 48 ]]
        return v21.AvatarExperience.AvatarAutocompleteSuggestions or {};
    end, l_getUseSelectorDeepEquals_0());
    local v28 = v2.useCallback(function(v23, v24, v25) --[[ Line: 57 ]]
        -- upvalues: v17 (copy), v18 (copy), v5 (ref), v19 (copy), v20 (copy), v15 (ref)
        if not v17.current or not v18.current then
            return;
        else
            local v26 = v17.current or {};
            if not v23 or v23 ~= v26.query or not v24 then
                return;
            else
                local v27 = tick();
                v5(v19, "AvatarShopSearch", v23, v18.current, v24, v20, v27 - v26.time, v25, v15.SearchTypes.Catalog);
                v18.current = v23;
                v17.current = {
                    query = nil, 
                    time = tick()
                };
                return;
            end;
        end;
    end, {});
    local function v30(v29) --[[ Line: 84 ]]
        -- upvalues: v7 (ref), v19 (copy), v15 (ref)
        v7(v19, "AvatarShopSearch", v29, v15.SearchTypes.Catalog);
    end;
    local function v39(v31, v32) --[[ Line: 88 ]]
        -- upvalues: v22 (copy), l_normalizeKeyword_0 (ref), v8 (ref), v19 (copy), v15 (ref)
        local v33 = v22[l_normalizeKeyword_0(v31)];
        if not v33 or not v33.entries or not v32 then
            return;
        else
            local l_entries_0 = v33.entries;
            local v35 = nil;
            local v36 = nil;
            for v37, v38 in l_entries_0 do
                if string.lower(v38.searchQuery) == string.lower(v32) then
                    v35 = v37;
                    v36 = v38;
                    break;
                end;
            end;
            if v36 and v35 then
                v8(v19, "AvatarShopSearch", v31, v15.SearchTypes.Catalog, l_entries_0, v35, v36);
            end;
            return;
        end;
    end;
    local function v43(v40) --[[ Line: 116 ]]
        -- upvalues: v17 (copy), v6 (ref), v19 (copy), v15 (ref), l_normalizeKeyword_0 (ref), v22 (copy), v28 (copy)
        local v41 = v17.current and v17.current.query;
        v17.current = {
            query = v40, 
            time = tick()
        };
        if v40 and v41 and string.len(v40) < string.len(v41) then
            v6(v19, "AvatarShopSearch", v41, v40, v15.SearchTypes.Catalog);
        end;
        local v42 = v22[l_normalizeKeyword_0(v40)];
        if v42 then
            v28(v40, v42, true);
        end;
    end;
    v2.useEffect(function() --[[ Line: 144 ]]
        -- upvalues: v17 (copy), l_normalizeKeyword_0 (ref), v22 (copy), v28 (copy)
        local v44 = v17.current and v17.current.query;
        if v44 then
            local v45 = v22[l_normalizeKeyword_0(v44)];
            if v45 then
                v28(v44, v45, false);
            end;
        end;
    end, {
        v22, 
        v28
    });
    return {
        updateQuery = v43, 
        sendClearEvent = v30, 
        sendAutocompleteTermClickedEvent = v39
    };
end;