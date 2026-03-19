local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.struct);
local v4 = require(script.Parent.prop_condition);
local v5 = require(script.Parent.prop_types);
local v6 = require(script.Parent.share_link_data);
local v7 = {};
v7.__index = v7;
local l_v7_0 = v7 --[[ copy: 7 -> 8 ]];
v7.new = function(v9) --[[ Line: 1894 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_0 (copy)
    return (setmetatable({
        action_type = if not (v9 ~= nil) or v9.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v9.action_type, 
        action_params = if not (v9 ~= nil) or v9.action_params == nil then nil else v9.action_params
    }, l_v7_0));
end;
v7.encode = function(v10) --[[ Line: 1903 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v11 = buffer.create(0);
    local v12 = 0;
    if v10.action_type ~= nil and (v10.action_type ~= nil and v10.action_type ~= 0 or v10.action_type ~= v2.ActionType.fromNumber(0)) then
        local v13, v14 = v0.writeTag(v11, v12, 1, v0.wireTypes.varint);
        v13, v14 = v0.writeVarInt(v13, v14, v2.ActionType.toNumber(v10.action_type));
        v11 = v13;
        v12 = v14;
    end;
    if v10.action_params ~= nil then
        local v15 = v10.action_params:encode();
        local v16, v17 = v0.writeTag(v11, v12, 2, v0.wireTypes.lengthDelimited);
        v16, v17 = v0.writeBuffer(v16, v17, v15, buffer.len(v15));
        v11 = v16;
        v12 = v17;
    end;
    local v18 = buffer.create(v12);
    buffer.copy(v18, 0, v11, 0, v12);
    return v18;
end;
v7.decode = function(v19) --[[ Line: 1929 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_0 (copy), v0 (copy), v2 (copy)
    local v20 = l_v7_0.new();
    local v21 = 0;
    while v21 < buffer.len(v19) do
        local v22 = nil;
        local v23 = nil;
        local v24, v25, v26 = v0.readTag(v19, v21);
        v22 = v24;
        v23 = v25;
        v21 = v26;
        if v23 == v0.wireTypes.varint then
            if v22 == 1 then
                v24 = nil;
                v25, v26 = v0.readVarIntI32(v19, v21);
                v24 = v25;
                v21 = v26;
                v20.action_type = v2.ActionType.fromNumber(v24) or v24;
            else
                v24 = nil;
                v25, v26 = v0.readVarInt(v19, v21);
                v24 = v25;
                v21 = v26;
            end;
        elseif v23 == v0.wireTypes.lengthDelimited then
            if v22 == 2 then
                v24 = nil;
                v25, v26 = v0.readBuffer(v19, v21);
                v24 = v25;
                v21 = v26;
                v20.action_params = v2.DismissDialogAction_Params.decode(v24);
            else
                v24 = nil;
                v25, v26 = v0.readVarInt(v19, v21);
                v21 = v26 + v25;
            end;
        elseif v23 == v0.wireTypes.i32 then
            v24 = nil;
            v25, v26 = v0.readFixed32(v19, v21);
            v24 = v25;
            v21 = v26;
        elseif v23 == v0.wireTypes.i64 then
            v24 = nil;
            v25, v26 = v0.readFixed64(v19, v21);
            v24 = v25;
            v21 = v26;
        else
            error("Unsupported wire type: " .. v23);
        end;
    end;
    return v20;
end;
v7.jsonEncode = function(v27) --[[ Line: 1977 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v28 = {};
    if v27.action_type ~= nil and (v27.action_type ~= nil and v27.action_type ~= 0 or v27.action_type ~= v2.ActionType.fromNumber(0)) then
        v28.actionType = if typeof(v27.action_type) == "number" then v27.action_type else v2.ActionType.toNumber(v27.action_type);
    end;
    if v27.action_params ~= nil then
        v28.actionParams = v27.action_params:jsonEncode();
    end;
    return v28;
end;
v7.jsonDecode = function(v29) --[[ Line: 1999 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_0 (copy), v2 (copy)
    local v30 = l_v7_0.new();
    if v29.action_type ~= nil then
        v30.action_type = if typeof(v29.action_type) == "number" then v2.ActionType.fromNumber(v29.action_type) or v29.action_type else v2.ActionType.fromName(v29.action_type) or v29.action_type;
    end;
    if v29.actionType ~= nil then
        v30.action_type = if typeof(v29.actionType) == "number" then v2.ActionType.fromNumber(v29.actionType) or v29.actionType else v2.ActionType.fromName(v29.actionType) or v29.actionType;
    end;
    if v29.action_params ~= nil then
        v30.action_params = v2.DismissDialogAction_Params.jsonDecode(v29.action_params);
    end;
    if v29.actionParams ~= nil then
        v30.action_params = v2.DismissDialogAction_Params.jsonDecode(v29.actionParams);
    end;
    return v30;
end;
v7.descriptor = {
    name = "DismissDialogAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DismissDialogAction"
};
v2.DismissDialogAction = v7;
v1.default:register(v2.DismissDialogAction);
v7 = {};
v7.__index = v7;
local l_v7_1 = v7 --[[ copy: 7 -> 9 ]];
v7.new = function(v32) --[[ Line: 2039 ]] --[[ Name: new ]]
    -- upvalues: l_v7_1 (copy)
    return (setmetatable({
        dialog_type = if not (v32 ~= nil) or v32.dialog_type == nil then nil else v32.dialog_type
    }, l_v7_1));
end;
v7.encode = function(v33) --[[ Line: 2047 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v34 = buffer.create(0);
    local v35 = 0;
    if v33.dialog_type ~= nil then
        local v36 = v33.dialog_type:encode();
        local v37, v38 = v0.writeTag(v34, v35, 1, v0.wireTypes.lengthDelimited);
        v37, v38 = v0.writeBuffer(v37, v38, v36, buffer.len(v36));
        v34 = v37;
        v35 = v38;
    end;
    local v39 = buffer.create(v35);
    buffer.copy(v39, 0, v34, 0, v35);
    return v39;
end;
v7.decode = function(v40) --[[ Line: 2062 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_1 (copy), v0 (copy), v5 (copy)
    local v41 = l_v7_1.new();
    local v42 = 0;
    while v42 < buffer.len(v40) do
        local v43 = nil;
        local v44 = nil;
        local v45, v46, v47 = v0.readTag(v40, v42);
        v43 = v45;
        v44 = v46;
        v42 = v47;
        if v44 == v0.wireTypes.varint then
            v45 = nil;
            v46, v47 = v0.readVarInt(v40, v42);
            v45 = v46;
            v42 = v47;
        elseif v44 == v0.wireTypes.lengthDelimited then
            if v43 == 1 then
                v45 = nil;
                v46, v47 = v0.readBuffer(v40, v42);
                v45 = v46;
                v42 = v47;
                v41.dialog_type = v5.StringProp.decode(v45);
            else
                v45 = nil;
                v46, v47 = v0.readVarInt(v40, v42);
                v42 = v47 + v46;
            end;
        elseif v44 == v0.wireTypes.i32 then
            v45 = nil;
            v46, v47 = v0.readFixed32(v40, v42);
            v45 = v46;
            v42 = v47;
        elseif v44 == v0.wireTypes.i64 then
            v45 = nil;
            v46, v47 = v0.readFixed64(v40, v42);
            v45 = v46;
            v42 = v47;
        else
            error("Unsupported wire type: " .. v44);
        end;
    end;
    return v41;
end;
v7.jsonEncode = function(v48) --[[ Line: 2105 ]] --[[ Name: jsonEncode ]]
    local v49 = {};
    if v48.dialog_type ~= nil then
        v49.dialogType = v48.dialog_type:jsonEncode();
    end;
    return v49;
end;
v7.jsonDecode = function(v50) --[[ Line: 2115 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_1 (copy), v5 (copy)
    local v51 = l_v7_1.new();
    if v50.dialog_type ~= nil then
        v51.dialog_type = v5.StringProp.jsonDecode(v50.dialog_type);
    end;
    if v50.dialogType ~= nil then
        v51.dialog_type = v5.StringProp.jsonDecode(v50.dialogType);
    end;
    return v51;
end;
v7.descriptor = {
    name = "DismissDialogAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.DismissDialogAction_Params = v7;
v1.default:register(v2.DismissDialogAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_2 = v7 --[[ copy: 7 -> 10 ]];
v7.new = function(v53) --[[ Line: 2144 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_2 (copy)
    return (setmetatable({
        action_type = if not (v53 ~= nil) or v53.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v53.action_type, 
        action_params = if not (v53 ~= nil) or v53.action_params == nil then nil else v53.action_params
    }, l_v7_2));
end;
v7.encode = function(v54) --[[ Line: 2153 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v55 = buffer.create(0);
    local v56 = 0;
    if v54.action_type ~= nil and (v54.action_type ~= nil and v54.action_type ~= 0 or v54.action_type ~= v2.ActionType.fromNumber(0)) then
        local v57, v58 = v0.writeTag(v55, v56, 1, v0.wireTypes.varint);
        v57, v58 = v0.writeVarInt(v57, v58, v2.ActionType.toNumber(v54.action_type));
        v55 = v57;
        v56 = v58;
    end;
    if v54.action_params ~= nil then
        local v59 = v54.action_params:encode();
        local v60, v61 = v0.writeTag(v55, v56, 2, v0.wireTypes.lengthDelimited);
        v60, v61 = v0.writeBuffer(v60, v61, v59, buffer.len(v59));
        v55 = v60;
        v56 = v61;
    end;
    local v62 = buffer.create(v56);
    buffer.copy(v62, 0, v55, 0, v56);
    return v62;
end;
v7.decode = function(v63) --[[ Line: 2179 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_2 (copy), v0 (copy), v2 (copy)
    local v64 = l_v7_2.new();
    local v65 = 0;
    while v65 < buffer.len(v63) do
        local v66 = nil;
        local v67 = nil;
        local v68, v69, v70 = v0.readTag(v63, v65);
        v66 = v68;
        v67 = v69;
        v65 = v70;
        if v67 == v0.wireTypes.varint then
            if v66 == 1 then
                v68 = nil;
                v69, v70 = v0.readVarIntI32(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.action_type = v2.ActionType.fromNumber(v68) or v68;
            else
                v68 = nil;
                v69, v70 = v0.readVarInt(v63, v65);
                v68 = v69;
                v65 = v70;
            end;
        elseif v67 == v0.wireTypes.lengthDelimited then
            if v66 == 2 then
                v68 = nil;
                v69, v70 = v0.readBuffer(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.action_params = v2.LinkAction_Params.decode(v68);
            else
                v68 = nil;
                v69, v70 = v0.readVarInt(v63, v65);
                v65 = v70 + v69;
            end;
        elseif v67 == v0.wireTypes.i32 then
            v68 = nil;
            v69, v70 = v0.readFixed32(v63, v65);
            v68 = v69;
            v65 = v70;
        elseif v67 == v0.wireTypes.i64 then
            v68 = nil;
            v69, v70 = v0.readFixed64(v63, v65);
            v68 = v69;
            v65 = v70;
        else
            error("Unsupported wire type: " .. v67);
        end;
    end;
    return v64;
end;
v7.jsonEncode = function(v71) --[[ Line: 2227 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v72 = {};
    if v71.action_type ~= nil and (v71.action_type ~= nil and v71.action_type ~= 0 or v71.action_type ~= v2.ActionType.fromNumber(0)) then
        v72.actionType = if typeof(v71.action_type) == "number" then v71.action_type else v2.ActionType.toNumber(v71.action_type);
    end;
    if v71.action_params ~= nil then
        v72.actionParams = v71.action_params:jsonEncode();
    end;
    return v72;
end;
v7.jsonDecode = function(v73) --[[ Line: 2249 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_2 (copy), v2 (copy)
    local v74 = l_v7_2.new();
    if v73.action_type ~= nil then
        v74.action_type = if typeof(v73.action_type) == "number" then v2.ActionType.fromNumber(v73.action_type) or v73.action_type else v2.ActionType.fromName(v73.action_type) or v73.action_type;
    end;
    if v73.actionType ~= nil then
        v74.action_type = if typeof(v73.actionType) == "number" then v2.ActionType.fromNumber(v73.actionType) or v73.actionType else v2.ActionType.fromName(v73.actionType) or v73.actionType;
    end;
    if v73.action_params ~= nil then
        v74.action_params = v2.LinkAction_Params.jsonDecode(v73.action_params);
    end;
    if v73.actionParams ~= nil then
        v74.action_params = v2.LinkAction_Params.jsonDecode(v73.actionParams);
    end;
    return v74;
end;
v7.descriptor = {
    name = "LinkAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.LinkAction"
};
v2.LinkAction = v7;
v1.default:register(v2.LinkAction);
v7 = {};
v7.__index = v7;
local l_v7_3 = v7 --[[ copy: 7 -> 11 ]];
v7.new = function(v76) --[[ Line: 2289 ]] --[[ Name: new ]]
    -- upvalues: l_v7_3 (copy)
    return (setmetatable({
        url = if not (v76 ~= nil) or v76.url == nil then nil else v76.url
    }, l_v7_3));
end;
v7.encode = function(v77) --[[ Line: 2295 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v78 = buffer.create(0);
    local v79 = 0;
    if v77.url ~= nil then
        local v80 = v77.url:encode();
        local v81, v82 = v0.writeTag(v78, v79, 1, v0.wireTypes.lengthDelimited);
        v81, v82 = v0.writeBuffer(v81, v82, v80, buffer.len(v80));
        v78 = v81;
        v79 = v82;
    end;
    local v83 = buffer.create(v79);
    buffer.copy(v83, 0, v78, 0, v79);
    return v83;
end;
v7.decode = function(v84) --[[ Line: 2310 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_3 (copy), v0 (copy), v5 (copy)
    local v85 = l_v7_3.new();
    local v86 = 0;
    while v86 < buffer.len(v84) do
        local v87 = nil;
        local v88 = nil;
        local v89, v90, v91 = v0.readTag(v84, v86);
        v87 = v89;
        v88 = v90;
        v86 = v91;
        if v88 == v0.wireTypes.varint then
            v89 = nil;
            v90, v91 = v0.readVarInt(v84, v86);
            v89 = v90;
            v86 = v91;
        elseif v88 == v0.wireTypes.lengthDelimited then
            if v87 == 1 then
                v89 = nil;
                v90, v91 = v0.readBuffer(v84, v86);
                v89 = v90;
                v86 = v91;
                v85.url = v5.StringProp.decode(v89);
            else
                v89 = nil;
                v90, v91 = v0.readVarInt(v84, v86);
                v86 = v91 + v90;
            end;
        elseif v88 == v0.wireTypes.i32 then
            v89 = nil;
            v90, v91 = v0.readFixed32(v84, v86);
            v89 = v90;
            v86 = v91;
        elseif v88 == v0.wireTypes.i64 then
            v89 = nil;
            v90, v91 = v0.readFixed64(v84, v86);
            v89 = v90;
            v86 = v91;
        else
            error("Unsupported wire type: " .. v88);
        end;
    end;
    return v85;
end;
v7.jsonEncode = function(v92) --[[ Line: 2353 ]] --[[ Name: jsonEncode ]]
    local v93 = {};
    if v92.url ~= nil then
        v93.url = v92.url:jsonEncode();
    end;
    return v93;
end;
v7.jsonDecode = function(v94) --[[ Line: 2363 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_3 (copy), v5 (copy)
    local v95 = l_v7_3.new();
    if v94.url ~= nil then
        v95.url = v5.StringProp.jsonDecode(v94.url);
    end;
    return v95;
end;
v7.descriptor = {
    name = "LinkAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.LinkAction_Params = v7;
v1.default:register(v2.LinkAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_4 = v7 --[[ copy: 7 -> 12 ]];
v7.new = function(v97) --[[ Line: 2387 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_4 (copy)
    return (setmetatable({
        action_type = if not (v97 ~= nil) or v97.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v97.action_type, 
        action_params = if not (v97 ~= nil) or v97.action_params == nil then nil else v97.action_params
    }, l_v7_4));
end;
v7.encode = function(v98) --[[ Line: 2396 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v99 = buffer.create(0);
    local v100 = 0;
    if v98.action_type ~= nil and (v98.action_type ~= nil and v98.action_type ~= 0 or v98.action_type ~= v2.ActionType.fromNumber(0)) then
        local v101, v102 = v0.writeTag(v99, v100, 1, v0.wireTypes.varint);
        v101, v102 = v0.writeVarInt(v101, v102, v2.ActionType.toNumber(v98.action_type));
        v99 = v101;
        v100 = v102;
    end;
    if v98.action_params ~= nil then
        local v103 = v98.action_params:encode();
        local v104, v105 = v0.writeTag(v99, v100, 2, v0.wireTypes.lengthDelimited);
        v104, v105 = v0.writeBuffer(v104, v105, v103, buffer.len(v103));
        v99 = v104;
        v100 = v105;
    end;
    local v106 = buffer.create(v100);
    buffer.copy(v106, 0, v99, 0, v100);
    return v106;
end;
v7.decode = function(v107) --[[ Line: 2422 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_4 (copy), v0 (copy), v2 (copy)
    local v108 = l_v7_4.new();
    local v109 = 0;
    while v109 < buffer.len(v107) do
        local v110 = nil;
        local v111 = nil;
        local v112, v113, v114 = v0.readTag(v107, v109);
        v110 = v112;
        v111 = v113;
        v109 = v114;
        if v111 == v0.wireTypes.varint then
            if v110 == 1 then
                v112 = nil;
                v113, v114 = v0.readVarIntI32(v107, v109);
                v112 = v113;
                v109 = v114;
                v108.action_type = v2.ActionType.fromNumber(v112) or v112;
            else
                v112 = nil;
                v113, v114 = v0.readVarInt(v107, v109);
                v112 = v113;
                v109 = v114;
            end;
        elseif v111 == v0.wireTypes.lengthDelimited then
            if v110 == 2 then
                v112 = nil;
                v113, v114 = v0.readBuffer(v107, v109);
                v112 = v113;
                v109 = v114;
                v108.action_params = v2.OpenGameDetailsAction_Params.decode(v112);
            else
                v112 = nil;
                v113, v114 = v0.readVarInt(v107, v109);
                v109 = v114 + v113;
            end;
        elseif v111 == v0.wireTypes.i32 then
            v112 = nil;
            v113, v114 = v0.readFixed32(v107, v109);
            v112 = v113;
            v109 = v114;
        elseif v111 == v0.wireTypes.i64 then
            v112 = nil;
            v113, v114 = v0.readFixed64(v107, v109);
            v112 = v113;
            v109 = v114;
        else
            error("Unsupported wire type: " .. v111);
        end;
    end;
    return v108;
end;
v7.jsonEncode = function(v115) --[[ Line: 2470 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v116 = {};
    if v115.action_type ~= nil and (v115.action_type ~= nil and v115.action_type ~= 0 or v115.action_type ~= v2.ActionType.fromNumber(0)) then
        v116.actionType = if typeof(v115.action_type) == "number" then v115.action_type else v2.ActionType.toNumber(v115.action_type);
    end;
    if v115.action_params ~= nil then
        v116.actionParams = v115.action_params:jsonEncode();
    end;
    return v116;
end;
v7.jsonDecode = function(v117) --[[ Line: 2492 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_4 (copy), v2 (copy)
    local v118 = l_v7_4.new();
    if v117.action_type ~= nil then
        v118.action_type = if typeof(v117.action_type) == "number" then v2.ActionType.fromNumber(v117.action_type) or v117.action_type else v2.ActionType.fromName(v117.action_type) or v117.action_type;
    end;
    if v117.actionType ~= nil then
        v118.action_type = if typeof(v117.actionType) == "number" then v2.ActionType.fromNumber(v117.actionType) or v117.actionType else v2.ActionType.fromName(v117.actionType) or v117.actionType;
    end;
    if v117.action_params ~= nil then
        v118.action_params = v2.OpenGameDetailsAction_Params.jsonDecode(v117.action_params);
    end;
    if v117.actionParams ~= nil then
        v118.action_params = v2.OpenGameDetailsAction_Params.jsonDecode(v117.actionParams);
    end;
    return v118;
end;
v7.descriptor = {
    name = "OpenGameDetailsAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameDetailsAction"
};
v2.OpenGameDetailsAction = v7;
v1.default:register(v2.OpenGameDetailsAction);
v7 = {};
v7.__index = v7;
local l_v7_5 = v7 --[[ copy: 7 -> 13 ]];
v7.new = function(v120) --[[ Line: 2532 ]] --[[ Name: new ]]
    -- upvalues: l_v7_5 (copy)
    return (setmetatable({
        place_id = if not (v120 ~= nil) or v120.place_id == nil then nil else v120.place_id, 
        universe_id = if not (v120 ~= nil) or v120.universe_id == nil then nil else v120.universe_id
    }, l_v7_5));
end;
v7.encode = function(v121) --[[ Line: 2541 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v122 = buffer.create(0);
    local v123 = 0;
    if v121.place_id ~= nil then
        local v124 = v121.place_id:encode();
        local v125, v126 = v0.writeTag(v122, v123, 1, v0.wireTypes.lengthDelimited);
        v125, v126 = v0.writeBuffer(v125, v126, v124, buffer.len(v124));
        v122 = v125;
        v123 = v126;
    end;
    if v121.universe_id ~= nil then
        local v127 = v121.universe_id:encode();
        local v128, v129 = v0.writeTag(v122, v123, 2, v0.wireTypes.lengthDelimited);
        v128, v129 = v0.writeBuffer(v128, v129, v127, buffer.len(v127));
        v122 = v128;
        v123 = v129;
    end;
    local v130 = buffer.create(v123);
    buffer.copy(v130, 0, v122, 0, v123);
    return v130;
end;
v7.decode = function(v131) --[[ Line: 2562 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_5 (copy), v0 (copy), v5 (copy)
    local v132 = l_v7_5.new();
    local v133 = 0;
    while v133 < buffer.len(v131) do
        local v134 = nil;
        local v135 = nil;
        local v136, v137, v138 = v0.readTag(v131, v133);
        v134 = v136;
        v135 = v137;
        v133 = v138;
        if v135 == v0.wireTypes.varint then
            v136 = nil;
            v137, v138 = v0.readVarInt(v131, v133);
            v136 = v137;
            v133 = v138;
        elseif v135 == v0.wireTypes.lengthDelimited then
            if v134 == 1 then
                v136 = nil;
                v137, v138 = v0.readBuffer(v131, v133);
                v136 = v137;
                v133 = v138;
                v132.place_id = v5.StringProp.decode(v136);
            elseif v134 == 2 then
                v136 = nil;
                v137, v138 = v0.readBuffer(v131, v133);
                v136 = v137;
                v133 = v138;
                v132.universe_id = v5.StringProp.decode(v136);
            else
                v136 = nil;
                v137, v138 = v0.readVarInt(v131, v133);
                v133 = v138 + v137;
            end;
        elseif v135 == v0.wireTypes.i32 then
            v136 = nil;
            v137, v138 = v0.readFixed32(v131, v133);
            v136 = v137;
            v133 = v138;
        elseif v135 == v0.wireTypes.i64 then
            v136 = nil;
            v137, v138 = v0.readFixed64(v131, v133);
            v136 = v137;
            v133 = v138;
        else
            error("Unsupported wire type: " .. v135);
        end;
    end;
    return v132;
end;
v7.jsonEncode = function(v139) --[[ Line: 2610 ]] --[[ Name: jsonEncode ]]
    local v140 = {};
    if v139.place_id ~= nil then
        v140.placeId = v139.place_id:jsonEncode();
    end;
    if v139.universe_id ~= nil then
        v140.universeId = v139.universe_id:jsonEncode();
    end;
    return v140;
end;
v7.jsonDecode = function(v141) --[[ Line: 2624 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_5 (copy), v5 (copy)
    local v142 = l_v7_5.new();
    if v141.place_id ~= nil then
        v142.place_id = v5.StringProp.jsonDecode(v141.place_id);
    end;
    if v141.placeId ~= nil then
        v142.place_id = v5.StringProp.jsonDecode(v141.placeId);
    end;
    if v141.universe_id ~= nil then
        v142.universe_id = v5.StringProp.jsonDecode(v141.universe_id);
    end;
    if v141.universeId ~= nil then
        v142.universe_id = v5.StringProp.jsonDecode(v141.universeId);
    end;
    return v142;
end;
v7.descriptor = {
    name = "OpenGameDetailsAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenGameDetailsAction_Params = v7;
v1.default:register(v2.OpenGameDetailsAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_6 = v7 --[[ copy: 7 -> 14 ]];
v7.new = function(v144) --[[ Line: 2661 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_6 (copy)
    return (setmetatable({
        action_type = if not (v144 ~= nil) or v144.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v144.action_type, 
        action_params = if not (v144 ~= nil) or v144.action_params == nil then nil else v144.action_params
    }, l_v7_6));
end;
v7.encode = function(v145) --[[ Line: 2670 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v146 = buffer.create(0);
    local v147 = 0;
    if v145.action_type ~= nil and (v145.action_type ~= nil and v145.action_type ~= 0 or v145.action_type ~= v2.ActionType.fromNumber(0)) then
        local v148, v149 = v0.writeTag(v146, v147, 1, v0.wireTypes.varint);
        v148, v149 = v0.writeVarInt(v148, v149, v2.ActionType.toNumber(v145.action_type));
        v146 = v148;
        v147 = v149;
    end;
    if v145.action_params ~= nil then
        local v150 = v145.action_params:encode();
        local v151, v152 = v0.writeTag(v146, v147, 2, v0.wireTypes.lengthDelimited);
        v151, v152 = v0.writeBuffer(v151, v152, v150, buffer.len(v150));
        v146 = v151;
        v147 = v152;
    end;
    local v153 = buffer.create(v147);
    buffer.copy(v153, 0, v146, 0, v147);
    return v153;
end;
v7.decode = function(v154) --[[ Line: 2696 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_6 (copy), v0 (copy), v2 (copy)
    local v155 = l_v7_6.new();
    local v156 = 0;
    while v156 < buffer.len(v154) do
        local v157 = nil;
        local v158 = nil;
        local v159, v160, v161 = v0.readTag(v154, v156);
        v157 = v159;
        v158 = v160;
        v156 = v161;
        if v158 == v0.wireTypes.varint then
            if v157 == 1 then
                v159 = nil;
                v160, v161 = v0.readVarIntI32(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.action_type = v2.ActionType.fromNumber(v159) or v159;
            else
                v159 = nil;
                v160, v161 = v0.readVarInt(v154, v156);
                v159 = v160;
                v156 = v161;
            end;
        elseif v158 == v0.wireTypes.lengthDelimited then
            if v157 == 2 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.action_params = v2.OpenJoinFriendsAction_Params.decode(v159);
            else
                v159 = nil;
                v160, v161 = v0.readVarInt(v154, v156);
                v156 = v161 + v160;
            end;
        elseif v158 == v0.wireTypes.i32 then
            v159 = nil;
            v160, v161 = v0.readFixed32(v154, v156);
            v159 = v160;
            v156 = v161;
        elseif v158 == v0.wireTypes.i64 then
            v159 = nil;
            v160, v161 = v0.readFixed64(v154, v156);
            v159 = v160;
            v156 = v161;
        else
            error("Unsupported wire type: " .. v158);
        end;
    end;
    return v155;
end;
v7.jsonEncode = function(v162) --[[ Line: 2744 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v163 = {};
    if v162.action_type ~= nil and (v162.action_type ~= nil and v162.action_type ~= 0 or v162.action_type ~= v2.ActionType.fromNumber(0)) then
        v163.actionType = if typeof(v162.action_type) == "number" then v162.action_type else v2.ActionType.toNumber(v162.action_type);
    end;
    if v162.action_params ~= nil then
        v163.actionParams = v162.action_params:jsonEncode();
    end;
    return v163;
end;
v7.jsonDecode = function(v164) --[[ Line: 2766 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_6 (copy), v2 (copy)
    local v165 = l_v7_6.new();
    if v164.action_type ~= nil then
        v165.action_type = if typeof(v164.action_type) == "number" then v2.ActionType.fromNumber(v164.action_type) or v164.action_type else v2.ActionType.fromName(v164.action_type) or v164.action_type;
    end;
    if v164.actionType ~= nil then
        v165.action_type = if typeof(v164.actionType) == "number" then v2.ActionType.fromNumber(v164.actionType) or v164.actionType else v2.ActionType.fromName(v164.actionType) or v164.actionType;
    end;
    if v164.action_params ~= nil then
        v165.action_params = v2.OpenJoinFriendsAction_Params.jsonDecode(v164.action_params);
    end;
    if v164.actionParams ~= nil then
        v165.action_params = v2.OpenJoinFriendsAction_Params.jsonDecode(v164.actionParams);
    end;
    return v165;
end;
v7.descriptor = {
    name = "OpenJoinFriendsAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenJoinFriendsAction"
};
v2.OpenJoinFriendsAction = v7;
v1.default:register(v2.OpenJoinFriendsAction);
v7 = {};
v7.__index = v7;
local l_v7_7 = v7 --[[ copy: 7 -> 15 ]];
v7.new = function(v167) --[[ Line: 2806 ]] --[[ Name: new ]]
    -- upvalues: l_v7_7 (copy)
    return (setmetatable({
        place_id = if not (v167 ~= nil) or v167.place_id == nil then nil else v167.place_id, 
        universe_id = if not (v167 ~= nil) or v167.universe_id == nil then nil else v167.universe_id
    }, l_v7_7));
end;
v7.encode = function(v168) --[[ Line: 2815 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v169 = buffer.create(0);
    local v170 = 0;
    if v168.place_id ~= nil then
        local v171 = v168.place_id:encode();
        local v172, v173 = v0.writeTag(v169, v170, 1, v0.wireTypes.lengthDelimited);
        v172, v173 = v0.writeBuffer(v172, v173, v171, buffer.len(v171));
        v169 = v172;
        v170 = v173;
    end;
    if v168.universe_id ~= nil then
        local v174 = v168.universe_id:encode();
        local v175, v176 = v0.writeTag(v169, v170, 2, v0.wireTypes.lengthDelimited);
        v175, v176 = v0.writeBuffer(v175, v176, v174, buffer.len(v174));
        v169 = v175;
        v170 = v176;
    end;
    local v177 = buffer.create(v170);
    buffer.copy(v177, 0, v169, 0, v170);
    return v177;
end;
v7.decode = function(v178) --[[ Line: 2836 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_7 (copy), v0 (copy), v5 (copy)
    local v179 = l_v7_7.new();
    local v180 = 0;
    while v180 < buffer.len(v178) do
        local v181 = nil;
        local v182 = nil;
        local v183, v184, v185 = v0.readTag(v178, v180);
        v181 = v183;
        v182 = v184;
        v180 = v185;
        if v182 == v0.wireTypes.varint then
            v183 = nil;
            v184, v185 = v0.readVarInt(v178, v180);
            v183 = v184;
            v180 = v185;
        elseif v182 == v0.wireTypes.lengthDelimited then
            if v181 == 1 then
                v183 = nil;
                v184, v185 = v0.readBuffer(v178, v180);
                v183 = v184;
                v180 = v185;
                v179.place_id = v5.StringProp.decode(v183);
            elseif v181 == 2 then
                v183 = nil;
                v184, v185 = v0.readBuffer(v178, v180);
                v183 = v184;
                v180 = v185;
                v179.universe_id = v5.StringProp.decode(v183);
            else
                v183 = nil;
                v184, v185 = v0.readVarInt(v178, v180);
                v180 = v185 + v184;
            end;
        elseif v182 == v0.wireTypes.i32 then
            v183 = nil;
            v184, v185 = v0.readFixed32(v178, v180);
            v183 = v184;
            v180 = v185;
        elseif v182 == v0.wireTypes.i64 then
            v183 = nil;
            v184, v185 = v0.readFixed64(v178, v180);
            v183 = v184;
            v180 = v185;
        else
            error("Unsupported wire type: " .. v182);
        end;
    end;
    return v179;
end;
v7.jsonEncode = function(v186) --[[ Line: 2884 ]] --[[ Name: jsonEncode ]]
    local v187 = {};
    if v186.place_id ~= nil then
        v187.placeId = v186.place_id:jsonEncode();
    end;
    if v186.universe_id ~= nil then
        v187.universeId = v186.universe_id:jsonEncode();
    end;
    return v187;
end;
v7.jsonDecode = function(v188) --[[ Line: 2898 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_7 (copy), v5 (copy)
    local v189 = l_v7_7.new();
    if v188.place_id ~= nil then
        v189.place_id = v5.StringProp.jsonDecode(v188.place_id);
    end;
    if v188.placeId ~= nil then
        v189.place_id = v5.StringProp.jsonDecode(v188.placeId);
    end;
    if v188.universe_id ~= nil then
        v189.universe_id = v5.StringProp.jsonDecode(v188.universe_id);
    end;
    if v188.universeId ~= nil then
        v189.universe_id = v5.StringProp.jsonDecode(v188.universeId);
    end;
    return v189;
end;
v7.descriptor = {
    name = "OpenJoinFriendsAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenJoinFriendsAction_Params = v7;
v1.default:register(v2.OpenJoinFriendsAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_8 = v7 --[[ copy: 7 -> 16 ]];
v7.new = function(v191) --[[ Line: 2935 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_8 (copy)
    return (setmetatable({
        action_type = if not (v191 ~= nil) or v191.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v191.action_type, 
        action_params = if not (v191 ~= nil) or v191.action_params == nil then nil else v191.action_params
    }, l_v7_8));
end;
v7.encode = function(v192) --[[ Line: 2946 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v193 = buffer.create(0);
    local v194 = 0;
    if v192.action_type ~= nil and (v192.action_type ~= nil and v192.action_type ~= 0 or v192.action_type ~= v2.ActionType.fromNumber(0)) then
        local v195, v196 = v0.writeTag(v193, v194, 1, v0.wireTypes.varint);
        v195, v196 = v0.writeVarInt(v195, v196, v2.ActionType.toNumber(v192.action_type));
        v193 = v195;
        v194 = v196;
    end;
    if v192.action_params ~= nil then
        local v197 = v192.action_params:encode();
        local v198, v199 = v0.writeTag(v193, v194, 2, v0.wireTypes.lengthDelimited);
        v198, v199 = v0.writeBuffer(v198, v199, v197, buffer.len(v197));
        v193 = v198;
        v194 = v199;
    end;
    local v200 = buffer.create(v194);
    buffer.copy(v200, 0, v193, 0, v194);
    return v200;
end;
v7.decode = function(v201) --[[ Line: 2972 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_8 (copy), v0 (copy), v2 (copy)
    local v202 = l_v7_8.new();
    local v203 = 0;
    while v203 < buffer.len(v201) do
        local v204 = nil;
        local v205 = nil;
        local v206, v207, v208 = v0.readTag(v201, v203);
        v204 = v206;
        v205 = v207;
        v203 = v208;
        if v205 == v0.wireTypes.varint then
            if v204 == 1 then
                v206 = nil;
                v207, v208 = v0.readVarIntI32(v201, v203);
                v206 = v207;
                v203 = v208;
                v202.action_type = v2.ActionType.fromNumber(v206) or v206;
            else
                v206 = nil;
                v207, v208 = v0.readVarInt(v201, v203);
                v206 = v207;
                v203 = v208;
            end;
        elseif v205 == v0.wireTypes.lengthDelimited then
            if v204 == 2 then
                v206 = nil;
                v207, v208 = v0.readBuffer(v201, v203);
                v206 = v207;
                v203 = v208;
                v202.action_params = v2.OpenMarketplaceTryOnAction_Params.decode(v206);
            else
                v206 = nil;
                v207, v208 = v0.readVarInt(v201, v203);
                v203 = v208 + v207;
            end;
        elseif v205 == v0.wireTypes.i32 then
            v206 = nil;
            v207, v208 = v0.readFixed32(v201, v203);
            v206 = v207;
            v203 = v208;
        elseif v205 == v0.wireTypes.i64 then
            v206 = nil;
            v207, v208 = v0.readFixed64(v201, v203);
            v206 = v207;
            v203 = v208;
        else
            error("Unsupported wire type: " .. v205);
        end;
    end;
    return v202;
end;
v7.jsonEncode = function(v209) --[[ Line: 3020 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v210 = {};
    if v209.action_type ~= nil and (v209.action_type ~= nil and v209.action_type ~= 0 or v209.action_type ~= v2.ActionType.fromNumber(0)) then
        v210.actionType = if typeof(v209.action_type) == "number" then v209.action_type else v2.ActionType.toNumber(v209.action_type);
    end;
    if v209.action_params ~= nil then
        v210.actionParams = v209.action_params:jsonEncode();
    end;
    return v210;
end;
v7.jsonDecode = function(v211) --[[ Line: 3042 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_8 (copy), v2 (copy)
    local v212 = l_v7_8.new();
    if v211.action_type ~= nil then
        v212.action_type = if typeof(v211.action_type) == "number" then v2.ActionType.fromNumber(v211.action_type) or v211.action_type else v2.ActionType.fromName(v211.action_type) or v211.action_type;
    end;
    if v211.actionType ~= nil then
        v212.action_type = if typeof(v211.actionType) == "number" then v2.ActionType.fromNumber(v211.actionType) or v211.actionType else v2.ActionType.fromName(v211.actionType) or v211.actionType;
    end;
    if v211.action_params ~= nil then
        v212.action_params = v2.OpenMarketplaceTryOnAction_Params.jsonDecode(v211.action_params);
    end;
    if v211.actionParams ~= nil then
        v212.action_params = v2.OpenMarketplaceTryOnAction_Params.jsonDecode(v211.actionParams);
    end;
    return v212;
end;
v7.descriptor = {
    name = "OpenMarketplaceTryOnAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceTryOnAction"
};
v2.OpenMarketplaceTryOnAction = v7;
v1.default:register(v2.OpenMarketplaceTryOnAction);
v7 = {};
v7.__index = v7;
local l_v7_9 = v7 --[[ copy: 7 -> 17 ]];
v7.new = function(v214) --[[ Line: 3082 ]] --[[ Name: new ]]
    -- upvalues: l_v7_9 (copy)
    return (setmetatable({
        item_id = if not (v214 ~= nil) or v214.item_id == nil then nil else v214.item_id, 
        item_type = if not (v214 ~= nil) or v214.item_type == nil then nil else v214.item_type, 
        item_sub_type_name = if not (v214 ~= nil) or v214.item_sub_type_name == nil then nil else v214.item_sub_type_name
    }, l_v7_9));
end;
v7.encode = function(v215) --[[ Line: 3092 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v216 = buffer.create(0);
    local v217 = 0;
    if v215.item_id ~= nil then
        local v218 = v215.item_id:encode();
        local v219, v220 = v0.writeTag(v216, v217, 1, v0.wireTypes.lengthDelimited);
        v219, v220 = v0.writeBuffer(v219, v220, v218, buffer.len(v218));
        v216 = v219;
        v217 = v220;
    end;
    if v215.item_type ~= nil then
        local v221 = v215.item_type:encode();
        local v222, v223 = v0.writeTag(v216, v217, 2, v0.wireTypes.lengthDelimited);
        v222, v223 = v0.writeBuffer(v222, v223, v221, buffer.len(v221));
        v216 = v222;
        v217 = v223;
    end;
    if v215.item_sub_type_name ~= nil then
        local v224 = v215.item_sub_type_name:encode();
        local v225, v226 = v0.writeTag(v216, v217, 3, v0.wireTypes.lengthDelimited);
        v225, v226 = v0.writeBuffer(v225, v226, v224, buffer.len(v224));
        v216 = v225;
        v217 = v226;
    end;
    local v227 = buffer.create(v217);
    buffer.copy(v227, 0, v216, 0, v217);
    return v227;
end;
v7.decode = function(v228) --[[ Line: 3119 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_9 (copy), v0 (copy), v5 (copy)
    local v229 = l_v7_9.new();
    local v230 = 0;
    while v230 < buffer.len(v228) do
        local v231 = nil;
        local v232 = nil;
        local v233, v234, v235 = v0.readTag(v228, v230);
        v231 = v233;
        v232 = v234;
        v230 = v235;
        if v232 == v0.wireTypes.varint then
            v233 = nil;
            v234, v235 = v0.readVarInt(v228, v230);
            v233 = v234;
            v230 = v235;
        elseif v232 == v0.wireTypes.lengthDelimited then
            if v231 == 1 then
                v233 = nil;
                v234, v235 = v0.readBuffer(v228, v230);
                v233 = v234;
                v230 = v235;
                v229.item_id = v5.StringProp.decode(v233);
            elseif v231 == 2 then
                v233 = nil;
                v234, v235 = v0.readBuffer(v228, v230);
                v233 = v234;
                v230 = v235;
                v229.item_type = v5.StringProp.decode(v233);
            elseif v231 == 3 then
                v233 = nil;
                v234, v235 = v0.readBuffer(v228, v230);
                v233 = v234;
                v230 = v235;
                v229.item_sub_type_name = v5.StringProp.decode(v233);
            else
                v233 = nil;
                v234, v235 = v0.readVarInt(v228, v230);
                v230 = v235 + v234;
            end;
        elseif v232 == v0.wireTypes.i32 then
            v233 = nil;
            v234, v235 = v0.readFixed32(v228, v230);
            v233 = v234;
            v230 = v235;
        elseif v232 == v0.wireTypes.i64 then
            v233 = nil;
            v234, v235 = v0.readFixed64(v228, v230);
            v233 = v234;
            v230 = v235;
        else
            error("Unsupported wire type: " .. v232);
        end;
    end;
    return v229;
end;
v7.jsonEncode = function(v236) --[[ Line: 3172 ]] --[[ Name: jsonEncode ]]
    local v237 = {};
    if v236.item_id ~= nil then
        v237.itemId = v236.item_id:jsonEncode();
    end;
    if v236.item_type ~= nil then
        v237.itemType = v236.item_type:jsonEncode();
    end;
    if v236.item_sub_type_name ~= nil then
        v237.itemSubTypeName = v236.item_sub_type_name:jsonEncode();
    end;
    return v237;
end;
v7.jsonDecode = function(v238) --[[ Line: 3190 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_9 (copy), v5 (copy)
    local v239 = l_v7_9.new();
    if v238.item_id ~= nil then
        v239.item_id = v5.StringProp.jsonDecode(v238.item_id);
    end;
    if v238.itemId ~= nil then
        v239.item_id = v5.StringProp.jsonDecode(v238.itemId);
    end;
    if v238.item_type ~= nil then
        v239.item_type = v5.StringProp.jsonDecode(v238.item_type);
    end;
    if v238.itemType ~= nil then
        v239.item_type = v5.StringProp.jsonDecode(v238.itemType);
    end;
    if v238.item_sub_type_name ~= nil then
        v239.item_sub_type_name = v5.StringProp.jsonDecode(v238.item_sub_type_name);
    end;
    if v238.itemSubTypeName ~= nil then
        v239.item_sub_type_name = v5.StringProp.jsonDecode(v238.itemSubTypeName);
    end;
    return v239;
end;
v7.descriptor = {
    name = "OpenMarketplaceTryOnAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenMarketplaceTryOnAction_Params = v7;
v1.default:register(v2.OpenMarketplaceTryOnAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_10 = v7 --[[ copy: 7 -> 18 ]];
v7.new = function(v241) --[[ Line: 3238 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_10 (copy)
    return (setmetatable({
        action_type = if not (v241 ~= nil) or v241.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v241.action_type, 
        action_params = if not (v241 ~= nil) or v241.action_params == nil then nil else v241.action_params
    }, l_v7_10));
end;
v7.encode = function(v242) --[[ Line: 3247 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v243 = buffer.create(0);
    local v244 = 0;
    if v242.action_type ~= nil and (v242.action_type ~= nil and v242.action_type ~= 0 or v242.action_type ~= v2.ActionType.fromNumber(0)) then
        local v245, v246 = v0.writeTag(v243, v244, 1, v0.wireTypes.varint);
        v245, v246 = v0.writeVarInt(v245, v246, v2.ActionType.toNumber(v242.action_type));
        v243 = v245;
        v244 = v246;
    end;
    if v242.action_params ~= nil then
        local v247 = v242.action_params:encode();
        local v248, v249 = v0.writeTag(v243, v244, 2, v0.wireTypes.lengthDelimited);
        v248, v249 = v0.writeBuffer(v248, v249, v247, buffer.len(v247));
        v243 = v248;
        v244 = v249;
    end;
    local v250 = buffer.create(v244);
    buffer.copy(v250, 0, v243, 0, v244);
    return v250;
end;
v7.decode = function(v251) --[[ Line: 3273 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_10 (copy), v0 (copy), v2 (copy)
    local v252 = l_v7_10.new();
    local v253 = 0;
    while v253 < buffer.len(v251) do
        local v254 = nil;
        local v255 = nil;
        local v256, v257, v258 = v0.readTag(v251, v253);
        v254 = v256;
        v255 = v257;
        v253 = v258;
        if v255 == v0.wireTypes.varint then
            if v254 == 1 then
                v256 = nil;
                v257, v258 = v0.readVarIntI32(v251, v253);
                v256 = v257;
                v253 = v258;
                v252.action_type = v2.ActionType.fromNumber(v256) or v256;
            else
                v256 = nil;
                v257, v258 = v0.readVarInt(v251, v253);
                v256 = v257;
                v253 = v258;
            end;
        elseif v255 == v0.wireTypes.lengthDelimited then
            if v254 == 2 then
                v256 = nil;
                v257, v258 = v0.readBuffer(v251, v253);
                v256 = v257;
                v253 = v258;
                v252.action_params = v2.OpenSeeAllAction_Params.decode(v256);
            else
                v256 = nil;
                v257, v258 = v0.readVarInt(v251, v253);
                v253 = v258 + v257;
            end;
        elseif v255 == v0.wireTypes.i32 then
            v256 = nil;
            v257, v258 = v0.readFixed32(v251, v253);
            v256 = v257;
            v253 = v258;
        elseif v255 == v0.wireTypes.i64 then
            v256 = nil;
            v257, v258 = v0.readFixed64(v251, v253);
            v256 = v257;
            v253 = v258;
        else
            error("Unsupported wire type: " .. v255);
        end;
    end;
    return v252;
end;
v7.jsonEncode = function(v259) --[[ Line: 3321 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v260 = {};
    if v259.action_type ~= nil and (v259.action_type ~= nil and v259.action_type ~= 0 or v259.action_type ~= v2.ActionType.fromNumber(0)) then
        v260.actionType = if typeof(v259.action_type) == "number" then v259.action_type else v2.ActionType.toNumber(v259.action_type);
    end;
    if v259.action_params ~= nil then
        v260.actionParams = v259.action_params:jsonEncode();
    end;
    return v260;
end;
v7.jsonDecode = function(v261) --[[ Line: 3343 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_10 (copy), v2 (copy)
    local v262 = l_v7_10.new();
    if v261.action_type ~= nil then
        v262.action_type = if typeof(v261.action_type) == "number" then v2.ActionType.fromNumber(v261.action_type) or v261.action_type else v2.ActionType.fromName(v261.action_type) or v261.action_type;
    end;
    if v261.actionType ~= nil then
        v262.action_type = if typeof(v261.actionType) == "number" then v2.ActionType.fromNumber(v261.actionType) or v261.actionType else v2.ActionType.fromName(v261.actionType) or v261.actionType;
    end;
    if v261.action_params ~= nil then
        v262.action_params = v2.OpenSeeAllAction_Params.jsonDecode(v261.action_params);
    end;
    if v261.actionParams ~= nil then
        v262.action_params = v2.OpenSeeAllAction_Params.jsonDecode(v261.actionParams);
    end;
    return v262;
end;
v7.descriptor = {
    name = "OpenSeeAllAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenSeeAllAction"
};
v2.OpenSeeAllAction = v7;
v1.default:register(v2.OpenSeeAllAction);
v7 = {};
v7.__index = v7;
local l_v7_11 = v7 --[[ copy: 7 -> 19 ]];
v7.new = function(v264) --[[ Line: 3383 ]] --[[ Name: new ]]
    -- upvalues: l_v7_11 (copy)
    return (setmetatable({
        collection_id = if not (v264 ~= nil) or v264.collection_id == nil then nil else v264.collection_id, 
        game_set_target_id = if not (v264 ~= nil) or v264.game_set_target_id == nil then nil else v264.game_set_target_id, 
        collection_position = if not (v264 ~= nil) or v264.collection_position == nil then nil else v264.collection_position
    }, l_v7_11));
end;
v7.encode = function(v265) --[[ Line: 3393 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v266 = buffer.create(0);
    local v267 = 0;
    if v265.collection_id ~= nil then
        local v268 = v265.collection_id:encode();
        local v269, v270 = v0.writeTag(v266, v267, 1, v0.wireTypes.lengthDelimited);
        v269, v270 = v0.writeBuffer(v269, v270, v268, buffer.len(v268));
        v266 = v269;
        v267 = v270;
    end;
    if v265.game_set_target_id ~= nil then
        local v271 = v265.game_set_target_id:encode();
        local v272, v273 = v0.writeTag(v266, v267, 2, v0.wireTypes.lengthDelimited);
        v272, v273 = v0.writeBuffer(v272, v273, v271, buffer.len(v271));
        v266 = v272;
        v267 = v273;
    end;
    if v265.collection_position ~= nil then
        local v274 = v265.collection_position:encode();
        local v275, v276 = v0.writeTag(v266, v267, 3, v0.wireTypes.lengthDelimited);
        v275, v276 = v0.writeBuffer(v275, v276, v274, buffer.len(v274));
        v266 = v275;
        v267 = v276;
    end;
    local v277 = buffer.create(v267);
    buffer.copy(v277, 0, v266, 0, v267);
    return v277;
end;
v7.decode = function(v278) --[[ Line: 3420 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_11 (copy), v0 (copy), v5 (copy)
    local v279 = l_v7_11.new();
    local v280 = 0;
    while v280 < buffer.len(v278) do
        local v281 = nil;
        local v282 = nil;
        local v283, v284, v285 = v0.readTag(v278, v280);
        v281 = v283;
        v282 = v284;
        v280 = v285;
        if v282 == v0.wireTypes.varint then
            v283 = nil;
            v284, v285 = v0.readVarInt(v278, v280);
            v283 = v284;
            v280 = v285;
        elseif v282 == v0.wireTypes.lengthDelimited then
            if v281 == 1 then
                v283 = nil;
                v284, v285 = v0.readBuffer(v278, v280);
                v283 = v284;
                v280 = v285;
                v279.collection_id = v5.StringProp.decode(v283);
            elseif v281 == 2 then
                v283 = nil;
                v284, v285 = v0.readBuffer(v278, v280);
                v283 = v284;
                v280 = v285;
                v279.game_set_target_id = v5.StringProp.decode(v283);
            elseif v281 == 3 then
                v283 = nil;
                v284, v285 = v0.readBuffer(v278, v280);
                v283 = v284;
                v280 = v285;
                v279.collection_position = v5.StringProp.decode(v283);
            else
                v283 = nil;
                v284, v285 = v0.readVarInt(v278, v280);
                v280 = v285 + v284;
            end;
        elseif v282 == v0.wireTypes.i32 then
            v283 = nil;
            v284, v285 = v0.readFixed32(v278, v280);
            v283 = v284;
            v280 = v285;
        elseif v282 == v0.wireTypes.i64 then
            v283 = nil;
            v284, v285 = v0.readFixed64(v278, v280);
            v283 = v284;
            v280 = v285;
        else
            error("Unsupported wire type: " .. v282);
        end;
    end;
    return v279;
end;
v7.jsonEncode = function(v286) --[[ Line: 3474 ]] --[[ Name: jsonEncode ]]
    local v287 = {};
    if v286.collection_id ~= nil then
        v287.collectionId = v286.collection_id:jsonEncode();
    end;
    if v286.game_set_target_id ~= nil then
        v287.gameSetTargetId = v286.game_set_target_id:jsonEncode();
    end;
    if v286.collection_position ~= nil then
        v287.collectionPosition = v286.collection_position:jsonEncode();
    end;
    return v287;
end;
v7.jsonDecode = function(v288) --[[ Line: 3492 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_11 (copy), v5 (copy)
    local v289 = l_v7_11.new();
    if v288.collection_id ~= nil then
        v289.collection_id = v5.StringProp.jsonDecode(v288.collection_id);
    end;
    if v288.collectionId ~= nil then
        v289.collection_id = v5.StringProp.jsonDecode(v288.collectionId);
    end;
    if v288.game_set_target_id ~= nil then
        v289.game_set_target_id = v5.StringProp.jsonDecode(v288.game_set_target_id);
    end;
    if v288.gameSetTargetId ~= nil then
        v289.game_set_target_id = v5.StringProp.jsonDecode(v288.gameSetTargetId);
    end;
    if v288.collection_position ~= nil then
        v289.collection_position = v5.StringProp.jsonDecode(v288.collection_position);
    end;
    if v288.collectionPosition ~= nil then
        v289.collection_position = v5.StringProp.jsonDecode(v288.collectionPosition);
    end;
    return v289;
end;
v7.descriptor = {
    name = "OpenSeeAllAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenSeeAllAction_Params = v7;
v1.default:register(v2.OpenSeeAllAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_12 = v7 --[[ copy: 7 -> 20 ]];
v7.new = function(v291) --[[ Line: 3542 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_12 (copy)
    return (setmetatable({
        action_type = if not (v291 ~= nil) or v291.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v291.action_type, 
        action_params = if not (v291 ~= nil) or v291.action_params == nil then nil else v291.action_params
    }, l_v7_12));
end;
v7.encode = function(v292) --[[ Line: 3553 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v293 = buffer.create(0);
    local v294 = 0;
    if v292.action_type ~= nil and (v292.action_type ~= nil and v292.action_type ~= 0 or v292.action_type ~= v2.ActionType.fromNumber(0)) then
        local v295, v296 = v0.writeTag(v293, v294, 1, v0.wireTypes.varint);
        v295, v296 = v0.writeVarInt(v295, v296, v2.ActionType.toNumber(v292.action_type));
        v293 = v295;
        v294 = v296;
    end;
    if v292.action_params ~= nil then
        local v297 = v292.action_params:encode();
        local v298, v299 = v0.writeTag(v293, v294, 2, v0.wireTypes.lengthDelimited);
        v298, v299 = v0.writeBuffer(v298, v299, v297, buffer.len(v297));
        v293 = v298;
        v294 = v299;
    end;
    local v300 = buffer.create(v294);
    buffer.copy(v300, 0, v293, 0, v294);
    return v300;
end;
v7.decode = function(v301) --[[ Line: 3579 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_12 (copy), v0 (copy), v2 (copy)
    local v302 = l_v7_12.new();
    local v303 = 0;
    while v303 < buffer.len(v301) do
        local v304 = nil;
        local v305 = nil;
        local v306, v307, v308 = v0.readTag(v301, v303);
        v304 = v306;
        v305 = v307;
        v303 = v308;
        if v305 == v0.wireTypes.varint then
            if v304 == 1 then
                v306 = nil;
                v307, v308 = v0.readVarIntI32(v301, v303);
                v306 = v307;
                v303 = v308;
                v302.action_type = v2.ActionType.fromNumber(v306) or v306;
            else
                v306 = nil;
                v307, v308 = v0.readVarInt(v301, v303);
                v306 = v307;
                v303 = v308;
            end;
        elseif v305 == v0.wireTypes.lengthDelimited then
            if v304 == 2 then
                v306 = nil;
                v307, v308 = v0.readBuffer(v301, v303);
                v306 = v307;
                v303 = v308;
                v302.action_params = v2.OpenSponsoredTooltipAction_Params.decode(v306);
            else
                v306 = nil;
                v307, v308 = v0.readVarInt(v301, v303);
                v303 = v308 + v307;
            end;
        elseif v305 == v0.wireTypes.i32 then
            v306 = nil;
            v307, v308 = v0.readFixed32(v301, v303);
            v306 = v307;
            v303 = v308;
        elseif v305 == v0.wireTypes.i64 then
            v306 = nil;
            v307, v308 = v0.readFixed64(v301, v303);
            v306 = v307;
            v303 = v308;
        else
            error("Unsupported wire type: " .. v305);
        end;
    end;
    return v302;
end;
v7.jsonEncode = function(v309) --[[ Line: 3627 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v310 = {};
    if v309.action_type ~= nil and (v309.action_type ~= nil and v309.action_type ~= 0 or v309.action_type ~= v2.ActionType.fromNumber(0)) then
        v310.actionType = if typeof(v309.action_type) == "number" then v309.action_type else v2.ActionType.toNumber(v309.action_type);
    end;
    if v309.action_params ~= nil then
        v310.actionParams = v309.action_params:jsonEncode();
    end;
    return v310;
end;
v7.jsonDecode = function(v311) --[[ Line: 3649 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_12 (copy), v2 (copy)
    local v312 = l_v7_12.new();
    if v311.action_type ~= nil then
        v312.action_type = if typeof(v311.action_type) == "number" then v2.ActionType.fromNumber(v311.action_type) or v311.action_type else v2.ActionType.fromName(v311.action_type) or v311.action_type;
    end;
    if v311.actionType ~= nil then
        v312.action_type = if typeof(v311.actionType) == "number" then v2.ActionType.fromNumber(v311.actionType) or v311.actionType else v2.ActionType.fromName(v311.actionType) or v311.actionType;
    end;
    if v311.action_params ~= nil then
        v312.action_params = v2.OpenSponsoredTooltipAction_Params.jsonDecode(v311.action_params);
    end;
    if v311.actionParams ~= nil then
        v312.action_params = v2.OpenSponsoredTooltipAction_Params.jsonDecode(v311.actionParams);
    end;
    return v312;
end;
v7.descriptor = {
    name = "OpenSponsoredTooltipAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenSponsoredTooltipAction"
};
v2.OpenSponsoredTooltipAction = v7;
v1.default:register(v2.OpenSponsoredTooltipAction);
v7 = {};
v7.__index = v7;
local l_v7_13 = v7 --[[ copy: 7 -> 21 ]];
v7.new = function(_) --[[ Line: 3689 ]] --[[ Name: new ]]
    -- upvalues: l_v7_13 (copy)
    return (setmetatable({}, l_v7_13));
end;
v7.encode = function(_) --[[ Line: 3695 ]] --[[ Name: encode ]]
    local v316 = buffer.create(0);
    local v317 = buffer.create(0);
    buffer.copy(v317, 0, v316, 0, 0);
    return v317;
end;
v7.decode = function(v318) --[[ Line: 3704 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_13 (copy), v0 (copy)
    local v319 = l_v7_13.new();
    local v320 = 0;
    while v320 < buffer.len(v318) do
        local v321 = nil;
        local v322 = nil;
        local v323, v324, v325 = v0.readTag(v318, v320);
        v321 = v323;
        v322 = v324;
        v320 = v325;
        if v322 == v0.wireTypes.varint then
            v323 = nil;
            v324, v325 = v0.readVarInt(v318, v320);
            v323 = v324;
            v320 = v325;
        elseif v322 == v0.wireTypes.lengthDelimited then
            v323 = nil;
            v324, v325 = v0.readVarInt(v318, v320);
            v320 = v325 + v324;
        elseif v322 == v0.wireTypes.i32 then
            v323 = nil;
            v324, v325 = v0.readFixed32(v318, v320);
            v323 = v324;
            v320 = v325;
        elseif v322 == v0.wireTypes.i64 then
            v323 = nil;
            v324, v325 = v0.readFixed64(v318, v320);
            v323 = v324;
            v320 = v325;
        else
            error("Unsupported wire type: " .. v322);
        end;
    end;
    return v319;
end;
v7.jsonEncode = function(_) --[[ Line: 3742 ]] --[[ Name: jsonEncode ]]
    return {};
end;
v7.jsonDecode = function(_) --[[ Line: 3748 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_13 (copy)
    return (l_v7_13.new());
end;
v7.descriptor = {
    name = "OpenSponsoredTooltipAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenSponsoredTooltipAction_Params = v7;
v1.default:register(v2.OpenSponsoredTooltipAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_14 = v7 --[[ copy: 7 -> 22 ]];
v7.new = function(v329) --[[ Line: 3770 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_14 (copy)
    return (setmetatable({
        action_type = if not (v329 ~= nil) or v329.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v329.action_type, 
        action_params = if not (v329 ~= nil) or v329.action_params == nil then nil else v329.action_params
    }, l_v7_14));
end;
v7.encode = function(v330) --[[ Line: 3779 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v331 = buffer.create(0);
    local v332 = 0;
    if v330.action_type ~= nil and (v330.action_type ~= nil and v330.action_type ~= 0 or v330.action_type ~= v2.ActionType.fromNumber(0)) then
        local v333, v334 = v0.writeTag(v331, v332, 1, v0.wireTypes.varint);
        v333, v334 = v0.writeVarInt(v333, v334, v2.ActionType.toNumber(v330.action_type));
        v331 = v333;
        v332 = v334;
    end;
    if v330.action_params ~= nil then
        local v335 = v330.action_params:encode();
        local v336, v337 = v0.writeTag(v331, v332, 2, v0.wireTypes.lengthDelimited);
        v336, v337 = v0.writeBuffer(v336, v337, v335, buffer.len(v335));
        v331 = v336;
        v332 = v337;
    end;
    local v338 = buffer.create(v332);
    buffer.copy(v338, 0, v331, 0, v332);
    return v338;
end;
v7.decode = function(v339) --[[ Line: 3805 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_14 (copy), v0 (copy), v2 (copy)
    local v340 = l_v7_14.new();
    local v341 = 0;
    while v341 < buffer.len(v339) do
        local v342 = nil;
        local v343 = nil;
        local v344, v345, v346 = v0.readTag(v339, v341);
        v342 = v344;
        v343 = v345;
        v341 = v346;
        if v343 == v0.wireTypes.varint then
            if v342 == 1 then
                v344 = nil;
                v345, v346 = v0.readVarIntI32(v339, v341);
                v344 = v345;
                v341 = v346;
                v340.action_type = v2.ActionType.fromNumber(v344) or v344;
            else
                v344 = nil;
                v345, v346 = v0.readVarInt(v339, v341);
                v344 = v345;
                v341 = v346;
            end;
        elseif v343 == v0.wireTypes.lengthDelimited then
            if v342 == 2 then
                v344 = nil;
                v345, v346 = v0.readBuffer(v339, v341);
                v344 = v345;
                v341 = v346;
                v340.action_params = v2.PlayButtonClickAction_Params.decode(v344);
            else
                v344 = nil;
                v345, v346 = v0.readVarInt(v339, v341);
                v341 = v346 + v345;
            end;
        elseif v343 == v0.wireTypes.i32 then
            v344 = nil;
            v345, v346 = v0.readFixed32(v339, v341);
            v344 = v345;
            v341 = v346;
        elseif v343 == v0.wireTypes.i64 then
            v344 = nil;
            v345, v346 = v0.readFixed64(v339, v341);
            v344 = v345;
            v341 = v346;
        else
            error("Unsupported wire type: " .. v343);
        end;
    end;
    return v340;
end;
v7.jsonEncode = function(v347) --[[ Line: 3853 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v348 = {};
    if v347.action_type ~= nil and (v347.action_type ~= nil and v347.action_type ~= 0 or v347.action_type ~= v2.ActionType.fromNumber(0)) then
        v348.actionType = if typeof(v347.action_type) == "number" then v347.action_type else v2.ActionType.toNumber(v347.action_type);
    end;
    if v347.action_params ~= nil then
        v348.actionParams = v347.action_params:jsonEncode();
    end;
    return v348;
end;
v7.jsonDecode = function(v349) --[[ Line: 3875 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_14 (copy), v2 (copy)
    local v350 = l_v7_14.new();
    if v349.action_type ~= nil then
        v350.action_type = if typeof(v349.action_type) == "number" then v2.ActionType.fromNumber(v349.action_type) or v349.action_type else v2.ActionType.fromName(v349.action_type) or v349.action_type;
    end;
    if v349.actionType ~= nil then
        v350.action_type = if typeof(v349.actionType) == "number" then v2.ActionType.fromNumber(v349.actionType) or v349.actionType else v2.ActionType.fromName(v349.actionType) or v349.actionType;
    end;
    if v349.action_params ~= nil then
        v350.action_params = v2.PlayButtonClickAction_Params.jsonDecode(v349.action_params);
    end;
    if v349.actionParams ~= nil then
        v350.action_params = v2.PlayButtonClickAction_Params.jsonDecode(v349.actionParams);
    end;
    return v350;
end;
v7.descriptor = {
    name = "PlayButtonClickAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.PlayButtonClickAction"
};
v2.PlayButtonClickAction = v7;
v1.default:register(v2.PlayButtonClickAction);
v7 = {};
v7.__index = v7;
local l_v7_15 = v7 --[[ copy: 7 -> 23 ]];
v7.new = function(_) --[[ Line: 3915 ]] --[[ Name: new ]]
    -- upvalues: l_v7_15 (copy)
    return (setmetatable({}, l_v7_15));
end;
v7.encode = function(_) --[[ Line: 3921 ]] --[[ Name: encode ]]
    local v354 = buffer.create(0);
    local v355 = buffer.create(0);
    buffer.copy(v355, 0, v354, 0, 0);
    return v355;
end;
v7.decode = function(v356) --[[ Line: 3930 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_15 (copy), v0 (copy)
    local v357 = l_v7_15.new();
    local v358 = 0;
    while v358 < buffer.len(v356) do
        local v359 = nil;
        local v360 = nil;
        local v361, v362, v363 = v0.readTag(v356, v358);
        v359 = v361;
        v360 = v362;
        v358 = v363;
        if v360 == v0.wireTypes.varint then
            v361 = nil;
            v362, v363 = v0.readVarInt(v356, v358);
            v361 = v362;
            v358 = v363;
        elseif v360 == v0.wireTypes.lengthDelimited then
            v361 = nil;
            v362, v363 = v0.readVarInt(v356, v358);
            v358 = v363 + v362;
        elseif v360 == v0.wireTypes.i32 then
            v361 = nil;
            v362, v363 = v0.readFixed32(v356, v358);
            v361 = v362;
            v358 = v363;
        elseif v360 == v0.wireTypes.i64 then
            v361 = nil;
            v362, v363 = v0.readFixed64(v356, v358);
            v361 = v362;
            v358 = v363;
        else
            error("Unsupported wire type: " .. v360);
        end;
    end;
    return v357;
end;
v7.jsonEncode = function(_) --[[ Line: 3968 ]] --[[ Name: jsonEncode ]]
    return {};
end;
v7.jsonDecode = function(_) --[[ Line: 3974 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_15 (copy)
    return (l_v7_15.new());
end;
v7.descriptor = {
    name = "PlayButtonClickAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.PlayButtonClickAction_Params = v7;
v1.default:register(v2.PlayButtonClickAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_16 = v7 --[[ copy: 7 -> 24 ]];
v7.new = function(v367) --[[ Line: 3994 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_16 (copy)
    return (setmetatable({
        action_type = if not (v367 ~= nil) or v367.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v367.action_type, 
        action_params = if not (v367 ~= nil) or v367.action_params == nil then nil else v367.action_params
    }, l_v7_16));
end;
v7.encode = function(v368) --[[ Line: 4003 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v369 = buffer.create(0);
    local v370 = 0;
    if v368.action_type ~= nil and (v368.action_type ~= nil and v368.action_type ~= 0 or v368.action_type ~= v2.ActionType.fromNumber(0)) then
        local v371, v372 = v0.writeTag(v369, v370, 1, v0.wireTypes.varint);
        v371, v372 = v0.writeVarInt(v371, v372, v2.ActionType.toNumber(v368.action_type));
        v369 = v371;
        v370 = v372;
    end;
    if v368.action_params ~= nil then
        local v373 = v368.action_params:encode();
        local v374, v375 = v0.writeTag(v369, v370, 2, v0.wireTypes.lengthDelimited);
        v374, v375 = v0.writeBuffer(v374, v375, v373, buffer.len(v373));
        v369 = v374;
        v370 = v375;
    end;
    local v376 = buffer.create(v370);
    buffer.copy(v376, 0, v369, 0, v370);
    return v376;
end;
v7.decode = function(v377) --[[ Line: 4029 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_16 (copy), v0 (copy), v2 (copy)
    local v378 = l_v7_16.new();
    local v379 = 0;
    while v379 < buffer.len(v377) do
        local v380 = nil;
        local v381 = nil;
        local v382, v383, v384 = v0.readTag(v377, v379);
        v380 = v382;
        v381 = v383;
        v379 = v384;
        if v381 == v0.wireTypes.varint then
            if v380 == 1 then
                v382 = nil;
                v383, v384 = v0.readVarIntI32(v377, v379);
                v382 = v383;
                v379 = v384;
                v378.action_type = v2.ActionType.fromNumber(v382) or v382;
            else
                v382 = nil;
                v383, v384 = v0.readVarInt(v377, v379);
                v382 = v383;
                v379 = v384;
            end;
        elseif v381 == v0.wireTypes.lengthDelimited then
            if v380 == 2 then
                v382 = nil;
                v383, v384 = v0.readBuffer(v377, v379);
                v382 = v383;
                v379 = v384;
                v378.action_params = v2.UpdateUserSettingsAction_Params.decode(v382);
            else
                v382 = nil;
                v383, v384 = v0.readVarInt(v377, v379);
                v379 = v384 + v383;
            end;
        elseif v381 == v0.wireTypes.i32 then
            v382 = nil;
            v383, v384 = v0.readFixed32(v377, v379);
            v382 = v383;
            v379 = v384;
        elseif v381 == v0.wireTypes.i64 then
            v382 = nil;
            v383, v384 = v0.readFixed64(v377, v379);
            v382 = v383;
            v379 = v384;
        else
            error("Unsupported wire type: " .. v381);
        end;
    end;
    return v378;
end;
v7.jsonEncode = function(v385) --[[ Line: 4077 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v386 = {};
    if v385.action_type ~= nil and (v385.action_type ~= nil and v385.action_type ~= 0 or v385.action_type ~= v2.ActionType.fromNumber(0)) then
        v386.actionType = if typeof(v385.action_type) == "number" then v385.action_type else v2.ActionType.toNumber(v385.action_type);
    end;
    if v385.action_params ~= nil then
        v386.actionParams = v385.action_params:jsonEncode();
    end;
    return v386;
end;
v7.jsonDecode = function(v387) --[[ Line: 4099 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_16 (copy), v2 (copy)
    local v388 = l_v7_16.new();
    if v387.action_type ~= nil then
        v388.action_type = if typeof(v387.action_type) == "number" then v2.ActionType.fromNumber(v387.action_type) or v387.action_type else v2.ActionType.fromName(v387.action_type) or v387.action_type;
    end;
    if v387.actionType ~= nil then
        v388.action_type = if typeof(v387.actionType) == "number" then v2.ActionType.fromNumber(v387.actionType) or v387.actionType else v2.ActionType.fromName(v387.actionType) or v387.actionType;
    end;
    if v387.action_params ~= nil then
        v388.action_params = v2.UpdateUserSettingsAction_Params.jsonDecode(v387.action_params);
    end;
    if v387.actionParams ~= nil then
        v388.action_params = v2.UpdateUserSettingsAction_Params.jsonDecode(v387.actionParams);
    end;
    return v388;
end;
v7.descriptor = {
    name = "UpdateUserSettingsAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UpdateUserSettingsAction"
};
v2.UpdateUserSettingsAction = v7;
v1.default:register(v2.UpdateUserSettingsAction);
v7 = {};
v7.__index = v7;
local l_v7_17 = v7 --[[ copy: 7 -> 25 ]];
v7.new = function(v390) --[[ Line: 4139 ]] --[[ Name: new ]]
    -- upvalues: l_v7_17 (copy)
    return (setmetatable({
        settings = if not (v390 ~= nil) or v390.settings == nil then nil else v390.settings, 
        audit_data = if not (v390 ~= nil) or v390.audit_data == nil then nil else v390.audit_data
    }, l_v7_17));
end;
v7.encode = function(v391) --[[ Line: 4148 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v392 = buffer.create(0);
    local v393 = 0;
    if v391.settings ~= nil then
        local v394 = v391.settings:encode();
        local v395, v396 = v0.writeTag(v392, v393, 1, v0.wireTypes.lengthDelimited);
        v395, v396 = v0.writeBuffer(v395, v396, v394, buffer.len(v394));
        v392 = v395;
        v393 = v396;
    end;
    if v391.audit_data ~= nil then
        local v397 = v391.audit_data:encode();
        local v398, v399 = v0.writeTag(v392, v393, 2, v0.wireTypes.lengthDelimited);
        v398, v399 = v0.writeBuffer(v398, v399, v397, buffer.len(v397));
        v392 = v398;
        v393 = v399;
    end;
    local v400 = buffer.create(v393);
    buffer.copy(v400, 0, v392, 0, v393);
    return v400;
end;
v7.decode = function(v401) --[[ Line: 4169 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_17 (copy), v0 (copy), v5 (copy)
    local v402 = l_v7_17.new();
    local v403 = 0;
    while v403 < buffer.len(v401) do
        local v404 = nil;
        local v405 = nil;
        local v406, v407, v408 = v0.readTag(v401, v403);
        v404 = v406;
        v405 = v407;
        v403 = v408;
        if v405 == v0.wireTypes.varint then
            v406 = nil;
            v407, v408 = v0.readVarInt(v401, v403);
            v406 = v407;
            v403 = v408;
        elseif v405 == v0.wireTypes.lengthDelimited then
            if v404 == 1 then
                v406 = nil;
                v407, v408 = v0.readBuffer(v401, v403);
                v406 = v407;
                v403 = v408;
                v402.settings = v5.StructProp.decode(v406);
            elseif v404 == 2 then
                v406 = nil;
                v407, v408 = v0.readBuffer(v401, v403);
                v406 = v407;
                v403 = v408;
                v402.audit_data = v5.StringProp.decode(v406);
            else
                v406 = nil;
                v407, v408 = v0.readVarInt(v401, v403);
                v403 = v408 + v407;
            end;
        elseif v405 == v0.wireTypes.i32 then
            v406 = nil;
            v407, v408 = v0.readFixed32(v401, v403);
            v406 = v407;
            v403 = v408;
        elseif v405 == v0.wireTypes.i64 then
            v406 = nil;
            v407, v408 = v0.readFixed64(v401, v403);
            v406 = v407;
            v403 = v408;
        else
            error("Unsupported wire type: " .. v405);
        end;
    end;
    return v402;
end;
v7.jsonEncode = function(v409) --[[ Line: 4217 ]] --[[ Name: jsonEncode ]]
    local v410 = {};
    if v409.settings ~= nil then
        v410.settings = v409.settings:jsonEncode();
    end;
    if v409.audit_data ~= nil then
        v410.auditData = v409.audit_data:jsonEncode();
    end;
    return v410;
end;
v7.jsonDecode = function(v411) --[[ Line: 4231 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_17 (copy), v5 (copy)
    local v412 = l_v7_17.new();
    if v411.settings ~= nil then
        v412.settings = v5.StructProp.jsonDecode(v411.settings);
    end;
    if v411.audit_data ~= nil then
        v412.audit_data = v5.StringProp.jsonDecode(v411.audit_data);
    end;
    if v411.auditData ~= nil then
        v412.audit_data = v5.StringProp.jsonDecode(v411.auditData);
    end;
    return v412;
end;
v7.descriptor = {
    name = "UpdateUserSettingsAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.UpdateUserSettingsAction_Params = v7;
v1.default:register(v2.UpdateUserSettingsAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_18 = v7 --[[ copy: 7 -> 26 ]];
v7.new = function(v414) --[[ Line: 4263 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_18 (copy)
    return (setmetatable({
        action_type = if not (v414 ~= nil) or v414.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v414.action_type, 
        action_params = if not (v414 ~= nil) or v414.action_params == nil then nil else v414.action_params
    }, l_v7_18));
end;
v7.encode = function(v415) --[[ Line: 4272 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v416 = buffer.create(0);
    local v417 = 0;
    if v415.action_type ~= nil and (v415.action_type ~= nil and v415.action_type ~= 0 or v415.action_type ~= v2.ActionType.fromNumber(0)) then
        local v418, v419 = v0.writeTag(v416, v417, 1, v0.wireTypes.varint);
        v418, v419 = v0.writeVarInt(v418, v419, v2.ActionType.toNumber(v415.action_type));
        v416 = v418;
        v417 = v419;
    end;
    if v415.action_params ~= nil then
        local v420 = v415.action_params:encode();
        local v421, v422 = v0.writeTag(v416, v417, 2, v0.wireTypes.lengthDelimited);
        v421, v422 = v0.writeBuffer(v421, v422, v420, buffer.len(v420));
        v416 = v421;
        v417 = v422;
    end;
    local v423 = buffer.create(v417);
    buffer.copy(v423, 0, v416, 0, v417);
    return v423;
end;
v7.decode = function(v424) --[[ Line: 4298 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_18 (copy), v0 (copy), v2 (copy)
    local v425 = l_v7_18.new();
    local v426 = 0;
    while v426 < buffer.len(v424) do
        local v427 = nil;
        local v428 = nil;
        local v429, v430, v431 = v0.readTag(v424, v426);
        v427 = v429;
        v428 = v430;
        v426 = v431;
        if v428 == v0.wireTypes.varint then
            if v427 == 1 then
                v429 = nil;
                v430, v431 = v0.readVarIntI32(v424, v426);
                v429 = v430;
                v426 = v431;
                v425.action_type = v2.ActionType.fromNumber(v429) or v429;
            else
                v429 = nil;
                v430, v431 = v0.readVarInt(v424, v426);
                v429 = v430;
                v426 = v431;
            end;
        elseif v428 == v0.wireTypes.lengthDelimited then
            if v427 == 2 then
                v429 = nil;
                v430, v431 = v0.readBuffer(v424, v426);
                v429 = v430;
                v426 = v431;
                v425.action_params = v2.OpenTooltipAction_Params.decode(v429);
            else
                v429 = nil;
                v430, v431 = v0.readVarInt(v424, v426);
                v426 = v431 + v430;
            end;
        elseif v428 == v0.wireTypes.i32 then
            v429 = nil;
            v430, v431 = v0.readFixed32(v424, v426);
            v429 = v430;
            v426 = v431;
        elseif v428 == v0.wireTypes.i64 then
            v429 = nil;
            v430, v431 = v0.readFixed64(v424, v426);
            v429 = v430;
            v426 = v431;
        else
            error("Unsupported wire type: " .. v428);
        end;
    end;
    return v425;
end;
v7.jsonEncode = function(v432) --[[ Line: 4346 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v433 = {};
    if v432.action_type ~= nil and (v432.action_type ~= nil and v432.action_type ~= 0 or v432.action_type ~= v2.ActionType.fromNumber(0)) then
        v433.actionType = if typeof(v432.action_type) == "number" then v432.action_type else v2.ActionType.toNumber(v432.action_type);
    end;
    if v432.action_params ~= nil then
        v433.actionParams = v432.action_params:jsonEncode();
    end;
    return v433;
end;
v7.jsonDecode = function(v434) --[[ Line: 4368 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_18 (copy), v2 (copy)
    local v435 = l_v7_18.new();
    if v434.action_type ~= nil then
        v435.action_type = if typeof(v434.action_type) == "number" then v2.ActionType.fromNumber(v434.action_type) or v434.action_type else v2.ActionType.fromName(v434.action_type) or v434.action_type;
    end;
    if v434.actionType ~= nil then
        v435.action_type = if typeof(v434.actionType) == "number" then v2.ActionType.fromNumber(v434.actionType) or v434.actionType else v2.ActionType.fromName(v434.actionType) or v434.actionType;
    end;
    if v434.action_params ~= nil then
        v435.action_params = v2.OpenTooltipAction_Params.jsonDecode(v434.action_params);
    end;
    if v434.actionParams ~= nil then
        v435.action_params = v2.OpenTooltipAction_Params.jsonDecode(v434.actionParams);
    end;
    return v435;
end;
v7.descriptor = {
    name = "OpenTooltipAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenTooltipAction"
};
v2.OpenTooltipAction = v7;
v1.default:register(v2.OpenTooltipAction);
v7 = {};
v7.__index = v7;
local l_v7_19 = v7 --[[ copy: 7 -> 27 ]];
v7.new = function(v437) --[[ Line: 4408 ]] --[[ Name: new ]]
    -- upvalues: l_v7_19 (copy)
    return (setmetatable({
        tooltip_title = if not (v437 ~= nil) or v437.tooltip_title == nil then nil else v437.tooltip_title, 
        tooltip_info_text = if not (v437 ~= nil) or v437.tooltip_info_text == nil then nil else v437.tooltip_info_text
    }, l_v7_19));
end;
v7.encode = function(v438) --[[ Line: 4415 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v439 = buffer.create(0);
    local v440 = 0;
    if v438.tooltip_title ~= nil then
        local v441 = v438.tooltip_title:encode();
        local v442, v443 = v0.writeTag(v439, v440, 1, v0.wireTypes.lengthDelimited);
        v442, v443 = v0.writeBuffer(v442, v443, v441, buffer.len(v441));
        v439 = v442;
        v440 = v443;
    end;
    if v438.tooltip_info_text ~= nil then
        local v444 = v438.tooltip_info_text:encode();
        local v445, v446 = v0.writeTag(v439, v440, 2, v0.wireTypes.lengthDelimited);
        v445, v446 = v0.writeBuffer(v445, v446, v444, buffer.len(v444));
        v439 = v445;
        v440 = v446;
    end;
    local v447 = buffer.create(v440);
    buffer.copy(v447, 0, v439, 0, v440);
    return v447;
end;
v7.decode = function(v448) --[[ Line: 4436 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_19 (copy), v0 (copy), v5 (copy)
    local v449 = l_v7_19.new();
    local v450 = 0;
    while v450 < buffer.len(v448) do
        local v451 = nil;
        local v452 = nil;
        local v453, v454, v455 = v0.readTag(v448, v450);
        v451 = v453;
        v452 = v454;
        v450 = v455;
        if v452 == v0.wireTypes.varint then
            v453 = nil;
            v454, v455 = v0.readVarInt(v448, v450);
            v453 = v454;
            v450 = v455;
        elseif v452 == v0.wireTypes.lengthDelimited then
            if v451 == 1 then
                v453 = nil;
                v454, v455 = v0.readBuffer(v448, v450);
                v453 = v454;
                v450 = v455;
                v449.tooltip_title = v5.StringProp.decode(v453);
            elseif v451 == 2 then
                v453 = nil;
                v454, v455 = v0.readBuffer(v448, v450);
                v453 = v454;
                v450 = v455;
                v449.tooltip_info_text = v5.StringProp.decode(v453);
            else
                v453 = nil;
                v454, v455 = v0.readVarInt(v448, v450);
                v450 = v455 + v454;
            end;
        elseif v452 == v0.wireTypes.i32 then
            v453 = nil;
            v454, v455 = v0.readFixed32(v448, v450);
            v453 = v454;
            v450 = v455;
        elseif v452 == v0.wireTypes.i64 then
            v453 = nil;
            v454, v455 = v0.readFixed64(v448, v450);
            v453 = v454;
            v450 = v455;
        else
            error("Unsupported wire type: " .. v452);
        end;
    end;
    return v449;
end;
v7.jsonEncode = function(v456) --[[ Line: 4484 ]] --[[ Name: jsonEncode ]]
    local v457 = {};
    if v456.tooltip_title ~= nil then
        v457.tooltipTitle = v456.tooltip_title:jsonEncode();
    end;
    if v456.tooltip_info_text ~= nil then
        v457.tooltipInfoText = v456.tooltip_info_text:jsonEncode();
    end;
    return v457;
end;
v7.jsonDecode = function(v458) --[[ Line: 4498 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_19 (copy), v5 (copy)
    local v459 = l_v7_19.new();
    if v458.tooltip_title ~= nil then
        v459.tooltip_title = v5.StringProp.jsonDecode(v458.tooltip_title);
    end;
    if v458.tooltipTitle ~= nil then
        v459.tooltip_title = v5.StringProp.jsonDecode(v458.tooltipTitle);
    end;
    if v458.tooltip_info_text ~= nil then
        v459.tooltip_info_text = v5.StringProp.jsonDecode(v458.tooltip_info_text);
    end;
    if v458.tooltipInfoText ~= nil then
        v459.tooltip_info_text = v5.StringProp.jsonDecode(v458.tooltipInfoText);
    end;
    return v459;
end;
v7.descriptor = {
    name = "OpenTooltipAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenTooltipAction_Params = v7;
v1.default:register(v2.OpenTooltipAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_20 = v7 --[[ copy: 7 -> 28 ]];
v7.new = function(v461) --[[ Line: 4538 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_20 (copy)
    return (setmetatable({
        action_type = if not (v461 ~= nil) or v461.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v461.action_type, 
        action_params = if not (v461 ~= nil) or v461.action_params == nil then nil else v461.action_params
    }, l_v7_20));
end;
v7.encode = function(v462) --[[ Line: 4547 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v463 = buffer.create(0);
    local v464 = 0;
    if v462.action_type ~= nil and (v462.action_type ~= nil and v462.action_type ~= 0 or v462.action_type ~= v2.ActionType.fromNumber(0)) then
        local v465, v466 = v0.writeTag(v463, v464, 1, v0.wireTypes.varint);
        v465, v466 = v0.writeVarInt(v465, v466, v2.ActionType.toNumber(v462.action_type));
        v463 = v465;
        v464 = v466;
    end;
    if v462.action_params ~= nil then
        local v467 = v462.action_params:encode();
        local v468, v469 = v0.writeTag(v463, v464, 2, v0.wireTypes.lengthDelimited);
        v468, v469 = v0.writeBuffer(v468, v469, v467, buffer.len(v467));
        v463 = v468;
        v464 = v469;
    end;
    local v470 = buffer.create(v464);
    buffer.copy(v470, 0, v463, 0, v464);
    return v470;
end;
v7.decode = function(v471) --[[ Line: 4573 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_20 (copy), v0 (copy), v2 (copy)
    local v472 = l_v7_20.new();
    local v473 = 0;
    while v473 < buffer.len(v471) do
        local v474 = nil;
        local v475 = nil;
        local v476, v477, v478 = v0.readTag(v471, v473);
        v474 = v476;
        v475 = v477;
        v473 = v478;
        if v475 == v0.wireTypes.varint then
            if v474 == 1 then
                v476 = nil;
                v477, v478 = v0.readVarIntI32(v471, v473);
                v476 = v477;
                v473 = v478;
                v472.action_type = v2.ActionType.fromNumber(v476) or v476;
            else
                v476 = nil;
                v477, v478 = v0.readVarInt(v471, v473);
                v476 = v477;
                v473 = v478;
            end;
        elseif v475 == v0.wireTypes.lengthDelimited then
            if v474 == 2 then
                v476 = nil;
                v477, v478 = v0.readBuffer(v471, v473);
                v476 = v477;
                v473 = v478;
                v472.action_params = v2.OpenBadgeDetailsAction_Params.decode(v476);
            else
                v476 = nil;
                v477, v478 = v0.readVarInt(v471, v473);
                v473 = v478 + v477;
            end;
        elseif v475 == v0.wireTypes.i32 then
            v476 = nil;
            v477, v478 = v0.readFixed32(v471, v473);
            v476 = v477;
            v473 = v478;
        elseif v475 == v0.wireTypes.i64 then
            v476 = nil;
            v477, v478 = v0.readFixed64(v471, v473);
            v476 = v477;
            v473 = v478;
        else
            error("Unsupported wire type: " .. v475);
        end;
    end;
    return v472;
end;
v7.jsonEncode = function(v479) --[[ Line: 4621 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v480 = {};
    if v479.action_type ~= nil and (v479.action_type ~= nil and v479.action_type ~= 0 or v479.action_type ~= v2.ActionType.fromNumber(0)) then
        v480.actionType = if typeof(v479.action_type) == "number" then v479.action_type else v2.ActionType.toNumber(v479.action_type);
    end;
    if v479.action_params ~= nil then
        v480.actionParams = v479.action_params:jsonEncode();
    end;
    return v480;
end;
v7.jsonDecode = function(v481) --[[ Line: 4643 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_20 (copy), v2 (copy)
    local v482 = l_v7_20.new();
    if v481.action_type ~= nil then
        v482.action_type = if typeof(v481.action_type) == "number" then v2.ActionType.fromNumber(v481.action_type) or v481.action_type else v2.ActionType.fromName(v481.action_type) or v481.action_type;
    end;
    if v481.actionType ~= nil then
        v482.action_type = if typeof(v481.actionType) == "number" then v2.ActionType.fromNumber(v481.actionType) or v481.actionType else v2.ActionType.fromName(v481.actionType) or v481.actionType;
    end;
    if v481.action_params ~= nil then
        v482.action_params = v2.OpenBadgeDetailsAction_Params.jsonDecode(v481.action_params);
    end;
    if v481.actionParams ~= nil then
        v482.action_params = v2.OpenBadgeDetailsAction_Params.jsonDecode(v481.actionParams);
    end;
    return v482;
end;
v7.descriptor = {
    name = "OpenBadgeDetailsAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenBadgeDetailsAction"
};
v2.OpenBadgeDetailsAction = v7;
v1.default:register(v2.OpenBadgeDetailsAction);
v7 = {};
v7.__index = v7;
local l_v7_21 = v7 --[[ copy: 7 -> 29 ]];
v7.new = function(v484) --[[ Line: 4683 ]] --[[ Name: new ]]
    -- upvalues: l_v7_21 (copy)
    return (setmetatable({
        badge_id = if not (v484 ~= nil) or v484.badge_id == nil then nil else v484.badge_id, 
        title_text = if not (v484 ~= nil) or v484.title_text == nil then nil else v484.title_text
    }, l_v7_21));
end;
v7.encode = function(v485) --[[ Line: 4692 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v486 = buffer.create(0);
    local v487 = 0;
    if v485.badge_id ~= nil then
        local v488 = v485.badge_id:encode();
        local v489, v490 = v0.writeTag(v486, v487, 1, v0.wireTypes.lengthDelimited);
        v489, v490 = v0.writeBuffer(v489, v490, v488, buffer.len(v488));
        v486 = v489;
        v487 = v490;
    end;
    if v485.title_text ~= nil then
        local v491 = v485.title_text:encode();
        local v492, v493 = v0.writeTag(v486, v487, 2, v0.wireTypes.lengthDelimited);
        v492, v493 = v0.writeBuffer(v492, v493, v491, buffer.len(v491));
        v486 = v492;
        v487 = v493;
    end;
    local v494 = buffer.create(v487);
    buffer.copy(v494, 0, v486, 0, v487);
    return v494;
end;
v7.decode = function(v495) --[[ Line: 4713 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_21 (copy), v0 (copy), v5 (copy)
    local v496 = l_v7_21.new();
    local v497 = 0;
    while v497 < buffer.len(v495) do
        local v498 = nil;
        local v499 = nil;
        local v500, v501, v502 = v0.readTag(v495, v497);
        v498 = v500;
        v499 = v501;
        v497 = v502;
        if v499 == v0.wireTypes.varint then
            v500 = nil;
            v501, v502 = v0.readVarInt(v495, v497);
            v500 = v501;
            v497 = v502;
        elseif v499 == v0.wireTypes.lengthDelimited then
            if v498 == 1 then
                v500 = nil;
                v501, v502 = v0.readBuffer(v495, v497);
                v500 = v501;
                v497 = v502;
                v496.badge_id = v5.StringProp.decode(v500);
            elseif v498 == 2 then
                v500 = nil;
                v501, v502 = v0.readBuffer(v495, v497);
                v500 = v501;
                v497 = v502;
                v496.title_text = v5.StringProp.decode(v500);
            else
                v500 = nil;
                v501, v502 = v0.readVarInt(v495, v497);
                v497 = v502 + v501;
            end;
        elseif v499 == v0.wireTypes.i32 then
            v500 = nil;
            v501, v502 = v0.readFixed32(v495, v497);
            v500 = v501;
            v497 = v502;
        elseif v499 == v0.wireTypes.i64 then
            v500 = nil;
            v501, v502 = v0.readFixed64(v495, v497);
            v500 = v501;
            v497 = v502;
        else
            error("Unsupported wire type: " .. v499);
        end;
    end;
    return v496;
end;
v7.jsonEncode = function(v503) --[[ Line: 4761 ]] --[[ Name: jsonEncode ]]
    local v504 = {};
    if v503.badge_id ~= nil then
        v504.badgeId = v503.badge_id:jsonEncode();
    end;
    if v503.title_text ~= nil then
        v504.titleText = v503.title_text:jsonEncode();
    end;
    return v504;
end;
v7.jsonDecode = function(v505) --[[ Line: 4775 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_21 (copy), v5 (copy)
    local v506 = l_v7_21.new();
    if v505.badge_id ~= nil then
        v506.badge_id = v5.StringProp.jsonDecode(v505.badge_id);
    end;
    if v505.badgeId ~= nil then
        v506.badge_id = v5.StringProp.jsonDecode(v505.badgeId);
    end;
    if v505.title_text ~= nil then
        v506.title_text = v5.StringProp.jsonDecode(v505.title_text);
    end;
    if v505.titleText ~= nil then
        v506.title_text = v5.StringProp.jsonDecode(v505.titleText);
    end;
    return v506;
end;
v7.descriptor = {
    name = "OpenBadgeDetailsAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenBadgeDetailsAction_Params = v7;
v1.default:register(v2.OpenBadgeDetailsAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_22 = v7 --[[ copy: 7 -> 30 ]];
v7.new = function(v508) --[[ Line: 4811 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_22 (copy)
    return (setmetatable({
        action_type = if not (v508 ~= nil) or v508.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v508.action_type, 
        action_params = if not (v508 ~= nil) or v508.action_params == nil then nil else v508.action_params
    }, l_v7_22));
end;
v7.encode = function(v509) --[[ Line: 4820 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v510 = buffer.create(0);
    local v511 = 0;
    if v509.action_type ~= nil and (v509.action_type ~= nil and v509.action_type ~= 0 or v509.action_type ~= v2.ActionType.fromNumber(0)) then
        local v512, v513 = v0.writeTag(v510, v511, 1, v0.wireTypes.varint);
        v512, v513 = v0.writeVarInt(v512, v513, v2.ActionType.toNumber(v509.action_type));
        v510 = v512;
        v511 = v513;
    end;
    if v509.action_params ~= nil then
        local v514 = v509.action_params:encode();
        local v515, v516 = v0.writeTag(v510, v511, 2, v0.wireTypes.lengthDelimited);
        v515, v516 = v0.writeBuffer(v515, v516, v514, buffer.len(v514));
        v510 = v515;
        v511 = v516;
    end;
    local v517 = buffer.create(v511);
    buffer.copy(v517, 0, v510, 0, v511);
    return v517;
end;
v7.decode = function(v518) --[[ Line: 4846 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_22 (copy), v0 (copy), v2 (copy)
    local v519 = l_v7_22.new();
    local v520 = 0;
    while v520 < buffer.len(v518) do
        local v521 = nil;
        local v522 = nil;
        local v523, v524, v525 = v0.readTag(v518, v520);
        v521 = v523;
        v522 = v524;
        v520 = v525;
        if v522 == v0.wireTypes.varint then
            if v521 == 1 then
                v523 = nil;
                v524, v525 = v0.readVarIntI32(v518, v520);
                v523 = v524;
                v520 = v525;
                v519.action_type = v2.ActionType.fromNumber(v523) or v523;
            else
                v523 = nil;
                v524, v525 = v0.readVarInt(v518, v520);
                v523 = v524;
                v520 = v525;
            end;
        elseif v522 == v0.wireTypes.lengthDelimited then
            if v521 == 2 then
                v523 = nil;
                v524, v525 = v0.readBuffer(v518, v520);
                v523 = v524;
                v520 = v525;
                v519.action_params = v2.LoadMoreFromApiAction_Params.decode(v523);
            else
                v523 = nil;
                v524, v525 = v0.readVarInt(v518, v520);
                v520 = v525 + v524;
            end;
        elseif v522 == v0.wireTypes.i32 then
            v523 = nil;
            v524, v525 = v0.readFixed32(v518, v520);
            v523 = v524;
            v520 = v525;
        elseif v522 == v0.wireTypes.i64 then
            v523 = nil;
            v524, v525 = v0.readFixed64(v518, v520);
            v523 = v524;
            v520 = v525;
        else
            error("Unsupported wire type: " .. v522);
        end;
    end;
    return v519;
end;
v7.jsonEncode = function(v526) --[[ Line: 4894 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v527 = {};
    if v526.action_type ~= nil and (v526.action_type ~= nil and v526.action_type ~= 0 or v526.action_type ~= v2.ActionType.fromNumber(0)) then
        v527.actionType = if typeof(v526.action_type) == "number" then v526.action_type else v2.ActionType.toNumber(v526.action_type);
    end;
    if v526.action_params ~= nil then
        v527.actionParams = v526.action_params:jsonEncode();
    end;
    return v527;
end;
v7.jsonDecode = function(v528) --[[ Line: 4916 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_22 (copy), v2 (copy)
    local v529 = l_v7_22.new();
    if v528.action_type ~= nil then
        v529.action_type = if typeof(v528.action_type) == "number" then v2.ActionType.fromNumber(v528.action_type) or v528.action_type else v2.ActionType.fromName(v528.action_type) or v528.action_type;
    end;
    if v528.actionType ~= nil then
        v529.action_type = if typeof(v528.actionType) == "number" then v2.ActionType.fromNumber(v528.actionType) or v528.actionType else v2.ActionType.fromName(v528.actionType) or v528.actionType;
    end;
    if v528.action_params ~= nil then
        v529.action_params = v2.LoadMoreFromApiAction_Params.jsonDecode(v528.action_params);
    end;
    if v528.actionParams ~= nil then
        v529.action_params = v2.LoadMoreFromApiAction_Params.jsonDecode(v528.actionParams);
    end;
    return v529;
end;
v7.descriptor = {
    name = "LoadMoreFromApiAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.LoadMoreFromApiAction"
};
v2.LoadMoreFromApiAction = v7;
v1.default:register(v2.LoadMoreFromApiAction);
v7 = {};
v7.__index = v7;
local l_v7_23 = v7 --[[ copy: 7 -> 31 ]];
v7.new = function(v531) --[[ Line: 4956 ]] --[[ Name: new ]]
    -- upvalues: l_v7_23 (copy)
    return (setmetatable({
        surface_key = if not (v531 ~= nil) or v531.surface_key == nil then nil else v531.surface_key, 
        config_key = if not (v531 ~= nil) or v531.config_key == nil then nil else v531.config_key
    }, l_v7_23));
end;
v7.encode = function(v532) --[[ Line: 4965 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v533 = buffer.create(0);
    local v534 = 0;
    if v532.surface_key ~= nil then
        local v535 = v532.surface_key:encode();
        local v536, v537 = v0.writeTag(v533, v534, 1, v0.wireTypes.lengthDelimited);
        v536, v537 = v0.writeBuffer(v536, v537, v535, buffer.len(v535));
        v533 = v536;
        v534 = v537;
    end;
    if v532.config_key ~= nil then
        local v538 = v532.config_key:encode();
        local v539, v540 = v0.writeTag(v533, v534, 2, v0.wireTypes.lengthDelimited);
        v539, v540 = v0.writeBuffer(v539, v540, v538, buffer.len(v538));
        v533 = v539;
        v534 = v540;
    end;
    local v541 = buffer.create(v534);
    buffer.copy(v541, 0, v533, 0, v534);
    return v541;
end;
v7.decode = function(v542) --[[ Line: 4986 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_23 (copy), v0 (copy), v5 (copy)
    local v543 = l_v7_23.new();
    local v544 = 0;
    while v544 < buffer.len(v542) do
        local v545 = nil;
        local v546 = nil;
        local v547, v548, v549 = v0.readTag(v542, v544);
        v545 = v547;
        v546 = v548;
        v544 = v549;
        if v546 == v0.wireTypes.varint then
            v547 = nil;
            v548, v549 = v0.readVarInt(v542, v544);
            v547 = v548;
            v544 = v549;
        elseif v546 == v0.wireTypes.lengthDelimited then
            if v545 == 1 then
                v547 = nil;
                v548, v549 = v0.readBuffer(v542, v544);
                v547 = v548;
                v544 = v549;
                v543.surface_key = v5.StringProp.decode(v547);
            elseif v545 == 2 then
                v547 = nil;
                v548, v549 = v0.readBuffer(v542, v544);
                v547 = v548;
                v544 = v549;
                v543.config_key = v5.StringProp.decode(v547);
            else
                v547 = nil;
                v548, v549 = v0.readVarInt(v542, v544);
                v544 = v549 + v548;
            end;
        elseif v546 == v0.wireTypes.i32 then
            v547 = nil;
            v548, v549 = v0.readFixed32(v542, v544);
            v547 = v548;
            v544 = v549;
        elseif v546 == v0.wireTypes.i64 then
            v547 = nil;
            v548, v549 = v0.readFixed64(v542, v544);
            v547 = v548;
            v544 = v549;
        else
            error("Unsupported wire type: " .. v546);
        end;
    end;
    return v543;
end;
v7.jsonEncode = function(v550) --[[ Line: 5034 ]] --[[ Name: jsonEncode ]]
    local v551 = {};
    if v550.surface_key ~= nil then
        v551.surfaceKey = v550.surface_key:jsonEncode();
    end;
    if v550.config_key ~= nil then
        v551.configKey = v550.config_key:jsonEncode();
    end;
    return v551;
end;
v7.jsonDecode = function(v552) --[[ Line: 5048 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_23 (copy), v5 (copy)
    local v553 = l_v7_23.new();
    if v552.surface_key ~= nil then
        v553.surface_key = v5.StringProp.jsonDecode(v552.surface_key);
    end;
    if v552.surfaceKey ~= nil then
        v553.surface_key = v5.StringProp.jsonDecode(v552.surfaceKey);
    end;
    if v552.config_key ~= nil then
        v553.config_key = v5.StringProp.jsonDecode(v552.config_key);
    end;
    if v552.configKey ~= nil then
        v553.config_key = v5.StringProp.jsonDecode(v552.configKey);
    end;
    return v553;
end;
v7.descriptor = {
    name = "LoadMoreFromApiAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.LoadMoreFromApiAction_Params = v7;
v1.default:register(v2.LoadMoreFromApiAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_24 = v7 --[[ copy: 7 -> 32 ]];
v7.new = function(v555) --[[ Line: 5085 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_24 (copy)
    return (setmetatable({
        action_type = if not (v555 ~= nil) or v555.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v555.action_type, 
        action_params = if not (v555 ~= nil) or v555.action_params == nil then nil else v555.action_params
    }, l_v7_24));
end;
v7.encode = function(v556) --[[ Line: 5094 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v557 = buffer.create(0);
    local v558 = 0;
    if v556.action_type ~= nil and (v556.action_type ~= nil and v556.action_type ~= 0 or v556.action_type ~= v2.ActionType.fromNumber(0)) then
        local v559, v560 = v0.writeTag(v557, v558, 1, v0.wireTypes.varint);
        v559, v560 = v0.writeVarInt(v559, v560, v2.ActionType.toNumber(v556.action_type));
        v557 = v559;
        v558 = v560;
    end;
    if v556.action_params ~= nil then
        local v561 = v556.action_params:encode();
        local v562, v563 = v0.writeTag(v557, v558, 2, v0.wireTypes.lengthDelimited);
        v562, v563 = v0.writeBuffer(v562, v563, v561, buffer.len(v561));
        v557 = v562;
        v558 = v563;
    end;
    local v564 = buffer.create(v558);
    buffer.copy(v564, 0, v557, 0, v558);
    return v564;
end;
v7.decode = function(v565) --[[ Line: 5120 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_24 (copy), v0 (copy), v2 (copy)
    local v566 = l_v7_24.new();
    local v567 = 0;
    while v567 < buffer.len(v565) do
        local v568 = nil;
        local v569 = nil;
        local v570, v571, v572 = v0.readTag(v565, v567);
        v568 = v570;
        v569 = v571;
        v567 = v572;
        if v569 == v0.wireTypes.varint then
            if v568 == 1 then
                v570 = nil;
                v571, v572 = v0.readVarIntI32(v565, v567);
                v570 = v571;
                v567 = v572;
                v566.action_type = v2.ActionType.fromNumber(v570) or v570;
            else
                v570 = nil;
                v571, v572 = v0.readVarInt(v565, v567);
                v570 = v571;
                v567 = v572;
            end;
        elseif v569 == v0.wireTypes.lengthDelimited then
            if v568 == 2 then
                v570 = nil;
                v571, v572 = v0.readBuffer(v565, v567);
                v570 = v571;
                v567 = v572;
                v566.action_params = v2.ShareAction_Params.decode(v570);
            else
                v570 = nil;
                v571, v572 = v0.readVarInt(v565, v567);
                v567 = v572 + v571;
            end;
        elseif v569 == v0.wireTypes.i32 then
            v570 = nil;
            v571, v572 = v0.readFixed32(v565, v567);
            v570 = v571;
            v567 = v572;
        elseif v569 == v0.wireTypes.i64 then
            v570 = nil;
            v571, v572 = v0.readFixed64(v565, v567);
            v570 = v571;
            v567 = v572;
        else
            error("Unsupported wire type: " .. v569);
        end;
    end;
    return v566;
end;
v7.jsonEncode = function(v573) --[[ Line: 5168 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v574 = {};
    if v573.action_type ~= nil and (v573.action_type ~= nil and v573.action_type ~= 0 or v573.action_type ~= v2.ActionType.fromNumber(0)) then
        v574.actionType = if typeof(v573.action_type) == "number" then v573.action_type else v2.ActionType.toNumber(v573.action_type);
    end;
    if v573.action_params ~= nil then
        v574.actionParams = v573.action_params:jsonEncode();
    end;
    return v574;
end;
v7.jsonDecode = function(v575) --[[ Line: 5190 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_24 (copy), v2 (copy)
    local v576 = l_v7_24.new();
    if v575.action_type ~= nil then
        v576.action_type = if typeof(v575.action_type) == "number" then v2.ActionType.fromNumber(v575.action_type) or v575.action_type else v2.ActionType.fromName(v575.action_type) or v575.action_type;
    end;
    if v575.actionType ~= nil then
        v576.action_type = if typeof(v575.actionType) == "number" then v2.ActionType.fromNumber(v575.actionType) or v575.actionType else v2.ActionType.fromName(v575.actionType) or v575.actionType;
    end;
    if v575.action_params ~= nil then
        v576.action_params = v2.ShareAction_Params.jsonDecode(v575.action_params);
    end;
    if v575.actionParams ~= nil then
        v576.action_params = v2.ShareAction_Params.jsonDecode(v575.actionParams);
    end;
    return v576;
end;
v7.descriptor = {
    name = "ShareAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ShareAction"
};
v2.ShareAction = v7;
v1.default:register(v2.ShareAction);
v7 = {};
v7.__index = v7;
local l_v7_25 = v7 --[[ copy: 7 -> 33 ]];
v7.new = function(v578) --[[ Line: 5230 ]] --[[ Name: new ]]
    -- upvalues: l_v7_25 (copy)
    return (setmetatable({
        oneof_prop = if not (v578 ~= nil) or v578.oneof_prop == nil then nil else v578.oneof_prop
    }, l_v7_25));
end;
v7.encode = function(v579) --[[ Line: 5238 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v580 = buffer.create(0);
    local v581 = 0;
    if v579.oneof_prop ~= nil and v579.oneof_prop.type == "generic_share_link_data" then
        local v582 = v579.oneof_prop.value:encode();
        local v583, v584 = v0.writeTag(v580, v581, 1, v0.wireTypes.lengthDelimited);
        v583, v584 = v0.writeBuffer(v583, v584, v582, buffer.len(v582));
        v580 = v583;
        v581 = v584;
    end;
    local v585 = buffer.create(v581);
    buffer.copy(v585, 0, v580, 0, v581);
    return v585;
end;
v7.decode = function(v586) --[[ Line: 5255 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_25 (copy), v0 (copy), v6 (copy)
    local v587 = l_v7_25.new();
    local v588 = 0;
    while v588 < buffer.len(v586) do
        local v589 = nil;
        local v590 = nil;
        local v591, v592, v593 = v0.readTag(v586, v588);
        v589 = v591;
        v590 = v592;
        v588 = v593;
        if v590 == v0.wireTypes.varint then
            v591 = nil;
            v592, v593 = v0.readVarInt(v586, v588);
            v591 = v592;
            v588 = v593;
        elseif v590 == v0.wireTypes.lengthDelimited then
            if v589 == 1 then
                v591 = nil;
                v592, v593 = v0.readBuffer(v586, v588);
                v591 = v592;
                v588 = v593;
                v587.oneof_prop = {
                    type = "generic_share_link_data", 
                    value = v6.GenericShareLinkData.decode(v591)
                };
            else
                v591 = nil;
                v592, v593 = v0.readVarInt(v586, v588);
                v588 = v593 + v592;
            end;
        elseif v590 == v0.wireTypes.i32 then
            v591 = nil;
            v592, v593 = v0.readFixed32(v586, v588);
            v591 = v592;
            v588 = v593;
        elseif v590 == v0.wireTypes.i64 then
            v591 = nil;
            v592, v593 = v0.readFixed64(v586, v588);
            v591 = v592;
            v588 = v593;
        else
            error("Unsupported wire type: " .. v590);
        end;
    end;
    return v587;
end;
v7.jsonEncode = function(v594) --[[ Line: 5303 ]] --[[ Name: jsonEncode ]]
    local v595 = {};
    if v594.oneof_prop ~= nil and v594.oneof_prop.type == "generic_share_link_data" then
        v595.genericShareLinkData = v594.oneof_prop.value:jsonEncode();
    end;
    return v595;
end;
v7.jsonDecode = function(v596) --[[ Line: 5315 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_25 (copy), v6 (copy)
    local v597 = l_v7_25.new();
    if v596.generic_share_link_data ~= nil then
        v597.oneof_prop = {
            type = "generic_share_link_data", 
            value = v6.GenericShareLinkData.jsonDecode(v596.generic_share_link_data)
        };
    end;
    if v596.genericShareLinkData ~= nil then
        v597.oneof_prop = {
            type = "generic_share_link_data", 
            value = v6.GenericShareLinkData.jsonDecode(v596.genericShareLinkData)
        };
    end;
    return v597;
end;
v7.descriptor = {
    name = "ShareAction_ShareLinkData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkData"
};
v2.ShareAction_ShareLinkData = v7;
v1.default:register(v2.ShareAction_ShareLinkData);
v7 = {};
v7.__index = v7;
local l_v7_26 = v7 --[[ copy: 7 -> 34 ]];
v7.new = function(v599) --[[ Line: 5353 ]] --[[ Name: new ]]
    -- upvalues: l_v7_26 (copy)
    return (setmetatable({
        share_link_type = if not (v599 ~= nil) or v599.share_link_type == nil then nil else v599.share_link_type, 
        share_link_data = if not (v599 ~= nil) or v599.share_link_data == nil then nil else v599.share_link_data, 
        entry_point_key = if not (v599 ~= nil) or v599.entry_point_key == nil then nil else v599.entry_point_key
    }, l_v7_26));
end;
v7.encode = function(v600) --[[ Line: 5361 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v601 = buffer.create(0);
    local v602 = 0;
    if v600.share_link_type ~= nil then
        local v603 = v600.share_link_type:encode();
        local v604, v605 = v0.writeTag(v601, v602, 1, v0.wireTypes.lengthDelimited);
        v604, v605 = v0.writeBuffer(v604, v605, v603, buffer.len(v603));
        v601 = v604;
        v602 = v605;
    end;
    if v600.share_link_data ~= nil then
        local v606 = v600.share_link_data:encode();
        local v607, v608 = v0.writeTag(v601, v602, 2, v0.wireTypes.lengthDelimited);
        v607, v608 = v0.writeBuffer(v607, v608, v606, buffer.len(v606));
        v601 = v607;
        v602 = v608;
    end;
    if v600.entry_point_key ~= nil then
        local v609 = v600.entry_point_key:encode();
        local v610, v611 = v0.writeTag(v601, v602, 3, v0.wireTypes.lengthDelimited);
        v610, v611 = v0.writeBuffer(v610, v611, v609, buffer.len(v609));
        v601 = v610;
        v602 = v611;
    end;
    local v612 = buffer.create(v602);
    buffer.copy(v612, 0, v601, 0, v602);
    return v612;
end;
v7.decode = function(v613) --[[ Line: 5388 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_26 (copy), v0 (copy), v5 (copy), v2 (copy)
    local v614 = l_v7_26.new();
    local v615 = 0;
    while v615 < buffer.len(v613) do
        local v616 = nil;
        local v617 = nil;
        local v618, v619, v620 = v0.readTag(v613, v615);
        v616 = v618;
        v617 = v619;
        v615 = v620;
        if v617 == v0.wireTypes.varint then
            v618 = nil;
            v619, v620 = v0.readVarInt(v613, v615);
            v618 = v619;
            v615 = v620;
        elseif v617 == v0.wireTypes.lengthDelimited then
            if v616 == 1 then
                v618 = nil;
                v619, v620 = v0.readBuffer(v613, v615);
                v618 = v619;
                v615 = v620;
                v614.share_link_type = v5.StringProp.decode(v618);
            elseif v616 == 2 then
                v618 = nil;
                v619, v620 = v0.readBuffer(v613, v615);
                v618 = v619;
                v615 = v620;
                v614.share_link_data = v2.ShareAction_ShareLinkData.decode(v618);
            elseif v616 == 3 then
                v618 = nil;
                v619, v620 = v0.readBuffer(v613, v615);
                v618 = v619;
                v615 = v620;
                v614.entry_point_key = v5.StringProp.decode(v618);
            else
                v618 = nil;
                v619, v620 = v0.readVarInt(v613, v615);
                v615 = v620 + v619;
            end;
        elseif v617 == v0.wireTypes.i32 then
            v618 = nil;
            v619, v620 = v0.readFixed32(v613, v615);
            v618 = v619;
            v615 = v620;
        elseif v617 == v0.wireTypes.i64 then
            v618 = nil;
            v619, v620 = v0.readFixed64(v613, v615);
            v618 = v619;
            v615 = v620;
        else
            error("Unsupported wire type: " .. v617);
        end;
    end;
    return v614;
end;
v7.jsonEncode = function(v621) --[[ Line: 5441 ]] --[[ Name: jsonEncode ]]
    local v622 = {};
    if v621.share_link_type ~= nil then
        v622.shareLinkType = v621.share_link_type:jsonEncode();
    end;
    if v621.share_link_data ~= nil then
        v622.shareLinkData = v621.share_link_data:jsonEncode();
    end;
    if v621.entry_point_key ~= nil then
        v622.entryPointKey = v621.entry_point_key:jsonEncode();
    end;
    return v622;
end;
v7.jsonDecode = function(v623) --[[ Line: 5459 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_26 (copy), v5 (copy), v2 (copy)
    local v624 = l_v7_26.new();
    if v623.share_link_type ~= nil then
        v624.share_link_type = v5.StringProp.jsonDecode(v623.share_link_type);
    end;
    if v623.shareLinkType ~= nil then
        v624.share_link_type = v5.StringProp.jsonDecode(v623.shareLinkType);
    end;
    if v623.share_link_data ~= nil then
        v624.share_link_data = v2.ShareAction_ShareLinkData.jsonDecode(v623.share_link_data);
    end;
    if v623.shareLinkData ~= nil then
        v624.share_link_data = v2.ShareAction_ShareLinkData.jsonDecode(v623.shareLinkData);
    end;
    if v623.entry_point_key ~= nil then
        v624.entry_point_key = v5.StringProp.jsonDecode(v623.entry_point_key);
    end;
    if v623.entryPointKey ~= nil then
        v624.entry_point_key = v5.StringProp.jsonDecode(v623.entryPointKey);
    end;
    return v624;
end;
v7.descriptor = {
    name = "ShareAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.ShareAction_Params = v7;
v1.default:register(v2.ShareAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_27 = v7 --[[ copy: 7 -> 35 ]];
v7.new = function(v626) --[[ Line: 5507 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_27 (copy)
    return (setmetatable({
        action_type = if not (v626 ~= nil) or v626.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v626.action_type, 
        action_params = if not (v626 ~= nil) or v626.action_params == nil then nil else v626.action_params
    }, l_v7_27));
end;
v7.encode = function(v627) --[[ Line: 5516 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v628 = buffer.create(0);
    local v629 = 0;
    if v627.action_type ~= nil and (v627.action_type ~= nil and v627.action_type ~= 0 or v627.action_type ~= v2.ActionType.fromNumber(0)) then
        local v630, v631 = v0.writeTag(v628, v629, 1, v0.wireTypes.varint);
        v630, v631 = v0.writeVarInt(v630, v631, v2.ActionType.toNumber(v627.action_type));
        v628 = v630;
        v629 = v631;
    end;
    if v627.action_params ~= nil then
        local v632 = v627.action_params:encode();
        local v633, v634 = v0.writeTag(v628, v629, 2, v0.wireTypes.lengthDelimited);
        v633, v634 = v0.writeBuffer(v633, v634, v632, buffer.len(v632));
        v628 = v633;
        v629 = v634;
    end;
    local v635 = buffer.create(v629);
    buffer.copy(v635, 0, v628, 0, v629);
    return v635;
end;
v7.decode = function(v636) --[[ Line: 5542 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_27 (copy), v0 (copy), v2 (copy)
    local v637 = l_v7_27.new();
    local v638 = 0;
    while v638 < buffer.len(v636) do
        local v639 = nil;
        local v640 = nil;
        local v641, v642, v643 = v0.readTag(v636, v638);
        v639 = v641;
        v640 = v642;
        v638 = v643;
        if v640 == v0.wireTypes.varint then
            if v639 == 1 then
                v641 = nil;
                v642, v643 = v0.readVarIntI32(v636, v638);
                v641 = v642;
                v638 = v643;
                v637.action_type = v2.ActionType.fromNumber(v641) or v641;
            else
                v641 = nil;
                v642, v643 = v0.readVarInt(v636, v638);
                v641 = v642;
                v638 = v643;
            end;
        elseif v640 == v0.wireTypes.lengthDelimited then
            if v639 == 2 then
                v641 = nil;
                v642, v643 = v0.readBuffer(v636, v638);
                v641 = v642;
                v638 = v643;
                v637.action_params = v2.OpenAbuseReportAction_Params.decode(v641);
            else
                v641 = nil;
                v642, v643 = v0.readVarInt(v636, v638);
                v638 = v643 + v642;
            end;
        elseif v640 == v0.wireTypes.i32 then
            v641 = nil;
            v642, v643 = v0.readFixed32(v636, v638);
            v641 = v642;
            v638 = v643;
        elseif v640 == v0.wireTypes.i64 then
            v641 = nil;
            v642, v643 = v0.readFixed64(v636, v638);
            v641 = v642;
            v638 = v643;
        else
            error("Unsupported wire type: " .. v640);
        end;
    end;
    return v637;
end;
v7.jsonEncode = function(v644) --[[ Line: 5590 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v645 = {};
    if v644.action_type ~= nil and (v644.action_type ~= nil and v644.action_type ~= 0 or v644.action_type ~= v2.ActionType.fromNumber(0)) then
        v645.actionType = if typeof(v644.action_type) == "number" then v644.action_type else v2.ActionType.toNumber(v644.action_type);
    end;
    if v644.action_params ~= nil then
        v645.actionParams = v644.action_params:jsonEncode();
    end;
    return v645;
end;
v7.jsonDecode = function(v646) --[[ Line: 5612 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_27 (copy), v2 (copy)
    local v647 = l_v7_27.new();
    if v646.action_type ~= nil then
        v647.action_type = if typeof(v646.action_type) == "number" then v2.ActionType.fromNumber(v646.action_type) or v646.action_type else v2.ActionType.fromName(v646.action_type) or v646.action_type;
    end;
    if v646.actionType ~= nil then
        v647.action_type = if typeof(v646.actionType) == "number" then v2.ActionType.fromNumber(v646.actionType) or v646.actionType else v2.ActionType.fromName(v646.actionType) or v646.actionType;
    end;
    if v646.action_params ~= nil then
        v647.action_params = v2.OpenAbuseReportAction_Params.jsonDecode(v646.action_params);
    end;
    if v646.actionParams ~= nil then
        v647.action_params = v2.OpenAbuseReportAction_Params.jsonDecode(v646.actionParams);
    end;
    return v647;
end;
v7.descriptor = {
    name = "OpenAbuseReportAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenAbuseReportAction"
};
v2.OpenAbuseReportAction = v7;
v1.default:register(v2.OpenAbuseReportAction);
v7 = {};
v7.__index = v7;
local l_v7_28 = v7 --[[ copy: 7 -> 36 ]];
v7.new = function(v649) --[[ Line: 5652 ]] --[[ Name: new ]]
    -- upvalues: l_v7_28 (copy)
    return (setmetatable({
        target_id = if not (v649 ~= nil) or v649.target_id == nil then nil else v649.target_id, 
        abuse_vector = if not (v649 ~= nil) or v649.abuse_vector == nil then nil else v649.abuse_vector, 
        asset_type_name = if not (v649 ~= nil) or v649.asset_type_name == nil then nil else v649.asset_type_name, 
        universe_id = if not (v649 ~= nil) or v649.universe_id == nil then nil else v649.universe_id
    }, l_v7_28));
end;
v7.encode = function(v650) --[[ Line: 5663 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v651 = buffer.create(0);
    local v652 = 0;
    if v650.target_id ~= nil then
        local v653 = v650.target_id:encode();
        local v654, v655 = v0.writeTag(v651, v652, 1, v0.wireTypes.lengthDelimited);
        v654, v655 = v0.writeBuffer(v654, v655, v653, buffer.len(v653));
        v651 = v654;
        v652 = v655;
    end;
    if v650.abuse_vector ~= nil then
        local v656 = v650.abuse_vector:encode();
        local v657, v658 = v0.writeTag(v651, v652, 2, v0.wireTypes.lengthDelimited);
        v657, v658 = v0.writeBuffer(v657, v658, v656, buffer.len(v656));
        v651 = v657;
        v652 = v658;
    end;
    if v650.asset_type_name ~= nil then
        local v659 = v650.asset_type_name:encode();
        local v660, v661 = v0.writeTag(v651, v652, 3, v0.wireTypes.lengthDelimited);
        v660, v661 = v0.writeBuffer(v660, v661, v659, buffer.len(v659));
        v651 = v660;
        v652 = v661;
    end;
    if v650.universe_id ~= nil then
        local v662 = v650.universe_id:encode();
        local v663, v664 = v0.writeTag(v651, v652, 4, v0.wireTypes.lengthDelimited);
        v663, v664 = v0.writeBuffer(v663, v664, v662, buffer.len(v662));
        v651 = v663;
        v652 = v664;
    end;
    local v665 = buffer.create(v652);
    buffer.copy(v665, 0, v651, 0, v652);
    return v665;
end;
v7.decode = function(v666) --[[ Line: 5696 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_28 (copy), v0 (copy), v5 (copy)
    local v667 = l_v7_28.new();
    local v668 = 0;
    while v668 < buffer.len(v666) do
        local v669 = nil;
        local v670 = nil;
        local v671, v672, v673 = v0.readTag(v666, v668);
        v669 = v671;
        v670 = v672;
        v668 = v673;
        if v670 == v0.wireTypes.varint then
            v671 = nil;
            v672, v673 = v0.readVarInt(v666, v668);
            v671 = v672;
            v668 = v673;
        elseif v670 == v0.wireTypes.lengthDelimited then
            if v669 == 1 then
                v671 = nil;
                v672, v673 = v0.readBuffer(v666, v668);
                v671 = v672;
                v668 = v673;
                v667.target_id = v5.StringProp.decode(v671);
            elseif v669 == 2 then
                v671 = nil;
                v672, v673 = v0.readBuffer(v666, v668);
                v671 = v672;
                v668 = v673;
                v667.abuse_vector = v5.StringProp.decode(v671);
            elseif v669 == 3 then
                v671 = nil;
                v672, v673 = v0.readBuffer(v666, v668);
                v671 = v672;
                v668 = v673;
                v667.asset_type_name = v5.StringProp.decode(v671);
            elseif v669 == 4 then
                v671 = nil;
                v672, v673 = v0.readBuffer(v666, v668);
                v671 = v672;
                v668 = v673;
                v667.universe_id = v5.StringProp.decode(v671);
            else
                v671 = nil;
                v672, v673 = v0.readVarInt(v666, v668);
                v668 = v673 + v672;
            end;
        elseif v670 == v0.wireTypes.i32 then
            v671 = nil;
            v672, v673 = v0.readFixed32(v666, v668);
            v671 = v672;
            v668 = v673;
        elseif v670 == v0.wireTypes.i64 then
            v671 = nil;
            v672, v673 = v0.readFixed64(v666, v668);
            v671 = v672;
            v668 = v673;
        else
            error("Unsupported wire type: " .. v670);
        end;
    end;
    return v667;
end;
v7.jsonEncode = function(v674) --[[ Line: 5754 ]] --[[ Name: jsonEncode ]]
    local v675 = {};
    if v674.target_id ~= nil then
        v675.targetId = v674.target_id:jsonEncode();
    end;
    if v674.abuse_vector ~= nil then
        v675.abuseVector = v674.abuse_vector:jsonEncode();
    end;
    if v674.asset_type_name ~= nil then
        v675.assetTypeName = v674.asset_type_name:jsonEncode();
    end;
    if v674.universe_id ~= nil then
        v675.universeId = v674.universe_id:jsonEncode();
    end;
    return v675;
end;
v7.jsonDecode = function(v676) --[[ Line: 5776 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_28 (copy), v5 (copy)
    local v677 = l_v7_28.new();
    if v676.target_id ~= nil then
        v677.target_id = v5.StringProp.jsonDecode(v676.target_id);
    end;
    if v676.targetId ~= nil then
        v677.target_id = v5.StringProp.jsonDecode(v676.targetId);
    end;
    if v676.abuse_vector ~= nil then
        v677.abuse_vector = v5.StringProp.jsonDecode(v676.abuse_vector);
    end;
    if v676.abuseVector ~= nil then
        v677.abuse_vector = v5.StringProp.jsonDecode(v676.abuseVector);
    end;
    if v676.asset_type_name ~= nil then
        v677.asset_type_name = v5.StringProp.jsonDecode(v676.asset_type_name);
    end;
    if v676.assetTypeName ~= nil then
        v677.asset_type_name = v5.StringProp.jsonDecode(v676.assetTypeName);
    end;
    if v676.universe_id ~= nil then
        v677.universe_id = v5.StringProp.jsonDecode(v676.universe_id);
    end;
    if v676.universeId ~= nil then
        v677.universe_id = v5.StringProp.jsonDecode(v676.universeId);
    end;
    return v677;
end;
v7.descriptor = {
    name = "OpenAbuseReportAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenAbuseReportAction_Params = v7;
v1.default:register(v2.OpenAbuseReportAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_29 = v7 --[[ copy: 7 -> 37 ]];
v7.new = function(v679) --[[ Line: 5833 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_29 (copy)
    return (setmetatable({
        action_type = if not (v679 ~= nil) or v679.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v679.action_type, 
        action_params = if not (v679 ~= nil) or v679.action_params == nil then nil else v679.action_params
    }, l_v7_29));
end;
v7.encode = function(v680) --[[ Line: 5844 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v681 = buffer.create(0);
    local v682 = 0;
    if v680.action_type ~= nil and (v680.action_type ~= nil and v680.action_type ~= 0 or v680.action_type ~= v2.ActionType.fromNumber(0)) then
        local v683, v684 = v0.writeTag(v681, v682, 1, v0.wireTypes.varint);
        v683, v684 = v0.writeVarInt(v683, v684, v2.ActionType.toNumber(v680.action_type));
        v681 = v683;
        v682 = v684;
    end;
    if v680.action_params ~= nil then
        local v685 = v680.action_params:encode();
        local v686, v687 = v0.writeTag(v681, v682, 2, v0.wireTypes.lengthDelimited);
        v686, v687 = v0.writeBuffer(v686, v687, v685, buffer.len(v685));
        v681 = v686;
        v682 = v687;
    end;
    local v688 = buffer.create(v682);
    buffer.copy(v688, 0, v681, 0, v682);
    return v688;
end;
v7.decode = function(v689) --[[ Line: 5870 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_29 (copy), v0 (copy), v2 (copy)
    local v690 = l_v7_29.new();
    local v691 = 0;
    while v691 < buffer.len(v689) do
        local v692 = nil;
        local v693 = nil;
        local v694, v695, v696 = v0.readTag(v689, v691);
        v692 = v694;
        v693 = v695;
        v691 = v696;
        if v693 == v0.wireTypes.varint then
            if v692 == 1 then
                v694 = nil;
                v695, v696 = v0.readVarIntI32(v689, v691);
                v694 = v695;
                v691 = v696;
                v690.action_type = v2.ActionType.fromNumber(v694) or v694;
            else
                v694 = nil;
                v695, v696 = v0.readVarInt(v689, v691);
                v694 = v695;
                v691 = v696;
            end;
        elseif v693 == v0.wireTypes.lengthDelimited then
            if v692 == 2 then
                v694 = nil;
                v695, v696 = v0.readBuffer(v689, v691);
                v694 = v695;
                v691 = v696;
                v690.action_params = v2.RemoveBadgeFromInventoryAction_Params.decode(v694);
            else
                v694 = nil;
                v695, v696 = v0.readVarInt(v689, v691);
                v691 = v696 + v695;
            end;
        elseif v693 == v0.wireTypes.i32 then
            v694 = nil;
            v695, v696 = v0.readFixed32(v689, v691);
            v694 = v695;
            v691 = v696;
        elseif v693 == v0.wireTypes.i64 then
            v694 = nil;
            v695, v696 = v0.readFixed64(v689, v691);
            v694 = v695;
            v691 = v696;
        else
            error("Unsupported wire type: " .. v693);
        end;
    end;
    return v690;
end;
v7.jsonEncode = function(v697) --[[ Line: 5918 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v698 = {};
    if v697.action_type ~= nil and (v697.action_type ~= nil and v697.action_type ~= 0 or v697.action_type ~= v2.ActionType.fromNumber(0)) then
        v698.actionType = if typeof(v697.action_type) == "number" then v697.action_type else v2.ActionType.toNumber(v697.action_type);
    end;
    if v697.action_params ~= nil then
        v698.actionParams = v697.action_params:jsonEncode();
    end;
    return v698;
end;
v7.jsonDecode = function(v699) --[[ Line: 5940 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_29 (copy), v2 (copy)
    local v700 = l_v7_29.new();
    if v699.action_type ~= nil then
        v700.action_type = if typeof(v699.action_type) == "number" then v2.ActionType.fromNumber(v699.action_type) or v699.action_type else v2.ActionType.fromName(v699.action_type) or v699.action_type;
    end;
    if v699.actionType ~= nil then
        v700.action_type = if typeof(v699.actionType) == "number" then v2.ActionType.fromNumber(v699.actionType) or v699.actionType else v2.ActionType.fromName(v699.actionType) or v699.actionType;
    end;
    if v699.action_params ~= nil then
        v700.action_params = v2.RemoveBadgeFromInventoryAction_Params.jsonDecode(v699.action_params);
    end;
    if v699.actionParams ~= nil then
        v700.action_params = v2.RemoveBadgeFromInventoryAction_Params.jsonDecode(v699.actionParams);
    end;
    return v700;
end;
v7.descriptor = {
    name = "RemoveBadgeFromInventoryAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.RemoveBadgeFromInventoryAction"
};
v2.RemoveBadgeFromInventoryAction = v7;
v1.default:register(v2.RemoveBadgeFromInventoryAction);
v7 = {};
v7.__index = v7;
local l_v7_30 = v7 --[[ copy: 7 -> 38 ]];
v7.new = function(v702) --[[ Line: 5980 ]] --[[ Name: new ]]
    -- upvalues: l_v7_30 (copy)
    return (setmetatable({
        asset_id = if not (v702 ~= nil) or v702.asset_id == nil then nil else v702.asset_id
    }, l_v7_30));
end;
v7.encode = function(v703) --[[ Line: 5988 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v704 = buffer.create(0);
    local v705 = 0;
    if v703.asset_id ~= nil then
        local v706 = v703.asset_id:encode();
        local v707, v708 = v0.writeTag(v704, v705, 1, v0.wireTypes.lengthDelimited);
        v707, v708 = v0.writeBuffer(v707, v708, v706, buffer.len(v706));
        v704 = v707;
        v705 = v708;
    end;
    local v709 = buffer.create(v705);
    buffer.copy(v709, 0, v704, 0, v705);
    return v709;
end;
v7.decode = function(v710) --[[ Line: 6003 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_30 (copy), v0 (copy), v5 (copy)
    local v711 = l_v7_30.new();
    local v712 = 0;
    while v712 < buffer.len(v710) do
        local v713 = nil;
        local v714 = nil;
        local v715, v716, v717 = v0.readTag(v710, v712);
        v713 = v715;
        v714 = v716;
        v712 = v717;
        if v714 == v0.wireTypes.varint then
            v715 = nil;
            v716, v717 = v0.readVarInt(v710, v712);
            v715 = v716;
            v712 = v717;
        elseif v714 == v0.wireTypes.lengthDelimited then
            if v713 == 1 then
                v715 = nil;
                v716, v717 = v0.readBuffer(v710, v712);
                v715 = v716;
                v712 = v717;
                v711.asset_id = v5.StringProp.decode(v715);
            else
                v715 = nil;
                v716, v717 = v0.readVarInt(v710, v712);
                v712 = v717 + v716;
            end;
        elseif v714 == v0.wireTypes.i32 then
            v715 = nil;
            v716, v717 = v0.readFixed32(v710, v712);
            v715 = v716;
            v712 = v717;
        elseif v714 == v0.wireTypes.i64 then
            v715 = nil;
            v716, v717 = v0.readFixed64(v710, v712);
            v715 = v716;
            v712 = v717;
        else
            error("Unsupported wire type: " .. v714);
        end;
    end;
    return v711;
end;
v7.jsonEncode = function(v718) --[[ Line: 6046 ]] --[[ Name: jsonEncode ]]
    local v719 = {};
    if v718.asset_id ~= nil then
        v719.assetId = v718.asset_id:jsonEncode();
    end;
    return v719;
end;
v7.jsonDecode = function(v720) --[[ Line: 6056 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_30 (copy), v5 (copy)
    local v721 = l_v7_30.new();
    if v720.asset_id ~= nil then
        v721.asset_id = v5.StringProp.jsonDecode(v720.asset_id);
    end;
    if v720.assetId ~= nil then
        v721.asset_id = v5.StringProp.jsonDecode(v720.assetId);
    end;
    return v721;
end;
v7.descriptor = {
    name = "RemoveBadgeFromInventoryAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.RemoveBadgeFromInventoryAction_Params = v7;
v1.default:register(v2.RemoveBadgeFromInventoryAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_31 = v7 --[[ copy: 7 -> 39 ]];
v7.new = function(v723) --[[ Line: 6086 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_31 (copy)
    return (setmetatable({
        action_type = if not (v723 ~= nil) or v723.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v723.action_type, 
        action_params = if not (v723 ~= nil) or v723.action_params == nil then nil else v723.action_params
    }, l_v7_31));
end;
v7.encode = function(v724) --[[ Line: 6095 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v725 = buffer.create(0);
    local v726 = 0;
    if v724.action_type ~= nil and (v724.action_type ~= nil and v724.action_type ~= 0 or v724.action_type ~= v2.ActionType.fromNumber(0)) then
        local v727, v728 = v0.writeTag(v725, v726, 1, v0.wireTypes.varint);
        v727, v728 = v0.writeVarInt(v727, v728, v2.ActionType.toNumber(v724.action_type));
        v725 = v727;
        v726 = v728;
    end;
    if v724.action_params ~= nil then
        local v729 = v724.action_params:encode();
        local v730, v731 = v0.writeTag(v725, v726, 2, v0.wireTypes.lengthDelimited);
        v730, v731 = v0.writeBuffer(v730, v731, v729, buffer.len(v729));
        v725 = v730;
        v726 = v731;
    end;
    local v732 = buffer.create(v726);
    buffer.copy(v732, 0, v725, 0, v726);
    return v732;
end;
v7.decode = function(v733) --[[ Line: 6121 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_31 (copy), v0 (copy), v2 (copy)
    local v734 = l_v7_31.new();
    local v735 = 0;
    while v735 < buffer.len(v733) do
        local v736 = nil;
        local v737 = nil;
        local v738, v739, v740 = v0.readTag(v733, v735);
        v736 = v738;
        v737 = v739;
        v735 = v740;
        if v737 == v0.wireTypes.varint then
            if v736 == 1 then
                v738 = nil;
                v739, v740 = v0.readVarIntI32(v733, v735);
                v738 = v739;
                v735 = v740;
                v734.action_type = v2.ActionType.fromNumber(v738) or v738;
            else
                v738 = nil;
                v739, v740 = v0.readVarInt(v733, v735);
                v738 = v739;
                v735 = v740;
            end;
        elseif v737 == v0.wireTypes.lengthDelimited then
            if v736 == 2 then
                v738 = nil;
                v739, v740 = v0.readBuffer(v733, v735);
                v738 = v739;
                v735 = v740;
                v734.action_params = v2.OpenProfileAction_Params.decode(v738);
            else
                v738 = nil;
                v739, v740 = v0.readVarInt(v733, v735);
                v735 = v740 + v739;
            end;
        elseif v737 == v0.wireTypes.i32 then
            v738 = nil;
            v739, v740 = v0.readFixed32(v733, v735);
            v738 = v739;
            v735 = v740;
        elseif v737 == v0.wireTypes.i64 then
            v738 = nil;
            v739, v740 = v0.readFixed64(v733, v735);
            v738 = v739;
            v735 = v740;
        else
            error("Unsupported wire type: " .. v737);
        end;
    end;
    return v734;
end;
v7.jsonEncode = function(v741) --[[ Line: 6169 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v742 = {};
    if v741.action_type ~= nil and (v741.action_type ~= nil and v741.action_type ~= 0 or v741.action_type ~= v2.ActionType.fromNumber(0)) then
        v742.actionType = if typeof(v741.action_type) == "number" then v741.action_type else v2.ActionType.toNumber(v741.action_type);
    end;
    if v741.action_params ~= nil then
        v742.actionParams = v741.action_params:jsonEncode();
    end;
    return v742;
end;
v7.jsonDecode = function(v743) --[[ Line: 6191 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_31 (copy), v2 (copy)
    local v744 = l_v7_31.new();
    if v743.action_type ~= nil then
        v744.action_type = if typeof(v743.action_type) == "number" then v2.ActionType.fromNumber(v743.action_type) or v743.action_type else v2.ActionType.fromName(v743.action_type) or v743.action_type;
    end;
    if v743.actionType ~= nil then
        v744.action_type = if typeof(v743.actionType) == "number" then v2.ActionType.fromNumber(v743.actionType) or v743.actionType else v2.ActionType.fromName(v743.actionType) or v743.actionType;
    end;
    if v743.action_params ~= nil then
        v744.action_params = v2.OpenProfileAction_Params.jsonDecode(v743.action_params);
    end;
    if v743.actionParams ~= nil then
        v744.action_params = v2.OpenProfileAction_Params.jsonDecode(v743.actionParams);
    end;
    return v744;
end;
v7.descriptor = {
    name = "OpenProfileAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenProfileAction"
};
v2.OpenProfileAction = v7;
v1.default:register(v2.OpenProfileAction);
v7 = {};
v7.__index = v7;
local l_v7_32 = v7 --[[ copy: 7 -> 40 ]];
v7.new = function(v746) --[[ Line: 6231 ]] --[[ Name: new ]]
    -- upvalues: l_v7_32 (copy)
    return (setmetatable({
        profile_id = if not (v746 ~= nil) or v746.profile_id == nil then nil else v746.profile_id, 
        profile_type = if not (v746 ~= nil) or v746.profile_type == nil then nil else v746.profile_type, 
        source = if not (v746 ~= nil) or v746.source == nil then nil else v746.source
    }, l_v7_32));
end;
v7.encode = function(v747) --[[ Line: 6239 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v748 = buffer.create(0);
    local v749 = 0;
    if v747.profile_id ~= nil then
        local v750 = v747.profile_id:encode();
        local v751, v752 = v0.writeTag(v748, v749, 1, v0.wireTypes.lengthDelimited);
        v751, v752 = v0.writeBuffer(v751, v752, v750, buffer.len(v750));
        v748 = v751;
        v749 = v752;
    end;
    if v747.profile_type ~= nil then
        local v753 = v747.profile_type:encode();
        local v754, v755 = v0.writeTag(v748, v749, 2, v0.wireTypes.lengthDelimited);
        v754, v755 = v0.writeBuffer(v754, v755, v753, buffer.len(v753));
        v748 = v754;
        v749 = v755;
    end;
    if v747.source ~= nil then
        local v756 = v747.source:encode();
        local v757, v758 = v0.writeTag(v748, v749, 3, v0.wireTypes.lengthDelimited);
        v757, v758 = v0.writeBuffer(v757, v758, v756, buffer.len(v756));
        v748 = v757;
        v749 = v758;
    end;
    local v759 = buffer.create(v749);
    buffer.copy(v759, 0, v748, 0, v749);
    return v759;
end;
v7.decode = function(v760) --[[ Line: 6266 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_32 (copy), v0 (copy), v5 (copy)
    local v761 = l_v7_32.new();
    local v762 = 0;
    while v762 < buffer.len(v760) do
        local v763 = nil;
        local v764 = nil;
        local v765, v766, v767 = v0.readTag(v760, v762);
        v763 = v765;
        v764 = v766;
        v762 = v767;
        if v764 == v0.wireTypes.varint then
            v765 = nil;
            v766, v767 = v0.readVarInt(v760, v762);
            v765 = v766;
            v762 = v767;
        elseif v764 == v0.wireTypes.lengthDelimited then
            if v763 == 1 then
                v765 = nil;
                v766, v767 = v0.readBuffer(v760, v762);
                v765 = v766;
                v762 = v767;
                v761.profile_id = v5.StringProp.decode(v765);
            elseif v763 == 2 then
                v765 = nil;
                v766, v767 = v0.readBuffer(v760, v762);
                v765 = v766;
                v762 = v767;
                v761.profile_type = v5.StringProp.decode(v765);
            elseif v763 == 3 then
                v765 = nil;
                v766, v767 = v0.readBuffer(v760, v762);
                v765 = v766;
                v762 = v767;
                v761.source = v5.StringProp.decode(v765);
            else
                v765 = nil;
                v766, v767 = v0.readVarInt(v760, v762);
                v762 = v767 + v766;
            end;
        elseif v764 == v0.wireTypes.i32 then
            v765 = nil;
            v766, v767 = v0.readFixed32(v760, v762);
            v765 = v766;
            v762 = v767;
        elseif v764 == v0.wireTypes.i64 then
            v765 = nil;
            v766, v767 = v0.readFixed64(v760, v762);
            v765 = v766;
            v762 = v767;
        else
            error("Unsupported wire type: " .. v764);
        end;
    end;
    return v761;
end;
v7.jsonEncode = function(v768) --[[ Line: 6319 ]] --[[ Name: jsonEncode ]]
    local v769 = {};
    if v768.profile_id ~= nil then
        v769.profileId = v768.profile_id:jsonEncode();
    end;
    if v768.profile_type ~= nil then
        v769.profileType = v768.profile_type:jsonEncode();
    end;
    if v768.source ~= nil then
        v769.source = v768.source:jsonEncode();
    end;
    return v769;
end;
v7.jsonDecode = function(v770) --[[ Line: 6337 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_32 (copy), v5 (copy)
    local v771 = l_v7_32.new();
    if v770.profile_id ~= nil then
        v771.profile_id = v5.StringProp.jsonDecode(v770.profile_id);
    end;
    if v770.profileId ~= nil then
        v771.profile_id = v5.StringProp.jsonDecode(v770.profileId);
    end;
    if v770.profile_type ~= nil then
        v771.profile_type = v5.StringProp.jsonDecode(v770.profile_type);
    end;
    if v770.profileType ~= nil then
        v771.profile_type = v5.StringProp.jsonDecode(v770.profileType);
    end;
    if v770.source ~= nil then
        v771.source = v5.StringProp.jsonDecode(v770.source);
    end;
    return v771;
end;
v7.descriptor = {
    name = "OpenProfileAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenProfileAction_Params = v7;
v1.default:register(v2.OpenProfileAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_33 = v7 --[[ copy: 7 -> 41 ]];
v7.new = function(v773) --[[ Line: 6379 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_33 (copy)
    return (setmetatable({
        action_type = if not (v773 ~= nil) or v773.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v773.action_type, 
        action_params = if not (v773 ~= nil) or v773.action_params == nil then nil else v773.action_params
    }, l_v7_33));
end;
v7.encode = function(v774) --[[ Line: 6390 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v775 = buffer.create(0);
    local v776 = 0;
    if v774.action_type ~= nil and (v774.action_type ~= nil and v774.action_type ~= 0 or v774.action_type ~= v2.ActionType.fromNumber(0)) then
        local v777, v778 = v0.writeTag(v775, v776, 1, v0.wireTypes.varint);
        v777, v778 = v0.writeVarInt(v777, v778, v2.ActionType.toNumber(v774.action_type));
        v775 = v777;
        v776 = v778;
    end;
    if v774.action_params ~= nil then
        local v779 = v774.action_params:encode();
        local v780, v781 = v0.writeTag(v775, v776, 2, v0.wireTypes.lengthDelimited);
        v780, v781 = v0.writeBuffer(v780, v781, v779, buffer.len(v779));
        v775 = v780;
        v776 = v781;
    end;
    local v782 = buffer.create(v776);
    buffer.copy(v782, 0, v775, 0, v776);
    return v782;
end;
v7.decode = function(v783) --[[ Line: 6416 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_33 (copy), v0 (copy), v2 (copy)
    local v784 = l_v7_33.new();
    local v785 = 0;
    while v785 < buffer.len(v783) do
        local v786 = nil;
        local v787 = nil;
        local v788, v789, v790 = v0.readTag(v783, v785);
        v786 = v788;
        v787 = v789;
        v785 = v790;
        if v787 == v0.wireTypes.varint then
            if v786 == 1 then
                v788 = nil;
                v789, v790 = v0.readVarIntI32(v783, v785);
                v788 = v789;
                v785 = v790;
                v784.action_type = v2.ActionType.fromNumber(v788) or v788;
            else
                v788 = nil;
                v789, v790 = v0.readVarInt(v783, v785);
                v788 = v789;
                v785 = v790;
            end;
        elseif v787 == v0.wireTypes.lengthDelimited then
            if v786 == 2 then
                v788 = nil;
                v789, v790 = v0.readBuffer(v783, v785);
                v788 = v789;
                v785 = v790;
                v784.action_params = v2.OpenFacialAgeEstimationAction_Params.decode(v788);
            else
                v788 = nil;
                v789, v790 = v0.readVarInt(v783, v785);
                v785 = v790 + v789;
            end;
        elseif v787 == v0.wireTypes.i32 then
            v788 = nil;
            v789, v790 = v0.readFixed32(v783, v785);
            v788 = v789;
            v785 = v790;
        elseif v787 == v0.wireTypes.i64 then
            v788 = nil;
            v789, v790 = v0.readFixed64(v783, v785);
            v788 = v789;
            v785 = v790;
        else
            error("Unsupported wire type: " .. v787);
        end;
    end;
    return v784;
end;
v7.jsonEncode = function(v791) --[[ Line: 6464 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v792 = {};
    if v791.action_type ~= nil and (v791.action_type ~= nil and v791.action_type ~= 0 or v791.action_type ~= v2.ActionType.fromNumber(0)) then
        v792.actionType = if typeof(v791.action_type) == "number" then v791.action_type else v2.ActionType.toNumber(v791.action_type);
    end;
    if v791.action_params ~= nil then
        v792.actionParams = v791.action_params:jsonEncode();
    end;
    return v792;
end;
v7.jsonDecode = function(v793) --[[ Line: 6486 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_33 (copy), v2 (copy)
    local v794 = l_v7_33.new();
    if v793.action_type ~= nil then
        v794.action_type = if typeof(v793.action_type) == "number" then v2.ActionType.fromNumber(v793.action_type) or v793.action_type else v2.ActionType.fromName(v793.action_type) or v793.action_type;
    end;
    if v793.actionType ~= nil then
        v794.action_type = if typeof(v793.actionType) == "number" then v2.ActionType.fromNumber(v793.actionType) or v793.actionType else v2.ActionType.fromName(v793.actionType) or v793.actionType;
    end;
    if v793.action_params ~= nil then
        v794.action_params = v2.OpenFacialAgeEstimationAction_Params.jsonDecode(v793.action_params);
    end;
    if v793.actionParams ~= nil then
        v794.action_params = v2.OpenFacialAgeEstimationAction_Params.jsonDecode(v793.actionParams);
    end;
    return v794;
end;
v7.descriptor = {
    name = "OpenFacialAgeEstimationAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenFacialAgeEstimationAction"
};
v2.OpenFacialAgeEstimationAction = v7;
v1.default:register(v2.OpenFacialAgeEstimationAction);
v7 = {};
v7.__index = v7;
local l_v7_34 = v7 --[[ copy: 7 -> 42 ]];
v7.new = function(v796) --[[ Line: 6526 ]] --[[ Name: new ]]
    -- upvalues: l_v7_34 (copy)
    return (setmetatable({
        user_id = if not (v796 ~= nil) or v796.user_id == nil then nil else v796.user_id, 
        source = if not (v796 ~= nil) or v796.source == nil then nil else v796.source
    }, l_v7_34));
end;
v7.encode = function(v797) --[[ Line: 6535 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v798 = buffer.create(0);
    local v799 = 0;
    if v797.user_id ~= nil then
        local v800 = v797.user_id:encode();
        local v801, v802 = v0.writeTag(v798, v799, 1, v0.wireTypes.lengthDelimited);
        v801, v802 = v0.writeBuffer(v801, v802, v800, buffer.len(v800));
        v798 = v801;
        v799 = v802;
    end;
    if v797.source ~= nil then
        local v803 = v797.source:encode();
        local v804, v805 = v0.writeTag(v798, v799, 2, v0.wireTypes.lengthDelimited);
        v804, v805 = v0.writeBuffer(v804, v805, v803, buffer.len(v803));
        v798 = v804;
        v799 = v805;
    end;
    local v806 = buffer.create(v799);
    buffer.copy(v806, 0, v798, 0, v799);
    return v806;
end;
v7.decode = function(v807) --[[ Line: 6556 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_34 (copy), v0 (copy), v5 (copy)
    local v808 = l_v7_34.new();
    local v809 = 0;
    while v809 < buffer.len(v807) do
        local v810 = nil;
        local v811 = nil;
        local v812, v813, v814 = v0.readTag(v807, v809);
        v810 = v812;
        v811 = v813;
        v809 = v814;
        if v811 == v0.wireTypes.varint then
            v812 = nil;
            v813, v814 = v0.readVarInt(v807, v809);
            v812 = v813;
            v809 = v814;
        elseif v811 == v0.wireTypes.lengthDelimited then
            if v810 == 1 then
                v812 = nil;
                v813, v814 = v0.readBuffer(v807, v809);
                v812 = v813;
                v809 = v814;
                v808.user_id = v5.StringProp.decode(v812);
            elseif v810 == 2 then
                v812 = nil;
                v813, v814 = v0.readBuffer(v807, v809);
                v812 = v813;
                v809 = v814;
                v808.source = v5.StringProp.decode(v812);
            else
                v812 = nil;
                v813, v814 = v0.readVarInt(v807, v809);
                v809 = v814 + v813;
            end;
        elseif v811 == v0.wireTypes.i32 then
            v812 = nil;
            v813, v814 = v0.readFixed32(v807, v809);
            v812 = v813;
            v809 = v814;
        elseif v811 == v0.wireTypes.i64 then
            v812 = nil;
            v813, v814 = v0.readFixed64(v807, v809);
            v812 = v813;
            v809 = v814;
        else
            error("Unsupported wire type: " .. v811);
        end;
    end;
    return v808;
end;
v7.jsonEncode = function(v815) --[[ Line: 6604 ]] --[[ Name: jsonEncode ]]
    local v816 = {};
    if v815.user_id ~= nil then
        v816.userId = v815.user_id:jsonEncode();
    end;
    if v815.source ~= nil then
        v816.source = v815.source:jsonEncode();
    end;
    return v816;
end;
v7.jsonDecode = function(v817) --[[ Line: 6618 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_34 (copy), v5 (copy)
    local v818 = l_v7_34.new();
    if v817.user_id ~= nil then
        v818.user_id = v5.StringProp.jsonDecode(v817.user_id);
    end;
    if v817.userId ~= nil then
        v818.user_id = v5.StringProp.jsonDecode(v817.userId);
    end;
    if v817.source ~= nil then
        v818.source = v5.StringProp.jsonDecode(v817.source);
    end;
    return v818;
end;
v7.descriptor = {
    name = "OpenFacialAgeEstimationAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenFacialAgeEstimationAction_Params = v7;
v1.default:register(v2.OpenFacialAgeEstimationAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_35 = v7 --[[ copy: 7 -> 43 ]];
v7.new = function(v820) --[[ Line: 6652 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_35 (copy)
    return (setmetatable({
        action_type = if not (v820 ~= nil) or v820.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v820.action_type, 
        action_params = if not (v820 ~= nil) or v820.action_params == nil then nil else v820.action_params
    }, l_v7_35));
end;
v7.encode = function(v821) --[[ Line: 6663 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v822 = buffer.create(0);
    local v823 = 0;
    if v821.action_type ~= nil and (v821.action_type ~= nil and v821.action_type ~= 0 or v821.action_type ~= v2.ActionType.fromNumber(0)) then
        local v824, v825 = v0.writeTag(v822, v823, 1, v0.wireTypes.varint);
        v824, v825 = v0.writeVarInt(v824, v825, v2.ActionType.toNumber(v821.action_type));
        v822 = v824;
        v823 = v825;
    end;
    if v821.action_params ~= nil then
        local v826 = v821.action_params:encode();
        local v827, v828 = v0.writeTag(v822, v823, 2, v0.wireTypes.lengthDelimited);
        v827, v828 = v0.writeBuffer(v827, v828, v826, buffer.len(v826));
        v822 = v827;
        v823 = v828;
    end;
    local v829 = buffer.create(v823);
    buffer.copy(v829, 0, v822, 0, v823);
    return v829;
end;
v7.decode = function(v830) --[[ Line: 6689 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_35 (copy), v0 (copy), v2 (copy)
    local v831 = l_v7_35.new();
    local v832 = 0;
    while v832 < buffer.len(v830) do
        local v833 = nil;
        local v834 = nil;
        local v835, v836, v837 = v0.readTag(v830, v832);
        v833 = v835;
        v834 = v836;
        v832 = v837;
        if v834 == v0.wireTypes.varint then
            if v833 == 1 then
                v835 = nil;
                v836, v837 = v0.readVarIntI32(v830, v832);
                v835 = v836;
                v832 = v837;
                v831.action_type = v2.ActionType.fromNumber(v835) or v835;
            else
                v835 = nil;
                v836, v837 = v0.readVarInt(v830, v832);
                v835 = v836;
                v832 = v837;
            end;
        elseif v834 == v0.wireTypes.lengthDelimited then
            if v833 == 2 then
                v835 = nil;
                v836, v837 = v0.readBuffer(v830, v832);
                v835 = v836;
                v832 = v837;
                v831.action_params = v2.OpenAddConnectionsPageAction_Params.decode(v835);
            else
                v835 = nil;
                v836, v837 = v0.readVarInt(v830, v832);
                v832 = v837 + v836;
            end;
        elseif v834 == v0.wireTypes.i32 then
            v835 = nil;
            v836, v837 = v0.readFixed32(v830, v832);
            v835 = v836;
            v832 = v837;
        elseif v834 == v0.wireTypes.i64 then
            v835 = nil;
            v836, v837 = v0.readFixed64(v830, v832);
            v835 = v836;
            v832 = v837;
        else
            error("Unsupported wire type: " .. v834);
        end;
    end;
    return v831;
end;
v7.jsonEncode = function(v838) --[[ Line: 6737 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v839 = {};
    if v838.action_type ~= nil and (v838.action_type ~= nil and v838.action_type ~= 0 or v838.action_type ~= v2.ActionType.fromNumber(0)) then
        v839.actionType = if typeof(v838.action_type) == "number" then v838.action_type else v2.ActionType.toNumber(v838.action_type);
    end;
    if v838.action_params ~= nil then
        v839.actionParams = v838.action_params:jsonEncode();
    end;
    return v839;
end;
v7.jsonDecode = function(v840) --[[ Line: 6759 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_35 (copy), v2 (copy)
    local v841 = l_v7_35.new();
    if v840.action_type ~= nil then
        v841.action_type = if typeof(v840.action_type) == "number" then v2.ActionType.fromNumber(v840.action_type) or v840.action_type else v2.ActionType.fromName(v840.action_type) or v840.action_type;
    end;
    if v840.actionType ~= nil then
        v841.action_type = if typeof(v840.actionType) == "number" then v2.ActionType.fromNumber(v840.actionType) or v840.actionType else v2.ActionType.fromName(v840.actionType) or v840.actionType;
    end;
    if v840.action_params ~= nil then
        v841.action_params = v2.OpenAddConnectionsPageAction_Params.jsonDecode(v840.action_params);
    end;
    if v840.actionParams ~= nil then
        v841.action_params = v2.OpenAddConnectionsPageAction_Params.jsonDecode(v840.actionParams);
    end;
    return v841;
end;
v7.descriptor = {
    name = "OpenAddConnectionsPageAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenAddConnectionsPageAction"
};
v2.OpenAddConnectionsPageAction = v7;
v1.default:register(v2.OpenAddConnectionsPageAction);
v7 = {};
v7.__index = v7;
local l_v7_36 = v7 --[[ copy: 7 -> 44 ]];
v7.new = function(v843) --[[ Line: 6799 ]] --[[ Name: new ]]
    -- upvalues: l_v7_36 (copy)
    return (setmetatable({
        user_id = if not (v843 ~= nil) or v843.user_id == nil then nil else v843.user_id, 
        source = if not (v843 ~= nil) or v843.source == nil then nil else v843.source
    }, l_v7_36));
end;
v7.encode = function(v844) --[[ Line: 6808 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v845 = buffer.create(0);
    local v846 = 0;
    if v844.user_id ~= nil then
        local v847 = v844.user_id:encode();
        local v848, v849 = v0.writeTag(v845, v846, 1, v0.wireTypes.lengthDelimited);
        v848, v849 = v0.writeBuffer(v848, v849, v847, buffer.len(v847));
        v845 = v848;
        v846 = v849;
    end;
    if v844.source ~= nil then
        local v850 = v844.source:encode();
        local v851, v852 = v0.writeTag(v845, v846, 2, v0.wireTypes.lengthDelimited);
        v851, v852 = v0.writeBuffer(v851, v852, v850, buffer.len(v850));
        v845 = v851;
        v846 = v852;
    end;
    local v853 = buffer.create(v846);
    buffer.copy(v853, 0, v845, 0, v846);
    return v853;
end;
v7.decode = function(v854) --[[ Line: 6829 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_36 (copy), v0 (copy), v5 (copy)
    local v855 = l_v7_36.new();
    local v856 = 0;
    while v856 < buffer.len(v854) do
        local v857 = nil;
        local v858 = nil;
        local v859, v860, v861 = v0.readTag(v854, v856);
        v857 = v859;
        v858 = v860;
        v856 = v861;
        if v858 == v0.wireTypes.varint then
            v859 = nil;
            v860, v861 = v0.readVarInt(v854, v856);
            v859 = v860;
            v856 = v861;
        elseif v858 == v0.wireTypes.lengthDelimited then
            if v857 == 1 then
                v859 = nil;
                v860, v861 = v0.readBuffer(v854, v856);
                v859 = v860;
                v856 = v861;
                v855.user_id = v5.StringProp.decode(v859);
            elseif v857 == 2 then
                v859 = nil;
                v860, v861 = v0.readBuffer(v854, v856);
                v859 = v860;
                v856 = v861;
                v855.source = v5.StringProp.decode(v859);
            else
                v859 = nil;
                v860, v861 = v0.readVarInt(v854, v856);
                v856 = v861 + v860;
            end;
        elseif v858 == v0.wireTypes.i32 then
            v859 = nil;
            v860, v861 = v0.readFixed32(v854, v856);
            v859 = v860;
            v856 = v861;
        elseif v858 == v0.wireTypes.i64 then
            v859 = nil;
            v860, v861 = v0.readFixed64(v854, v856);
            v859 = v860;
            v856 = v861;
        else
            error("Unsupported wire type: " .. v858);
        end;
    end;
    return v855;
end;
v7.jsonEncode = function(v862) --[[ Line: 6877 ]] --[[ Name: jsonEncode ]]
    local v863 = {};
    if v862.user_id ~= nil then
        v863.userId = v862.user_id:jsonEncode();
    end;
    if v862.source ~= nil then
        v863.source = v862.source:jsonEncode();
    end;
    return v863;
end;
v7.jsonDecode = function(v864) --[[ Line: 6891 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_36 (copy), v5 (copy)
    local v865 = l_v7_36.new();
    if v864.user_id ~= nil then
        v865.user_id = v5.StringProp.jsonDecode(v864.user_id);
    end;
    if v864.userId ~= nil then
        v865.user_id = v5.StringProp.jsonDecode(v864.userId);
    end;
    if v864.source ~= nil then
        v865.source = v5.StringProp.jsonDecode(v864.source);
    end;
    return v865;
end;
v7.descriptor = {
    name = "OpenAddConnectionsPageAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenAddConnectionsPageAction_Params = v7;
v1.default:register(v2.OpenAddConnectionsPageAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_37 = v7 --[[ copy: 7 -> 45 ]];
v7.new = function(v867) --[[ Line: 6925 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_37 (copy)
    return (setmetatable({
        action_type = if not (v867 ~= nil) or v867.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v867.action_type, 
        action_params = if not (v867 ~= nil) or v867.action_params == nil then nil else v867.action_params
    }, l_v7_37));
end;
v7.encode = function(v868) --[[ Line: 6934 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v869 = buffer.create(0);
    local v870 = 0;
    if v868.action_type ~= nil and (v868.action_type ~= nil and v868.action_type ~= 0 or v868.action_type ~= v2.ActionType.fromNumber(0)) then
        local v871, v872 = v0.writeTag(v869, v870, 1, v0.wireTypes.varint);
        v871, v872 = v0.writeVarInt(v871, v872, v2.ActionType.toNumber(v868.action_type));
        v869 = v871;
        v870 = v872;
    end;
    if v868.action_params ~= nil then
        local v873 = v868.action_params:encode();
        local v874, v875 = v0.writeTag(v869, v870, 2, v0.wireTypes.lengthDelimited);
        v874, v875 = v0.writeBuffer(v874, v875, v873, buffer.len(v873));
        v869 = v874;
        v870 = v875;
    end;
    local v876 = buffer.create(v870);
    buffer.copy(v876, 0, v869, 0, v870);
    return v876;
end;
v7.decode = function(v877) --[[ Line: 6960 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_37 (copy), v0 (copy), v2 (copy)
    local v878 = l_v7_37.new();
    local v879 = 0;
    while v879 < buffer.len(v877) do
        local v880 = nil;
        local v881 = nil;
        local v882, v883, v884 = v0.readTag(v877, v879);
        v880 = v882;
        v881 = v883;
        v879 = v884;
        if v881 == v0.wireTypes.varint then
            if v880 == 1 then
                v882 = nil;
                v883, v884 = v0.readVarIntI32(v877, v879);
                v882 = v883;
                v879 = v884;
                v878.action_type = v2.ActionType.fromNumber(v882) or v882;
            else
                v882 = nil;
                v883, v884 = v0.readVarInt(v877, v879);
                v882 = v883;
                v879 = v884;
            end;
        elseif v881 == v0.wireTypes.lengthDelimited then
            if v880 == 2 then
                v882 = nil;
                v883, v884 = v0.readBuffer(v877, v879);
                v882 = v883;
                v879 = v884;
                v878.action_params = v2.OpenMarketplaceAction_Params.decode(v882);
            else
                v882 = nil;
                v883, v884 = v0.readVarInt(v877, v879);
                v879 = v884 + v883;
            end;
        elseif v881 == v0.wireTypes.i32 then
            v882 = nil;
            v883, v884 = v0.readFixed32(v877, v879);
            v882 = v883;
            v879 = v884;
        elseif v881 == v0.wireTypes.i64 then
            v882 = nil;
            v883, v884 = v0.readFixed64(v877, v879);
            v882 = v883;
            v879 = v884;
        else
            error("Unsupported wire type: " .. v881);
        end;
    end;
    return v878;
end;
v7.jsonEncode = function(v885) --[[ Line: 7008 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v886 = {};
    if v885.action_type ~= nil and (v885.action_type ~= nil and v885.action_type ~= 0 or v885.action_type ~= v2.ActionType.fromNumber(0)) then
        v886.actionType = if typeof(v885.action_type) == "number" then v885.action_type else v2.ActionType.toNumber(v885.action_type);
    end;
    if v885.action_params ~= nil then
        v886.actionParams = v885.action_params:jsonEncode();
    end;
    return v886;
end;
v7.jsonDecode = function(v887) --[[ Line: 7030 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_37 (copy), v2 (copy)
    local v888 = l_v7_37.new();
    if v887.action_type ~= nil then
        v888.action_type = if typeof(v887.action_type) == "number" then v2.ActionType.fromNumber(v887.action_type) or v887.action_type else v2.ActionType.fromName(v887.action_type) or v887.action_type;
    end;
    if v887.actionType ~= nil then
        v888.action_type = if typeof(v887.actionType) == "number" then v2.ActionType.fromNumber(v887.actionType) or v887.actionType else v2.ActionType.fromName(v887.actionType) or v887.actionType;
    end;
    if v887.action_params ~= nil then
        v888.action_params = v2.OpenMarketplaceAction_Params.jsonDecode(v887.action_params);
    end;
    if v887.actionParams ~= nil then
        v888.action_params = v2.OpenMarketplaceAction_Params.jsonDecode(v887.actionParams);
    end;
    return v888;
end;
v7.descriptor = {
    name = "OpenMarketplaceAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceAction"
};
v2.OpenMarketplaceAction = v7;
v1.default:register(v2.OpenMarketplaceAction);
v7 = {};
v7.__index = v7;
local l_v7_38 = v7 --[[ copy: 7 -> 46 ]];
v7.new = function(v890) --[[ Line: 7070 ]] --[[ Name: new ]]
    -- upvalues: l_v7_38 (copy)
    return (setmetatable({
        user_id = if not (v890 ~= nil) or v890.user_id == nil then nil else v890.user_id, 
        source = if not (v890 ~= nil) or v890.source == nil then nil else v890.source
    }, l_v7_38));
end;
v7.encode = function(v891) --[[ Line: 7079 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v892 = buffer.create(0);
    local v893 = 0;
    if v891.user_id ~= nil then
        local v894 = v891.user_id:encode();
        local v895, v896 = v0.writeTag(v892, v893, 1, v0.wireTypes.lengthDelimited);
        v895, v896 = v0.writeBuffer(v895, v896, v894, buffer.len(v894));
        v892 = v895;
        v893 = v896;
    end;
    if v891.source ~= nil then
        local v897 = v891.source:encode();
        local v898, v899 = v0.writeTag(v892, v893, 2, v0.wireTypes.lengthDelimited);
        v898, v899 = v0.writeBuffer(v898, v899, v897, buffer.len(v897));
        v892 = v898;
        v893 = v899;
    end;
    local v900 = buffer.create(v893);
    buffer.copy(v900, 0, v892, 0, v893);
    return v900;
end;
v7.decode = function(v901) --[[ Line: 7100 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_38 (copy), v0 (copy), v5 (copy)
    local v902 = l_v7_38.new();
    local v903 = 0;
    while v903 < buffer.len(v901) do
        local v904 = nil;
        local v905 = nil;
        local v906, v907, v908 = v0.readTag(v901, v903);
        v904 = v906;
        v905 = v907;
        v903 = v908;
        if v905 == v0.wireTypes.varint then
            v906 = nil;
            v907, v908 = v0.readVarInt(v901, v903);
            v906 = v907;
            v903 = v908;
        elseif v905 == v0.wireTypes.lengthDelimited then
            if v904 == 1 then
                v906 = nil;
                v907, v908 = v0.readBuffer(v901, v903);
                v906 = v907;
                v903 = v908;
                v902.user_id = v5.StringProp.decode(v906);
            elseif v904 == 2 then
                v906 = nil;
                v907, v908 = v0.readBuffer(v901, v903);
                v906 = v907;
                v903 = v908;
                v902.source = v5.StringProp.decode(v906);
            else
                v906 = nil;
                v907, v908 = v0.readVarInt(v901, v903);
                v903 = v908 + v907;
            end;
        elseif v905 == v0.wireTypes.i32 then
            v906 = nil;
            v907, v908 = v0.readFixed32(v901, v903);
            v906 = v907;
            v903 = v908;
        elseif v905 == v0.wireTypes.i64 then
            v906 = nil;
            v907, v908 = v0.readFixed64(v901, v903);
            v906 = v907;
            v903 = v908;
        else
            error("Unsupported wire type: " .. v905);
        end;
    end;
    return v902;
end;
v7.jsonEncode = function(v909) --[[ Line: 7148 ]] --[[ Name: jsonEncode ]]
    local v910 = {};
    if v909.user_id ~= nil then
        v910.userId = v909.user_id:jsonEncode();
    end;
    if v909.source ~= nil then
        v910.source = v909.source:jsonEncode();
    end;
    return v910;
end;
v7.jsonDecode = function(v911) --[[ Line: 7162 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_38 (copy), v5 (copy)
    local v912 = l_v7_38.new();
    if v911.user_id ~= nil then
        v912.user_id = v5.StringProp.jsonDecode(v911.user_id);
    end;
    if v911.userId ~= nil then
        v912.user_id = v5.StringProp.jsonDecode(v911.userId);
    end;
    if v911.source ~= nil then
        v912.source = v5.StringProp.jsonDecode(v911.source);
    end;
    return v912;
end;
v7.descriptor = {
    name = "OpenMarketplaceAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenMarketplaceAction_Params = v7;
v1.default:register(v2.OpenMarketplaceAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_39 = v7 --[[ copy: 7 -> 47 ]];
v7.new = function(v914) --[[ Line: 7194 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_39 (copy)
    return (setmetatable({
        action_type = if not (v914 ~= nil) or v914.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v914.action_type, 
        action_params = if not (v914 ~= nil) or v914.action_params == nil then nil else v914.action_params
    }, l_v7_39));
end;
v7.encode = function(v915) --[[ Line: 7205 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v916 = buffer.create(0);
    local v917 = 0;
    if v915.action_type ~= nil and (v915.action_type ~= nil and v915.action_type ~= 0 or v915.action_type ~= v2.ActionType.fromNumber(0)) then
        local v918, v919 = v0.writeTag(v916, v917, 1, v0.wireTypes.varint);
        v918, v919 = v0.writeVarInt(v918, v919, v2.ActionType.toNumber(v915.action_type));
        v916 = v918;
        v917 = v919;
    end;
    if v915.action_params ~= nil then
        local v920 = v915.action_params:encode();
        local v921, v922 = v0.writeTag(v916, v917, 2, v0.wireTypes.lengthDelimited);
        v921, v922 = v0.writeBuffer(v921, v922, v920, buffer.len(v920));
        v916 = v921;
        v917 = v922;
    end;
    local v923 = buffer.create(v917);
    buffer.copy(v923, 0, v916, 0, v917);
    return v923;
end;
v7.decode = function(v924) --[[ Line: 7231 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_39 (copy), v0 (copy), v2 (copy)
    local v925 = l_v7_39.new();
    local v926 = 0;
    while v926 < buffer.len(v924) do
        local v927 = nil;
        local v928 = nil;
        local v929, v930, v931 = v0.readTag(v924, v926);
        v927 = v929;
        v928 = v930;
        v926 = v931;
        if v928 == v0.wireTypes.varint then
            if v927 == 1 then
                v929 = nil;
                v930, v931 = v0.readVarIntI32(v924, v926);
                v929 = v930;
                v926 = v931;
                v925.action_type = v2.ActionType.fromNumber(v929) or v929;
            else
                v929 = nil;
                v930, v931 = v0.readVarInt(v924, v926);
                v929 = v930;
                v926 = v931;
            end;
        elseif v928 == v0.wireTypes.lengthDelimited then
            if v927 == 2 then
                v929 = nil;
                v930, v931 = v0.readBuffer(v924, v926);
                v929 = v930;
                v926 = v931;
                v925.action_params = v2.HideProfileCompletionAction_Params.decode(v929);
            else
                v929 = nil;
                v930, v931 = v0.readVarInt(v924, v926);
                v926 = v931 + v930;
            end;
        elseif v928 == v0.wireTypes.i32 then
            v929 = nil;
            v930, v931 = v0.readFixed32(v924, v926);
            v929 = v930;
            v926 = v931;
        elseif v928 == v0.wireTypes.i64 then
            v929 = nil;
            v930, v931 = v0.readFixed64(v924, v926);
            v929 = v930;
            v926 = v931;
        else
            error("Unsupported wire type: " .. v928);
        end;
    end;
    return v925;
end;
v7.jsonEncode = function(v932) --[[ Line: 7279 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v933 = {};
    if v932.action_type ~= nil and (v932.action_type ~= nil and v932.action_type ~= 0 or v932.action_type ~= v2.ActionType.fromNumber(0)) then
        v933.actionType = if typeof(v932.action_type) == "number" then v932.action_type else v2.ActionType.toNumber(v932.action_type);
    end;
    if v932.action_params ~= nil then
        v933.actionParams = v932.action_params:jsonEncode();
    end;
    return v933;
end;
v7.jsonDecode = function(v934) --[[ Line: 7301 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_39 (copy), v2 (copy)
    local v935 = l_v7_39.new();
    if v934.action_type ~= nil then
        v935.action_type = if typeof(v934.action_type) == "number" then v2.ActionType.fromNumber(v934.action_type) or v934.action_type else v2.ActionType.fromName(v934.action_type) or v934.action_type;
    end;
    if v934.actionType ~= nil then
        v935.action_type = if typeof(v934.actionType) == "number" then v2.ActionType.fromNumber(v934.actionType) or v934.actionType else v2.ActionType.fromName(v934.actionType) or v934.actionType;
    end;
    if v934.action_params ~= nil then
        v935.action_params = v2.HideProfileCompletionAction_Params.jsonDecode(v934.action_params);
    end;
    if v934.actionParams ~= nil then
        v935.action_params = v2.HideProfileCompletionAction_Params.jsonDecode(v934.actionParams);
    end;
    return v935;
end;
v7.descriptor = {
    name = "HideProfileCompletionAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.HideProfileCompletionAction"
};
v2.HideProfileCompletionAction = v7;
v1.default:register(v2.HideProfileCompletionAction);
v7 = {};
v7.__index = v7;
local l_v7_40 = v7 --[[ copy: 7 -> 48 ]];
v7.new = function(v937) --[[ Line: 7341 ]] --[[ Name: new ]]
    -- upvalues: l_v7_40 (copy)
    return (setmetatable({
        user_id = if not (v937 ~= nil) or v937.user_id == nil then nil else v937.user_id, 
        prompt_id = if not (v937 ~= nil) or v937.prompt_id == nil then nil else v937.prompt_id, 
        source = if not (v937 ~= nil) or v937.source == nil then nil else v937.source, 
        prompt_type = if not (v937 ~= nil) or v937.prompt_type == nil then nil else v937.prompt_type
    }, l_v7_40));
end;
v7.encode = function(v938) --[[ Line: 7352 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v939 = buffer.create(0);
    local v940 = 0;
    if v938.user_id ~= nil then
        local v941 = v938.user_id:encode();
        local v942, v943 = v0.writeTag(v939, v940, 1, v0.wireTypes.lengthDelimited);
        v942, v943 = v0.writeBuffer(v942, v943, v941, buffer.len(v941));
        v939 = v942;
        v940 = v943;
    end;
    if v938.prompt_id ~= nil then
        local v944 = v938.prompt_id:encode();
        local v945, v946 = v0.writeTag(v939, v940, 2, v0.wireTypes.lengthDelimited);
        v945, v946 = v0.writeBuffer(v945, v946, v944, buffer.len(v944));
        v939 = v945;
        v940 = v946;
    end;
    if v938.source ~= nil then
        local v947 = v938.source:encode();
        local v948, v949 = v0.writeTag(v939, v940, 3, v0.wireTypes.lengthDelimited);
        v948, v949 = v0.writeBuffer(v948, v949, v947, buffer.len(v947));
        v939 = v948;
        v940 = v949;
    end;
    if v938.prompt_type ~= nil then
        local v950 = v938.prompt_type:encode();
        local v951, v952 = v0.writeTag(v939, v940, 4, v0.wireTypes.lengthDelimited);
        v951, v952 = v0.writeBuffer(v951, v952, v950, buffer.len(v950));
        v939 = v951;
        v940 = v952;
    end;
    local v953 = buffer.create(v940);
    buffer.copy(v953, 0, v939, 0, v940);
    return v953;
end;
v7.decode = function(v954) --[[ Line: 7385 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_40 (copy), v0 (copy), v5 (copy)
    local v955 = l_v7_40.new();
    local v956 = 0;
    while v956 < buffer.len(v954) do
        local v957 = nil;
        local v958 = nil;
        local v959, v960, v961 = v0.readTag(v954, v956);
        v957 = v959;
        v958 = v960;
        v956 = v961;
        if v958 == v0.wireTypes.varint then
            v959 = nil;
            v960, v961 = v0.readVarInt(v954, v956);
            v959 = v960;
            v956 = v961;
        elseif v958 == v0.wireTypes.lengthDelimited then
            if v957 == 1 then
                v959 = nil;
                v960, v961 = v0.readBuffer(v954, v956);
                v959 = v960;
                v956 = v961;
                v955.user_id = v5.StringProp.decode(v959);
            elseif v957 == 2 then
                v959 = nil;
                v960, v961 = v0.readBuffer(v954, v956);
                v959 = v960;
                v956 = v961;
                v955.prompt_id = v5.StringProp.decode(v959);
            elseif v957 == 3 then
                v959 = nil;
                v960, v961 = v0.readBuffer(v954, v956);
                v959 = v960;
                v956 = v961;
                v955.source = v5.StringProp.decode(v959);
            elseif v957 == 4 then
                v959 = nil;
                v960, v961 = v0.readBuffer(v954, v956);
                v959 = v960;
                v956 = v961;
                v955.prompt_type = v5.StringProp.decode(v959);
            else
                v959 = nil;
                v960, v961 = v0.readVarInt(v954, v956);
                v956 = v961 + v960;
            end;
        elseif v958 == v0.wireTypes.i32 then
            v959 = nil;
            v960, v961 = v0.readFixed32(v954, v956);
            v959 = v960;
            v956 = v961;
        elseif v958 == v0.wireTypes.i64 then
            v959 = nil;
            v960, v961 = v0.readFixed64(v954, v956);
            v959 = v960;
            v956 = v961;
        else
            error("Unsupported wire type: " .. v958);
        end;
    end;
    return v955;
end;
v7.jsonEncode = function(v962) --[[ Line: 7443 ]] --[[ Name: jsonEncode ]]
    local v963 = {};
    if v962.user_id ~= nil then
        v963.userId = v962.user_id:jsonEncode();
    end;
    if v962.prompt_id ~= nil then
        v963.promptId = v962.prompt_id:jsonEncode();
    end;
    if v962.source ~= nil then
        v963.source = v962.source:jsonEncode();
    end;
    if v962.prompt_type ~= nil then
        v963.promptType = v962.prompt_type:jsonEncode();
    end;
    return v963;
end;
v7.jsonDecode = function(v964) --[[ Line: 7465 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_40 (copy), v5 (copy)
    local v965 = l_v7_40.new();
    if v964.user_id ~= nil then
        v965.user_id = v5.StringProp.jsonDecode(v964.user_id);
    end;
    if v964.userId ~= nil then
        v965.user_id = v5.StringProp.jsonDecode(v964.userId);
    end;
    if v964.prompt_id ~= nil then
        v965.prompt_id = v5.StringProp.jsonDecode(v964.prompt_id);
    end;
    if v964.promptId ~= nil then
        v965.prompt_id = v5.StringProp.jsonDecode(v964.promptId);
    end;
    if v964.source ~= nil then
        v965.source = v5.StringProp.jsonDecode(v964.source);
    end;
    if v964.prompt_type ~= nil then
        v965.prompt_type = v5.StringProp.jsonDecode(v964.prompt_type);
    end;
    if v964.promptType ~= nil then
        v965.prompt_type = v5.StringProp.jsonDecode(v964.promptType);
    end;
    return v965;
end;
v7.descriptor = {
    name = "HideProfileCompletionAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.HideProfileCompletionAction_Params = v7;
v1.default:register(v2.HideProfileCompletionAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_41 = v7 --[[ copy: 7 -> 49 ]];
v7.new = function(v967) --[[ Line: 7516 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_41 (copy)
    return (setmetatable({
        action_type = if not (v967 ~= nil) or v967.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v967.action_type, 
        action_params = if not (v967 ~= nil) or v967.action_params == nil then nil else v967.action_params
    }, l_v7_41));
end;
v7.encode = function(v968) --[[ Line: 7527 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v969 = buffer.create(0);
    local v970 = 0;
    if v968.action_type ~= nil and (v968.action_type ~= nil and v968.action_type ~= 0 or v968.action_type ~= v2.ActionType.fromNumber(0)) then
        local v971, v972 = v0.writeTag(v969, v970, 1, v0.wireTypes.varint);
        v971, v972 = v0.writeVarInt(v971, v972, v2.ActionType.toNumber(v968.action_type));
        v969 = v971;
        v970 = v972;
    end;
    if v968.action_params ~= nil then
        local v973 = v968.action_params:encode();
        local v974, v975 = v0.writeTag(v969, v970, 2, v0.wireTypes.lengthDelimited);
        v974, v975 = v0.writeBuffer(v974, v975, v973, buffer.len(v973));
        v969 = v974;
        v970 = v975;
    end;
    local v976 = buffer.create(v970);
    buffer.copy(v976, 0, v969, 0, v970);
    return v976;
end;
v7.decode = function(v977) --[[ Line: 7553 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_41 (copy), v0 (copy), v2 (copy)
    local v978 = l_v7_41.new();
    local v979 = 0;
    while v979 < buffer.len(v977) do
        local v980 = nil;
        local v981 = nil;
        local v982, v983, v984 = v0.readTag(v977, v979);
        v980 = v982;
        v981 = v983;
        v979 = v984;
        if v981 == v0.wireTypes.varint then
            if v980 == 1 then
                v982 = nil;
                v983, v984 = v0.readVarIntI32(v977, v979);
                v982 = v983;
                v979 = v984;
                v978.action_type = v2.ActionType.fromNumber(v982) or v982;
            else
                v982 = nil;
                v983, v984 = v0.readVarInt(v977, v979);
                v982 = v983;
                v979 = v984;
            end;
        elseif v981 == v0.wireTypes.lengthDelimited then
            if v980 == 2 then
                v982 = nil;
                v983, v984 = v0.readBuffer(v977, v979);
                v982 = v983;
                v979 = v984;
                v978.action_params = v2.SelectMarketplaceCatalogCategory_Params.decode(v982);
            else
                v982 = nil;
                v983, v984 = v0.readVarInt(v977, v979);
                v979 = v984 + v983;
            end;
        elseif v981 == v0.wireTypes.i32 then
            v982 = nil;
            v983, v984 = v0.readFixed32(v977, v979);
            v982 = v983;
            v979 = v984;
        elseif v981 == v0.wireTypes.i64 then
            v982 = nil;
            v983, v984 = v0.readFixed64(v977, v979);
            v982 = v983;
            v979 = v984;
        else
            error("Unsupported wire type: " .. v981);
        end;
    end;
    return v978;
end;
v7.jsonEncode = function(v985) --[[ Line: 7601 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v986 = {};
    if v985.action_type ~= nil and (v985.action_type ~= nil and v985.action_type ~= 0 or v985.action_type ~= v2.ActionType.fromNumber(0)) then
        v986.actionType = if typeof(v985.action_type) == "number" then v985.action_type else v2.ActionType.toNumber(v985.action_type);
    end;
    if v985.action_params ~= nil then
        v986.actionParams = v985.action_params:jsonEncode();
    end;
    return v986;
end;
v7.jsonDecode = function(v987) --[[ Line: 7623 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_41 (copy), v2 (copy)
    local v988 = l_v7_41.new();
    if v987.action_type ~= nil then
        v988.action_type = if typeof(v987.action_type) == "number" then v2.ActionType.fromNumber(v987.action_type) or v987.action_type else v2.ActionType.fromName(v987.action_type) or v987.action_type;
    end;
    if v987.actionType ~= nil then
        v988.action_type = if typeof(v987.actionType) == "number" then v2.ActionType.fromNumber(v987.actionType) or v987.actionType else v2.ActionType.fromName(v987.actionType) or v987.actionType;
    end;
    if v987.action_params ~= nil then
        v988.action_params = v2.SelectMarketplaceCatalogCategory_Params.jsonDecode(v987.action_params);
    end;
    if v987.actionParams ~= nil then
        v988.action_params = v2.SelectMarketplaceCatalogCategory_Params.jsonDecode(v987.actionParams);
    end;
    return v988;
end;
v7.descriptor = {
    name = "SelectMarketplaceCatalogCategory", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceCatalogCategory"
};
v2.SelectMarketplaceCatalogCategory = v7;
v1.default:register(v2.SelectMarketplaceCatalogCategory);
v7 = {};
v7.__index = v7;
local l_v7_42 = v7 --[[ copy: 7 -> 50 ]];
v7.new = function(v990) --[[ Line: 7665 ]] --[[ Name: new ]]
    -- upvalues: l_v7_42 (copy)
    return (setmetatable({
        category_id = if not (v990 ~= nil) or v990.category_id == nil then nil else v990.category_id
    }, l_v7_42));
end;
v7.encode = function(v991) --[[ Line: 7673 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v992 = buffer.create(0);
    local v993 = 0;
    if v991.category_id ~= nil then
        local v994 = v991.category_id:encode();
        local v995, v996 = v0.writeTag(v992, v993, 1, v0.wireTypes.lengthDelimited);
        v995, v996 = v0.writeBuffer(v995, v996, v994, buffer.len(v994));
        v992 = v995;
        v993 = v996;
    end;
    local v997 = buffer.create(v993);
    buffer.copy(v997, 0, v992, 0, v993);
    return v997;
end;
v7.decode = function(v998) --[[ Line: 7688 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_42 (copy), v0 (copy), v5 (copy)
    local v999 = l_v7_42.new();
    local v1000 = 0;
    while v1000 < buffer.len(v998) do
        local v1001 = nil;
        local v1002 = nil;
        local v1003, v1004, v1005 = v0.readTag(v998, v1000);
        v1001 = v1003;
        v1002 = v1004;
        v1000 = v1005;
        if v1002 == v0.wireTypes.varint then
            v1003 = nil;
            v1004, v1005 = v0.readVarInt(v998, v1000);
            v1003 = v1004;
            v1000 = v1005;
        elseif v1002 == v0.wireTypes.lengthDelimited then
            if v1001 == 1 then
                v1003 = nil;
                v1004, v1005 = v0.readBuffer(v998, v1000);
                v1003 = v1004;
                v1000 = v1005;
                v999.category_id = v5.StringProp.decode(v1003);
            else
                v1003 = nil;
                v1004, v1005 = v0.readVarInt(v998, v1000);
                v1000 = v1005 + v1004;
            end;
        elseif v1002 == v0.wireTypes.i32 then
            v1003 = nil;
            v1004, v1005 = v0.readFixed32(v998, v1000);
            v1003 = v1004;
            v1000 = v1005;
        elseif v1002 == v0.wireTypes.i64 then
            v1003 = nil;
            v1004, v1005 = v0.readFixed64(v998, v1000);
            v1003 = v1004;
            v1000 = v1005;
        else
            error("Unsupported wire type: " .. v1002);
        end;
    end;
    return v999;
end;
v7.jsonEncode = function(v1006) --[[ Line: 7731 ]] --[[ Name: jsonEncode ]]
    local v1007 = {};
    if v1006.category_id ~= nil then
        v1007.categoryId = v1006.category_id:jsonEncode();
    end;
    return v1007;
end;
v7.jsonDecode = function(v1008) --[[ Line: 7741 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_42 (copy), v5 (copy)
    local v1009 = l_v7_42.new();
    if v1008.category_id ~= nil then
        v1009.category_id = v5.StringProp.jsonDecode(v1008.category_id);
    end;
    if v1008.categoryId ~= nil then
        v1009.category_id = v5.StringProp.jsonDecode(v1008.categoryId);
    end;
    return v1009;
end;
v7.descriptor = {
    name = "SelectMarketplaceCatalogCategory_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.SelectMarketplaceCatalogCategory_Params = v7;
v1.default:register(v2.SelectMarketplaceCatalogCategory_Params);
v7 = {};
v7.__index = v7;
local l_v7_43 = v7 --[[ copy: 7 -> 51 ]];
v7.new = function(v1011) --[[ Line: 7772 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_43 (copy)
    return (setmetatable({
        action_type = if not (v1011 ~= nil) or v1011.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1011.action_type, 
        action_params = if not (v1011 ~= nil) or v1011.action_params == nil then nil else v1011.action_params
    }, l_v7_43));
end;
v7.encode = function(v1012) --[[ Line: 7783 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1013 = buffer.create(0);
    local v1014 = 0;
    if v1012.action_type ~= nil and (v1012.action_type ~= nil and v1012.action_type ~= 0 or v1012.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1015, v1016 = v0.writeTag(v1013, v1014, 1, v0.wireTypes.varint);
        v1015, v1016 = v0.writeVarInt(v1015, v1016, v2.ActionType.toNumber(v1012.action_type));
        v1013 = v1015;
        v1014 = v1016;
    end;
    if v1012.action_params ~= nil then
        local v1017 = v1012.action_params:encode();
        local v1018, v1019 = v0.writeTag(v1013, v1014, 2, v0.wireTypes.lengthDelimited);
        v1018, v1019 = v0.writeBuffer(v1018, v1019, v1017, buffer.len(v1017));
        v1013 = v1018;
        v1014 = v1019;
    end;
    local v1020 = buffer.create(v1014);
    buffer.copy(v1020, 0, v1013, 0, v1014);
    return v1020;
end;
v7.decode = function(v1021) --[[ Line: 7809 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_43 (copy), v0 (copy), v2 (copy)
    local v1022 = l_v7_43.new();
    local v1023 = 0;
    while v1023 < buffer.len(v1021) do
        local v1024 = nil;
        local v1025 = nil;
        local v1026, v1027, v1028 = v0.readTag(v1021, v1023);
        v1024 = v1026;
        v1025 = v1027;
        v1023 = v1028;
        if v1025 == v0.wireTypes.varint then
            if v1024 == 1 then
                v1026 = nil;
                v1027, v1028 = v0.readVarIntI32(v1021, v1023);
                v1026 = v1027;
                v1023 = v1028;
                v1022.action_type = v2.ActionType.fromNumber(v1026) or v1026;
            else
                v1026 = nil;
                v1027, v1028 = v0.readVarInt(v1021, v1023);
                v1026 = v1027;
                v1023 = v1028;
            end;
        elseif v1025 == v0.wireTypes.lengthDelimited then
            if v1024 == 2 then
                v1026 = nil;
                v1027, v1028 = v0.readBuffer(v1021, v1023);
                v1026 = v1027;
                v1023 = v1028;
                v1022.action_params = v2.SelectMarketplaceCatalogSubcategory_Params.decode(v1026);
            else
                v1026 = nil;
                v1027, v1028 = v0.readVarInt(v1021, v1023);
                v1023 = v1028 + v1027;
            end;
        elseif v1025 == v0.wireTypes.i32 then
            v1026 = nil;
            v1027, v1028 = v0.readFixed32(v1021, v1023);
            v1026 = v1027;
            v1023 = v1028;
        elseif v1025 == v0.wireTypes.i64 then
            v1026 = nil;
            v1027, v1028 = v0.readFixed64(v1021, v1023);
            v1026 = v1027;
            v1023 = v1028;
        else
            error("Unsupported wire type: " .. v1025);
        end;
    end;
    return v1022;
end;
v7.jsonEncode = function(v1029) --[[ Line: 7857 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1030 = {};
    if v1029.action_type ~= nil and (v1029.action_type ~= nil and v1029.action_type ~= 0 or v1029.action_type ~= v2.ActionType.fromNumber(0)) then
        v1030.actionType = if typeof(v1029.action_type) == "number" then v1029.action_type else v2.ActionType.toNumber(v1029.action_type);
    end;
    if v1029.action_params ~= nil then
        v1030.actionParams = v1029.action_params:jsonEncode();
    end;
    return v1030;
end;
v7.jsonDecode = function(v1031) --[[ Line: 7879 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_43 (copy), v2 (copy)
    local v1032 = l_v7_43.new();
    if v1031.action_type ~= nil then
        v1032.action_type = if typeof(v1031.action_type) == "number" then v2.ActionType.fromNumber(v1031.action_type) or v1031.action_type else v2.ActionType.fromName(v1031.action_type) or v1031.action_type;
    end;
    if v1031.actionType ~= nil then
        v1032.action_type = if typeof(v1031.actionType) == "number" then v2.ActionType.fromNumber(v1031.actionType) or v1031.actionType else v2.ActionType.fromName(v1031.actionType) or v1031.actionType;
    end;
    if v1031.action_params ~= nil then
        v1032.action_params = v2.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(v1031.action_params);
    end;
    if v1031.actionParams ~= nil then
        v1032.action_params = v2.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(v1031.actionParams);
    end;
    return v1032;
end;
v7.descriptor = {
    name = "SelectMarketplaceCatalogSubcategory", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceCatalogSubcategory"
};
v2.SelectMarketplaceCatalogSubcategory = v7;
v1.default:register(v2.SelectMarketplaceCatalogSubcategory);
v7 = {};
v7.__index = v7;
local l_v7_44 = v7 --[[ copy: 7 -> 52 ]];
v7.new = function(v1034) --[[ Line: 7921 ]] --[[ Name: new ]]
    -- upvalues: l_v7_44 (copy)
    return (setmetatable({
        subcategory_id = if not (v1034 ~= nil) or v1034.subcategory_id == nil then nil else v1034.subcategory_id
    }, l_v7_44));
end;
v7.encode = function(v1035) --[[ Line: 7929 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1036 = buffer.create(0);
    local v1037 = 0;
    if v1035.subcategory_id ~= nil then
        local v1038 = v1035.subcategory_id:encode();
        local v1039, v1040 = v0.writeTag(v1036, v1037, 1, v0.wireTypes.lengthDelimited);
        v1039, v1040 = v0.writeBuffer(v1039, v1040, v1038, buffer.len(v1038));
        v1036 = v1039;
        v1037 = v1040;
    end;
    local v1041 = buffer.create(v1037);
    buffer.copy(v1041, 0, v1036, 0, v1037);
    return v1041;
end;
v7.decode = function(v1042) --[[ Line: 7946 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_44 (copy), v0 (copy), v5 (copy)
    local v1043 = l_v7_44.new();
    local v1044 = 0;
    while v1044 < buffer.len(v1042) do
        local v1045 = nil;
        local v1046 = nil;
        local v1047, v1048, v1049 = v0.readTag(v1042, v1044);
        v1045 = v1047;
        v1046 = v1048;
        v1044 = v1049;
        if v1046 == v0.wireTypes.varint then
            v1047 = nil;
            v1048, v1049 = v0.readVarInt(v1042, v1044);
            v1047 = v1048;
            v1044 = v1049;
        elseif v1046 == v0.wireTypes.lengthDelimited then
            if v1045 == 1 then
                v1047 = nil;
                v1048, v1049 = v0.readBuffer(v1042, v1044);
                v1047 = v1048;
                v1044 = v1049;
                v1043.subcategory_id = v5.StringProp.decode(v1047);
            else
                v1047 = nil;
                v1048, v1049 = v0.readVarInt(v1042, v1044);
                v1044 = v1049 + v1048;
            end;
        elseif v1046 == v0.wireTypes.i32 then
            v1047 = nil;
            v1048, v1049 = v0.readFixed32(v1042, v1044);
            v1047 = v1048;
            v1044 = v1049;
        elseif v1046 == v0.wireTypes.i64 then
            v1047 = nil;
            v1048, v1049 = v0.readFixed64(v1042, v1044);
            v1047 = v1048;
            v1044 = v1049;
        else
            error("Unsupported wire type: " .. v1046);
        end;
    end;
    return v1043;
end;
v7.jsonEncode = function(v1050) --[[ Line: 7991 ]] --[[ Name: jsonEncode ]]
    local v1051 = {};
    if v1050.subcategory_id ~= nil then
        v1051.subcategoryId = v1050.subcategory_id:jsonEncode();
    end;
    return v1051;
end;
v7.jsonDecode = function(v1052) --[[ Line: 8003 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_44 (copy), v5 (copy)
    local v1053 = l_v7_44.new();
    if v1052.subcategory_id ~= nil then
        v1053.subcategory_id = v5.StringProp.jsonDecode(v1052.subcategory_id);
    end;
    if v1052.subcategoryId ~= nil then
        v1053.subcategory_id = v5.StringProp.jsonDecode(v1052.subcategoryId);
    end;
    return v1053;
end;
v7.descriptor = {
    name = "SelectMarketplaceCatalogSubcategory_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.SelectMarketplaceCatalogSubcategory_Params = v7;
v1.default:register(v2.SelectMarketplaceCatalogSubcategory_Params);
v7 = {};
v7.__index = v7;
local l_v7_45 = v7 --[[ copy: 7 -> 53 ]];
v7.new = function(v1055) --[[ Line: 8035 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_45 (copy)
    return (setmetatable({
        action_type = if not (v1055 ~= nil) or v1055.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1055.action_type, 
        action_params = if not (v1055 ~= nil) or v1055.action_params == nil then nil else v1055.action_params
    }, l_v7_45));
end;
v7.encode = function(v1056) --[[ Line: 8046 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1057 = buffer.create(0);
    local v1058 = 0;
    if v1056.action_type ~= nil and (v1056.action_type ~= nil and v1056.action_type ~= 0 or v1056.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1059, v1060 = v0.writeTag(v1057, v1058, 1, v0.wireTypes.varint);
        v1059, v1060 = v0.writeVarInt(v1059, v1060, v2.ActionType.toNumber(v1056.action_type));
        v1057 = v1059;
        v1058 = v1060;
    end;
    if v1056.action_params ~= nil then
        local v1061 = v1056.action_params:encode();
        local v1062, v1063 = v0.writeTag(v1057, v1058, 2, v0.wireTypes.lengthDelimited);
        v1062, v1063 = v0.writeBuffer(v1062, v1063, v1061, buffer.len(v1061));
        v1057 = v1062;
        v1058 = v1063;
    end;
    local v1064 = buffer.create(v1058);
    buffer.copy(v1064, 0, v1057, 0, v1058);
    return v1064;
end;
v7.decode = function(v1065) --[[ Line: 8072 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_45 (copy), v0 (copy), v2 (copy)
    local v1066 = l_v7_45.new();
    local v1067 = 0;
    while v1067 < buffer.len(v1065) do
        local v1068 = nil;
        local v1069 = nil;
        local v1070, v1071, v1072 = v0.readTag(v1065, v1067);
        v1068 = v1070;
        v1069 = v1071;
        v1067 = v1072;
        if v1069 == v0.wireTypes.varint then
            if v1068 == 1 then
                v1070 = nil;
                v1071, v1072 = v0.readVarIntI32(v1065, v1067);
                v1070 = v1071;
                v1067 = v1072;
                v1066.action_type = v2.ActionType.fromNumber(v1070) or v1070;
            else
                v1070 = nil;
                v1071, v1072 = v0.readVarInt(v1065, v1067);
                v1070 = v1071;
                v1067 = v1072;
            end;
        elseif v1069 == v0.wireTypes.lengthDelimited then
            if v1068 == 2 then
                v1070 = nil;
                v1071, v1072 = v0.readBuffer(v1065, v1067);
                v1070 = v1071;
                v1067 = v1072;
                v1066.action_params = v2.OpenMarketplaceCatalogSeeAll_Params.decode(v1070);
            else
                v1070 = nil;
                v1071, v1072 = v0.readVarInt(v1065, v1067);
                v1067 = v1072 + v1071;
            end;
        elseif v1069 == v0.wireTypes.i32 then
            v1070 = nil;
            v1071, v1072 = v0.readFixed32(v1065, v1067);
            v1070 = v1071;
            v1067 = v1072;
        elseif v1069 == v0.wireTypes.i64 then
            v1070 = nil;
            v1071, v1072 = v0.readFixed64(v1065, v1067);
            v1070 = v1071;
            v1067 = v1072;
        else
            error("Unsupported wire type: " .. v1069);
        end;
    end;
    return v1066;
end;
v7.jsonEncode = function(v1073) --[[ Line: 8120 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1074 = {};
    if v1073.action_type ~= nil and (v1073.action_type ~= nil and v1073.action_type ~= 0 or v1073.action_type ~= v2.ActionType.fromNumber(0)) then
        v1074.actionType = if typeof(v1073.action_type) == "number" then v1073.action_type else v2.ActionType.toNumber(v1073.action_type);
    end;
    if v1073.action_params ~= nil then
        v1074.actionParams = v1073.action_params:jsonEncode();
    end;
    return v1074;
end;
v7.jsonDecode = function(v1075) --[[ Line: 8142 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_45 (copy), v2 (copy)
    local v1076 = l_v7_45.new();
    if v1075.action_type ~= nil then
        v1076.action_type = if typeof(v1075.action_type) == "number" then v2.ActionType.fromNumber(v1075.action_type) or v1075.action_type else v2.ActionType.fromName(v1075.action_type) or v1075.action_type;
    end;
    if v1075.actionType ~= nil then
        v1076.action_type = if typeof(v1075.actionType) == "number" then v2.ActionType.fromNumber(v1075.actionType) or v1075.actionType else v2.ActionType.fromName(v1075.actionType) or v1075.actionType;
    end;
    if v1075.action_params ~= nil then
        v1076.action_params = v2.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(v1075.action_params);
    end;
    if v1075.actionParams ~= nil then
        v1076.action_params = v2.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(v1075.actionParams);
    end;
    return v1076;
end;
v7.descriptor = {
    name = "OpenMarketplaceCatalogSeeAll", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceCatalogSeeAll"
};
v2.OpenMarketplaceCatalogSeeAll = v7;
v1.default:register(v2.OpenMarketplaceCatalogSeeAll);
v7 = {};
v7.__index = v7;
local l_v7_46 = v7 --[[ copy: 7 -> 54 ]];
v7.new = function(v1078) --[[ Line: 8182 ]] --[[ Name: new ]]
    -- upvalues: l_v7_46 (copy)
    return (setmetatable({
        sort_id = if not (v1078 ~= nil) or v1078.sort_id == nil then nil else v1078.sort_id, 
        title = if not (v1078 ~= nil) or v1078.title == nil then nil else v1078.title, 
        description = if not (v1078 ~= nil) or v1078.description == nil then nil else v1078.description, 
        tooltip_text = if not (v1078 ~= nil) or v1078.tooltip_text == nil then nil else v1078.tooltip_text
    }, l_v7_46));
end;
v7.encode = function(v1079) --[[ Line: 8193 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1080 = buffer.create(0);
    local v1081 = 0;
    if v1079.sort_id ~= nil then
        local v1082 = v1079.sort_id:encode();
        local v1083, v1084 = v0.writeTag(v1080, v1081, 1, v0.wireTypes.lengthDelimited);
        v1083, v1084 = v0.writeBuffer(v1083, v1084, v1082, buffer.len(v1082));
        v1080 = v1083;
        v1081 = v1084;
    end;
    if v1079.title ~= nil then
        local v1085 = v1079.title:encode();
        local v1086, v1087 = v0.writeTag(v1080, v1081, 2, v0.wireTypes.lengthDelimited);
        v1086, v1087 = v0.writeBuffer(v1086, v1087, v1085, buffer.len(v1085));
        v1080 = v1086;
        v1081 = v1087;
    end;
    if v1079.description ~= nil then
        local v1088 = v1079.description:encode();
        local v1089, v1090 = v0.writeTag(v1080, v1081, 3, v0.wireTypes.lengthDelimited);
        v1089, v1090 = v0.writeBuffer(v1089, v1090, v1088, buffer.len(v1088));
        v1080 = v1089;
        v1081 = v1090;
    end;
    if v1079.tooltip_text ~= nil then
        local v1091 = v1079.tooltip_text:encode();
        local v1092, v1093 = v0.writeTag(v1080, v1081, 4, v0.wireTypes.lengthDelimited);
        v1092, v1093 = v0.writeBuffer(v1092, v1093, v1091, buffer.len(v1091));
        v1080 = v1092;
        v1081 = v1093;
    end;
    local v1094 = buffer.create(v1081);
    buffer.copy(v1094, 0, v1080, 0, v1081);
    return v1094;
end;
v7.decode = function(v1095) --[[ Line: 8226 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_46 (copy), v0 (copy), v5 (copy)
    local v1096 = l_v7_46.new();
    local v1097 = 0;
    while v1097 < buffer.len(v1095) do
        local v1098 = nil;
        local v1099 = nil;
        local v1100, v1101, v1102 = v0.readTag(v1095, v1097);
        v1098 = v1100;
        v1099 = v1101;
        v1097 = v1102;
        if v1099 == v0.wireTypes.varint then
            v1100 = nil;
            v1101, v1102 = v0.readVarInt(v1095, v1097);
            v1100 = v1101;
            v1097 = v1102;
        elseif v1099 == v0.wireTypes.lengthDelimited then
            if v1098 == 1 then
                v1100 = nil;
                v1101, v1102 = v0.readBuffer(v1095, v1097);
                v1100 = v1101;
                v1097 = v1102;
                v1096.sort_id = v5.StringProp.decode(v1100);
            elseif v1098 == 2 then
                v1100 = nil;
                v1101, v1102 = v0.readBuffer(v1095, v1097);
                v1100 = v1101;
                v1097 = v1102;
                v1096.title = v5.StringProp.decode(v1100);
            elseif v1098 == 3 then
                v1100 = nil;
                v1101, v1102 = v0.readBuffer(v1095, v1097);
                v1100 = v1101;
                v1097 = v1102;
                v1096.description = v5.StringProp.decode(v1100);
            elseif v1098 == 4 then
                v1100 = nil;
                v1101, v1102 = v0.readBuffer(v1095, v1097);
                v1100 = v1101;
                v1097 = v1102;
                v1096.tooltip_text = v5.StringProp.decode(v1100);
            else
                v1100 = nil;
                v1101, v1102 = v0.readVarInt(v1095, v1097);
                v1097 = v1102 + v1101;
            end;
        elseif v1099 == v0.wireTypes.i32 then
            v1100 = nil;
            v1101, v1102 = v0.readFixed32(v1095, v1097);
            v1100 = v1101;
            v1097 = v1102;
        elseif v1099 == v0.wireTypes.i64 then
            v1100 = nil;
            v1101, v1102 = v0.readFixed64(v1095, v1097);
            v1100 = v1101;
            v1097 = v1102;
        else
            error("Unsupported wire type: " .. v1099);
        end;
    end;
    return v1096;
end;
v7.jsonEncode = function(v1103) --[[ Line: 8284 ]] --[[ Name: jsonEncode ]]
    local v1104 = {};
    if v1103.sort_id ~= nil then
        v1104.sortId = v1103.sort_id:jsonEncode();
    end;
    if v1103.title ~= nil then
        v1104.title = v1103.title:jsonEncode();
    end;
    if v1103.description ~= nil then
        v1104.description = v1103.description:jsonEncode();
    end;
    if v1103.tooltip_text ~= nil then
        v1104.tooltipText = v1103.tooltip_text:jsonEncode();
    end;
    return v1104;
end;
v7.jsonDecode = function(v1105) --[[ Line: 8306 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_46 (copy), v5 (copy)
    local v1106 = l_v7_46.new();
    if v1105.sort_id ~= nil then
        v1106.sort_id = v5.StringProp.jsonDecode(v1105.sort_id);
    end;
    if v1105.sortId ~= nil then
        v1106.sort_id = v5.StringProp.jsonDecode(v1105.sortId);
    end;
    if v1105.title ~= nil then
        v1106.title = v5.StringProp.jsonDecode(v1105.title);
    end;
    if v1105.description ~= nil then
        v1106.description = v5.StringProp.jsonDecode(v1105.description);
    end;
    if v1105.tooltip_text ~= nil then
        v1106.tooltip_text = v5.StringProp.jsonDecode(v1105.tooltip_text);
    end;
    if v1105.tooltipText ~= nil then
        v1106.tooltip_text = v5.StringProp.jsonDecode(v1105.tooltipText);
    end;
    return v1106;
end;
v7.descriptor = {
    name = "OpenMarketplaceCatalogSeeAll_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenMarketplaceCatalogSeeAll_Params = v7;
v1.default:register(v2.OpenMarketplaceCatalogSeeAll_Params);
v7 = {};
v7.__index = v7;
local l_v7_47 = v7 --[[ copy: 7 -> 55 ]];
v7.new = function(v1108) --[[ Line: 8355 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_47 (copy)
    return (setmetatable({
        action_type = if not (v1108 ~= nil) or v1108.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1108.action_type, 
        action_params = if not (v1108 ~= nil) or v1108.action_params == nil then nil else v1108.action_params
    }, l_v7_47));
end;
v7.encode = function(v1109) --[[ Line: 8366 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1110 = buffer.create(0);
    local v1111 = 0;
    if v1109.action_type ~= nil and (v1109.action_type ~= nil and v1109.action_type ~= 0 or v1109.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1112, v1113 = v0.writeTag(v1110, v1111, 1, v0.wireTypes.varint);
        v1112, v1113 = v0.writeVarInt(v1112, v1113, v2.ActionType.toNumber(v1109.action_type));
        v1110 = v1112;
        v1111 = v1113;
    end;
    if v1109.action_params ~= nil then
        local v1114 = v1109.action_params:encode();
        local v1115, v1116 = v0.writeTag(v1110, v1111, 2, v0.wireTypes.lengthDelimited);
        v1115, v1116 = v0.writeBuffer(v1115, v1116, v1114, buffer.len(v1114));
        v1110 = v1115;
        v1111 = v1116;
    end;
    local v1117 = buffer.create(v1111);
    buffer.copy(v1117, 0, v1110, 0, v1111);
    return v1117;
end;
v7.decode = function(v1118) --[[ Line: 8392 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_47 (copy), v0 (copy), v2 (copy)
    local v1119 = l_v7_47.new();
    local v1120 = 0;
    while v1120 < buffer.len(v1118) do
        local v1121 = nil;
        local v1122 = nil;
        local v1123, v1124, v1125 = v0.readTag(v1118, v1120);
        v1121 = v1123;
        v1122 = v1124;
        v1120 = v1125;
        if v1122 == v0.wireTypes.varint then
            if v1121 == 1 then
                v1123 = nil;
                v1124, v1125 = v0.readVarIntI32(v1118, v1120);
                v1123 = v1124;
                v1120 = v1125;
                v1119.action_type = v2.ActionType.fromNumber(v1123) or v1123;
            else
                v1123 = nil;
                v1124, v1125 = v0.readVarInt(v1118, v1120);
                v1123 = v1124;
                v1120 = v1125;
            end;
        elseif v1122 == v0.wireTypes.lengthDelimited then
            if v1121 == 2 then
                v1123 = nil;
                v1124, v1125 = v0.readBuffer(v1118, v1120);
                v1123 = v1124;
                v1120 = v1125;
                v1119.action_params = v2.CloseMarketplaceCategoryTooltip_Params.decode(v1123);
            else
                v1123 = nil;
                v1124, v1125 = v0.readVarInt(v1118, v1120);
                v1120 = v1125 + v1124;
            end;
        elseif v1122 == v0.wireTypes.i32 then
            v1123 = nil;
            v1124, v1125 = v0.readFixed32(v1118, v1120);
            v1123 = v1124;
            v1120 = v1125;
        elseif v1122 == v0.wireTypes.i64 then
            v1123 = nil;
            v1124, v1125 = v0.readFixed64(v1118, v1120);
            v1123 = v1124;
            v1120 = v1125;
        else
            error("Unsupported wire type: " .. v1122);
        end;
    end;
    return v1119;
end;
v7.jsonEncode = function(v1126) --[[ Line: 8440 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1127 = {};
    if v1126.action_type ~= nil and (v1126.action_type ~= nil and v1126.action_type ~= 0 or v1126.action_type ~= v2.ActionType.fromNumber(0)) then
        v1127.actionType = if typeof(v1126.action_type) == "number" then v1126.action_type else v2.ActionType.toNumber(v1126.action_type);
    end;
    if v1126.action_params ~= nil then
        v1127.actionParams = v1126.action_params:jsonEncode();
    end;
    return v1127;
end;
v7.jsonDecode = function(v1128) --[[ Line: 8462 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_47 (copy), v2 (copy)
    local v1129 = l_v7_47.new();
    if v1128.action_type ~= nil then
        v1129.action_type = if typeof(v1128.action_type) == "number" then v2.ActionType.fromNumber(v1128.action_type) or v1128.action_type else v2.ActionType.fromName(v1128.action_type) or v1128.action_type;
    end;
    if v1128.actionType ~= nil then
        v1129.action_type = if typeof(v1128.actionType) == "number" then v2.ActionType.fromNumber(v1128.actionType) or v1128.actionType else v2.ActionType.fromName(v1128.actionType) or v1128.actionType;
    end;
    if v1128.action_params ~= nil then
        v1129.action_params = v2.CloseMarketplaceCategoryTooltip_Params.jsonDecode(v1128.action_params);
    end;
    if v1128.actionParams ~= nil then
        v1129.action_params = v2.CloseMarketplaceCategoryTooltip_Params.jsonDecode(v1128.actionParams);
    end;
    return v1129;
end;
v7.descriptor = {
    name = "CloseMarketplaceCategoryTooltip", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CloseMarketplaceCategoryTooltip"
};
v2.CloseMarketplaceCategoryTooltip = v7;
v1.default:register(v2.CloseMarketplaceCategoryTooltip);
v7 = {};
v7.__index = v7;
local l_v7_48 = v7 --[[ copy: 7 -> 56 ]];
v7.new = function(v1131) --[[ Line: 8502 ]] --[[ Name: new ]]
    -- upvalues: l_v7_48 (copy)
    return (setmetatable({
        tooltip_id = if not (v1131 ~= nil) or v1131.tooltip_id == nil then nil else v1131.tooltip_id
    }, l_v7_48));
end;
v7.encode = function(v1132) --[[ Line: 8510 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1133 = buffer.create(0);
    local v1134 = 0;
    if v1132.tooltip_id ~= nil then
        local v1135 = v1132.tooltip_id:encode();
        local v1136, v1137 = v0.writeTag(v1133, v1134, 1, v0.wireTypes.lengthDelimited);
        v1136, v1137 = v0.writeBuffer(v1136, v1137, v1135, buffer.len(v1135));
        v1133 = v1136;
        v1134 = v1137;
    end;
    local v1138 = buffer.create(v1134);
    buffer.copy(v1138, 0, v1133, 0, v1134);
    return v1138;
end;
v7.decode = function(v1139) --[[ Line: 8525 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_48 (copy), v0 (copy), v5 (copy)
    local v1140 = l_v7_48.new();
    local v1141 = 0;
    while v1141 < buffer.len(v1139) do
        local v1142 = nil;
        local v1143 = nil;
        local v1144, v1145, v1146 = v0.readTag(v1139, v1141);
        v1142 = v1144;
        v1143 = v1145;
        v1141 = v1146;
        if v1143 == v0.wireTypes.varint then
            v1144 = nil;
            v1145, v1146 = v0.readVarInt(v1139, v1141);
            v1144 = v1145;
            v1141 = v1146;
        elseif v1143 == v0.wireTypes.lengthDelimited then
            if v1142 == 1 then
                v1144 = nil;
                v1145, v1146 = v0.readBuffer(v1139, v1141);
                v1144 = v1145;
                v1141 = v1146;
                v1140.tooltip_id = v5.StringProp.decode(v1144);
            else
                v1144 = nil;
                v1145, v1146 = v0.readVarInt(v1139, v1141);
                v1141 = v1146 + v1145;
            end;
        elseif v1143 == v0.wireTypes.i32 then
            v1144 = nil;
            v1145, v1146 = v0.readFixed32(v1139, v1141);
            v1144 = v1145;
            v1141 = v1146;
        elseif v1143 == v0.wireTypes.i64 then
            v1144 = nil;
            v1145, v1146 = v0.readFixed64(v1139, v1141);
            v1144 = v1145;
            v1141 = v1146;
        else
            error("Unsupported wire type: " .. v1143);
        end;
    end;
    return v1140;
end;
v7.jsonEncode = function(v1147) --[[ Line: 8568 ]] --[[ Name: jsonEncode ]]
    local v1148 = {};
    if v1147.tooltip_id ~= nil then
        v1148.tooltipId = v1147.tooltip_id:jsonEncode();
    end;
    return v1148;
end;
v7.jsonDecode = function(v1149) --[[ Line: 8578 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_48 (copy), v5 (copy)
    local v1150 = l_v7_48.new();
    if v1149.tooltip_id ~= nil then
        v1150.tooltip_id = v5.StringProp.jsonDecode(v1149.tooltip_id);
    end;
    if v1149.tooltipId ~= nil then
        v1150.tooltip_id = v5.StringProp.jsonDecode(v1149.tooltipId);
    end;
    return v1150;
end;
v7.descriptor = {
    name = "CloseMarketplaceCategoryTooltip_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.CloseMarketplaceCategoryTooltip_Params = v7;
v1.default:register(v2.CloseMarketplaceCategoryTooltip_Params);
v7 = {};
v7.__index = v7;
local l_v7_49 = v7 --[[ copy: 7 -> 57 ]];
v7.new = function(v1152) --[[ Line: 8608 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_49 (copy)
    return (setmetatable({
        action_type = if not (v1152 ~= nil) or v1152.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1152.action_type, 
        action_params = if not (v1152 ~= nil) or v1152.action_params == nil then nil else v1152.action_params
    }, l_v7_49));
end;
v7.encode = function(v1153) --[[ Line: 8617 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1154 = buffer.create(0);
    local v1155 = 0;
    if v1153.action_type ~= nil and (v1153.action_type ~= nil and v1153.action_type ~= 0 or v1153.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1156, v1157 = v0.writeTag(v1154, v1155, 1, v0.wireTypes.varint);
        v1156, v1157 = v0.writeVarInt(v1156, v1157, v2.ActionType.toNumber(v1153.action_type));
        v1154 = v1156;
        v1155 = v1157;
    end;
    if v1153.action_params ~= nil then
        local v1158 = v1153.action_params:encode();
        local v1159, v1160 = v0.writeTag(v1154, v1155, 2, v0.wireTypes.lengthDelimited);
        v1159, v1160 = v0.writeBuffer(v1159, v1160, v1158, buffer.len(v1158));
        v1154 = v1159;
        v1155 = v1160;
    end;
    local v1161 = buffer.create(v1155);
    buffer.copy(v1161, 0, v1154, 0, v1155);
    return v1161;
end;
v7.decode = function(v1162) --[[ Line: 8643 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_49 (copy), v0 (copy), v2 (copy)
    local v1163 = l_v7_49.new();
    local v1164 = 0;
    while v1164 < buffer.len(v1162) do
        local v1165 = nil;
        local v1166 = nil;
        local v1167, v1168, v1169 = v0.readTag(v1162, v1164);
        v1165 = v1167;
        v1166 = v1168;
        v1164 = v1169;
        if v1166 == v0.wireTypes.varint then
            if v1165 == 1 then
                v1167 = nil;
                v1168, v1169 = v0.readVarIntI32(v1162, v1164);
                v1167 = v1168;
                v1164 = v1169;
                v1163.action_type = v2.ActionType.fromNumber(v1167) or v1167;
            else
                v1167 = nil;
                v1168, v1169 = v0.readVarInt(v1162, v1164);
                v1167 = v1168;
                v1164 = v1169;
            end;
        elseif v1166 == v0.wireTypes.lengthDelimited then
            if v1165 == 2 then
                v1167 = nil;
                v1168, v1169 = v0.readBuffer(v1162, v1164);
                v1167 = v1168;
                v1164 = v1169;
                v1163.action_params = v2.ResizeMarketplaceCatalog_Params.decode(v1167);
            else
                v1167 = nil;
                v1168, v1169 = v0.readVarInt(v1162, v1164);
                v1164 = v1169 + v1168;
            end;
        elseif v1166 == v0.wireTypes.i32 then
            v1167 = nil;
            v1168, v1169 = v0.readFixed32(v1162, v1164);
            v1167 = v1168;
            v1164 = v1169;
        elseif v1166 == v0.wireTypes.i64 then
            v1167 = nil;
            v1168, v1169 = v0.readFixed64(v1162, v1164);
            v1167 = v1168;
            v1164 = v1169;
        else
            error("Unsupported wire type: " .. v1166);
        end;
    end;
    return v1163;
end;
v7.jsonEncode = function(v1170) --[[ Line: 8691 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1171 = {};
    if v1170.action_type ~= nil and (v1170.action_type ~= nil and v1170.action_type ~= 0 or v1170.action_type ~= v2.ActionType.fromNumber(0)) then
        v1171.actionType = if typeof(v1170.action_type) == "number" then v1170.action_type else v2.ActionType.toNumber(v1170.action_type);
    end;
    if v1170.action_params ~= nil then
        v1171.actionParams = v1170.action_params:jsonEncode();
    end;
    return v1171;
end;
v7.jsonDecode = function(v1172) --[[ Line: 8713 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_49 (copy), v2 (copy)
    local v1173 = l_v7_49.new();
    if v1172.action_type ~= nil then
        v1173.action_type = if typeof(v1172.action_type) == "number" then v2.ActionType.fromNumber(v1172.action_type) or v1172.action_type else v2.ActionType.fromName(v1172.action_type) or v1172.action_type;
    end;
    if v1172.actionType ~= nil then
        v1173.action_type = if typeof(v1172.actionType) == "number" then v2.ActionType.fromNumber(v1172.actionType) or v1172.actionType else v2.ActionType.fromName(v1172.actionType) or v1172.actionType;
    end;
    if v1172.action_params ~= nil then
        v1173.action_params = v2.ResizeMarketplaceCatalog_Params.jsonDecode(v1172.action_params);
    end;
    if v1172.actionParams ~= nil then
        v1173.action_params = v2.ResizeMarketplaceCatalog_Params.jsonDecode(v1172.actionParams);
    end;
    return v1173;
end;
v7.descriptor = {
    name = "ResizeMarketplaceCatalog", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ResizeMarketplaceCatalog"
};
v2.ResizeMarketplaceCatalog = v7;
v1.default:register(v2.ResizeMarketplaceCatalog);
v7 = {};
v7.__index = v7;
local l_v7_50 = v7 --[[ copy: 7 -> 58 ]];
v7.new = function(v1175) --[[ Line: 8753 ]] --[[ Name: new ]]
    -- upvalues: l_v7_50 (copy)
    return (setmetatable({
        category_id = if not (v1175 ~= nil) or v1175.category_id == nil then nil else v1175.category_id, 
        subcategory_id = if not (v1175 ~= nil) or v1175.subcategory_id == nil then nil else v1175.subcategory_id, 
        screen_size = if not (v1175 ~= nil) or v1175.screen_size == nil then nil else v1175.screen_size
    }, l_v7_50));
end;
v7.encode = function(v1176) --[[ Line: 8763 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1177 = buffer.create(0);
    local v1178 = 0;
    if v1176.category_id ~= nil then
        local v1179 = v1176.category_id:encode();
        local v1180, v1181 = v0.writeTag(v1177, v1178, 1, v0.wireTypes.lengthDelimited);
        v1180, v1181 = v0.writeBuffer(v1180, v1181, v1179, buffer.len(v1179));
        v1177 = v1180;
        v1178 = v1181;
    end;
    if v1176.subcategory_id ~= nil then
        local v1182 = v1176.subcategory_id:encode();
        local v1183, v1184 = v0.writeTag(v1177, v1178, 2, v0.wireTypes.lengthDelimited);
        v1183, v1184 = v0.writeBuffer(v1183, v1184, v1182, buffer.len(v1182));
        v1177 = v1183;
        v1178 = v1184;
    end;
    if v1176.screen_size ~= nil then
        local v1185 = v1176.screen_size:encode();
        local v1186, v1187 = v0.writeTag(v1177, v1178, 3, v0.wireTypes.lengthDelimited);
        v1186, v1187 = v0.writeBuffer(v1186, v1187, v1185, buffer.len(v1185));
        v1177 = v1186;
        v1178 = v1187;
    end;
    local v1188 = buffer.create(v1178);
    buffer.copy(v1188, 0, v1177, 0, v1178);
    return v1188;
end;
v7.decode = function(v1189) --[[ Line: 8790 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_50 (copy), v0 (copy), v5 (copy)
    local v1190 = l_v7_50.new();
    local v1191 = 0;
    while v1191 < buffer.len(v1189) do
        local v1192 = nil;
        local v1193 = nil;
        local v1194, v1195, v1196 = v0.readTag(v1189, v1191);
        v1192 = v1194;
        v1193 = v1195;
        v1191 = v1196;
        if v1193 == v0.wireTypes.varint then
            v1194 = nil;
            v1195, v1196 = v0.readVarInt(v1189, v1191);
            v1194 = v1195;
            v1191 = v1196;
        elseif v1193 == v0.wireTypes.lengthDelimited then
            if v1192 == 1 then
                v1194 = nil;
                v1195, v1196 = v0.readBuffer(v1189, v1191);
                v1194 = v1195;
                v1191 = v1196;
                v1190.category_id = v5.StringProp.decode(v1194);
            elseif v1192 == 2 then
                v1194 = nil;
                v1195, v1196 = v0.readBuffer(v1189, v1191);
                v1194 = v1195;
                v1191 = v1196;
                v1190.subcategory_id = v5.StringProp.decode(v1194);
            elseif v1192 == 3 then
                v1194 = nil;
                v1195, v1196 = v0.readBuffer(v1189, v1191);
                v1194 = v1195;
                v1191 = v1196;
                v1190.screen_size = v5.StringProp.decode(v1194);
            else
                v1194 = nil;
                v1195, v1196 = v0.readVarInt(v1189, v1191);
                v1191 = v1196 + v1195;
            end;
        elseif v1193 == v0.wireTypes.i32 then
            v1194 = nil;
            v1195, v1196 = v0.readFixed32(v1189, v1191);
            v1194 = v1195;
            v1191 = v1196;
        elseif v1193 == v0.wireTypes.i64 then
            v1194 = nil;
            v1195, v1196 = v0.readFixed64(v1189, v1191);
            v1194 = v1195;
            v1191 = v1196;
        else
            error("Unsupported wire type: " .. v1193);
        end;
    end;
    return v1190;
end;
v7.jsonEncode = function(v1197) --[[ Line: 8843 ]] --[[ Name: jsonEncode ]]
    local v1198 = {};
    if v1197.category_id ~= nil then
        v1198.categoryId = v1197.category_id:jsonEncode();
    end;
    if v1197.subcategory_id ~= nil then
        v1198.subcategoryId = v1197.subcategory_id:jsonEncode();
    end;
    if v1197.screen_size ~= nil then
        v1198.screenSize = v1197.screen_size:jsonEncode();
    end;
    return v1198;
end;
v7.jsonDecode = function(v1199) --[[ Line: 8861 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_50 (copy), v5 (copy)
    local v1200 = l_v7_50.new();
    if v1199.category_id ~= nil then
        v1200.category_id = v5.StringProp.jsonDecode(v1199.category_id);
    end;
    if v1199.categoryId ~= nil then
        v1200.category_id = v5.StringProp.jsonDecode(v1199.categoryId);
    end;
    if v1199.subcategory_id ~= nil then
        v1200.subcategory_id = v5.StringProp.jsonDecode(v1199.subcategory_id);
    end;
    if v1199.subcategoryId ~= nil then
        v1200.subcategory_id = v5.StringProp.jsonDecode(v1199.subcategoryId);
    end;
    if v1199.screen_size ~= nil then
        v1200.screen_size = v5.StringProp.jsonDecode(v1199.screen_size);
    end;
    if v1199.screenSize ~= nil then
        v1200.screen_size = v5.StringProp.jsonDecode(v1199.screenSize);
    end;
    return v1200;
end;
v7.descriptor = {
    name = "ResizeMarketplaceCatalog_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.ResizeMarketplaceCatalog_Params = v7;
v1.default:register(v2.ResizeMarketplaceCatalog_Params);
v7 = {};
v7.__index = v7;
local l_v7_51 = v7 --[[ copy: 7 -> 59 ]];
v7.new = function(v1202) --[[ Line: 8909 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_51 (copy)
    return (setmetatable({
        action_type = if not (v1202 ~= nil) or v1202.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1202.action_type, 
        action_params = if not (v1202 ~= nil) or v1202.action_params == nil then nil else v1202.action_params
    }, l_v7_51));
end;
v7.encode = function(v1203) --[[ Line: 8920 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1204 = buffer.create(0);
    local v1205 = 0;
    if v1203.action_type ~= nil and (v1203.action_type ~= nil and v1203.action_type ~= 0 or v1203.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1206, v1207 = v0.writeTag(v1204, v1205, 1, v0.wireTypes.varint);
        v1206, v1207 = v0.writeVarInt(v1206, v1207, v2.ActionType.toNumber(v1203.action_type));
        v1204 = v1206;
        v1205 = v1207;
    end;
    if v1203.action_params ~= nil then
        local v1208 = v1203.action_params:encode();
        local v1209, v1210 = v0.writeTag(v1204, v1205, 2, v0.wireTypes.lengthDelimited);
        v1209, v1210 = v0.writeBuffer(v1209, v1210, v1208, buffer.len(v1208));
        v1204 = v1209;
        v1205 = v1210;
    end;
    local v1211 = buffer.create(v1205);
    buffer.copy(v1211, 0, v1204, 0, v1205);
    return v1211;
end;
v7.decode = function(v1212) --[[ Line: 8946 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_51 (copy), v0 (copy), v2 (copy)
    local v1213 = l_v7_51.new();
    local v1214 = 0;
    while v1214 < buffer.len(v1212) do
        local v1215 = nil;
        local v1216 = nil;
        local v1217, v1218, v1219 = v0.readTag(v1212, v1214);
        v1215 = v1217;
        v1216 = v1218;
        v1214 = v1219;
        if v1216 == v0.wireTypes.varint then
            if v1215 == 1 then
                v1217 = nil;
                v1218, v1219 = v0.readVarIntI32(v1212, v1214);
                v1217 = v1218;
                v1214 = v1219;
                v1213.action_type = v2.ActionType.fromNumber(v1217) or v1217;
            else
                v1217 = nil;
                v1218, v1219 = v0.readVarInt(v1212, v1214);
                v1217 = v1218;
                v1214 = v1219;
            end;
        elseif v1216 == v0.wireTypes.lengthDelimited then
            if v1215 == 2 then
                v1217 = nil;
                v1218, v1219 = v0.readBuffer(v1212, v1214);
                v1217 = v1218;
                v1214 = v1219;
                v1213.action_params = v2.OpenMarketplaceCatalogFilters_Params.decode(v1217);
            else
                v1217 = nil;
                v1218, v1219 = v0.readVarInt(v1212, v1214);
                v1214 = v1219 + v1218;
            end;
        elseif v1216 == v0.wireTypes.i32 then
            v1217 = nil;
            v1218, v1219 = v0.readFixed32(v1212, v1214);
            v1217 = v1218;
            v1214 = v1219;
        elseif v1216 == v0.wireTypes.i64 then
            v1217 = nil;
            v1218, v1219 = v0.readFixed64(v1212, v1214);
            v1217 = v1218;
            v1214 = v1219;
        else
            error("Unsupported wire type: " .. v1216);
        end;
    end;
    return v1213;
end;
v7.jsonEncode = function(v1220) --[[ Line: 8994 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1221 = {};
    if v1220.action_type ~= nil and (v1220.action_type ~= nil and v1220.action_type ~= 0 or v1220.action_type ~= v2.ActionType.fromNumber(0)) then
        v1221.actionType = if typeof(v1220.action_type) == "number" then v1220.action_type else v2.ActionType.toNumber(v1220.action_type);
    end;
    if v1220.action_params ~= nil then
        v1221.actionParams = v1220.action_params:jsonEncode();
    end;
    return v1221;
end;
v7.jsonDecode = function(v1222) --[[ Line: 9016 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_51 (copy), v2 (copy)
    local v1223 = l_v7_51.new();
    if v1222.action_type ~= nil then
        v1223.action_type = if typeof(v1222.action_type) == "number" then v2.ActionType.fromNumber(v1222.action_type) or v1222.action_type else v2.ActionType.fromName(v1222.action_type) or v1222.action_type;
    end;
    if v1222.actionType ~= nil then
        v1223.action_type = if typeof(v1222.actionType) == "number" then v2.ActionType.fromNumber(v1222.actionType) or v1222.actionType else v2.ActionType.fromName(v1222.actionType) or v1222.actionType;
    end;
    if v1222.action_params ~= nil then
        v1223.action_params = v2.OpenMarketplaceCatalogFilters_Params.jsonDecode(v1222.action_params);
    end;
    if v1222.actionParams ~= nil then
        v1223.action_params = v2.OpenMarketplaceCatalogFilters_Params.jsonDecode(v1222.actionParams);
    end;
    return v1223;
end;
v7.descriptor = {
    name = "OpenMarketplaceCatalogFilters", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceCatalogFilters"
};
v2.OpenMarketplaceCatalogFilters = v7;
v1.default:register(v2.OpenMarketplaceCatalogFilters);
v7 = {};
v7.__index = v7;
local l_v7_52 = v7 --[[ copy: 7 -> 60 ]];
v7.new = function(_) --[[ Line: 9056 ]] --[[ Name: new ]]
    -- upvalues: l_v7_52 (copy)
    return (setmetatable({}, l_v7_52));
end;
v7.encode = function(_) --[[ Line: 9062 ]] --[[ Name: encode ]]
    local v1227 = buffer.create(0);
    local v1228 = buffer.create(0);
    buffer.copy(v1228, 0, v1227, 0, 0);
    return v1228;
end;
v7.decode = function(v1229) --[[ Line: 9071 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_52 (copy), v0 (copy)
    local v1230 = l_v7_52.new();
    local v1231 = 0;
    while v1231 < buffer.len(v1229) do
        local v1232 = nil;
        local v1233 = nil;
        local v1234, v1235, v1236 = v0.readTag(v1229, v1231);
        v1232 = v1234;
        v1233 = v1235;
        v1231 = v1236;
        if v1233 == v0.wireTypes.varint then
            v1234 = nil;
            v1235, v1236 = v0.readVarInt(v1229, v1231);
            v1234 = v1235;
            v1231 = v1236;
        elseif v1233 == v0.wireTypes.lengthDelimited then
            v1234 = nil;
            v1235, v1236 = v0.readVarInt(v1229, v1231);
            v1231 = v1236 + v1235;
        elseif v1233 == v0.wireTypes.i32 then
            v1234 = nil;
            v1235, v1236 = v0.readFixed32(v1229, v1231);
            v1234 = v1235;
            v1231 = v1236;
        elseif v1233 == v0.wireTypes.i64 then
            v1234 = nil;
            v1235, v1236 = v0.readFixed64(v1229, v1231);
            v1234 = v1235;
            v1231 = v1236;
        else
            error("Unsupported wire type: " .. v1233);
        end;
    end;
    return v1230;
end;
v7.jsonEncode = function(_) --[[ Line: 9109 ]] --[[ Name: jsonEncode ]]
    return {};
end;
v7.jsonDecode = function(_) --[[ Line: 9115 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_52 (copy)
    return (l_v7_52.new());
end;
v7.descriptor = {
    name = "OpenMarketplaceCatalogFilters_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenMarketplaceCatalogFilters_Params = v7;
v1.default:register(v2.OpenMarketplaceCatalogFilters_Params);
v7 = {};
v7.__index = v7;
local l_v7_53 = v7 --[[ copy: 7 -> 61 ]];
v7.new = function(v1240) --[[ Line: 9137 ]] --[[ Name: new ]]
    -- upvalues: l_v7_53 (copy)
    return (setmetatable({
        kind = if not (v1240 ~= nil) or v1240.kind == nil then nil else v1240.kind
    }, l_v7_53));
end;
v7.encode = function(v1241) --[[ Line: 9143 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1242 = buffer.create(0);
    local v1243 = 0;
    if v1241.kind ~= nil then
        if v1241.kind.type == "dismiss_dialog_action" then
            local v1244 = v1241.kind.value:encode();
            local v1245, v1246 = v0.writeTag(v1242, v1243, 1, v0.wireTypes.lengthDelimited);
            v1245, v1246 = v0.writeBuffer(v1245, v1246, v1244, buffer.len(v1244));
            v1242 = v1245;
            v1243 = v1246;
        elseif v1241.kind.type == "link_action" then
            local v1247 = v1241.kind.value:encode();
            local v1248, v1249 = v0.writeTag(v1242, v1243, 2, v0.wireTypes.lengthDelimited);
            v1248, v1249 = v0.writeBuffer(v1248, v1249, v1247, buffer.len(v1247));
            v1242 = v1248;
            v1243 = v1249;
        elseif v1241.kind.type == "open_game_details_action" then
            local v1250 = v1241.kind.value:encode();
            local v1251, v1252 = v0.writeTag(v1242, v1243, 3, v0.wireTypes.lengthDelimited);
            v1251, v1252 = v0.writeBuffer(v1251, v1252, v1250, buffer.len(v1250));
            v1242 = v1251;
            v1243 = v1252;
        elseif v1241.kind.type == "open_join_friends_action" then
            local v1253 = v1241.kind.value:encode();
            local v1254, v1255 = v0.writeTag(v1242, v1243, 4, v0.wireTypes.lengthDelimited);
            v1254, v1255 = v0.writeBuffer(v1254, v1255, v1253, buffer.len(v1253));
            v1242 = v1254;
            v1243 = v1255;
        elseif v1241.kind.type == "open_marketplace_try_on_action" then
            local v1256 = v1241.kind.value:encode();
            local v1257, v1258 = v0.writeTag(v1242, v1243, 5, v0.wireTypes.lengthDelimited);
            v1257, v1258 = v0.writeBuffer(v1257, v1258, v1256, buffer.len(v1256));
            v1242 = v1257;
            v1243 = v1258;
        elseif v1241.kind.type == "open_see_all_action" then
            local v1259 = v1241.kind.value:encode();
            local v1260, v1261 = v0.writeTag(v1242, v1243, 6, v0.wireTypes.lengthDelimited);
            v1260, v1261 = v0.writeBuffer(v1260, v1261, v1259, buffer.len(v1259));
            v1242 = v1260;
            v1243 = v1261;
        elseif v1241.kind.type == "open_sponsored_tooltip_action" then
            local v1262 = v1241.kind.value:encode();
            local v1263, v1264 = v0.writeTag(v1242, v1243, 7, v0.wireTypes.lengthDelimited);
            v1263, v1264 = v0.writeBuffer(v1263, v1264, v1262, buffer.len(v1262));
            v1242 = v1263;
            v1243 = v1264;
        elseif v1241.kind.type == "play_button_click_action" then
            local v1265 = v1241.kind.value:encode();
            local v1266, v1267 = v0.writeTag(v1242, v1243, 8, v0.wireTypes.lengthDelimited);
            v1266, v1267 = v0.writeBuffer(v1266, v1267, v1265, buffer.len(v1265));
            v1242 = v1266;
            v1243 = v1267;
        elseif v1241.kind.type == "update_user_settings_action" then
            local v1268 = v1241.kind.value:encode();
            local v1269, v1270 = v0.writeTag(v1242, v1243, 9, v0.wireTypes.lengthDelimited);
            v1269, v1270 = v0.writeBuffer(v1269, v1270, v1268, buffer.len(v1268));
            v1242 = v1269;
            v1243 = v1270;
        elseif v1241.kind.type == "open_tooltip_action" then
            local v1271 = v1241.kind.value:encode();
            local v1272, v1273 = v0.writeTag(v1242, v1243, 10, v0.wireTypes.lengthDelimited);
            v1272, v1273 = v0.writeBuffer(v1272, v1273, v1271, buffer.len(v1271));
            v1242 = v1272;
            v1243 = v1273;
        elseif v1241.kind.type == "open_badge_details_action" then
            local v1274 = v1241.kind.value:encode();
            local v1275, v1276 = v0.writeTag(v1242, v1243, 11, v0.wireTypes.lengthDelimited);
            v1275, v1276 = v0.writeBuffer(v1275, v1276, v1274, buffer.len(v1274));
            v1242 = v1275;
            v1243 = v1276;
        elseif v1241.kind.type == "load_more_from_api_action" then
            local v1277 = v1241.kind.value:encode();
            local v1278, v1279 = v0.writeTag(v1242, v1243, 12, v0.wireTypes.lengthDelimited);
            v1278, v1279 = v0.writeBuffer(v1278, v1279, v1277, buffer.len(v1277));
            v1242 = v1278;
            v1243 = v1279;
        elseif v1241.kind.type == "share_action" then
            local v1280 = v1241.kind.value:encode();
            local v1281, v1282 = v0.writeTag(v1242, v1243, 13, v0.wireTypes.lengthDelimited);
            v1281, v1282 = v0.writeBuffer(v1281, v1282, v1280, buffer.len(v1280));
            v1242 = v1281;
            v1243 = v1282;
        elseif v1241.kind.type == "open_abuse_report_action" then
            local v1283 = v1241.kind.value:encode();
            local v1284, v1285 = v0.writeTag(v1242, v1243, 14, v0.wireTypes.lengthDelimited);
            v1284, v1285 = v0.writeBuffer(v1284, v1285, v1283, buffer.len(v1283));
            v1242 = v1284;
            v1243 = v1285;
        elseif v1241.kind.type == "remove_badge_from_inventory_action" then
            local v1286 = v1241.kind.value:encode();
            local v1287, v1288 = v0.writeTag(v1242, v1243, 15, v0.wireTypes.lengthDelimited);
            v1287, v1288 = v0.writeBuffer(v1287, v1288, v1286, buffer.len(v1286));
            v1242 = v1287;
            v1243 = v1288;
        elseif v1241.kind.type == "open_profile_action" then
            local v1289 = v1241.kind.value:encode();
            local v1290, v1291 = v0.writeTag(v1242, v1243, 16, v0.wireTypes.lengthDelimited);
            v1290, v1291 = v0.writeBuffer(v1290, v1291, v1289, buffer.len(v1289));
            v1242 = v1290;
            v1243 = v1291;
        elseif v1241.kind.type == "open_facial_age_estimation_action" then
            local v1292 = v1241.kind.value:encode();
            local v1293, v1294 = v0.writeTag(v1242, v1243, 17, v0.wireTypes.lengthDelimited);
            v1293, v1294 = v0.writeBuffer(v1293, v1294, v1292, buffer.len(v1292));
            v1242 = v1293;
            v1243 = v1294;
        elseif v1241.kind.type == "open_add_connections_page_action" then
            local v1295 = v1241.kind.value:encode();
            local v1296, v1297 = v0.writeTag(v1242, v1243, 18, v0.wireTypes.lengthDelimited);
            v1296, v1297 = v0.writeBuffer(v1296, v1297, v1295, buffer.len(v1295));
            v1242 = v1296;
            v1243 = v1297;
        elseif v1241.kind.type == "open_marketplace_action" then
            local v1298 = v1241.kind.value:encode();
            local v1299, v1300 = v0.writeTag(v1242, v1243, 19, v0.wireTypes.lengthDelimited);
            v1299, v1300 = v0.writeBuffer(v1299, v1300, v1298, buffer.len(v1298));
            v1242 = v1299;
            v1243 = v1300;
        elseif v1241.kind.type == "hide_profile_completion_action" then
            local v1301 = v1241.kind.value:encode();
            local v1302, v1303 = v0.writeTag(v1242, v1243, 20, v0.wireTypes.lengthDelimited);
            v1302, v1303 = v0.writeBuffer(v1302, v1303, v1301, buffer.len(v1301));
            v1242 = v1302;
            v1243 = v1303;
        elseif v1241.kind.type == "select_marketplace_catalog_category" then
            local v1304 = v1241.kind.value:encode();
            local v1305, v1306 = v0.writeTag(v1242, v1243, 21, v0.wireTypes.lengthDelimited);
            v1305, v1306 = v0.writeBuffer(v1305, v1306, v1304, buffer.len(v1304));
            v1242 = v1305;
            v1243 = v1306;
        elseif v1241.kind.type == "select_marketplace_catalog_subcategory" then
            local v1307 = v1241.kind.value:encode();
            local v1308, v1309 = v0.writeTag(v1242, v1243, 22, v0.wireTypes.lengthDelimited);
            v1308, v1309 = v0.writeBuffer(v1308, v1309, v1307, buffer.len(v1307));
            v1242 = v1308;
            v1243 = v1309;
        elseif v1241.kind.type == "open_marketplace_catalog_see_all" then
            local v1310 = v1241.kind.value:encode();
            local v1311, v1312 = v0.writeTag(v1242, v1243, 23, v0.wireTypes.lengthDelimited);
            v1311, v1312 = v0.writeBuffer(v1311, v1312, v1310, buffer.len(v1310));
            v1242 = v1311;
            v1243 = v1312;
        elseif v1241.kind.type == "close_marketplace_category_tooltip" then
            local v1313 = v1241.kind.value:encode();
            local v1314, v1315 = v0.writeTag(v1242, v1243, 24, v0.wireTypes.lengthDelimited);
            v1314, v1315 = v0.writeBuffer(v1314, v1315, v1313, buffer.len(v1313));
            v1242 = v1314;
            v1243 = v1315;
        elseif v1241.kind.type == "resize_marketplace_catalog" then
            local v1316 = v1241.kind.value:encode();
            local v1317, v1318 = v0.writeTag(v1242, v1243, 25, v0.wireTypes.lengthDelimited);
            v1317, v1318 = v0.writeBuffer(v1317, v1318, v1316, buffer.len(v1316));
            v1242 = v1317;
            v1243 = v1318;
        elseif v1241.kind.type == "open_marketplace_catalog_filters" then
            local v1319 = v1241.kind.value:encode();
            local v1320, v1321 = v0.writeTag(v1242, v1243, 26, v0.wireTypes.lengthDelimited);
            v1320, v1321 = v0.writeBuffer(v1320, v1321, v1319, buffer.len(v1319));
            v1242 = v1320;
            v1243 = v1321;
        end;
    end;
    local v1322 = buffer.create(v1243);
    buffer.copy(v1322, 0, v1242, 0, v1243);
    return v1322;
end;
v7.decode = function(v1323) --[[ Line: 9260 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_53 (copy), v0 (copy), v2 (copy)
    local v1324 = l_v7_53.new();
    local v1325 = 0;
    while v1325 < buffer.len(v1323) do
        local v1326 = nil;
        local v1327 = nil;
        local v1328, v1329, v1330 = v0.readTag(v1323, v1325);
        v1326 = v1328;
        v1327 = v1329;
        v1325 = v1330;
        if v1327 == v0.wireTypes.varint then
            v1328 = nil;
            v1329, v1330 = v0.readVarInt(v1323, v1325);
            v1328 = v1329;
            v1325 = v1330;
        elseif v1327 == v0.wireTypes.lengthDelimited then
            if v1326 == 1 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "dismiss_dialog_action", 
                    value = v2.DismissDialogAction.decode(v1328)
                };
            elseif v1326 == 2 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "link_action", 
                    value = v2.LinkAction.decode(v1328)
                };
            elseif v1326 == 3 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "open_game_details_action", 
                    value = v2.OpenGameDetailsAction.decode(v1328)
                };
            elseif v1326 == 4 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "open_join_friends_action", 
                    value = v2.OpenJoinFriendsAction.decode(v1328)
                };
            elseif v1326 == 5 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "open_marketplace_try_on_action", 
                    value = v2.OpenMarketplaceTryOnAction.decode(v1328)
                };
            elseif v1326 == 6 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "open_see_all_action", 
                    value = v2.OpenSeeAllAction.decode(v1328)
                };
            elseif v1326 == 7 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "open_sponsored_tooltip_action", 
                    value = v2.OpenSponsoredTooltipAction.decode(v1328)
                };
            elseif v1326 == 8 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "play_button_click_action", 
                    value = v2.PlayButtonClickAction.decode(v1328)
                };
            elseif v1326 == 9 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "update_user_settings_action", 
                    value = v2.UpdateUserSettingsAction.decode(v1328)
                };
            elseif v1326 == 10 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "open_tooltip_action", 
                    value = v2.OpenTooltipAction.decode(v1328)
                };
            elseif v1326 == 11 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "open_badge_details_action", 
                    value = v2.OpenBadgeDetailsAction.decode(v1328)
                };
            elseif v1326 == 12 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "load_more_from_api_action", 
                    value = v2.LoadMoreFromApiAction.decode(v1328)
                };
            elseif v1326 == 13 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "share_action", 
                    value = v2.ShareAction.decode(v1328)
                };
            elseif v1326 == 14 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "open_abuse_report_action", 
                    value = v2.OpenAbuseReportAction.decode(v1328)
                };
            elseif v1326 == 15 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "remove_badge_from_inventory_action", 
                    value = v2.RemoveBadgeFromInventoryAction.decode(v1328)
                };
            elseif v1326 == 16 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "open_profile_action", 
                    value = v2.OpenProfileAction.decode(v1328)
                };
            elseif v1326 == 17 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "open_facial_age_estimation_action", 
                    value = v2.OpenFacialAgeEstimationAction.decode(v1328)
                };
            elseif v1326 == 18 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "open_add_connections_page_action", 
                    value = v2.OpenAddConnectionsPageAction.decode(v1328)
                };
            elseif v1326 == 19 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "open_marketplace_action", 
                    value = v2.OpenMarketplaceAction.decode(v1328)
                };
            elseif v1326 == 20 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "hide_profile_completion_action", 
                    value = v2.HideProfileCompletionAction.decode(v1328)
                };
            elseif v1326 == 21 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "select_marketplace_catalog_category", 
                    value = v2.SelectMarketplaceCatalogCategory.decode(v1328)
                };
            elseif v1326 == 22 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "select_marketplace_catalog_subcategory", 
                    value = v2.SelectMarketplaceCatalogSubcategory.decode(v1328)
                };
            elseif v1326 == 23 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "open_marketplace_catalog_see_all", 
                    value = v2.OpenMarketplaceCatalogSeeAll.decode(v1328)
                };
            elseif v1326 == 24 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "close_marketplace_category_tooltip", 
                    value = v2.CloseMarketplaceCategoryTooltip.decode(v1328)
                };
            elseif v1326 == 25 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "resize_marketplace_catalog", 
                    value = v2.ResizeMarketplaceCatalog.decode(v1328)
                };
            elseif v1326 == 26 then
                v1328 = nil;
                v1329, v1330 = v0.readBuffer(v1323, v1325);
                v1328 = v1329;
                v1325 = v1330;
                v1324.kind = {
                    type = "open_marketplace_catalog_filters", 
                    value = v2.OpenMarketplaceCatalogFilters.decode(v1328)
                };
            else
                v1328 = nil;
                v1329, v1330 = v0.readVarInt(v1323, v1325);
                v1325 = v1330 + v1329;
            end;
        elseif v1327 == v0.wireTypes.i32 then
            v1328 = nil;
            v1329, v1330 = v0.readFixed32(v1323, v1325);
            v1328 = v1329;
            v1325 = v1330;
        elseif v1327 == v0.wireTypes.i64 then
            v1328 = nil;
            v1329, v1330 = v0.readFixed64(v1323, v1325);
            v1328 = v1329;
            v1325 = v1330;
        else
            error("Unsupported wire type: " .. v1327);
        end;
    end;
    return v1324;
end;
v7.jsonEncode = function(v1331) --[[ Line: 9472 ]] --[[ Name: jsonEncode ]]
    local v1332 = {};
    if v1331.kind ~= nil then
        if v1331.kind.type == "dismiss_dialog_action" then
            v1332.dismissDialogAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "link_action" then
            v1332.linkAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "open_game_details_action" then
            v1332.openGameDetailsAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "open_join_friends_action" then
            v1332.openJoinFriendsAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "open_marketplace_try_on_action" then
            v1332.openMarketplaceTryOnAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "open_see_all_action" then
            v1332.openSeeAllAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "open_sponsored_tooltip_action" then
            v1332.openSponsoredTooltipAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "play_button_click_action" then
            v1332.playButtonClickAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "update_user_settings_action" then
            v1332.updateUserSettingsAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "open_tooltip_action" then
            v1332.openTooltipAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "open_badge_details_action" then
            v1332.openBadgeDetailsAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "load_more_from_api_action" then
            v1332.loadMoreFromApiAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "share_action" then
            v1332.shareAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "open_abuse_report_action" then
            v1332.openAbuseReportAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "remove_badge_from_inventory_action" then
            v1332.removeBadgeFromInventoryAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "open_profile_action" then
            v1332.openProfileAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "open_facial_age_estimation_action" then
            v1332.openFacialAgeEstimationAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "open_add_connections_page_action" then
            v1332.openAddConnectionsPageAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "open_marketplace_action" then
            v1332.openMarketplaceAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "hide_profile_completion_action" then
            v1332.hideProfileCompletionAction = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "select_marketplace_catalog_category" then
            v1332.selectMarketplaceCatalogCategory = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "select_marketplace_catalog_subcategory" then
            v1332.selectMarketplaceCatalogSubcategory = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "open_marketplace_catalog_see_all" then
            v1332.openMarketplaceCatalogSeeAll = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "close_marketplace_category_tooltip" then
            v1332.closeMarketplaceCategoryTooltip = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "resize_marketplace_catalog" then
            v1332.resizeMarketplaceCatalog = v1331.kind.value:jsonEncode();
            return v1332;
        elseif v1331.kind.type == "open_marketplace_catalog_filters" then
            v1332.openMarketplaceCatalogFilters = v1331.kind.value:jsonEncode();
        end;
    end;
    return v1332;
end;
v7.jsonDecode = function(v1333) --[[ Line: 9534 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_53 (copy), v2 (copy)
    local v1334 = l_v7_53.new();
    if v1333.dismiss_dialog_action ~= nil then
        v1334.kind = {
            type = "dismiss_dialog_action", 
            value = v2.DismissDialogAction.jsonDecode(v1333.dismiss_dialog_action)
        };
    end;
    if v1333.dismissDialogAction ~= nil then
        v1334.kind = {
            type = "dismiss_dialog_action", 
            value = v2.DismissDialogAction.jsonDecode(v1333.dismissDialogAction)
        };
    end;
    if v1333.link_action ~= nil then
        v1334.kind = {
            type = "link_action", 
            value = v2.LinkAction.jsonDecode(v1333.link_action)
        };
    end;
    if v1333.linkAction ~= nil then
        v1334.kind = {
            type = "link_action", 
            value = v2.LinkAction.jsonDecode(v1333.linkAction)
        };
    end;
    if v1333.open_game_details_action ~= nil then
        v1334.kind = {
            type = "open_game_details_action", 
            value = v2.OpenGameDetailsAction.jsonDecode(v1333.open_game_details_action)
        };
    end;
    if v1333.openGameDetailsAction ~= nil then
        v1334.kind = {
            type = "open_game_details_action", 
            value = v2.OpenGameDetailsAction.jsonDecode(v1333.openGameDetailsAction)
        };
    end;
    if v1333.open_join_friends_action ~= nil then
        v1334.kind = {
            type = "open_join_friends_action", 
            value = v2.OpenJoinFriendsAction.jsonDecode(v1333.open_join_friends_action)
        };
    end;
    if v1333.openJoinFriendsAction ~= nil then
        v1334.kind = {
            type = "open_join_friends_action", 
            value = v2.OpenJoinFriendsAction.jsonDecode(v1333.openJoinFriendsAction)
        };
    end;
    if v1333.open_marketplace_try_on_action ~= nil then
        v1334.kind = {
            type = "open_marketplace_try_on_action", 
            value = v2.OpenMarketplaceTryOnAction.jsonDecode(v1333.open_marketplace_try_on_action)
        };
    end;
    if v1333.openMarketplaceTryOnAction ~= nil then
        v1334.kind = {
            type = "open_marketplace_try_on_action", 
            value = v2.OpenMarketplaceTryOnAction.jsonDecode(v1333.openMarketplaceTryOnAction)
        };
    end;
    if v1333.open_see_all_action ~= nil then
        v1334.kind = {
            type = "open_see_all_action", 
            value = v2.OpenSeeAllAction.jsonDecode(v1333.open_see_all_action)
        };
    end;
    if v1333.openSeeAllAction ~= nil then
        v1334.kind = {
            type = "open_see_all_action", 
            value = v2.OpenSeeAllAction.jsonDecode(v1333.openSeeAllAction)
        };
    end;
    if v1333.open_sponsored_tooltip_action ~= nil then
        v1334.kind = {
            type = "open_sponsored_tooltip_action", 
            value = v2.OpenSponsoredTooltipAction.jsonDecode(v1333.open_sponsored_tooltip_action)
        };
    end;
    if v1333.openSponsoredTooltipAction ~= nil then
        v1334.kind = {
            type = "open_sponsored_tooltip_action", 
            value = v2.OpenSponsoredTooltipAction.jsonDecode(v1333.openSponsoredTooltipAction)
        };
    end;
    if v1333.play_button_click_action ~= nil then
        v1334.kind = {
            type = "play_button_click_action", 
            value = v2.PlayButtonClickAction.jsonDecode(v1333.play_button_click_action)
        };
    end;
    if v1333.playButtonClickAction ~= nil then
        v1334.kind = {
            type = "play_button_click_action", 
            value = v2.PlayButtonClickAction.jsonDecode(v1333.playButtonClickAction)
        };
    end;
    if v1333.update_user_settings_action ~= nil then
        v1334.kind = {
            type = "update_user_settings_action", 
            value = v2.UpdateUserSettingsAction.jsonDecode(v1333.update_user_settings_action)
        };
    end;
    if v1333.updateUserSettingsAction ~= nil then
        v1334.kind = {
            type = "update_user_settings_action", 
            value = v2.UpdateUserSettingsAction.jsonDecode(v1333.updateUserSettingsAction)
        };
    end;
    if v1333.open_tooltip_action ~= nil then
        v1334.kind = {
            type = "open_tooltip_action", 
            value = v2.OpenTooltipAction.jsonDecode(v1333.open_tooltip_action)
        };
    end;
    if v1333.openTooltipAction ~= nil then
        v1334.kind = {
            type = "open_tooltip_action", 
            value = v2.OpenTooltipAction.jsonDecode(v1333.openTooltipAction)
        };
    end;
    if v1333.open_badge_details_action ~= nil then
        v1334.kind = {
            type = "open_badge_details_action", 
            value = v2.OpenBadgeDetailsAction.jsonDecode(v1333.open_badge_details_action)
        };
    end;
    if v1333.openBadgeDetailsAction ~= nil then
        v1334.kind = {
            type = "open_badge_details_action", 
            value = v2.OpenBadgeDetailsAction.jsonDecode(v1333.openBadgeDetailsAction)
        };
    end;
    if v1333.load_more_from_api_action ~= nil then
        v1334.kind = {
            type = "load_more_from_api_action", 
            value = v2.LoadMoreFromApiAction.jsonDecode(v1333.load_more_from_api_action)
        };
    end;
    if v1333.loadMoreFromApiAction ~= nil then
        v1334.kind = {
            type = "load_more_from_api_action", 
            value = v2.LoadMoreFromApiAction.jsonDecode(v1333.loadMoreFromApiAction)
        };
    end;
    if v1333.share_action ~= nil then
        v1334.kind = {
            type = "share_action", 
            value = v2.ShareAction.jsonDecode(v1333.share_action)
        };
    end;
    if v1333.shareAction ~= nil then
        v1334.kind = {
            type = "share_action", 
            value = v2.ShareAction.jsonDecode(v1333.shareAction)
        };
    end;
    if v1333.open_abuse_report_action ~= nil then
        v1334.kind = {
            type = "open_abuse_report_action", 
            value = v2.OpenAbuseReportAction.jsonDecode(v1333.open_abuse_report_action)
        };
    end;
    if v1333.openAbuseReportAction ~= nil then
        v1334.kind = {
            type = "open_abuse_report_action", 
            value = v2.OpenAbuseReportAction.jsonDecode(v1333.openAbuseReportAction)
        };
    end;
    if v1333.remove_badge_from_inventory_action ~= nil then
        v1334.kind = {
            type = "remove_badge_from_inventory_action", 
            value = v2.RemoveBadgeFromInventoryAction.jsonDecode(v1333.remove_badge_from_inventory_action)
        };
    end;
    if v1333.removeBadgeFromInventoryAction ~= nil then
        v1334.kind = {
            type = "remove_badge_from_inventory_action", 
            value = v2.RemoveBadgeFromInventoryAction.jsonDecode(v1333.removeBadgeFromInventoryAction)
        };
    end;
    if v1333.open_profile_action ~= nil then
        v1334.kind = {
            type = "open_profile_action", 
            value = v2.OpenProfileAction.jsonDecode(v1333.open_profile_action)
        };
    end;
    if v1333.openProfileAction ~= nil then
        v1334.kind = {
            type = "open_profile_action", 
            value = v2.OpenProfileAction.jsonDecode(v1333.openProfileAction)
        };
    end;
    if v1333.open_facial_age_estimation_action ~= nil then
        v1334.kind = {
            type = "open_facial_age_estimation_action", 
            value = v2.OpenFacialAgeEstimationAction.jsonDecode(v1333.open_facial_age_estimation_action)
        };
    end;
    if v1333.openFacialAgeEstimationAction ~= nil then
        v1334.kind = {
            type = "open_facial_age_estimation_action", 
            value = v2.OpenFacialAgeEstimationAction.jsonDecode(v1333.openFacialAgeEstimationAction)
        };
    end;
    if v1333.open_add_connections_page_action ~= nil then
        v1334.kind = {
            type = "open_add_connections_page_action", 
            value = v2.OpenAddConnectionsPageAction.jsonDecode(v1333.open_add_connections_page_action)
        };
    end;
    if v1333.openAddConnectionsPageAction ~= nil then
        v1334.kind = {
            type = "open_add_connections_page_action", 
            value = v2.OpenAddConnectionsPageAction.jsonDecode(v1333.openAddConnectionsPageAction)
        };
    end;
    if v1333.open_marketplace_action ~= nil then
        v1334.kind = {
            type = "open_marketplace_action", 
            value = v2.OpenMarketplaceAction.jsonDecode(v1333.open_marketplace_action)
        };
    end;
    if v1333.openMarketplaceAction ~= nil then
        v1334.kind = {
            type = "open_marketplace_action", 
            value = v2.OpenMarketplaceAction.jsonDecode(v1333.openMarketplaceAction)
        };
    end;
    if v1333.hide_profile_completion_action ~= nil then
        v1334.kind = {
            type = "hide_profile_completion_action", 
            value = v2.HideProfileCompletionAction.jsonDecode(v1333.hide_profile_completion_action)
        };
    end;
    if v1333.hideProfileCompletionAction ~= nil then
        v1334.kind = {
            type = "hide_profile_completion_action", 
            value = v2.HideProfileCompletionAction.jsonDecode(v1333.hideProfileCompletionAction)
        };
    end;
    if v1333.select_marketplace_catalog_category ~= nil then
        v1334.kind = {
            type = "select_marketplace_catalog_category", 
            value = v2.SelectMarketplaceCatalogCategory.jsonDecode(v1333.select_marketplace_catalog_category)
        };
    end;
    if v1333.selectMarketplaceCatalogCategory ~= nil then
        v1334.kind = {
            type = "select_marketplace_catalog_category", 
            value = v2.SelectMarketplaceCatalogCategory.jsonDecode(v1333.selectMarketplaceCatalogCategory)
        };
    end;
    if v1333.select_marketplace_catalog_subcategory ~= nil then
        v1334.kind = {
            type = "select_marketplace_catalog_subcategory", 
            value = v2.SelectMarketplaceCatalogSubcategory.jsonDecode(v1333.select_marketplace_catalog_subcategory)
        };
    end;
    if v1333.selectMarketplaceCatalogSubcategory ~= nil then
        v1334.kind = {
            type = "select_marketplace_catalog_subcategory", 
            value = v2.SelectMarketplaceCatalogSubcategory.jsonDecode(v1333.selectMarketplaceCatalogSubcategory)
        };
    end;
    if v1333.open_marketplace_catalog_see_all ~= nil then
        v1334.kind = {
            type = "open_marketplace_catalog_see_all", 
            value = v2.OpenMarketplaceCatalogSeeAll.jsonDecode(v1333.open_marketplace_catalog_see_all)
        };
    end;
    if v1333.openMarketplaceCatalogSeeAll ~= nil then
        v1334.kind = {
            type = "open_marketplace_catalog_see_all", 
            value = v2.OpenMarketplaceCatalogSeeAll.jsonDecode(v1333.openMarketplaceCatalogSeeAll)
        };
    end;
    if v1333.close_marketplace_category_tooltip ~= nil then
        v1334.kind = {
            type = "close_marketplace_category_tooltip", 
            value = v2.CloseMarketplaceCategoryTooltip.jsonDecode(v1333.close_marketplace_category_tooltip)
        };
    end;
    if v1333.closeMarketplaceCategoryTooltip ~= nil then
        v1334.kind = {
            type = "close_marketplace_category_tooltip", 
            value = v2.CloseMarketplaceCategoryTooltip.jsonDecode(v1333.closeMarketplaceCategoryTooltip)
        };
    end;
    if v1333.resize_marketplace_catalog ~= nil then
        v1334.kind = {
            type = "resize_marketplace_catalog", 
            value = v2.ResizeMarketplaceCatalog.jsonDecode(v1333.resize_marketplace_catalog)
        };
    end;
    if v1333.resizeMarketplaceCatalog ~= nil then
        v1334.kind = {
            type = "resize_marketplace_catalog", 
            value = v2.ResizeMarketplaceCatalog.jsonDecode(v1333.resizeMarketplaceCatalog)
        };
    end;
    if v1333.open_marketplace_catalog_filters ~= nil then
        v1334.kind = {
            type = "open_marketplace_catalog_filters", 
            value = v2.OpenMarketplaceCatalogFilters.jsonDecode(v1333.open_marketplace_catalog_filters)
        };
    end;
    if v1333.openMarketplaceCatalogFilters ~= nil then
        v1334.kind = {
            type = "open_marketplace_catalog_filters", 
            value = v2.OpenMarketplaceCatalogFilters.jsonDecode(v1333.openMarketplaceCatalogFilters)
        };
    end;
    return v1334;
end;
v7.descriptor = {
    name = "Action", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Action"
};
v2.Action = v7;
v1.default:register(v2.Action);
v7 = {};
v7.__index = v7;
local l_v7_54 = v7 --[[ copy: 7 -> 62 ]];
v7.new = function(v1336) --[[ Line: 9904 ]] --[[ Name: new ]]
    -- upvalues: l_v7_54 (copy)
    return (setmetatable({
        kind = if not (v1336 ~= nil) or v1336.kind == nil then nil else v1336.kind
    }, l_v7_54));
end;
v7.encode = function(v1337) --[[ Line: 9910 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1338 = buffer.create(0);
    local v1339 = 0;
    if v1337.kind ~= nil then
        if v1337.kind.type == "value" then
            local v1340 = v1337.kind.value:encode();
            local v1341, v1342 = v0.writeTag(v1338, v1339, 1, v0.wireTypes.lengthDelimited);
            v1341, v1342 = v0.writeBuffer(v1341, v1342, v1340, buffer.len(v1340));
            v1338 = v1341;
            v1339 = v1342;
        elseif v1337.kind.type == "conditional" then
            local v1343 = v1337.kind.value:encode();
            local v1344, v1345 = v0.writeTag(v1338, v1339, 2, v0.wireTypes.lengthDelimited);
            v1344, v1345 = v0.writeBuffer(v1344, v1345, v1343, buffer.len(v1343));
            v1338 = v1344;
            v1339 = v1345;
        end;
    end;
    local v1346 = buffer.create(v1339);
    buffer.copy(v1346, 0, v1338, 0, v1339);
    return v1346;
end;
v7.decode = function(v1347) --[[ Line: 9931 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_54 (copy), v0 (copy), v2 (copy)
    local v1348 = l_v7_54.new();
    local v1349 = 0;
    while v1349 < buffer.len(v1347) do
        local v1350 = nil;
        local v1351 = nil;
        local v1352, v1353, v1354 = v0.readTag(v1347, v1349);
        v1350 = v1352;
        v1351 = v1353;
        v1349 = v1354;
        if v1351 == v0.wireTypes.varint then
            v1352 = nil;
            v1353, v1354 = v0.readVarInt(v1347, v1349);
            v1352 = v1353;
            v1349 = v1354;
        elseif v1351 == v0.wireTypes.lengthDelimited then
            if v1350 == 1 then
                v1352 = nil;
                v1353, v1354 = v0.readBuffer(v1347, v1349);
                v1352 = v1353;
                v1349 = v1354;
                v1348.kind = {
                    type = "value", 
                    value = v2.Action.decode(v1352)
                };
            elseif v1350 == 2 then
                v1352 = nil;
                v1353, v1354 = v0.readBuffer(v1347, v1349);
                v1352 = v1353;
                v1349 = v1354;
                v1348.kind = {
                    type = "conditional", 
                    value = v2.ActionProp_ConditionalOptions.decode(v1352)
                };
            else
                v1352 = nil;
                v1353, v1354 = v0.readVarInt(v1347, v1349);
                v1349 = v1354 + v1353;
            end;
        elseif v1351 == v0.wireTypes.i32 then
            v1352 = nil;
            v1353, v1354 = v0.readFixed32(v1347, v1349);
            v1352 = v1353;
            v1349 = v1354;
        elseif v1351 == v0.wireTypes.i64 then
            v1352 = nil;
            v1353, v1354 = v0.readFixed64(v1347, v1349);
            v1352 = v1353;
            v1349 = v1354;
        else
            error("Unsupported wire type: " .. v1351);
        end;
    end;
    return v1348;
end;
v7.jsonEncode = function(v1355) --[[ Line: 9979 ]] --[[ Name: jsonEncode ]]
    local v1356 = {};
    if v1355.kind ~= nil then
        if v1355.kind.type == "value" then
            v1356.value = v1355.kind.value:jsonEncode();
            return v1356;
        elseif v1355.kind.type == "conditional" then
            v1356.conditional = v1355.kind.value:jsonEncode();
        end;
    end;
    return v1356;
end;
v7.jsonDecode = function(v1357) --[[ Line: 9993 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_54 (copy), v2 (copy)
    local v1358 = l_v7_54.new();
    if v1357.value ~= nil then
        v1358.kind = {
            type = "value", 
            value = v2.Action.jsonDecode(v1357.value)
        };
    end;
    if v1357.conditional ~= nil then
        v1358.kind = {
            type = "conditional", 
            value = v2.ActionProp_ConditionalOptions.jsonDecode(v1357.conditional)
        };
    end;
    return v1358;
end;
v7.descriptor = {
    name = "ActionProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ActionProp"
};
v2.ActionProp = v7;
v1.default:register(v2.ActionProp);
v7 = {};
v7.__index = v7;
local l_v7_55 = v7 --[[ copy: 7 -> 63 ]];
v7.new = function(v1360) --[[ Line: 10022 ]] --[[ Name: new ]]
    -- upvalues: l_v7_55 (copy)
    return (setmetatable({
        condition = if not (v1360 ~= nil) or v1360.condition == nil then nil else v1360.condition, 
        value = if not (v1360 ~= nil) or v1360.value == nil then nil else v1360.value
    }, l_v7_55));
end;
v7.encode = function(v1361) --[[ Line: 10031 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1362 = buffer.create(0);
    local v1363 = 0;
    if v1361.condition ~= nil then
        local v1364 = v1361.condition:encode();
        local v1365, v1366 = v0.writeTag(v1362, v1363, 1, v0.wireTypes.lengthDelimited);
        v1365, v1366 = v0.writeBuffer(v1365, v1366, v1364, buffer.len(v1364));
        v1362 = v1365;
        v1363 = v1366;
    end;
    if v1361.value ~= nil then
        local v1367 = v1361.value:encode();
        local v1368, v1369 = v0.writeTag(v1362, v1363, 2, v0.wireTypes.lengthDelimited);
        v1368, v1369 = v0.writeBuffer(v1368, v1369, v1367, buffer.len(v1367));
        v1362 = v1368;
        v1363 = v1369;
    end;
    local v1370 = buffer.create(v1363);
    buffer.copy(v1370, 0, v1362, 0, v1363);
    return v1370;
end;
v7.decode = function(v1371) --[[ Line: 10052 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_55 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v1372 = l_v7_55.new();
    local v1373 = 0;
    while v1373 < buffer.len(v1371) do
        local v1374 = nil;
        local v1375 = nil;
        local v1376, v1377, v1378 = v0.readTag(v1371, v1373);
        v1374 = v1376;
        v1375 = v1377;
        v1373 = v1378;
        if v1375 == v0.wireTypes.varint then
            v1376 = nil;
            v1377, v1378 = v0.readVarInt(v1371, v1373);
            v1376 = v1377;
            v1373 = v1378;
        elseif v1375 == v0.wireTypes.lengthDelimited then
            if v1374 == 1 then
                v1376 = nil;
                v1377, v1378 = v0.readBuffer(v1371, v1373);
                v1376 = v1377;
                v1373 = v1378;
                v1372.condition = v4.PropCondition.decode(v1376);
            elseif v1374 == 2 then
                v1376 = nil;
                v1377, v1378 = v0.readBuffer(v1371, v1373);
                v1376 = v1377;
                v1373 = v1378;
                v1372.value = v2.Action.decode(v1376);
            else
                v1376 = nil;
                v1377, v1378 = v0.readVarInt(v1371, v1373);
                v1373 = v1378 + v1377;
            end;
        elseif v1375 == v0.wireTypes.i32 then
            v1376 = nil;
            v1377, v1378 = v0.readFixed32(v1371, v1373);
            v1376 = v1377;
            v1373 = v1378;
        elseif v1375 == v0.wireTypes.i64 then
            v1376 = nil;
            v1377, v1378 = v0.readFixed64(v1371, v1373);
            v1376 = v1377;
            v1373 = v1378;
        else
            error("Unsupported wire type: " .. v1375);
        end;
    end;
    return v1372;
end;
v7.jsonEncode = function(v1379) --[[ Line: 10100 ]] --[[ Name: jsonEncode ]]
    local v1380 = {};
    if v1379.condition ~= nil then
        v1380.condition = v1379.condition:jsonEncode();
    end;
    if v1379.value ~= nil then
        v1380.value = v1379.value:jsonEncode();
    end;
    return v1380;
end;
v7.jsonDecode = function(v1381) --[[ Line: 10114 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_55 (copy), v4 (copy), v2 (copy)
    local v1382 = l_v7_55.new();
    if v1381.condition ~= nil then
        v1382.condition = v4.PropCondition.jsonDecode(v1381.condition);
    end;
    if v1381.value ~= nil then
        v1382.value = v2.Action.jsonDecode(v1381.value);
    end;
    return v1382;
end;
v7.descriptor = {
    name = "ActionProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ActionProp_ConditionalOption = v7;
v1.default:register(v2.ActionProp_ConditionalOption);
v7 = {};
v7.__index = v7;
local l_v7_56 = v7 --[[ copy: 7 -> 64 ]];
v7.new = function(v1384) --[[ Line: 10143 ]] --[[ Name: new ]]
    -- upvalues: l_v7_56 (copy)
    return (setmetatable({
        options = if not (v1384 ~= nil) or v1384.options == nil then {} else v1384.options
    }, l_v7_56));
end;
v7.encode = function(v1385) --[[ Line: 10151 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1386 = buffer.create(0);
    local v1387 = 0;
    if v1385.options ~= nil and #v1385.options > 0 then
        for _, v1389 in v1385.options do
            local v1390 = v1389:encode();
            local v1391, v1392 = v0.writeTag(v1386, v1387, 1, v0.wireTypes.lengthDelimited);
            v1391, v1392 = v0.writeBuffer(v1391, v1392, v1390, buffer.len(v1390));
            v1386 = v1391;
            v1387 = v1392;
        end;
    end;
    local v1393 = buffer.create(v1387);
    buffer.copy(v1393, 0, v1386, 0, v1387);
    return v1393;
end;
v7.decode = function(v1394) --[[ Line: 10168 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_56 (copy), v0 (copy), v2 (copy)
    local v1395 = l_v7_56.new();
    local v1396 = 0;
    while v1396 < buffer.len(v1394) do
        local v1397 = nil;
        local v1398 = nil;
        local v1399, v1400, v1401 = v0.readTag(v1394, v1396);
        v1397 = v1399;
        v1398 = v1400;
        v1396 = v1401;
        if v1398 == v0.wireTypes.varint then
            v1399 = nil;
            v1400, v1401 = v0.readVarInt(v1394, v1396);
            v1399 = v1400;
            v1396 = v1401;
        elseif v1398 == v0.wireTypes.lengthDelimited then
            if v1397 == 1 then
                v1399 = nil;
                v1400, v1401 = v0.readBuffer(v1394, v1396);
                v1399 = v1400;
                v1396 = v1401;
                table.insert(v1395.options, v2.ActionProp_ConditionalOption.decode(v1399));
            else
                v1399 = nil;
                v1400, v1401 = v0.readVarInt(v1394, v1396);
                v1396 = v1401 + v1400;
            end;
        elseif v1398 == v0.wireTypes.i32 then
            v1399 = nil;
            v1400, v1401 = v0.readFixed32(v1394, v1396);
            v1399 = v1400;
            v1396 = v1401;
        elseif v1398 == v0.wireTypes.i64 then
            v1399 = nil;
            v1400, v1401 = v0.readFixed64(v1394, v1396);
            v1399 = v1400;
            v1396 = v1401;
        else
            error("Unsupported wire type: " .. v1398);
        end;
    end;
    return v1395;
end;
v7.jsonEncode = function(v1402) --[[ Line: 10211 ]] --[[ Name: jsonEncode ]]
    local v1403 = {};
    if v1402.options ~= nil and #v1402.options > 0 then
        local v1404 = {};
        for _, v1406 in v1402.options do
            table.insert(v1404, v1406:jsonEncode());
        end;
        v1403.options = v1404;
    end;
    return v1403;
end;
v7.jsonDecode = function(v1407) --[[ Line: 10225 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_56 (copy), v2 (copy)
    local v1408 = l_v7_56.new();
    if v1407.options ~= nil then
        local v1409 = {};
        for _, v1411 in v1407.options do
            table.insert(v1409, v2.ActionProp_ConditionalOption.jsonDecode(v1411));
        end;
        v1408.options = v1409;
    end;
    return v1408;
end;
v7.descriptor = {
    name = "ActionProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ActionProp_ConditionalOptions = v7;
v1.default:register(v2.ActionProp_ConditionalOptions);
v7 = {};
v7.__index = v7;
local l_v7_57 = v7 --[[ copy: 7 -> 65 ]];
v7.new = function(v1413) --[[ Line: 10254 ]] --[[ Name: new ]]
    -- upvalues: l_v7_57 (copy)
    return (setmetatable({
        kind = if not (v1413 ~= nil) or v1413.kind == nil then nil else v1413.kind
    }, l_v7_57));
end;
v7.encode = function(v1414) --[[ Line: 10260 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1415 = buffer.create(0);
    local v1416 = 0;
    if v1414.kind ~= nil then
        if v1414.kind.type == "value" then
            local v1417 = v1414.kind.value:encode();
            local v1418, v1419 = v0.writeTag(v1415, v1416, 1, v0.wireTypes.lengthDelimited);
            v1418, v1419 = v0.writeBuffer(v1418, v1419, v1417, buffer.len(v1417));
            v1415 = v1418;
            v1416 = v1419;
        elseif v1414.kind.type == "conditional" then
            local v1420 = v1414.kind.value:encode();
            local v1421, v1422 = v0.writeTag(v1415, v1416, 2, v0.wireTypes.lengthDelimited);
            v1421, v1422 = v0.writeBuffer(v1421, v1422, v1420, buffer.len(v1420));
            v1415 = v1421;
            v1416 = v1422;
        end;
    end;
    local v1423 = buffer.create(v1416);
    buffer.copy(v1423, 0, v1415, 0, v1416);
    return v1423;
end;
v7.decode = function(v1424) --[[ Line: 10281 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_57 (copy), v0 (copy), v2 (copy)
    local v1425 = l_v7_57.new();
    local v1426 = 0;
    while v1426 < buffer.len(v1424) do
        local v1427 = nil;
        local v1428 = nil;
        local v1429, v1430, v1431 = v0.readTag(v1424, v1426);
        v1427 = v1429;
        v1428 = v1430;
        v1426 = v1431;
        if v1428 == v0.wireTypes.varint then
            v1429 = nil;
            v1430, v1431 = v0.readVarInt(v1424, v1426);
            v1429 = v1430;
            v1426 = v1431;
        elseif v1428 == v0.wireTypes.lengthDelimited then
            if v1427 == 1 then
                v1429 = nil;
                v1430, v1431 = v0.readBuffer(v1424, v1426);
                v1429 = v1430;
                v1426 = v1431;
                v1425.kind = {
                    type = "value", 
                    value = v2.FocusNavActionsProp_FocusNavData.decode(v1429)
                };
            elseif v1427 == 2 then
                v1429 = nil;
                v1430, v1431 = v0.readBuffer(v1424, v1426);
                v1429 = v1430;
                v1426 = v1431;
                v1425.kind = {
                    type = "conditional", 
                    value = v2.FocusNavActionsProp_ConditionalOptions.decode(v1429)
                };
            else
                v1429 = nil;
                v1430, v1431 = v0.readVarInt(v1424, v1426);
                v1426 = v1431 + v1430;
            end;
        elseif v1428 == v0.wireTypes.i32 then
            v1429 = nil;
            v1430, v1431 = v0.readFixed32(v1424, v1426);
            v1429 = v1430;
            v1426 = v1431;
        elseif v1428 == v0.wireTypes.i64 then
            v1429 = nil;
            v1430, v1431 = v0.readFixed64(v1424, v1426);
            v1429 = v1430;
            v1426 = v1431;
        else
            error("Unsupported wire type: " .. v1428);
        end;
    end;
    return v1425;
end;
v7.jsonEncode = function(v1432) --[[ Line: 10330 ]] --[[ Name: jsonEncode ]]
    local v1433 = {};
    if v1432.kind ~= nil then
        if v1432.kind.type == "value" then
            v1433.value = v1432.kind.value:jsonEncode();
            return v1433;
        elseif v1432.kind.type == "conditional" then
            v1433.conditional = v1432.kind.value:jsonEncode();
        end;
    end;
    return v1433;
end;
v7.jsonDecode = function(v1434) --[[ Line: 10344 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_57 (copy), v2 (copy)
    local v1435 = l_v7_57.new();
    if v1434.value ~= nil then
        v1435.kind = {
            type = "value", 
            value = v2.FocusNavActionsProp_FocusNavData.jsonDecode(v1434.value)
        };
    end;
    if v1434.conditional ~= nil then
        v1435.kind = {
            type = "conditional", 
            value = v2.FocusNavActionsProp_ConditionalOptions.jsonDecode(v1434.conditional)
        };
    end;
    return v1435;
end;
v7.descriptor = {
    name = "FocusNavActionsProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavActionsProp"
};
v2.FocusNavActionsProp = v7;
v1.default:register(v2.FocusNavActionsProp);
v7 = {};
v7.__index = v7;
local l_v7_58 = v7 --[[ copy: 7 -> 66 ]];
v7.new = function(v1437) --[[ Line: 10375 ]] --[[ Name: new ]]
    -- upvalues: l_v7_58 (copy)
    return (setmetatable({
        condition = if not (v1437 ~= nil) or v1437.condition == nil then nil else v1437.condition, 
        value = if not (v1437 ~= nil) or v1437.value == nil then nil else v1437.value
    }, l_v7_58));
end;
v7.encode = function(v1438) --[[ Line: 10384 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1439 = buffer.create(0);
    local v1440 = 0;
    if v1438.condition ~= nil then
        local v1441 = v1438.condition:encode();
        local v1442, v1443 = v0.writeTag(v1439, v1440, 1, v0.wireTypes.lengthDelimited);
        v1442, v1443 = v0.writeBuffer(v1442, v1443, v1441, buffer.len(v1441));
        v1439 = v1442;
        v1440 = v1443;
    end;
    if v1438.value ~= nil then
        local v1444 = v1438.value:encode();
        local v1445, v1446 = v0.writeTag(v1439, v1440, 2, v0.wireTypes.lengthDelimited);
        v1445, v1446 = v0.writeBuffer(v1445, v1446, v1444, buffer.len(v1444));
        v1439 = v1445;
        v1440 = v1446;
    end;
    local v1447 = buffer.create(v1440);
    buffer.copy(v1447, 0, v1439, 0, v1440);
    return v1447;
end;
v7.decode = function(v1448) --[[ Line: 10405 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_58 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v1449 = l_v7_58.new();
    local v1450 = 0;
    while v1450 < buffer.len(v1448) do
        local v1451 = nil;
        local v1452 = nil;
        local v1453, v1454, v1455 = v0.readTag(v1448, v1450);
        v1451 = v1453;
        v1452 = v1454;
        v1450 = v1455;
        if v1452 == v0.wireTypes.varint then
            v1453 = nil;
            v1454, v1455 = v0.readVarInt(v1448, v1450);
            v1453 = v1454;
            v1450 = v1455;
        elseif v1452 == v0.wireTypes.lengthDelimited then
            if v1451 == 1 then
                v1453 = nil;
                v1454, v1455 = v0.readBuffer(v1448, v1450);
                v1453 = v1454;
                v1450 = v1455;
                v1449.condition = v4.PropCondition.decode(v1453);
            elseif v1451 == 2 then
                v1453 = nil;
                v1454, v1455 = v0.readBuffer(v1448, v1450);
                v1453 = v1454;
                v1450 = v1455;
                v1449.value = v2.FocusNavActionsProp.decode(v1453);
            else
                v1453 = nil;
                v1454, v1455 = v0.readVarInt(v1448, v1450);
                v1450 = v1455 + v1454;
            end;
        elseif v1452 == v0.wireTypes.i32 then
            v1453 = nil;
            v1454, v1455 = v0.readFixed32(v1448, v1450);
            v1453 = v1454;
            v1450 = v1455;
        elseif v1452 == v0.wireTypes.i64 then
            v1453 = nil;
            v1454, v1455 = v0.readFixed64(v1448, v1450);
            v1453 = v1454;
            v1450 = v1455;
        else
            error("Unsupported wire type: " .. v1452);
        end;
    end;
    return v1449;
end;
v7.jsonEncode = function(v1456) --[[ Line: 10453 ]] --[[ Name: jsonEncode ]]
    local v1457 = {};
    if v1456.condition ~= nil then
        v1457.condition = v1456.condition:jsonEncode();
    end;
    if v1456.value ~= nil then
        v1457.value = v1456.value:jsonEncode();
    end;
    return v1457;
end;
v7.jsonDecode = function(v1458) --[[ Line: 10467 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_58 (copy), v4 (copy), v2 (copy)
    local v1459 = l_v7_58.new();
    if v1458.condition ~= nil then
        v1459.condition = v4.PropCondition.jsonDecode(v1458.condition);
    end;
    if v1458.value ~= nil then
        v1459.value = v2.FocusNavActionsProp.jsonDecode(v1458.value);
    end;
    return v1459;
end;
v7.descriptor = {
    name = "FocusNavActionsProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.FocusNavActionsProp_ConditionalOption = v7;
v1.default:register(v2.FocusNavActionsProp_ConditionalOption);
v7 = {};
v7.__index = v7;
local l_v7_59 = v7 --[[ copy: 7 -> 67 ]];
v7.new = function(v1461) --[[ Line: 10498 ]] --[[ Name: new ]]
    -- upvalues: l_v7_59 (copy)
    return (setmetatable({
        options = if not (v1461 ~= nil) or v1461.options == nil then {} else v1461.options
    }, l_v7_59));
end;
v7.encode = function(v1462) --[[ Line: 10506 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1463 = buffer.create(0);
    local v1464 = 0;
    if v1462.options ~= nil and #v1462.options > 0 then
        for _, v1466 in v1462.options do
            local v1467 = v1466:encode();
            local v1468, v1469 = v0.writeTag(v1463, v1464, 1, v0.wireTypes.lengthDelimited);
            v1468, v1469 = v0.writeBuffer(v1468, v1469, v1467, buffer.len(v1467));
            v1463 = v1468;
            v1464 = v1469;
        end;
    end;
    local v1470 = buffer.create(v1464);
    buffer.copy(v1470, 0, v1463, 0, v1464);
    return v1470;
end;
v7.decode = function(v1471) --[[ Line: 10523 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_59 (copy), v0 (copy), v2 (copy)
    local v1472 = l_v7_59.new();
    local v1473 = 0;
    while v1473 < buffer.len(v1471) do
        local v1474 = nil;
        local v1475 = nil;
        local v1476, v1477, v1478 = v0.readTag(v1471, v1473);
        v1474 = v1476;
        v1475 = v1477;
        v1473 = v1478;
        if v1475 == v0.wireTypes.varint then
            v1476 = nil;
            v1477, v1478 = v0.readVarInt(v1471, v1473);
            v1476 = v1477;
            v1473 = v1478;
        elseif v1475 == v0.wireTypes.lengthDelimited then
            if v1474 == 1 then
                v1476 = nil;
                v1477, v1478 = v0.readBuffer(v1471, v1473);
                v1476 = v1477;
                v1473 = v1478;
                table.insert(v1472.options, v2.FocusNavActionsProp_ConditionalOption.decode(v1476));
            else
                v1476 = nil;
                v1477, v1478 = v0.readVarInt(v1471, v1473);
                v1473 = v1478 + v1477;
            end;
        elseif v1475 == v0.wireTypes.i32 then
            v1476 = nil;
            v1477, v1478 = v0.readFixed32(v1471, v1473);
            v1476 = v1477;
            v1473 = v1478;
        elseif v1475 == v0.wireTypes.i64 then
            v1476 = nil;
            v1477, v1478 = v0.readFixed64(v1471, v1473);
            v1476 = v1477;
            v1473 = v1478;
        else
            error("Unsupported wire type: " .. v1475);
        end;
    end;
    return v1472;
end;
v7.jsonEncode = function(v1479) --[[ Line: 10566 ]] --[[ Name: jsonEncode ]]
    local v1480 = {};
    if v1479.options ~= nil and #v1479.options > 0 then
        local v1481 = {};
        for _, v1483 in v1479.options do
            table.insert(v1481, v1483:jsonEncode());
        end;
        v1480.options = v1481;
    end;
    return v1480;
end;
v7.jsonDecode = function(v1484) --[[ Line: 10580 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_59 (copy), v2 (copy)
    local v1485 = l_v7_59.new();
    if v1484.options ~= nil then
        local v1486 = {};
        for _, v1488 in v1484.options do
            table.insert(v1486, v2.FocusNavActionsProp_ConditionalOption.jsonDecode(v1488));
        end;
        v1485.options = v1486;
    end;
    return v1485;
end;
v7.descriptor = {
    name = "FocusNavActionsProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.FocusNavActionsProp_ConditionalOptions = v7;
v1.default:register(v2.FocusNavActionsProp_ConditionalOptions);
v7 = {};
v7.__index = v7;
local l_v7_60 = v7 --[[ copy: 7 -> 68 ]];
v7.new = function(v1490) --[[ Line: 10611 ]] --[[ Name: new ]]
    -- upvalues: l_v7_60 (copy)
    return (setmetatable({
        keys = if not (v1490 ~= nil) or v1490.keys == nil then {} else v1490.keys, 
        events = if not (v1490 ~= nil) or v1490.events == nil then {} else v1490.events
    }, l_v7_60));
end;
v7.encode = function(v1491) --[[ Line: 10620 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1492 = buffer.create(0);
    local v1493 = 0;
    if v1491.keys ~= nil and next(v1491.keys) ~= nil then
        for v1494, v1495 in v1491.keys do
            local v1496 = buffer.create(0);
            local v1497, v1498 = v0.writeTag(v1496, 0, 1, v0.wireTypes.lengthDelimited);
            v1497, v1498 = v0.writeString(v1497, v1498, v1494);
            v1497, v1498 = v0.writeTag(v1497, v1498, 2, v0.wireTypes.lengthDelimited);
            v1497, v1498 = v0.writeString(v1497, v1498, v1495);
            v1496 = v1497;
            local l_v1498_0 = v1498;
            v1497, v1498 = v0.writeTag(v1492, v1493, 1, v0.wireTypes.lengthDelimited);
            v1497, v1498 = v0.writeBuffer(v1497, v1498, v1496, l_v1498_0);
            v1492 = v1497;
            v1493 = v1498;
        end;
    end;
    if v1491.events ~= nil and next(v1491.events) ~= nil then
        for v1500, v1501 in v1491.events do
            local v1502 = buffer.create(0);
            local v1503, v1504 = v0.writeTag(v1502, 0, 1, v0.wireTypes.lengthDelimited);
            v1503, v1504 = v0.writeString(v1503, v1504, v1500);
            v1502 = v1503;
            local l_v1504_0 = v1504;
            v1503 = v1501:encode();
            local v1506;
            v1504, v1506 = v0.writeTag(v1502, l_v1504_0, 2, v0.wireTypes.lengthDelimited);
            v1504, v1506 = v0.writeBuffer(v1504, v1506, v1503, buffer.len(v1503));
            v1502 = v1504;
            l_v1504_0 = v1506;
            v1504, v1506 = v0.writeTag(v1492, v1493, 2, v0.wireTypes.lengthDelimited);
            v1504, v1506 = v0.writeBuffer(v1504, v1506, v1502, l_v1504_0);
            v1492 = v1504;
            v1493 = v1506;
        end;
    end;
    local v1507 = buffer.create(v1493);
    buffer.copy(v1507, 0, v1492, 0, v1493);
    return v1507;
end;
v7.decode = function(v1508) --[[ Line: 10656 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_60 (copy), v0 (copy), v2 (copy), v3 (copy)
    local v1509 = l_v7_60.new();
    local v1510 = 0;
    while v1510 < buffer.len(v1508) do
        local v1511 = nil;
        local v1512 = nil;
        local v1513, v1514, v1515 = v0.readTag(v1508, v1510);
        v1511 = v1513;
        v1512 = v1514;
        v1510 = v1515;
        if v1512 == v0.wireTypes.varint then
            v1513 = nil;
            v1514, v1515 = v0.readVarInt(v1508, v1510);
            v1513 = v1514;
            v1510 = v1515;
        elseif v1512 == v0.wireTypes.lengthDelimited then
            if v1511 == 1 then
                v1513 = nil;
                v1514, v1515 = v0.readBuffer(v1508, v1510);
                v1513 = v1514;
                v1510 = v1515;
                v1514 = v2.FocusNavActionsProp_FocusNavData_KeysEntry.decode(v1513);
                v1509.keys[v1514.key or ""] = v1514.value or "";
            elseif v1511 == 2 then
                v1513 = nil;
                v1514, v1515 = v0.readBuffer(v1508, v1510);
                v1513 = v1514;
                v1510 = v1515;
                v1514 = v2.FocusNavActionsProp_FocusNavData_EventsEntry.decode(v1513);
                v1515 = v3.Struct.new();
                v1509.events[v1514.key or ""] = v1514.value or v1515;
            else
                v1513 = nil;
                v1514, v1515 = v0.readVarInt(v1508, v1510);
                v1510 = v1515 + v1514;
            end;
        elseif v1512 == v0.wireTypes.i32 then
            v1513 = nil;
            v1514, v1515 = v0.readFixed32(v1508, v1510);
            v1513 = v1514;
            v1510 = v1515;
        elseif v1512 == v0.wireTypes.i64 then
            v1513 = nil;
            v1514, v1515 = v0.readFixed64(v1508, v1510);
            v1513 = v1514;
            v1510 = v1515;
        else
            error("Unsupported wire type: " .. v1512);
        end;
    end;
    return v1509;
end;
v7.jsonEncode = function(v1516) --[[ Line: 10718 ]] --[[ Name: jsonEncode ]]
    local v1517 = {};
    if v1516.keys ~= nil and next(v1516.keys) ~= nil then
        local v1518 = {};
        for v1519, v1520 in v1516.keys do
            v1518[v1519] = v1520;
        end;
        v1517.keys = v1518;
    end;
    if v1516.events ~= nil and next(v1516.events) ~= nil then
        local v1521 = {};
        for v1522, v1523 in v1516.events do
            v1521[v1522] = v1523:jsonEncode();
        end;
        v1517.events = v1521;
    end;
    return v1517;
end;
v7.jsonDecode = function(v1524) --[[ Line: 10740 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_60 (copy), v3 (copy)
    local v1525 = l_v7_60.new();
    if v1524.keys ~= nil then
        local v1526 = {};
        for v1527, v1528 in v1524.keys do
            v1526[v1527] = v1528;
        end;
        v1525.keys = v1526;
    end;
    if v1524.events ~= nil then
        local v1529 = {};
        for v1530, v1531 in v1524.events do
            v1529[v1530] = v3.Struct.jsonDecode(v1531);
        end;
        v1525.events = v1529;
    end;
    return v1525;
end;
v7.descriptor = {
    name = "FocusNavActionsProp_FocusNavData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavData"
};
v2.FocusNavActionsProp_FocusNavData = v7;
v1.default:register(v2.FocusNavActionsProp_FocusNavData);
v7 = {};
v7.__index = v7;
local l_v7_61 = v7 --[[ copy: 7 -> 69 ]];
v7.new = function(v1533) --[[ Line: 10780 ]] --[[ Name: new ]]
    -- upvalues: l_v7_61 (copy)
    return (setmetatable({
        key = (not (v1533 ~= nil) or v1533.key == nil) and "" or v1533.key, 
        value = (not (v1533 ~= nil) or v1533.value == nil) and "" or v1533.value
    }, l_v7_61));
end;
v7.encode = function(v1534) --[[ Line: 10789 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1535 = buffer.create(0);
    local v1536 = 0;
    if v1534.key ~= nil and v1534.key ~= "" then
        local v1537, v1538 = v0.writeTag(v1535, v1536, 1, v0.wireTypes.lengthDelimited);
        v1537, v1538 = v0.writeString(v1537, v1538, v1534.key);
        v1535 = v1537;
        v1536 = v1538;
    end;
    if v1534.value ~= nil and v1534.value ~= "" then
        local v1539, v1540 = v0.writeTag(v1535, v1536, 2, v0.wireTypes.lengthDelimited);
        v1539, v1540 = v0.writeString(v1539, v1540, v1534.value);
        v1535 = v1539;
        v1536 = v1540;
    end;
    local v1541 = buffer.create(v1536);
    buffer.copy(v1541, 0, v1535, 0, v1536);
    return v1541;
end;
v7.decode = function(v1542) --[[ Line: 10810 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_61 (copy), v0 (copy)
    local v1543 = l_v7_61.new();
    local v1544 = 0;
    while v1544 < buffer.len(v1542) do
        local v1545 = nil;
        local v1546 = nil;
        local v1547, v1548, v1549 = v0.readTag(v1542, v1544);
        v1545 = v1547;
        v1546 = v1548;
        v1544 = v1549;
        if v1546 == v0.wireTypes.varint then
            v1547 = nil;
            v1548, v1549 = v0.readVarInt(v1542, v1544);
            v1547 = v1548;
            v1544 = v1549;
        elseif v1546 == v0.wireTypes.lengthDelimited then
            if v1545 == 1 then
                v1547 = nil;
                v1548, v1549 = v0.readBuffer(v1542, v1544);
                v1547 = v1548;
                v1544 = v1549;
                v1543.key = buffer.tostring(v1547);
            elseif v1545 == 2 then
                v1547 = nil;
                v1548, v1549 = v0.readBuffer(v1542, v1544);
                v1547 = v1548;
                v1544 = v1549;
                v1543.value = buffer.tostring(v1547);
            else
                v1547 = nil;
                v1548, v1549 = v0.readVarInt(v1542, v1544);
                v1544 = v1549 + v1548;
            end;
        elseif v1546 == v0.wireTypes.i32 then
            v1547 = nil;
            v1548, v1549 = v0.readFixed32(v1542, v1544);
            v1547 = v1548;
            v1544 = v1549;
        elseif v1546 == v0.wireTypes.i64 then
            v1547 = nil;
            v1548, v1549 = v0.readFixed64(v1542, v1544);
            v1547 = v1548;
            v1544 = v1549;
        else
            error("Unsupported wire type: " .. v1546);
        end;
    end;
    return v1543;
end;
v7.jsonEncode = function(v1550) --[[ Line: 10860 ]] --[[ Name: jsonEncode ]]
    local v1551 = {};
    if v1550.key ~= nil and v1550.key ~= "" then
        v1551.key = v1550.key;
    end;
    if v1550.value ~= nil and v1550.value ~= "" then
        v1551.value = v1550.value;
    end;
    return v1551;
end;
v7.jsonDecode = function(v1552) --[[ Line: 10876 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_61 (copy)
    local v1553 = l_v7_61.new();
    if v1552.key ~= nil then
        v1553.key = v1552.key;
    end;
    if v1552.value ~= nil then
        v1553.value = v1552.value;
    end;
    return v1553;
end;
v7.descriptor = {
    name = "FocusNavActionsProp_FocusNavData_KeysEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.KeysEntry"
};
v2.FocusNavActionsProp_FocusNavData_KeysEntry = v7;
v1.default:register(v2.FocusNavActionsProp_FocusNavData_KeysEntry);
v7 = {};
v7.__index = v7;
v7.new = function(v1554) --[[ Line: 10906 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({
        key = (not (v1554 ~= nil) or v1554.key == nil) and "" or v1554.key, 
        value = if not (v1554 ~= nil) or v1554.value == nil then nil else v1554.value
    }, v7));
end;
v7.encode = function(v1555) --[[ Line: 10915 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1556 = buffer.create(0);
    local v1557 = 0;
    if v1555.key ~= nil and v1555.key ~= "" then
        local v1558, v1559 = v0.writeTag(v1556, v1557, 1, v0.wireTypes.lengthDelimited);
        v1558, v1559 = v0.writeString(v1558, v1559, v1555.key);
        v1556 = v1558;
        v1557 = v1559;
    end;
    if v1555.value ~= nil then
        local v1560 = v1555.value:encode();
        local v1561, v1562 = v0.writeTag(v1556, v1557, 2, v0.wireTypes.lengthDelimited);
        v1561, v1562 = v0.writeBuffer(v1561, v1562, v1560, buffer.len(v1560));
        v1556 = v1561;
        v1557 = v1562;
    end;
    local v1563 = buffer.create(v1557);
    buffer.copy(v1563, 0, v1556, 0, v1557);
    return v1563;
end;
v7.decode = function(v1564) --[[ Line: 10937 ]] --[[ Name: decode ]]
    -- upvalues: v7 (copy), v0 (copy), v3 (copy)
    local v1565 = v7.new();
    local v1566 = 0;
    while v1566 < buffer.len(v1564) do
        local v1567 = nil;
        local v1568 = nil;
        local v1569, v1570, v1571 = v0.readTag(v1564, v1566);
        v1567 = v1569;
        v1568 = v1570;
        v1566 = v1571;
        if v1568 == v0.wireTypes.varint then
            v1569 = nil;
            v1570, v1571 = v0.readVarInt(v1564, v1566);
            v1569 = v1570;
            v1566 = v1571;
        elseif v1568 == v0.wireTypes.lengthDelimited then
            if v1567 == 1 then
                v1569 = nil;
                v1570, v1571 = v0.readBuffer(v1564, v1566);
                v1569 = v1570;
                v1566 = v1571;
                v1565.key = buffer.tostring(v1569);
            elseif v1567 == 2 then
                v1569 = nil;
                v1570, v1571 = v0.readBuffer(v1564, v1566);
                v1569 = v1570;
                v1566 = v1571;
                v1565.value = v3.Struct.decode(v1569);
            else
                v1569 = nil;
                v1570, v1571 = v0.readVarInt(v1564, v1566);
                v1566 = v1571 + v1570;
            end;
        elseif v1568 == v0.wireTypes.i32 then
            v1569 = nil;
            v1570, v1571 = v0.readFixed32(v1564, v1566);
            v1569 = v1570;
            v1566 = v1571;
        elseif v1568 == v0.wireTypes.i64 then
            v1569 = nil;
            v1570, v1571 = v0.readFixed64(v1564, v1566);
            v1569 = v1570;
            v1566 = v1571;
        else
            error("Unsupported wire type: " .. v1568);
        end;
    end;
    return v1565;
end;
v7.jsonEncode = function(v1572) --[[ Line: 10987 ]] --[[ Name: jsonEncode ]]
    local v1573 = {};
    if v1572.key ~= nil and v1572.key ~= "" then
        v1573.key = v1572.key;
    end;
    if v1572.value ~= nil then
        v1573.value = v1572.value:jsonEncode();
    end;
    return v1573;
end;
v7.jsonDecode = function(v1574) --[[ Line: 11003 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v7 (copy), v3 (copy)
    local v1575 = v7.new();
    if v1574.key ~= nil then
        v1575.key = v1574.key;
    end;
    if v1574.value ~= nil then
        v1575.value = v3.Struct.jsonDecode(v1574.value);
    end;
    return v1575;
end;
v7.descriptor = {
    name = "FocusNavActionsProp_FocusNavData_EventsEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventsEntry"
};
v2.FocusNavActionsProp_FocusNavData_EventsEntry = v7;
v1.default:register(v2.FocusNavActionsProp_FocusNavData_EventsEntry);
v2.ActionType = {
    fromNumber = function(v1576) --[[ Line: 11030 ]] --[[ Name: fromNumber ]]
        if v1576 == 0 then
            return "ACTION_TYPE_INVALID";
        elseif v1576 == 1 then
            return "ACTION_TYPE_DISMISS_DIALOG";
        elseif v1576 == 2 then
            return "ACTION_TYPE_LINK";
        elseif v1576 == 3 then
            return "ACTION_TYPE_OPEN_GAME_DETAILS";
        elseif v1576 == 4 then
            return "ACTION_TYPE_OPEN_JOIN_FRIENDS";
        elseif v1576 == 5 then
            return "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON";
        elseif v1576 == 6 then
            return "ACTION_TYPE_OPEN_SEE_ALL";
        elseif v1576 == 7 then
            return "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP";
        elseif v1576 == 8 then
            return "ACTION_TYPE_PLAY_BUTTON_CLICK";
        elseif v1576 == 9 then
            return "ACTION_TYPE_UPDATE_USER_SETTINGS";
        elseif v1576 == 10 then
            return "ACTION_TYPE_OPEN_TOOLTIP";
        elseif v1576 == 11 then
            return "ACTION_TYPE_OPEN_BADGE_DETAILS";
        elseif v1576 == 12 then
            return "ACTION_TYPE_LOAD_MORE_FROM_API";
        elseif v1576 == 13 then
            return "ACTION_TYPE_SHARE";
        elseif v1576 == 14 then
            return "ACTION_TYPE_OPEN_ABUSE_REPORT";
        elseif v1576 == 15 then
            return "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY";
        elseif v1576 == 16 then
            return "ACTION_TYPE_OPEN_PROFILE";
        elseif v1576 == 17 then
            return "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION";
        elseif v1576 == 18 then
            return "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE";
        elseif v1576 == 19 then
            return "ACTION_TYPE_OPEN_MARKETPLACE";
        elseif v1576 == 20 then
            return "ACTION_TYPE_HIDE_PROFILE_COMPLETION";
        elseif v1576 == 21 then
            return "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY";
        elseif v1576 == 22 then
            return "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY";
        elseif v1576 == 23 then
            return "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL";
        elseif v1576 == 24 then
            return "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP";
        elseif v1576 == 25 then
            return "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG";
        elseif v1576 == 26 then
            return "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS";
        else
            return nil;
        end;
    end, 
    toNumber = function(v1577) --[[ Line: 11090 ]] --[[ Name: toNumber ]]
        if v1577 == "ACTION_TYPE_INVALID" then
            return 0;
        elseif v1577 == "ACTION_TYPE_DISMISS_DIALOG" then
            return 1;
        elseif v1577 == "ACTION_TYPE_LINK" then
            return 2;
        elseif v1577 == "ACTION_TYPE_OPEN_GAME_DETAILS" then
            return 3;
        elseif v1577 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then
            return 4;
        elseif v1577 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then
            return 5;
        elseif v1577 == "ACTION_TYPE_OPEN_SEE_ALL" then
            return 6;
        elseif v1577 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then
            return 7;
        elseif v1577 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then
            return 8;
        elseif v1577 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then
            return 9;
        elseif v1577 == "ACTION_TYPE_OPEN_TOOLTIP" then
            return 10;
        elseif v1577 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then
            return 11;
        elseif v1577 == "ACTION_TYPE_LOAD_MORE_FROM_API" then
            return 12;
        elseif v1577 == "ACTION_TYPE_SHARE" then
            return 13;
        elseif v1577 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then
            return 14;
        elseif v1577 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then
            return 15;
        elseif v1577 == "ACTION_TYPE_OPEN_PROFILE" then
            return 16;
        elseif v1577 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then
            return 17;
        elseif v1577 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then
            return 18;
        elseif v1577 == "ACTION_TYPE_OPEN_MARKETPLACE" then
            return 19;
        elseif v1577 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then
            return 20;
        elseif v1577 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then
            return 21;
        elseif v1577 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then
            return 22;
        elseif v1577 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then
            return 23;
        elseif v1577 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then
            return 24;
        elseif v1577 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then
            return 25;
        elseif v1577 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then
            return 26;
        else
            return v1577;
        end;
    end, 
    fromName = function(v1578) --[[ Line: 11150 ]] --[[ Name: fromName ]]
        if v1578 == "ACTION_TYPE_INVALID" then
            return "ACTION_TYPE_INVALID";
        elseif v1578 == "ACTION_TYPE_DISMISS_DIALOG" then
            return "ACTION_TYPE_DISMISS_DIALOG";
        elseif v1578 == "ACTION_TYPE_LINK" then
            return "ACTION_TYPE_LINK";
        elseif v1578 == "ACTION_TYPE_OPEN_GAME_DETAILS" then
            return "ACTION_TYPE_OPEN_GAME_DETAILS";
        elseif v1578 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then
            return "ACTION_TYPE_OPEN_JOIN_FRIENDS";
        elseif v1578 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then
            return "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON";
        elseif v1578 == "ACTION_TYPE_OPEN_SEE_ALL" then
            return "ACTION_TYPE_OPEN_SEE_ALL";
        elseif v1578 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then
            return "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP";
        elseif v1578 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then
            return "ACTION_TYPE_PLAY_BUTTON_CLICK";
        elseif v1578 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then
            return "ACTION_TYPE_UPDATE_USER_SETTINGS";
        elseif v1578 == "ACTION_TYPE_OPEN_TOOLTIP" then
            return "ACTION_TYPE_OPEN_TOOLTIP";
        elseif v1578 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then
            return "ACTION_TYPE_OPEN_BADGE_DETAILS";
        elseif v1578 == "ACTION_TYPE_LOAD_MORE_FROM_API" then
            return "ACTION_TYPE_LOAD_MORE_FROM_API";
        elseif v1578 == "ACTION_TYPE_SHARE" then
            return "ACTION_TYPE_SHARE";
        elseif v1578 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then
            return "ACTION_TYPE_OPEN_ABUSE_REPORT";
        elseif v1578 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then
            return "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY";
        elseif v1578 == "ACTION_TYPE_OPEN_PROFILE" then
            return "ACTION_TYPE_OPEN_PROFILE";
        elseif v1578 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then
            return "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION";
        elseif v1578 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then
            return "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE";
        elseif v1578 == "ACTION_TYPE_OPEN_MARKETPLACE" then
            return "ACTION_TYPE_OPEN_MARKETPLACE";
        elseif v1578 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then
            return "ACTION_TYPE_HIDE_PROFILE_COMPLETION";
        elseif v1578 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then
            return "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY";
        elseif v1578 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then
            return "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY";
        elseif v1578 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then
            return "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL";
        elseif v1578 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then
            return "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP";
        elseif v1578 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then
            return "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG";
        elseif v1578 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then
            return "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS";
        else
            return nil;
        end;
    end
};
return {
    DismissDialogAction = v2.DismissDialogAction, 
    DismissDialogAction_Params = v2.DismissDialogAction_Params, 
    LinkAction = v2.LinkAction, 
    LinkAction_Params = v2.LinkAction_Params, 
    OpenGameDetailsAction = v2.OpenGameDetailsAction, 
    OpenGameDetailsAction_Params = v2.OpenGameDetailsAction_Params, 
    OpenJoinFriendsAction = v2.OpenJoinFriendsAction, 
    OpenJoinFriendsAction_Params = v2.OpenJoinFriendsAction_Params, 
    OpenMarketplaceTryOnAction = v2.OpenMarketplaceTryOnAction, 
    OpenMarketplaceTryOnAction_Params = v2.OpenMarketplaceTryOnAction_Params, 
    OpenSeeAllAction = v2.OpenSeeAllAction, 
    OpenSeeAllAction_Params = v2.OpenSeeAllAction_Params, 
    OpenSponsoredTooltipAction = v2.OpenSponsoredTooltipAction, 
    OpenSponsoredTooltipAction_Params = v2.OpenSponsoredTooltipAction_Params, 
    PlayButtonClickAction = v2.PlayButtonClickAction, 
    PlayButtonClickAction_Params = v2.PlayButtonClickAction_Params, 
    UpdateUserSettingsAction = v2.UpdateUserSettingsAction, 
    UpdateUserSettingsAction_Params = v2.UpdateUserSettingsAction_Params, 
    OpenTooltipAction = v2.OpenTooltipAction, 
    OpenTooltipAction_Params = v2.OpenTooltipAction_Params, 
    OpenBadgeDetailsAction = v2.OpenBadgeDetailsAction, 
    OpenBadgeDetailsAction_Params = v2.OpenBadgeDetailsAction_Params, 
    LoadMoreFromApiAction = v2.LoadMoreFromApiAction, 
    LoadMoreFromApiAction_Params = v2.LoadMoreFromApiAction_Params, 
    ShareAction = v2.ShareAction, 
    ShareAction_ShareLinkData = v2.ShareAction_ShareLinkData, 
    ShareAction_Params = v2.ShareAction_Params, 
    OpenAbuseReportAction = v2.OpenAbuseReportAction, 
    OpenAbuseReportAction_Params = v2.OpenAbuseReportAction_Params, 
    RemoveBadgeFromInventoryAction = v2.RemoveBadgeFromInventoryAction, 
    RemoveBadgeFromInventoryAction_Params = v2.RemoveBadgeFromInventoryAction_Params, 
    OpenProfileAction = v2.OpenProfileAction, 
    OpenProfileAction_Params = v2.OpenProfileAction_Params, 
    OpenFacialAgeEstimationAction = v2.OpenFacialAgeEstimationAction, 
    OpenFacialAgeEstimationAction_Params = v2.OpenFacialAgeEstimationAction_Params, 
    OpenAddConnectionsPageAction = v2.OpenAddConnectionsPageAction, 
    OpenAddConnectionsPageAction_Params = v2.OpenAddConnectionsPageAction_Params, 
    OpenMarketplaceAction = v2.OpenMarketplaceAction, 
    OpenMarketplaceAction_Params = v2.OpenMarketplaceAction_Params, 
    HideProfileCompletionAction = v2.HideProfileCompletionAction, 
    HideProfileCompletionAction_Params = v2.HideProfileCompletionAction_Params, 
    SelectMarketplaceCatalogCategory = v2.SelectMarketplaceCatalogCategory, 
    SelectMarketplaceCatalogCategory_Params = v2.SelectMarketplaceCatalogCategory_Params, 
    SelectMarketplaceCatalogSubcategory = v2.SelectMarketplaceCatalogSubcategory, 
    SelectMarketplaceCatalogSubcategory_Params = v2.SelectMarketplaceCatalogSubcategory_Params, 
    OpenMarketplaceCatalogSeeAll = v2.OpenMarketplaceCatalogSeeAll, 
    OpenMarketplaceCatalogSeeAll_Params = v2.OpenMarketplaceCatalogSeeAll_Params, 
    CloseMarketplaceCategoryTooltip = v2.CloseMarketplaceCategoryTooltip, 
    CloseMarketplaceCategoryTooltip_Params = v2.CloseMarketplaceCategoryTooltip_Params, 
    ResizeMarketplaceCatalog = v2.ResizeMarketplaceCatalog, 
    ResizeMarketplaceCatalog_Params = v2.ResizeMarketplaceCatalog_Params, 
    OpenMarketplaceCatalogFilters = v2.OpenMarketplaceCatalogFilters, 
    OpenMarketplaceCatalogFilters_Params = v2.OpenMarketplaceCatalogFilters_Params, 
    Action = v2.Action, 
    ActionProp = v2.ActionProp, 
    ActionProp_ConditionalOption = v2.ActionProp_ConditionalOption, 
    ActionProp_ConditionalOptions = v2.ActionProp_ConditionalOptions, 
    FocusNavActionsProp = v2.FocusNavActionsProp, 
    FocusNavActionsProp_ConditionalOption = v2.FocusNavActionsProp_ConditionalOption, 
    FocusNavActionsProp_ConditionalOptions = v2.FocusNavActionsProp_ConditionalOptions, 
    FocusNavActionsProp_FocusNavData = v2.FocusNavActionsProp_FocusNavData, 
    ActionType = v2.ActionType
};