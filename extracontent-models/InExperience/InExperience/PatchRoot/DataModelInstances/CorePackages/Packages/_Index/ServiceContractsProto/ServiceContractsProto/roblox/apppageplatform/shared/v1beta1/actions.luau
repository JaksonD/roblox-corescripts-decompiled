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
v7.new = function(v9) --[[ Line: 1960 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_0 (copy)
    return (setmetatable({
        action_type = if not (v9 ~= nil) or v9.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v9.action_type, 
        action_params = if not (v9 ~= nil) or v9.action_params == nil then nil else v9.action_params
    }, l_v7_0));
end;
v7.encode = function(v10) --[[ Line: 1969 ]] --[[ Name: encode ]]
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
v7.decode = function(v19) --[[ Line: 1995 ]] --[[ Name: decode ]]
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
v7.jsonEncode = function(v27) --[[ Line: 2043 ]] --[[ Name: jsonEncode ]]
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
v7.jsonDecode = function(v29) --[[ Line: 2065 ]] --[[ Name: jsonDecode ]]
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
v7.new = function(v32) --[[ Line: 2105 ]] --[[ Name: new ]]
    -- upvalues: l_v7_1 (copy)
    return (setmetatable({
        dialog_type = if not (v32 ~= nil) or v32.dialog_type == nil then nil else v32.dialog_type
    }, l_v7_1));
end;
v7.encode = function(v33) --[[ Line: 2113 ]] --[[ Name: encode ]]
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
v7.decode = function(v40) --[[ Line: 2128 ]] --[[ Name: decode ]]
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
v7.jsonEncode = function(v48) --[[ Line: 2171 ]] --[[ Name: jsonEncode ]]
    local v49 = {};
    if v48.dialog_type ~= nil then
        v49.dialogType = v48.dialog_type:jsonEncode();
    end;
    return v49;
end;
v7.jsonDecode = function(v50) --[[ Line: 2181 ]] --[[ Name: jsonDecode ]]
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
v7.new = function(v53) --[[ Line: 2210 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_2 (copy)
    return (setmetatable({
        action_type = if not (v53 ~= nil) or v53.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v53.action_type, 
        action_params = if not (v53 ~= nil) or v53.action_params == nil then nil else v53.action_params
    }, l_v7_2));
end;
v7.encode = function(v54) --[[ Line: 2219 ]] --[[ Name: encode ]]
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
v7.decode = function(v63) --[[ Line: 2245 ]] --[[ Name: decode ]]
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
v7.jsonEncode = function(v71) --[[ Line: 2293 ]] --[[ Name: jsonEncode ]]
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
v7.jsonDecode = function(v73) --[[ Line: 2315 ]] --[[ Name: jsonDecode ]]
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
v7.new = function(v76) --[[ Line: 2355 ]] --[[ Name: new ]]
    -- upvalues: l_v7_3 (copy)
    return (setmetatable({
        url = if not (v76 ~= nil) or v76.url == nil then nil else v76.url
    }, l_v7_3));
end;
v7.encode = function(v77) --[[ Line: 2361 ]] --[[ Name: encode ]]
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
v7.decode = function(v84) --[[ Line: 2376 ]] --[[ Name: decode ]]
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
v7.jsonEncode = function(v92) --[[ Line: 2419 ]] --[[ Name: jsonEncode ]]
    local v93 = {};
    if v92.url ~= nil then
        v93.url = v92.url:jsonEncode();
    end;
    return v93;
end;
v7.jsonDecode = function(v94) --[[ Line: 2429 ]] --[[ Name: jsonDecode ]]
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
v7.new = function(v97) --[[ Line: 2453 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_4 (copy)
    return (setmetatable({
        action_type = if not (v97 ~= nil) or v97.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v97.action_type, 
        action_params = if not (v97 ~= nil) or v97.action_params == nil then nil else v97.action_params
    }, l_v7_4));
end;
v7.encode = function(v98) --[[ Line: 2462 ]] --[[ Name: encode ]]
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
v7.decode = function(v107) --[[ Line: 2488 ]] --[[ Name: decode ]]
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
                v108.action_params = v2.OpenSocialLinkAction_Params.decode(v112);
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
v7.jsonEncode = function(v115) --[[ Line: 2536 ]] --[[ Name: jsonEncode ]]
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
v7.jsonDecode = function(v117) --[[ Line: 2558 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_4 (copy), v2 (copy)
    local v118 = l_v7_4.new();
    if v117.action_type ~= nil then
        v118.action_type = if typeof(v117.action_type) == "number" then v2.ActionType.fromNumber(v117.action_type) or v117.action_type else v2.ActionType.fromName(v117.action_type) or v117.action_type;
    end;
    if v117.actionType ~= nil then
        v118.action_type = if typeof(v117.actionType) == "number" then v2.ActionType.fromNumber(v117.actionType) or v117.actionType else v2.ActionType.fromName(v117.actionType) or v117.actionType;
    end;
    if v117.action_params ~= nil then
        v118.action_params = v2.OpenSocialLinkAction_Params.jsonDecode(v117.action_params);
    end;
    if v117.actionParams ~= nil then
        v118.action_params = v2.OpenSocialLinkAction_Params.jsonDecode(v117.actionParams);
    end;
    return v118;
end;
v7.descriptor = {
    name = "OpenSocialLinkAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenSocialLinkAction"
};
v2.OpenSocialLinkAction = v7;
v1.default:register(v2.OpenSocialLinkAction);
v7 = {};
v7.__index = v7;
local l_v7_5 = v7 --[[ copy: 7 -> 13 ]];
v7.new = function(v120) --[[ Line: 2598 ]] --[[ Name: new ]]
    -- upvalues: l_v7_5 (copy)
    return (setmetatable({
        assignment_id = if not (v120 ~= nil) or v120.assignment_id == nil then nil else v120.assignment_id, 
        assignment_type = if not (v120 ~= nil) or v120.assignment_type == nil then nil else v120.assignment_type, 
        social_link_type = if not (v120 ~= nil) or v120.social_link_type == nil then nil else v120.social_link_type, 
        social_link_url = if not (v120 ~= nil) or v120.social_link_url == nil then nil else v120.social_link_url, 
        social_link_display_type = if not (v120 ~= nil) or v120.social_link_display_type == nil then nil else v120.social_link_display_type
    }, l_v7_5));
end;
v7.encode = function(v121) --[[ Line: 2612 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v122 = buffer.create(0);
    local v123 = 0;
    if v121.assignment_id ~= nil then
        local v124 = v121.assignment_id:encode();
        local v125, v126 = v0.writeTag(v122, v123, 1, v0.wireTypes.lengthDelimited);
        v125, v126 = v0.writeBuffer(v125, v126, v124, buffer.len(v124));
        v122 = v125;
        v123 = v126;
    end;
    if v121.assignment_type ~= nil then
        local v127 = v121.assignment_type:encode();
        local v128, v129 = v0.writeTag(v122, v123, 2, v0.wireTypes.lengthDelimited);
        v128, v129 = v0.writeBuffer(v128, v129, v127, buffer.len(v127));
        v122 = v128;
        v123 = v129;
    end;
    if v121.social_link_type ~= nil then
        local v130 = v121.social_link_type:encode();
        local v131, v132 = v0.writeTag(v122, v123, 3, v0.wireTypes.lengthDelimited);
        v131, v132 = v0.writeBuffer(v131, v132, v130, buffer.len(v130));
        v122 = v131;
        v123 = v132;
    end;
    if v121.social_link_url ~= nil then
        local v133 = v121.social_link_url:encode();
        local v134, v135 = v0.writeTag(v122, v123, 4, v0.wireTypes.lengthDelimited);
        v134, v135 = v0.writeBuffer(v134, v135, v133, buffer.len(v133));
        v122 = v134;
        v123 = v135;
    end;
    if v121.social_link_display_type ~= nil then
        local v136 = v121.social_link_display_type:encode();
        local v137, v138 = v0.writeTag(v122, v123, 5, v0.wireTypes.lengthDelimited);
        v137, v138 = v0.writeBuffer(v137, v138, v136, buffer.len(v136));
        v122 = v137;
        v123 = v138;
    end;
    local v139 = buffer.create(v123);
    buffer.copy(v139, 0, v122, 0, v123);
    return v139;
end;
v7.decode = function(v140) --[[ Line: 2651 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_5 (copy), v0 (copy), v5 (copy)
    local v141 = l_v7_5.new();
    local v142 = 0;
    while v142 < buffer.len(v140) do
        local v143 = nil;
        local v144 = nil;
        local v145, v146, v147 = v0.readTag(v140, v142);
        v143 = v145;
        v144 = v146;
        v142 = v147;
        if v144 == v0.wireTypes.varint then
            v145 = nil;
            v146, v147 = v0.readVarInt(v140, v142);
            v145 = v146;
            v142 = v147;
        elseif v144 == v0.wireTypes.lengthDelimited then
            if v143 == 1 then
                v145 = nil;
                v146, v147 = v0.readBuffer(v140, v142);
                v145 = v146;
                v142 = v147;
                v141.assignment_id = v5.StringProp.decode(v145);
            elseif v143 == 2 then
                v145 = nil;
                v146, v147 = v0.readBuffer(v140, v142);
                v145 = v146;
                v142 = v147;
                v141.assignment_type = v5.StringProp.decode(v145);
            elseif v143 == 3 then
                v145 = nil;
                v146, v147 = v0.readBuffer(v140, v142);
                v145 = v146;
                v142 = v147;
                v141.social_link_type = v5.StringProp.decode(v145);
            elseif v143 == 4 then
                v145 = nil;
                v146, v147 = v0.readBuffer(v140, v142);
                v145 = v146;
                v142 = v147;
                v141.social_link_url = v5.StringProp.decode(v145);
            elseif v143 == 5 then
                v145 = nil;
                v146, v147 = v0.readBuffer(v140, v142);
                v145 = v146;
                v142 = v147;
                v141.social_link_display_type = v5.StringProp.decode(v145);
            else
                v145 = nil;
                v146, v147 = v0.readVarInt(v140, v142);
                v142 = v147 + v146;
            end;
        elseif v144 == v0.wireTypes.i32 then
            v145 = nil;
            v146, v147 = v0.readFixed32(v140, v142);
            v145 = v146;
            v142 = v147;
        elseif v144 == v0.wireTypes.i64 then
            v145 = nil;
            v146, v147 = v0.readFixed64(v140, v142);
            v145 = v146;
            v142 = v147;
        else
            error("Unsupported wire type: " .. v144);
        end;
    end;
    return v141;
end;
v7.jsonEncode = function(v148) --[[ Line: 2715 ]] --[[ Name: jsonEncode ]]
    local v149 = {};
    if v148.assignment_id ~= nil then
        v149.assignmentId = v148.assignment_id:jsonEncode();
    end;
    if v148.assignment_type ~= nil then
        v149.assignmentType = v148.assignment_type:jsonEncode();
    end;
    if v148.social_link_type ~= nil then
        v149.socialLinkType = v148.social_link_type:jsonEncode();
    end;
    if v148.social_link_url ~= nil then
        v149.socialLinkUrl = v148.social_link_url:jsonEncode();
    end;
    if v148.social_link_display_type ~= nil then
        v149.socialLinkDisplayType = v148.social_link_display_type:jsonEncode();
    end;
    return v149;
end;
v7.jsonDecode = function(v150) --[[ Line: 2741 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_5 (copy), v5 (copy)
    local v151 = l_v7_5.new();
    if v150.assignment_id ~= nil then
        v151.assignment_id = v5.StringProp.jsonDecode(v150.assignment_id);
    end;
    if v150.assignmentId ~= nil then
        v151.assignment_id = v5.StringProp.jsonDecode(v150.assignmentId);
    end;
    if v150.assignment_type ~= nil then
        v151.assignment_type = v5.StringProp.jsonDecode(v150.assignment_type);
    end;
    if v150.assignmentType ~= nil then
        v151.assignment_type = v5.StringProp.jsonDecode(v150.assignmentType);
    end;
    if v150.social_link_type ~= nil then
        v151.social_link_type = v5.StringProp.jsonDecode(v150.social_link_type);
    end;
    if v150.socialLinkType ~= nil then
        v151.social_link_type = v5.StringProp.jsonDecode(v150.socialLinkType);
    end;
    if v150.social_link_url ~= nil then
        v151.social_link_url = v5.StringProp.jsonDecode(v150.social_link_url);
    end;
    if v150.socialLinkUrl ~= nil then
        v151.social_link_url = v5.StringProp.jsonDecode(v150.socialLinkUrl);
    end;
    if v150.social_link_display_type ~= nil then
        v151.social_link_display_type = v5.StringProp.jsonDecode(v150.social_link_display_type);
    end;
    if v150.socialLinkDisplayType ~= nil then
        v151.social_link_display_type = v5.StringProp.jsonDecode(v150.socialLinkDisplayType);
    end;
    return v151;
end;
v7.descriptor = {
    name = "OpenSocialLinkAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenSocialLinkAction_Params = v7;
v1.default:register(v2.OpenSocialLinkAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_6 = v7 --[[ copy: 7 -> 14 ]];
v7.new = function(v153) --[[ Line: 2811 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_6 (copy)
    return (setmetatable({
        action_type = if not (v153 ~= nil) or v153.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v153.action_type, 
        action_params = if not (v153 ~= nil) or v153.action_params == nil then nil else v153.action_params
    }, l_v7_6));
end;
v7.encode = function(v154) --[[ Line: 2820 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v155 = buffer.create(0);
    local v156 = 0;
    if v154.action_type ~= nil and (v154.action_type ~= nil and v154.action_type ~= 0 or v154.action_type ~= v2.ActionType.fromNumber(0)) then
        local v157, v158 = v0.writeTag(v155, v156, 1, v0.wireTypes.varint);
        v157, v158 = v0.writeVarInt(v157, v158, v2.ActionType.toNumber(v154.action_type));
        v155 = v157;
        v156 = v158;
    end;
    if v154.action_params ~= nil then
        local v159 = v154.action_params:encode();
        local v160, v161 = v0.writeTag(v155, v156, 2, v0.wireTypes.lengthDelimited);
        v160, v161 = v0.writeBuffer(v160, v161, v159, buffer.len(v159));
        v155 = v160;
        v156 = v161;
    end;
    local v162 = buffer.create(v156);
    buffer.copy(v162, 0, v155, 0, v156);
    return v162;
end;
v7.decode = function(v163) --[[ Line: 2846 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_6 (copy), v0 (copy), v2 (copy)
    local v164 = l_v7_6.new();
    local v165 = 0;
    while v165 < buffer.len(v163) do
        local v166 = nil;
        local v167 = nil;
        local v168, v169, v170 = v0.readTag(v163, v165);
        v166 = v168;
        v167 = v169;
        v165 = v170;
        if v167 == v0.wireTypes.varint then
            if v166 == 1 then
                v168 = nil;
                v169, v170 = v0.readVarIntI32(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.action_type = v2.ActionType.fromNumber(v168) or v168;
            else
                v168 = nil;
                v169, v170 = v0.readVarInt(v163, v165);
                v168 = v169;
                v165 = v170;
            end;
        elseif v167 == v0.wireTypes.lengthDelimited then
            if v166 == 2 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.action_params = v2.OpenGameDetailsAction_Params.decode(v168);
            else
                v168 = nil;
                v169, v170 = v0.readVarInt(v163, v165);
                v165 = v170 + v169;
            end;
        elseif v167 == v0.wireTypes.i32 then
            v168 = nil;
            v169, v170 = v0.readFixed32(v163, v165);
            v168 = v169;
            v165 = v170;
        elseif v167 == v0.wireTypes.i64 then
            v168 = nil;
            v169, v170 = v0.readFixed64(v163, v165);
            v168 = v169;
            v165 = v170;
        else
            error("Unsupported wire type: " .. v167);
        end;
    end;
    return v164;
end;
v7.jsonEncode = function(v171) --[[ Line: 2894 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v172 = {};
    if v171.action_type ~= nil and (v171.action_type ~= nil and v171.action_type ~= 0 or v171.action_type ~= v2.ActionType.fromNumber(0)) then
        v172.actionType = if typeof(v171.action_type) == "number" then v171.action_type else v2.ActionType.toNumber(v171.action_type);
    end;
    if v171.action_params ~= nil then
        v172.actionParams = v171.action_params:jsonEncode();
    end;
    return v172;
end;
v7.jsonDecode = function(v173) --[[ Line: 2916 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_6 (copy), v2 (copy)
    local v174 = l_v7_6.new();
    if v173.action_type ~= nil then
        v174.action_type = if typeof(v173.action_type) == "number" then v2.ActionType.fromNumber(v173.action_type) or v173.action_type else v2.ActionType.fromName(v173.action_type) or v173.action_type;
    end;
    if v173.actionType ~= nil then
        v174.action_type = if typeof(v173.actionType) == "number" then v2.ActionType.fromNumber(v173.actionType) or v173.actionType else v2.ActionType.fromName(v173.actionType) or v173.actionType;
    end;
    if v173.action_params ~= nil then
        v174.action_params = v2.OpenGameDetailsAction_Params.jsonDecode(v173.action_params);
    end;
    if v173.actionParams ~= nil then
        v174.action_params = v2.OpenGameDetailsAction_Params.jsonDecode(v173.actionParams);
    end;
    return v174;
end;
v7.descriptor = {
    name = "OpenGameDetailsAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameDetailsAction"
};
v2.OpenGameDetailsAction = v7;
v1.default:register(v2.OpenGameDetailsAction);
v7 = {};
v7.__index = v7;
local l_v7_7 = v7 --[[ copy: 7 -> 15 ]];
v7.new = function(v176) --[[ Line: 2956 ]] --[[ Name: new ]]
    -- upvalues: l_v7_7 (copy)
    return (setmetatable({
        place_id = if not (v176 ~= nil) or v176.place_id == nil then nil else v176.place_id, 
        universe_id = if not (v176 ~= nil) or v176.universe_id == nil then nil else v176.universe_id
    }, l_v7_7));
end;
v7.encode = function(v177) --[[ Line: 2965 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v178 = buffer.create(0);
    local v179 = 0;
    if v177.place_id ~= nil then
        local v180 = v177.place_id:encode();
        local v181, v182 = v0.writeTag(v178, v179, 1, v0.wireTypes.lengthDelimited);
        v181, v182 = v0.writeBuffer(v181, v182, v180, buffer.len(v180));
        v178 = v181;
        v179 = v182;
    end;
    if v177.universe_id ~= nil then
        local v183 = v177.universe_id:encode();
        local v184, v185 = v0.writeTag(v178, v179, 2, v0.wireTypes.lengthDelimited);
        v184, v185 = v0.writeBuffer(v184, v185, v183, buffer.len(v183));
        v178 = v184;
        v179 = v185;
    end;
    local v186 = buffer.create(v179);
    buffer.copy(v186, 0, v178, 0, v179);
    return v186;
end;
v7.decode = function(v187) --[[ Line: 2986 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_7 (copy), v0 (copy), v5 (copy)
    local v188 = l_v7_7.new();
    local v189 = 0;
    while v189 < buffer.len(v187) do
        local v190 = nil;
        local v191 = nil;
        local v192, v193, v194 = v0.readTag(v187, v189);
        v190 = v192;
        v191 = v193;
        v189 = v194;
        if v191 == v0.wireTypes.varint then
            v192 = nil;
            v193, v194 = v0.readVarInt(v187, v189);
            v192 = v193;
            v189 = v194;
        elseif v191 == v0.wireTypes.lengthDelimited then
            if v190 == 1 then
                v192 = nil;
                v193, v194 = v0.readBuffer(v187, v189);
                v192 = v193;
                v189 = v194;
                v188.place_id = v5.StringProp.decode(v192);
            elseif v190 == 2 then
                v192 = nil;
                v193, v194 = v0.readBuffer(v187, v189);
                v192 = v193;
                v189 = v194;
                v188.universe_id = v5.StringProp.decode(v192);
            else
                v192 = nil;
                v193, v194 = v0.readVarInt(v187, v189);
                v189 = v194 + v193;
            end;
        elseif v191 == v0.wireTypes.i32 then
            v192 = nil;
            v193, v194 = v0.readFixed32(v187, v189);
            v192 = v193;
            v189 = v194;
        elseif v191 == v0.wireTypes.i64 then
            v192 = nil;
            v193, v194 = v0.readFixed64(v187, v189);
            v192 = v193;
            v189 = v194;
        else
            error("Unsupported wire type: " .. v191);
        end;
    end;
    return v188;
end;
v7.jsonEncode = function(v195) --[[ Line: 3034 ]] --[[ Name: jsonEncode ]]
    local v196 = {};
    if v195.place_id ~= nil then
        v196.placeId = v195.place_id:jsonEncode();
    end;
    if v195.universe_id ~= nil then
        v196.universeId = v195.universe_id:jsonEncode();
    end;
    return v196;
end;
v7.jsonDecode = function(v197) --[[ Line: 3048 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_7 (copy), v5 (copy)
    local v198 = l_v7_7.new();
    if v197.place_id ~= nil then
        v198.place_id = v5.StringProp.jsonDecode(v197.place_id);
    end;
    if v197.placeId ~= nil then
        v198.place_id = v5.StringProp.jsonDecode(v197.placeId);
    end;
    if v197.universe_id ~= nil then
        v198.universe_id = v5.StringProp.jsonDecode(v197.universe_id);
    end;
    if v197.universeId ~= nil then
        v198.universe_id = v5.StringProp.jsonDecode(v197.universeId);
    end;
    return v198;
end;
v7.descriptor = {
    name = "OpenGameDetailsAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenGameDetailsAction_Params = v7;
v1.default:register(v2.OpenGameDetailsAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_8 = v7 --[[ copy: 7 -> 16 ]];
v7.new = function(v200) --[[ Line: 3085 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_8 (copy)
    return (setmetatable({
        action_type = if not (v200 ~= nil) or v200.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v200.action_type, 
        action_params = if not (v200 ~= nil) or v200.action_params == nil then nil else v200.action_params
    }, l_v7_8));
end;
v7.encode = function(v201) --[[ Line: 3094 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v202 = buffer.create(0);
    local v203 = 0;
    if v201.action_type ~= nil and (v201.action_type ~= nil and v201.action_type ~= 0 or v201.action_type ~= v2.ActionType.fromNumber(0)) then
        local v204, v205 = v0.writeTag(v202, v203, 1, v0.wireTypes.varint);
        v204, v205 = v0.writeVarInt(v204, v205, v2.ActionType.toNumber(v201.action_type));
        v202 = v204;
        v203 = v205;
    end;
    if v201.action_params ~= nil then
        local v206 = v201.action_params:encode();
        local v207, v208 = v0.writeTag(v202, v203, 2, v0.wireTypes.lengthDelimited);
        v207, v208 = v0.writeBuffer(v207, v208, v206, buffer.len(v206));
        v202 = v207;
        v203 = v208;
    end;
    local v209 = buffer.create(v203);
    buffer.copy(v209, 0, v202, 0, v203);
    return v209;
end;
v7.decode = function(v210) --[[ Line: 3120 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_8 (copy), v0 (copy), v2 (copy)
    local v211 = l_v7_8.new();
    local v212 = 0;
    while v212 < buffer.len(v210) do
        local v213 = nil;
        local v214 = nil;
        local v215, v216, v217 = v0.readTag(v210, v212);
        v213 = v215;
        v214 = v216;
        v212 = v217;
        if v214 == v0.wireTypes.varint then
            if v213 == 1 then
                v215 = nil;
                v216, v217 = v0.readVarIntI32(v210, v212);
                v215 = v216;
                v212 = v217;
                v211.action_type = v2.ActionType.fromNumber(v215) or v215;
            else
                v215 = nil;
                v216, v217 = v0.readVarInt(v210, v212);
                v215 = v216;
                v212 = v217;
            end;
        elseif v214 == v0.wireTypes.lengthDelimited then
            if v213 == 2 then
                v215 = nil;
                v216, v217 = v0.readBuffer(v210, v212);
                v215 = v216;
                v212 = v217;
                v211.action_params = v2.OpenJoinFriendsAction_Params.decode(v215);
            else
                v215 = nil;
                v216, v217 = v0.readVarInt(v210, v212);
                v212 = v217 + v216;
            end;
        elseif v214 == v0.wireTypes.i32 then
            v215 = nil;
            v216, v217 = v0.readFixed32(v210, v212);
            v215 = v216;
            v212 = v217;
        elseif v214 == v0.wireTypes.i64 then
            v215 = nil;
            v216, v217 = v0.readFixed64(v210, v212);
            v215 = v216;
            v212 = v217;
        else
            error("Unsupported wire type: " .. v214);
        end;
    end;
    return v211;
end;
v7.jsonEncode = function(v218) --[[ Line: 3168 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v219 = {};
    if v218.action_type ~= nil and (v218.action_type ~= nil and v218.action_type ~= 0 or v218.action_type ~= v2.ActionType.fromNumber(0)) then
        v219.actionType = if typeof(v218.action_type) == "number" then v218.action_type else v2.ActionType.toNumber(v218.action_type);
    end;
    if v218.action_params ~= nil then
        v219.actionParams = v218.action_params:jsonEncode();
    end;
    return v219;
end;
v7.jsonDecode = function(v220) --[[ Line: 3190 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_8 (copy), v2 (copy)
    local v221 = l_v7_8.new();
    if v220.action_type ~= nil then
        v221.action_type = if typeof(v220.action_type) == "number" then v2.ActionType.fromNumber(v220.action_type) or v220.action_type else v2.ActionType.fromName(v220.action_type) or v220.action_type;
    end;
    if v220.actionType ~= nil then
        v221.action_type = if typeof(v220.actionType) == "number" then v2.ActionType.fromNumber(v220.actionType) or v220.actionType else v2.ActionType.fromName(v220.actionType) or v220.actionType;
    end;
    if v220.action_params ~= nil then
        v221.action_params = v2.OpenJoinFriendsAction_Params.jsonDecode(v220.action_params);
    end;
    if v220.actionParams ~= nil then
        v221.action_params = v2.OpenJoinFriendsAction_Params.jsonDecode(v220.actionParams);
    end;
    return v221;
end;
v7.descriptor = {
    name = "OpenJoinFriendsAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenJoinFriendsAction"
};
v2.OpenJoinFriendsAction = v7;
v1.default:register(v2.OpenJoinFriendsAction);
v7 = {};
v7.__index = v7;
local l_v7_9 = v7 --[[ copy: 7 -> 17 ]];
v7.new = function(v223) --[[ Line: 3230 ]] --[[ Name: new ]]
    -- upvalues: l_v7_9 (copy)
    return (setmetatable({
        place_id = if not (v223 ~= nil) or v223.place_id == nil then nil else v223.place_id, 
        universe_id = if not (v223 ~= nil) or v223.universe_id == nil then nil else v223.universe_id
    }, l_v7_9));
end;
v7.encode = function(v224) --[[ Line: 3239 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v225 = buffer.create(0);
    local v226 = 0;
    if v224.place_id ~= nil then
        local v227 = v224.place_id:encode();
        local v228, v229 = v0.writeTag(v225, v226, 1, v0.wireTypes.lengthDelimited);
        v228, v229 = v0.writeBuffer(v228, v229, v227, buffer.len(v227));
        v225 = v228;
        v226 = v229;
    end;
    if v224.universe_id ~= nil then
        local v230 = v224.universe_id:encode();
        local v231, v232 = v0.writeTag(v225, v226, 2, v0.wireTypes.lengthDelimited);
        v231, v232 = v0.writeBuffer(v231, v232, v230, buffer.len(v230));
        v225 = v231;
        v226 = v232;
    end;
    local v233 = buffer.create(v226);
    buffer.copy(v233, 0, v225, 0, v226);
    return v233;
end;
v7.decode = function(v234) --[[ Line: 3260 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_9 (copy), v0 (copy), v5 (copy)
    local v235 = l_v7_9.new();
    local v236 = 0;
    while v236 < buffer.len(v234) do
        local v237 = nil;
        local v238 = nil;
        local v239, v240, v241 = v0.readTag(v234, v236);
        v237 = v239;
        v238 = v240;
        v236 = v241;
        if v238 == v0.wireTypes.varint then
            v239 = nil;
            v240, v241 = v0.readVarInt(v234, v236);
            v239 = v240;
            v236 = v241;
        elseif v238 == v0.wireTypes.lengthDelimited then
            if v237 == 1 then
                v239 = nil;
                v240, v241 = v0.readBuffer(v234, v236);
                v239 = v240;
                v236 = v241;
                v235.place_id = v5.StringProp.decode(v239);
            elseif v237 == 2 then
                v239 = nil;
                v240, v241 = v0.readBuffer(v234, v236);
                v239 = v240;
                v236 = v241;
                v235.universe_id = v5.StringProp.decode(v239);
            else
                v239 = nil;
                v240, v241 = v0.readVarInt(v234, v236);
                v236 = v241 + v240;
            end;
        elseif v238 == v0.wireTypes.i32 then
            v239 = nil;
            v240, v241 = v0.readFixed32(v234, v236);
            v239 = v240;
            v236 = v241;
        elseif v238 == v0.wireTypes.i64 then
            v239 = nil;
            v240, v241 = v0.readFixed64(v234, v236);
            v239 = v240;
            v236 = v241;
        else
            error("Unsupported wire type: " .. v238);
        end;
    end;
    return v235;
end;
v7.jsonEncode = function(v242) --[[ Line: 3308 ]] --[[ Name: jsonEncode ]]
    local v243 = {};
    if v242.place_id ~= nil then
        v243.placeId = v242.place_id:jsonEncode();
    end;
    if v242.universe_id ~= nil then
        v243.universeId = v242.universe_id:jsonEncode();
    end;
    return v243;
end;
v7.jsonDecode = function(v244) --[[ Line: 3322 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_9 (copy), v5 (copy)
    local v245 = l_v7_9.new();
    if v244.place_id ~= nil then
        v245.place_id = v5.StringProp.jsonDecode(v244.place_id);
    end;
    if v244.placeId ~= nil then
        v245.place_id = v5.StringProp.jsonDecode(v244.placeId);
    end;
    if v244.universe_id ~= nil then
        v245.universe_id = v5.StringProp.jsonDecode(v244.universe_id);
    end;
    if v244.universeId ~= nil then
        v245.universe_id = v5.StringProp.jsonDecode(v244.universeId);
    end;
    return v245;
end;
v7.descriptor = {
    name = "OpenJoinFriendsAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenJoinFriendsAction_Params = v7;
v1.default:register(v2.OpenJoinFriendsAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_10 = v7 --[[ copy: 7 -> 18 ]];
v7.new = function(v247) --[[ Line: 3359 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_10 (copy)
    return (setmetatable({
        action_type = if not (v247 ~= nil) or v247.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v247.action_type, 
        action_params = if not (v247 ~= nil) or v247.action_params == nil then nil else v247.action_params
    }, l_v7_10));
end;
v7.encode = function(v248) --[[ Line: 3370 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v249 = buffer.create(0);
    local v250 = 0;
    if v248.action_type ~= nil and (v248.action_type ~= nil and v248.action_type ~= 0 or v248.action_type ~= v2.ActionType.fromNumber(0)) then
        local v251, v252 = v0.writeTag(v249, v250, 1, v0.wireTypes.varint);
        v251, v252 = v0.writeVarInt(v251, v252, v2.ActionType.toNumber(v248.action_type));
        v249 = v251;
        v250 = v252;
    end;
    if v248.action_params ~= nil then
        local v253 = v248.action_params:encode();
        local v254, v255 = v0.writeTag(v249, v250, 2, v0.wireTypes.lengthDelimited);
        v254, v255 = v0.writeBuffer(v254, v255, v253, buffer.len(v253));
        v249 = v254;
        v250 = v255;
    end;
    local v256 = buffer.create(v250);
    buffer.copy(v256, 0, v249, 0, v250);
    return v256;
end;
v7.decode = function(v257) --[[ Line: 3396 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_10 (copy), v0 (copy), v2 (copy)
    local v258 = l_v7_10.new();
    local v259 = 0;
    while v259 < buffer.len(v257) do
        local v260 = nil;
        local v261 = nil;
        local v262, v263, v264 = v0.readTag(v257, v259);
        v260 = v262;
        v261 = v263;
        v259 = v264;
        if v261 == v0.wireTypes.varint then
            if v260 == 1 then
                v262 = nil;
                v263, v264 = v0.readVarIntI32(v257, v259);
                v262 = v263;
                v259 = v264;
                v258.action_type = v2.ActionType.fromNumber(v262) or v262;
            else
                v262 = nil;
                v263, v264 = v0.readVarInt(v257, v259);
                v262 = v263;
                v259 = v264;
            end;
        elseif v261 == v0.wireTypes.lengthDelimited then
            if v260 == 2 then
                v262 = nil;
                v263, v264 = v0.readBuffer(v257, v259);
                v262 = v263;
                v259 = v264;
                v258.action_params = v2.OpenMarketplaceTryOnAction_Params.decode(v262);
            else
                v262 = nil;
                v263, v264 = v0.readVarInt(v257, v259);
                v259 = v264 + v263;
            end;
        elseif v261 == v0.wireTypes.i32 then
            v262 = nil;
            v263, v264 = v0.readFixed32(v257, v259);
            v262 = v263;
            v259 = v264;
        elseif v261 == v0.wireTypes.i64 then
            v262 = nil;
            v263, v264 = v0.readFixed64(v257, v259);
            v262 = v263;
            v259 = v264;
        else
            error("Unsupported wire type: " .. v261);
        end;
    end;
    return v258;
end;
v7.jsonEncode = function(v265) --[[ Line: 3444 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v266 = {};
    if v265.action_type ~= nil and (v265.action_type ~= nil and v265.action_type ~= 0 or v265.action_type ~= v2.ActionType.fromNumber(0)) then
        v266.actionType = if typeof(v265.action_type) == "number" then v265.action_type else v2.ActionType.toNumber(v265.action_type);
    end;
    if v265.action_params ~= nil then
        v266.actionParams = v265.action_params:jsonEncode();
    end;
    return v266;
end;
v7.jsonDecode = function(v267) --[[ Line: 3466 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_10 (copy), v2 (copy)
    local v268 = l_v7_10.new();
    if v267.action_type ~= nil then
        v268.action_type = if typeof(v267.action_type) == "number" then v2.ActionType.fromNumber(v267.action_type) or v267.action_type else v2.ActionType.fromName(v267.action_type) or v267.action_type;
    end;
    if v267.actionType ~= nil then
        v268.action_type = if typeof(v267.actionType) == "number" then v2.ActionType.fromNumber(v267.actionType) or v267.actionType else v2.ActionType.fromName(v267.actionType) or v267.actionType;
    end;
    if v267.action_params ~= nil then
        v268.action_params = v2.OpenMarketplaceTryOnAction_Params.jsonDecode(v267.action_params);
    end;
    if v267.actionParams ~= nil then
        v268.action_params = v2.OpenMarketplaceTryOnAction_Params.jsonDecode(v267.actionParams);
    end;
    return v268;
end;
v7.descriptor = {
    name = "OpenMarketplaceTryOnAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceTryOnAction"
};
v2.OpenMarketplaceTryOnAction = v7;
v1.default:register(v2.OpenMarketplaceTryOnAction);
v7 = {};
v7.__index = v7;
local l_v7_11 = v7 --[[ copy: 7 -> 19 ]];
v7.new = function(v270) --[[ Line: 3506 ]] --[[ Name: new ]]
    -- upvalues: l_v7_11 (copy)
    return (setmetatable({
        item_id = if not (v270 ~= nil) or v270.item_id == nil then nil else v270.item_id, 
        item_type = if not (v270 ~= nil) or v270.item_type == nil then nil else v270.item_type, 
        item_sub_type_name = if not (v270 ~= nil) or v270.item_sub_type_name == nil then nil else v270.item_sub_type_name
    }, l_v7_11));
end;
v7.encode = function(v271) --[[ Line: 3516 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v272 = buffer.create(0);
    local v273 = 0;
    if v271.item_id ~= nil then
        local v274 = v271.item_id:encode();
        local v275, v276 = v0.writeTag(v272, v273, 1, v0.wireTypes.lengthDelimited);
        v275, v276 = v0.writeBuffer(v275, v276, v274, buffer.len(v274));
        v272 = v275;
        v273 = v276;
    end;
    if v271.item_type ~= nil then
        local v277 = v271.item_type:encode();
        local v278, v279 = v0.writeTag(v272, v273, 2, v0.wireTypes.lengthDelimited);
        v278, v279 = v0.writeBuffer(v278, v279, v277, buffer.len(v277));
        v272 = v278;
        v273 = v279;
    end;
    if v271.item_sub_type_name ~= nil then
        local v280 = v271.item_sub_type_name:encode();
        local v281, v282 = v0.writeTag(v272, v273, 3, v0.wireTypes.lengthDelimited);
        v281, v282 = v0.writeBuffer(v281, v282, v280, buffer.len(v280));
        v272 = v281;
        v273 = v282;
    end;
    local v283 = buffer.create(v273);
    buffer.copy(v283, 0, v272, 0, v273);
    return v283;
end;
v7.decode = function(v284) --[[ Line: 3543 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_11 (copy), v0 (copy), v5 (copy)
    local v285 = l_v7_11.new();
    local v286 = 0;
    while v286 < buffer.len(v284) do
        local v287 = nil;
        local v288 = nil;
        local v289, v290, v291 = v0.readTag(v284, v286);
        v287 = v289;
        v288 = v290;
        v286 = v291;
        if v288 == v0.wireTypes.varint then
            v289 = nil;
            v290, v291 = v0.readVarInt(v284, v286);
            v289 = v290;
            v286 = v291;
        elseif v288 == v0.wireTypes.lengthDelimited then
            if v287 == 1 then
                v289 = nil;
                v290, v291 = v0.readBuffer(v284, v286);
                v289 = v290;
                v286 = v291;
                v285.item_id = v5.StringProp.decode(v289);
            elseif v287 == 2 then
                v289 = nil;
                v290, v291 = v0.readBuffer(v284, v286);
                v289 = v290;
                v286 = v291;
                v285.item_type = v5.StringProp.decode(v289);
            elseif v287 == 3 then
                v289 = nil;
                v290, v291 = v0.readBuffer(v284, v286);
                v289 = v290;
                v286 = v291;
                v285.item_sub_type_name = v5.StringProp.decode(v289);
            else
                v289 = nil;
                v290, v291 = v0.readVarInt(v284, v286);
                v286 = v291 + v290;
            end;
        elseif v288 == v0.wireTypes.i32 then
            v289 = nil;
            v290, v291 = v0.readFixed32(v284, v286);
            v289 = v290;
            v286 = v291;
        elseif v288 == v0.wireTypes.i64 then
            v289 = nil;
            v290, v291 = v0.readFixed64(v284, v286);
            v289 = v290;
            v286 = v291;
        else
            error("Unsupported wire type: " .. v288);
        end;
    end;
    return v285;
end;
v7.jsonEncode = function(v292) --[[ Line: 3596 ]] --[[ Name: jsonEncode ]]
    local v293 = {};
    if v292.item_id ~= nil then
        v293.itemId = v292.item_id:jsonEncode();
    end;
    if v292.item_type ~= nil then
        v293.itemType = v292.item_type:jsonEncode();
    end;
    if v292.item_sub_type_name ~= nil then
        v293.itemSubTypeName = v292.item_sub_type_name:jsonEncode();
    end;
    return v293;
end;
v7.jsonDecode = function(v294) --[[ Line: 3614 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_11 (copy), v5 (copy)
    local v295 = l_v7_11.new();
    if v294.item_id ~= nil then
        v295.item_id = v5.StringProp.jsonDecode(v294.item_id);
    end;
    if v294.itemId ~= nil then
        v295.item_id = v5.StringProp.jsonDecode(v294.itemId);
    end;
    if v294.item_type ~= nil then
        v295.item_type = v5.StringProp.jsonDecode(v294.item_type);
    end;
    if v294.itemType ~= nil then
        v295.item_type = v5.StringProp.jsonDecode(v294.itemType);
    end;
    if v294.item_sub_type_name ~= nil then
        v295.item_sub_type_name = v5.StringProp.jsonDecode(v294.item_sub_type_name);
    end;
    if v294.itemSubTypeName ~= nil then
        v295.item_sub_type_name = v5.StringProp.jsonDecode(v294.itemSubTypeName);
    end;
    return v295;
end;
v7.descriptor = {
    name = "OpenMarketplaceTryOnAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenMarketplaceTryOnAction_Params = v7;
v1.default:register(v2.OpenMarketplaceTryOnAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_12 = v7 --[[ copy: 7 -> 20 ]];
v7.new = function(v297) --[[ Line: 3662 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_12 (copy)
    return (setmetatable({
        action_type = if not (v297 ~= nil) or v297.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v297.action_type, 
        action_params = if not (v297 ~= nil) or v297.action_params == nil then nil else v297.action_params
    }, l_v7_12));
end;
v7.encode = function(v298) --[[ Line: 3671 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v299 = buffer.create(0);
    local v300 = 0;
    if v298.action_type ~= nil and (v298.action_type ~= nil and v298.action_type ~= 0 or v298.action_type ~= v2.ActionType.fromNumber(0)) then
        local v301, v302 = v0.writeTag(v299, v300, 1, v0.wireTypes.varint);
        v301, v302 = v0.writeVarInt(v301, v302, v2.ActionType.toNumber(v298.action_type));
        v299 = v301;
        v300 = v302;
    end;
    if v298.action_params ~= nil then
        local v303 = v298.action_params:encode();
        local v304, v305 = v0.writeTag(v299, v300, 2, v0.wireTypes.lengthDelimited);
        v304, v305 = v0.writeBuffer(v304, v305, v303, buffer.len(v303));
        v299 = v304;
        v300 = v305;
    end;
    local v306 = buffer.create(v300);
    buffer.copy(v306, 0, v299, 0, v300);
    return v306;
end;
v7.decode = function(v307) --[[ Line: 3697 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_12 (copy), v0 (copy), v2 (copy)
    local v308 = l_v7_12.new();
    local v309 = 0;
    while v309 < buffer.len(v307) do
        local v310 = nil;
        local v311 = nil;
        local v312, v313, v314 = v0.readTag(v307, v309);
        v310 = v312;
        v311 = v313;
        v309 = v314;
        if v311 == v0.wireTypes.varint then
            if v310 == 1 then
                v312 = nil;
                v313, v314 = v0.readVarIntI32(v307, v309);
                v312 = v313;
                v309 = v314;
                v308.action_type = v2.ActionType.fromNumber(v312) or v312;
            else
                v312 = nil;
                v313, v314 = v0.readVarInt(v307, v309);
                v312 = v313;
                v309 = v314;
            end;
        elseif v311 == v0.wireTypes.lengthDelimited then
            if v310 == 2 then
                v312 = nil;
                v313, v314 = v0.readBuffer(v307, v309);
                v312 = v313;
                v309 = v314;
                v308.action_params = v2.OpenSeeAllAction_Params.decode(v312);
            else
                v312 = nil;
                v313, v314 = v0.readVarInt(v307, v309);
                v309 = v314 + v313;
            end;
        elseif v311 == v0.wireTypes.i32 then
            v312 = nil;
            v313, v314 = v0.readFixed32(v307, v309);
            v312 = v313;
            v309 = v314;
        elseif v311 == v0.wireTypes.i64 then
            v312 = nil;
            v313, v314 = v0.readFixed64(v307, v309);
            v312 = v313;
            v309 = v314;
        else
            error("Unsupported wire type: " .. v311);
        end;
    end;
    return v308;
end;
v7.jsonEncode = function(v315) --[[ Line: 3745 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v316 = {};
    if v315.action_type ~= nil and (v315.action_type ~= nil and v315.action_type ~= 0 or v315.action_type ~= v2.ActionType.fromNumber(0)) then
        v316.actionType = if typeof(v315.action_type) == "number" then v315.action_type else v2.ActionType.toNumber(v315.action_type);
    end;
    if v315.action_params ~= nil then
        v316.actionParams = v315.action_params:jsonEncode();
    end;
    return v316;
end;
v7.jsonDecode = function(v317) --[[ Line: 3767 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_12 (copy), v2 (copy)
    local v318 = l_v7_12.new();
    if v317.action_type ~= nil then
        v318.action_type = if typeof(v317.action_type) == "number" then v2.ActionType.fromNumber(v317.action_type) or v317.action_type else v2.ActionType.fromName(v317.action_type) or v317.action_type;
    end;
    if v317.actionType ~= nil then
        v318.action_type = if typeof(v317.actionType) == "number" then v2.ActionType.fromNumber(v317.actionType) or v317.actionType else v2.ActionType.fromName(v317.actionType) or v317.actionType;
    end;
    if v317.action_params ~= nil then
        v318.action_params = v2.OpenSeeAllAction_Params.jsonDecode(v317.action_params);
    end;
    if v317.actionParams ~= nil then
        v318.action_params = v2.OpenSeeAllAction_Params.jsonDecode(v317.actionParams);
    end;
    return v318;
end;
v7.descriptor = {
    name = "OpenSeeAllAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenSeeAllAction"
};
v2.OpenSeeAllAction = v7;
v1.default:register(v2.OpenSeeAllAction);
v7 = {};
v7.__index = v7;
local l_v7_13 = v7 --[[ copy: 7 -> 21 ]];
v7.new = function(v320) --[[ Line: 3807 ]] --[[ Name: new ]]
    -- upvalues: l_v7_13 (copy)
    return (setmetatable({
        collection_id = if not (v320 ~= nil) or v320.collection_id == nil then nil else v320.collection_id, 
        game_set_target_id = if not (v320 ~= nil) or v320.game_set_target_id == nil then nil else v320.game_set_target_id, 
        collection_position = if not (v320 ~= nil) or v320.collection_position == nil then nil else v320.collection_position
    }, l_v7_13));
end;
v7.encode = function(v321) --[[ Line: 3817 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v322 = buffer.create(0);
    local v323 = 0;
    if v321.collection_id ~= nil then
        local v324 = v321.collection_id:encode();
        local v325, v326 = v0.writeTag(v322, v323, 1, v0.wireTypes.lengthDelimited);
        v325, v326 = v0.writeBuffer(v325, v326, v324, buffer.len(v324));
        v322 = v325;
        v323 = v326;
    end;
    if v321.game_set_target_id ~= nil then
        local v327 = v321.game_set_target_id:encode();
        local v328, v329 = v0.writeTag(v322, v323, 2, v0.wireTypes.lengthDelimited);
        v328, v329 = v0.writeBuffer(v328, v329, v327, buffer.len(v327));
        v322 = v328;
        v323 = v329;
    end;
    if v321.collection_position ~= nil then
        local v330 = v321.collection_position:encode();
        local v331, v332 = v0.writeTag(v322, v323, 3, v0.wireTypes.lengthDelimited);
        v331, v332 = v0.writeBuffer(v331, v332, v330, buffer.len(v330));
        v322 = v331;
        v323 = v332;
    end;
    local v333 = buffer.create(v323);
    buffer.copy(v333, 0, v322, 0, v323);
    return v333;
end;
v7.decode = function(v334) --[[ Line: 3844 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_13 (copy), v0 (copy), v5 (copy)
    local v335 = l_v7_13.new();
    local v336 = 0;
    while v336 < buffer.len(v334) do
        local v337 = nil;
        local v338 = nil;
        local v339, v340, v341 = v0.readTag(v334, v336);
        v337 = v339;
        v338 = v340;
        v336 = v341;
        if v338 == v0.wireTypes.varint then
            v339 = nil;
            v340, v341 = v0.readVarInt(v334, v336);
            v339 = v340;
            v336 = v341;
        elseif v338 == v0.wireTypes.lengthDelimited then
            if v337 == 1 then
                v339 = nil;
                v340, v341 = v0.readBuffer(v334, v336);
                v339 = v340;
                v336 = v341;
                v335.collection_id = v5.StringProp.decode(v339);
            elseif v337 == 2 then
                v339 = nil;
                v340, v341 = v0.readBuffer(v334, v336);
                v339 = v340;
                v336 = v341;
                v335.game_set_target_id = v5.StringProp.decode(v339);
            elseif v337 == 3 then
                v339 = nil;
                v340, v341 = v0.readBuffer(v334, v336);
                v339 = v340;
                v336 = v341;
                v335.collection_position = v5.StringProp.decode(v339);
            else
                v339 = nil;
                v340, v341 = v0.readVarInt(v334, v336);
                v336 = v341 + v340;
            end;
        elseif v338 == v0.wireTypes.i32 then
            v339 = nil;
            v340, v341 = v0.readFixed32(v334, v336);
            v339 = v340;
            v336 = v341;
        elseif v338 == v0.wireTypes.i64 then
            v339 = nil;
            v340, v341 = v0.readFixed64(v334, v336);
            v339 = v340;
            v336 = v341;
        else
            error("Unsupported wire type: " .. v338);
        end;
    end;
    return v335;
end;
v7.jsonEncode = function(v342) --[[ Line: 3898 ]] --[[ Name: jsonEncode ]]
    local v343 = {};
    if v342.collection_id ~= nil then
        v343.collectionId = v342.collection_id:jsonEncode();
    end;
    if v342.game_set_target_id ~= nil then
        v343.gameSetTargetId = v342.game_set_target_id:jsonEncode();
    end;
    if v342.collection_position ~= nil then
        v343.collectionPosition = v342.collection_position:jsonEncode();
    end;
    return v343;
end;
v7.jsonDecode = function(v344) --[[ Line: 3916 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_13 (copy), v5 (copy)
    local v345 = l_v7_13.new();
    if v344.collection_id ~= nil then
        v345.collection_id = v5.StringProp.jsonDecode(v344.collection_id);
    end;
    if v344.collectionId ~= nil then
        v345.collection_id = v5.StringProp.jsonDecode(v344.collectionId);
    end;
    if v344.game_set_target_id ~= nil then
        v345.game_set_target_id = v5.StringProp.jsonDecode(v344.game_set_target_id);
    end;
    if v344.gameSetTargetId ~= nil then
        v345.game_set_target_id = v5.StringProp.jsonDecode(v344.gameSetTargetId);
    end;
    if v344.collection_position ~= nil then
        v345.collection_position = v5.StringProp.jsonDecode(v344.collection_position);
    end;
    if v344.collectionPosition ~= nil then
        v345.collection_position = v5.StringProp.jsonDecode(v344.collectionPosition);
    end;
    return v345;
end;
v7.descriptor = {
    name = "OpenSeeAllAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenSeeAllAction_Params = v7;
v1.default:register(v2.OpenSeeAllAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_14 = v7 --[[ copy: 7 -> 22 ]];
v7.new = function(v347) --[[ Line: 3966 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_14 (copy)
    return (setmetatable({
        action_type = if not (v347 ~= nil) or v347.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v347.action_type, 
        action_params = if not (v347 ~= nil) or v347.action_params == nil then nil else v347.action_params
    }, l_v7_14));
end;
v7.encode = function(v348) --[[ Line: 3977 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v349 = buffer.create(0);
    local v350 = 0;
    if v348.action_type ~= nil and (v348.action_type ~= nil and v348.action_type ~= 0 or v348.action_type ~= v2.ActionType.fromNumber(0)) then
        local v351, v352 = v0.writeTag(v349, v350, 1, v0.wireTypes.varint);
        v351, v352 = v0.writeVarInt(v351, v352, v2.ActionType.toNumber(v348.action_type));
        v349 = v351;
        v350 = v352;
    end;
    if v348.action_params ~= nil then
        local v353 = v348.action_params:encode();
        local v354, v355 = v0.writeTag(v349, v350, 2, v0.wireTypes.lengthDelimited);
        v354, v355 = v0.writeBuffer(v354, v355, v353, buffer.len(v353));
        v349 = v354;
        v350 = v355;
    end;
    local v356 = buffer.create(v350);
    buffer.copy(v356, 0, v349, 0, v350);
    return v356;
end;
v7.decode = function(v357) --[[ Line: 4003 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_14 (copy), v0 (copy), v2 (copy)
    local v358 = l_v7_14.new();
    local v359 = 0;
    while v359 < buffer.len(v357) do
        local v360 = nil;
        local v361 = nil;
        local v362, v363, v364 = v0.readTag(v357, v359);
        v360 = v362;
        v361 = v363;
        v359 = v364;
        if v361 == v0.wireTypes.varint then
            if v360 == 1 then
                v362 = nil;
                v363, v364 = v0.readVarIntI32(v357, v359);
                v362 = v363;
                v359 = v364;
                v358.action_type = v2.ActionType.fromNumber(v362) or v362;
            else
                v362 = nil;
                v363, v364 = v0.readVarInt(v357, v359);
                v362 = v363;
                v359 = v364;
            end;
        elseif v361 == v0.wireTypes.lengthDelimited then
            if v360 == 2 then
                v362 = nil;
                v363, v364 = v0.readBuffer(v357, v359);
                v362 = v363;
                v359 = v364;
                v358.action_params = v2.OpenSponsoredTooltipAction_Params.decode(v362);
            else
                v362 = nil;
                v363, v364 = v0.readVarInt(v357, v359);
                v359 = v364 + v363;
            end;
        elseif v361 == v0.wireTypes.i32 then
            v362 = nil;
            v363, v364 = v0.readFixed32(v357, v359);
            v362 = v363;
            v359 = v364;
        elseif v361 == v0.wireTypes.i64 then
            v362 = nil;
            v363, v364 = v0.readFixed64(v357, v359);
            v362 = v363;
            v359 = v364;
        else
            error("Unsupported wire type: " .. v361);
        end;
    end;
    return v358;
end;
v7.jsonEncode = function(v365) --[[ Line: 4051 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v366 = {};
    if v365.action_type ~= nil and (v365.action_type ~= nil and v365.action_type ~= 0 or v365.action_type ~= v2.ActionType.fromNumber(0)) then
        v366.actionType = if typeof(v365.action_type) == "number" then v365.action_type else v2.ActionType.toNumber(v365.action_type);
    end;
    if v365.action_params ~= nil then
        v366.actionParams = v365.action_params:jsonEncode();
    end;
    return v366;
end;
v7.jsonDecode = function(v367) --[[ Line: 4073 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_14 (copy), v2 (copy)
    local v368 = l_v7_14.new();
    if v367.action_type ~= nil then
        v368.action_type = if typeof(v367.action_type) == "number" then v2.ActionType.fromNumber(v367.action_type) or v367.action_type else v2.ActionType.fromName(v367.action_type) or v367.action_type;
    end;
    if v367.actionType ~= nil then
        v368.action_type = if typeof(v367.actionType) == "number" then v2.ActionType.fromNumber(v367.actionType) or v367.actionType else v2.ActionType.fromName(v367.actionType) or v367.actionType;
    end;
    if v367.action_params ~= nil then
        v368.action_params = v2.OpenSponsoredTooltipAction_Params.jsonDecode(v367.action_params);
    end;
    if v367.actionParams ~= nil then
        v368.action_params = v2.OpenSponsoredTooltipAction_Params.jsonDecode(v367.actionParams);
    end;
    return v368;
end;
v7.descriptor = {
    name = "OpenSponsoredTooltipAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenSponsoredTooltipAction"
};
v2.OpenSponsoredTooltipAction = v7;
v1.default:register(v2.OpenSponsoredTooltipAction);
v7 = {};
v7.__index = v7;
local l_v7_15 = v7 --[[ copy: 7 -> 23 ]];
v7.new = function(_) --[[ Line: 4113 ]] --[[ Name: new ]]
    -- upvalues: l_v7_15 (copy)
    return (setmetatable({}, l_v7_15));
end;
v7.encode = function(_) --[[ Line: 4119 ]] --[[ Name: encode ]]
    local v372 = buffer.create(0);
    local v373 = buffer.create(0);
    buffer.copy(v373, 0, v372, 0, 0);
    return v373;
end;
v7.decode = function(v374) --[[ Line: 4128 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_15 (copy), v0 (copy)
    local v375 = l_v7_15.new();
    local v376 = 0;
    while v376 < buffer.len(v374) do
        local v377 = nil;
        local v378 = nil;
        local v379, v380, v381 = v0.readTag(v374, v376);
        v377 = v379;
        v378 = v380;
        v376 = v381;
        if v378 == v0.wireTypes.varint then
            v379 = nil;
            v380, v381 = v0.readVarInt(v374, v376);
            v379 = v380;
            v376 = v381;
        elseif v378 == v0.wireTypes.lengthDelimited then
            v379 = nil;
            v380, v381 = v0.readVarInt(v374, v376);
            v376 = v381 + v380;
        elseif v378 == v0.wireTypes.i32 then
            v379 = nil;
            v380, v381 = v0.readFixed32(v374, v376);
            v379 = v380;
            v376 = v381;
        elseif v378 == v0.wireTypes.i64 then
            v379 = nil;
            v380, v381 = v0.readFixed64(v374, v376);
            v379 = v380;
            v376 = v381;
        else
            error("Unsupported wire type: " .. v378);
        end;
    end;
    return v375;
end;
v7.jsonEncode = function(_) --[[ Line: 4166 ]] --[[ Name: jsonEncode ]]
    return {};
end;
v7.jsonDecode = function(_) --[[ Line: 4172 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_15 (copy)
    return (l_v7_15.new());
end;
v7.descriptor = {
    name = "OpenSponsoredTooltipAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenSponsoredTooltipAction_Params = v7;
v1.default:register(v2.OpenSponsoredTooltipAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_16 = v7 --[[ copy: 7 -> 24 ]];
v7.new = function(v385) --[[ Line: 4194 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_16 (copy)
    return (setmetatable({
        action_type = if not (v385 ~= nil) or v385.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v385.action_type, 
        action_params = if not (v385 ~= nil) or v385.action_params == nil then nil else v385.action_params
    }, l_v7_16));
end;
v7.encode = function(v386) --[[ Line: 4203 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v387 = buffer.create(0);
    local v388 = 0;
    if v386.action_type ~= nil and (v386.action_type ~= nil and v386.action_type ~= 0 or v386.action_type ~= v2.ActionType.fromNumber(0)) then
        local v389, v390 = v0.writeTag(v387, v388, 1, v0.wireTypes.varint);
        v389, v390 = v0.writeVarInt(v389, v390, v2.ActionType.toNumber(v386.action_type));
        v387 = v389;
        v388 = v390;
    end;
    if v386.action_params ~= nil then
        local v391 = v386.action_params:encode();
        local v392, v393 = v0.writeTag(v387, v388, 2, v0.wireTypes.lengthDelimited);
        v392, v393 = v0.writeBuffer(v392, v393, v391, buffer.len(v391));
        v387 = v392;
        v388 = v393;
    end;
    local v394 = buffer.create(v388);
    buffer.copy(v394, 0, v387, 0, v388);
    return v394;
end;
v7.decode = function(v395) --[[ Line: 4229 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_16 (copy), v0 (copy), v2 (copy)
    local v396 = l_v7_16.new();
    local v397 = 0;
    while v397 < buffer.len(v395) do
        local v398 = nil;
        local v399 = nil;
        local v400, v401, v402 = v0.readTag(v395, v397);
        v398 = v400;
        v399 = v401;
        v397 = v402;
        if v399 == v0.wireTypes.varint then
            if v398 == 1 then
                v400 = nil;
                v401, v402 = v0.readVarIntI32(v395, v397);
                v400 = v401;
                v397 = v402;
                v396.action_type = v2.ActionType.fromNumber(v400) or v400;
            else
                v400 = nil;
                v401, v402 = v0.readVarInt(v395, v397);
                v400 = v401;
                v397 = v402;
            end;
        elseif v399 == v0.wireTypes.lengthDelimited then
            if v398 == 2 then
                v400 = nil;
                v401, v402 = v0.readBuffer(v395, v397);
                v400 = v401;
                v397 = v402;
                v396.action_params = v2.PlayButtonClickAction_Params.decode(v400);
            else
                v400 = nil;
                v401, v402 = v0.readVarInt(v395, v397);
                v397 = v402 + v401;
            end;
        elseif v399 == v0.wireTypes.i32 then
            v400 = nil;
            v401, v402 = v0.readFixed32(v395, v397);
            v400 = v401;
            v397 = v402;
        elseif v399 == v0.wireTypes.i64 then
            v400 = nil;
            v401, v402 = v0.readFixed64(v395, v397);
            v400 = v401;
            v397 = v402;
        else
            error("Unsupported wire type: " .. v399);
        end;
    end;
    return v396;
end;
v7.jsonEncode = function(v403) --[[ Line: 4277 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v404 = {};
    if v403.action_type ~= nil and (v403.action_type ~= nil and v403.action_type ~= 0 or v403.action_type ~= v2.ActionType.fromNumber(0)) then
        v404.actionType = if typeof(v403.action_type) == "number" then v403.action_type else v2.ActionType.toNumber(v403.action_type);
    end;
    if v403.action_params ~= nil then
        v404.actionParams = v403.action_params:jsonEncode();
    end;
    return v404;
end;
v7.jsonDecode = function(v405) --[[ Line: 4299 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_16 (copy), v2 (copy)
    local v406 = l_v7_16.new();
    if v405.action_type ~= nil then
        v406.action_type = if typeof(v405.action_type) == "number" then v2.ActionType.fromNumber(v405.action_type) or v405.action_type else v2.ActionType.fromName(v405.action_type) or v405.action_type;
    end;
    if v405.actionType ~= nil then
        v406.action_type = if typeof(v405.actionType) == "number" then v2.ActionType.fromNumber(v405.actionType) or v405.actionType else v2.ActionType.fromName(v405.actionType) or v405.actionType;
    end;
    if v405.action_params ~= nil then
        v406.action_params = v2.PlayButtonClickAction_Params.jsonDecode(v405.action_params);
    end;
    if v405.actionParams ~= nil then
        v406.action_params = v2.PlayButtonClickAction_Params.jsonDecode(v405.actionParams);
    end;
    return v406;
end;
v7.descriptor = {
    name = "PlayButtonClickAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.PlayButtonClickAction"
};
v2.PlayButtonClickAction = v7;
v1.default:register(v2.PlayButtonClickAction);
v7 = {};
v7.__index = v7;
local l_v7_17 = v7 --[[ copy: 7 -> 25 ]];
v7.new = function(_) --[[ Line: 4339 ]] --[[ Name: new ]]
    -- upvalues: l_v7_17 (copy)
    return (setmetatable({}, l_v7_17));
end;
v7.encode = function(_) --[[ Line: 4345 ]] --[[ Name: encode ]]
    local v410 = buffer.create(0);
    local v411 = buffer.create(0);
    buffer.copy(v411, 0, v410, 0, 0);
    return v411;
end;
v7.decode = function(v412) --[[ Line: 4354 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_17 (copy), v0 (copy)
    local v413 = l_v7_17.new();
    local v414 = 0;
    while v414 < buffer.len(v412) do
        local v415 = nil;
        local v416 = nil;
        local v417, v418, v419 = v0.readTag(v412, v414);
        v415 = v417;
        v416 = v418;
        v414 = v419;
        if v416 == v0.wireTypes.varint then
            v417 = nil;
            v418, v419 = v0.readVarInt(v412, v414);
            v417 = v418;
            v414 = v419;
        elseif v416 == v0.wireTypes.lengthDelimited then
            v417 = nil;
            v418, v419 = v0.readVarInt(v412, v414);
            v414 = v419 + v418;
        elseif v416 == v0.wireTypes.i32 then
            v417 = nil;
            v418, v419 = v0.readFixed32(v412, v414);
            v417 = v418;
            v414 = v419;
        elseif v416 == v0.wireTypes.i64 then
            v417 = nil;
            v418, v419 = v0.readFixed64(v412, v414);
            v417 = v418;
            v414 = v419;
        else
            error("Unsupported wire type: " .. v416);
        end;
    end;
    return v413;
end;
v7.jsonEncode = function(_) --[[ Line: 4392 ]] --[[ Name: jsonEncode ]]
    return {};
end;
v7.jsonDecode = function(_) --[[ Line: 4398 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_17 (copy)
    return (l_v7_17.new());
end;
v7.descriptor = {
    name = "PlayButtonClickAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.PlayButtonClickAction_Params = v7;
v1.default:register(v2.PlayButtonClickAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_18 = v7 --[[ copy: 7 -> 26 ]];
v7.new = function(v423) --[[ Line: 4418 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_18 (copy)
    return (setmetatable({
        action_type = if not (v423 ~= nil) or v423.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v423.action_type, 
        action_params = if not (v423 ~= nil) or v423.action_params == nil then nil else v423.action_params
    }, l_v7_18));
end;
v7.encode = function(v424) --[[ Line: 4427 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v425 = buffer.create(0);
    local v426 = 0;
    if v424.action_type ~= nil and (v424.action_type ~= nil and v424.action_type ~= 0 or v424.action_type ~= v2.ActionType.fromNumber(0)) then
        local v427, v428 = v0.writeTag(v425, v426, 1, v0.wireTypes.varint);
        v427, v428 = v0.writeVarInt(v427, v428, v2.ActionType.toNumber(v424.action_type));
        v425 = v427;
        v426 = v428;
    end;
    if v424.action_params ~= nil then
        local v429 = v424.action_params:encode();
        local v430, v431 = v0.writeTag(v425, v426, 2, v0.wireTypes.lengthDelimited);
        v430, v431 = v0.writeBuffer(v430, v431, v429, buffer.len(v429));
        v425 = v430;
        v426 = v431;
    end;
    local v432 = buffer.create(v426);
    buffer.copy(v432, 0, v425, 0, v426);
    return v432;
end;
v7.decode = function(v433) --[[ Line: 4453 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_18 (copy), v0 (copy), v2 (copy)
    local v434 = l_v7_18.new();
    local v435 = 0;
    while v435 < buffer.len(v433) do
        local v436 = nil;
        local v437 = nil;
        local v438, v439, v440 = v0.readTag(v433, v435);
        v436 = v438;
        v437 = v439;
        v435 = v440;
        if v437 == v0.wireTypes.varint then
            if v436 == 1 then
                v438 = nil;
                v439, v440 = v0.readVarIntI32(v433, v435);
                v438 = v439;
                v435 = v440;
                v434.action_type = v2.ActionType.fromNumber(v438) or v438;
            else
                v438 = nil;
                v439, v440 = v0.readVarInt(v433, v435);
                v438 = v439;
                v435 = v440;
            end;
        elseif v437 == v0.wireTypes.lengthDelimited then
            if v436 == 2 then
                v438 = nil;
                v439, v440 = v0.readBuffer(v433, v435);
                v438 = v439;
                v435 = v440;
                v434.action_params = v2.UpdateUserSettingsAction_Params.decode(v438);
            else
                v438 = nil;
                v439, v440 = v0.readVarInt(v433, v435);
                v435 = v440 + v439;
            end;
        elseif v437 == v0.wireTypes.i32 then
            v438 = nil;
            v439, v440 = v0.readFixed32(v433, v435);
            v438 = v439;
            v435 = v440;
        elseif v437 == v0.wireTypes.i64 then
            v438 = nil;
            v439, v440 = v0.readFixed64(v433, v435);
            v438 = v439;
            v435 = v440;
        else
            error("Unsupported wire type: " .. v437);
        end;
    end;
    return v434;
end;
v7.jsonEncode = function(v441) --[[ Line: 4501 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v442 = {};
    if v441.action_type ~= nil and (v441.action_type ~= nil and v441.action_type ~= 0 or v441.action_type ~= v2.ActionType.fromNumber(0)) then
        v442.actionType = if typeof(v441.action_type) == "number" then v441.action_type else v2.ActionType.toNumber(v441.action_type);
    end;
    if v441.action_params ~= nil then
        v442.actionParams = v441.action_params:jsonEncode();
    end;
    return v442;
end;
v7.jsonDecode = function(v443) --[[ Line: 4523 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_18 (copy), v2 (copy)
    local v444 = l_v7_18.new();
    if v443.action_type ~= nil then
        v444.action_type = if typeof(v443.action_type) == "number" then v2.ActionType.fromNumber(v443.action_type) or v443.action_type else v2.ActionType.fromName(v443.action_type) or v443.action_type;
    end;
    if v443.actionType ~= nil then
        v444.action_type = if typeof(v443.actionType) == "number" then v2.ActionType.fromNumber(v443.actionType) or v443.actionType else v2.ActionType.fromName(v443.actionType) or v443.actionType;
    end;
    if v443.action_params ~= nil then
        v444.action_params = v2.UpdateUserSettingsAction_Params.jsonDecode(v443.action_params);
    end;
    if v443.actionParams ~= nil then
        v444.action_params = v2.UpdateUserSettingsAction_Params.jsonDecode(v443.actionParams);
    end;
    return v444;
end;
v7.descriptor = {
    name = "UpdateUserSettingsAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UpdateUserSettingsAction"
};
v2.UpdateUserSettingsAction = v7;
v1.default:register(v2.UpdateUserSettingsAction);
v7 = {};
v7.__index = v7;
local l_v7_19 = v7 --[[ copy: 7 -> 27 ]];
v7.new = function(v446) --[[ Line: 4563 ]] --[[ Name: new ]]
    -- upvalues: l_v7_19 (copy)
    return (setmetatable({
        settings = if not (v446 ~= nil) or v446.settings == nil then nil else v446.settings, 
        audit_data = if not (v446 ~= nil) or v446.audit_data == nil then nil else v446.audit_data
    }, l_v7_19));
end;
v7.encode = function(v447) --[[ Line: 4572 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v448 = buffer.create(0);
    local v449 = 0;
    if v447.settings ~= nil then
        local v450 = v447.settings:encode();
        local v451, v452 = v0.writeTag(v448, v449, 1, v0.wireTypes.lengthDelimited);
        v451, v452 = v0.writeBuffer(v451, v452, v450, buffer.len(v450));
        v448 = v451;
        v449 = v452;
    end;
    if v447.audit_data ~= nil then
        local v453 = v447.audit_data:encode();
        local v454, v455 = v0.writeTag(v448, v449, 2, v0.wireTypes.lengthDelimited);
        v454, v455 = v0.writeBuffer(v454, v455, v453, buffer.len(v453));
        v448 = v454;
        v449 = v455;
    end;
    local v456 = buffer.create(v449);
    buffer.copy(v456, 0, v448, 0, v449);
    return v456;
end;
v7.decode = function(v457) --[[ Line: 4593 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_19 (copy), v0 (copy), v5 (copy)
    local v458 = l_v7_19.new();
    local v459 = 0;
    while v459 < buffer.len(v457) do
        local v460 = nil;
        local v461 = nil;
        local v462, v463, v464 = v0.readTag(v457, v459);
        v460 = v462;
        v461 = v463;
        v459 = v464;
        if v461 == v0.wireTypes.varint then
            v462 = nil;
            v463, v464 = v0.readVarInt(v457, v459);
            v462 = v463;
            v459 = v464;
        elseif v461 == v0.wireTypes.lengthDelimited then
            if v460 == 1 then
                v462 = nil;
                v463, v464 = v0.readBuffer(v457, v459);
                v462 = v463;
                v459 = v464;
                v458.settings = v5.StructProp.decode(v462);
            elseif v460 == 2 then
                v462 = nil;
                v463, v464 = v0.readBuffer(v457, v459);
                v462 = v463;
                v459 = v464;
                v458.audit_data = v5.StringProp.decode(v462);
            else
                v462 = nil;
                v463, v464 = v0.readVarInt(v457, v459);
                v459 = v464 + v463;
            end;
        elseif v461 == v0.wireTypes.i32 then
            v462 = nil;
            v463, v464 = v0.readFixed32(v457, v459);
            v462 = v463;
            v459 = v464;
        elseif v461 == v0.wireTypes.i64 then
            v462 = nil;
            v463, v464 = v0.readFixed64(v457, v459);
            v462 = v463;
            v459 = v464;
        else
            error("Unsupported wire type: " .. v461);
        end;
    end;
    return v458;
end;
v7.jsonEncode = function(v465) --[[ Line: 4641 ]] --[[ Name: jsonEncode ]]
    local v466 = {};
    if v465.settings ~= nil then
        v466.settings = v465.settings:jsonEncode();
    end;
    if v465.audit_data ~= nil then
        v466.auditData = v465.audit_data:jsonEncode();
    end;
    return v466;
end;
v7.jsonDecode = function(v467) --[[ Line: 4655 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_19 (copy), v5 (copy)
    local v468 = l_v7_19.new();
    if v467.settings ~= nil then
        v468.settings = v5.StructProp.jsonDecode(v467.settings);
    end;
    if v467.audit_data ~= nil then
        v468.audit_data = v5.StringProp.jsonDecode(v467.audit_data);
    end;
    if v467.auditData ~= nil then
        v468.audit_data = v5.StringProp.jsonDecode(v467.auditData);
    end;
    return v468;
end;
v7.descriptor = {
    name = "UpdateUserSettingsAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.UpdateUserSettingsAction_Params = v7;
v1.default:register(v2.UpdateUserSettingsAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_20 = v7 --[[ copy: 7 -> 28 ]];
v7.new = function(v470) --[[ Line: 4687 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_20 (copy)
    return (setmetatable({
        action_type = if not (v470 ~= nil) or v470.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v470.action_type, 
        action_params = if not (v470 ~= nil) or v470.action_params == nil then nil else v470.action_params
    }, l_v7_20));
end;
v7.encode = function(v471) --[[ Line: 4696 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v472 = buffer.create(0);
    local v473 = 0;
    if v471.action_type ~= nil and (v471.action_type ~= nil and v471.action_type ~= 0 or v471.action_type ~= v2.ActionType.fromNumber(0)) then
        local v474, v475 = v0.writeTag(v472, v473, 1, v0.wireTypes.varint);
        v474, v475 = v0.writeVarInt(v474, v475, v2.ActionType.toNumber(v471.action_type));
        v472 = v474;
        v473 = v475;
    end;
    if v471.action_params ~= nil then
        local v476 = v471.action_params:encode();
        local v477, v478 = v0.writeTag(v472, v473, 2, v0.wireTypes.lengthDelimited);
        v477, v478 = v0.writeBuffer(v477, v478, v476, buffer.len(v476));
        v472 = v477;
        v473 = v478;
    end;
    local v479 = buffer.create(v473);
    buffer.copy(v479, 0, v472, 0, v473);
    return v479;
end;
v7.decode = function(v480) --[[ Line: 4722 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_20 (copy), v0 (copy), v2 (copy)
    local v481 = l_v7_20.new();
    local v482 = 0;
    while v482 < buffer.len(v480) do
        local v483 = nil;
        local v484 = nil;
        local v485, v486, v487 = v0.readTag(v480, v482);
        v483 = v485;
        v484 = v486;
        v482 = v487;
        if v484 == v0.wireTypes.varint then
            if v483 == 1 then
                v485 = nil;
                v486, v487 = v0.readVarIntI32(v480, v482);
                v485 = v486;
                v482 = v487;
                v481.action_type = v2.ActionType.fromNumber(v485) or v485;
            else
                v485 = nil;
                v486, v487 = v0.readVarInt(v480, v482);
                v485 = v486;
                v482 = v487;
            end;
        elseif v484 == v0.wireTypes.lengthDelimited then
            if v483 == 2 then
                v485 = nil;
                v486, v487 = v0.readBuffer(v480, v482);
                v485 = v486;
                v482 = v487;
                v481.action_params = v2.OpenTooltipAction_Params.decode(v485);
            else
                v485 = nil;
                v486, v487 = v0.readVarInt(v480, v482);
                v482 = v487 + v486;
            end;
        elseif v484 == v0.wireTypes.i32 then
            v485 = nil;
            v486, v487 = v0.readFixed32(v480, v482);
            v485 = v486;
            v482 = v487;
        elseif v484 == v0.wireTypes.i64 then
            v485 = nil;
            v486, v487 = v0.readFixed64(v480, v482);
            v485 = v486;
            v482 = v487;
        else
            error("Unsupported wire type: " .. v484);
        end;
    end;
    return v481;
end;
v7.jsonEncode = function(v488) --[[ Line: 4770 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v489 = {};
    if v488.action_type ~= nil and (v488.action_type ~= nil and v488.action_type ~= 0 or v488.action_type ~= v2.ActionType.fromNumber(0)) then
        v489.actionType = if typeof(v488.action_type) == "number" then v488.action_type else v2.ActionType.toNumber(v488.action_type);
    end;
    if v488.action_params ~= nil then
        v489.actionParams = v488.action_params:jsonEncode();
    end;
    return v489;
end;
v7.jsonDecode = function(v490) --[[ Line: 4792 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_20 (copy), v2 (copy)
    local v491 = l_v7_20.new();
    if v490.action_type ~= nil then
        v491.action_type = if typeof(v490.action_type) == "number" then v2.ActionType.fromNumber(v490.action_type) or v490.action_type else v2.ActionType.fromName(v490.action_type) or v490.action_type;
    end;
    if v490.actionType ~= nil then
        v491.action_type = if typeof(v490.actionType) == "number" then v2.ActionType.fromNumber(v490.actionType) or v490.actionType else v2.ActionType.fromName(v490.actionType) or v490.actionType;
    end;
    if v490.action_params ~= nil then
        v491.action_params = v2.OpenTooltipAction_Params.jsonDecode(v490.action_params);
    end;
    if v490.actionParams ~= nil then
        v491.action_params = v2.OpenTooltipAction_Params.jsonDecode(v490.actionParams);
    end;
    return v491;
end;
v7.descriptor = {
    name = "OpenTooltipAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenTooltipAction"
};
v2.OpenTooltipAction = v7;
v1.default:register(v2.OpenTooltipAction);
v7 = {};
v7.__index = v7;
local l_v7_21 = v7 --[[ copy: 7 -> 29 ]];
v7.new = function(v493) --[[ Line: 4832 ]] --[[ Name: new ]]
    -- upvalues: l_v7_21 (copy)
    return (setmetatable({
        tooltip_title = if not (v493 ~= nil) or v493.tooltip_title == nil then nil else v493.tooltip_title, 
        tooltip_info_text = if not (v493 ~= nil) or v493.tooltip_info_text == nil then nil else v493.tooltip_info_text
    }, l_v7_21));
end;
v7.encode = function(v494) --[[ Line: 4839 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v495 = buffer.create(0);
    local v496 = 0;
    if v494.tooltip_title ~= nil then
        local v497 = v494.tooltip_title:encode();
        local v498, v499 = v0.writeTag(v495, v496, 1, v0.wireTypes.lengthDelimited);
        v498, v499 = v0.writeBuffer(v498, v499, v497, buffer.len(v497));
        v495 = v498;
        v496 = v499;
    end;
    if v494.tooltip_info_text ~= nil then
        local v500 = v494.tooltip_info_text:encode();
        local v501, v502 = v0.writeTag(v495, v496, 2, v0.wireTypes.lengthDelimited);
        v501, v502 = v0.writeBuffer(v501, v502, v500, buffer.len(v500));
        v495 = v501;
        v496 = v502;
    end;
    local v503 = buffer.create(v496);
    buffer.copy(v503, 0, v495, 0, v496);
    return v503;
end;
v7.decode = function(v504) --[[ Line: 4860 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_21 (copy), v0 (copy), v5 (copy)
    local v505 = l_v7_21.new();
    local v506 = 0;
    while v506 < buffer.len(v504) do
        local v507 = nil;
        local v508 = nil;
        local v509, v510, v511 = v0.readTag(v504, v506);
        v507 = v509;
        v508 = v510;
        v506 = v511;
        if v508 == v0.wireTypes.varint then
            v509 = nil;
            v510, v511 = v0.readVarInt(v504, v506);
            v509 = v510;
            v506 = v511;
        elseif v508 == v0.wireTypes.lengthDelimited then
            if v507 == 1 then
                v509 = nil;
                v510, v511 = v0.readBuffer(v504, v506);
                v509 = v510;
                v506 = v511;
                v505.tooltip_title = v5.StringProp.decode(v509);
            elseif v507 == 2 then
                v509 = nil;
                v510, v511 = v0.readBuffer(v504, v506);
                v509 = v510;
                v506 = v511;
                v505.tooltip_info_text = v5.StringProp.decode(v509);
            else
                v509 = nil;
                v510, v511 = v0.readVarInt(v504, v506);
                v506 = v511 + v510;
            end;
        elseif v508 == v0.wireTypes.i32 then
            v509 = nil;
            v510, v511 = v0.readFixed32(v504, v506);
            v509 = v510;
            v506 = v511;
        elseif v508 == v0.wireTypes.i64 then
            v509 = nil;
            v510, v511 = v0.readFixed64(v504, v506);
            v509 = v510;
            v506 = v511;
        else
            error("Unsupported wire type: " .. v508);
        end;
    end;
    return v505;
end;
v7.jsonEncode = function(v512) --[[ Line: 4908 ]] --[[ Name: jsonEncode ]]
    local v513 = {};
    if v512.tooltip_title ~= nil then
        v513.tooltipTitle = v512.tooltip_title:jsonEncode();
    end;
    if v512.tooltip_info_text ~= nil then
        v513.tooltipInfoText = v512.tooltip_info_text:jsonEncode();
    end;
    return v513;
end;
v7.jsonDecode = function(v514) --[[ Line: 4922 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_21 (copy), v5 (copy)
    local v515 = l_v7_21.new();
    if v514.tooltip_title ~= nil then
        v515.tooltip_title = v5.StringProp.jsonDecode(v514.tooltip_title);
    end;
    if v514.tooltipTitle ~= nil then
        v515.tooltip_title = v5.StringProp.jsonDecode(v514.tooltipTitle);
    end;
    if v514.tooltip_info_text ~= nil then
        v515.tooltip_info_text = v5.StringProp.jsonDecode(v514.tooltip_info_text);
    end;
    if v514.tooltipInfoText ~= nil then
        v515.tooltip_info_text = v5.StringProp.jsonDecode(v514.tooltipInfoText);
    end;
    return v515;
end;
v7.descriptor = {
    name = "OpenTooltipAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenTooltipAction_Params = v7;
v1.default:register(v2.OpenTooltipAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_22 = v7 --[[ copy: 7 -> 30 ]];
v7.new = function(v517) --[[ Line: 4962 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_22 (copy)
    return (setmetatable({
        action_type = if not (v517 ~= nil) or v517.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v517.action_type, 
        action_params = if not (v517 ~= nil) or v517.action_params == nil then nil else v517.action_params
    }, l_v7_22));
end;
v7.encode = function(v518) --[[ Line: 4971 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v519 = buffer.create(0);
    local v520 = 0;
    if v518.action_type ~= nil and (v518.action_type ~= nil and v518.action_type ~= 0 or v518.action_type ~= v2.ActionType.fromNumber(0)) then
        local v521, v522 = v0.writeTag(v519, v520, 1, v0.wireTypes.varint);
        v521, v522 = v0.writeVarInt(v521, v522, v2.ActionType.toNumber(v518.action_type));
        v519 = v521;
        v520 = v522;
    end;
    if v518.action_params ~= nil then
        local v523 = v518.action_params:encode();
        local v524, v525 = v0.writeTag(v519, v520, 2, v0.wireTypes.lengthDelimited);
        v524, v525 = v0.writeBuffer(v524, v525, v523, buffer.len(v523));
        v519 = v524;
        v520 = v525;
    end;
    local v526 = buffer.create(v520);
    buffer.copy(v526, 0, v519, 0, v520);
    return v526;
end;
v7.decode = function(v527) --[[ Line: 4997 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_22 (copy), v0 (copy), v2 (copy)
    local v528 = l_v7_22.new();
    local v529 = 0;
    while v529 < buffer.len(v527) do
        local v530 = nil;
        local v531 = nil;
        local v532, v533, v534 = v0.readTag(v527, v529);
        v530 = v532;
        v531 = v533;
        v529 = v534;
        if v531 == v0.wireTypes.varint then
            if v530 == 1 then
                v532 = nil;
                v533, v534 = v0.readVarIntI32(v527, v529);
                v532 = v533;
                v529 = v534;
                v528.action_type = v2.ActionType.fromNumber(v532) or v532;
            else
                v532 = nil;
                v533, v534 = v0.readVarInt(v527, v529);
                v532 = v533;
                v529 = v534;
            end;
        elseif v531 == v0.wireTypes.lengthDelimited then
            if v530 == 2 then
                v532 = nil;
                v533, v534 = v0.readBuffer(v527, v529);
                v532 = v533;
                v529 = v534;
                v528.action_params = v2.OpenBadgeDetailsAction_Params.decode(v532);
            else
                v532 = nil;
                v533, v534 = v0.readVarInt(v527, v529);
                v529 = v534 + v533;
            end;
        elseif v531 == v0.wireTypes.i32 then
            v532 = nil;
            v533, v534 = v0.readFixed32(v527, v529);
            v532 = v533;
            v529 = v534;
        elseif v531 == v0.wireTypes.i64 then
            v532 = nil;
            v533, v534 = v0.readFixed64(v527, v529);
            v532 = v533;
            v529 = v534;
        else
            error("Unsupported wire type: " .. v531);
        end;
    end;
    return v528;
end;
v7.jsonEncode = function(v535) --[[ Line: 5045 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v536 = {};
    if v535.action_type ~= nil and (v535.action_type ~= nil and v535.action_type ~= 0 or v535.action_type ~= v2.ActionType.fromNumber(0)) then
        v536.actionType = if typeof(v535.action_type) == "number" then v535.action_type else v2.ActionType.toNumber(v535.action_type);
    end;
    if v535.action_params ~= nil then
        v536.actionParams = v535.action_params:jsonEncode();
    end;
    return v536;
end;
v7.jsonDecode = function(v537) --[[ Line: 5067 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_22 (copy), v2 (copy)
    local v538 = l_v7_22.new();
    if v537.action_type ~= nil then
        v538.action_type = if typeof(v537.action_type) == "number" then v2.ActionType.fromNumber(v537.action_type) or v537.action_type else v2.ActionType.fromName(v537.action_type) or v537.action_type;
    end;
    if v537.actionType ~= nil then
        v538.action_type = if typeof(v537.actionType) == "number" then v2.ActionType.fromNumber(v537.actionType) or v537.actionType else v2.ActionType.fromName(v537.actionType) or v537.actionType;
    end;
    if v537.action_params ~= nil then
        v538.action_params = v2.OpenBadgeDetailsAction_Params.jsonDecode(v537.action_params);
    end;
    if v537.actionParams ~= nil then
        v538.action_params = v2.OpenBadgeDetailsAction_Params.jsonDecode(v537.actionParams);
    end;
    return v538;
end;
v7.descriptor = {
    name = "OpenBadgeDetailsAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenBadgeDetailsAction"
};
v2.OpenBadgeDetailsAction = v7;
v1.default:register(v2.OpenBadgeDetailsAction);
v7 = {};
v7.__index = v7;
local l_v7_23 = v7 --[[ copy: 7 -> 31 ]];
v7.new = function(v540) --[[ Line: 5107 ]] --[[ Name: new ]]
    -- upvalues: l_v7_23 (copy)
    return (setmetatable({
        badge_id = if not (v540 ~= nil) or v540.badge_id == nil then nil else v540.badge_id, 
        title_text = if not (v540 ~= nil) or v540.title_text == nil then nil else v540.title_text
    }, l_v7_23));
end;
v7.encode = function(v541) --[[ Line: 5116 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v542 = buffer.create(0);
    local v543 = 0;
    if v541.badge_id ~= nil then
        local v544 = v541.badge_id:encode();
        local v545, v546 = v0.writeTag(v542, v543, 1, v0.wireTypes.lengthDelimited);
        v545, v546 = v0.writeBuffer(v545, v546, v544, buffer.len(v544));
        v542 = v545;
        v543 = v546;
    end;
    if v541.title_text ~= nil then
        local v547 = v541.title_text:encode();
        local v548, v549 = v0.writeTag(v542, v543, 2, v0.wireTypes.lengthDelimited);
        v548, v549 = v0.writeBuffer(v548, v549, v547, buffer.len(v547));
        v542 = v548;
        v543 = v549;
    end;
    local v550 = buffer.create(v543);
    buffer.copy(v550, 0, v542, 0, v543);
    return v550;
end;
v7.decode = function(v551) --[[ Line: 5137 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_23 (copy), v0 (copy), v5 (copy)
    local v552 = l_v7_23.new();
    local v553 = 0;
    while v553 < buffer.len(v551) do
        local v554 = nil;
        local v555 = nil;
        local v556, v557, v558 = v0.readTag(v551, v553);
        v554 = v556;
        v555 = v557;
        v553 = v558;
        if v555 == v0.wireTypes.varint then
            v556 = nil;
            v557, v558 = v0.readVarInt(v551, v553);
            v556 = v557;
            v553 = v558;
        elseif v555 == v0.wireTypes.lengthDelimited then
            if v554 == 1 then
                v556 = nil;
                v557, v558 = v0.readBuffer(v551, v553);
                v556 = v557;
                v553 = v558;
                v552.badge_id = v5.StringProp.decode(v556);
            elseif v554 == 2 then
                v556 = nil;
                v557, v558 = v0.readBuffer(v551, v553);
                v556 = v557;
                v553 = v558;
                v552.title_text = v5.StringProp.decode(v556);
            else
                v556 = nil;
                v557, v558 = v0.readVarInt(v551, v553);
                v553 = v558 + v557;
            end;
        elseif v555 == v0.wireTypes.i32 then
            v556 = nil;
            v557, v558 = v0.readFixed32(v551, v553);
            v556 = v557;
            v553 = v558;
        elseif v555 == v0.wireTypes.i64 then
            v556 = nil;
            v557, v558 = v0.readFixed64(v551, v553);
            v556 = v557;
            v553 = v558;
        else
            error("Unsupported wire type: " .. v555);
        end;
    end;
    return v552;
end;
v7.jsonEncode = function(v559) --[[ Line: 5185 ]] --[[ Name: jsonEncode ]]
    local v560 = {};
    if v559.badge_id ~= nil then
        v560.badgeId = v559.badge_id:jsonEncode();
    end;
    if v559.title_text ~= nil then
        v560.titleText = v559.title_text:jsonEncode();
    end;
    return v560;
end;
v7.jsonDecode = function(v561) --[[ Line: 5199 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_23 (copy), v5 (copy)
    local v562 = l_v7_23.new();
    if v561.badge_id ~= nil then
        v562.badge_id = v5.StringProp.jsonDecode(v561.badge_id);
    end;
    if v561.badgeId ~= nil then
        v562.badge_id = v5.StringProp.jsonDecode(v561.badgeId);
    end;
    if v561.title_text ~= nil then
        v562.title_text = v5.StringProp.jsonDecode(v561.title_text);
    end;
    if v561.titleText ~= nil then
        v562.title_text = v5.StringProp.jsonDecode(v561.titleText);
    end;
    return v562;
end;
v7.descriptor = {
    name = "OpenBadgeDetailsAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenBadgeDetailsAction_Params = v7;
v1.default:register(v2.OpenBadgeDetailsAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_24 = v7 --[[ copy: 7 -> 32 ]];
v7.new = function(v564) --[[ Line: 5235 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_24 (copy)
    return (setmetatable({
        action_type = if not (v564 ~= nil) or v564.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v564.action_type, 
        action_params = if not (v564 ~= nil) or v564.action_params == nil then nil else v564.action_params
    }, l_v7_24));
end;
v7.encode = function(v565) --[[ Line: 5244 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v566 = buffer.create(0);
    local v567 = 0;
    if v565.action_type ~= nil and (v565.action_type ~= nil and v565.action_type ~= 0 or v565.action_type ~= v2.ActionType.fromNumber(0)) then
        local v568, v569 = v0.writeTag(v566, v567, 1, v0.wireTypes.varint);
        v568, v569 = v0.writeVarInt(v568, v569, v2.ActionType.toNumber(v565.action_type));
        v566 = v568;
        v567 = v569;
    end;
    if v565.action_params ~= nil then
        local v570 = v565.action_params:encode();
        local v571, v572 = v0.writeTag(v566, v567, 2, v0.wireTypes.lengthDelimited);
        v571, v572 = v0.writeBuffer(v571, v572, v570, buffer.len(v570));
        v566 = v571;
        v567 = v572;
    end;
    local v573 = buffer.create(v567);
    buffer.copy(v573, 0, v566, 0, v567);
    return v573;
end;
v7.decode = function(v574) --[[ Line: 5270 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_24 (copy), v0 (copy), v2 (copy)
    local v575 = l_v7_24.new();
    local v576 = 0;
    while v576 < buffer.len(v574) do
        local v577 = nil;
        local v578 = nil;
        local v579, v580, v581 = v0.readTag(v574, v576);
        v577 = v579;
        v578 = v580;
        v576 = v581;
        if v578 == v0.wireTypes.varint then
            if v577 == 1 then
                v579 = nil;
                v580, v581 = v0.readVarIntI32(v574, v576);
                v579 = v580;
                v576 = v581;
                v575.action_type = v2.ActionType.fromNumber(v579) or v579;
            else
                v579 = nil;
                v580, v581 = v0.readVarInt(v574, v576);
                v579 = v580;
                v576 = v581;
            end;
        elseif v578 == v0.wireTypes.lengthDelimited then
            if v577 == 2 then
                v579 = nil;
                v580, v581 = v0.readBuffer(v574, v576);
                v579 = v580;
                v576 = v581;
                v575.action_params = v2.LoadMoreFromApiAction_Params.decode(v579);
            else
                v579 = nil;
                v580, v581 = v0.readVarInt(v574, v576);
                v576 = v581 + v580;
            end;
        elseif v578 == v0.wireTypes.i32 then
            v579 = nil;
            v580, v581 = v0.readFixed32(v574, v576);
            v579 = v580;
            v576 = v581;
        elseif v578 == v0.wireTypes.i64 then
            v579 = nil;
            v580, v581 = v0.readFixed64(v574, v576);
            v579 = v580;
            v576 = v581;
        else
            error("Unsupported wire type: " .. v578);
        end;
    end;
    return v575;
end;
v7.jsonEncode = function(v582) --[[ Line: 5318 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v583 = {};
    if v582.action_type ~= nil and (v582.action_type ~= nil and v582.action_type ~= 0 or v582.action_type ~= v2.ActionType.fromNumber(0)) then
        v583.actionType = if typeof(v582.action_type) == "number" then v582.action_type else v2.ActionType.toNumber(v582.action_type);
    end;
    if v582.action_params ~= nil then
        v583.actionParams = v582.action_params:jsonEncode();
    end;
    return v583;
end;
v7.jsonDecode = function(v584) --[[ Line: 5340 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_24 (copy), v2 (copy)
    local v585 = l_v7_24.new();
    if v584.action_type ~= nil then
        v585.action_type = if typeof(v584.action_type) == "number" then v2.ActionType.fromNumber(v584.action_type) or v584.action_type else v2.ActionType.fromName(v584.action_type) or v584.action_type;
    end;
    if v584.actionType ~= nil then
        v585.action_type = if typeof(v584.actionType) == "number" then v2.ActionType.fromNumber(v584.actionType) or v584.actionType else v2.ActionType.fromName(v584.actionType) or v584.actionType;
    end;
    if v584.action_params ~= nil then
        v585.action_params = v2.LoadMoreFromApiAction_Params.jsonDecode(v584.action_params);
    end;
    if v584.actionParams ~= nil then
        v585.action_params = v2.LoadMoreFromApiAction_Params.jsonDecode(v584.actionParams);
    end;
    return v585;
end;
v7.descriptor = {
    name = "LoadMoreFromApiAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.LoadMoreFromApiAction"
};
v2.LoadMoreFromApiAction = v7;
v1.default:register(v2.LoadMoreFromApiAction);
v7 = {};
v7.__index = v7;
local l_v7_25 = v7 --[[ copy: 7 -> 33 ]];
v7.new = function(v587) --[[ Line: 5380 ]] --[[ Name: new ]]
    -- upvalues: l_v7_25 (copy)
    return (setmetatable({
        surface_key = if not (v587 ~= nil) or v587.surface_key == nil then nil else v587.surface_key, 
        config_key = if not (v587 ~= nil) or v587.config_key == nil then nil else v587.config_key
    }, l_v7_25));
end;
v7.encode = function(v588) --[[ Line: 5389 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v589 = buffer.create(0);
    local v590 = 0;
    if v588.surface_key ~= nil then
        local v591 = v588.surface_key:encode();
        local v592, v593 = v0.writeTag(v589, v590, 1, v0.wireTypes.lengthDelimited);
        v592, v593 = v0.writeBuffer(v592, v593, v591, buffer.len(v591));
        v589 = v592;
        v590 = v593;
    end;
    if v588.config_key ~= nil then
        local v594 = v588.config_key:encode();
        local v595, v596 = v0.writeTag(v589, v590, 2, v0.wireTypes.lengthDelimited);
        v595, v596 = v0.writeBuffer(v595, v596, v594, buffer.len(v594));
        v589 = v595;
        v590 = v596;
    end;
    local v597 = buffer.create(v590);
    buffer.copy(v597, 0, v589, 0, v590);
    return v597;
end;
v7.decode = function(v598) --[[ Line: 5410 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_25 (copy), v0 (copy), v5 (copy)
    local v599 = l_v7_25.new();
    local v600 = 0;
    while v600 < buffer.len(v598) do
        local v601 = nil;
        local v602 = nil;
        local v603, v604, v605 = v0.readTag(v598, v600);
        v601 = v603;
        v602 = v604;
        v600 = v605;
        if v602 == v0.wireTypes.varint then
            v603 = nil;
            v604, v605 = v0.readVarInt(v598, v600);
            v603 = v604;
            v600 = v605;
        elseif v602 == v0.wireTypes.lengthDelimited then
            if v601 == 1 then
                v603 = nil;
                v604, v605 = v0.readBuffer(v598, v600);
                v603 = v604;
                v600 = v605;
                v599.surface_key = v5.StringProp.decode(v603);
            elseif v601 == 2 then
                v603 = nil;
                v604, v605 = v0.readBuffer(v598, v600);
                v603 = v604;
                v600 = v605;
                v599.config_key = v5.StringProp.decode(v603);
            else
                v603 = nil;
                v604, v605 = v0.readVarInt(v598, v600);
                v600 = v605 + v604;
            end;
        elseif v602 == v0.wireTypes.i32 then
            v603 = nil;
            v604, v605 = v0.readFixed32(v598, v600);
            v603 = v604;
            v600 = v605;
        elseif v602 == v0.wireTypes.i64 then
            v603 = nil;
            v604, v605 = v0.readFixed64(v598, v600);
            v603 = v604;
            v600 = v605;
        else
            error("Unsupported wire type: " .. v602);
        end;
    end;
    return v599;
end;
v7.jsonEncode = function(v606) --[[ Line: 5458 ]] --[[ Name: jsonEncode ]]
    local v607 = {};
    if v606.surface_key ~= nil then
        v607.surfaceKey = v606.surface_key:jsonEncode();
    end;
    if v606.config_key ~= nil then
        v607.configKey = v606.config_key:jsonEncode();
    end;
    return v607;
end;
v7.jsonDecode = function(v608) --[[ Line: 5472 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_25 (copy), v5 (copy)
    local v609 = l_v7_25.new();
    if v608.surface_key ~= nil then
        v609.surface_key = v5.StringProp.jsonDecode(v608.surface_key);
    end;
    if v608.surfaceKey ~= nil then
        v609.surface_key = v5.StringProp.jsonDecode(v608.surfaceKey);
    end;
    if v608.config_key ~= nil then
        v609.config_key = v5.StringProp.jsonDecode(v608.config_key);
    end;
    if v608.configKey ~= nil then
        v609.config_key = v5.StringProp.jsonDecode(v608.configKey);
    end;
    return v609;
end;
v7.descriptor = {
    name = "LoadMoreFromApiAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.LoadMoreFromApiAction_Params = v7;
v1.default:register(v2.LoadMoreFromApiAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_26 = v7 --[[ copy: 7 -> 34 ]];
v7.new = function(v611) --[[ Line: 5509 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_26 (copy)
    return (setmetatable({
        action_type = if not (v611 ~= nil) or v611.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v611.action_type, 
        action_params = if not (v611 ~= nil) or v611.action_params == nil then nil else v611.action_params
    }, l_v7_26));
end;
v7.encode = function(v612) --[[ Line: 5518 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v613 = buffer.create(0);
    local v614 = 0;
    if v612.action_type ~= nil and (v612.action_type ~= nil and v612.action_type ~= 0 or v612.action_type ~= v2.ActionType.fromNumber(0)) then
        local v615, v616 = v0.writeTag(v613, v614, 1, v0.wireTypes.varint);
        v615, v616 = v0.writeVarInt(v615, v616, v2.ActionType.toNumber(v612.action_type));
        v613 = v615;
        v614 = v616;
    end;
    if v612.action_params ~= nil then
        local v617 = v612.action_params:encode();
        local v618, v619 = v0.writeTag(v613, v614, 2, v0.wireTypes.lengthDelimited);
        v618, v619 = v0.writeBuffer(v618, v619, v617, buffer.len(v617));
        v613 = v618;
        v614 = v619;
    end;
    local v620 = buffer.create(v614);
    buffer.copy(v620, 0, v613, 0, v614);
    return v620;
end;
v7.decode = function(v621) --[[ Line: 5544 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_26 (copy), v0 (copy), v2 (copy)
    local v622 = l_v7_26.new();
    local v623 = 0;
    while v623 < buffer.len(v621) do
        local v624 = nil;
        local v625 = nil;
        local v626, v627, v628 = v0.readTag(v621, v623);
        v624 = v626;
        v625 = v627;
        v623 = v628;
        if v625 == v0.wireTypes.varint then
            if v624 == 1 then
                v626 = nil;
                v627, v628 = v0.readVarIntI32(v621, v623);
                v626 = v627;
                v623 = v628;
                v622.action_type = v2.ActionType.fromNumber(v626) or v626;
            else
                v626 = nil;
                v627, v628 = v0.readVarInt(v621, v623);
                v626 = v627;
                v623 = v628;
            end;
        elseif v625 == v0.wireTypes.lengthDelimited then
            if v624 == 2 then
                v626 = nil;
                v627, v628 = v0.readBuffer(v621, v623);
                v626 = v627;
                v623 = v628;
                v622.action_params = v2.ShareAction_Params.decode(v626);
            else
                v626 = nil;
                v627, v628 = v0.readVarInt(v621, v623);
                v623 = v628 + v627;
            end;
        elseif v625 == v0.wireTypes.i32 then
            v626 = nil;
            v627, v628 = v0.readFixed32(v621, v623);
            v626 = v627;
            v623 = v628;
        elseif v625 == v0.wireTypes.i64 then
            v626 = nil;
            v627, v628 = v0.readFixed64(v621, v623);
            v626 = v627;
            v623 = v628;
        else
            error("Unsupported wire type: " .. v625);
        end;
    end;
    return v622;
end;
v7.jsonEncode = function(v629) --[[ Line: 5592 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v630 = {};
    if v629.action_type ~= nil and (v629.action_type ~= nil and v629.action_type ~= 0 or v629.action_type ~= v2.ActionType.fromNumber(0)) then
        v630.actionType = if typeof(v629.action_type) == "number" then v629.action_type else v2.ActionType.toNumber(v629.action_type);
    end;
    if v629.action_params ~= nil then
        v630.actionParams = v629.action_params:jsonEncode();
    end;
    return v630;
end;
v7.jsonDecode = function(v631) --[[ Line: 5614 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_26 (copy), v2 (copy)
    local v632 = l_v7_26.new();
    if v631.action_type ~= nil then
        v632.action_type = if typeof(v631.action_type) == "number" then v2.ActionType.fromNumber(v631.action_type) or v631.action_type else v2.ActionType.fromName(v631.action_type) or v631.action_type;
    end;
    if v631.actionType ~= nil then
        v632.action_type = if typeof(v631.actionType) == "number" then v2.ActionType.fromNumber(v631.actionType) or v631.actionType else v2.ActionType.fromName(v631.actionType) or v631.actionType;
    end;
    if v631.action_params ~= nil then
        v632.action_params = v2.ShareAction_Params.jsonDecode(v631.action_params);
    end;
    if v631.actionParams ~= nil then
        v632.action_params = v2.ShareAction_Params.jsonDecode(v631.actionParams);
    end;
    return v632;
end;
v7.descriptor = {
    name = "ShareAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ShareAction"
};
v2.ShareAction = v7;
v1.default:register(v2.ShareAction);
v7 = {};
v7.__index = v7;
local l_v7_27 = v7 --[[ copy: 7 -> 35 ]];
v7.new = function(v634) --[[ Line: 5654 ]] --[[ Name: new ]]
    -- upvalues: l_v7_27 (copy)
    return (setmetatable({
        oneof_prop = if not (v634 ~= nil) or v634.oneof_prop == nil then nil else v634.oneof_prop
    }, l_v7_27));
end;
v7.encode = function(v635) --[[ Line: 5662 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v636 = buffer.create(0);
    local v637 = 0;
    if v635.oneof_prop ~= nil and v635.oneof_prop.type == "generic_share_link_data" then
        local v638 = v635.oneof_prop.value:encode();
        local v639, v640 = v0.writeTag(v636, v637, 1, v0.wireTypes.lengthDelimited);
        v639, v640 = v0.writeBuffer(v639, v640, v638, buffer.len(v638));
        v636 = v639;
        v637 = v640;
    end;
    local v641 = buffer.create(v637);
    buffer.copy(v641, 0, v636, 0, v637);
    return v641;
end;
v7.decode = function(v642) --[[ Line: 5679 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_27 (copy), v0 (copy), v6 (copy)
    local v643 = l_v7_27.new();
    local v644 = 0;
    while v644 < buffer.len(v642) do
        local v645 = nil;
        local v646 = nil;
        local v647, v648, v649 = v0.readTag(v642, v644);
        v645 = v647;
        v646 = v648;
        v644 = v649;
        if v646 == v0.wireTypes.varint then
            v647 = nil;
            v648, v649 = v0.readVarInt(v642, v644);
            v647 = v648;
            v644 = v649;
        elseif v646 == v0.wireTypes.lengthDelimited then
            if v645 == 1 then
                v647 = nil;
                v648, v649 = v0.readBuffer(v642, v644);
                v647 = v648;
                v644 = v649;
                v643.oneof_prop = {
                    type = "generic_share_link_data", 
                    value = v6.GenericShareLinkData.decode(v647)
                };
            else
                v647 = nil;
                v648, v649 = v0.readVarInt(v642, v644);
                v644 = v649 + v648;
            end;
        elseif v646 == v0.wireTypes.i32 then
            v647 = nil;
            v648, v649 = v0.readFixed32(v642, v644);
            v647 = v648;
            v644 = v649;
        elseif v646 == v0.wireTypes.i64 then
            v647 = nil;
            v648, v649 = v0.readFixed64(v642, v644);
            v647 = v648;
            v644 = v649;
        else
            error("Unsupported wire type: " .. v646);
        end;
    end;
    return v643;
end;
v7.jsonEncode = function(v650) --[[ Line: 5727 ]] --[[ Name: jsonEncode ]]
    local v651 = {};
    if v650.oneof_prop ~= nil and v650.oneof_prop.type == "generic_share_link_data" then
        v651.genericShareLinkData = v650.oneof_prop.value:jsonEncode();
    end;
    return v651;
end;
v7.jsonDecode = function(v652) --[[ Line: 5739 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_27 (copy), v6 (copy)
    local v653 = l_v7_27.new();
    if v652.generic_share_link_data ~= nil then
        v653.oneof_prop = {
            type = "generic_share_link_data", 
            value = v6.GenericShareLinkData.jsonDecode(v652.generic_share_link_data)
        };
    end;
    if v652.genericShareLinkData ~= nil then
        v653.oneof_prop = {
            type = "generic_share_link_data", 
            value = v6.GenericShareLinkData.jsonDecode(v652.genericShareLinkData)
        };
    end;
    return v653;
end;
v7.descriptor = {
    name = "ShareAction_ShareLinkData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkData"
};
v2.ShareAction_ShareLinkData = v7;
v1.default:register(v2.ShareAction_ShareLinkData);
v7 = {};
v7.__index = v7;
local l_v7_28 = v7 --[[ copy: 7 -> 36 ]];
v7.new = function(v655) --[[ Line: 5777 ]] --[[ Name: new ]]
    -- upvalues: l_v7_28 (copy)
    return (setmetatable({
        share_link_type = if not (v655 ~= nil) or v655.share_link_type == nil then nil else v655.share_link_type, 
        share_link_data = if not (v655 ~= nil) or v655.share_link_data == nil then nil else v655.share_link_data, 
        entry_point_key = if not (v655 ~= nil) or v655.entry_point_key == nil then nil else v655.entry_point_key
    }, l_v7_28));
end;
v7.encode = function(v656) --[[ Line: 5785 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v657 = buffer.create(0);
    local v658 = 0;
    if v656.share_link_type ~= nil then
        local v659 = v656.share_link_type:encode();
        local v660, v661 = v0.writeTag(v657, v658, 1, v0.wireTypes.lengthDelimited);
        v660, v661 = v0.writeBuffer(v660, v661, v659, buffer.len(v659));
        v657 = v660;
        v658 = v661;
    end;
    if v656.share_link_data ~= nil then
        local v662 = v656.share_link_data:encode();
        local v663, v664 = v0.writeTag(v657, v658, 2, v0.wireTypes.lengthDelimited);
        v663, v664 = v0.writeBuffer(v663, v664, v662, buffer.len(v662));
        v657 = v663;
        v658 = v664;
    end;
    if v656.entry_point_key ~= nil then
        local v665 = v656.entry_point_key:encode();
        local v666, v667 = v0.writeTag(v657, v658, 3, v0.wireTypes.lengthDelimited);
        v666, v667 = v0.writeBuffer(v666, v667, v665, buffer.len(v665));
        v657 = v666;
        v658 = v667;
    end;
    local v668 = buffer.create(v658);
    buffer.copy(v668, 0, v657, 0, v658);
    return v668;
end;
v7.decode = function(v669) --[[ Line: 5812 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_28 (copy), v0 (copy), v5 (copy), v2 (copy)
    local v670 = l_v7_28.new();
    local v671 = 0;
    while v671 < buffer.len(v669) do
        local v672 = nil;
        local v673 = nil;
        local v674, v675, v676 = v0.readTag(v669, v671);
        v672 = v674;
        v673 = v675;
        v671 = v676;
        if v673 == v0.wireTypes.varint then
            v674 = nil;
            v675, v676 = v0.readVarInt(v669, v671);
            v674 = v675;
            v671 = v676;
        elseif v673 == v0.wireTypes.lengthDelimited then
            if v672 == 1 then
                v674 = nil;
                v675, v676 = v0.readBuffer(v669, v671);
                v674 = v675;
                v671 = v676;
                v670.share_link_type = v5.StringProp.decode(v674);
            elseif v672 == 2 then
                v674 = nil;
                v675, v676 = v0.readBuffer(v669, v671);
                v674 = v675;
                v671 = v676;
                v670.share_link_data = v2.ShareAction_ShareLinkData.decode(v674);
            elseif v672 == 3 then
                v674 = nil;
                v675, v676 = v0.readBuffer(v669, v671);
                v674 = v675;
                v671 = v676;
                v670.entry_point_key = v5.StringProp.decode(v674);
            else
                v674 = nil;
                v675, v676 = v0.readVarInt(v669, v671);
                v671 = v676 + v675;
            end;
        elseif v673 == v0.wireTypes.i32 then
            v674 = nil;
            v675, v676 = v0.readFixed32(v669, v671);
            v674 = v675;
            v671 = v676;
        elseif v673 == v0.wireTypes.i64 then
            v674 = nil;
            v675, v676 = v0.readFixed64(v669, v671);
            v674 = v675;
            v671 = v676;
        else
            error("Unsupported wire type: " .. v673);
        end;
    end;
    return v670;
end;
v7.jsonEncode = function(v677) --[[ Line: 5865 ]] --[[ Name: jsonEncode ]]
    local v678 = {};
    if v677.share_link_type ~= nil then
        v678.shareLinkType = v677.share_link_type:jsonEncode();
    end;
    if v677.share_link_data ~= nil then
        v678.shareLinkData = v677.share_link_data:jsonEncode();
    end;
    if v677.entry_point_key ~= nil then
        v678.entryPointKey = v677.entry_point_key:jsonEncode();
    end;
    return v678;
end;
v7.jsonDecode = function(v679) --[[ Line: 5883 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_28 (copy), v5 (copy), v2 (copy)
    local v680 = l_v7_28.new();
    if v679.share_link_type ~= nil then
        v680.share_link_type = v5.StringProp.jsonDecode(v679.share_link_type);
    end;
    if v679.shareLinkType ~= nil then
        v680.share_link_type = v5.StringProp.jsonDecode(v679.shareLinkType);
    end;
    if v679.share_link_data ~= nil then
        v680.share_link_data = v2.ShareAction_ShareLinkData.jsonDecode(v679.share_link_data);
    end;
    if v679.shareLinkData ~= nil then
        v680.share_link_data = v2.ShareAction_ShareLinkData.jsonDecode(v679.shareLinkData);
    end;
    if v679.entry_point_key ~= nil then
        v680.entry_point_key = v5.StringProp.jsonDecode(v679.entry_point_key);
    end;
    if v679.entryPointKey ~= nil then
        v680.entry_point_key = v5.StringProp.jsonDecode(v679.entryPointKey);
    end;
    return v680;
end;
v7.descriptor = {
    name = "ShareAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.ShareAction_Params = v7;
v1.default:register(v2.ShareAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_29 = v7 --[[ copy: 7 -> 37 ]];
v7.new = function(v682) --[[ Line: 5931 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_29 (copy)
    return (setmetatable({
        action_type = if not (v682 ~= nil) or v682.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v682.action_type, 
        action_params = if not (v682 ~= nil) or v682.action_params == nil then nil else v682.action_params
    }, l_v7_29));
end;
v7.encode = function(v683) --[[ Line: 5940 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v684 = buffer.create(0);
    local v685 = 0;
    if v683.action_type ~= nil and (v683.action_type ~= nil and v683.action_type ~= 0 or v683.action_type ~= v2.ActionType.fromNumber(0)) then
        local v686, v687 = v0.writeTag(v684, v685, 1, v0.wireTypes.varint);
        v686, v687 = v0.writeVarInt(v686, v687, v2.ActionType.toNumber(v683.action_type));
        v684 = v686;
        v685 = v687;
    end;
    if v683.action_params ~= nil then
        local v688 = v683.action_params:encode();
        local v689, v690 = v0.writeTag(v684, v685, 2, v0.wireTypes.lengthDelimited);
        v689, v690 = v0.writeBuffer(v689, v690, v688, buffer.len(v688));
        v684 = v689;
        v685 = v690;
    end;
    local v691 = buffer.create(v685);
    buffer.copy(v691, 0, v684, 0, v685);
    return v691;
end;
v7.decode = function(v692) --[[ Line: 5966 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_29 (copy), v0 (copy), v2 (copy)
    local v693 = l_v7_29.new();
    local v694 = 0;
    while v694 < buffer.len(v692) do
        local v695 = nil;
        local v696 = nil;
        local v697, v698, v699 = v0.readTag(v692, v694);
        v695 = v697;
        v696 = v698;
        v694 = v699;
        if v696 == v0.wireTypes.varint then
            if v695 == 1 then
                v697 = nil;
                v698, v699 = v0.readVarIntI32(v692, v694);
                v697 = v698;
                v694 = v699;
                v693.action_type = v2.ActionType.fromNumber(v697) or v697;
            else
                v697 = nil;
                v698, v699 = v0.readVarInt(v692, v694);
                v697 = v698;
                v694 = v699;
            end;
        elseif v696 == v0.wireTypes.lengthDelimited then
            if v695 == 2 then
                v697 = nil;
                v698, v699 = v0.readBuffer(v692, v694);
                v697 = v698;
                v694 = v699;
                v693.action_params = v2.OpenAbuseReportAction_Params.decode(v697);
            else
                v697 = nil;
                v698, v699 = v0.readVarInt(v692, v694);
                v694 = v699 + v698;
            end;
        elseif v696 == v0.wireTypes.i32 then
            v697 = nil;
            v698, v699 = v0.readFixed32(v692, v694);
            v697 = v698;
            v694 = v699;
        elseif v696 == v0.wireTypes.i64 then
            v697 = nil;
            v698, v699 = v0.readFixed64(v692, v694);
            v697 = v698;
            v694 = v699;
        else
            error("Unsupported wire type: " .. v696);
        end;
    end;
    return v693;
end;
v7.jsonEncode = function(v700) --[[ Line: 6014 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v701 = {};
    if v700.action_type ~= nil and (v700.action_type ~= nil and v700.action_type ~= 0 or v700.action_type ~= v2.ActionType.fromNumber(0)) then
        v701.actionType = if typeof(v700.action_type) == "number" then v700.action_type else v2.ActionType.toNumber(v700.action_type);
    end;
    if v700.action_params ~= nil then
        v701.actionParams = v700.action_params:jsonEncode();
    end;
    return v701;
end;
v7.jsonDecode = function(v702) --[[ Line: 6036 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_29 (copy), v2 (copy)
    local v703 = l_v7_29.new();
    if v702.action_type ~= nil then
        v703.action_type = if typeof(v702.action_type) == "number" then v2.ActionType.fromNumber(v702.action_type) or v702.action_type else v2.ActionType.fromName(v702.action_type) or v702.action_type;
    end;
    if v702.actionType ~= nil then
        v703.action_type = if typeof(v702.actionType) == "number" then v2.ActionType.fromNumber(v702.actionType) or v702.actionType else v2.ActionType.fromName(v702.actionType) or v702.actionType;
    end;
    if v702.action_params ~= nil then
        v703.action_params = v2.OpenAbuseReportAction_Params.jsonDecode(v702.action_params);
    end;
    if v702.actionParams ~= nil then
        v703.action_params = v2.OpenAbuseReportAction_Params.jsonDecode(v702.actionParams);
    end;
    return v703;
end;
v7.descriptor = {
    name = "OpenAbuseReportAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenAbuseReportAction"
};
v2.OpenAbuseReportAction = v7;
v1.default:register(v2.OpenAbuseReportAction);
v7 = {};
v7.__index = v7;
local l_v7_30 = v7 --[[ copy: 7 -> 38 ]];
v7.new = function(v705) --[[ Line: 6076 ]] --[[ Name: new ]]
    -- upvalues: l_v7_30 (copy)
    return (setmetatable({
        target_id = if not (v705 ~= nil) or v705.target_id == nil then nil else v705.target_id, 
        abuse_vector = if not (v705 ~= nil) or v705.abuse_vector == nil then nil else v705.abuse_vector, 
        asset_type_name = if not (v705 ~= nil) or v705.asset_type_name == nil then nil else v705.asset_type_name, 
        universe_id = if not (v705 ~= nil) or v705.universe_id == nil then nil else v705.universe_id
    }, l_v7_30));
end;
v7.encode = function(v706) --[[ Line: 6087 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v707 = buffer.create(0);
    local v708 = 0;
    if v706.target_id ~= nil then
        local v709 = v706.target_id:encode();
        local v710, v711 = v0.writeTag(v707, v708, 1, v0.wireTypes.lengthDelimited);
        v710, v711 = v0.writeBuffer(v710, v711, v709, buffer.len(v709));
        v707 = v710;
        v708 = v711;
    end;
    if v706.abuse_vector ~= nil then
        local v712 = v706.abuse_vector:encode();
        local v713, v714 = v0.writeTag(v707, v708, 2, v0.wireTypes.lengthDelimited);
        v713, v714 = v0.writeBuffer(v713, v714, v712, buffer.len(v712));
        v707 = v713;
        v708 = v714;
    end;
    if v706.asset_type_name ~= nil then
        local v715 = v706.asset_type_name:encode();
        local v716, v717 = v0.writeTag(v707, v708, 3, v0.wireTypes.lengthDelimited);
        v716, v717 = v0.writeBuffer(v716, v717, v715, buffer.len(v715));
        v707 = v716;
        v708 = v717;
    end;
    if v706.universe_id ~= nil then
        local v718 = v706.universe_id:encode();
        local v719, v720 = v0.writeTag(v707, v708, 4, v0.wireTypes.lengthDelimited);
        v719, v720 = v0.writeBuffer(v719, v720, v718, buffer.len(v718));
        v707 = v719;
        v708 = v720;
    end;
    local v721 = buffer.create(v708);
    buffer.copy(v721, 0, v707, 0, v708);
    return v721;
end;
v7.decode = function(v722) --[[ Line: 6120 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_30 (copy), v0 (copy), v5 (copy)
    local v723 = l_v7_30.new();
    local v724 = 0;
    while v724 < buffer.len(v722) do
        local v725 = nil;
        local v726 = nil;
        local v727, v728, v729 = v0.readTag(v722, v724);
        v725 = v727;
        v726 = v728;
        v724 = v729;
        if v726 == v0.wireTypes.varint then
            v727 = nil;
            v728, v729 = v0.readVarInt(v722, v724);
            v727 = v728;
            v724 = v729;
        elseif v726 == v0.wireTypes.lengthDelimited then
            if v725 == 1 then
                v727 = nil;
                v728, v729 = v0.readBuffer(v722, v724);
                v727 = v728;
                v724 = v729;
                v723.target_id = v5.StringProp.decode(v727);
            elseif v725 == 2 then
                v727 = nil;
                v728, v729 = v0.readBuffer(v722, v724);
                v727 = v728;
                v724 = v729;
                v723.abuse_vector = v5.StringProp.decode(v727);
            elseif v725 == 3 then
                v727 = nil;
                v728, v729 = v0.readBuffer(v722, v724);
                v727 = v728;
                v724 = v729;
                v723.asset_type_name = v5.StringProp.decode(v727);
            elseif v725 == 4 then
                v727 = nil;
                v728, v729 = v0.readBuffer(v722, v724);
                v727 = v728;
                v724 = v729;
                v723.universe_id = v5.StringProp.decode(v727);
            else
                v727 = nil;
                v728, v729 = v0.readVarInt(v722, v724);
                v724 = v729 + v728;
            end;
        elseif v726 == v0.wireTypes.i32 then
            v727 = nil;
            v728, v729 = v0.readFixed32(v722, v724);
            v727 = v728;
            v724 = v729;
        elseif v726 == v0.wireTypes.i64 then
            v727 = nil;
            v728, v729 = v0.readFixed64(v722, v724);
            v727 = v728;
            v724 = v729;
        else
            error("Unsupported wire type: " .. v726);
        end;
    end;
    return v723;
end;
v7.jsonEncode = function(v730) --[[ Line: 6178 ]] --[[ Name: jsonEncode ]]
    local v731 = {};
    if v730.target_id ~= nil then
        v731.targetId = v730.target_id:jsonEncode();
    end;
    if v730.abuse_vector ~= nil then
        v731.abuseVector = v730.abuse_vector:jsonEncode();
    end;
    if v730.asset_type_name ~= nil then
        v731.assetTypeName = v730.asset_type_name:jsonEncode();
    end;
    if v730.universe_id ~= nil then
        v731.universeId = v730.universe_id:jsonEncode();
    end;
    return v731;
end;
v7.jsonDecode = function(v732) --[[ Line: 6200 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_30 (copy), v5 (copy)
    local v733 = l_v7_30.new();
    if v732.target_id ~= nil then
        v733.target_id = v5.StringProp.jsonDecode(v732.target_id);
    end;
    if v732.targetId ~= nil then
        v733.target_id = v5.StringProp.jsonDecode(v732.targetId);
    end;
    if v732.abuse_vector ~= nil then
        v733.abuse_vector = v5.StringProp.jsonDecode(v732.abuse_vector);
    end;
    if v732.abuseVector ~= nil then
        v733.abuse_vector = v5.StringProp.jsonDecode(v732.abuseVector);
    end;
    if v732.asset_type_name ~= nil then
        v733.asset_type_name = v5.StringProp.jsonDecode(v732.asset_type_name);
    end;
    if v732.assetTypeName ~= nil then
        v733.asset_type_name = v5.StringProp.jsonDecode(v732.assetTypeName);
    end;
    if v732.universe_id ~= nil then
        v733.universe_id = v5.StringProp.jsonDecode(v732.universe_id);
    end;
    if v732.universeId ~= nil then
        v733.universe_id = v5.StringProp.jsonDecode(v732.universeId);
    end;
    return v733;
end;
v7.descriptor = {
    name = "OpenAbuseReportAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenAbuseReportAction_Params = v7;
v1.default:register(v2.OpenAbuseReportAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_31 = v7 --[[ copy: 7 -> 39 ]];
v7.new = function(v735) --[[ Line: 6257 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_31 (copy)
    return (setmetatable({
        action_type = if not (v735 ~= nil) or v735.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v735.action_type, 
        action_params = if not (v735 ~= nil) or v735.action_params == nil then nil else v735.action_params
    }, l_v7_31));
end;
v7.encode = function(v736) --[[ Line: 6268 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v737 = buffer.create(0);
    local v738 = 0;
    if v736.action_type ~= nil and (v736.action_type ~= nil and v736.action_type ~= 0 or v736.action_type ~= v2.ActionType.fromNumber(0)) then
        local v739, v740 = v0.writeTag(v737, v738, 1, v0.wireTypes.varint);
        v739, v740 = v0.writeVarInt(v739, v740, v2.ActionType.toNumber(v736.action_type));
        v737 = v739;
        v738 = v740;
    end;
    if v736.action_params ~= nil then
        local v741 = v736.action_params:encode();
        local v742, v743 = v0.writeTag(v737, v738, 2, v0.wireTypes.lengthDelimited);
        v742, v743 = v0.writeBuffer(v742, v743, v741, buffer.len(v741));
        v737 = v742;
        v738 = v743;
    end;
    local v744 = buffer.create(v738);
    buffer.copy(v744, 0, v737, 0, v738);
    return v744;
end;
v7.decode = function(v745) --[[ Line: 6294 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_31 (copy), v0 (copy), v2 (copy)
    local v746 = l_v7_31.new();
    local v747 = 0;
    while v747 < buffer.len(v745) do
        local v748 = nil;
        local v749 = nil;
        local v750, v751, v752 = v0.readTag(v745, v747);
        v748 = v750;
        v749 = v751;
        v747 = v752;
        if v749 == v0.wireTypes.varint then
            if v748 == 1 then
                v750 = nil;
                v751, v752 = v0.readVarIntI32(v745, v747);
                v750 = v751;
                v747 = v752;
                v746.action_type = v2.ActionType.fromNumber(v750) or v750;
            else
                v750 = nil;
                v751, v752 = v0.readVarInt(v745, v747);
                v750 = v751;
                v747 = v752;
            end;
        elseif v749 == v0.wireTypes.lengthDelimited then
            if v748 == 2 then
                v750 = nil;
                v751, v752 = v0.readBuffer(v745, v747);
                v750 = v751;
                v747 = v752;
                v746.action_params = v2.RemoveBadgeFromInventoryAction_Params.decode(v750);
            else
                v750 = nil;
                v751, v752 = v0.readVarInt(v745, v747);
                v747 = v752 + v751;
            end;
        elseif v749 == v0.wireTypes.i32 then
            v750 = nil;
            v751, v752 = v0.readFixed32(v745, v747);
            v750 = v751;
            v747 = v752;
        elseif v749 == v0.wireTypes.i64 then
            v750 = nil;
            v751, v752 = v0.readFixed64(v745, v747);
            v750 = v751;
            v747 = v752;
        else
            error("Unsupported wire type: " .. v749);
        end;
    end;
    return v746;
end;
v7.jsonEncode = function(v753) --[[ Line: 6342 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v754 = {};
    if v753.action_type ~= nil and (v753.action_type ~= nil and v753.action_type ~= 0 or v753.action_type ~= v2.ActionType.fromNumber(0)) then
        v754.actionType = if typeof(v753.action_type) == "number" then v753.action_type else v2.ActionType.toNumber(v753.action_type);
    end;
    if v753.action_params ~= nil then
        v754.actionParams = v753.action_params:jsonEncode();
    end;
    return v754;
end;
v7.jsonDecode = function(v755) --[[ Line: 6364 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_31 (copy), v2 (copy)
    local v756 = l_v7_31.new();
    if v755.action_type ~= nil then
        v756.action_type = if typeof(v755.action_type) == "number" then v2.ActionType.fromNumber(v755.action_type) or v755.action_type else v2.ActionType.fromName(v755.action_type) or v755.action_type;
    end;
    if v755.actionType ~= nil then
        v756.action_type = if typeof(v755.actionType) == "number" then v2.ActionType.fromNumber(v755.actionType) or v755.actionType else v2.ActionType.fromName(v755.actionType) or v755.actionType;
    end;
    if v755.action_params ~= nil then
        v756.action_params = v2.RemoveBadgeFromInventoryAction_Params.jsonDecode(v755.action_params);
    end;
    if v755.actionParams ~= nil then
        v756.action_params = v2.RemoveBadgeFromInventoryAction_Params.jsonDecode(v755.actionParams);
    end;
    return v756;
end;
v7.descriptor = {
    name = "RemoveBadgeFromInventoryAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.RemoveBadgeFromInventoryAction"
};
v2.RemoveBadgeFromInventoryAction = v7;
v1.default:register(v2.RemoveBadgeFromInventoryAction);
v7 = {};
v7.__index = v7;
local l_v7_32 = v7 --[[ copy: 7 -> 40 ]];
v7.new = function(v758) --[[ Line: 6404 ]] --[[ Name: new ]]
    -- upvalues: l_v7_32 (copy)
    return (setmetatable({
        asset_id = if not (v758 ~= nil) or v758.asset_id == nil then nil else v758.asset_id
    }, l_v7_32));
end;
v7.encode = function(v759) --[[ Line: 6412 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v760 = buffer.create(0);
    local v761 = 0;
    if v759.asset_id ~= nil then
        local v762 = v759.asset_id:encode();
        local v763, v764 = v0.writeTag(v760, v761, 1, v0.wireTypes.lengthDelimited);
        v763, v764 = v0.writeBuffer(v763, v764, v762, buffer.len(v762));
        v760 = v763;
        v761 = v764;
    end;
    local v765 = buffer.create(v761);
    buffer.copy(v765, 0, v760, 0, v761);
    return v765;
end;
v7.decode = function(v766) --[[ Line: 6427 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_32 (copy), v0 (copy), v5 (copy)
    local v767 = l_v7_32.new();
    local v768 = 0;
    while v768 < buffer.len(v766) do
        local v769 = nil;
        local v770 = nil;
        local v771, v772, v773 = v0.readTag(v766, v768);
        v769 = v771;
        v770 = v772;
        v768 = v773;
        if v770 == v0.wireTypes.varint then
            v771 = nil;
            v772, v773 = v0.readVarInt(v766, v768);
            v771 = v772;
            v768 = v773;
        elseif v770 == v0.wireTypes.lengthDelimited then
            if v769 == 1 then
                v771 = nil;
                v772, v773 = v0.readBuffer(v766, v768);
                v771 = v772;
                v768 = v773;
                v767.asset_id = v5.StringProp.decode(v771);
            else
                v771 = nil;
                v772, v773 = v0.readVarInt(v766, v768);
                v768 = v773 + v772;
            end;
        elseif v770 == v0.wireTypes.i32 then
            v771 = nil;
            v772, v773 = v0.readFixed32(v766, v768);
            v771 = v772;
            v768 = v773;
        elseif v770 == v0.wireTypes.i64 then
            v771 = nil;
            v772, v773 = v0.readFixed64(v766, v768);
            v771 = v772;
            v768 = v773;
        else
            error("Unsupported wire type: " .. v770);
        end;
    end;
    return v767;
end;
v7.jsonEncode = function(v774) --[[ Line: 6470 ]] --[[ Name: jsonEncode ]]
    local v775 = {};
    if v774.asset_id ~= nil then
        v775.assetId = v774.asset_id:jsonEncode();
    end;
    return v775;
end;
v7.jsonDecode = function(v776) --[[ Line: 6480 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_32 (copy), v5 (copy)
    local v777 = l_v7_32.new();
    if v776.asset_id ~= nil then
        v777.asset_id = v5.StringProp.jsonDecode(v776.asset_id);
    end;
    if v776.assetId ~= nil then
        v777.asset_id = v5.StringProp.jsonDecode(v776.assetId);
    end;
    return v777;
end;
v7.descriptor = {
    name = "RemoveBadgeFromInventoryAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.RemoveBadgeFromInventoryAction_Params = v7;
v1.default:register(v2.RemoveBadgeFromInventoryAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_33 = v7 --[[ copy: 7 -> 41 ]];
v7.new = function(v779) --[[ Line: 6510 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_33 (copy)
    return (setmetatable({
        action_type = if not (v779 ~= nil) or v779.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v779.action_type, 
        action_params = if not (v779 ~= nil) or v779.action_params == nil then nil else v779.action_params
    }, l_v7_33));
end;
v7.encode = function(v780) --[[ Line: 6519 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v781 = buffer.create(0);
    local v782 = 0;
    if v780.action_type ~= nil and (v780.action_type ~= nil and v780.action_type ~= 0 or v780.action_type ~= v2.ActionType.fromNumber(0)) then
        local v783, v784 = v0.writeTag(v781, v782, 1, v0.wireTypes.varint);
        v783, v784 = v0.writeVarInt(v783, v784, v2.ActionType.toNumber(v780.action_type));
        v781 = v783;
        v782 = v784;
    end;
    if v780.action_params ~= nil then
        local v785 = v780.action_params:encode();
        local v786, v787 = v0.writeTag(v781, v782, 2, v0.wireTypes.lengthDelimited);
        v786, v787 = v0.writeBuffer(v786, v787, v785, buffer.len(v785));
        v781 = v786;
        v782 = v787;
    end;
    local v788 = buffer.create(v782);
    buffer.copy(v788, 0, v781, 0, v782);
    return v788;
end;
v7.decode = function(v789) --[[ Line: 6545 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_33 (copy), v0 (copy), v2 (copy)
    local v790 = l_v7_33.new();
    local v791 = 0;
    while v791 < buffer.len(v789) do
        local v792 = nil;
        local v793 = nil;
        local v794, v795, v796 = v0.readTag(v789, v791);
        v792 = v794;
        v793 = v795;
        v791 = v796;
        if v793 == v0.wireTypes.varint then
            if v792 == 1 then
                v794 = nil;
                v795, v796 = v0.readVarIntI32(v789, v791);
                v794 = v795;
                v791 = v796;
                v790.action_type = v2.ActionType.fromNumber(v794) or v794;
            else
                v794 = nil;
                v795, v796 = v0.readVarInt(v789, v791);
                v794 = v795;
                v791 = v796;
            end;
        elseif v793 == v0.wireTypes.lengthDelimited then
            if v792 == 2 then
                v794 = nil;
                v795, v796 = v0.readBuffer(v789, v791);
                v794 = v795;
                v791 = v796;
                v790.action_params = v2.OpenProfileAction_Params.decode(v794);
            else
                v794 = nil;
                v795, v796 = v0.readVarInt(v789, v791);
                v791 = v796 + v795;
            end;
        elseif v793 == v0.wireTypes.i32 then
            v794 = nil;
            v795, v796 = v0.readFixed32(v789, v791);
            v794 = v795;
            v791 = v796;
        elseif v793 == v0.wireTypes.i64 then
            v794 = nil;
            v795, v796 = v0.readFixed64(v789, v791);
            v794 = v795;
            v791 = v796;
        else
            error("Unsupported wire type: " .. v793);
        end;
    end;
    return v790;
end;
v7.jsonEncode = function(v797) --[[ Line: 6593 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v798 = {};
    if v797.action_type ~= nil and (v797.action_type ~= nil and v797.action_type ~= 0 or v797.action_type ~= v2.ActionType.fromNumber(0)) then
        v798.actionType = if typeof(v797.action_type) == "number" then v797.action_type else v2.ActionType.toNumber(v797.action_type);
    end;
    if v797.action_params ~= nil then
        v798.actionParams = v797.action_params:jsonEncode();
    end;
    return v798;
end;
v7.jsonDecode = function(v799) --[[ Line: 6615 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_33 (copy), v2 (copy)
    local v800 = l_v7_33.new();
    if v799.action_type ~= nil then
        v800.action_type = if typeof(v799.action_type) == "number" then v2.ActionType.fromNumber(v799.action_type) or v799.action_type else v2.ActionType.fromName(v799.action_type) or v799.action_type;
    end;
    if v799.actionType ~= nil then
        v800.action_type = if typeof(v799.actionType) == "number" then v2.ActionType.fromNumber(v799.actionType) or v799.actionType else v2.ActionType.fromName(v799.actionType) or v799.actionType;
    end;
    if v799.action_params ~= nil then
        v800.action_params = v2.OpenProfileAction_Params.jsonDecode(v799.action_params);
    end;
    if v799.actionParams ~= nil then
        v800.action_params = v2.OpenProfileAction_Params.jsonDecode(v799.actionParams);
    end;
    return v800;
end;
v7.descriptor = {
    name = "OpenProfileAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenProfileAction"
};
v2.OpenProfileAction = v7;
v1.default:register(v2.OpenProfileAction);
v7 = {};
v7.__index = v7;
local l_v7_34 = v7 --[[ copy: 7 -> 42 ]];
v7.new = function(v802) --[[ Line: 6655 ]] --[[ Name: new ]]
    -- upvalues: l_v7_34 (copy)
    return (setmetatable({
        profile_id = if not (v802 ~= nil) or v802.profile_id == nil then nil else v802.profile_id, 
        profile_type = if not (v802 ~= nil) or v802.profile_type == nil then nil else v802.profile_type, 
        source = if not (v802 ~= nil) or v802.source == nil then nil else v802.source
    }, l_v7_34));
end;
v7.encode = function(v803) --[[ Line: 6663 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v804 = buffer.create(0);
    local v805 = 0;
    if v803.profile_id ~= nil then
        local v806 = v803.profile_id:encode();
        local v807, v808 = v0.writeTag(v804, v805, 1, v0.wireTypes.lengthDelimited);
        v807, v808 = v0.writeBuffer(v807, v808, v806, buffer.len(v806));
        v804 = v807;
        v805 = v808;
    end;
    if v803.profile_type ~= nil then
        local v809 = v803.profile_type:encode();
        local v810, v811 = v0.writeTag(v804, v805, 2, v0.wireTypes.lengthDelimited);
        v810, v811 = v0.writeBuffer(v810, v811, v809, buffer.len(v809));
        v804 = v810;
        v805 = v811;
    end;
    if v803.source ~= nil then
        local v812 = v803.source:encode();
        local v813, v814 = v0.writeTag(v804, v805, 3, v0.wireTypes.lengthDelimited);
        v813, v814 = v0.writeBuffer(v813, v814, v812, buffer.len(v812));
        v804 = v813;
        v805 = v814;
    end;
    local v815 = buffer.create(v805);
    buffer.copy(v815, 0, v804, 0, v805);
    return v815;
end;
v7.decode = function(v816) --[[ Line: 6690 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_34 (copy), v0 (copy), v5 (copy)
    local v817 = l_v7_34.new();
    local v818 = 0;
    while v818 < buffer.len(v816) do
        local v819 = nil;
        local v820 = nil;
        local v821, v822, v823 = v0.readTag(v816, v818);
        v819 = v821;
        v820 = v822;
        v818 = v823;
        if v820 == v0.wireTypes.varint then
            v821 = nil;
            v822, v823 = v0.readVarInt(v816, v818);
            v821 = v822;
            v818 = v823;
        elseif v820 == v0.wireTypes.lengthDelimited then
            if v819 == 1 then
                v821 = nil;
                v822, v823 = v0.readBuffer(v816, v818);
                v821 = v822;
                v818 = v823;
                v817.profile_id = v5.StringProp.decode(v821);
            elseif v819 == 2 then
                v821 = nil;
                v822, v823 = v0.readBuffer(v816, v818);
                v821 = v822;
                v818 = v823;
                v817.profile_type = v5.StringProp.decode(v821);
            elseif v819 == 3 then
                v821 = nil;
                v822, v823 = v0.readBuffer(v816, v818);
                v821 = v822;
                v818 = v823;
                v817.source = v5.StringProp.decode(v821);
            else
                v821 = nil;
                v822, v823 = v0.readVarInt(v816, v818);
                v818 = v823 + v822;
            end;
        elseif v820 == v0.wireTypes.i32 then
            v821 = nil;
            v822, v823 = v0.readFixed32(v816, v818);
            v821 = v822;
            v818 = v823;
        elseif v820 == v0.wireTypes.i64 then
            v821 = nil;
            v822, v823 = v0.readFixed64(v816, v818);
            v821 = v822;
            v818 = v823;
        else
            error("Unsupported wire type: " .. v820);
        end;
    end;
    return v817;
end;
v7.jsonEncode = function(v824) --[[ Line: 6743 ]] --[[ Name: jsonEncode ]]
    local v825 = {};
    if v824.profile_id ~= nil then
        v825.profileId = v824.profile_id:jsonEncode();
    end;
    if v824.profile_type ~= nil then
        v825.profileType = v824.profile_type:jsonEncode();
    end;
    if v824.source ~= nil then
        v825.source = v824.source:jsonEncode();
    end;
    return v825;
end;
v7.jsonDecode = function(v826) --[[ Line: 6761 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_34 (copy), v5 (copy)
    local v827 = l_v7_34.new();
    if v826.profile_id ~= nil then
        v827.profile_id = v5.StringProp.jsonDecode(v826.profile_id);
    end;
    if v826.profileId ~= nil then
        v827.profile_id = v5.StringProp.jsonDecode(v826.profileId);
    end;
    if v826.profile_type ~= nil then
        v827.profile_type = v5.StringProp.jsonDecode(v826.profile_type);
    end;
    if v826.profileType ~= nil then
        v827.profile_type = v5.StringProp.jsonDecode(v826.profileType);
    end;
    if v826.source ~= nil then
        v827.source = v5.StringProp.jsonDecode(v826.source);
    end;
    return v827;
end;
v7.descriptor = {
    name = "OpenProfileAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenProfileAction_Params = v7;
v1.default:register(v2.OpenProfileAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_35 = v7 --[[ copy: 7 -> 43 ]];
v7.new = function(v829) --[[ Line: 6803 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_35 (copy)
    return (setmetatable({
        action_type = if not (v829 ~= nil) or v829.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v829.action_type, 
        action_params = if not (v829 ~= nil) or v829.action_params == nil then nil else v829.action_params
    }, l_v7_35));
end;
v7.encode = function(v830) --[[ Line: 6814 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v831 = buffer.create(0);
    local v832 = 0;
    if v830.action_type ~= nil and (v830.action_type ~= nil and v830.action_type ~= 0 or v830.action_type ~= v2.ActionType.fromNumber(0)) then
        local v833, v834 = v0.writeTag(v831, v832, 1, v0.wireTypes.varint);
        v833, v834 = v0.writeVarInt(v833, v834, v2.ActionType.toNumber(v830.action_type));
        v831 = v833;
        v832 = v834;
    end;
    if v830.action_params ~= nil then
        local v835 = v830.action_params:encode();
        local v836, v837 = v0.writeTag(v831, v832, 2, v0.wireTypes.lengthDelimited);
        v836, v837 = v0.writeBuffer(v836, v837, v835, buffer.len(v835));
        v831 = v836;
        v832 = v837;
    end;
    local v838 = buffer.create(v832);
    buffer.copy(v838, 0, v831, 0, v832);
    return v838;
end;
v7.decode = function(v839) --[[ Line: 6840 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_35 (copy), v0 (copy), v2 (copy)
    local v840 = l_v7_35.new();
    local v841 = 0;
    while v841 < buffer.len(v839) do
        local v842 = nil;
        local v843 = nil;
        local v844, v845, v846 = v0.readTag(v839, v841);
        v842 = v844;
        v843 = v845;
        v841 = v846;
        if v843 == v0.wireTypes.varint then
            if v842 == 1 then
                v844 = nil;
                v845, v846 = v0.readVarIntI32(v839, v841);
                v844 = v845;
                v841 = v846;
                v840.action_type = v2.ActionType.fromNumber(v844) or v844;
            else
                v844 = nil;
                v845, v846 = v0.readVarInt(v839, v841);
                v844 = v845;
                v841 = v846;
            end;
        elseif v843 == v0.wireTypes.lengthDelimited then
            if v842 == 2 then
                v844 = nil;
                v845, v846 = v0.readBuffer(v839, v841);
                v844 = v845;
                v841 = v846;
                v840.action_params = v2.OpenFacialAgeEstimationAction_Params.decode(v844);
            else
                v844 = nil;
                v845, v846 = v0.readVarInt(v839, v841);
                v841 = v846 + v845;
            end;
        elseif v843 == v0.wireTypes.i32 then
            v844 = nil;
            v845, v846 = v0.readFixed32(v839, v841);
            v844 = v845;
            v841 = v846;
        elseif v843 == v0.wireTypes.i64 then
            v844 = nil;
            v845, v846 = v0.readFixed64(v839, v841);
            v844 = v845;
            v841 = v846;
        else
            error("Unsupported wire type: " .. v843);
        end;
    end;
    return v840;
end;
v7.jsonEncode = function(v847) --[[ Line: 6888 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v848 = {};
    if v847.action_type ~= nil and (v847.action_type ~= nil and v847.action_type ~= 0 or v847.action_type ~= v2.ActionType.fromNumber(0)) then
        v848.actionType = if typeof(v847.action_type) == "number" then v847.action_type else v2.ActionType.toNumber(v847.action_type);
    end;
    if v847.action_params ~= nil then
        v848.actionParams = v847.action_params:jsonEncode();
    end;
    return v848;
end;
v7.jsonDecode = function(v849) --[[ Line: 6910 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_35 (copy), v2 (copy)
    local v850 = l_v7_35.new();
    if v849.action_type ~= nil then
        v850.action_type = if typeof(v849.action_type) == "number" then v2.ActionType.fromNumber(v849.action_type) or v849.action_type else v2.ActionType.fromName(v849.action_type) or v849.action_type;
    end;
    if v849.actionType ~= nil then
        v850.action_type = if typeof(v849.actionType) == "number" then v2.ActionType.fromNumber(v849.actionType) or v849.actionType else v2.ActionType.fromName(v849.actionType) or v849.actionType;
    end;
    if v849.action_params ~= nil then
        v850.action_params = v2.OpenFacialAgeEstimationAction_Params.jsonDecode(v849.action_params);
    end;
    if v849.actionParams ~= nil then
        v850.action_params = v2.OpenFacialAgeEstimationAction_Params.jsonDecode(v849.actionParams);
    end;
    return v850;
end;
v7.descriptor = {
    name = "OpenFacialAgeEstimationAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenFacialAgeEstimationAction"
};
v2.OpenFacialAgeEstimationAction = v7;
v1.default:register(v2.OpenFacialAgeEstimationAction);
v7 = {};
v7.__index = v7;
local l_v7_36 = v7 --[[ copy: 7 -> 44 ]];
v7.new = function(v852) --[[ Line: 6950 ]] --[[ Name: new ]]
    -- upvalues: l_v7_36 (copy)
    return (setmetatable({
        user_id = if not (v852 ~= nil) or v852.user_id == nil then nil else v852.user_id, 
        source = if not (v852 ~= nil) or v852.source == nil then nil else v852.source
    }, l_v7_36));
end;
v7.encode = function(v853) --[[ Line: 6959 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v854 = buffer.create(0);
    local v855 = 0;
    if v853.user_id ~= nil then
        local v856 = v853.user_id:encode();
        local v857, v858 = v0.writeTag(v854, v855, 1, v0.wireTypes.lengthDelimited);
        v857, v858 = v0.writeBuffer(v857, v858, v856, buffer.len(v856));
        v854 = v857;
        v855 = v858;
    end;
    if v853.source ~= nil then
        local v859 = v853.source:encode();
        local v860, v861 = v0.writeTag(v854, v855, 2, v0.wireTypes.lengthDelimited);
        v860, v861 = v0.writeBuffer(v860, v861, v859, buffer.len(v859));
        v854 = v860;
        v855 = v861;
    end;
    local v862 = buffer.create(v855);
    buffer.copy(v862, 0, v854, 0, v855);
    return v862;
end;
v7.decode = function(v863) --[[ Line: 6980 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_36 (copy), v0 (copy), v5 (copy)
    local v864 = l_v7_36.new();
    local v865 = 0;
    while v865 < buffer.len(v863) do
        local v866 = nil;
        local v867 = nil;
        local v868, v869, v870 = v0.readTag(v863, v865);
        v866 = v868;
        v867 = v869;
        v865 = v870;
        if v867 == v0.wireTypes.varint then
            v868 = nil;
            v869, v870 = v0.readVarInt(v863, v865);
            v868 = v869;
            v865 = v870;
        elseif v867 == v0.wireTypes.lengthDelimited then
            if v866 == 1 then
                v868 = nil;
                v869, v870 = v0.readBuffer(v863, v865);
                v868 = v869;
                v865 = v870;
                v864.user_id = v5.StringProp.decode(v868);
            elseif v866 == 2 then
                v868 = nil;
                v869, v870 = v0.readBuffer(v863, v865);
                v868 = v869;
                v865 = v870;
                v864.source = v5.StringProp.decode(v868);
            else
                v868 = nil;
                v869, v870 = v0.readVarInt(v863, v865);
                v865 = v870 + v869;
            end;
        elseif v867 == v0.wireTypes.i32 then
            v868 = nil;
            v869, v870 = v0.readFixed32(v863, v865);
            v868 = v869;
            v865 = v870;
        elseif v867 == v0.wireTypes.i64 then
            v868 = nil;
            v869, v870 = v0.readFixed64(v863, v865);
            v868 = v869;
            v865 = v870;
        else
            error("Unsupported wire type: " .. v867);
        end;
    end;
    return v864;
end;
v7.jsonEncode = function(v871) --[[ Line: 7028 ]] --[[ Name: jsonEncode ]]
    local v872 = {};
    if v871.user_id ~= nil then
        v872.userId = v871.user_id:jsonEncode();
    end;
    if v871.source ~= nil then
        v872.source = v871.source:jsonEncode();
    end;
    return v872;
end;
v7.jsonDecode = function(v873) --[[ Line: 7042 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_36 (copy), v5 (copy)
    local v874 = l_v7_36.new();
    if v873.user_id ~= nil then
        v874.user_id = v5.StringProp.jsonDecode(v873.user_id);
    end;
    if v873.userId ~= nil then
        v874.user_id = v5.StringProp.jsonDecode(v873.userId);
    end;
    if v873.source ~= nil then
        v874.source = v5.StringProp.jsonDecode(v873.source);
    end;
    return v874;
end;
v7.descriptor = {
    name = "OpenFacialAgeEstimationAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenFacialAgeEstimationAction_Params = v7;
v1.default:register(v2.OpenFacialAgeEstimationAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_37 = v7 --[[ copy: 7 -> 45 ]];
v7.new = function(v876) --[[ Line: 7076 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_37 (copy)
    return (setmetatable({
        action_type = if not (v876 ~= nil) or v876.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v876.action_type, 
        action_params = if not (v876 ~= nil) or v876.action_params == nil then nil else v876.action_params
    }, l_v7_37));
end;
v7.encode = function(v877) --[[ Line: 7087 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v878 = buffer.create(0);
    local v879 = 0;
    if v877.action_type ~= nil and (v877.action_type ~= nil and v877.action_type ~= 0 or v877.action_type ~= v2.ActionType.fromNumber(0)) then
        local v880, v881 = v0.writeTag(v878, v879, 1, v0.wireTypes.varint);
        v880, v881 = v0.writeVarInt(v880, v881, v2.ActionType.toNumber(v877.action_type));
        v878 = v880;
        v879 = v881;
    end;
    if v877.action_params ~= nil then
        local v882 = v877.action_params:encode();
        local v883, v884 = v0.writeTag(v878, v879, 2, v0.wireTypes.lengthDelimited);
        v883, v884 = v0.writeBuffer(v883, v884, v882, buffer.len(v882));
        v878 = v883;
        v879 = v884;
    end;
    local v885 = buffer.create(v879);
    buffer.copy(v885, 0, v878, 0, v879);
    return v885;
end;
v7.decode = function(v886) --[[ Line: 7113 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_37 (copy), v0 (copy), v2 (copy)
    local v887 = l_v7_37.new();
    local v888 = 0;
    while v888 < buffer.len(v886) do
        local v889 = nil;
        local v890 = nil;
        local v891, v892, v893 = v0.readTag(v886, v888);
        v889 = v891;
        v890 = v892;
        v888 = v893;
        if v890 == v0.wireTypes.varint then
            if v889 == 1 then
                v891 = nil;
                v892, v893 = v0.readVarIntI32(v886, v888);
                v891 = v892;
                v888 = v893;
                v887.action_type = v2.ActionType.fromNumber(v891) or v891;
            else
                v891 = nil;
                v892, v893 = v0.readVarInt(v886, v888);
                v891 = v892;
                v888 = v893;
            end;
        elseif v890 == v0.wireTypes.lengthDelimited then
            if v889 == 2 then
                v891 = nil;
                v892, v893 = v0.readBuffer(v886, v888);
                v891 = v892;
                v888 = v893;
                v887.action_params = v2.OpenAddConnectionsPageAction_Params.decode(v891);
            else
                v891 = nil;
                v892, v893 = v0.readVarInt(v886, v888);
                v888 = v893 + v892;
            end;
        elseif v890 == v0.wireTypes.i32 then
            v891 = nil;
            v892, v893 = v0.readFixed32(v886, v888);
            v891 = v892;
            v888 = v893;
        elseif v890 == v0.wireTypes.i64 then
            v891 = nil;
            v892, v893 = v0.readFixed64(v886, v888);
            v891 = v892;
            v888 = v893;
        else
            error("Unsupported wire type: " .. v890);
        end;
    end;
    return v887;
end;
v7.jsonEncode = function(v894) --[[ Line: 7161 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v895 = {};
    if v894.action_type ~= nil and (v894.action_type ~= nil and v894.action_type ~= 0 or v894.action_type ~= v2.ActionType.fromNumber(0)) then
        v895.actionType = if typeof(v894.action_type) == "number" then v894.action_type else v2.ActionType.toNumber(v894.action_type);
    end;
    if v894.action_params ~= nil then
        v895.actionParams = v894.action_params:jsonEncode();
    end;
    return v895;
end;
v7.jsonDecode = function(v896) --[[ Line: 7183 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_37 (copy), v2 (copy)
    local v897 = l_v7_37.new();
    if v896.action_type ~= nil then
        v897.action_type = if typeof(v896.action_type) == "number" then v2.ActionType.fromNumber(v896.action_type) or v896.action_type else v2.ActionType.fromName(v896.action_type) or v896.action_type;
    end;
    if v896.actionType ~= nil then
        v897.action_type = if typeof(v896.actionType) == "number" then v2.ActionType.fromNumber(v896.actionType) or v896.actionType else v2.ActionType.fromName(v896.actionType) or v896.actionType;
    end;
    if v896.action_params ~= nil then
        v897.action_params = v2.OpenAddConnectionsPageAction_Params.jsonDecode(v896.action_params);
    end;
    if v896.actionParams ~= nil then
        v897.action_params = v2.OpenAddConnectionsPageAction_Params.jsonDecode(v896.actionParams);
    end;
    return v897;
end;
v7.descriptor = {
    name = "OpenAddConnectionsPageAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenAddConnectionsPageAction"
};
v2.OpenAddConnectionsPageAction = v7;
v1.default:register(v2.OpenAddConnectionsPageAction);
v7 = {};
v7.__index = v7;
local l_v7_38 = v7 --[[ copy: 7 -> 46 ]];
v7.new = function(v899) --[[ Line: 7223 ]] --[[ Name: new ]]
    -- upvalues: l_v7_38 (copy)
    return (setmetatable({
        user_id = if not (v899 ~= nil) or v899.user_id == nil then nil else v899.user_id, 
        source = if not (v899 ~= nil) or v899.source == nil then nil else v899.source
    }, l_v7_38));
end;
v7.encode = function(v900) --[[ Line: 7232 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v901 = buffer.create(0);
    local v902 = 0;
    if v900.user_id ~= nil then
        local v903 = v900.user_id:encode();
        local v904, v905 = v0.writeTag(v901, v902, 1, v0.wireTypes.lengthDelimited);
        v904, v905 = v0.writeBuffer(v904, v905, v903, buffer.len(v903));
        v901 = v904;
        v902 = v905;
    end;
    if v900.source ~= nil then
        local v906 = v900.source:encode();
        local v907, v908 = v0.writeTag(v901, v902, 2, v0.wireTypes.lengthDelimited);
        v907, v908 = v0.writeBuffer(v907, v908, v906, buffer.len(v906));
        v901 = v907;
        v902 = v908;
    end;
    local v909 = buffer.create(v902);
    buffer.copy(v909, 0, v901, 0, v902);
    return v909;
end;
v7.decode = function(v910) --[[ Line: 7253 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_38 (copy), v0 (copy), v5 (copy)
    local v911 = l_v7_38.new();
    local v912 = 0;
    while v912 < buffer.len(v910) do
        local v913 = nil;
        local v914 = nil;
        local v915, v916, v917 = v0.readTag(v910, v912);
        v913 = v915;
        v914 = v916;
        v912 = v917;
        if v914 == v0.wireTypes.varint then
            v915 = nil;
            v916, v917 = v0.readVarInt(v910, v912);
            v915 = v916;
            v912 = v917;
        elseif v914 == v0.wireTypes.lengthDelimited then
            if v913 == 1 then
                v915 = nil;
                v916, v917 = v0.readBuffer(v910, v912);
                v915 = v916;
                v912 = v917;
                v911.user_id = v5.StringProp.decode(v915);
            elseif v913 == 2 then
                v915 = nil;
                v916, v917 = v0.readBuffer(v910, v912);
                v915 = v916;
                v912 = v917;
                v911.source = v5.StringProp.decode(v915);
            else
                v915 = nil;
                v916, v917 = v0.readVarInt(v910, v912);
                v912 = v917 + v916;
            end;
        elseif v914 == v0.wireTypes.i32 then
            v915 = nil;
            v916, v917 = v0.readFixed32(v910, v912);
            v915 = v916;
            v912 = v917;
        elseif v914 == v0.wireTypes.i64 then
            v915 = nil;
            v916, v917 = v0.readFixed64(v910, v912);
            v915 = v916;
            v912 = v917;
        else
            error("Unsupported wire type: " .. v914);
        end;
    end;
    return v911;
end;
v7.jsonEncode = function(v918) --[[ Line: 7301 ]] --[[ Name: jsonEncode ]]
    local v919 = {};
    if v918.user_id ~= nil then
        v919.userId = v918.user_id:jsonEncode();
    end;
    if v918.source ~= nil then
        v919.source = v918.source:jsonEncode();
    end;
    return v919;
end;
v7.jsonDecode = function(v920) --[[ Line: 7315 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_38 (copy), v5 (copy)
    local v921 = l_v7_38.new();
    if v920.user_id ~= nil then
        v921.user_id = v5.StringProp.jsonDecode(v920.user_id);
    end;
    if v920.userId ~= nil then
        v921.user_id = v5.StringProp.jsonDecode(v920.userId);
    end;
    if v920.source ~= nil then
        v921.source = v5.StringProp.jsonDecode(v920.source);
    end;
    return v921;
end;
v7.descriptor = {
    name = "OpenAddConnectionsPageAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenAddConnectionsPageAction_Params = v7;
v1.default:register(v2.OpenAddConnectionsPageAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_39 = v7 --[[ copy: 7 -> 47 ]];
v7.new = function(v923) --[[ Line: 7349 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_39 (copy)
    return (setmetatable({
        action_type = if not (v923 ~= nil) or v923.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v923.action_type, 
        action_params = if not (v923 ~= nil) or v923.action_params == nil then nil else v923.action_params
    }, l_v7_39));
end;
v7.encode = function(v924) --[[ Line: 7358 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v925 = buffer.create(0);
    local v926 = 0;
    if v924.action_type ~= nil and (v924.action_type ~= nil and v924.action_type ~= 0 or v924.action_type ~= v2.ActionType.fromNumber(0)) then
        local v927, v928 = v0.writeTag(v925, v926, 1, v0.wireTypes.varint);
        v927, v928 = v0.writeVarInt(v927, v928, v2.ActionType.toNumber(v924.action_type));
        v925 = v927;
        v926 = v928;
    end;
    if v924.action_params ~= nil then
        local v929 = v924.action_params:encode();
        local v930, v931 = v0.writeTag(v925, v926, 2, v0.wireTypes.lengthDelimited);
        v930, v931 = v0.writeBuffer(v930, v931, v929, buffer.len(v929));
        v925 = v930;
        v926 = v931;
    end;
    local v932 = buffer.create(v926);
    buffer.copy(v932, 0, v925, 0, v926);
    return v932;
end;
v7.decode = function(v933) --[[ Line: 7384 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_39 (copy), v0 (copy), v2 (copy)
    local v934 = l_v7_39.new();
    local v935 = 0;
    while v935 < buffer.len(v933) do
        local v936 = nil;
        local v937 = nil;
        local v938, v939, v940 = v0.readTag(v933, v935);
        v936 = v938;
        v937 = v939;
        v935 = v940;
        if v937 == v0.wireTypes.varint then
            if v936 == 1 then
                v938 = nil;
                v939, v940 = v0.readVarIntI32(v933, v935);
                v938 = v939;
                v935 = v940;
                v934.action_type = v2.ActionType.fromNumber(v938) or v938;
            else
                v938 = nil;
                v939, v940 = v0.readVarInt(v933, v935);
                v938 = v939;
                v935 = v940;
            end;
        elseif v937 == v0.wireTypes.lengthDelimited then
            if v936 == 2 then
                v938 = nil;
                v939, v940 = v0.readBuffer(v933, v935);
                v938 = v939;
                v935 = v940;
                v934.action_params = v2.OpenMarketplaceAction_Params.decode(v938);
            else
                v938 = nil;
                v939, v940 = v0.readVarInt(v933, v935);
                v935 = v940 + v939;
            end;
        elseif v937 == v0.wireTypes.i32 then
            v938 = nil;
            v939, v940 = v0.readFixed32(v933, v935);
            v938 = v939;
            v935 = v940;
        elseif v937 == v0.wireTypes.i64 then
            v938 = nil;
            v939, v940 = v0.readFixed64(v933, v935);
            v938 = v939;
            v935 = v940;
        else
            error("Unsupported wire type: " .. v937);
        end;
    end;
    return v934;
end;
v7.jsonEncode = function(v941) --[[ Line: 7432 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v942 = {};
    if v941.action_type ~= nil and (v941.action_type ~= nil and v941.action_type ~= 0 or v941.action_type ~= v2.ActionType.fromNumber(0)) then
        v942.actionType = if typeof(v941.action_type) == "number" then v941.action_type else v2.ActionType.toNumber(v941.action_type);
    end;
    if v941.action_params ~= nil then
        v942.actionParams = v941.action_params:jsonEncode();
    end;
    return v942;
end;
v7.jsonDecode = function(v943) --[[ Line: 7454 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_39 (copy), v2 (copy)
    local v944 = l_v7_39.new();
    if v943.action_type ~= nil then
        v944.action_type = if typeof(v943.action_type) == "number" then v2.ActionType.fromNumber(v943.action_type) or v943.action_type else v2.ActionType.fromName(v943.action_type) or v943.action_type;
    end;
    if v943.actionType ~= nil then
        v944.action_type = if typeof(v943.actionType) == "number" then v2.ActionType.fromNumber(v943.actionType) or v943.actionType else v2.ActionType.fromName(v943.actionType) or v943.actionType;
    end;
    if v943.action_params ~= nil then
        v944.action_params = v2.OpenMarketplaceAction_Params.jsonDecode(v943.action_params);
    end;
    if v943.actionParams ~= nil then
        v944.action_params = v2.OpenMarketplaceAction_Params.jsonDecode(v943.actionParams);
    end;
    return v944;
end;
v7.descriptor = {
    name = "OpenMarketplaceAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceAction"
};
v2.OpenMarketplaceAction = v7;
v1.default:register(v2.OpenMarketplaceAction);
v7 = {};
v7.__index = v7;
local l_v7_40 = v7 --[[ copy: 7 -> 48 ]];
v7.new = function(v946) --[[ Line: 7494 ]] --[[ Name: new ]]
    -- upvalues: l_v7_40 (copy)
    return (setmetatable({
        user_id = if not (v946 ~= nil) or v946.user_id == nil then nil else v946.user_id, 
        source = if not (v946 ~= nil) or v946.source == nil then nil else v946.source
    }, l_v7_40));
end;
v7.encode = function(v947) --[[ Line: 7503 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v948 = buffer.create(0);
    local v949 = 0;
    if v947.user_id ~= nil then
        local v950 = v947.user_id:encode();
        local v951, v952 = v0.writeTag(v948, v949, 1, v0.wireTypes.lengthDelimited);
        v951, v952 = v0.writeBuffer(v951, v952, v950, buffer.len(v950));
        v948 = v951;
        v949 = v952;
    end;
    if v947.source ~= nil then
        local v953 = v947.source:encode();
        local v954, v955 = v0.writeTag(v948, v949, 2, v0.wireTypes.lengthDelimited);
        v954, v955 = v0.writeBuffer(v954, v955, v953, buffer.len(v953));
        v948 = v954;
        v949 = v955;
    end;
    local v956 = buffer.create(v949);
    buffer.copy(v956, 0, v948, 0, v949);
    return v956;
end;
v7.decode = function(v957) --[[ Line: 7524 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_40 (copy), v0 (copy), v5 (copy)
    local v958 = l_v7_40.new();
    local v959 = 0;
    while v959 < buffer.len(v957) do
        local v960 = nil;
        local v961 = nil;
        local v962, v963, v964 = v0.readTag(v957, v959);
        v960 = v962;
        v961 = v963;
        v959 = v964;
        if v961 == v0.wireTypes.varint then
            v962 = nil;
            v963, v964 = v0.readVarInt(v957, v959);
            v962 = v963;
            v959 = v964;
        elseif v961 == v0.wireTypes.lengthDelimited then
            if v960 == 1 then
                v962 = nil;
                v963, v964 = v0.readBuffer(v957, v959);
                v962 = v963;
                v959 = v964;
                v958.user_id = v5.StringProp.decode(v962);
            elseif v960 == 2 then
                v962 = nil;
                v963, v964 = v0.readBuffer(v957, v959);
                v962 = v963;
                v959 = v964;
                v958.source = v5.StringProp.decode(v962);
            else
                v962 = nil;
                v963, v964 = v0.readVarInt(v957, v959);
                v959 = v964 + v963;
            end;
        elseif v961 == v0.wireTypes.i32 then
            v962 = nil;
            v963, v964 = v0.readFixed32(v957, v959);
            v962 = v963;
            v959 = v964;
        elseif v961 == v0.wireTypes.i64 then
            v962 = nil;
            v963, v964 = v0.readFixed64(v957, v959);
            v962 = v963;
            v959 = v964;
        else
            error("Unsupported wire type: " .. v961);
        end;
    end;
    return v958;
end;
v7.jsonEncode = function(v965) --[[ Line: 7572 ]] --[[ Name: jsonEncode ]]
    local v966 = {};
    if v965.user_id ~= nil then
        v966.userId = v965.user_id:jsonEncode();
    end;
    if v965.source ~= nil then
        v966.source = v965.source:jsonEncode();
    end;
    return v966;
end;
v7.jsonDecode = function(v967) --[[ Line: 7586 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_40 (copy), v5 (copy)
    local v968 = l_v7_40.new();
    if v967.user_id ~= nil then
        v968.user_id = v5.StringProp.jsonDecode(v967.user_id);
    end;
    if v967.userId ~= nil then
        v968.user_id = v5.StringProp.jsonDecode(v967.userId);
    end;
    if v967.source ~= nil then
        v968.source = v5.StringProp.jsonDecode(v967.source);
    end;
    return v968;
end;
v7.descriptor = {
    name = "OpenMarketplaceAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenMarketplaceAction_Params = v7;
v1.default:register(v2.OpenMarketplaceAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_41 = v7 --[[ copy: 7 -> 49 ]];
v7.new = function(v970) --[[ Line: 7618 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_41 (copy)
    return (setmetatable({
        action_type = if not (v970 ~= nil) or v970.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v970.action_type, 
        action_params = if not (v970 ~= nil) or v970.action_params == nil then nil else v970.action_params
    }, l_v7_41));
end;
v7.encode = function(v971) --[[ Line: 7629 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v972 = buffer.create(0);
    local v973 = 0;
    if v971.action_type ~= nil and (v971.action_type ~= nil and v971.action_type ~= 0 or v971.action_type ~= v2.ActionType.fromNumber(0)) then
        local v974, v975 = v0.writeTag(v972, v973, 1, v0.wireTypes.varint);
        v974, v975 = v0.writeVarInt(v974, v975, v2.ActionType.toNumber(v971.action_type));
        v972 = v974;
        v973 = v975;
    end;
    if v971.action_params ~= nil then
        local v976 = v971.action_params:encode();
        local v977, v978 = v0.writeTag(v972, v973, 2, v0.wireTypes.lengthDelimited);
        v977, v978 = v0.writeBuffer(v977, v978, v976, buffer.len(v976));
        v972 = v977;
        v973 = v978;
    end;
    local v979 = buffer.create(v973);
    buffer.copy(v979, 0, v972, 0, v973);
    return v979;
end;
v7.decode = function(v980) --[[ Line: 7655 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_41 (copy), v0 (copy), v2 (copy)
    local v981 = l_v7_41.new();
    local v982 = 0;
    while v982 < buffer.len(v980) do
        local v983 = nil;
        local v984 = nil;
        local v985, v986, v987 = v0.readTag(v980, v982);
        v983 = v985;
        v984 = v986;
        v982 = v987;
        if v984 == v0.wireTypes.varint then
            if v983 == 1 then
                v985 = nil;
                v986, v987 = v0.readVarIntI32(v980, v982);
                v985 = v986;
                v982 = v987;
                v981.action_type = v2.ActionType.fromNumber(v985) or v985;
            else
                v985 = nil;
                v986, v987 = v0.readVarInt(v980, v982);
                v985 = v986;
                v982 = v987;
            end;
        elseif v984 == v0.wireTypes.lengthDelimited then
            if v983 == 2 then
                v985 = nil;
                v986, v987 = v0.readBuffer(v980, v982);
                v985 = v986;
                v982 = v987;
                v981.action_params = v2.HideProfileCompletionAction_Params.decode(v985);
            else
                v985 = nil;
                v986, v987 = v0.readVarInt(v980, v982);
                v982 = v987 + v986;
            end;
        elseif v984 == v0.wireTypes.i32 then
            v985 = nil;
            v986, v987 = v0.readFixed32(v980, v982);
            v985 = v986;
            v982 = v987;
        elseif v984 == v0.wireTypes.i64 then
            v985 = nil;
            v986, v987 = v0.readFixed64(v980, v982);
            v985 = v986;
            v982 = v987;
        else
            error("Unsupported wire type: " .. v984);
        end;
    end;
    return v981;
end;
v7.jsonEncode = function(v988) --[[ Line: 7703 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v989 = {};
    if v988.action_type ~= nil and (v988.action_type ~= nil and v988.action_type ~= 0 or v988.action_type ~= v2.ActionType.fromNumber(0)) then
        v989.actionType = if typeof(v988.action_type) == "number" then v988.action_type else v2.ActionType.toNumber(v988.action_type);
    end;
    if v988.action_params ~= nil then
        v989.actionParams = v988.action_params:jsonEncode();
    end;
    return v989;
end;
v7.jsonDecode = function(v990) --[[ Line: 7725 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_41 (copy), v2 (copy)
    local v991 = l_v7_41.new();
    if v990.action_type ~= nil then
        v991.action_type = if typeof(v990.action_type) == "number" then v2.ActionType.fromNumber(v990.action_type) or v990.action_type else v2.ActionType.fromName(v990.action_type) or v990.action_type;
    end;
    if v990.actionType ~= nil then
        v991.action_type = if typeof(v990.actionType) == "number" then v2.ActionType.fromNumber(v990.actionType) or v990.actionType else v2.ActionType.fromName(v990.actionType) or v990.actionType;
    end;
    if v990.action_params ~= nil then
        v991.action_params = v2.HideProfileCompletionAction_Params.jsonDecode(v990.action_params);
    end;
    if v990.actionParams ~= nil then
        v991.action_params = v2.HideProfileCompletionAction_Params.jsonDecode(v990.actionParams);
    end;
    return v991;
end;
v7.descriptor = {
    name = "HideProfileCompletionAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.HideProfileCompletionAction"
};
v2.HideProfileCompletionAction = v7;
v1.default:register(v2.HideProfileCompletionAction);
v7 = {};
v7.__index = v7;
local l_v7_42 = v7 --[[ copy: 7 -> 50 ]];
v7.new = function(v993) --[[ Line: 7765 ]] --[[ Name: new ]]
    -- upvalues: l_v7_42 (copy)
    return (setmetatable({
        user_id = if not (v993 ~= nil) or v993.user_id == nil then nil else v993.user_id, 
        prompt_id = if not (v993 ~= nil) or v993.prompt_id == nil then nil else v993.prompt_id, 
        source = if not (v993 ~= nil) or v993.source == nil then nil else v993.source, 
        prompt_type = if not (v993 ~= nil) or v993.prompt_type == nil then nil else v993.prompt_type
    }, l_v7_42));
end;
v7.encode = function(v994) --[[ Line: 7776 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v995 = buffer.create(0);
    local v996 = 0;
    if v994.user_id ~= nil then
        local v997 = v994.user_id:encode();
        local v998, v999 = v0.writeTag(v995, v996, 1, v0.wireTypes.lengthDelimited);
        v998, v999 = v0.writeBuffer(v998, v999, v997, buffer.len(v997));
        v995 = v998;
        v996 = v999;
    end;
    if v994.prompt_id ~= nil then
        local v1000 = v994.prompt_id:encode();
        local v1001, v1002 = v0.writeTag(v995, v996, 2, v0.wireTypes.lengthDelimited);
        v1001, v1002 = v0.writeBuffer(v1001, v1002, v1000, buffer.len(v1000));
        v995 = v1001;
        v996 = v1002;
    end;
    if v994.source ~= nil then
        local v1003 = v994.source:encode();
        local v1004, v1005 = v0.writeTag(v995, v996, 3, v0.wireTypes.lengthDelimited);
        v1004, v1005 = v0.writeBuffer(v1004, v1005, v1003, buffer.len(v1003));
        v995 = v1004;
        v996 = v1005;
    end;
    if v994.prompt_type ~= nil then
        local v1006 = v994.prompt_type:encode();
        local v1007, v1008 = v0.writeTag(v995, v996, 4, v0.wireTypes.lengthDelimited);
        v1007, v1008 = v0.writeBuffer(v1007, v1008, v1006, buffer.len(v1006));
        v995 = v1007;
        v996 = v1008;
    end;
    local v1009 = buffer.create(v996);
    buffer.copy(v1009, 0, v995, 0, v996);
    return v1009;
end;
v7.decode = function(v1010) --[[ Line: 7809 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_42 (copy), v0 (copy), v5 (copy)
    local v1011 = l_v7_42.new();
    local v1012 = 0;
    while v1012 < buffer.len(v1010) do
        local v1013 = nil;
        local v1014 = nil;
        local v1015, v1016, v1017 = v0.readTag(v1010, v1012);
        v1013 = v1015;
        v1014 = v1016;
        v1012 = v1017;
        if v1014 == v0.wireTypes.varint then
            v1015 = nil;
            v1016, v1017 = v0.readVarInt(v1010, v1012);
            v1015 = v1016;
            v1012 = v1017;
        elseif v1014 == v0.wireTypes.lengthDelimited then
            if v1013 == 1 then
                v1015 = nil;
                v1016, v1017 = v0.readBuffer(v1010, v1012);
                v1015 = v1016;
                v1012 = v1017;
                v1011.user_id = v5.StringProp.decode(v1015);
            elseif v1013 == 2 then
                v1015 = nil;
                v1016, v1017 = v0.readBuffer(v1010, v1012);
                v1015 = v1016;
                v1012 = v1017;
                v1011.prompt_id = v5.StringProp.decode(v1015);
            elseif v1013 == 3 then
                v1015 = nil;
                v1016, v1017 = v0.readBuffer(v1010, v1012);
                v1015 = v1016;
                v1012 = v1017;
                v1011.source = v5.StringProp.decode(v1015);
            elseif v1013 == 4 then
                v1015 = nil;
                v1016, v1017 = v0.readBuffer(v1010, v1012);
                v1015 = v1016;
                v1012 = v1017;
                v1011.prompt_type = v5.StringProp.decode(v1015);
            else
                v1015 = nil;
                v1016, v1017 = v0.readVarInt(v1010, v1012);
                v1012 = v1017 + v1016;
            end;
        elseif v1014 == v0.wireTypes.i32 then
            v1015 = nil;
            v1016, v1017 = v0.readFixed32(v1010, v1012);
            v1015 = v1016;
            v1012 = v1017;
        elseif v1014 == v0.wireTypes.i64 then
            v1015 = nil;
            v1016, v1017 = v0.readFixed64(v1010, v1012);
            v1015 = v1016;
            v1012 = v1017;
        else
            error("Unsupported wire type: " .. v1014);
        end;
    end;
    return v1011;
end;
v7.jsonEncode = function(v1018) --[[ Line: 7867 ]] --[[ Name: jsonEncode ]]
    local v1019 = {};
    if v1018.user_id ~= nil then
        v1019.userId = v1018.user_id:jsonEncode();
    end;
    if v1018.prompt_id ~= nil then
        v1019.promptId = v1018.prompt_id:jsonEncode();
    end;
    if v1018.source ~= nil then
        v1019.source = v1018.source:jsonEncode();
    end;
    if v1018.prompt_type ~= nil then
        v1019.promptType = v1018.prompt_type:jsonEncode();
    end;
    return v1019;
end;
v7.jsonDecode = function(v1020) --[[ Line: 7889 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_42 (copy), v5 (copy)
    local v1021 = l_v7_42.new();
    if v1020.user_id ~= nil then
        v1021.user_id = v5.StringProp.jsonDecode(v1020.user_id);
    end;
    if v1020.userId ~= nil then
        v1021.user_id = v5.StringProp.jsonDecode(v1020.userId);
    end;
    if v1020.prompt_id ~= nil then
        v1021.prompt_id = v5.StringProp.jsonDecode(v1020.prompt_id);
    end;
    if v1020.promptId ~= nil then
        v1021.prompt_id = v5.StringProp.jsonDecode(v1020.promptId);
    end;
    if v1020.source ~= nil then
        v1021.source = v5.StringProp.jsonDecode(v1020.source);
    end;
    if v1020.prompt_type ~= nil then
        v1021.prompt_type = v5.StringProp.jsonDecode(v1020.prompt_type);
    end;
    if v1020.promptType ~= nil then
        v1021.prompt_type = v5.StringProp.jsonDecode(v1020.promptType);
    end;
    return v1021;
end;
v7.descriptor = {
    name = "HideProfileCompletionAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.HideProfileCompletionAction_Params = v7;
v1.default:register(v2.HideProfileCompletionAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_43 = v7 --[[ copy: 7 -> 51 ]];
v7.new = function(v1023) --[[ Line: 7940 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_43 (copy)
    return (setmetatable({
        action_type = if not (v1023 ~= nil) or v1023.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1023.action_type, 
        action_params = if not (v1023 ~= nil) or v1023.action_params == nil then nil else v1023.action_params
    }, l_v7_43));
end;
v7.encode = function(v1024) --[[ Line: 7951 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1025 = buffer.create(0);
    local v1026 = 0;
    if v1024.action_type ~= nil and (v1024.action_type ~= nil and v1024.action_type ~= 0 or v1024.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1027, v1028 = v0.writeTag(v1025, v1026, 1, v0.wireTypes.varint);
        v1027, v1028 = v0.writeVarInt(v1027, v1028, v2.ActionType.toNumber(v1024.action_type));
        v1025 = v1027;
        v1026 = v1028;
    end;
    if v1024.action_params ~= nil then
        local v1029 = v1024.action_params:encode();
        local v1030, v1031 = v0.writeTag(v1025, v1026, 2, v0.wireTypes.lengthDelimited);
        v1030, v1031 = v0.writeBuffer(v1030, v1031, v1029, buffer.len(v1029));
        v1025 = v1030;
        v1026 = v1031;
    end;
    local v1032 = buffer.create(v1026);
    buffer.copy(v1032, 0, v1025, 0, v1026);
    return v1032;
end;
v7.decode = function(v1033) --[[ Line: 7977 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_43 (copy), v0 (copy), v2 (copy)
    local v1034 = l_v7_43.new();
    local v1035 = 0;
    while v1035 < buffer.len(v1033) do
        local v1036 = nil;
        local v1037 = nil;
        local v1038, v1039, v1040 = v0.readTag(v1033, v1035);
        v1036 = v1038;
        v1037 = v1039;
        v1035 = v1040;
        if v1037 == v0.wireTypes.varint then
            if v1036 == 1 then
                v1038 = nil;
                v1039, v1040 = v0.readVarIntI32(v1033, v1035);
                v1038 = v1039;
                v1035 = v1040;
                v1034.action_type = v2.ActionType.fromNumber(v1038) or v1038;
            else
                v1038 = nil;
                v1039, v1040 = v0.readVarInt(v1033, v1035);
                v1038 = v1039;
                v1035 = v1040;
            end;
        elseif v1037 == v0.wireTypes.lengthDelimited then
            if v1036 == 2 then
                v1038 = nil;
                v1039, v1040 = v0.readBuffer(v1033, v1035);
                v1038 = v1039;
                v1035 = v1040;
                v1034.action_params = v2.SelectMarketplaceCatalogCategory_Params.decode(v1038);
            else
                v1038 = nil;
                v1039, v1040 = v0.readVarInt(v1033, v1035);
                v1035 = v1040 + v1039;
            end;
        elseif v1037 == v0.wireTypes.i32 then
            v1038 = nil;
            v1039, v1040 = v0.readFixed32(v1033, v1035);
            v1038 = v1039;
            v1035 = v1040;
        elseif v1037 == v0.wireTypes.i64 then
            v1038 = nil;
            v1039, v1040 = v0.readFixed64(v1033, v1035);
            v1038 = v1039;
            v1035 = v1040;
        else
            error("Unsupported wire type: " .. v1037);
        end;
    end;
    return v1034;
end;
v7.jsonEncode = function(v1041) --[[ Line: 8025 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1042 = {};
    if v1041.action_type ~= nil and (v1041.action_type ~= nil and v1041.action_type ~= 0 or v1041.action_type ~= v2.ActionType.fromNumber(0)) then
        v1042.actionType = if typeof(v1041.action_type) == "number" then v1041.action_type else v2.ActionType.toNumber(v1041.action_type);
    end;
    if v1041.action_params ~= nil then
        v1042.actionParams = v1041.action_params:jsonEncode();
    end;
    return v1042;
end;
v7.jsonDecode = function(v1043) --[[ Line: 8047 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_43 (copy), v2 (copy)
    local v1044 = l_v7_43.new();
    if v1043.action_type ~= nil then
        v1044.action_type = if typeof(v1043.action_type) == "number" then v2.ActionType.fromNumber(v1043.action_type) or v1043.action_type else v2.ActionType.fromName(v1043.action_type) or v1043.action_type;
    end;
    if v1043.actionType ~= nil then
        v1044.action_type = if typeof(v1043.actionType) == "number" then v2.ActionType.fromNumber(v1043.actionType) or v1043.actionType else v2.ActionType.fromName(v1043.actionType) or v1043.actionType;
    end;
    if v1043.action_params ~= nil then
        v1044.action_params = v2.SelectMarketplaceCatalogCategory_Params.jsonDecode(v1043.action_params);
    end;
    if v1043.actionParams ~= nil then
        v1044.action_params = v2.SelectMarketplaceCatalogCategory_Params.jsonDecode(v1043.actionParams);
    end;
    return v1044;
end;
v7.descriptor = {
    name = "SelectMarketplaceCatalogCategory", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceCatalogCategory"
};
v2.SelectMarketplaceCatalogCategory = v7;
v1.default:register(v2.SelectMarketplaceCatalogCategory);
v7 = {};
v7.__index = v7;
local l_v7_44 = v7 --[[ copy: 7 -> 52 ]];
v7.new = function(v1046) --[[ Line: 8089 ]] --[[ Name: new ]]
    -- upvalues: l_v7_44 (copy)
    return (setmetatable({
        category_id = if not (v1046 ~= nil) or v1046.category_id == nil then nil else v1046.category_id
    }, l_v7_44));
end;
v7.encode = function(v1047) --[[ Line: 8097 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1048 = buffer.create(0);
    local v1049 = 0;
    if v1047.category_id ~= nil then
        local v1050 = v1047.category_id:encode();
        local v1051, v1052 = v0.writeTag(v1048, v1049, 1, v0.wireTypes.lengthDelimited);
        v1051, v1052 = v0.writeBuffer(v1051, v1052, v1050, buffer.len(v1050));
        v1048 = v1051;
        v1049 = v1052;
    end;
    local v1053 = buffer.create(v1049);
    buffer.copy(v1053, 0, v1048, 0, v1049);
    return v1053;
end;
v7.decode = function(v1054) --[[ Line: 8112 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_44 (copy), v0 (copy), v5 (copy)
    local v1055 = l_v7_44.new();
    local v1056 = 0;
    while v1056 < buffer.len(v1054) do
        local v1057 = nil;
        local v1058 = nil;
        local v1059, v1060, v1061 = v0.readTag(v1054, v1056);
        v1057 = v1059;
        v1058 = v1060;
        v1056 = v1061;
        if v1058 == v0.wireTypes.varint then
            v1059 = nil;
            v1060, v1061 = v0.readVarInt(v1054, v1056);
            v1059 = v1060;
            v1056 = v1061;
        elseif v1058 == v0.wireTypes.lengthDelimited then
            if v1057 == 1 then
                v1059 = nil;
                v1060, v1061 = v0.readBuffer(v1054, v1056);
                v1059 = v1060;
                v1056 = v1061;
                v1055.category_id = v5.StringProp.decode(v1059);
            else
                v1059 = nil;
                v1060, v1061 = v0.readVarInt(v1054, v1056);
                v1056 = v1061 + v1060;
            end;
        elseif v1058 == v0.wireTypes.i32 then
            v1059 = nil;
            v1060, v1061 = v0.readFixed32(v1054, v1056);
            v1059 = v1060;
            v1056 = v1061;
        elseif v1058 == v0.wireTypes.i64 then
            v1059 = nil;
            v1060, v1061 = v0.readFixed64(v1054, v1056);
            v1059 = v1060;
            v1056 = v1061;
        else
            error("Unsupported wire type: " .. v1058);
        end;
    end;
    return v1055;
end;
v7.jsonEncode = function(v1062) --[[ Line: 8155 ]] --[[ Name: jsonEncode ]]
    local v1063 = {};
    if v1062.category_id ~= nil then
        v1063.categoryId = v1062.category_id:jsonEncode();
    end;
    return v1063;
end;
v7.jsonDecode = function(v1064) --[[ Line: 8165 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_44 (copy), v5 (copy)
    local v1065 = l_v7_44.new();
    if v1064.category_id ~= nil then
        v1065.category_id = v5.StringProp.jsonDecode(v1064.category_id);
    end;
    if v1064.categoryId ~= nil then
        v1065.category_id = v5.StringProp.jsonDecode(v1064.categoryId);
    end;
    return v1065;
end;
v7.descriptor = {
    name = "SelectMarketplaceCatalogCategory_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.SelectMarketplaceCatalogCategory_Params = v7;
v1.default:register(v2.SelectMarketplaceCatalogCategory_Params);
v7 = {};
v7.__index = v7;
local l_v7_45 = v7 --[[ copy: 7 -> 53 ]];
v7.new = function(v1067) --[[ Line: 8196 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_45 (copy)
    return (setmetatable({
        action_type = if not (v1067 ~= nil) or v1067.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1067.action_type, 
        action_params = if not (v1067 ~= nil) or v1067.action_params == nil then nil else v1067.action_params
    }, l_v7_45));
end;
v7.encode = function(v1068) --[[ Line: 8207 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1069 = buffer.create(0);
    local v1070 = 0;
    if v1068.action_type ~= nil and (v1068.action_type ~= nil and v1068.action_type ~= 0 or v1068.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1071, v1072 = v0.writeTag(v1069, v1070, 1, v0.wireTypes.varint);
        v1071, v1072 = v0.writeVarInt(v1071, v1072, v2.ActionType.toNumber(v1068.action_type));
        v1069 = v1071;
        v1070 = v1072;
    end;
    if v1068.action_params ~= nil then
        local v1073 = v1068.action_params:encode();
        local v1074, v1075 = v0.writeTag(v1069, v1070, 2, v0.wireTypes.lengthDelimited);
        v1074, v1075 = v0.writeBuffer(v1074, v1075, v1073, buffer.len(v1073));
        v1069 = v1074;
        v1070 = v1075;
    end;
    local v1076 = buffer.create(v1070);
    buffer.copy(v1076, 0, v1069, 0, v1070);
    return v1076;
end;
v7.decode = function(v1077) --[[ Line: 8233 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_45 (copy), v0 (copy), v2 (copy)
    local v1078 = l_v7_45.new();
    local v1079 = 0;
    while v1079 < buffer.len(v1077) do
        local v1080 = nil;
        local v1081 = nil;
        local v1082, v1083, v1084 = v0.readTag(v1077, v1079);
        v1080 = v1082;
        v1081 = v1083;
        v1079 = v1084;
        if v1081 == v0.wireTypes.varint then
            if v1080 == 1 then
                v1082 = nil;
                v1083, v1084 = v0.readVarIntI32(v1077, v1079);
                v1082 = v1083;
                v1079 = v1084;
                v1078.action_type = v2.ActionType.fromNumber(v1082) or v1082;
            else
                v1082 = nil;
                v1083, v1084 = v0.readVarInt(v1077, v1079);
                v1082 = v1083;
                v1079 = v1084;
            end;
        elseif v1081 == v0.wireTypes.lengthDelimited then
            if v1080 == 2 then
                v1082 = nil;
                v1083, v1084 = v0.readBuffer(v1077, v1079);
                v1082 = v1083;
                v1079 = v1084;
                v1078.action_params = v2.SelectMarketplaceCatalogSubcategory_Params.decode(v1082);
            else
                v1082 = nil;
                v1083, v1084 = v0.readVarInt(v1077, v1079);
                v1079 = v1084 + v1083;
            end;
        elseif v1081 == v0.wireTypes.i32 then
            v1082 = nil;
            v1083, v1084 = v0.readFixed32(v1077, v1079);
            v1082 = v1083;
            v1079 = v1084;
        elseif v1081 == v0.wireTypes.i64 then
            v1082 = nil;
            v1083, v1084 = v0.readFixed64(v1077, v1079);
            v1082 = v1083;
            v1079 = v1084;
        else
            error("Unsupported wire type: " .. v1081);
        end;
    end;
    return v1078;
end;
v7.jsonEncode = function(v1085) --[[ Line: 8281 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1086 = {};
    if v1085.action_type ~= nil and (v1085.action_type ~= nil and v1085.action_type ~= 0 or v1085.action_type ~= v2.ActionType.fromNumber(0)) then
        v1086.actionType = if typeof(v1085.action_type) == "number" then v1085.action_type else v2.ActionType.toNumber(v1085.action_type);
    end;
    if v1085.action_params ~= nil then
        v1086.actionParams = v1085.action_params:jsonEncode();
    end;
    return v1086;
end;
v7.jsonDecode = function(v1087) --[[ Line: 8303 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_45 (copy), v2 (copy)
    local v1088 = l_v7_45.new();
    if v1087.action_type ~= nil then
        v1088.action_type = if typeof(v1087.action_type) == "number" then v2.ActionType.fromNumber(v1087.action_type) or v1087.action_type else v2.ActionType.fromName(v1087.action_type) or v1087.action_type;
    end;
    if v1087.actionType ~= nil then
        v1088.action_type = if typeof(v1087.actionType) == "number" then v2.ActionType.fromNumber(v1087.actionType) or v1087.actionType else v2.ActionType.fromName(v1087.actionType) or v1087.actionType;
    end;
    if v1087.action_params ~= nil then
        v1088.action_params = v2.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(v1087.action_params);
    end;
    if v1087.actionParams ~= nil then
        v1088.action_params = v2.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(v1087.actionParams);
    end;
    return v1088;
end;
v7.descriptor = {
    name = "SelectMarketplaceCatalogSubcategory", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceCatalogSubcategory"
};
v2.SelectMarketplaceCatalogSubcategory = v7;
v1.default:register(v2.SelectMarketplaceCatalogSubcategory);
v7 = {};
v7.__index = v7;
local l_v7_46 = v7 --[[ copy: 7 -> 54 ]];
v7.new = function(v1090) --[[ Line: 8345 ]] --[[ Name: new ]]
    -- upvalues: l_v7_46 (copy)
    return (setmetatable({
        subcategory_id = if not (v1090 ~= nil) or v1090.subcategory_id == nil then nil else v1090.subcategory_id
    }, l_v7_46));
end;
v7.encode = function(v1091) --[[ Line: 8353 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1092 = buffer.create(0);
    local v1093 = 0;
    if v1091.subcategory_id ~= nil then
        local v1094 = v1091.subcategory_id:encode();
        local v1095, v1096 = v0.writeTag(v1092, v1093, 1, v0.wireTypes.lengthDelimited);
        v1095, v1096 = v0.writeBuffer(v1095, v1096, v1094, buffer.len(v1094));
        v1092 = v1095;
        v1093 = v1096;
    end;
    local v1097 = buffer.create(v1093);
    buffer.copy(v1097, 0, v1092, 0, v1093);
    return v1097;
end;
v7.decode = function(v1098) --[[ Line: 8370 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_46 (copy), v0 (copy), v5 (copy)
    local v1099 = l_v7_46.new();
    local v1100 = 0;
    while v1100 < buffer.len(v1098) do
        local v1101 = nil;
        local v1102 = nil;
        local v1103, v1104, v1105 = v0.readTag(v1098, v1100);
        v1101 = v1103;
        v1102 = v1104;
        v1100 = v1105;
        if v1102 == v0.wireTypes.varint then
            v1103 = nil;
            v1104, v1105 = v0.readVarInt(v1098, v1100);
            v1103 = v1104;
            v1100 = v1105;
        elseif v1102 == v0.wireTypes.lengthDelimited then
            if v1101 == 1 then
                v1103 = nil;
                v1104, v1105 = v0.readBuffer(v1098, v1100);
                v1103 = v1104;
                v1100 = v1105;
                v1099.subcategory_id = v5.StringProp.decode(v1103);
            else
                v1103 = nil;
                v1104, v1105 = v0.readVarInt(v1098, v1100);
                v1100 = v1105 + v1104;
            end;
        elseif v1102 == v0.wireTypes.i32 then
            v1103 = nil;
            v1104, v1105 = v0.readFixed32(v1098, v1100);
            v1103 = v1104;
            v1100 = v1105;
        elseif v1102 == v0.wireTypes.i64 then
            v1103 = nil;
            v1104, v1105 = v0.readFixed64(v1098, v1100);
            v1103 = v1104;
            v1100 = v1105;
        else
            error("Unsupported wire type: " .. v1102);
        end;
    end;
    return v1099;
end;
v7.jsonEncode = function(v1106) --[[ Line: 8415 ]] --[[ Name: jsonEncode ]]
    local v1107 = {};
    if v1106.subcategory_id ~= nil then
        v1107.subcategoryId = v1106.subcategory_id:jsonEncode();
    end;
    return v1107;
end;
v7.jsonDecode = function(v1108) --[[ Line: 8427 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_46 (copy), v5 (copy)
    local v1109 = l_v7_46.new();
    if v1108.subcategory_id ~= nil then
        v1109.subcategory_id = v5.StringProp.jsonDecode(v1108.subcategory_id);
    end;
    if v1108.subcategoryId ~= nil then
        v1109.subcategory_id = v5.StringProp.jsonDecode(v1108.subcategoryId);
    end;
    return v1109;
end;
v7.descriptor = {
    name = "SelectMarketplaceCatalogSubcategory_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.SelectMarketplaceCatalogSubcategory_Params = v7;
v1.default:register(v2.SelectMarketplaceCatalogSubcategory_Params);
v7 = {};
v7.__index = v7;
local l_v7_47 = v7 --[[ copy: 7 -> 55 ]];
v7.new = function(v1111) --[[ Line: 8459 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_47 (copy)
    return (setmetatable({
        action_type = if not (v1111 ~= nil) or v1111.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1111.action_type, 
        action_params = if not (v1111 ~= nil) or v1111.action_params == nil then nil else v1111.action_params
    }, l_v7_47));
end;
v7.encode = function(v1112) --[[ Line: 8470 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1113 = buffer.create(0);
    local v1114 = 0;
    if v1112.action_type ~= nil and (v1112.action_type ~= nil and v1112.action_type ~= 0 or v1112.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1115, v1116 = v0.writeTag(v1113, v1114, 1, v0.wireTypes.varint);
        v1115, v1116 = v0.writeVarInt(v1115, v1116, v2.ActionType.toNumber(v1112.action_type));
        v1113 = v1115;
        v1114 = v1116;
    end;
    if v1112.action_params ~= nil then
        local v1117 = v1112.action_params:encode();
        local v1118, v1119 = v0.writeTag(v1113, v1114, 2, v0.wireTypes.lengthDelimited);
        v1118, v1119 = v0.writeBuffer(v1118, v1119, v1117, buffer.len(v1117));
        v1113 = v1118;
        v1114 = v1119;
    end;
    local v1120 = buffer.create(v1114);
    buffer.copy(v1120, 0, v1113, 0, v1114);
    return v1120;
end;
v7.decode = function(v1121) --[[ Line: 8496 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_47 (copy), v0 (copy), v2 (copy)
    local v1122 = l_v7_47.new();
    local v1123 = 0;
    while v1123 < buffer.len(v1121) do
        local v1124 = nil;
        local v1125 = nil;
        local v1126, v1127, v1128 = v0.readTag(v1121, v1123);
        v1124 = v1126;
        v1125 = v1127;
        v1123 = v1128;
        if v1125 == v0.wireTypes.varint then
            if v1124 == 1 then
                v1126 = nil;
                v1127, v1128 = v0.readVarIntI32(v1121, v1123);
                v1126 = v1127;
                v1123 = v1128;
                v1122.action_type = v2.ActionType.fromNumber(v1126) or v1126;
            else
                v1126 = nil;
                v1127, v1128 = v0.readVarInt(v1121, v1123);
                v1126 = v1127;
                v1123 = v1128;
            end;
        elseif v1125 == v0.wireTypes.lengthDelimited then
            if v1124 == 2 then
                v1126 = nil;
                v1127, v1128 = v0.readBuffer(v1121, v1123);
                v1126 = v1127;
                v1123 = v1128;
                v1122.action_params = v2.OpenMarketplaceCatalogSeeAll_Params.decode(v1126);
            else
                v1126 = nil;
                v1127, v1128 = v0.readVarInt(v1121, v1123);
                v1123 = v1128 + v1127;
            end;
        elseif v1125 == v0.wireTypes.i32 then
            v1126 = nil;
            v1127, v1128 = v0.readFixed32(v1121, v1123);
            v1126 = v1127;
            v1123 = v1128;
        elseif v1125 == v0.wireTypes.i64 then
            v1126 = nil;
            v1127, v1128 = v0.readFixed64(v1121, v1123);
            v1126 = v1127;
            v1123 = v1128;
        else
            error("Unsupported wire type: " .. v1125);
        end;
    end;
    return v1122;
end;
v7.jsonEncode = function(v1129) --[[ Line: 8544 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1130 = {};
    if v1129.action_type ~= nil and (v1129.action_type ~= nil and v1129.action_type ~= 0 or v1129.action_type ~= v2.ActionType.fromNumber(0)) then
        v1130.actionType = if typeof(v1129.action_type) == "number" then v1129.action_type else v2.ActionType.toNumber(v1129.action_type);
    end;
    if v1129.action_params ~= nil then
        v1130.actionParams = v1129.action_params:jsonEncode();
    end;
    return v1130;
end;
v7.jsonDecode = function(v1131) --[[ Line: 8566 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_47 (copy), v2 (copy)
    local v1132 = l_v7_47.new();
    if v1131.action_type ~= nil then
        v1132.action_type = if typeof(v1131.action_type) == "number" then v2.ActionType.fromNumber(v1131.action_type) or v1131.action_type else v2.ActionType.fromName(v1131.action_type) or v1131.action_type;
    end;
    if v1131.actionType ~= nil then
        v1132.action_type = if typeof(v1131.actionType) == "number" then v2.ActionType.fromNumber(v1131.actionType) or v1131.actionType else v2.ActionType.fromName(v1131.actionType) or v1131.actionType;
    end;
    if v1131.action_params ~= nil then
        v1132.action_params = v2.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(v1131.action_params);
    end;
    if v1131.actionParams ~= nil then
        v1132.action_params = v2.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(v1131.actionParams);
    end;
    return v1132;
end;
v7.descriptor = {
    name = "OpenMarketplaceCatalogSeeAll", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceCatalogSeeAll"
};
v2.OpenMarketplaceCatalogSeeAll = v7;
v1.default:register(v2.OpenMarketplaceCatalogSeeAll);
v7 = {};
v7.__index = v7;
local l_v7_48 = v7 --[[ copy: 7 -> 56 ]];
v7.new = function(v1134) --[[ Line: 8606 ]] --[[ Name: new ]]
    -- upvalues: l_v7_48 (copy)
    return (setmetatable({
        sort_id = if not (v1134 ~= nil) or v1134.sort_id == nil then nil else v1134.sort_id, 
        title = if not (v1134 ~= nil) or v1134.title == nil then nil else v1134.title, 
        description = if not (v1134 ~= nil) or v1134.description == nil then nil else v1134.description, 
        tooltip_text = if not (v1134 ~= nil) or v1134.tooltip_text == nil then nil else v1134.tooltip_text
    }, l_v7_48));
end;
v7.encode = function(v1135) --[[ Line: 8617 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1136 = buffer.create(0);
    local v1137 = 0;
    if v1135.sort_id ~= nil then
        local v1138 = v1135.sort_id:encode();
        local v1139, v1140 = v0.writeTag(v1136, v1137, 1, v0.wireTypes.lengthDelimited);
        v1139, v1140 = v0.writeBuffer(v1139, v1140, v1138, buffer.len(v1138));
        v1136 = v1139;
        v1137 = v1140;
    end;
    if v1135.title ~= nil then
        local v1141 = v1135.title:encode();
        local v1142, v1143 = v0.writeTag(v1136, v1137, 2, v0.wireTypes.lengthDelimited);
        v1142, v1143 = v0.writeBuffer(v1142, v1143, v1141, buffer.len(v1141));
        v1136 = v1142;
        v1137 = v1143;
    end;
    if v1135.description ~= nil then
        local v1144 = v1135.description:encode();
        local v1145, v1146 = v0.writeTag(v1136, v1137, 3, v0.wireTypes.lengthDelimited);
        v1145, v1146 = v0.writeBuffer(v1145, v1146, v1144, buffer.len(v1144));
        v1136 = v1145;
        v1137 = v1146;
    end;
    if v1135.tooltip_text ~= nil then
        local v1147 = v1135.tooltip_text:encode();
        local v1148, v1149 = v0.writeTag(v1136, v1137, 4, v0.wireTypes.lengthDelimited);
        v1148, v1149 = v0.writeBuffer(v1148, v1149, v1147, buffer.len(v1147));
        v1136 = v1148;
        v1137 = v1149;
    end;
    local v1150 = buffer.create(v1137);
    buffer.copy(v1150, 0, v1136, 0, v1137);
    return v1150;
end;
v7.decode = function(v1151) --[[ Line: 8650 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_48 (copy), v0 (copy), v5 (copy)
    local v1152 = l_v7_48.new();
    local v1153 = 0;
    while v1153 < buffer.len(v1151) do
        local v1154 = nil;
        local v1155 = nil;
        local v1156, v1157, v1158 = v0.readTag(v1151, v1153);
        v1154 = v1156;
        v1155 = v1157;
        v1153 = v1158;
        if v1155 == v0.wireTypes.varint then
            v1156 = nil;
            v1157, v1158 = v0.readVarInt(v1151, v1153);
            v1156 = v1157;
            v1153 = v1158;
        elseif v1155 == v0.wireTypes.lengthDelimited then
            if v1154 == 1 then
                v1156 = nil;
                v1157, v1158 = v0.readBuffer(v1151, v1153);
                v1156 = v1157;
                v1153 = v1158;
                v1152.sort_id = v5.StringProp.decode(v1156);
            elseif v1154 == 2 then
                v1156 = nil;
                v1157, v1158 = v0.readBuffer(v1151, v1153);
                v1156 = v1157;
                v1153 = v1158;
                v1152.title = v5.StringProp.decode(v1156);
            elseif v1154 == 3 then
                v1156 = nil;
                v1157, v1158 = v0.readBuffer(v1151, v1153);
                v1156 = v1157;
                v1153 = v1158;
                v1152.description = v5.StringProp.decode(v1156);
            elseif v1154 == 4 then
                v1156 = nil;
                v1157, v1158 = v0.readBuffer(v1151, v1153);
                v1156 = v1157;
                v1153 = v1158;
                v1152.tooltip_text = v5.StringProp.decode(v1156);
            else
                v1156 = nil;
                v1157, v1158 = v0.readVarInt(v1151, v1153);
                v1153 = v1158 + v1157;
            end;
        elseif v1155 == v0.wireTypes.i32 then
            v1156 = nil;
            v1157, v1158 = v0.readFixed32(v1151, v1153);
            v1156 = v1157;
            v1153 = v1158;
        elseif v1155 == v0.wireTypes.i64 then
            v1156 = nil;
            v1157, v1158 = v0.readFixed64(v1151, v1153);
            v1156 = v1157;
            v1153 = v1158;
        else
            error("Unsupported wire type: " .. v1155);
        end;
    end;
    return v1152;
end;
v7.jsonEncode = function(v1159) --[[ Line: 8708 ]] --[[ Name: jsonEncode ]]
    local v1160 = {};
    if v1159.sort_id ~= nil then
        v1160.sortId = v1159.sort_id:jsonEncode();
    end;
    if v1159.title ~= nil then
        v1160.title = v1159.title:jsonEncode();
    end;
    if v1159.description ~= nil then
        v1160.description = v1159.description:jsonEncode();
    end;
    if v1159.tooltip_text ~= nil then
        v1160.tooltipText = v1159.tooltip_text:jsonEncode();
    end;
    return v1160;
end;
v7.jsonDecode = function(v1161) --[[ Line: 8730 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_48 (copy), v5 (copy)
    local v1162 = l_v7_48.new();
    if v1161.sort_id ~= nil then
        v1162.sort_id = v5.StringProp.jsonDecode(v1161.sort_id);
    end;
    if v1161.sortId ~= nil then
        v1162.sort_id = v5.StringProp.jsonDecode(v1161.sortId);
    end;
    if v1161.title ~= nil then
        v1162.title = v5.StringProp.jsonDecode(v1161.title);
    end;
    if v1161.description ~= nil then
        v1162.description = v5.StringProp.jsonDecode(v1161.description);
    end;
    if v1161.tooltip_text ~= nil then
        v1162.tooltip_text = v5.StringProp.jsonDecode(v1161.tooltip_text);
    end;
    if v1161.tooltipText ~= nil then
        v1162.tooltip_text = v5.StringProp.jsonDecode(v1161.tooltipText);
    end;
    return v1162;
end;
v7.descriptor = {
    name = "OpenMarketplaceCatalogSeeAll_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenMarketplaceCatalogSeeAll_Params = v7;
v1.default:register(v2.OpenMarketplaceCatalogSeeAll_Params);
v7 = {};
v7.__index = v7;
local l_v7_49 = v7 --[[ copy: 7 -> 57 ]];
v7.new = function(v1164) --[[ Line: 8779 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_49 (copy)
    return (setmetatable({
        action_type = if not (v1164 ~= nil) or v1164.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1164.action_type, 
        action_params = if not (v1164 ~= nil) or v1164.action_params == nil then nil else v1164.action_params
    }, l_v7_49));
end;
v7.encode = function(v1165) --[[ Line: 8790 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1166 = buffer.create(0);
    local v1167 = 0;
    if v1165.action_type ~= nil and (v1165.action_type ~= nil and v1165.action_type ~= 0 or v1165.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1168, v1169 = v0.writeTag(v1166, v1167, 1, v0.wireTypes.varint);
        v1168, v1169 = v0.writeVarInt(v1168, v1169, v2.ActionType.toNumber(v1165.action_type));
        v1166 = v1168;
        v1167 = v1169;
    end;
    if v1165.action_params ~= nil then
        local v1170 = v1165.action_params:encode();
        local v1171, v1172 = v0.writeTag(v1166, v1167, 2, v0.wireTypes.lengthDelimited);
        v1171, v1172 = v0.writeBuffer(v1171, v1172, v1170, buffer.len(v1170));
        v1166 = v1171;
        v1167 = v1172;
    end;
    local v1173 = buffer.create(v1167);
    buffer.copy(v1173, 0, v1166, 0, v1167);
    return v1173;
end;
v7.decode = function(v1174) --[[ Line: 8816 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_49 (copy), v0 (copy), v2 (copy)
    local v1175 = l_v7_49.new();
    local v1176 = 0;
    while v1176 < buffer.len(v1174) do
        local v1177 = nil;
        local v1178 = nil;
        local v1179, v1180, v1181 = v0.readTag(v1174, v1176);
        v1177 = v1179;
        v1178 = v1180;
        v1176 = v1181;
        if v1178 == v0.wireTypes.varint then
            if v1177 == 1 then
                v1179 = nil;
                v1180, v1181 = v0.readVarIntI32(v1174, v1176);
                v1179 = v1180;
                v1176 = v1181;
                v1175.action_type = v2.ActionType.fromNumber(v1179) or v1179;
            else
                v1179 = nil;
                v1180, v1181 = v0.readVarInt(v1174, v1176);
                v1179 = v1180;
                v1176 = v1181;
            end;
        elseif v1178 == v0.wireTypes.lengthDelimited then
            if v1177 == 2 then
                v1179 = nil;
                v1180, v1181 = v0.readBuffer(v1174, v1176);
                v1179 = v1180;
                v1176 = v1181;
                v1175.action_params = v2.CloseMarketplaceCategoryTooltip_Params.decode(v1179);
            else
                v1179 = nil;
                v1180, v1181 = v0.readVarInt(v1174, v1176);
                v1176 = v1181 + v1180;
            end;
        elseif v1178 == v0.wireTypes.i32 then
            v1179 = nil;
            v1180, v1181 = v0.readFixed32(v1174, v1176);
            v1179 = v1180;
            v1176 = v1181;
        elseif v1178 == v0.wireTypes.i64 then
            v1179 = nil;
            v1180, v1181 = v0.readFixed64(v1174, v1176);
            v1179 = v1180;
            v1176 = v1181;
        else
            error("Unsupported wire type: " .. v1178);
        end;
    end;
    return v1175;
end;
v7.jsonEncode = function(v1182) --[[ Line: 8864 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1183 = {};
    if v1182.action_type ~= nil and (v1182.action_type ~= nil and v1182.action_type ~= 0 or v1182.action_type ~= v2.ActionType.fromNumber(0)) then
        v1183.actionType = if typeof(v1182.action_type) == "number" then v1182.action_type else v2.ActionType.toNumber(v1182.action_type);
    end;
    if v1182.action_params ~= nil then
        v1183.actionParams = v1182.action_params:jsonEncode();
    end;
    return v1183;
end;
v7.jsonDecode = function(v1184) --[[ Line: 8886 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_49 (copy), v2 (copy)
    local v1185 = l_v7_49.new();
    if v1184.action_type ~= nil then
        v1185.action_type = if typeof(v1184.action_type) == "number" then v2.ActionType.fromNumber(v1184.action_type) or v1184.action_type else v2.ActionType.fromName(v1184.action_type) or v1184.action_type;
    end;
    if v1184.actionType ~= nil then
        v1185.action_type = if typeof(v1184.actionType) == "number" then v2.ActionType.fromNumber(v1184.actionType) or v1184.actionType else v2.ActionType.fromName(v1184.actionType) or v1184.actionType;
    end;
    if v1184.action_params ~= nil then
        v1185.action_params = v2.CloseMarketplaceCategoryTooltip_Params.jsonDecode(v1184.action_params);
    end;
    if v1184.actionParams ~= nil then
        v1185.action_params = v2.CloseMarketplaceCategoryTooltip_Params.jsonDecode(v1184.actionParams);
    end;
    return v1185;
end;
v7.descriptor = {
    name = "CloseMarketplaceCategoryTooltip", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CloseMarketplaceCategoryTooltip"
};
v2.CloseMarketplaceCategoryTooltip = v7;
v1.default:register(v2.CloseMarketplaceCategoryTooltip);
v7 = {};
v7.__index = v7;
local l_v7_50 = v7 --[[ copy: 7 -> 58 ]];
v7.new = function(v1187) --[[ Line: 8926 ]] --[[ Name: new ]]
    -- upvalues: l_v7_50 (copy)
    return (setmetatable({
        tooltip_id = if not (v1187 ~= nil) or v1187.tooltip_id == nil then nil else v1187.tooltip_id
    }, l_v7_50));
end;
v7.encode = function(v1188) --[[ Line: 8934 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1189 = buffer.create(0);
    local v1190 = 0;
    if v1188.tooltip_id ~= nil then
        local v1191 = v1188.tooltip_id:encode();
        local v1192, v1193 = v0.writeTag(v1189, v1190, 1, v0.wireTypes.lengthDelimited);
        v1192, v1193 = v0.writeBuffer(v1192, v1193, v1191, buffer.len(v1191));
        v1189 = v1192;
        v1190 = v1193;
    end;
    local v1194 = buffer.create(v1190);
    buffer.copy(v1194, 0, v1189, 0, v1190);
    return v1194;
end;
v7.decode = function(v1195) --[[ Line: 8949 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_50 (copy), v0 (copy), v5 (copy)
    local v1196 = l_v7_50.new();
    local v1197 = 0;
    while v1197 < buffer.len(v1195) do
        local v1198 = nil;
        local v1199 = nil;
        local v1200, v1201, v1202 = v0.readTag(v1195, v1197);
        v1198 = v1200;
        v1199 = v1201;
        v1197 = v1202;
        if v1199 == v0.wireTypes.varint then
            v1200 = nil;
            v1201, v1202 = v0.readVarInt(v1195, v1197);
            v1200 = v1201;
            v1197 = v1202;
        elseif v1199 == v0.wireTypes.lengthDelimited then
            if v1198 == 1 then
                v1200 = nil;
                v1201, v1202 = v0.readBuffer(v1195, v1197);
                v1200 = v1201;
                v1197 = v1202;
                v1196.tooltip_id = v5.StringProp.decode(v1200);
            else
                v1200 = nil;
                v1201, v1202 = v0.readVarInt(v1195, v1197);
                v1197 = v1202 + v1201;
            end;
        elseif v1199 == v0.wireTypes.i32 then
            v1200 = nil;
            v1201, v1202 = v0.readFixed32(v1195, v1197);
            v1200 = v1201;
            v1197 = v1202;
        elseif v1199 == v0.wireTypes.i64 then
            v1200 = nil;
            v1201, v1202 = v0.readFixed64(v1195, v1197);
            v1200 = v1201;
            v1197 = v1202;
        else
            error("Unsupported wire type: " .. v1199);
        end;
    end;
    return v1196;
end;
v7.jsonEncode = function(v1203) --[[ Line: 8992 ]] --[[ Name: jsonEncode ]]
    local v1204 = {};
    if v1203.tooltip_id ~= nil then
        v1204.tooltipId = v1203.tooltip_id:jsonEncode();
    end;
    return v1204;
end;
v7.jsonDecode = function(v1205) --[[ Line: 9002 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_50 (copy), v5 (copy)
    local v1206 = l_v7_50.new();
    if v1205.tooltip_id ~= nil then
        v1206.tooltip_id = v5.StringProp.jsonDecode(v1205.tooltip_id);
    end;
    if v1205.tooltipId ~= nil then
        v1206.tooltip_id = v5.StringProp.jsonDecode(v1205.tooltipId);
    end;
    return v1206;
end;
v7.descriptor = {
    name = "CloseMarketplaceCategoryTooltip_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.CloseMarketplaceCategoryTooltip_Params = v7;
v1.default:register(v2.CloseMarketplaceCategoryTooltip_Params);
v7 = {};
v7.__index = v7;
local l_v7_51 = v7 --[[ copy: 7 -> 59 ]];
v7.new = function(v1208) --[[ Line: 9032 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_51 (copy)
    return (setmetatable({
        action_type = if not (v1208 ~= nil) or v1208.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1208.action_type, 
        action_params = if not (v1208 ~= nil) or v1208.action_params == nil then nil else v1208.action_params
    }, l_v7_51));
end;
v7.encode = function(v1209) --[[ Line: 9041 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1210 = buffer.create(0);
    local v1211 = 0;
    if v1209.action_type ~= nil and (v1209.action_type ~= nil and v1209.action_type ~= 0 or v1209.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1212, v1213 = v0.writeTag(v1210, v1211, 1, v0.wireTypes.varint);
        v1212, v1213 = v0.writeVarInt(v1212, v1213, v2.ActionType.toNumber(v1209.action_type));
        v1210 = v1212;
        v1211 = v1213;
    end;
    if v1209.action_params ~= nil then
        local v1214 = v1209.action_params:encode();
        local v1215, v1216 = v0.writeTag(v1210, v1211, 2, v0.wireTypes.lengthDelimited);
        v1215, v1216 = v0.writeBuffer(v1215, v1216, v1214, buffer.len(v1214));
        v1210 = v1215;
        v1211 = v1216;
    end;
    local v1217 = buffer.create(v1211);
    buffer.copy(v1217, 0, v1210, 0, v1211);
    return v1217;
end;
v7.decode = function(v1218) --[[ Line: 9067 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_51 (copy), v0 (copy), v2 (copy)
    local v1219 = l_v7_51.new();
    local v1220 = 0;
    while v1220 < buffer.len(v1218) do
        local v1221 = nil;
        local v1222 = nil;
        local v1223, v1224, v1225 = v0.readTag(v1218, v1220);
        v1221 = v1223;
        v1222 = v1224;
        v1220 = v1225;
        if v1222 == v0.wireTypes.varint then
            if v1221 == 1 then
                v1223 = nil;
                v1224, v1225 = v0.readVarIntI32(v1218, v1220);
                v1223 = v1224;
                v1220 = v1225;
                v1219.action_type = v2.ActionType.fromNumber(v1223) or v1223;
            else
                v1223 = nil;
                v1224, v1225 = v0.readVarInt(v1218, v1220);
                v1223 = v1224;
                v1220 = v1225;
            end;
        elseif v1222 == v0.wireTypes.lengthDelimited then
            if v1221 == 2 then
                v1223 = nil;
                v1224, v1225 = v0.readBuffer(v1218, v1220);
                v1223 = v1224;
                v1220 = v1225;
                v1219.action_params = v2.ResizeMarketplaceCatalog_Params.decode(v1223);
            else
                v1223 = nil;
                v1224, v1225 = v0.readVarInt(v1218, v1220);
                v1220 = v1225 + v1224;
            end;
        elseif v1222 == v0.wireTypes.i32 then
            v1223 = nil;
            v1224, v1225 = v0.readFixed32(v1218, v1220);
            v1223 = v1224;
            v1220 = v1225;
        elseif v1222 == v0.wireTypes.i64 then
            v1223 = nil;
            v1224, v1225 = v0.readFixed64(v1218, v1220);
            v1223 = v1224;
            v1220 = v1225;
        else
            error("Unsupported wire type: " .. v1222);
        end;
    end;
    return v1219;
end;
v7.jsonEncode = function(v1226) --[[ Line: 9115 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1227 = {};
    if v1226.action_type ~= nil and (v1226.action_type ~= nil and v1226.action_type ~= 0 or v1226.action_type ~= v2.ActionType.fromNumber(0)) then
        v1227.actionType = if typeof(v1226.action_type) == "number" then v1226.action_type else v2.ActionType.toNumber(v1226.action_type);
    end;
    if v1226.action_params ~= nil then
        v1227.actionParams = v1226.action_params:jsonEncode();
    end;
    return v1227;
end;
v7.jsonDecode = function(v1228) --[[ Line: 9137 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_51 (copy), v2 (copy)
    local v1229 = l_v7_51.new();
    if v1228.action_type ~= nil then
        v1229.action_type = if typeof(v1228.action_type) == "number" then v2.ActionType.fromNumber(v1228.action_type) or v1228.action_type else v2.ActionType.fromName(v1228.action_type) or v1228.action_type;
    end;
    if v1228.actionType ~= nil then
        v1229.action_type = if typeof(v1228.actionType) == "number" then v2.ActionType.fromNumber(v1228.actionType) or v1228.actionType else v2.ActionType.fromName(v1228.actionType) or v1228.actionType;
    end;
    if v1228.action_params ~= nil then
        v1229.action_params = v2.ResizeMarketplaceCatalog_Params.jsonDecode(v1228.action_params);
    end;
    if v1228.actionParams ~= nil then
        v1229.action_params = v2.ResizeMarketplaceCatalog_Params.jsonDecode(v1228.actionParams);
    end;
    return v1229;
end;
v7.descriptor = {
    name = "ResizeMarketplaceCatalog", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ResizeMarketplaceCatalog"
};
v2.ResizeMarketplaceCatalog = v7;
v1.default:register(v2.ResizeMarketplaceCatalog);
v7 = {};
v7.__index = v7;
local l_v7_52 = v7 --[[ copy: 7 -> 60 ]];
v7.new = function(v1231) --[[ Line: 9177 ]] --[[ Name: new ]]
    -- upvalues: l_v7_52 (copy)
    return (setmetatable({
        category_id = if not (v1231 ~= nil) or v1231.category_id == nil then nil else v1231.category_id, 
        subcategory_id = if not (v1231 ~= nil) or v1231.subcategory_id == nil then nil else v1231.subcategory_id, 
        screen_size = if not (v1231 ~= nil) or v1231.screen_size == nil then nil else v1231.screen_size
    }, l_v7_52));
end;
v7.encode = function(v1232) --[[ Line: 9187 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1233 = buffer.create(0);
    local v1234 = 0;
    if v1232.category_id ~= nil then
        local v1235 = v1232.category_id:encode();
        local v1236, v1237 = v0.writeTag(v1233, v1234, 1, v0.wireTypes.lengthDelimited);
        v1236, v1237 = v0.writeBuffer(v1236, v1237, v1235, buffer.len(v1235));
        v1233 = v1236;
        v1234 = v1237;
    end;
    if v1232.subcategory_id ~= nil then
        local v1238 = v1232.subcategory_id:encode();
        local v1239, v1240 = v0.writeTag(v1233, v1234, 2, v0.wireTypes.lengthDelimited);
        v1239, v1240 = v0.writeBuffer(v1239, v1240, v1238, buffer.len(v1238));
        v1233 = v1239;
        v1234 = v1240;
    end;
    if v1232.screen_size ~= nil then
        local v1241 = v1232.screen_size:encode();
        local v1242, v1243 = v0.writeTag(v1233, v1234, 3, v0.wireTypes.lengthDelimited);
        v1242, v1243 = v0.writeBuffer(v1242, v1243, v1241, buffer.len(v1241));
        v1233 = v1242;
        v1234 = v1243;
    end;
    local v1244 = buffer.create(v1234);
    buffer.copy(v1244, 0, v1233, 0, v1234);
    return v1244;
end;
v7.decode = function(v1245) --[[ Line: 9214 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_52 (copy), v0 (copy), v5 (copy)
    local v1246 = l_v7_52.new();
    local v1247 = 0;
    while v1247 < buffer.len(v1245) do
        local v1248 = nil;
        local v1249 = nil;
        local v1250, v1251, v1252 = v0.readTag(v1245, v1247);
        v1248 = v1250;
        v1249 = v1251;
        v1247 = v1252;
        if v1249 == v0.wireTypes.varint then
            v1250 = nil;
            v1251, v1252 = v0.readVarInt(v1245, v1247);
            v1250 = v1251;
            v1247 = v1252;
        elseif v1249 == v0.wireTypes.lengthDelimited then
            if v1248 == 1 then
                v1250 = nil;
                v1251, v1252 = v0.readBuffer(v1245, v1247);
                v1250 = v1251;
                v1247 = v1252;
                v1246.category_id = v5.StringProp.decode(v1250);
            elseif v1248 == 2 then
                v1250 = nil;
                v1251, v1252 = v0.readBuffer(v1245, v1247);
                v1250 = v1251;
                v1247 = v1252;
                v1246.subcategory_id = v5.StringProp.decode(v1250);
            elseif v1248 == 3 then
                v1250 = nil;
                v1251, v1252 = v0.readBuffer(v1245, v1247);
                v1250 = v1251;
                v1247 = v1252;
                v1246.screen_size = v5.StringProp.decode(v1250);
            else
                v1250 = nil;
                v1251, v1252 = v0.readVarInt(v1245, v1247);
                v1247 = v1252 + v1251;
            end;
        elseif v1249 == v0.wireTypes.i32 then
            v1250 = nil;
            v1251, v1252 = v0.readFixed32(v1245, v1247);
            v1250 = v1251;
            v1247 = v1252;
        elseif v1249 == v0.wireTypes.i64 then
            v1250 = nil;
            v1251, v1252 = v0.readFixed64(v1245, v1247);
            v1250 = v1251;
            v1247 = v1252;
        else
            error("Unsupported wire type: " .. v1249);
        end;
    end;
    return v1246;
end;
v7.jsonEncode = function(v1253) --[[ Line: 9267 ]] --[[ Name: jsonEncode ]]
    local v1254 = {};
    if v1253.category_id ~= nil then
        v1254.categoryId = v1253.category_id:jsonEncode();
    end;
    if v1253.subcategory_id ~= nil then
        v1254.subcategoryId = v1253.subcategory_id:jsonEncode();
    end;
    if v1253.screen_size ~= nil then
        v1254.screenSize = v1253.screen_size:jsonEncode();
    end;
    return v1254;
end;
v7.jsonDecode = function(v1255) --[[ Line: 9285 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_52 (copy), v5 (copy)
    local v1256 = l_v7_52.new();
    if v1255.category_id ~= nil then
        v1256.category_id = v5.StringProp.jsonDecode(v1255.category_id);
    end;
    if v1255.categoryId ~= nil then
        v1256.category_id = v5.StringProp.jsonDecode(v1255.categoryId);
    end;
    if v1255.subcategory_id ~= nil then
        v1256.subcategory_id = v5.StringProp.jsonDecode(v1255.subcategory_id);
    end;
    if v1255.subcategoryId ~= nil then
        v1256.subcategory_id = v5.StringProp.jsonDecode(v1255.subcategoryId);
    end;
    if v1255.screen_size ~= nil then
        v1256.screen_size = v5.StringProp.jsonDecode(v1255.screen_size);
    end;
    if v1255.screenSize ~= nil then
        v1256.screen_size = v5.StringProp.jsonDecode(v1255.screenSize);
    end;
    return v1256;
end;
v7.descriptor = {
    name = "ResizeMarketplaceCatalog_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.ResizeMarketplaceCatalog_Params = v7;
v1.default:register(v2.ResizeMarketplaceCatalog_Params);
v7 = {};
v7.__index = v7;
local l_v7_53 = v7 --[[ copy: 7 -> 61 ]];
v7.new = function(v1258) --[[ Line: 9333 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_53 (copy)
    return (setmetatable({
        action_type = if not (v1258 ~= nil) or v1258.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1258.action_type, 
        action_params = if not (v1258 ~= nil) or v1258.action_params == nil then nil else v1258.action_params
    }, l_v7_53));
end;
v7.encode = function(v1259) --[[ Line: 9344 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1260 = buffer.create(0);
    local v1261 = 0;
    if v1259.action_type ~= nil and (v1259.action_type ~= nil and v1259.action_type ~= 0 or v1259.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1262, v1263 = v0.writeTag(v1260, v1261, 1, v0.wireTypes.varint);
        v1262, v1263 = v0.writeVarInt(v1262, v1263, v2.ActionType.toNumber(v1259.action_type));
        v1260 = v1262;
        v1261 = v1263;
    end;
    if v1259.action_params ~= nil then
        local v1264 = v1259.action_params:encode();
        local v1265, v1266 = v0.writeTag(v1260, v1261, 2, v0.wireTypes.lengthDelimited);
        v1265, v1266 = v0.writeBuffer(v1265, v1266, v1264, buffer.len(v1264));
        v1260 = v1265;
        v1261 = v1266;
    end;
    local v1267 = buffer.create(v1261);
    buffer.copy(v1267, 0, v1260, 0, v1261);
    return v1267;
end;
v7.decode = function(v1268) --[[ Line: 9370 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_53 (copy), v0 (copy), v2 (copy)
    local v1269 = l_v7_53.new();
    local v1270 = 0;
    while v1270 < buffer.len(v1268) do
        local v1271 = nil;
        local v1272 = nil;
        local v1273, v1274, v1275 = v0.readTag(v1268, v1270);
        v1271 = v1273;
        v1272 = v1274;
        v1270 = v1275;
        if v1272 == v0.wireTypes.varint then
            if v1271 == 1 then
                v1273 = nil;
                v1274, v1275 = v0.readVarIntI32(v1268, v1270);
                v1273 = v1274;
                v1270 = v1275;
                v1269.action_type = v2.ActionType.fromNumber(v1273) or v1273;
            else
                v1273 = nil;
                v1274, v1275 = v0.readVarInt(v1268, v1270);
                v1273 = v1274;
                v1270 = v1275;
            end;
        elseif v1272 == v0.wireTypes.lengthDelimited then
            if v1271 == 2 then
                v1273 = nil;
                v1274, v1275 = v0.readBuffer(v1268, v1270);
                v1273 = v1274;
                v1270 = v1275;
                v1269.action_params = v2.OpenMarketplaceCatalogFilters_Params.decode(v1273);
            else
                v1273 = nil;
                v1274, v1275 = v0.readVarInt(v1268, v1270);
                v1270 = v1275 + v1274;
            end;
        elseif v1272 == v0.wireTypes.i32 then
            v1273 = nil;
            v1274, v1275 = v0.readFixed32(v1268, v1270);
            v1273 = v1274;
            v1270 = v1275;
        elseif v1272 == v0.wireTypes.i64 then
            v1273 = nil;
            v1274, v1275 = v0.readFixed64(v1268, v1270);
            v1273 = v1274;
            v1270 = v1275;
        else
            error("Unsupported wire type: " .. v1272);
        end;
    end;
    return v1269;
end;
v7.jsonEncode = function(v1276) --[[ Line: 9418 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1277 = {};
    if v1276.action_type ~= nil and (v1276.action_type ~= nil and v1276.action_type ~= 0 or v1276.action_type ~= v2.ActionType.fromNumber(0)) then
        v1277.actionType = if typeof(v1276.action_type) == "number" then v1276.action_type else v2.ActionType.toNumber(v1276.action_type);
    end;
    if v1276.action_params ~= nil then
        v1277.actionParams = v1276.action_params:jsonEncode();
    end;
    return v1277;
end;
v7.jsonDecode = function(v1278) --[[ Line: 9440 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_53 (copy), v2 (copy)
    local v1279 = l_v7_53.new();
    if v1278.action_type ~= nil then
        v1279.action_type = if typeof(v1278.action_type) == "number" then v2.ActionType.fromNumber(v1278.action_type) or v1278.action_type else v2.ActionType.fromName(v1278.action_type) or v1278.action_type;
    end;
    if v1278.actionType ~= nil then
        v1279.action_type = if typeof(v1278.actionType) == "number" then v2.ActionType.fromNumber(v1278.actionType) or v1278.actionType else v2.ActionType.fromName(v1278.actionType) or v1278.actionType;
    end;
    if v1278.action_params ~= nil then
        v1279.action_params = v2.OpenMarketplaceCatalogFilters_Params.jsonDecode(v1278.action_params);
    end;
    if v1278.actionParams ~= nil then
        v1279.action_params = v2.OpenMarketplaceCatalogFilters_Params.jsonDecode(v1278.actionParams);
    end;
    return v1279;
end;
v7.descriptor = {
    name = "OpenMarketplaceCatalogFilters", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceCatalogFilters"
};
v2.OpenMarketplaceCatalogFilters = v7;
v1.default:register(v2.OpenMarketplaceCatalogFilters);
v7 = {};
v7.__index = v7;
local l_v7_54 = v7 --[[ copy: 7 -> 62 ]];
v7.new = function(_) --[[ Line: 9480 ]] --[[ Name: new ]]
    -- upvalues: l_v7_54 (copy)
    return (setmetatable({}, l_v7_54));
end;
v7.encode = function(_) --[[ Line: 9486 ]] --[[ Name: encode ]]
    local v1283 = buffer.create(0);
    local v1284 = buffer.create(0);
    buffer.copy(v1284, 0, v1283, 0, 0);
    return v1284;
end;
v7.decode = function(v1285) --[[ Line: 9495 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_54 (copy), v0 (copy)
    local v1286 = l_v7_54.new();
    local v1287 = 0;
    while v1287 < buffer.len(v1285) do
        local v1288 = nil;
        local v1289 = nil;
        local v1290, v1291, v1292 = v0.readTag(v1285, v1287);
        v1288 = v1290;
        v1289 = v1291;
        v1287 = v1292;
        if v1289 == v0.wireTypes.varint then
            v1290 = nil;
            v1291, v1292 = v0.readVarInt(v1285, v1287);
            v1290 = v1291;
            v1287 = v1292;
        elseif v1289 == v0.wireTypes.lengthDelimited then
            v1290 = nil;
            v1291, v1292 = v0.readVarInt(v1285, v1287);
            v1287 = v1292 + v1291;
        elseif v1289 == v0.wireTypes.i32 then
            v1290 = nil;
            v1291, v1292 = v0.readFixed32(v1285, v1287);
            v1290 = v1291;
            v1287 = v1292;
        elseif v1289 == v0.wireTypes.i64 then
            v1290 = nil;
            v1291, v1292 = v0.readFixed64(v1285, v1287);
            v1290 = v1291;
            v1287 = v1292;
        else
            error("Unsupported wire type: " .. v1289);
        end;
    end;
    return v1286;
end;
v7.jsonEncode = function(_) --[[ Line: 9533 ]] --[[ Name: jsonEncode ]]
    return {};
end;
v7.jsonDecode = function(_) --[[ Line: 9539 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_54 (copy)
    return (l_v7_54.new());
end;
v7.descriptor = {
    name = "OpenMarketplaceCatalogFilters_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenMarketplaceCatalogFilters_Params = v7;
v1.default:register(v2.OpenMarketplaceCatalogFilters_Params);
v7 = {};
v7.__index = v7;
local l_v7_55 = v7 --[[ copy: 7 -> 63 ]];
v7.new = function(v1296) --[[ Line: 9561 ]] --[[ Name: new ]]
    -- upvalues: l_v7_55 (copy)
    return (setmetatable({
        kind = if not (v1296 ~= nil) or v1296.kind == nil then nil else v1296.kind
    }, l_v7_55));
end;
v7.encode = function(v1297) --[[ Line: 9567 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1298 = buffer.create(0);
    local v1299 = 0;
    if v1297.kind ~= nil then
        if v1297.kind.type == "dismiss_dialog_action" then
            local v1300 = v1297.kind.value:encode();
            local v1301, v1302 = v0.writeTag(v1298, v1299, 1, v0.wireTypes.lengthDelimited);
            v1301, v1302 = v0.writeBuffer(v1301, v1302, v1300, buffer.len(v1300));
            v1298 = v1301;
            v1299 = v1302;
        elseif v1297.kind.type == "link_action" then
            local v1303 = v1297.kind.value:encode();
            local v1304, v1305 = v0.writeTag(v1298, v1299, 2, v0.wireTypes.lengthDelimited);
            v1304, v1305 = v0.writeBuffer(v1304, v1305, v1303, buffer.len(v1303));
            v1298 = v1304;
            v1299 = v1305;
        elseif v1297.kind.type == "open_game_details_action" then
            local v1306 = v1297.kind.value:encode();
            local v1307, v1308 = v0.writeTag(v1298, v1299, 3, v0.wireTypes.lengthDelimited);
            v1307, v1308 = v0.writeBuffer(v1307, v1308, v1306, buffer.len(v1306));
            v1298 = v1307;
            v1299 = v1308;
        elseif v1297.kind.type == "open_join_friends_action" then
            local v1309 = v1297.kind.value:encode();
            local v1310, v1311 = v0.writeTag(v1298, v1299, 4, v0.wireTypes.lengthDelimited);
            v1310, v1311 = v0.writeBuffer(v1310, v1311, v1309, buffer.len(v1309));
            v1298 = v1310;
            v1299 = v1311;
        elseif v1297.kind.type == "open_marketplace_try_on_action" then
            local v1312 = v1297.kind.value:encode();
            local v1313, v1314 = v0.writeTag(v1298, v1299, 5, v0.wireTypes.lengthDelimited);
            v1313, v1314 = v0.writeBuffer(v1313, v1314, v1312, buffer.len(v1312));
            v1298 = v1313;
            v1299 = v1314;
        elseif v1297.kind.type == "open_see_all_action" then
            local v1315 = v1297.kind.value:encode();
            local v1316, v1317 = v0.writeTag(v1298, v1299, 6, v0.wireTypes.lengthDelimited);
            v1316, v1317 = v0.writeBuffer(v1316, v1317, v1315, buffer.len(v1315));
            v1298 = v1316;
            v1299 = v1317;
        elseif v1297.kind.type == "open_sponsored_tooltip_action" then
            local v1318 = v1297.kind.value:encode();
            local v1319, v1320 = v0.writeTag(v1298, v1299, 7, v0.wireTypes.lengthDelimited);
            v1319, v1320 = v0.writeBuffer(v1319, v1320, v1318, buffer.len(v1318));
            v1298 = v1319;
            v1299 = v1320;
        elseif v1297.kind.type == "play_button_click_action" then
            local v1321 = v1297.kind.value:encode();
            local v1322, v1323 = v0.writeTag(v1298, v1299, 8, v0.wireTypes.lengthDelimited);
            v1322, v1323 = v0.writeBuffer(v1322, v1323, v1321, buffer.len(v1321));
            v1298 = v1322;
            v1299 = v1323;
        elseif v1297.kind.type == "update_user_settings_action" then
            local v1324 = v1297.kind.value:encode();
            local v1325, v1326 = v0.writeTag(v1298, v1299, 9, v0.wireTypes.lengthDelimited);
            v1325, v1326 = v0.writeBuffer(v1325, v1326, v1324, buffer.len(v1324));
            v1298 = v1325;
            v1299 = v1326;
        elseif v1297.kind.type == "open_tooltip_action" then
            local v1327 = v1297.kind.value:encode();
            local v1328, v1329 = v0.writeTag(v1298, v1299, 10, v0.wireTypes.lengthDelimited);
            v1328, v1329 = v0.writeBuffer(v1328, v1329, v1327, buffer.len(v1327));
            v1298 = v1328;
            v1299 = v1329;
        elseif v1297.kind.type == "open_badge_details_action" then
            local v1330 = v1297.kind.value:encode();
            local v1331, v1332 = v0.writeTag(v1298, v1299, 11, v0.wireTypes.lengthDelimited);
            v1331, v1332 = v0.writeBuffer(v1331, v1332, v1330, buffer.len(v1330));
            v1298 = v1331;
            v1299 = v1332;
        elseif v1297.kind.type == "load_more_from_api_action" then
            local v1333 = v1297.kind.value:encode();
            local v1334, v1335 = v0.writeTag(v1298, v1299, 12, v0.wireTypes.lengthDelimited);
            v1334, v1335 = v0.writeBuffer(v1334, v1335, v1333, buffer.len(v1333));
            v1298 = v1334;
            v1299 = v1335;
        elseif v1297.kind.type == "share_action" then
            local v1336 = v1297.kind.value:encode();
            local v1337, v1338 = v0.writeTag(v1298, v1299, 13, v0.wireTypes.lengthDelimited);
            v1337, v1338 = v0.writeBuffer(v1337, v1338, v1336, buffer.len(v1336));
            v1298 = v1337;
            v1299 = v1338;
        elseif v1297.kind.type == "open_abuse_report_action" then
            local v1339 = v1297.kind.value:encode();
            local v1340, v1341 = v0.writeTag(v1298, v1299, 14, v0.wireTypes.lengthDelimited);
            v1340, v1341 = v0.writeBuffer(v1340, v1341, v1339, buffer.len(v1339));
            v1298 = v1340;
            v1299 = v1341;
        elseif v1297.kind.type == "remove_badge_from_inventory_action" then
            local v1342 = v1297.kind.value:encode();
            local v1343, v1344 = v0.writeTag(v1298, v1299, 15, v0.wireTypes.lengthDelimited);
            v1343, v1344 = v0.writeBuffer(v1343, v1344, v1342, buffer.len(v1342));
            v1298 = v1343;
            v1299 = v1344;
        elseif v1297.kind.type == "open_profile_action" then
            local v1345 = v1297.kind.value:encode();
            local v1346, v1347 = v0.writeTag(v1298, v1299, 16, v0.wireTypes.lengthDelimited);
            v1346, v1347 = v0.writeBuffer(v1346, v1347, v1345, buffer.len(v1345));
            v1298 = v1346;
            v1299 = v1347;
        elseif v1297.kind.type == "open_facial_age_estimation_action" then
            local v1348 = v1297.kind.value:encode();
            local v1349, v1350 = v0.writeTag(v1298, v1299, 17, v0.wireTypes.lengthDelimited);
            v1349, v1350 = v0.writeBuffer(v1349, v1350, v1348, buffer.len(v1348));
            v1298 = v1349;
            v1299 = v1350;
        elseif v1297.kind.type == "open_add_connections_page_action" then
            local v1351 = v1297.kind.value:encode();
            local v1352, v1353 = v0.writeTag(v1298, v1299, 18, v0.wireTypes.lengthDelimited);
            v1352, v1353 = v0.writeBuffer(v1352, v1353, v1351, buffer.len(v1351));
            v1298 = v1352;
            v1299 = v1353;
        elseif v1297.kind.type == "open_marketplace_action" then
            local v1354 = v1297.kind.value:encode();
            local v1355, v1356 = v0.writeTag(v1298, v1299, 19, v0.wireTypes.lengthDelimited);
            v1355, v1356 = v0.writeBuffer(v1355, v1356, v1354, buffer.len(v1354));
            v1298 = v1355;
            v1299 = v1356;
        elseif v1297.kind.type == "hide_profile_completion_action" then
            local v1357 = v1297.kind.value:encode();
            local v1358, v1359 = v0.writeTag(v1298, v1299, 20, v0.wireTypes.lengthDelimited);
            v1358, v1359 = v0.writeBuffer(v1358, v1359, v1357, buffer.len(v1357));
            v1298 = v1358;
            v1299 = v1359;
        elseif v1297.kind.type == "select_marketplace_catalog_category" then
            local v1360 = v1297.kind.value:encode();
            local v1361, v1362 = v0.writeTag(v1298, v1299, 21, v0.wireTypes.lengthDelimited);
            v1361, v1362 = v0.writeBuffer(v1361, v1362, v1360, buffer.len(v1360));
            v1298 = v1361;
            v1299 = v1362;
        elseif v1297.kind.type == "select_marketplace_catalog_subcategory" then
            local v1363 = v1297.kind.value:encode();
            local v1364, v1365 = v0.writeTag(v1298, v1299, 22, v0.wireTypes.lengthDelimited);
            v1364, v1365 = v0.writeBuffer(v1364, v1365, v1363, buffer.len(v1363));
            v1298 = v1364;
            v1299 = v1365;
        elseif v1297.kind.type == "open_marketplace_catalog_see_all" then
            local v1366 = v1297.kind.value:encode();
            local v1367, v1368 = v0.writeTag(v1298, v1299, 23, v0.wireTypes.lengthDelimited);
            v1367, v1368 = v0.writeBuffer(v1367, v1368, v1366, buffer.len(v1366));
            v1298 = v1367;
            v1299 = v1368;
        elseif v1297.kind.type == "close_marketplace_category_tooltip" then
            local v1369 = v1297.kind.value:encode();
            local v1370, v1371 = v0.writeTag(v1298, v1299, 24, v0.wireTypes.lengthDelimited);
            v1370, v1371 = v0.writeBuffer(v1370, v1371, v1369, buffer.len(v1369));
            v1298 = v1370;
            v1299 = v1371;
        elseif v1297.kind.type == "resize_marketplace_catalog" then
            local v1372 = v1297.kind.value:encode();
            local v1373, v1374 = v0.writeTag(v1298, v1299, 25, v0.wireTypes.lengthDelimited);
            v1373, v1374 = v0.writeBuffer(v1373, v1374, v1372, buffer.len(v1372));
            v1298 = v1373;
            v1299 = v1374;
        elseif v1297.kind.type == "open_marketplace_catalog_filters" then
            local v1375 = v1297.kind.value:encode();
            local v1376, v1377 = v0.writeTag(v1298, v1299, 26, v0.wireTypes.lengthDelimited);
            v1376, v1377 = v0.writeBuffer(v1376, v1377, v1375, buffer.len(v1375));
            v1298 = v1376;
            v1299 = v1377;
        elseif v1297.kind.type == "open_social_link_action" then
            local v1378 = v1297.kind.value:encode();
            local v1379, v1380 = v0.writeTag(v1298, v1299, 27, v0.wireTypes.lengthDelimited);
            v1379, v1380 = v0.writeBuffer(v1379, v1380, v1378, buffer.len(v1378));
            v1298 = v1379;
            v1299 = v1380;
        end;
    end;
    local v1381 = buffer.create(v1299);
    buffer.copy(v1381, 0, v1298, 0, v1299);
    return v1381;
end;
v7.decode = function(v1382) --[[ Line: 9688 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_55 (copy), v0 (copy), v2 (copy)
    local v1383 = l_v7_55.new();
    local v1384 = 0;
    while v1384 < buffer.len(v1382) do
        local v1385 = nil;
        local v1386 = nil;
        local v1387, v1388, v1389 = v0.readTag(v1382, v1384);
        v1385 = v1387;
        v1386 = v1388;
        v1384 = v1389;
        if v1386 == v0.wireTypes.varint then
            v1387 = nil;
            v1388, v1389 = v0.readVarInt(v1382, v1384);
            v1387 = v1388;
            v1384 = v1389;
        elseif v1386 == v0.wireTypes.lengthDelimited then
            if v1385 == 1 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "dismiss_dialog_action", 
                    value = v2.DismissDialogAction.decode(v1387)
                };
            elseif v1385 == 2 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "link_action", 
                    value = v2.LinkAction.decode(v1387)
                };
            elseif v1385 == 3 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "open_game_details_action", 
                    value = v2.OpenGameDetailsAction.decode(v1387)
                };
            elseif v1385 == 4 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "open_join_friends_action", 
                    value = v2.OpenJoinFriendsAction.decode(v1387)
                };
            elseif v1385 == 5 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "open_marketplace_try_on_action", 
                    value = v2.OpenMarketplaceTryOnAction.decode(v1387)
                };
            elseif v1385 == 6 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "open_see_all_action", 
                    value = v2.OpenSeeAllAction.decode(v1387)
                };
            elseif v1385 == 7 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "open_sponsored_tooltip_action", 
                    value = v2.OpenSponsoredTooltipAction.decode(v1387)
                };
            elseif v1385 == 8 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "play_button_click_action", 
                    value = v2.PlayButtonClickAction.decode(v1387)
                };
            elseif v1385 == 9 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "update_user_settings_action", 
                    value = v2.UpdateUserSettingsAction.decode(v1387)
                };
            elseif v1385 == 10 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "open_tooltip_action", 
                    value = v2.OpenTooltipAction.decode(v1387)
                };
            elseif v1385 == 11 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "open_badge_details_action", 
                    value = v2.OpenBadgeDetailsAction.decode(v1387)
                };
            elseif v1385 == 12 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "load_more_from_api_action", 
                    value = v2.LoadMoreFromApiAction.decode(v1387)
                };
            elseif v1385 == 13 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "share_action", 
                    value = v2.ShareAction.decode(v1387)
                };
            elseif v1385 == 14 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "open_abuse_report_action", 
                    value = v2.OpenAbuseReportAction.decode(v1387)
                };
            elseif v1385 == 15 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "remove_badge_from_inventory_action", 
                    value = v2.RemoveBadgeFromInventoryAction.decode(v1387)
                };
            elseif v1385 == 16 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "open_profile_action", 
                    value = v2.OpenProfileAction.decode(v1387)
                };
            elseif v1385 == 17 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "open_facial_age_estimation_action", 
                    value = v2.OpenFacialAgeEstimationAction.decode(v1387)
                };
            elseif v1385 == 18 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "open_add_connections_page_action", 
                    value = v2.OpenAddConnectionsPageAction.decode(v1387)
                };
            elseif v1385 == 19 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "open_marketplace_action", 
                    value = v2.OpenMarketplaceAction.decode(v1387)
                };
            elseif v1385 == 20 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "hide_profile_completion_action", 
                    value = v2.HideProfileCompletionAction.decode(v1387)
                };
            elseif v1385 == 21 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "select_marketplace_catalog_category", 
                    value = v2.SelectMarketplaceCatalogCategory.decode(v1387)
                };
            elseif v1385 == 22 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "select_marketplace_catalog_subcategory", 
                    value = v2.SelectMarketplaceCatalogSubcategory.decode(v1387)
                };
            elseif v1385 == 23 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "open_marketplace_catalog_see_all", 
                    value = v2.OpenMarketplaceCatalogSeeAll.decode(v1387)
                };
            elseif v1385 == 24 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "close_marketplace_category_tooltip", 
                    value = v2.CloseMarketplaceCategoryTooltip.decode(v1387)
                };
            elseif v1385 == 25 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "resize_marketplace_catalog", 
                    value = v2.ResizeMarketplaceCatalog.decode(v1387)
                };
            elseif v1385 == 26 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "open_marketplace_catalog_filters", 
                    value = v2.OpenMarketplaceCatalogFilters.decode(v1387)
                };
            elseif v1385 == 27 then
                v1387 = nil;
                v1388, v1389 = v0.readBuffer(v1382, v1384);
                v1387 = v1388;
                v1384 = v1389;
                v1383.kind = {
                    type = "open_social_link_action", 
                    value = v2.OpenSocialLinkAction.decode(v1387)
                };
            else
                v1387 = nil;
                v1388, v1389 = v0.readVarInt(v1382, v1384);
                v1384 = v1389 + v1388;
            end;
        elseif v1386 == v0.wireTypes.i32 then
            v1387 = nil;
            v1388, v1389 = v0.readFixed32(v1382, v1384);
            v1387 = v1388;
            v1384 = v1389;
        elseif v1386 == v0.wireTypes.i64 then
            v1387 = nil;
            v1388, v1389 = v0.readFixed64(v1382, v1384);
            v1387 = v1388;
            v1384 = v1389;
        else
            error("Unsupported wire type: " .. v1386);
        end;
    end;
    return v1383;
end;
v7.jsonEncode = function(v1390) --[[ Line: 9906 ]] --[[ Name: jsonEncode ]]
    local v1391 = {};
    if v1390.kind ~= nil then
        if v1390.kind.type == "dismiss_dialog_action" then
            v1391.dismissDialogAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "link_action" then
            v1391.linkAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "open_game_details_action" then
            v1391.openGameDetailsAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "open_join_friends_action" then
            v1391.openJoinFriendsAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "open_marketplace_try_on_action" then
            v1391.openMarketplaceTryOnAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "open_see_all_action" then
            v1391.openSeeAllAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "open_sponsored_tooltip_action" then
            v1391.openSponsoredTooltipAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "play_button_click_action" then
            v1391.playButtonClickAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "update_user_settings_action" then
            v1391.updateUserSettingsAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "open_tooltip_action" then
            v1391.openTooltipAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "open_badge_details_action" then
            v1391.openBadgeDetailsAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "load_more_from_api_action" then
            v1391.loadMoreFromApiAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "share_action" then
            v1391.shareAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "open_abuse_report_action" then
            v1391.openAbuseReportAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "remove_badge_from_inventory_action" then
            v1391.removeBadgeFromInventoryAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "open_profile_action" then
            v1391.openProfileAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "open_facial_age_estimation_action" then
            v1391.openFacialAgeEstimationAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "open_add_connections_page_action" then
            v1391.openAddConnectionsPageAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "open_marketplace_action" then
            v1391.openMarketplaceAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "hide_profile_completion_action" then
            v1391.hideProfileCompletionAction = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "select_marketplace_catalog_category" then
            v1391.selectMarketplaceCatalogCategory = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "select_marketplace_catalog_subcategory" then
            v1391.selectMarketplaceCatalogSubcategory = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "open_marketplace_catalog_see_all" then
            v1391.openMarketplaceCatalogSeeAll = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "close_marketplace_category_tooltip" then
            v1391.closeMarketplaceCategoryTooltip = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "resize_marketplace_catalog" then
            v1391.resizeMarketplaceCatalog = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "open_marketplace_catalog_filters" then
            v1391.openMarketplaceCatalogFilters = v1390.kind.value:jsonEncode();
            return v1391;
        elseif v1390.kind.type == "open_social_link_action" then
            v1391.openSocialLinkAction = v1390.kind.value:jsonEncode();
        end;
    end;
    return v1391;
end;
v7.jsonDecode = function(v1392) --[[ Line: 9970 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_55 (copy), v2 (copy)
    local v1393 = l_v7_55.new();
    if v1392.dismiss_dialog_action ~= nil then
        v1393.kind = {
            type = "dismiss_dialog_action", 
            value = v2.DismissDialogAction.jsonDecode(v1392.dismiss_dialog_action)
        };
    end;
    if v1392.dismissDialogAction ~= nil then
        v1393.kind = {
            type = "dismiss_dialog_action", 
            value = v2.DismissDialogAction.jsonDecode(v1392.dismissDialogAction)
        };
    end;
    if v1392.link_action ~= nil then
        v1393.kind = {
            type = "link_action", 
            value = v2.LinkAction.jsonDecode(v1392.link_action)
        };
    end;
    if v1392.linkAction ~= nil then
        v1393.kind = {
            type = "link_action", 
            value = v2.LinkAction.jsonDecode(v1392.linkAction)
        };
    end;
    if v1392.open_game_details_action ~= nil then
        v1393.kind = {
            type = "open_game_details_action", 
            value = v2.OpenGameDetailsAction.jsonDecode(v1392.open_game_details_action)
        };
    end;
    if v1392.openGameDetailsAction ~= nil then
        v1393.kind = {
            type = "open_game_details_action", 
            value = v2.OpenGameDetailsAction.jsonDecode(v1392.openGameDetailsAction)
        };
    end;
    if v1392.open_join_friends_action ~= nil then
        v1393.kind = {
            type = "open_join_friends_action", 
            value = v2.OpenJoinFriendsAction.jsonDecode(v1392.open_join_friends_action)
        };
    end;
    if v1392.openJoinFriendsAction ~= nil then
        v1393.kind = {
            type = "open_join_friends_action", 
            value = v2.OpenJoinFriendsAction.jsonDecode(v1392.openJoinFriendsAction)
        };
    end;
    if v1392.open_marketplace_try_on_action ~= nil then
        v1393.kind = {
            type = "open_marketplace_try_on_action", 
            value = v2.OpenMarketplaceTryOnAction.jsonDecode(v1392.open_marketplace_try_on_action)
        };
    end;
    if v1392.openMarketplaceTryOnAction ~= nil then
        v1393.kind = {
            type = "open_marketplace_try_on_action", 
            value = v2.OpenMarketplaceTryOnAction.jsonDecode(v1392.openMarketplaceTryOnAction)
        };
    end;
    if v1392.open_see_all_action ~= nil then
        v1393.kind = {
            type = "open_see_all_action", 
            value = v2.OpenSeeAllAction.jsonDecode(v1392.open_see_all_action)
        };
    end;
    if v1392.openSeeAllAction ~= nil then
        v1393.kind = {
            type = "open_see_all_action", 
            value = v2.OpenSeeAllAction.jsonDecode(v1392.openSeeAllAction)
        };
    end;
    if v1392.open_sponsored_tooltip_action ~= nil then
        v1393.kind = {
            type = "open_sponsored_tooltip_action", 
            value = v2.OpenSponsoredTooltipAction.jsonDecode(v1392.open_sponsored_tooltip_action)
        };
    end;
    if v1392.openSponsoredTooltipAction ~= nil then
        v1393.kind = {
            type = "open_sponsored_tooltip_action", 
            value = v2.OpenSponsoredTooltipAction.jsonDecode(v1392.openSponsoredTooltipAction)
        };
    end;
    if v1392.play_button_click_action ~= nil then
        v1393.kind = {
            type = "play_button_click_action", 
            value = v2.PlayButtonClickAction.jsonDecode(v1392.play_button_click_action)
        };
    end;
    if v1392.playButtonClickAction ~= nil then
        v1393.kind = {
            type = "play_button_click_action", 
            value = v2.PlayButtonClickAction.jsonDecode(v1392.playButtonClickAction)
        };
    end;
    if v1392.update_user_settings_action ~= nil then
        v1393.kind = {
            type = "update_user_settings_action", 
            value = v2.UpdateUserSettingsAction.jsonDecode(v1392.update_user_settings_action)
        };
    end;
    if v1392.updateUserSettingsAction ~= nil then
        v1393.kind = {
            type = "update_user_settings_action", 
            value = v2.UpdateUserSettingsAction.jsonDecode(v1392.updateUserSettingsAction)
        };
    end;
    if v1392.open_tooltip_action ~= nil then
        v1393.kind = {
            type = "open_tooltip_action", 
            value = v2.OpenTooltipAction.jsonDecode(v1392.open_tooltip_action)
        };
    end;
    if v1392.openTooltipAction ~= nil then
        v1393.kind = {
            type = "open_tooltip_action", 
            value = v2.OpenTooltipAction.jsonDecode(v1392.openTooltipAction)
        };
    end;
    if v1392.open_badge_details_action ~= nil then
        v1393.kind = {
            type = "open_badge_details_action", 
            value = v2.OpenBadgeDetailsAction.jsonDecode(v1392.open_badge_details_action)
        };
    end;
    if v1392.openBadgeDetailsAction ~= nil then
        v1393.kind = {
            type = "open_badge_details_action", 
            value = v2.OpenBadgeDetailsAction.jsonDecode(v1392.openBadgeDetailsAction)
        };
    end;
    if v1392.load_more_from_api_action ~= nil then
        v1393.kind = {
            type = "load_more_from_api_action", 
            value = v2.LoadMoreFromApiAction.jsonDecode(v1392.load_more_from_api_action)
        };
    end;
    if v1392.loadMoreFromApiAction ~= nil then
        v1393.kind = {
            type = "load_more_from_api_action", 
            value = v2.LoadMoreFromApiAction.jsonDecode(v1392.loadMoreFromApiAction)
        };
    end;
    if v1392.share_action ~= nil then
        v1393.kind = {
            type = "share_action", 
            value = v2.ShareAction.jsonDecode(v1392.share_action)
        };
    end;
    if v1392.shareAction ~= nil then
        v1393.kind = {
            type = "share_action", 
            value = v2.ShareAction.jsonDecode(v1392.shareAction)
        };
    end;
    if v1392.open_abuse_report_action ~= nil then
        v1393.kind = {
            type = "open_abuse_report_action", 
            value = v2.OpenAbuseReportAction.jsonDecode(v1392.open_abuse_report_action)
        };
    end;
    if v1392.openAbuseReportAction ~= nil then
        v1393.kind = {
            type = "open_abuse_report_action", 
            value = v2.OpenAbuseReportAction.jsonDecode(v1392.openAbuseReportAction)
        };
    end;
    if v1392.remove_badge_from_inventory_action ~= nil then
        v1393.kind = {
            type = "remove_badge_from_inventory_action", 
            value = v2.RemoveBadgeFromInventoryAction.jsonDecode(v1392.remove_badge_from_inventory_action)
        };
    end;
    if v1392.removeBadgeFromInventoryAction ~= nil then
        v1393.kind = {
            type = "remove_badge_from_inventory_action", 
            value = v2.RemoveBadgeFromInventoryAction.jsonDecode(v1392.removeBadgeFromInventoryAction)
        };
    end;
    if v1392.open_profile_action ~= nil then
        v1393.kind = {
            type = "open_profile_action", 
            value = v2.OpenProfileAction.jsonDecode(v1392.open_profile_action)
        };
    end;
    if v1392.openProfileAction ~= nil then
        v1393.kind = {
            type = "open_profile_action", 
            value = v2.OpenProfileAction.jsonDecode(v1392.openProfileAction)
        };
    end;
    if v1392.open_facial_age_estimation_action ~= nil then
        v1393.kind = {
            type = "open_facial_age_estimation_action", 
            value = v2.OpenFacialAgeEstimationAction.jsonDecode(v1392.open_facial_age_estimation_action)
        };
    end;
    if v1392.openFacialAgeEstimationAction ~= nil then
        v1393.kind = {
            type = "open_facial_age_estimation_action", 
            value = v2.OpenFacialAgeEstimationAction.jsonDecode(v1392.openFacialAgeEstimationAction)
        };
    end;
    if v1392.open_add_connections_page_action ~= nil then
        v1393.kind = {
            type = "open_add_connections_page_action", 
            value = v2.OpenAddConnectionsPageAction.jsonDecode(v1392.open_add_connections_page_action)
        };
    end;
    if v1392.openAddConnectionsPageAction ~= nil then
        v1393.kind = {
            type = "open_add_connections_page_action", 
            value = v2.OpenAddConnectionsPageAction.jsonDecode(v1392.openAddConnectionsPageAction)
        };
    end;
    if v1392.open_marketplace_action ~= nil then
        v1393.kind = {
            type = "open_marketplace_action", 
            value = v2.OpenMarketplaceAction.jsonDecode(v1392.open_marketplace_action)
        };
    end;
    if v1392.openMarketplaceAction ~= nil then
        v1393.kind = {
            type = "open_marketplace_action", 
            value = v2.OpenMarketplaceAction.jsonDecode(v1392.openMarketplaceAction)
        };
    end;
    if v1392.hide_profile_completion_action ~= nil then
        v1393.kind = {
            type = "hide_profile_completion_action", 
            value = v2.HideProfileCompletionAction.jsonDecode(v1392.hide_profile_completion_action)
        };
    end;
    if v1392.hideProfileCompletionAction ~= nil then
        v1393.kind = {
            type = "hide_profile_completion_action", 
            value = v2.HideProfileCompletionAction.jsonDecode(v1392.hideProfileCompletionAction)
        };
    end;
    if v1392.select_marketplace_catalog_category ~= nil then
        v1393.kind = {
            type = "select_marketplace_catalog_category", 
            value = v2.SelectMarketplaceCatalogCategory.jsonDecode(v1392.select_marketplace_catalog_category)
        };
    end;
    if v1392.selectMarketplaceCatalogCategory ~= nil then
        v1393.kind = {
            type = "select_marketplace_catalog_category", 
            value = v2.SelectMarketplaceCatalogCategory.jsonDecode(v1392.selectMarketplaceCatalogCategory)
        };
    end;
    if v1392.select_marketplace_catalog_subcategory ~= nil then
        v1393.kind = {
            type = "select_marketplace_catalog_subcategory", 
            value = v2.SelectMarketplaceCatalogSubcategory.jsonDecode(v1392.select_marketplace_catalog_subcategory)
        };
    end;
    if v1392.selectMarketplaceCatalogSubcategory ~= nil then
        v1393.kind = {
            type = "select_marketplace_catalog_subcategory", 
            value = v2.SelectMarketplaceCatalogSubcategory.jsonDecode(v1392.selectMarketplaceCatalogSubcategory)
        };
    end;
    if v1392.open_marketplace_catalog_see_all ~= nil then
        v1393.kind = {
            type = "open_marketplace_catalog_see_all", 
            value = v2.OpenMarketplaceCatalogSeeAll.jsonDecode(v1392.open_marketplace_catalog_see_all)
        };
    end;
    if v1392.openMarketplaceCatalogSeeAll ~= nil then
        v1393.kind = {
            type = "open_marketplace_catalog_see_all", 
            value = v2.OpenMarketplaceCatalogSeeAll.jsonDecode(v1392.openMarketplaceCatalogSeeAll)
        };
    end;
    if v1392.close_marketplace_category_tooltip ~= nil then
        v1393.kind = {
            type = "close_marketplace_category_tooltip", 
            value = v2.CloseMarketplaceCategoryTooltip.jsonDecode(v1392.close_marketplace_category_tooltip)
        };
    end;
    if v1392.closeMarketplaceCategoryTooltip ~= nil then
        v1393.kind = {
            type = "close_marketplace_category_tooltip", 
            value = v2.CloseMarketplaceCategoryTooltip.jsonDecode(v1392.closeMarketplaceCategoryTooltip)
        };
    end;
    if v1392.resize_marketplace_catalog ~= nil then
        v1393.kind = {
            type = "resize_marketplace_catalog", 
            value = v2.ResizeMarketplaceCatalog.jsonDecode(v1392.resize_marketplace_catalog)
        };
    end;
    if v1392.resizeMarketplaceCatalog ~= nil then
        v1393.kind = {
            type = "resize_marketplace_catalog", 
            value = v2.ResizeMarketplaceCatalog.jsonDecode(v1392.resizeMarketplaceCatalog)
        };
    end;
    if v1392.open_marketplace_catalog_filters ~= nil then
        v1393.kind = {
            type = "open_marketplace_catalog_filters", 
            value = v2.OpenMarketplaceCatalogFilters.jsonDecode(v1392.open_marketplace_catalog_filters)
        };
    end;
    if v1392.openMarketplaceCatalogFilters ~= nil then
        v1393.kind = {
            type = "open_marketplace_catalog_filters", 
            value = v2.OpenMarketplaceCatalogFilters.jsonDecode(v1392.openMarketplaceCatalogFilters)
        };
    end;
    if v1392.open_social_link_action ~= nil then
        v1393.kind = {
            type = "open_social_link_action", 
            value = v2.OpenSocialLinkAction.jsonDecode(v1392.open_social_link_action)
        };
    end;
    if v1392.openSocialLinkAction ~= nil then
        v1393.kind = {
            type = "open_social_link_action", 
            value = v2.OpenSocialLinkAction.jsonDecode(v1392.openSocialLinkAction)
        };
    end;
    return v1393;
end;
v7.descriptor = {
    name = "Action", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Action"
};
v2.Action = v7;
v1.default:register(v2.Action);
v7 = {};
v7.__index = v7;
local l_v7_56 = v7 --[[ copy: 7 -> 64 ]];
v7.new = function(v1395) --[[ Line: 10354 ]] --[[ Name: new ]]
    -- upvalues: l_v7_56 (copy)
    return (setmetatable({
        kind = if not (v1395 ~= nil) or v1395.kind == nil then nil else v1395.kind
    }, l_v7_56));
end;
v7.encode = function(v1396) --[[ Line: 10360 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1397 = buffer.create(0);
    local v1398 = 0;
    if v1396.kind ~= nil then
        if v1396.kind.type == "value" then
            local v1399 = v1396.kind.value:encode();
            local v1400, v1401 = v0.writeTag(v1397, v1398, 1, v0.wireTypes.lengthDelimited);
            v1400, v1401 = v0.writeBuffer(v1400, v1401, v1399, buffer.len(v1399));
            v1397 = v1400;
            v1398 = v1401;
        elseif v1396.kind.type == "conditional" then
            local v1402 = v1396.kind.value:encode();
            local v1403, v1404 = v0.writeTag(v1397, v1398, 2, v0.wireTypes.lengthDelimited);
            v1403, v1404 = v0.writeBuffer(v1403, v1404, v1402, buffer.len(v1402));
            v1397 = v1403;
            v1398 = v1404;
        end;
    end;
    local v1405 = buffer.create(v1398);
    buffer.copy(v1405, 0, v1397, 0, v1398);
    return v1405;
end;
v7.decode = function(v1406) --[[ Line: 10381 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_56 (copy), v0 (copy), v2 (copy)
    local v1407 = l_v7_56.new();
    local v1408 = 0;
    while v1408 < buffer.len(v1406) do
        local v1409 = nil;
        local v1410 = nil;
        local v1411, v1412, v1413 = v0.readTag(v1406, v1408);
        v1409 = v1411;
        v1410 = v1412;
        v1408 = v1413;
        if v1410 == v0.wireTypes.varint then
            v1411 = nil;
            v1412, v1413 = v0.readVarInt(v1406, v1408);
            v1411 = v1412;
            v1408 = v1413;
        elseif v1410 == v0.wireTypes.lengthDelimited then
            if v1409 == 1 then
                v1411 = nil;
                v1412, v1413 = v0.readBuffer(v1406, v1408);
                v1411 = v1412;
                v1408 = v1413;
                v1407.kind = {
                    type = "value", 
                    value = v2.Action.decode(v1411)
                };
            elseif v1409 == 2 then
                v1411 = nil;
                v1412, v1413 = v0.readBuffer(v1406, v1408);
                v1411 = v1412;
                v1408 = v1413;
                v1407.kind = {
                    type = "conditional", 
                    value = v2.ActionProp_ConditionalOptions.decode(v1411)
                };
            else
                v1411 = nil;
                v1412, v1413 = v0.readVarInt(v1406, v1408);
                v1408 = v1413 + v1412;
            end;
        elseif v1410 == v0.wireTypes.i32 then
            v1411 = nil;
            v1412, v1413 = v0.readFixed32(v1406, v1408);
            v1411 = v1412;
            v1408 = v1413;
        elseif v1410 == v0.wireTypes.i64 then
            v1411 = nil;
            v1412, v1413 = v0.readFixed64(v1406, v1408);
            v1411 = v1412;
            v1408 = v1413;
        else
            error("Unsupported wire type: " .. v1410);
        end;
    end;
    return v1407;
end;
v7.jsonEncode = function(v1414) --[[ Line: 10429 ]] --[[ Name: jsonEncode ]]
    local v1415 = {};
    if v1414.kind ~= nil then
        if v1414.kind.type == "value" then
            v1415.value = v1414.kind.value:jsonEncode();
            return v1415;
        elseif v1414.kind.type == "conditional" then
            v1415.conditional = v1414.kind.value:jsonEncode();
        end;
    end;
    return v1415;
end;
v7.jsonDecode = function(v1416) --[[ Line: 10443 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_56 (copy), v2 (copy)
    local v1417 = l_v7_56.new();
    if v1416.value ~= nil then
        v1417.kind = {
            type = "value", 
            value = v2.Action.jsonDecode(v1416.value)
        };
    end;
    if v1416.conditional ~= nil then
        v1417.kind = {
            type = "conditional", 
            value = v2.ActionProp_ConditionalOptions.jsonDecode(v1416.conditional)
        };
    end;
    return v1417;
end;
v7.descriptor = {
    name = "ActionProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ActionProp"
};
v2.ActionProp = v7;
v1.default:register(v2.ActionProp);
v7 = {};
v7.__index = v7;
local l_v7_57 = v7 --[[ copy: 7 -> 65 ]];
v7.new = function(v1419) --[[ Line: 10472 ]] --[[ Name: new ]]
    -- upvalues: l_v7_57 (copy)
    return (setmetatable({
        condition = if not (v1419 ~= nil) or v1419.condition == nil then nil else v1419.condition, 
        value = if not (v1419 ~= nil) or v1419.value == nil then nil else v1419.value
    }, l_v7_57));
end;
v7.encode = function(v1420) --[[ Line: 10481 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1421 = buffer.create(0);
    local v1422 = 0;
    if v1420.condition ~= nil then
        local v1423 = v1420.condition:encode();
        local v1424, v1425 = v0.writeTag(v1421, v1422, 1, v0.wireTypes.lengthDelimited);
        v1424, v1425 = v0.writeBuffer(v1424, v1425, v1423, buffer.len(v1423));
        v1421 = v1424;
        v1422 = v1425;
    end;
    if v1420.value ~= nil then
        local v1426 = v1420.value:encode();
        local v1427, v1428 = v0.writeTag(v1421, v1422, 2, v0.wireTypes.lengthDelimited);
        v1427, v1428 = v0.writeBuffer(v1427, v1428, v1426, buffer.len(v1426));
        v1421 = v1427;
        v1422 = v1428;
    end;
    local v1429 = buffer.create(v1422);
    buffer.copy(v1429, 0, v1421, 0, v1422);
    return v1429;
end;
v7.decode = function(v1430) --[[ Line: 10502 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_57 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v1431 = l_v7_57.new();
    local v1432 = 0;
    while v1432 < buffer.len(v1430) do
        local v1433 = nil;
        local v1434 = nil;
        local v1435, v1436, v1437 = v0.readTag(v1430, v1432);
        v1433 = v1435;
        v1434 = v1436;
        v1432 = v1437;
        if v1434 == v0.wireTypes.varint then
            v1435 = nil;
            v1436, v1437 = v0.readVarInt(v1430, v1432);
            v1435 = v1436;
            v1432 = v1437;
        elseif v1434 == v0.wireTypes.lengthDelimited then
            if v1433 == 1 then
                v1435 = nil;
                v1436, v1437 = v0.readBuffer(v1430, v1432);
                v1435 = v1436;
                v1432 = v1437;
                v1431.condition = v4.PropCondition.decode(v1435);
            elseif v1433 == 2 then
                v1435 = nil;
                v1436, v1437 = v0.readBuffer(v1430, v1432);
                v1435 = v1436;
                v1432 = v1437;
                v1431.value = v2.Action.decode(v1435);
            else
                v1435 = nil;
                v1436, v1437 = v0.readVarInt(v1430, v1432);
                v1432 = v1437 + v1436;
            end;
        elseif v1434 == v0.wireTypes.i32 then
            v1435 = nil;
            v1436, v1437 = v0.readFixed32(v1430, v1432);
            v1435 = v1436;
            v1432 = v1437;
        elseif v1434 == v0.wireTypes.i64 then
            v1435 = nil;
            v1436, v1437 = v0.readFixed64(v1430, v1432);
            v1435 = v1436;
            v1432 = v1437;
        else
            error("Unsupported wire type: " .. v1434);
        end;
    end;
    return v1431;
end;
v7.jsonEncode = function(v1438) --[[ Line: 10550 ]] --[[ Name: jsonEncode ]]
    local v1439 = {};
    if v1438.condition ~= nil then
        v1439.condition = v1438.condition:jsonEncode();
    end;
    if v1438.value ~= nil then
        v1439.value = v1438.value:jsonEncode();
    end;
    return v1439;
end;
v7.jsonDecode = function(v1440) --[[ Line: 10564 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_57 (copy), v4 (copy), v2 (copy)
    local v1441 = l_v7_57.new();
    if v1440.condition ~= nil then
        v1441.condition = v4.PropCondition.jsonDecode(v1440.condition);
    end;
    if v1440.value ~= nil then
        v1441.value = v2.Action.jsonDecode(v1440.value);
    end;
    return v1441;
end;
v7.descriptor = {
    name = "ActionProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ActionProp_ConditionalOption = v7;
v1.default:register(v2.ActionProp_ConditionalOption);
v7 = {};
v7.__index = v7;
local l_v7_58 = v7 --[[ copy: 7 -> 66 ]];
v7.new = function(v1443) --[[ Line: 10593 ]] --[[ Name: new ]]
    -- upvalues: l_v7_58 (copy)
    return (setmetatable({
        options = if not (v1443 ~= nil) or v1443.options == nil then {} else v1443.options
    }, l_v7_58));
end;
v7.encode = function(v1444) --[[ Line: 10601 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1445 = buffer.create(0);
    local v1446 = 0;
    if v1444.options ~= nil and #v1444.options > 0 then
        for _, v1448 in v1444.options do
            local v1449 = v1448:encode();
            local v1450, v1451 = v0.writeTag(v1445, v1446, 1, v0.wireTypes.lengthDelimited);
            v1450, v1451 = v0.writeBuffer(v1450, v1451, v1449, buffer.len(v1449));
            v1445 = v1450;
            v1446 = v1451;
        end;
    end;
    local v1452 = buffer.create(v1446);
    buffer.copy(v1452, 0, v1445, 0, v1446);
    return v1452;
end;
v7.decode = function(v1453) --[[ Line: 10618 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_58 (copy), v0 (copy), v2 (copy)
    local v1454 = l_v7_58.new();
    local v1455 = 0;
    while v1455 < buffer.len(v1453) do
        local v1456 = nil;
        local v1457 = nil;
        local v1458, v1459, v1460 = v0.readTag(v1453, v1455);
        v1456 = v1458;
        v1457 = v1459;
        v1455 = v1460;
        if v1457 == v0.wireTypes.varint then
            v1458 = nil;
            v1459, v1460 = v0.readVarInt(v1453, v1455);
            v1458 = v1459;
            v1455 = v1460;
        elseif v1457 == v0.wireTypes.lengthDelimited then
            if v1456 == 1 then
                v1458 = nil;
                v1459, v1460 = v0.readBuffer(v1453, v1455);
                v1458 = v1459;
                v1455 = v1460;
                table.insert(v1454.options, v2.ActionProp_ConditionalOption.decode(v1458));
            else
                v1458 = nil;
                v1459, v1460 = v0.readVarInt(v1453, v1455);
                v1455 = v1460 + v1459;
            end;
        elseif v1457 == v0.wireTypes.i32 then
            v1458 = nil;
            v1459, v1460 = v0.readFixed32(v1453, v1455);
            v1458 = v1459;
            v1455 = v1460;
        elseif v1457 == v0.wireTypes.i64 then
            v1458 = nil;
            v1459, v1460 = v0.readFixed64(v1453, v1455);
            v1458 = v1459;
            v1455 = v1460;
        else
            error("Unsupported wire type: " .. v1457);
        end;
    end;
    return v1454;
end;
v7.jsonEncode = function(v1461) --[[ Line: 10661 ]] --[[ Name: jsonEncode ]]
    local v1462 = {};
    if v1461.options ~= nil and #v1461.options > 0 then
        local v1463 = {};
        for _, v1465 in v1461.options do
            table.insert(v1463, v1465:jsonEncode());
        end;
        v1462.options = v1463;
    end;
    return v1462;
end;
v7.jsonDecode = function(v1466) --[[ Line: 10675 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_58 (copy), v2 (copy)
    local v1467 = l_v7_58.new();
    if v1466.options ~= nil then
        local v1468 = {};
        for _, v1470 in v1466.options do
            table.insert(v1468, v2.ActionProp_ConditionalOption.jsonDecode(v1470));
        end;
        v1467.options = v1468;
    end;
    return v1467;
end;
v7.descriptor = {
    name = "ActionProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ActionProp_ConditionalOptions = v7;
v1.default:register(v2.ActionProp_ConditionalOptions);
v7 = {};
v7.__index = v7;
local l_v7_59 = v7 --[[ copy: 7 -> 67 ]];
v7.new = function(v1472) --[[ Line: 10704 ]] --[[ Name: new ]]
    -- upvalues: l_v7_59 (copy)
    return (setmetatable({
        kind = if not (v1472 ~= nil) or v1472.kind == nil then nil else v1472.kind
    }, l_v7_59));
end;
v7.encode = function(v1473) --[[ Line: 10710 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1474 = buffer.create(0);
    local v1475 = 0;
    if v1473.kind ~= nil then
        if v1473.kind.type == "value" then
            local v1476 = v1473.kind.value:encode();
            local v1477, v1478 = v0.writeTag(v1474, v1475, 1, v0.wireTypes.lengthDelimited);
            v1477, v1478 = v0.writeBuffer(v1477, v1478, v1476, buffer.len(v1476));
            v1474 = v1477;
            v1475 = v1478;
        elseif v1473.kind.type == "conditional" then
            local v1479 = v1473.kind.value:encode();
            local v1480, v1481 = v0.writeTag(v1474, v1475, 2, v0.wireTypes.lengthDelimited);
            v1480, v1481 = v0.writeBuffer(v1480, v1481, v1479, buffer.len(v1479));
            v1474 = v1480;
            v1475 = v1481;
        end;
    end;
    local v1482 = buffer.create(v1475);
    buffer.copy(v1482, 0, v1474, 0, v1475);
    return v1482;
end;
v7.decode = function(v1483) --[[ Line: 10731 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_59 (copy), v0 (copy), v2 (copy)
    local v1484 = l_v7_59.new();
    local v1485 = 0;
    while v1485 < buffer.len(v1483) do
        local v1486 = nil;
        local v1487 = nil;
        local v1488, v1489, v1490 = v0.readTag(v1483, v1485);
        v1486 = v1488;
        v1487 = v1489;
        v1485 = v1490;
        if v1487 == v0.wireTypes.varint then
            v1488 = nil;
            v1489, v1490 = v0.readVarInt(v1483, v1485);
            v1488 = v1489;
            v1485 = v1490;
        elseif v1487 == v0.wireTypes.lengthDelimited then
            if v1486 == 1 then
                v1488 = nil;
                v1489, v1490 = v0.readBuffer(v1483, v1485);
                v1488 = v1489;
                v1485 = v1490;
                v1484.kind = {
                    type = "value", 
                    value = v2.FocusNavActionsProp_FocusNavData.decode(v1488)
                };
            elseif v1486 == 2 then
                v1488 = nil;
                v1489, v1490 = v0.readBuffer(v1483, v1485);
                v1488 = v1489;
                v1485 = v1490;
                v1484.kind = {
                    type = "conditional", 
                    value = v2.FocusNavActionsProp_ConditionalOptions.decode(v1488)
                };
            else
                v1488 = nil;
                v1489, v1490 = v0.readVarInt(v1483, v1485);
                v1485 = v1490 + v1489;
            end;
        elseif v1487 == v0.wireTypes.i32 then
            v1488 = nil;
            v1489, v1490 = v0.readFixed32(v1483, v1485);
            v1488 = v1489;
            v1485 = v1490;
        elseif v1487 == v0.wireTypes.i64 then
            v1488 = nil;
            v1489, v1490 = v0.readFixed64(v1483, v1485);
            v1488 = v1489;
            v1485 = v1490;
        else
            error("Unsupported wire type: " .. v1487);
        end;
    end;
    return v1484;
end;
v7.jsonEncode = function(v1491) --[[ Line: 10780 ]] --[[ Name: jsonEncode ]]
    local v1492 = {};
    if v1491.kind ~= nil then
        if v1491.kind.type == "value" then
            v1492.value = v1491.kind.value:jsonEncode();
            return v1492;
        elseif v1491.kind.type == "conditional" then
            v1492.conditional = v1491.kind.value:jsonEncode();
        end;
    end;
    return v1492;
end;
v7.jsonDecode = function(v1493) --[[ Line: 10794 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_59 (copy), v2 (copy)
    local v1494 = l_v7_59.new();
    if v1493.value ~= nil then
        v1494.kind = {
            type = "value", 
            value = v2.FocusNavActionsProp_FocusNavData.jsonDecode(v1493.value)
        };
    end;
    if v1493.conditional ~= nil then
        v1494.kind = {
            type = "conditional", 
            value = v2.FocusNavActionsProp_ConditionalOptions.jsonDecode(v1493.conditional)
        };
    end;
    return v1494;
end;
v7.descriptor = {
    name = "FocusNavActionsProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavActionsProp"
};
v2.FocusNavActionsProp = v7;
v1.default:register(v2.FocusNavActionsProp);
v7 = {};
v7.__index = v7;
local l_v7_60 = v7 --[[ copy: 7 -> 68 ]];
v7.new = function(v1496) --[[ Line: 10825 ]] --[[ Name: new ]]
    -- upvalues: l_v7_60 (copy)
    return (setmetatable({
        condition = if not (v1496 ~= nil) or v1496.condition == nil then nil else v1496.condition, 
        value = if not (v1496 ~= nil) or v1496.value == nil then nil else v1496.value
    }, l_v7_60));
end;
v7.encode = function(v1497) --[[ Line: 10834 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1498 = buffer.create(0);
    local v1499 = 0;
    if v1497.condition ~= nil then
        local v1500 = v1497.condition:encode();
        local v1501, v1502 = v0.writeTag(v1498, v1499, 1, v0.wireTypes.lengthDelimited);
        v1501, v1502 = v0.writeBuffer(v1501, v1502, v1500, buffer.len(v1500));
        v1498 = v1501;
        v1499 = v1502;
    end;
    if v1497.value ~= nil then
        local v1503 = v1497.value:encode();
        local v1504, v1505 = v0.writeTag(v1498, v1499, 2, v0.wireTypes.lengthDelimited);
        v1504, v1505 = v0.writeBuffer(v1504, v1505, v1503, buffer.len(v1503));
        v1498 = v1504;
        v1499 = v1505;
    end;
    local v1506 = buffer.create(v1499);
    buffer.copy(v1506, 0, v1498, 0, v1499);
    return v1506;
end;
v7.decode = function(v1507) --[[ Line: 10855 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_60 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v1508 = l_v7_60.new();
    local v1509 = 0;
    while v1509 < buffer.len(v1507) do
        local v1510 = nil;
        local v1511 = nil;
        local v1512, v1513, v1514 = v0.readTag(v1507, v1509);
        v1510 = v1512;
        v1511 = v1513;
        v1509 = v1514;
        if v1511 == v0.wireTypes.varint then
            v1512 = nil;
            v1513, v1514 = v0.readVarInt(v1507, v1509);
            v1512 = v1513;
            v1509 = v1514;
        elseif v1511 == v0.wireTypes.lengthDelimited then
            if v1510 == 1 then
                v1512 = nil;
                v1513, v1514 = v0.readBuffer(v1507, v1509);
                v1512 = v1513;
                v1509 = v1514;
                v1508.condition = v4.PropCondition.decode(v1512);
            elseif v1510 == 2 then
                v1512 = nil;
                v1513, v1514 = v0.readBuffer(v1507, v1509);
                v1512 = v1513;
                v1509 = v1514;
                v1508.value = v2.FocusNavActionsProp.decode(v1512);
            else
                v1512 = nil;
                v1513, v1514 = v0.readVarInt(v1507, v1509);
                v1509 = v1514 + v1513;
            end;
        elseif v1511 == v0.wireTypes.i32 then
            v1512 = nil;
            v1513, v1514 = v0.readFixed32(v1507, v1509);
            v1512 = v1513;
            v1509 = v1514;
        elseif v1511 == v0.wireTypes.i64 then
            v1512 = nil;
            v1513, v1514 = v0.readFixed64(v1507, v1509);
            v1512 = v1513;
            v1509 = v1514;
        else
            error("Unsupported wire type: " .. v1511);
        end;
    end;
    return v1508;
end;
v7.jsonEncode = function(v1515) --[[ Line: 10903 ]] --[[ Name: jsonEncode ]]
    local v1516 = {};
    if v1515.condition ~= nil then
        v1516.condition = v1515.condition:jsonEncode();
    end;
    if v1515.value ~= nil then
        v1516.value = v1515.value:jsonEncode();
    end;
    return v1516;
end;
v7.jsonDecode = function(v1517) --[[ Line: 10917 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_60 (copy), v4 (copy), v2 (copy)
    local v1518 = l_v7_60.new();
    if v1517.condition ~= nil then
        v1518.condition = v4.PropCondition.jsonDecode(v1517.condition);
    end;
    if v1517.value ~= nil then
        v1518.value = v2.FocusNavActionsProp.jsonDecode(v1517.value);
    end;
    return v1518;
end;
v7.descriptor = {
    name = "FocusNavActionsProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.FocusNavActionsProp_ConditionalOption = v7;
v1.default:register(v2.FocusNavActionsProp_ConditionalOption);
v7 = {};
v7.__index = v7;
local l_v7_61 = v7 --[[ copy: 7 -> 69 ]];
v7.new = function(v1520) --[[ Line: 10948 ]] --[[ Name: new ]]
    -- upvalues: l_v7_61 (copy)
    return (setmetatable({
        options = if not (v1520 ~= nil) or v1520.options == nil then {} else v1520.options
    }, l_v7_61));
end;
v7.encode = function(v1521) --[[ Line: 10956 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1522 = buffer.create(0);
    local v1523 = 0;
    if v1521.options ~= nil and #v1521.options > 0 then
        for _, v1525 in v1521.options do
            local v1526 = v1525:encode();
            local v1527, v1528 = v0.writeTag(v1522, v1523, 1, v0.wireTypes.lengthDelimited);
            v1527, v1528 = v0.writeBuffer(v1527, v1528, v1526, buffer.len(v1526));
            v1522 = v1527;
            v1523 = v1528;
        end;
    end;
    local v1529 = buffer.create(v1523);
    buffer.copy(v1529, 0, v1522, 0, v1523);
    return v1529;
end;
v7.decode = function(v1530) --[[ Line: 10973 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_61 (copy), v0 (copy), v2 (copy)
    local v1531 = l_v7_61.new();
    local v1532 = 0;
    while v1532 < buffer.len(v1530) do
        local v1533 = nil;
        local v1534 = nil;
        local v1535, v1536, v1537 = v0.readTag(v1530, v1532);
        v1533 = v1535;
        v1534 = v1536;
        v1532 = v1537;
        if v1534 == v0.wireTypes.varint then
            v1535 = nil;
            v1536, v1537 = v0.readVarInt(v1530, v1532);
            v1535 = v1536;
            v1532 = v1537;
        elseif v1534 == v0.wireTypes.lengthDelimited then
            if v1533 == 1 then
                v1535 = nil;
                v1536, v1537 = v0.readBuffer(v1530, v1532);
                v1535 = v1536;
                v1532 = v1537;
                table.insert(v1531.options, v2.FocusNavActionsProp_ConditionalOption.decode(v1535));
            else
                v1535 = nil;
                v1536, v1537 = v0.readVarInt(v1530, v1532);
                v1532 = v1537 + v1536;
            end;
        elseif v1534 == v0.wireTypes.i32 then
            v1535 = nil;
            v1536, v1537 = v0.readFixed32(v1530, v1532);
            v1535 = v1536;
            v1532 = v1537;
        elseif v1534 == v0.wireTypes.i64 then
            v1535 = nil;
            v1536, v1537 = v0.readFixed64(v1530, v1532);
            v1535 = v1536;
            v1532 = v1537;
        else
            error("Unsupported wire type: " .. v1534);
        end;
    end;
    return v1531;
end;
v7.jsonEncode = function(v1538) --[[ Line: 11016 ]] --[[ Name: jsonEncode ]]
    local v1539 = {};
    if v1538.options ~= nil and #v1538.options > 0 then
        local v1540 = {};
        for _, v1542 in v1538.options do
            table.insert(v1540, v1542:jsonEncode());
        end;
        v1539.options = v1540;
    end;
    return v1539;
end;
v7.jsonDecode = function(v1543) --[[ Line: 11030 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_61 (copy), v2 (copy)
    local v1544 = l_v7_61.new();
    if v1543.options ~= nil then
        local v1545 = {};
        for _, v1547 in v1543.options do
            table.insert(v1545, v2.FocusNavActionsProp_ConditionalOption.jsonDecode(v1547));
        end;
        v1544.options = v1545;
    end;
    return v1544;
end;
v7.descriptor = {
    name = "FocusNavActionsProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.FocusNavActionsProp_ConditionalOptions = v7;
v1.default:register(v2.FocusNavActionsProp_ConditionalOptions);
v7 = {};
v7.__index = v7;
local l_v7_62 = v7 --[[ copy: 7 -> 70 ]];
v7.new = function(v1549) --[[ Line: 11061 ]] --[[ Name: new ]]
    -- upvalues: l_v7_62 (copy)
    return (setmetatable({
        keys = if not (v1549 ~= nil) or v1549.keys == nil then {} else v1549.keys, 
        events = if not (v1549 ~= nil) or v1549.events == nil then {} else v1549.events
    }, l_v7_62));
end;
v7.encode = function(v1550) --[[ Line: 11070 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1551 = buffer.create(0);
    local v1552 = 0;
    if v1550.keys ~= nil and next(v1550.keys) ~= nil then
        for v1553, v1554 in v1550.keys do
            local v1555 = buffer.create(0);
            local v1556, v1557 = v0.writeTag(v1555, 0, 1, v0.wireTypes.lengthDelimited);
            v1556, v1557 = v0.writeString(v1556, v1557, v1553);
            v1556, v1557 = v0.writeTag(v1556, v1557, 2, v0.wireTypes.lengthDelimited);
            v1556, v1557 = v0.writeString(v1556, v1557, v1554);
            v1555 = v1556;
            local l_v1557_0 = v1557;
            v1556, v1557 = v0.writeTag(v1551, v1552, 1, v0.wireTypes.lengthDelimited);
            v1556, v1557 = v0.writeBuffer(v1556, v1557, v1555, l_v1557_0);
            v1551 = v1556;
            v1552 = v1557;
        end;
    end;
    if v1550.events ~= nil and next(v1550.events) ~= nil then
        for v1559, v1560 in v1550.events do
            local v1561 = buffer.create(0);
            local v1562, v1563 = v0.writeTag(v1561, 0, 1, v0.wireTypes.lengthDelimited);
            v1562, v1563 = v0.writeString(v1562, v1563, v1559);
            v1561 = v1562;
            local l_v1563_0 = v1563;
            v1562 = v1560:encode();
            local v1565;
            v1563, v1565 = v0.writeTag(v1561, l_v1563_0, 2, v0.wireTypes.lengthDelimited);
            v1563, v1565 = v0.writeBuffer(v1563, v1565, v1562, buffer.len(v1562));
            v1561 = v1563;
            l_v1563_0 = v1565;
            v1563, v1565 = v0.writeTag(v1551, v1552, 2, v0.wireTypes.lengthDelimited);
            v1563, v1565 = v0.writeBuffer(v1563, v1565, v1561, l_v1563_0);
            v1551 = v1563;
            v1552 = v1565;
        end;
    end;
    local v1566 = buffer.create(v1552);
    buffer.copy(v1566, 0, v1551, 0, v1552);
    return v1566;
end;
v7.decode = function(v1567) --[[ Line: 11106 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_62 (copy), v0 (copy), v2 (copy), v3 (copy)
    local v1568 = l_v7_62.new();
    local v1569 = 0;
    while v1569 < buffer.len(v1567) do
        local v1570 = nil;
        local v1571 = nil;
        local v1572, v1573, v1574 = v0.readTag(v1567, v1569);
        v1570 = v1572;
        v1571 = v1573;
        v1569 = v1574;
        if v1571 == v0.wireTypes.varint then
            v1572 = nil;
            v1573, v1574 = v0.readVarInt(v1567, v1569);
            v1572 = v1573;
            v1569 = v1574;
        elseif v1571 == v0.wireTypes.lengthDelimited then
            if v1570 == 1 then
                v1572 = nil;
                v1573, v1574 = v0.readBuffer(v1567, v1569);
                v1572 = v1573;
                v1569 = v1574;
                v1573 = v2.FocusNavActionsProp_FocusNavData_KeysEntry.decode(v1572);
                v1568.keys[v1573.key or ""] = v1573.value or "";
            elseif v1570 == 2 then
                v1572 = nil;
                v1573, v1574 = v0.readBuffer(v1567, v1569);
                v1572 = v1573;
                v1569 = v1574;
                v1573 = v2.FocusNavActionsProp_FocusNavData_EventsEntry.decode(v1572);
                v1574 = v3.Struct.new();
                v1568.events[v1573.key or ""] = v1573.value or v1574;
            else
                v1572 = nil;
                v1573, v1574 = v0.readVarInt(v1567, v1569);
                v1569 = v1574 + v1573;
            end;
        elseif v1571 == v0.wireTypes.i32 then
            v1572 = nil;
            v1573, v1574 = v0.readFixed32(v1567, v1569);
            v1572 = v1573;
            v1569 = v1574;
        elseif v1571 == v0.wireTypes.i64 then
            v1572 = nil;
            v1573, v1574 = v0.readFixed64(v1567, v1569);
            v1572 = v1573;
            v1569 = v1574;
        else
            error("Unsupported wire type: " .. v1571);
        end;
    end;
    return v1568;
end;
v7.jsonEncode = function(v1575) --[[ Line: 11168 ]] --[[ Name: jsonEncode ]]
    local v1576 = {};
    if v1575.keys ~= nil and next(v1575.keys) ~= nil then
        local v1577 = {};
        for v1578, v1579 in v1575.keys do
            v1577[v1578] = v1579;
        end;
        v1576.keys = v1577;
    end;
    if v1575.events ~= nil and next(v1575.events) ~= nil then
        local v1580 = {};
        for v1581, v1582 in v1575.events do
            v1580[v1581] = v1582:jsonEncode();
        end;
        v1576.events = v1580;
    end;
    return v1576;
end;
v7.jsonDecode = function(v1583) --[[ Line: 11190 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_62 (copy), v3 (copy)
    local v1584 = l_v7_62.new();
    if v1583.keys ~= nil then
        local v1585 = {};
        for v1586, v1587 in v1583.keys do
            v1585[v1586] = v1587;
        end;
        v1584.keys = v1585;
    end;
    if v1583.events ~= nil then
        local v1588 = {};
        for v1589, v1590 in v1583.events do
            v1588[v1589] = v3.Struct.jsonDecode(v1590);
        end;
        v1584.events = v1588;
    end;
    return v1584;
end;
v7.descriptor = {
    name = "FocusNavActionsProp_FocusNavData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavData"
};
v2.FocusNavActionsProp_FocusNavData = v7;
v1.default:register(v2.FocusNavActionsProp_FocusNavData);
v7 = {};
v7.__index = v7;
local l_v7_63 = v7 --[[ copy: 7 -> 71 ]];
v7.new = function(v1592) --[[ Line: 11230 ]] --[[ Name: new ]]
    -- upvalues: l_v7_63 (copy)
    return (setmetatable({
        key = (not (v1592 ~= nil) or v1592.key == nil) and "" or v1592.key, 
        value = (not (v1592 ~= nil) or v1592.value == nil) and "" or v1592.value
    }, l_v7_63));
end;
v7.encode = function(v1593) --[[ Line: 11239 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1594 = buffer.create(0);
    local v1595 = 0;
    if v1593.key ~= nil and v1593.key ~= "" then
        local v1596, v1597 = v0.writeTag(v1594, v1595, 1, v0.wireTypes.lengthDelimited);
        v1596, v1597 = v0.writeString(v1596, v1597, v1593.key);
        v1594 = v1596;
        v1595 = v1597;
    end;
    if v1593.value ~= nil and v1593.value ~= "" then
        local v1598, v1599 = v0.writeTag(v1594, v1595, 2, v0.wireTypes.lengthDelimited);
        v1598, v1599 = v0.writeString(v1598, v1599, v1593.value);
        v1594 = v1598;
        v1595 = v1599;
    end;
    local v1600 = buffer.create(v1595);
    buffer.copy(v1600, 0, v1594, 0, v1595);
    return v1600;
end;
v7.decode = function(v1601) --[[ Line: 11260 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_63 (copy), v0 (copy)
    local v1602 = l_v7_63.new();
    local v1603 = 0;
    while v1603 < buffer.len(v1601) do
        local v1604 = nil;
        local v1605 = nil;
        local v1606, v1607, v1608 = v0.readTag(v1601, v1603);
        v1604 = v1606;
        v1605 = v1607;
        v1603 = v1608;
        if v1605 == v0.wireTypes.varint then
            v1606 = nil;
            v1607, v1608 = v0.readVarInt(v1601, v1603);
            v1606 = v1607;
            v1603 = v1608;
        elseif v1605 == v0.wireTypes.lengthDelimited then
            if v1604 == 1 then
                v1606 = nil;
                v1607, v1608 = v0.readBuffer(v1601, v1603);
                v1606 = v1607;
                v1603 = v1608;
                v1602.key = buffer.tostring(v1606);
            elseif v1604 == 2 then
                v1606 = nil;
                v1607, v1608 = v0.readBuffer(v1601, v1603);
                v1606 = v1607;
                v1603 = v1608;
                v1602.value = buffer.tostring(v1606);
            else
                v1606 = nil;
                v1607, v1608 = v0.readVarInt(v1601, v1603);
                v1603 = v1608 + v1607;
            end;
        elseif v1605 == v0.wireTypes.i32 then
            v1606 = nil;
            v1607, v1608 = v0.readFixed32(v1601, v1603);
            v1606 = v1607;
            v1603 = v1608;
        elseif v1605 == v0.wireTypes.i64 then
            v1606 = nil;
            v1607, v1608 = v0.readFixed64(v1601, v1603);
            v1606 = v1607;
            v1603 = v1608;
        else
            error("Unsupported wire type: " .. v1605);
        end;
    end;
    return v1602;
end;
v7.jsonEncode = function(v1609) --[[ Line: 11310 ]] --[[ Name: jsonEncode ]]
    local v1610 = {};
    if v1609.key ~= nil and v1609.key ~= "" then
        v1610.key = v1609.key;
    end;
    if v1609.value ~= nil and v1609.value ~= "" then
        v1610.value = v1609.value;
    end;
    return v1610;
end;
v7.jsonDecode = function(v1611) --[[ Line: 11326 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_63 (copy)
    local v1612 = l_v7_63.new();
    if v1611.key ~= nil then
        v1612.key = v1611.key;
    end;
    if v1611.value ~= nil then
        v1612.value = v1611.value;
    end;
    return v1612;
end;
v7.descriptor = {
    name = "FocusNavActionsProp_FocusNavData_KeysEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.KeysEntry"
};
v2.FocusNavActionsProp_FocusNavData_KeysEntry = v7;
v1.default:register(v2.FocusNavActionsProp_FocusNavData_KeysEntry);
v7 = {};
v7.__index = v7;
v7.new = function(v1613) --[[ Line: 11356 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({
        key = (not (v1613 ~= nil) or v1613.key == nil) and "" or v1613.key, 
        value = if not (v1613 ~= nil) or v1613.value == nil then nil else v1613.value
    }, v7));
end;
v7.encode = function(v1614) --[[ Line: 11365 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1615 = buffer.create(0);
    local v1616 = 0;
    if v1614.key ~= nil and v1614.key ~= "" then
        local v1617, v1618 = v0.writeTag(v1615, v1616, 1, v0.wireTypes.lengthDelimited);
        v1617, v1618 = v0.writeString(v1617, v1618, v1614.key);
        v1615 = v1617;
        v1616 = v1618;
    end;
    if v1614.value ~= nil then
        local v1619 = v1614.value:encode();
        local v1620, v1621 = v0.writeTag(v1615, v1616, 2, v0.wireTypes.lengthDelimited);
        v1620, v1621 = v0.writeBuffer(v1620, v1621, v1619, buffer.len(v1619));
        v1615 = v1620;
        v1616 = v1621;
    end;
    local v1622 = buffer.create(v1616);
    buffer.copy(v1622, 0, v1615, 0, v1616);
    return v1622;
end;
v7.decode = function(v1623) --[[ Line: 11387 ]] --[[ Name: decode ]]
    -- upvalues: v7 (copy), v0 (copy), v3 (copy)
    local v1624 = v7.new();
    local v1625 = 0;
    while v1625 < buffer.len(v1623) do
        local v1626 = nil;
        local v1627 = nil;
        local v1628, v1629, v1630 = v0.readTag(v1623, v1625);
        v1626 = v1628;
        v1627 = v1629;
        v1625 = v1630;
        if v1627 == v0.wireTypes.varint then
            v1628 = nil;
            v1629, v1630 = v0.readVarInt(v1623, v1625);
            v1628 = v1629;
            v1625 = v1630;
        elseif v1627 == v0.wireTypes.lengthDelimited then
            if v1626 == 1 then
                v1628 = nil;
                v1629, v1630 = v0.readBuffer(v1623, v1625);
                v1628 = v1629;
                v1625 = v1630;
                v1624.key = buffer.tostring(v1628);
            elseif v1626 == 2 then
                v1628 = nil;
                v1629, v1630 = v0.readBuffer(v1623, v1625);
                v1628 = v1629;
                v1625 = v1630;
                v1624.value = v3.Struct.decode(v1628);
            else
                v1628 = nil;
                v1629, v1630 = v0.readVarInt(v1623, v1625);
                v1625 = v1630 + v1629;
            end;
        elseif v1627 == v0.wireTypes.i32 then
            v1628 = nil;
            v1629, v1630 = v0.readFixed32(v1623, v1625);
            v1628 = v1629;
            v1625 = v1630;
        elseif v1627 == v0.wireTypes.i64 then
            v1628 = nil;
            v1629, v1630 = v0.readFixed64(v1623, v1625);
            v1628 = v1629;
            v1625 = v1630;
        else
            error("Unsupported wire type: " .. v1627);
        end;
    end;
    return v1624;
end;
v7.jsonEncode = function(v1631) --[[ Line: 11437 ]] --[[ Name: jsonEncode ]]
    local v1632 = {};
    if v1631.key ~= nil and v1631.key ~= "" then
        v1632.key = v1631.key;
    end;
    if v1631.value ~= nil then
        v1632.value = v1631.value:jsonEncode();
    end;
    return v1632;
end;
v7.jsonDecode = function(v1633) --[[ Line: 11453 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v7 (copy), v3 (copy)
    local v1634 = v7.new();
    if v1633.key ~= nil then
        v1634.key = v1633.key;
    end;
    if v1633.value ~= nil then
        v1634.value = v3.Struct.jsonDecode(v1633.value);
    end;
    return v1634;
end;
v7.descriptor = {
    name = "FocusNavActionsProp_FocusNavData_EventsEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventsEntry"
};
v2.FocusNavActionsProp_FocusNavData_EventsEntry = v7;
v1.default:register(v2.FocusNavActionsProp_FocusNavData_EventsEntry);
v2.ActionType = {
    fromNumber = function(v1635) --[[ Line: 11480 ]] --[[ Name: fromNumber ]]
        if v1635 == 0 then
            return "ACTION_TYPE_INVALID";
        elseif v1635 == 1 then
            return "ACTION_TYPE_DISMISS_DIALOG";
        elseif v1635 == 2 then
            return "ACTION_TYPE_LINK";
        elseif v1635 == 3 then
            return "ACTION_TYPE_OPEN_GAME_DETAILS";
        elseif v1635 == 4 then
            return "ACTION_TYPE_OPEN_JOIN_FRIENDS";
        elseif v1635 == 5 then
            return "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON";
        elseif v1635 == 6 then
            return "ACTION_TYPE_OPEN_SEE_ALL";
        elseif v1635 == 7 then
            return "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP";
        elseif v1635 == 8 then
            return "ACTION_TYPE_PLAY_BUTTON_CLICK";
        elseif v1635 == 9 then
            return "ACTION_TYPE_UPDATE_USER_SETTINGS";
        elseif v1635 == 10 then
            return "ACTION_TYPE_OPEN_TOOLTIP";
        elseif v1635 == 11 then
            return "ACTION_TYPE_OPEN_BADGE_DETAILS";
        elseif v1635 == 12 then
            return "ACTION_TYPE_LOAD_MORE_FROM_API";
        elseif v1635 == 13 then
            return "ACTION_TYPE_SHARE";
        elseif v1635 == 14 then
            return "ACTION_TYPE_OPEN_ABUSE_REPORT";
        elseif v1635 == 15 then
            return "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY";
        elseif v1635 == 16 then
            return "ACTION_TYPE_OPEN_PROFILE";
        elseif v1635 == 17 then
            return "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION";
        elseif v1635 == 18 then
            return "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE";
        elseif v1635 == 19 then
            return "ACTION_TYPE_OPEN_MARKETPLACE";
        elseif v1635 == 20 then
            return "ACTION_TYPE_HIDE_PROFILE_COMPLETION";
        elseif v1635 == 21 then
            return "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY";
        elseif v1635 == 22 then
            return "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY";
        elseif v1635 == 23 then
            return "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL";
        elseif v1635 == 24 then
            return "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP";
        elseif v1635 == 25 then
            return "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG";
        elseif v1635 == 26 then
            return "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS";
        elseif v1635 == 27 then
            return "ACTION_TYPE_OPEN_SOCIAL_LINK";
        else
            return nil;
        end;
    end, 
    toNumber = function(v1636) --[[ Line: 11542 ]] --[[ Name: toNumber ]]
        if v1636 == "ACTION_TYPE_INVALID" then
            return 0;
        elseif v1636 == "ACTION_TYPE_DISMISS_DIALOG" then
            return 1;
        elseif v1636 == "ACTION_TYPE_LINK" then
            return 2;
        elseif v1636 == "ACTION_TYPE_OPEN_GAME_DETAILS" then
            return 3;
        elseif v1636 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then
            return 4;
        elseif v1636 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then
            return 5;
        elseif v1636 == "ACTION_TYPE_OPEN_SEE_ALL" then
            return 6;
        elseif v1636 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then
            return 7;
        elseif v1636 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then
            return 8;
        elseif v1636 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then
            return 9;
        elseif v1636 == "ACTION_TYPE_OPEN_TOOLTIP" then
            return 10;
        elseif v1636 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then
            return 11;
        elseif v1636 == "ACTION_TYPE_LOAD_MORE_FROM_API" then
            return 12;
        elseif v1636 == "ACTION_TYPE_SHARE" then
            return 13;
        elseif v1636 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then
            return 14;
        elseif v1636 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then
            return 15;
        elseif v1636 == "ACTION_TYPE_OPEN_PROFILE" then
            return 16;
        elseif v1636 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then
            return 17;
        elseif v1636 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then
            return 18;
        elseif v1636 == "ACTION_TYPE_OPEN_MARKETPLACE" then
            return 19;
        elseif v1636 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then
            return 20;
        elseif v1636 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then
            return 21;
        elseif v1636 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then
            return 22;
        elseif v1636 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then
            return 23;
        elseif v1636 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then
            return 24;
        elseif v1636 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then
            return 25;
        elseif v1636 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then
            return 26;
        elseif v1636 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then
            return 27;
        else
            return v1636;
        end;
    end, 
    fromName = function(v1637) --[[ Line: 11604 ]] --[[ Name: fromName ]]
        if v1637 == "ACTION_TYPE_INVALID" then
            return "ACTION_TYPE_INVALID";
        elseif v1637 == "ACTION_TYPE_DISMISS_DIALOG" then
            return "ACTION_TYPE_DISMISS_DIALOG";
        elseif v1637 == "ACTION_TYPE_LINK" then
            return "ACTION_TYPE_LINK";
        elseif v1637 == "ACTION_TYPE_OPEN_GAME_DETAILS" then
            return "ACTION_TYPE_OPEN_GAME_DETAILS";
        elseif v1637 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then
            return "ACTION_TYPE_OPEN_JOIN_FRIENDS";
        elseif v1637 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then
            return "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON";
        elseif v1637 == "ACTION_TYPE_OPEN_SEE_ALL" then
            return "ACTION_TYPE_OPEN_SEE_ALL";
        elseif v1637 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then
            return "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP";
        elseif v1637 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then
            return "ACTION_TYPE_PLAY_BUTTON_CLICK";
        elseif v1637 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then
            return "ACTION_TYPE_UPDATE_USER_SETTINGS";
        elseif v1637 == "ACTION_TYPE_OPEN_TOOLTIP" then
            return "ACTION_TYPE_OPEN_TOOLTIP";
        elseif v1637 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then
            return "ACTION_TYPE_OPEN_BADGE_DETAILS";
        elseif v1637 == "ACTION_TYPE_LOAD_MORE_FROM_API" then
            return "ACTION_TYPE_LOAD_MORE_FROM_API";
        elseif v1637 == "ACTION_TYPE_SHARE" then
            return "ACTION_TYPE_SHARE";
        elseif v1637 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then
            return "ACTION_TYPE_OPEN_ABUSE_REPORT";
        elseif v1637 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then
            return "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY";
        elseif v1637 == "ACTION_TYPE_OPEN_PROFILE" then
            return "ACTION_TYPE_OPEN_PROFILE";
        elseif v1637 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then
            return "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION";
        elseif v1637 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then
            return "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE";
        elseif v1637 == "ACTION_TYPE_OPEN_MARKETPLACE" then
            return "ACTION_TYPE_OPEN_MARKETPLACE";
        elseif v1637 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then
            return "ACTION_TYPE_HIDE_PROFILE_COMPLETION";
        elseif v1637 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then
            return "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY";
        elseif v1637 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then
            return "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY";
        elseif v1637 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then
            return "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL";
        elseif v1637 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then
            return "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP";
        elseif v1637 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then
            return "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG";
        elseif v1637 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then
            return "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS";
        elseif v1637 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then
            return "ACTION_TYPE_OPEN_SOCIAL_LINK";
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
    OpenSocialLinkAction = v2.OpenSocialLinkAction, 
    OpenSocialLinkAction_Params = v2.OpenSocialLinkAction_Params, 
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