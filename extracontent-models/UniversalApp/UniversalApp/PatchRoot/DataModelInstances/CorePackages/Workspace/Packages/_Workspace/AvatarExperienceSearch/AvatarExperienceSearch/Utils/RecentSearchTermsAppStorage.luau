local l_game_EngineFeature_0 = game:GetEngineFeature("AXMarketplaceRecentSearchesStorageKey");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local v5 = require(script.Parent.getLocalUserId);
local v6 = require(l_script_FirstAncestor_0.Flags.GetFIntAXMaxRecentSearchTerms);
local l_l_AppStorageService_0_0 = l_AppStorageService_0;
local function v14() --[[ Line: 22 ]] --[[ Name: getMockAppStorageService ]]
    return {
        storage = {}, 
        GetItem = function(v8, v9) --[[ Line: 25 ]] --[[ Name: GetItem ]]
            return v8.storage[v9];
        end, 
        SetItem = function(v10, v11, v12) --[[ Line: 28 ]] --[[ Name: SetItem ]]
            v10.storage[v11] = v12;
        end, 
        Flush = function(_) --[[ Line: 31 ]] --[[ Name: Flush ]]

        end
    };
end;
if not l_game_EngineFeature_0 then
    l_l_AppStorageService_0_0 = v14();
end;
local function _() --[[ Line: 41 ]] --[[ Name: getUserId ]]
    -- upvalues: v5 (copy), l_Players_0 (copy)
    return v5(l_Players_0) or "defaultUserId";
end;
local function v20() --[[ Line: 48 ]] --[[ Name: getTerms ]]
    -- upvalues: v5 (copy), l_Players_0 (copy), l_l_AppStorageService_0_0 (ref), l_HttpService_0 (copy)
    local v16 = v5(l_Players_0) or "defaultUserId";
    local v17 = l_l_AppStorageService_0_0:GetItem("AXMarketplaceRecentSearches") or "{}";
    local v18 = {};
    pcall(function() --[[ Line: 60 ]]
        -- upvalues: l_HttpService_0 (ref), v17 (copy), v16 (copy), v18 (ref)
        local v19 = l_HttpService_0:JSONDecode(v17);
        if v19.userId == v16 then
            v18 = v19.terms or {};
        end;
    end);
    return v18;
end;
local function v25(v21) --[[ Line: 69 ]] --[[ Name: removeTerm ]]
    -- upvalues: v20 (copy)
    local v22 = v20();
    for v23, v24 in v22 do
        if string.lower(v24) == string.lower(v21) then
            table.remove(v22, v23);
            return v22;
        end;
    end;
    return v22;
end;
local function _(v26) --[[ Line: 80 ]] --[[ Name: saveTerms ]]
    -- upvalues: v5 (copy), l_Players_0 (copy), l_HttpService_0 (copy), l_l_AppStorageService_0_0 (ref)
    local v27 = v5(l_Players_0) or "defaultUserId";
    pcall(function() --[[ Line: 83 ]]
        -- upvalues: l_HttpService_0 (ref), v27 (copy), v26 (copy), l_l_AppStorageService_0_0 (ref)
        local v28 = l_HttpService_0:JSONEncode({
            userId = v27, 
            terms = v26
        });
        l_l_AppStorageService_0_0:SetItem("AXMarketplaceRecentSearches", v28);
        l_l_AppStorageService_0_0:Flush();
    end);
end;
return {
    __mockAppStorageService = function(v30) --[[ Line: 96 ]] --[[ Name: __mockAppStorageService ]]
        -- upvalues: l_l_AppStorageService_0_0 (ref), v14 (copy)
        l_l_AppStorageService_0_0 = v30 or v14();
    end, 
    clearTerms = function() --[[ Line: 100 ]] --[[ Name: clearTerms ]]
        -- upvalues: l_l_AppStorageService_0_0 (ref)
        l_l_AppStorageService_0_0:SetItem("AXMarketplaceRecentSearches", "{}");
        l_l_AppStorageService_0_0:Flush();
    end, 
    getTerms = function() --[[ Line: 105 ]] --[[ Name: getTerms ]]
        -- upvalues: v20 (copy)
        return (v20());
    end, 
    removeTerm = function(v31) --[[ Line: 109 ]] --[[ Name: removeTerm ]]
        -- upvalues: v20 (copy), v25 (copy), v5 (copy), l_Players_0 (copy), l_HttpService_0 (copy), l_l_AppStorageService_0_0 (ref)
        if v31 == nil or v31 == "" then
            return (v20());
        else
            local v32 = v25(v31);
            local v33 = v5(l_Players_0) or "defaultUserId";
            pcall(function() --[[ Line: 83 ]]
                -- upvalues: l_HttpService_0 (ref), v33 (copy), v32 (copy), l_l_AppStorageService_0_0 (ref)
                local v34 = l_HttpService_0:JSONEncode({
                    userId = v33, 
                    terms = v32
                });
                l_l_AppStorageService_0_0:SetItem("AXMarketplaceRecentSearches", v34);
                l_l_AppStorageService_0_0:Flush();
            end);
            return v32;
        end;
    end, 
    addTerm = function(v35) --[[ Line: 119 ]] --[[ Name: addTerm ]]
        -- upvalues: v20 (copy), v25 (copy), v6 (copy), v5 (copy), l_Players_0 (copy), l_HttpService_0 (copy), l_l_AppStorageService_0_0 (ref)
        if v35 == nil or v35 == "" then
            return (v20());
        else
            local v36 = v25(v35);
            table.insert(v36, 1, v35);
            if #v36 > v6() then
                table.remove(v36);
            end;
            local v37 = v5(l_Players_0) or "defaultUserId";
            pcall(function() --[[ Line: 83 ]]
                -- upvalues: l_HttpService_0 (ref), v37 (copy), v36 (copy), l_l_AppStorageService_0_0 (ref)
                local v38 = l_HttpService_0:JSONEncode({
                    userId = v37, 
                    terms = v36
                });
                l_l_AppStorageService_0_0:SetItem("AXMarketplaceRecentSearches", v38);
                l_l_AppStorageService_0_0:Flush();
            end);
            return v36;
        end;
    end, 
    findTermsForQuery = function(v39) --[[ Line: 138 ]] --[[ Name: findTermsForQuery ]]
        -- upvalues: v20 (copy)
        local v40 = v20();
        if v39 == nil or v39 == "" then
            return v40;
        else
            local v41 = {};
            for _, v43 in v40 do
                if string.lower((string.sub(v43, 1, (string.len(v39))))) == string.lower(v39) then
                    table.insert(v41, v43);
                end;
            end;
            return v41;
        end;
    end
};