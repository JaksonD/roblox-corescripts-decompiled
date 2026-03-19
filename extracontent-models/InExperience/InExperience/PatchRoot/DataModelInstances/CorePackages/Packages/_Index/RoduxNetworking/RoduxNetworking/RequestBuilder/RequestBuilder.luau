local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4, v5) --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({
        ids = v2.makeArray(v4), 
        delimiter = v5
    }, v3));
end;
v2.setIds = function(v6, v7) --[[ Line: 14 ]] --[[ Name: setIds ]]
    -- upvalues: v2 (copy)
    v6.ids = v2.makeArray(v7);
end;
v2.makeArray = function(v8) --[[ Line: 18 ]] --[[ Name: makeArray ]]
    if type(v8) == "table" then
        return v8;
    else
        return {
            v8
        };
    end;
end;
v2.__tostring = function(v9) --[[ Line: 25 ]] --[[ Name: __tostring ]]
    return table.concat(v9.ids, v9.delimiter);
end;
local v10 = {};
v10.__index = v10;
v10.new = function(v11, v12) --[[ Line: 54 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy)
    local v13 = {
        baseUrl = v11:gsub("/*$", ""), 
        args = {}, 
        pathElements = {}, 
        configurableIds = nil, 
        namedIds = {}, 
        idsDelimiter = ",", 
        options = {
            queryArgs = nil, 
            postBody = nil, 
            headers = nil
        }, 
        useExpandedForm = {}, 
        statusIds = nil, 
        additionalData = v12 or {}
    };
    setmetatable(v13, v10);
    return v13;
end;
v10.path = function(v14, v15) --[[ Line: 80 ]] --[[ Name: path ]]
    v15 = v15:gsub("^/", ""):gsub("/$", "");
    table.insert(v14.pathElements, v15);
    return v14;
end;
v10.id = function(v16, v17, v18) --[[ Line: 87 ]] --[[ Name: id ]]
    -- upvalues: v2 (copy)
    if not v18 and #v16.pathElements < 1 then
        warn("Cannot name id or ids because there is no leading path segment and no name is provided");
    end;
    local v19 = v18 or v16.pathElements[#v16.pathElements];
    v16.namedIds[v19] = v17;
    v16.configurableIds = v2:new(v17, v16.idsDelimiter);
    table.insert(v16.pathElements, v16.configurableIds);
    return v16;
end;
v10.queryArgWithIds = function(v20, v21, v22) --[[ Line: 99 ]] --[[ Name: queryArgWithIds ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v23 = v1.List.join(v22, v20.namedIds[v21] or {});
    v20.namedIds[v21] = v23;
    v20.configurableIds = v2:new(v23, v20.idsDelimiter);
    v20.args = v1.Dictionary.join(v20.args, {
        [v21] = v20.configurableIds
    });
    return v20;
end;
v10.expandedQueryArgsWithIds = function(v24, v25, v26) --[[ Line: 109 ]] --[[ Name: expandedQueryArgsWithIds ]]
    v24.useExpandedForm[v25] = true;
    v24:queryArgWithIds(v25, v26);
    return v24;
end;
v10.queryArgs = function(v27, v28) --[[ Line: 115 ]] --[[ Name: queryArgs ]]
    -- upvalues: v1 (copy)
    v27.args = v1.Dictionary.join(v27.args, v28);
    v27.options.queryArgs = v1.Dictionary.join(v28, v27.options.queryArgs or {});
    return v27;
end;
v10.body = function(v29, v30) --[[ Line: 121 ]] --[[ Name: body ]]
    v29.options.postBody = v30;
    return v29;
end;
v10.headers = function(v31, v32) --[[ Line: 126 ]] --[[ Name: headers ]]
    v31.options.headers = v32;
    return v31;
end;
v10.makeKeyMapper = function(v33) --[[ Line: 131 ]] --[[ Name: makeKeyMapper ]]
    return function(v34) --[[ Line: 132 ]]
        -- upvalues: v33 (copy)
        return v33:getStatusIds() and v33:makeStatusUrl(v34) or v33:makeNamedIdsUrl(v34);
    end;
end;
v10._normalize = function(_, v36) --[[ Line: 139 ]] --[[ Name: _normalize ]]
    return v36:gsub("/+", "/");
end;
v10.makeUri = function(v37) --[[ Line: 143 ]] --[[ Name: makeUri ]]
    local v38 = "";
    for _, v40 in ipairs(v37.pathElements) do
        v38 = v38 .. "/" .. tostring(v40);
    end;
    return v37:_normalize(v38);
end;
local function v41(v42, v43, v44, v45) --[[ Line: 151 ]] --[[ Name: concatArguments ]]
    -- upvalues: v41 (copy)
    if v45 then
        for _, v47 in pairs(v44.ids) do
            v42 = v41(v42, v43, v47);
        end;
        return v42;
    else
        local v48 = tostring(v43) .. "=" .. tostring(v44);
        if v42:len() > 1 then
            return v42 .. "&" .. v48;
        else
            return v48;
        end;
    end;
end;
v10.makeQueryArgs = function(v49, v50, v51) --[[ Line: 168 ]] --[[ Name: makeQueryArgs ]]
    -- upvalues: v41 (copy)
    v49:_plugInConfigurableIds(v50);
    local v52 = "";
    for v53, v54 in pairs(v49.args) do
        if v51 and v49.namedIds[v53] or not v51 then
            v52 = v41(v52, v53, v54, v49.useExpandedForm[v53]);
        end;
    end;
    if v52:len() > 1 then
        return "?" .. v52;
    else
        return "";
    end;
end;
v10.makeUrl = function(v55, v56, v57) --[[ Line: 184 ]] --[[ Name: makeUrl ]]
    v55:_plugInConfigurableIds(v56);
    return v55.baseUrl .. v55:makeUri() .. v55:makeQueryArgs(v56, v57);
end;
v10.makeStatusUrl = function(v58, v59) --[[ Line: 190 ]] --[[ Name: makeStatusUrl ]]
    local v60 = v58.baseUrl .. v58:makeUri();
    if not v59 then
        return v60;
    else
        local v61 = type(v59) == "table" and v59 or {
            v59
        };
        local v62 = "";
        for v63, v64 in pairs(v61) do
            v62 = v63 > 1 and v62 .. "&" .. v64 or v64;
        end;
        return v60 .. "?" .. v62;
    end;
end;
v10.makeNamedIdsUrl = function(v65, v66) --[[ Line: 205 ]] --[[ Name: makeNamedIdsUrl ]]
    return v65:makeUrl(v66, true);
end;
v10.makeOptions = function(v67) --[[ Line: 209 ]] --[[ Name: makeOptions ]]
    return v67.options;
end;
v10._plugInConfigurableIds = function(v68, v69) --[[ Line: 213 ]] --[[ Name: _plugInConfigurableIds ]]
    if v69 ~= nil and v68.configurableIds then
        v68.configurableIds:setIds(v69);
    end;
end;
v10.getIds = function(v70) --[[ Line: 219 ]] --[[ Name: getIds ]]
    if v70.configurableIds and v70.configurableIds.ids then
        return v70.configurableIds.ids;
    elseif v70.statusIds then
        return v70.statusIds;
    else
        return {};
    end;
end;
v10.getNamedIds = function(v71) --[[ Line: 229 ]] --[[ Name: getNamedIds ]]
    return v71.namedIds;
end;
v10.setStatusIds = function(v72, v73) --[[ Line: 233 ]] --[[ Name: setStatusIds ]]
    -- upvalues: v1 (copy)
    if v72.configurableIds then
        warn("Cannot set statusIds because ids already provided in URl");
        return v72;
    else
        v72.statusIds = v1.List.join(v72.statusIds or {}, v73);
        return v72;
    end;
end;
v10.getStatusIds = function(v74) --[[ Line: 242 ]] --[[ Name: getStatusIds ]]
    if v74.configurableIds then
        return nil;
    else
        return v74.statusIds;
    end;
end;
v10.getAdditionalData = function(v75) --[[ Line: 250 ]] --[[ Name: getAdditionalData ]]
    return v75.additionalData or {};
end;
return v10;