local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.StringUtilities);
local l_StringTrim_0 = v2.StringTrim;
local l_StringSplit_0 = v2.StringSplit;
local v5 = require(script.Parent.encodeURIComponent);
local v6 = require(script.Parent.UrlBase);
local v7 = require(script.Parent.UrlPatterns.GameUrlPatterns);
local v8 = require(script.Parent.UrlPatterns.UserUrlPatterns);
local v9 = require(script.Parent.UrlPatterns.StaticUrlPatterns);
local v10 = require(script.Parent.UrlPatterns.CatalogUrlPatterns);
local v11 = require(script.Parent.UrlPatterns.EconomyUrlPatterns);
local v12 = require(script.Parent.UrlPatterns.ShareLinksUrlPatterns);
local v13 = require(script.Parent.UrlPatterns.UserModerationPatterns);
local v14 = require(script.Parent.UrlPatterns.AccountInformationPatterns);
local v15 = require(script.Parent.UrlPatterns.VirtualEventsUrlPatterns);
local v16 = require(script.Parent.UrlPatterns.PlatformAuthPatterns);
local v17 = {};
local function v24(v18, v19, v20) --[[ Line: 28 ]] --[[ Name: splitAndTrim ]]
    -- upvalues: l_StringSplit_0 (copy), v1 (copy), l_StringTrim_0 (copy)
    local v21 = l_StringSplit_0(v18, v19, v20);
    v21 = v1.List.map(v21, function(v22) --[[ Line: 30 ]]
        -- upvalues: l_StringTrim_0 (ref)
        return l_StringTrim_0(v22);
    end);
    return (v1.List.filter(v21, function(v23) --[[ Line: 33 ]]
        return #v23 > 0;
    end));
end;
local function v30(v25) --[[ Line: 44 ]] --[[ Name: validateValueType ]]
    local v26 = type(v25);
    if v26 == "string" then
        return true;
    elseif v26 == "number" then
        return true;
    elseif v26 == "table" then
        for _, v28 in ipairs(v25) do
            local v29 = type(v28);
            if v29 ~= "string" and v29 ~= "number" then
                return false;
            end;
        end;
        return true;
    else
        return false;
    end;
end;
local function _(v31) --[[ Line: 64 ]] --[[ Name: assertPlaceholder ]]
    if string.sub(v31, 1, 1) == "{" then
        assert(string.sub(v31, -1, -1) == "}", "invalid pattern: placeholder items should end with `}`");
    end;
end;
local function v37(v33, v34) --[[ Line: 71 ]] --[[ Name: assertElementIsValid ]]
    -- upvalues: v30 (copy)
    assert(type(v33) == "table", "invalid pattern: elements should all be tables");
    if v34 then
        assert(type(v33.name) == "string", "invalid pattern: element name should be a string");
        assert(#v33.name > 0, "invalid pattern: element name should not be empty");
    end;
    local v35 = true;
    if type(v33.value) ~= "string" then
        v35 = type(v33.value) == "number";
    end;
    assert(v35, "invalid pattern: element value should be a string or number");
    if type(v33.value) == "string" then
        local l_value_0 = v33.value;
        if string.sub(l_value_0, 1, 1) == "{" then
            assert(string.sub(l_value_0, -1, -1) == "}", "invalid pattern: placeholder items should end with `}`");
        end;
    end;
    if v33.optional ~= nil then
        assert(type(v33.optional) == "boolean", "invalid pattern: element optional should be a boolean");
    end;
    if v33.default ~= nil then
        assert(v30(v33.default), "invalid pattern: element default should be a string, number, or a table of strings and numbers only");
    end;
    if v33.collect ~= nil then
        v35 = true;
        if v33.collect ~= "multi" then
            v35 = v33.collect == "csv";
        end;
        assert(v35, "invalid pattern: element optional should be one of `multi`, `csv`");
    end;
end;
local function v43(v38) --[[ Line: 102 ]] --[[ Name: assertPatternIsValid ]]
    -- upvalues: v37 (copy)
    assert(type(v38.base) == "string", "invalid pattern: base should be a string");
    assert(#v38.base > 0, "invalid pattern: base should not be empty");
    assert(type(v38.path) == "table", "invalid pattern: path should be a table");
    for _, v40 in ipairs(v38.path) do
        v37(v40, false);
    end;
    if v38.query ~= nil then
        assert(type(v38.query) == "table", "invalid pattern: query should be a table");
    end;
    if type(v38.query) == "table" then
        for _, v42 in ipairs(v38.query) do
            v37(v42, true);
        end;
    end;
    if v38.hash ~= nil then
        assert(type(v38.hash) == "table", "invalid pattern: hash should be a table");
    end;
end;
local function _(v44, v45) --[[ Line: 127 ]] --[[ Name: buildElementsFromString ]]
    -- upvalues: v24 (copy), v1 (copy), l_StringTrim_0 (copy), l_StringSplit_0 (copy)
    local v46 = v45 and "&" or "/";
    v44 = v24(v44, v46);
    return (v1.List.map(v44, function(v47) --[[ Line: 130 ]]
        -- upvalues: l_StringTrim_0 (ref), v45 (copy), l_StringSplit_0 (ref)
        local v48 = nil;
        local v49 = l_StringTrim_0(v47);
        local v50 = nil;
        local v51 = nil;
        local v52 = nil;
        if v45 then
            local v53 = l_StringSplit_0(v49, "=", 2);
            v48 = l_StringTrim_0(v53[1]);
            v49 = v53[2];
            if string.sub(v48, 1, 1) == "{" then
                v48 = l_StringTrim_0(v48, "{}");
                v48 = l_StringSplit_0(v48, "|", 2)[1];
                if v49 == nil then
                    v49 = v53[1];
                end;
                v48 = l_StringTrim_0(v48);
            end;
            v52 = "multi";
        end;
        if v49 ~= nil and string.find(v49, "^{.*}$") then
            v49 = l_StringTrim_0(v49, "{}");
            local v54 = l_StringSplit_0(v49, "|", 2);
            v49 = l_StringTrim_0(v54[1]);
            if #v54 > 1 then
                v50 = true;
                if #v54[2] > 1 then
                    v51 = v54[2];
                end;
            end;
            v49 = "{" .. v49 .. "}";
        end;
        return {
            name = v48, 
            value = v49, 
            optional = v50, 
            default = v51, 
            collect = v52
        };
    end));
end;
local function v60(v56) --[[ Line: 173 ]] --[[ Name: buildQueryStringFromTable ]]
    local v57 = {};
    for v58, v59 in pairs(v56) do
        table.insert(v57, v58 .. "=" .. v59);
    end;
    return table.concat(v57, "&");
end;
local function v104(v61) --[[ Line: 182 ]] --[[ Name: simplifyPattern ]]
    -- upvalues: v6 (copy), v24 (copy), v1 (copy), l_StringTrim_0 (copy), l_StringSplit_0 (copy), v60 (copy)
    local l_base_0 = v61.base;
    local l_path_0 = v61.path;
    local l_query_0 = v61.query;
    local l_hash_0 = v61.hash;
    if l_base_0 ~= nil and v6[string.upper(l_base_0)] ~= nil then
        l_base_0 = v6[string.upper(l_base_0)];
    end;
    if type(l_path_0) == "string" then
        local v66 = v24(l_path_0, "/");
        local l_map_0 = v1.List.map;
        local l_v66_0 = v66;
        local v69 = false;
        local l_v69_0 = v69 --[[ copy: 9 -> 11 ]];
        l_path_0 = l_map_0(l_v66_0, function(v71) --[[ Line: 130 ]]
            -- upvalues: l_StringTrim_0 (ref), l_v69_0 (copy), l_StringSplit_0 (ref)
            local v72 = nil;
            local v73 = l_StringTrim_0(v71);
            local v74 = nil;
            local v75 = nil;
            local v76 = nil;
            if l_v69_0 then
                local v77 = l_StringSplit_0(v73, "=", 2);
                v72 = l_StringTrim_0(v77[1]);
                v73 = v77[2];
                if string.sub(v72, 1, 1) == "{" then
                    v72 = l_StringTrim_0(v72, "{}");
                    v72 = l_StringSplit_0(v72, "|", 2)[1];
                    if v73 == nil then
                        v73 = v77[1];
                    end;
                    v72 = l_StringTrim_0(v72);
                end;
                v76 = "multi";
            end;
            if v73 ~= nil and string.find(v73, "^{.*}$") then
                v73 = l_StringTrim_0(v73, "{}");
                local v78 = l_StringSplit_0(v73, "|", 2);
                v73 = l_StringTrim_0(v78[1]);
                if #v78 > 1 then
                    v74 = true;
                    if #v78[2] > 1 then
                        v75 = v78[2];
                    end;
                end;
                v73 = "{" .. v73 .. "}";
            end;
            return {
                name = v72, 
                value = v73, 
                optional = v74, 
                default = v75, 
                collect = v76
            };
        end);
    end;
    if type(l_query_0) == "table" and l_query_0[1] == nil then
        l_query_0 = v60(l_query_0);
    end;
    if type(l_query_0) == "string" then
        local v79 = v24(l_query_0, "&");
        local l_map_1 = v1.List.map;
        local l_v79_0 = v79;
        local v82 = true;
        local l_v82_0 = v82 --[[ copy: 9 -> 10 ]];
        l_query_0 = l_map_1(l_v79_0, function(v84) --[[ Line: 130 ]]
            -- upvalues: l_StringTrim_0 (ref), l_v82_0 (copy), l_StringSplit_0 (ref)
            local v85 = nil;
            local v86 = l_StringTrim_0(v84);
            local v87 = nil;
            local v88 = nil;
            local v89 = nil;
            if l_v82_0 then
                local v90 = l_StringSplit_0(v86, "=", 2);
                v85 = l_StringTrim_0(v90[1]);
                v86 = v90[2];
                if string.sub(v85, 1, 1) == "{" then
                    v85 = l_StringTrim_0(v85, "{}");
                    v85 = l_StringSplit_0(v85, "|", 2)[1];
                    if v86 == nil then
                        v86 = v90[1];
                    end;
                    v85 = l_StringTrim_0(v85);
                end;
                v89 = "multi";
            end;
            if v86 ~= nil and string.find(v86, "^{.*}$") then
                v86 = l_StringTrim_0(v86, "{}");
                local v91 = l_StringSplit_0(v86, "|", 2);
                v86 = l_StringTrim_0(v91[1]);
                if #v91 > 1 then
                    v87 = true;
                    if #v91[2] > 1 then
                        v88 = v91[2];
                    end;
                end;
                v86 = "{" .. v86 .. "}";
            end;
            return {
                name = v85, 
                value = v86, 
                optional = v87, 
                default = v88, 
                collect = v89
            };
        end);
    end;
    if type(l_hash_0) == "string" then
        local v92 = v24(l_hash_0, "/");
        local l_map_2 = v1.List.map;
        local l_v92_0 = v92;
        local v95 = false;
        l_hash_0 = l_map_2(l_v92_0, function(v96) --[[ Line: 130 ]]
            -- upvalues: l_StringTrim_0 (ref), v95 (copy), l_StringSplit_0 (ref)
            local v97 = nil;
            local v98 = l_StringTrim_0(v96);
            local v99 = nil;
            local v100 = nil;
            local v101 = nil;
            if v95 then
                local v102 = l_StringSplit_0(v98, "=", 2);
                v97 = l_StringTrim_0(v102[1]);
                v98 = v102[2];
                if string.sub(v97, 1, 1) == "{" then
                    v97 = l_StringTrim_0(v97, "{}");
                    v97 = l_StringSplit_0(v97, "|", 2)[1];
                    if v98 == nil then
                        v98 = v102[1];
                    end;
                    v97 = l_StringTrim_0(v97);
                end;
                v101 = "multi";
            end;
            if v98 ~= nil and string.find(v98, "^{.*}$") then
                v98 = l_StringTrim_0(v98, "{}");
                local v103 = l_StringSplit_0(v98, "|", 2);
                v98 = l_StringTrim_0(v103[1]);
                if #v103 > 1 then
                    v99 = true;
                    if #v103[2] > 1 then
                        v100 = v103[2];
                    end;
                end;
                v98 = "{" .. v98 .. "}";
            end;
            return {
                name = v97, 
                value = v98, 
                optional = v99, 
                default = v100, 
                collect = v101
            };
        end);
    end;
    return {
        base = l_base_0, 
        path = l_path_0, 
        query = l_query_0, 
        hash = l_hash_0
    };
end;
local function v109(v105, v106) --[[ Line: 214 ]] --[[ Name: concatValues ]]
    -- upvalues: v1 (copy), v24 (copy)
    v105 = v1.List.filter(v105, function(v107) --[[ Line: 216 ]]
        -- upvalues: v106 (copy), v24 (ref)
        if v106 then
            return #v24(v107, "=") > 1;
        else
            return #v107 > 0;
        end;
    end);
    local v108 = v106 and "&" or "/";
    return table.concat(v105, v108);
end;
local function v116(v110, v111, v112) --[[ Line: 227 ]] --[[ Name: resolveElement ]]
    -- upvalues: v30 (copy), v1 (copy), v5 (copy), v109 (copy)
    if v111 == nil then
        v111 = {};
    end;
    local v113 = nil;
    if type(v110.value) == "string" and string.sub(v110.value, 1, 1) == "{" then
        v113 = v111[string.sub(v110.value, 2, -2)];
        if v113 == nil then
            v113 = v110.default;
        end;
        if not v110.optional then
            assert(v113 ~= nil, "UrlBuilder: missing parameter: `" .. v110.value .. "`");
        end;
        if v113 == nil then
            v113 = {};
        end;
        assert(v30(v113), "UrlBuilder: invalid parameter: `" .. v110.value .. "`, " .. "should be a string, number, or a table of strings and numbers only");
    else
        v113 = v110.value;
    end;
    if type(v113) ~= "table" then
        v113 = {
            v113
        };
    end;
    v113 = v1.List.map(v113, function(v114) --[[ Line: 257 ]]
        -- upvalues: v5 (ref)
        return v5((tostring(v114)));
    end);
    if v112 then
        if v110.collect == "csv" then
            v113 = {
                table.concat(v113, "%2C")
            };
        end;
        v113 = v1.List.map(v113, function(v115) --[[ Line: 265 ]]
            -- upvalues: v5 (ref), v110 (copy)
            return v5(v110.name) .. "=" .. v115;
        end);
    end;
    return v109(v113, v112);
end;
local function v122(v117, v118, v119) --[[ Line: 272 ]] --[[ Name: resolveElementList ]]
    -- upvalues: v1 (copy), v116 (copy), v109 (copy)
    local v121 = v1.List.map(v117 or {}, function(v120) --[[ Line: 273 ]]
        -- upvalues: v116 (ref), v118 (copy), v119 (copy)
        return v116(v120, v118, v119);
    end);
    return v109(v121, v119);
end;
v17.new = function(v123) --[[ Line: 308 ]] --[[ Name: new ]]
    -- upvalues: v104 (copy), v43 (copy), l_StringTrim_0 (copy), v122 (copy)
    v123 = v104(v123);
    v43(v123);
    return function(v124, v125) --[[ Line: 311 ]]
        -- upvalues: l_StringTrim_0 (ref), v123 (ref), v122 (ref)
        local v126 = l_StringTrim_0(v123.base, "/", {
            right = true
        });
        local v127 = v122(v123.path, v124, false);
        if #v127 > 0 then
            v126 = v126 .. "/" .. v127;
        end;
        if string.match(v126, "[^/]/[^/]") == nil then
            v126 = v126 .. "/";
        end;
        local v128 = v122(v123.query, v124, true);
        if #v128 > 0 then
            v126 = v126 .. "?" .. v128;
        end;
        local v129 = v122(v123.hash, v124, false);
        if #v129 > 0 then
            v126 = v126 .. "#" .. v129;
        end;
        if v125 then
            if v126 ~= v125 then
                warn("UrlBuilder: unexpected output for pattern:");
                warn("UrlBuilder: expected `" .. v125 .. "`");
                warn("UrlBuilder: actual `" .. v126 .. "`");
            end;
            return v125;
        else
            return v126;
        end;
    end;
end;
v17.fromString = function(v130) --[[ Line: 347 ]] --[[ Name: fromString ]]
    -- upvalues: l_StringSplit_0 (copy), v17 (copy), l_StringTrim_0 (copy)
    local v131 = l_StringSplit_0(v130, ":", 2);
    if #v131 < 2 then
        v131 = {
            "", 
            v131[1]
        };
    end;
    local v132 = v131[1];
    v131 = l_StringSplit_0(v131[2], "%#", 2);
    local v133 = v131[2] or "";
    v131 = l_StringSplit_0(v131[1], "%?", 2);
    local v134 = v131[1] or "";
    local v135 = v131[2] or "";
    if string.sub(v134, 1, 2) == "//" then
        v131 = l_StringSplit_0(string.sub(v134, 3), "/", 2);
        v132 = v132 .. "://" .. v131[1];
        v134 = v131[2] or "/";
    end;
    return v17.new({
        base = l_StringTrim_0(v132), 
        path = l_StringTrim_0(v134), 
        query = l_StringTrim_0(v135), 
        hash = l_StringTrim_0(v133)
    });
end;
v17.addQueryString = function(v136, v137) --[[ Line: 376 ]] --[[ Name: addQueryString ]]
    -- upvalues: l_StringTrim_0 (copy), v1 (copy), v17 (copy)
    local v138 = l_StringTrim_0(v136);
    local v139 = string.find(v138, "%?");
    if v139 == nil then
        v138 = v138 .. "?";
    elseif v139 < #v138 then
        v138 = v138 .. "&";
    end;
    local v140 = v1.Dictionary.keys(v137);
    v140 = v1.List.map(v140, function(v141) --[[ Line: 385 ]]
        return "{" .. v141 .. "}";
    end);
    v138 = v138 .. table.concat(v140, "&");
    return v17.fromString(v138)(v137);
end;
v17.game = v7(v17);
v17.user = v8(v17);
v17.catalog = v10(v17);
v17.static = v9(v17);
v17.usermoderation = v13(v17);
v17.accountinformation = v14(v17);
v17.sharelinks = v12(v17);
v17.economy = v11(v17);
v17.virtualevents = v15(v17);
v17.PlatformAuth = v16(v17);
return v17;