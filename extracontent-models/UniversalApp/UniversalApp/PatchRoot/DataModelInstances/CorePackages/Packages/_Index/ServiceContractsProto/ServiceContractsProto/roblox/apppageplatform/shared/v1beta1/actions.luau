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
v7.new = function(v9) --[[ Line: 2450 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_0 (copy)
    return (setmetatable({
        action_type = if not (v9 ~= nil) or v9.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v9.action_type, 
        action_params = if not (v9 ~= nil) or v9.action_params == nil then nil else v9.action_params
    }, l_v7_0));
end;
v7.encode = function(v10) --[[ Line: 2459 ]] --[[ Name: encode ]]
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
v7.decode = function(v19) --[[ Line: 2485 ]] --[[ Name: decode ]]
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
v7.jsonEncode = function(v27) --[[ Line: 2533 ]] --[[ Name: jsonEncode ]]
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
v7.jsonDecode = function(v29) --[[ Line: 2555 ]] --[[ Name: jsonDecode ]]
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
v7.new = function(v32) --[[ Line: 2595 ]] --[[ Name: new ]]
    -- upvalues: l_v7_1 (copy)
    return (setmetatable({
        dialog_type = if not (v32 ~= nil) or v32.dialog_type == nil then nil else v32.dialog_type
    }, l_v7_1));
end;
v7.encode = function(v33) --[[ Line: 2603 ]] --[[ Name: encode ]]
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
v7.decode = function(v40) --[[ Line: 2618 ]] --[[ Name: decode ]]
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
v7.jsonEncode = function(v48) --[[ Line: 2661 ]] --[[ Name: jsonEncode ]]
    local v49 = {};
    if v48.dialog_type ~= nil then
        v49.dialogType = v48.dialog_type:jsonEncode();
    end;
    return v49;
end;
v7.jsonDecode = function(v50) --[[ Line: 2671 ]] --[[ Name: jsonDecode ]]
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
v7.new = function(v53) --[[ Line: 2700 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_2 (copy)
    return (setmetatable({
        action_type = if not (v53 ~= nil) or v53.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v53.action_type, 
        action_params = if not (v53 ~= nil) or v53.action_params == nil then nil else v53.action_params
    }, l_v7_2));
end;
v7.encode = function(v54) --[[ Line: 2709 ]] --[[ Name: encode ]]
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
v7.decode = function(v63) --[[ Line: 2735 ]] --[[ Name: decode ]]
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
v7.jsonEncode = function(v71) --[[ Line: 2783 ]] --[[ Name: jsonEncode ]]
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
v7.jsonDecode = function(v73) --[[ Line: 2805 ]] --[[ Name: jsonDecode ]]
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
v7.new = function(v76) --[[ Line: 2845 ]] --[[ Name: new ]]
    -- upvalues: l_v7_3 (copy)
    return (setmetatable({
        url = if not (v76 ~= nil) or v76.url == nil then nil else v76.url, 
        title_key = if not (v76 ~= nil) or v76.title_key == nil then nil else v76.title_key
    }, l_v7_3));
end;
v7.encode = function(v77) --[[ Line: 2852 ]] --[[ Name: encode ]]
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
    if v77.title_key ~= nil then
        local v83 = v77.title_key:encode();
        local v84, v85 = v0.writeTag(v78, v79, 2, v0.wireTypes.lengthDelimited);
        v84, v85 = v0.writeBuffer(v84, v85, v83, buffer.len(v83));
        v78 = v84;
        v79 = v85;
    end;
    local v86 = buffer.create(v79);
    buffer.copy(v86, 0, v78, 0, v79);
    return v86;
end;
v7.decode = function(v87) --[[ Line: 2873 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_3 (copy), v0 (copy), v5 (copy)
    local v88 = l_v7_3.new();
    local v89 = 0;
    while v89 < buffer.len(v87) do
        local v90 = nil;
        local v91 = nil;
        local v92, v93, v94 = v0.readTag(v87, v89);
        v90 = v92;
        v91 = v93;
        v89 = v94;
        if v91 == v0.wireTypes.varint then
            v92 = nil;
            v93, v94 = v0.readVarInt(v87, v89);
            v92 = v93;
            v89 = v94;
        elseif v91 == v0.wireTypes.lengthDelimited then
            if v90 == 1 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.url = v5.StringProp.decode(v92);
            elseif v90 == 2 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.title_key = v5.StringProp.decode(v92);
            else
                v92 = nil;
                v93, v94 = v0.readVarInt(v87, v89);
                v89 = v94 + v93;
            end;
        elseif v91 == v0.wireTypes.i32 then
            v92 = nil;
            v93, v94 = v0.readFixed32(v87, v89);
            v92 = v93;
            v89 = v94;
        elseif v91 == v0.wireTypes.i64 then
            v92 = nil;
            v93, v94 = v0.readFixed64(v87, v89);
            v92 = v93;
            v89 = v94;
        else
            error("Unsupported wire type: " .. v91);
        end;
    end;
    return v88;
end;
v7.jsonEncode = function(v95) --[[ Line: 2921 ]] --[[ Name: jsonEncode ]]
    local v96 = {};
    if v95.url ~= nil then
        v96.url = v95.url:jsonEncode();
    end;
    if v95.title_key ~= nil then
        v96.titleKey = v95.title_key:jsonEncode();
    end;
    return v96;
end;
v7.jsonDecode = function(v97) --[[ Line: 2935 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_3 (copy), v5 (copy)
    local v98 = l_v7_3.new();
    if v97.url ~= nil then
        v98.url = v5.StringProp.jsonDecode(v97.url);
    end;
    if v97.title_key ~= nil then
        v98.title_key = v5.StringProp.jsonDecode(v97.title_key);
    end;
    if v97.titleKey ~= nil then
        v98.title_key = v5.StringProp.jsonDecode(v97.titleKey);
    end;
    return v98;
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
v7.new = function(v100) --[[ Line: 2967 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_4 (copy)
    return (setmetatable({
        action_type = if not (v100 ~= nil) or v100.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v100.action_type, 
        action_params = if not (v100 ~= nil) or v100.action_params == nil then nil else v100.action_params
    }, l_v7_4));
end;
v7.encode = function(v101) --[[ Line: 2976 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v102 = buffer.create(0);
    local v103 = 0;
    if v101.action_type ~= nil and (v101.action_type ~= nil and v101.action_type ~= 0 or v101.action_type ~= v2.ActionType.fromNumber(0)) then
        local v104, v105 = v0.writeTag(v102, v103, 1, v0.wireTypes.varint);
        v104, v105 = v0.writeVarInt(v104, v105, v2.ActionType.toNumber(v101.action_type));
        v102 = v104;
        v103 = v105;
    end;
    if v101.action_params ~= nil then
        local v106 = v101.action_params:encode();
        local v107, v108 = v0.writeTag(v102, v103, 2, v0.wireTypes.lengthDelimited);
        v107, v108 = v0.writeBuffer(v107, v108, v106, buffer.len(v106));
        v102 = v107;
        v103 = v108;
    end;
    local v109 = buffer.create(v103);
    buffer.copy(v109, 0, v102, 0, v103);
    return v109;
end;
v7.decode = function(v110) --[[ Line: 3002 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_4 (copy), v0 (copy), v2 (copy)
    local v111 = l_v7_4.new();
    local v112 = 0;
    while v112 < buffer.len(v110) do
        local v113 = nil;
        local v114 = nil;
        local v115, v116, v117 = v0.readTag(v110, v112);
        v113 = v115;
        v114 = v116;
        v112 = v117;
        if v114 == v0.wireTypes.varint then
            if v113 == 1 then
                v115 = nil;
                v116, v117 = v0.readVarIntI32(v110, v112);
                v115 = v116;
                v112 = v117;
                v111.action_type = v2.ActionType.fromNumber(v115) or v115;
            else
                v115 = nil;
                v116, v117 = v0.readVarInt(v110, v112);
                v115 = v116;
                v112 = v117;
            end;
        elseif v114 == v0.wireTypes.lengthDelimited then
            if v113 == 2 then
                v115 = nil;
                v116, v117 = v0.readBuffer(v110, v112);
                v115 = v116;
                v112 = v117;
                v111.action_params = v2.OpenSocialLinkAction_Params.decode(v115);
            else
                v115 = nil;
                v116, v117 = v0.readVarInt(v110, v112);
                v112 = v117 + v116;
            end;
        elseif v114 == v0.wireTypes.i32 then
            v115 = nil;
            v116, v117 = v0.readFixed32(v110, v112);
            v115 = v116;
            v112 = v117;
        elseif v114 == v0.wireTypes.i64 then
            v115 = nil;
            v116, v117 = v0.readFixed64(v110, v112);
            v115 = v116;
            v112 = v117;
        else
            error("Unsupported wire type: " .. v114);
        end;
    end;
    return v111;
end;
v7.jsonEncode = function(v118) --[[ Line: 3050 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v119 = {};
    if v118.action_type ~= nil and (v118.action_type ~= nil and v118.action_type ~= 0 or v118.action_type ~= v2.ActionType.fromNumber(0)) then
        v119.actionType = if typeof(v118.action_type) == "number" then v118.action_type else v2.ActionType.toNumber(v118.action_type);
    end;
    if v118.action_params ~= nil then
        v119.actionParams = v118.action_params:jsonEncode();
    end;
    return v119;
end;
v7.jsonDecode = function(v120) --[[ Line: 3072 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_4 (copy), v2 (copy)
    local v121 = l_v7_4.new();
    if v120.action_type ~= nil then
        v121.action_type = if typeof(v120.action_type) == "number" then v2.ActionType.fromNumber(v120.action_type) or v120.action_type else v2.ActionType.fromName(v120.action_type) or v120.action_type;
    end;
    if v120.actionType ~= nil then
        v121.action_type = if typeof(v120.actionType) == "number" then v2.ActionType.fromNumber(v120.actionType) or v120.actionType else v2.ActionType.fromName(v120.actionType) or v120.actionType;
    end;
    if v120.action_params ~= nil then
        v121.action_params = v2.OpenSocialLinkAction_Params.jsonDecode(v120.action_params);
    end;
    if v120.actionParams ~= nil then
        v121.action_params = v2.OpenSocialLinkAction_Params.jsonDecode(v120.actionParams);
    end;
    return v121;
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
v7.new = function(v123) --[[ Line: 3112 ]] --[[ Name: new ]]
    -- upvalues: l_v7_5 (copy)
    return (setmetatable({
        assignment_id = if not (v123 ~= nil) or v123.assignment_id == nil then nil else v123.assignment_id, 
        assignment_type = if not (v123 ~= nil) or v123.assignment_type == nil then nil else v123.assignment_type, 
        social_link_type = if not (v123 ~= nil) or v123.social_link_type == nil then nil else v123.social_link_type, 
        social_link_url = if not (v123 ~= nil) or v123.social_link_url == nil then nil else v123.social_link_url, 
        social_link_display_type = if not (v123 ~= nil) or v123.social_link_display_type == nil then nil else v123.social_link_display_type
    }, l_v7_5));
end;
v7.encode = function(v124) --[[ Line: 3126 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v125 = buffer.create(0);
    local v126 = 0;
    if v124.assignment_id ~= nil then
        local v127 = v124.assignment_id:encode();
        local v128, v129 = v0.writeTag(v125, v126, 1, v0.wireTypes.lengthDelimited);
        v128, v129 = v0.writeBuffer(v128, v129, v127, buffer.len(v127));
        v125 = v128;
        v126 = v129;
    end;
    if v124.assignment_type ~= nil then
        local v130 = v124.assignment_type:encode();
        local v131, v132 = v0.writeTag(v125, v126, 2, v0.wireTypes.lengthDelimited);
        v131, v132 = v0.writeBuffer(v131, v132, v130, buffer.len(v130));
        v125 = v131;
        v126 = v132;
    end;
    if v124.social_link_type ~= nil then
        local v133 = v124.social_link_type:encode();
        local v134, v135 = v0.writeTag(v125, v126, 3, v0.wireTypes.lengthDelimited);
        v134, v135 = v0.writeBuffer(v134, v135, v133, buffer.len(v133));
        v125 = v134;
        v126 = v135;
    end;
    if v124.social_link_url ~= nil then
        local v136 = v124.social_link_url:encode();
        local v137, v138 = v0.writeTag(v125, v126, 4, v0.wireTypes.lengthDelimited);
        v137, v138 = v0.writeBuffer(v137, v138, v136, buffer.len(v136));
        v125 = v137;
        v126 = v138;
    end;
    if v124.social_link_display_type ~= nil then
        local v139 = v124.social_link_display_type:encode();
        local v140, v141 = v0.writeTag(v125, v126, 5, v0.wireTypes.lengthDelimited);
        v140, v141 = v0.writeBuffer(v140, v141, v139, buffer.len(v139));
        v125 = v140;
        v126 = v141;
    end;
    local v142 = buffer.create(v126);
    buffer.copy(v142, 0, v125, 0, v126);
    return v142;
end;
v7.decode = function(v143) --[[ Line: 3165 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_5 (copy), v0 (copy), v5 (copy)
    local v144 = l_v7_5.new();
    local v145 = 0;
    while v145 < buffer.len(v143) do
        local v146 = nil;
        local v147 = nil;
        local v148, v149, v150 = v0.readTag(v143, v145);
        v146 = v148;
        v147 = v149;
        v145 = v150;
        if v147 == v0.wireTypes.varint then
            v148 = nil;
            v149, v150 = v0.readVarInt(v143, v145);
            v148 = v149;
            v145 = v150;
        elseif v147 == v0.wireTypes.lengthDelimited then
            if v146 == 1 then
                v148 = nil;
                v149, v150 = v0.readBuffer(v143, v145);
                v148 = v149;
                v145 = v150;
                v144.assignment_id = v5.StringProp.decode(v148);
            elseif v146 == 2 then
                v148 = nil;
                v149, v150 = v0.readBuffer(v143, v145);
                v148 = v149;
                v145 = v150;
                v144.assignment_type = v5.StringProp.decode(v148);
            elseif v146 == 3 then
                v148 = nil;
                v149, v150 = v0.readBuffer(v143, v145);
                v148 = v149;
                v145 = v150;
                v144.social_link_type = v5.StringProp.decode(v148);
            elseif v146 == 4 then
                v148 = nil;
                v149, v150 = v0.readBuffer(v143, v145);
                v148 = v149;
                v145 = v150;
                v144.social_link_url = v5.StringProp.decode(v148);
            elseif v146 == 5 then
                v148 = nil;
                v149, v150 = v0.readBuffer(v143, v145);
                v148 = v149;
                v145 = v150;
                v144.social_link_display_type = v5.StringProp.decode(v148);
            else
                v148 = nil;
                v149, v150 = v0.readVarInt(v143, v145);
                v145 = v150 + v149;
            end;
        elseif v147 == v0.wireTypes.i32 then
            v148 = nil;
            v149, v150 = v0.readFixed32(v143, v145);
            v148 = v149;
            v145 = v150;
        elseif v147 == v0.wireTypes.i64 then
            v148 = nil;
            v149, v150 = v0.readFixed64(v143, v145);
            v148 = v149;
            v145 = v150;
        else
            error("Unsupported wire type: " .. v147);
        end;
    end;
    return v144;
end;
v7.jsonEncode = function(v151) --[[ Line: 3229 ]] --[[ Name: jsonEncode ]]
    local v152 = {};
    if v151.assignment_id ~= nil then
        v152.assignmentId = v151.assignment_id:jsonEncode();
    end;
    if v151.assignment_type ~= nil then
        v152.assignmentType = v151.assignment_type:jsonEncode();
    end;
    if v151.social_link_type ~= nil then
        v152.socialLinkType = v151.social_link_type:jsonEncode();
    end;
    if v151.social_link_url ~= nil then
        v152.socialLinkUrl = v151.social_link_url:jsonEncode();
    end;
    if v151.social_link_display_type ~= nil then
        v152.socialLinkDisplayType = v151.social_link_display_type:jsonEncode();
    end;
    return v152;
end;
v7.jsonDecode = function(v153) --[[ Line: 3255 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_5 (copy), v5 (copy)
    local v154 = l_v7_5.new();
    if v153.assignment_id ~= nil then
        v154.assignment_id = v5.StringProp.jsonDecode(v153.assignment_id);
    end;
    if v153.assignmentId ~= nil then
        v154.assignment_id = v5.StringProp.jsonDecode(v153.assignmentId);
    end;
    if v153.assignment_type ~= nil then
        v154.assignment_type = v5.StringProp.jsonDecode(v153.assignment_type);
    end;
    if v153.assignmentType ~= nil then
        v154.assignment_type = v5.StringProp.jsonDecode(v153.assignmentType);
    end;
    if v153.social_link_type ~= nil then
        v154.social_link_type = v5.StringProp.jsonDecode(v153.social_link_type);
    end;
    if v153.socialLinkType ~= nil then
        v154.social_link_type = v5.StringProp.jsonDecode(v153.socialLinkType);
    end;
    if v153.social_link_url ~= nil then
        v154.social_link_url = v5.StringProp.jsonDecode(v153.social_link_url);
    end;
    if v153.socialLinkUrl ~= nil then
        v154.social_link_url = v5.StringProp.jsonDecode(v153.socialLinkUrl);
    end;
    if v153.social_link_display_type ~= nil then
        v154.social_link_display_type = v5.StringProp.jsonDecode(v153.social_link_display_type);
    end;
    if v153.socialLinkDisplayType ~= nil then
        v154.social_link_display_type = v5.StringProp.jsonDecode(v153.socialLinkDisplayType);
    end;
    return v154;
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
v7.new = function(v156) --[[ Line: 3325 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_6 (copy)
    return (setmetatable({
        action_type = if not (v156 ~= nil) or v156.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v156.action_type, 
        action_params = if not (v156 ~= nil) or v156.action_params == nil then nil else v156.action_params
    }, l_v7_6));
end;
v7.encode = function(v157) --[[ Line: 3334 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v158 = buffer.create(0);
    local v159 = 0;
    if v157.action_type ~= nil and (v157.action_type ~= nil and v157.action_type ~= 0 or v157.action_type ~= v2.ActionType.fromNumber(0)) then
        local v160, v161 = v0.writeTag(v158, v159, 1, v0.wireTypes.varint);
        v160, v161 = v0.writeVarInt(v160, v161, v2.ActionType.toNumber(v157.action_type));
        v158 = v160;
        v159 = v161;
    end;
    if v157.action_params ~= nil then
        local v162 = v157.action_params:encode();
        local v163, v164 = v0.writeTag(v158, v159, 2, v0.wireTypes.lengthDelimited);
        v163, v164 = v0.writeBuffer(v163, v164, v162, buffer.len(v162));
        v158 = v163;
        v159 = v164;
    end;
    local v165 = buffer.create(v159);
    buffer.copy(v165, 0, v158, 0, v159);
    return v165;
end;
v7.decode = function(v166) --[[ Line: 3360 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_6 (copy), v0 (copy), v2 (copy)
    local v167 = l_v7_6.new();
    local v168 = 0;
    while v168 < buffer.len(v166) do
        local v169 = nil;
        local v170 = nil;
        local v171, v172, v173 = v0.readTag(v166, v168);
        v169 = v171;
        v170 = v172;
        v168 = v173;
        if v170 == v0.wireTypes.varint then
            if v169 == 1 then
                v171 = nil;
                v172, v173 = v0.readVarIntI32(v166, v168);
                v171 = v172;
                v168 = v173;
                v167.action_type = v2.ActionType.fromNumber(v171) or v171;
            else
                v171 = nil;
                v172, v173 = v0.readVarInt(v166, v168);
                v171 = v172;
                v168 = v173;
            end;
        elseif v170 == v0.wireTypes.lengthDelimited then
            if v169 == 2 then
                v171 = nil;
                v172, v173 = v0.readBuffer(v166, v168);
                v171 = v172;
                v168 = v173;
                v167.action_params = v2.OpenGameDetailsAction_Params.decode(v171);
            else
                v171 = nil;
                v172, v173 = v0.readVarInt(v166, v168);
                v168 = v173 + v172;
            end;
        elseif v170 == v0.wireTypes.i32 then
            v171 = nil;
            v172, v173 = v0.readFixed32(v166, v168);
            v171 = v172;
            v168 = v173;
        elseif v170 == v0.wireTypes.i64 then
            v171 = nil;
            v172, v173 = v0.readFixed64(v166, v168);
            v171 = v172;
            v168 = v173;
        else
            error("Unsupported wire type: " .. v170);
        end;
    end;
    return v167;
end;
v7.jsonEncode = function(v174) --[[ Line: 3408 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v175 = {};
    if v174.action_type ~= nil and (v174.action_type ~= nil and v174.action_type ~= 0 or v174.action_type ~= v2.ActionType.fromNumber(0)) then
        v175.actionType = if typeof(v174.action_type) == "number" then v174.action_type else v2.ActionType.toNumber(v174.action_type);
    end;
    if v174.action_params ~= nil then
        v175.actionParams = v174.action_params:jsonEncode();
    end;
    return v175;
end;
v7.jsonDecode = function(v176) --[[ Line: 3430 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_6 (copy), v2 (copy)
    local v177 = l_v7_6.new();
    if v176.action_type ~= nil then
        v177.action_type = if typeof(v176.action_type) == "number" then v2.ActionType.fromNumber(v176.action_type) or v176.action_type else v2.ActionType.fromName(v176.action_type) or v176.action_type;
    end;
    if v176.actionType ~= nil then
        v177.action_type = if typeof(v176.actionType) == "number" then v2.ActionType.fromNumber(v176.actionType) or v176.actionType else v2.ActionType.fromName(v176.actionType) or v176.actionType;
    end;
    if v176.action_params ~= nil then
        v177.action_params = v2.OpenGameDetailsAction_Params.jsonDecode(v176.action_params);
    end;
    if v176.actionParams ~= nil then
        v177.action_params = v2.OpenGameDetailsAction_Params.jsonDecode(v176.actionParams);
    end;
    return v177;
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
v7.new = function(v179) --[[ Line: 3470 ]] --[[ Name: new ]]
    -- upvalues: l_v7_7 (copy)
    return (setmetatable({
        place_id = if not (v179 ~= nil) or v179.place_id == nil then nil else v179.place_id, 
        universe_id = if not (v179 ~= nil) or v179.universe_id == nil then nil else v179.universe_id
    }, l_v7_7));
end;
v7.encode = function(v180) --[[ Line: 3479 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v181 = buffer.create(0);
    local v182 = 0;
    if v180.place_id ~= nil then
        local v183 = v180.place_id:encode();
        local v184, v185 = v0.writeTag(v181, v182, 1, v0.wireTypes.lengthDelimited);
        v184, v185 = v0.writeBuffer(v184, v185, v183, buffer.len(v183));
        v181 = v184;
        v182 = v185;
    end;
    if v180.universe_id ~= nil then
        local v186 = v180.universe_id:encode();
        local v187, v188 = v0.writeTag(v181, v182, 2, v0.wireTypes.lengthDelimited);
        v187, v188 = v0.writeBuffer(v187, v188, v186, buffer.len(v186));
        v181 = v187;
        v182 = v188;
    end;
    local v189 = buffer.create(v182);
    buffer.copy(v189, 0, v181, 0, v182);
    return v189;
end;
v7.decode = function(v190) --[[ Line: 3500 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_7 (copy), v0 (copy), v5 (copy)
    local v191 = l_v7_7.new();
    local v192 = 0;
    while v192 < buffer.len(v190) do
        local v193 = nil;
        local v194 = nil;
        local v195, v196, v197 = v0.readTag(v190, v192);
        v193 = v195;
        v194 = v196;
        v192 = v197;
        if v194 == v0.wireTypes.varint then
            v195 = nil;
            v196, v197 = v0.readVarInt(v190, v192);
            v195 = v196;
            v192 = v197;
        elseif v194 == v0.wireTypes.lengthDelimited then
            if v193 == 1 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.place_id = v5.StringProp.decode(v195);
            elseif v193 == 2 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.universe_id = v5.StringProp.decode(v195);
            else
                v195 = nil;
                v196, v197 = v0.readVarInt(v190, v192);
                v192 = v197 + v196;
            end;
        elseif v194 == v0.wireTypes.i32 then
            v195 = nil;
            v196, v197 = v0.readFixed32(v190, v192);
            v195 = v196;
            v192 = v197;
        elseif v194 == v0.wireTypes.i64 then
            v195 = nil;
            v196, v197 = v0.readFixed64(v190, v192);
            v195 = v196;
            v192 = v197;
        else
            error("Unsupported wire type: " .. v194);
        end;
    end;
    return v191;
end;
v7.jsonEncode = function(v198) --[[ Line: 3548 ]] --[[ Name: jsonEncode ]]
    local v199 = {};
    if v198.place_id ~= nil then
        v199.placeId = v198.place_id:jsonEncode();
    end;
    if v198.universe_id ~= nil then
        v199.universeId = v198.universe_id:jsonEncode();
    end;
    return v199;
end;
v7.jsonDecode = function(v200) --[[ Line: 3562 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_7 (copy), v5 (copy)
    local v201 = l_v7_7.new();
    if v200.place_id ~= nil then
        v201.place_id = v5.StringProp.jsonDecode(v200.place_id);
    end;
    if v200.placeId ~= nil then
        v201.place_id = v5.StringProp.jsonDecode(v200.placeId);
    end;
    if v200.universe_id ~= nil then
        v201.universe_id = v5.StringProp.jsonDecode(v200.universe_id);
    end;
    if v200.universeId ~= nil then
        v201.universe_id = v5.StringProp.jsonDecode(v200.universeId);
    end;
    return v201;
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
v7.new = function(v203) --[[ Line: 3599 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_8 (copy)
    return (setmetatable({
        action_type = if not (v203 ~= nil) or v203.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v203.action_type, 
        action_params = if not (v203 ~= nil) or v203.action_params == nil then nil else v203.action_params
    }, l_v7_8));
end;
v7.encode = function(v204) --[[ Line: 3608 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v205 = buffer.create(0);
    local v206 = 0;
    if v204.action_type ~= nil and (v204.action_type ~= nil and v204.action_type ~= 0 or v204.action_type ~= v2.ActionType.fromNumber(0)) then
        local v207, v208 = v0.writeTag(v205, v206, 1, v0.wireTypes.varint);
        v207, v208 = v0.writeVarInt(v207, v208, v2.ActionType.toNumber(v204.action_type));
        v205 = v207;
        v206 = v208;
    end;
    if v204.action_params ~= nil then
        local v209 = v204.action_params:encode();
        local v210, v211 = v0.writeTag(v205, v206, 2, v0.wireTypes.lengthDelimited);
        v210, v211 = v0.writeBuffer(v210, v211, v209, buffer.len(v209));
        v205 = v210;
        v206 = v211;
    end;
    local v212 = buffer.create(v206);
    buffer.copy(v212, 0, v205, 0, v206);
    return v212;
end;
v7.decode = function(v213) --[[ Line: 3634 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_8 (copy), v0 (copy), v2 (copy)
    local v214 = l_v7_8.new();
    local v215 = 0;
    while v215 < buffer.len(v213) do
        local v216 = nil;
        local v217 = nil;
        local v218, v219, v220 = v0.readTag(v213, v215);
        v216 = v218;
        v217 = v219;
        v215 = v220;
        if v217 == v0.wireTypes.varint then
            if v216 == 1 then
                v218 = nil;
                v219, v220 = v0.readVarIntI32(v213, v215);
                v218 = v219;
                v215 = v220;
                v214.action_type = v2.ActionType.fromNumber(v218) or v218;
            else
                v218 = nil;
                v219, v220 = v0.readVarInt(v213, v215);
                v218 = v219;
                v215 = v220;
            end;
        elseif v217 == v0.wireTypes.lengthDelimited then
            if v216 == 2 then
                v218 = nil;
                v219, v220 = v0.readBuffer(v213, v215);
                v218 = v219;
                v215 = v220;
                v214.action_params = v2.OpenJoinFriendsAction_Params.decode(v218);
            else
                v218 = nil;
                v219, v220 = v0.readVarInt(v213, v215);
                v215 = v220 + v219;
            end;
        elseif v217 == v0.wireTypes.i32 then
            v218 = nil;
            v219, v220 = v0.readFixed32(v213, v215);
            v218 = v219;
            v215 = v220;
        elseif v217 == v0.wireTypes.i64 then
            v218 = nil;
            v219, v220 = v0.readFixed64(v213, v215);
            v218 = v219;
            v215 = v220;
        else
            error("Unsupported wire type: " .. v217);
        end;
    end;
    return v214;
end;
v7.jsonEncode = function(v221) --[[ Line: 3682 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v222 = {};
    if v221.action_type ~= nil and (v221.action_type ~= nil and v221.action_type ~= 0 or v221.action_type ~= v2.ActionType.fromNumber(0)) then
        v222.actionType = if typeof(v221.action_type) == "number" then v221.action_type else v2.ActionType.toNumber(v221.action_type);
    end;
    if v221.action_params ~= nil then
        v222.actionParams = v221.action_params:jsonEncode();
    end;
    return v222;
end;
v7.jsonDecode = function(v223) --[[ Line: 3704 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_8 (copy), v2 (copy)
    local v224 = l_v7_8.new();
    if v223.action_type ~= nil then
        v224.action_type = if typeof(v223.action_type) == "number" then v2.ActionType.fromNumber(v223.action_type) or v223.action_type else v2.ActionType.fromName(v223.action_type) or v223.action_type;
    end;
    if v223.actionType ~= nil then
        v224.action_type = if typeof(v223.actionType) == "number" then v2.ActionType.fromNumber(v223.actionType) or v223.actionType else v2.ActionType.fromName(v223.actionType) or v223.actionType;
    end;
    if v223.action_params ~= nil then
        v224.action_params = v2.OpenJoinFriendsAction_Params.jsonDecode(v223.action_params);
    end;
    if v223.actionParams ~= nil then
        v224.action_params = v2.OpenJoinFriendsAction_Params.jsonDecode(v223.actionParams);
    end;
    return v224;
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
v7.new = function(v226) --[[ Line: 3744 ]] --[[ Name: new ]]
    -- upvalues: l_v7_9 (copy)
    return (setmetatable({
        place_id = if not (v226 ~= nil) or v226.place_id == nil then nil else v226.place_id, 
        universe_id = if not (v226 ~= nil) or v226.universe_id == nil then nil else v226.universe_id
    }, l_v7_9));
end;
v7.encode = function(v227) --[[ Line: 3753 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v228 = buffer.create(0);
    local v229 = 0;
    if v227.place_id ~= nil then
        local v230 = v227.place_id:encode();
        local v231, v232 = v0.writeTag(v228, v229, 1, v0.wireTypes.lengthDelimited);
        v231, v232 = v0.writeBuffer(v231, v232, v230, buffer.len(v230));
        v228 = v231;
        v229 = v232;
    end;
    if v227.universe_id ~= nil then
        local v233 = v227.universe_id:encode();
        local v234, v235 = v0.writeTag(v228, v229, 2, v0.wireTypes.lengthDelimited);
        v234, v235 = v0.writeBuffer(v234, v235, v233, buffer.len(v233));
        v228 = v234;
        v229 = v235;
    end;
    local v236 = buffer.create(v229);
    buffer.copy(v236, 0, v228, 0, v229);
    return v236;
end;
v7.decode = function(v237) --[[ Line: 3774 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_9 (copy), v0 (copy), v5 (copy)
    local v238 = l_v7_9.new();
    local v239 = 0;
    while v239 < buffer.len(v237) do
        local v240 = nil;
        local v241 = nil;
        local v242, v243, v244 = v0.readTag(v237, v239);
        v240 = v242;
        v241 = v243;
        v239 = v244;
        if v241 == v0.wireTypes.varint then
            v242 = nil;
            v243, v244 = v0.readVarInt(v237, v239);
            v242 = v243;
            v239 = v244;
        elseif v241 == v0.wireTypes.lengthDelimited then
            if v240 == 1 then
                v242 = nil;
                v243, v244 = v0.readBuffer(v237, v239);
                v242 = v243;
                v239 = v244;
                v238.place_id = v5.StringProp.decode(v242);
            elseif v240 == 2 then
                v242 = nil;
                v243, v244 = v0.readBuffer(v237, v239);
                v242 = v243;
                v239 = v244;
                v238.universe_id = v5.StringProp.decode(v242);
            else
                v242 = nil;
                v243, v244 = v0.readVarInt(v237, v239);
                v239 = v244 + v243;
            end;
        elseif v241 == v0.wireTypes.i32 then
            v242 = nil;
            v243, v244 = v0.readFixed32(v237, v239);
            v242 = v243;
            v239 = v244;
        elseif v241 == v0.wireTypes.i64 then
            v242 = nil;
            v243, v244 = v0.readFixed64(v237, v239);
            v242 = v243;
            v239 = v244;
        else
            error("Unsupported wire type: " .. v241);
        end;
    end;
    return v238;
end;
v7.jsonEncode = function(v245) --[[ Line: 3822 ]] --[[ Name: jsonEncode ]]
    local v246 = {};
    if v245.place_id ~= nil then
        v246.placeId = v245.place_id:jsonEncode();
    end;
    if v245.universe_id ~= nil then
        v246.universeId = v245.universe_id:jsonEncode();
    end;
    return v246;
end;
v7.jsonDecode = function(v247) --[[ Line: 3836 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_9 (copy), v5 (copy)
    local v248 = l_v7_9.new();
    if v247.place_id ~= nil then
        v248.place_id = v5.StringProp.jsonDecode(v247.place_id);
    end;
    if v247.placeId ~= nil then
        v248.place_id = v5.StringProp.jsonDecode(v247.placeId);
    end;
    if v247.universe_id ~= nil then
        v248.universe_id = v5.StringProp.jsonDecode(v247.universe_id);
    end;
    if v247.universeId ~= nil then
        v248.universe_id = v5.StringProp.jsonDecode(v247.universeId);
    end;
    return v248;
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
v7.new = function(v250) --[[ Line: 3873 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_10 (copy)
    return (setmetatable({
        action_type = if not (v250 ~= nil) or v250.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v250.action_type, 
        action_params = if not (v250 ~= nil) or v250.action_params == nil then nil else v250.action_params
    }, l_v7_10));
end;
v7.encode = function(v251) --[[ Line: 3884 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v252 = buffer.create(0);
    local v253 = 0;
    if v251.action_type ~= nil and (v251.action_type ~= nil and v251.action_type ~= 0 or v251.action_type ~= v2.ActionType.fromNumber(0)) then
        local v254, v255 = v0.writeTag(v252, v253, 1, v0.wireTypes.varint);
        v254, v255 = v0.writeVarInt(v254, v255, v2.ActionType.toNumber(v251.action_type));
        v252 = v254;
        v253 = v255;
    end;
    if v251.action_params ~= nil then
        local v256 = v251.action_params:encode();
        local v257, v258 = v0.writeTag(v252, v253, 2, v0.wireTypes.lengthDelimited);
        v257, v258 = v0.writeBuffer(v257, v258, v256, buffer.len(v256));
        v252 = v257;
        v253 = v258;
    end;
    local v259 = buffer.create(v253);
    buffer.copy(v259, 0, v252, 0, v253);
    return v259;
end;
v7.decode = function(v260) --[[ Line: 3910 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_10 (copy), v0 (copy), v2 (copy)
    local v261 = l_v7_10.new();
    local v262 = 0;
    while v262 < buffer.len(v260) do
        local v263 = nil;
        local v264 = nil;
        local v265, v266, v267 = v0.readTag(v260, v262);
        v263 = v265;
        v264 = v266;
        v262 = v267;
        if v264 == v0.wireTypes.varint then
            if v263 == 1 then
                v265 = nil;
                v266, v267 = v0.readVarIntI32(v260, v262);
                v265 = v266;
                v262 = v267;
                v261.action_type = v2.ActionType.fromNumber(v265) or v265;
            else
                v265 = nil;
                v266, v267 = v0.readVarInt(v260, v262);
                v265 = v266;
                v262 = v267;
            end;
        elseif v264 == v0.wireTypes.lengthDelimited then
            if v263 == 2 then
                v265 = nil;
                v266, v267 = v0.readBuffer(v260, v262);
                v265 = v266;
                v262 = v267;
                v261.action_params = v2.OpenMarketplaceTryOnAction_Params.decode(v265);
            else
                v265 = nil;
                v266, v267 = v0.readVarInt(v260, v262);
                v262 = v267 + v266;
            end;
        elseif v264 == v0.wireTypes.i32 then
            v265 = nil;
            v266, v267 = v0.readFixed32(v260, v262);
            v265 = v266;
            v262 = v267;
        elseif v264 == v0.wireTypes.i64 then
            v265 = nil;
            v266, v267 = v0.readFixed64(v260, v262);
            v265 = v266;
            v262 = v267;
        else
            error("Unsupported wire type: " .. v264);
        end;
    end;
    return v261;
end;
v7.jsonEncode = function(v268) --[[ Line: 3958 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v269 = {};
    if v268.action_type ~= nil and (v268.action_type ~= nil and v268.action_type ~= 0 or v268.action_type ~= v2.ActionType.fromNumber(0)) then
        v269.actionType = if typeof(v268.action_type) == "number" then v268.action_type else v2.ActionType.toNumber(v268.action_type);
    end;
    if v268.action_params ~= nil then
        v269.actionParams = v268.action_params:jsonEncode();
    end;
    return v269;
end;
v7.jsonDecode = function(v270) --[[ Line: 3980 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_10 (copy), v2 (copy)
    local v271 = l_v7_10.new();
    if v270.action_type ~= nil then
        v271.action_type = if typeof(v270.action_type) == "number" then v2.ActionType.fromNumber(v270.action_type) or v270.action_type else v2.ActionType.fromName(v270.action_type) or v270.action_type;
    end;
    if v270.actionType ~= nil then
        v271.action_type = if typeof(v270.actionType) == "number" then v2.ActionType.fromNumber(v270.actionType) or v270.actionType else v2.ActionType.fromName(v270.actionType) or v270.actionType;
    end;
    if v270.action_params ~= nil then
        v271.action_params = v2.OpenMarketplaceTryOnAction_Params.jsonDecode(v270.action_params);
    end;
    if v270.actionParams ~= nil then
        v271.action_params = v2.OpenMarketplaceTryOnAction_Params.jsonDecode(v270.actionParams);
    end;
    return v271;
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
v7.new = function(v273) --[[ Line: 4020 ]] --[[ Name: new ]]
    -- upvalues: l_v7_11 (copy)
    return (setmetatable({
        item_id = if not (v273 ~= nil) or v273.item_id == nil then nil else v273.item_id, 
        item_type = if not (v273 ~= nil) or v273.item_type == nil then nil else v273.item_type, 
        item_sub_type_name = if not (v273 ~= nil) or v273.item_sub_type_name == nil then nil else v273.item_sub_type_name
    }, l_v7_11));
end;
v7.encode = function(v274) --[[ Line: 4030 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v275 = buffer.create(0);
    local v276 = 0;
    if v274.item_id ~= nil then
        local v277 = v274.item_id:encode();
        local v278, v279 = v0.writeTag(v275, v276, 1, v0.wireTypes.lengthDelimited);
        v278, v279 = v0.writeBuffer(v278, v279, v277, buffer.len(v277));
        v275 = v278;
        v276 = v279;
    end;
    if v274.item_type ~= nil then
        local v280 = v274.item_type:encode();
        local v281, v282 = v0.writeTag(v275, v276, 2, v0.wireTypes.lengthDelimited);
        v281, v282 = v0.writeBuffer(v281, v282, v280, buffer.len(v280));
        v275 = v281;
        v276 = v282;
    end;
    if v274.item_sub_type_name ~= nil then
        local v283 = v274.item_sub_type_name:encode();
        local v284, v285 = v0.writeTag(v275, v276, 3, v0.wireTypes.lengthDelimited);
        v284, v285 = v0.writeBuffer(v284, v285, v283, buffer.len(v283));
        v275 = v284;
        v276 = v285;
    end;
    local v286 = buffer.create(v276);
    buffer.copy(v286, 0, v275, 0, v276);
    return v286;
end;
v7.decode = function(v287) --[[ Line: 4057 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_11 (copy), v0 (copy), v5 (copy)
    local v288 = l_v7_11.new();
    local v289 = 0;
    while v289 < buffer.len(v287) do
        local v290 = nil;
        local v291 = nil;
        local v292, v293, v294 = v0.readTag(v287, v289);
        v290 = v292;
        v291 = v293;
        v289 = v294;
        if v291 == v0.wireTypes.varint then
            v292 = nil;
            v293, v294 = v0.readVarInt(v287, v289);
            v292 = v293;
            v289 = v294;
        elseif v291 == v0.wireTypes.lengthDelimited then
            if v290 == 1 then
                v292 = nil;
                v293, v294 = v0.readBuffer(v287, v289);
                v292 = v293;
                v289 = v294;
                v288.item_id = v5.StringProp.decode(v292);
            elseif v290 == 2 then
                v292 = nil;
                v293, v294 = v0.readBuffer(v287, v289);
                v292 = v293;
                v289 = v294;
                v288.item_type = v5.StringProp.decode(v292);
            elseif v290 == 3 then
                v292 = nil;
                v293, v294 = v0.readBuffer(v287, v289);
                v292 = v293;
                v289 = v294;
                v288.item_sub_type_name = v5.StringProp.decode(v292);
            else
                v292 = nil;
                v293, v294 = v0.readVarInt(v287, v289);
                v289 = v294 + v293;
            end;
        elseif v291 == v0.wireTypes.i32 then
            v292 = nil;
            v293, v294 = v0.readFixed32(v287, v289);
            v292 = v293;
            v289 = v294;
        elseif v291 == v0.wireTypes.i64 then
            v292 = nil;
            v293, v294 = v0.readFixed64(v287, v289);
            v292 = v293;
            v289 = v294;
        else
            error("Unsupported wire type: " .. v291);
        end;
    end;
    return v288;
end;
v7.jsonEncode = function(v295) --[[ Line: 4110 ]] --[[ Name: jsonEncode ]]
    local v296 = {};
    if v295.item_id ~= nil then
        v296.itemId = v295.item_id:jsonEncode();
    end;
    if v295.item_type ~= nil then
        v296.itemType = v295.item_type:jsonEncode();
    end;
    if v295.item_sub_type_name ~= nil then
        v296.itemSubTypeName = v295.item_sub_type_name:jsonEncode();
    end;
    return v296;
end;
v7.jsonDecode = function(v297) --[[ Line: 4128 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_11 (copy), v5 (copy)
    local v298 = l_v7_11.new();
    if v297.item_id ~= nil then
        v298.item_id = v5.StringProp.jsonDecode(v297.item_id);
    end;
    if v297.itemId ~= nil then
        v298.item_id = v5.StringProp.jsonDecode(v297.itemId);
    end;
    if v297.item_type ~= nil then
        v298.item_type = v5.StringProp.jsonDecode(v297.item_type);
    end;
    if v297.itemType ~= nil then
        v298.item_type = v5.StringProp.jsonDecode(v297.itemType);
    end;
    if v297.item_sub_type_name ~= nil then
        v298.item_sub_type_name = v5.StringProp.jsonDecode(v297.item_sub_type_name);
    end;
    if v297.itemSubTypeName ~= nil then
        v298.item_sub_type_name = v5.StringProp.jsonDecode(v297.itemSubTypeName);
    end;
    return v298;
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
v7.new = function(v300) --[[ Line: 4176 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_12 (copy)
    return (setmetatable({
        action_type = if not (v300 ~= nil) or v300.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v300.action_type, 
        action_params = if not (v300 ~= nil) or v300.action_params == nil then nil else v300.action_params
    }, l_v7_12));
end;
v7.encode = function(v301) --[[ Line: 4185 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v302 = buffer.create(0);
    local v303 = 0;
    if v301.action_type ~= nil and (v301.action_type ~= nil and v301.action_type ~= 0 or v301.action_type ~= v2.ActionType.fromNumber(0)) then
        local v304, v305 = v0.writeTag(v302, v303, 1, v0.wireTypes.varint);
        v304, v305 = v0.writeVarInt(v304, v305, v2.ActionType.toNumber(v301.action_type));
        v302 = v304;
        v303 = v305;
    end;
    if v301.action_params ~= nil then
        local v306 = v301.action_params:encode();
        local v307, v308 = v0.writeTag(v302, v303, 2, v0.wireTypes.lengthDelimited);
        v307, v308 = v0.writeBuffer(v307, v308, v306, buffer.len(v306));
        v302 = v307;
        v303 = v308;
    end;
    local v309 = buffer.create(v303);
    buffer.copy(v309, 0, v302, 0, v303);
    return v309;
end;
v7.decode = function(v310) --[[ Line: 4211 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_12 (copy), v0 (copy), v2 (copy)
    local v311 = l_v7_12.new();
    local v312 = 0;
    while v312 < buffer.len(v310) do
        local v313 = nil;
        local v314 = nil;
        local v315, v316, v317 = v0.readTag(v310, v312);
        v313 = v315;
        v314 = v316;
        v312 = v317;
        if v314 == v0.wireTypes.varint then
            if v313 == 1 then
                v315 = nil;
                v316, v317 = v0.readVarIntI32(v310, v312);
                v315 = v316;
                v312 = v317;
                v311.action_type = v2.ActionType.fromNumber(v315) or v315;
            else
                v315 = nil;
                v316, v317 = v0.readVarInt(v310, v312);
                v315 = v316;
                v312 = v317;
            end;
        elseif v314 == v0.wireTypes.lengthDelimited then
            if v313 == 2 then
                v315 = nil;
                v316, v317 = v0.readBuffer(v310, v312);
                v315 = v316;
                v312 = v317;
                v311.action_params = v2.OpenSeeAllAction_Params.decode(v315);
            else
                v315 = nil;
                v316, v317 = v0.readVarInt(v310, v312);
                v312 = v317 + v316;
            end;
        elseif v314 == v0.wireTypes.i32 then
            v315 = nil;
            v316, v317 = v0.readFixed32(v310, v312);
            v315 = v316;
            v312 = v317;
        elseif v314 == v0.wireTypes.i64 then
            v315 = nil;
            v316, v317 = v0.readFixed64(v310, v312);
            v315 = v316;
            v312 = v317;
        else
            error("Unsupported wire type: " .. v314);
        end;
    end;
    return v311;
end;
v7.jsonEncode = function(v318) --[[ Line: 4259 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v319 = {};
    if v318.action_type ~= nil and (v318.action_type ~= nil and v318.action_type ~= 0 or v318.action_type ~= v2.ActionType.fromNumber(0)) then
        v319.actionType = if typeof(v318.action_type) == "number" then v318.action_type else v2.ActionType.toNumber(v318.action_type);
    end;
    if v318.action_params ~= nil then
        v319.actionParams = v318.action_params:jsonEncode();
    end;
    return v319;
end;
v7.jsonDecode = function(v320) --[[ Line: 4281 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_12 (copy), v2 (copy)
    local v321 = l_v7_12.new();
    if v320.action_type ~= nil then
        v321.action_type = if typeof(v320.action_type) == "number" then v2.ActionType.fromNumber(v320.action_type) or v320.action_type else v2.ActionType.fromName(v320.action_type) or v320.action_type;
    end;
    if v320.actionType ~= nil then
        v321.action_type = if typeof(v320.actionType) == "number" then v2.ActionType.fromNumber(v320.actionType) or v320.actionType else v2.ActionType.fromName(v320.actionType) or v320.actionType;
    end;
    if v320.action_params ~= nil then
        v321.action_params = v2.OpenSeeAllAction_Params.jsonDecode(v320.action_params);
    end;
    if v320.actionParams ~= nil then
        v321.action_params = v2.OpenSeeAllAction_Params.jsonDecode(v320.actionParams);
    end;
    return v321;
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
v7.new = function(v323) --[[ Line: 4321 ]] --[[ Name: new ]]
    -- upvalues: l_v7_13 (copy)
    return (setmetatable({
        collection_id = if not (v323 ~= nil) or v323.collection_id == nil then nil else v323.collection_id, 
        game_set_target_id = if not (v323 ~= nil) or v323.game_set_target_id == nil then nil else v323.game_set_target_id, 
        collection_position = if not (v323 ~= nil) or v323.collection_position == nil then nil else v323.collection_position
    }, l_v7_13));
end;
v7.encode = function(v324) --[[ Line: 4331 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v325 = buffer.create(0);
    local v326 = 0;
    if v324.collection_id ~= nil then
        local v327 = v324.collection_id:encode();
        local v328, v329 = v0.writeTag(v325, v326, 1, v0.wireTypes.lengthDelimited);
        v328, v329 = v0.writeBuffer(v328, v329, v327, buffer.len(v327));
        v325 = v328;
        v326 = v329;
    end;
    if v324.game_set_target_id ~= nil then
        local v330 = v324.game_set_target_id:encode();
        local v331, v332 = v0.writeTag(v325, v326, 2, v0.wireTypes.lengthDelimited);
        v331, v332 = v0.writeBuffer(v331, v332, v330, buffer.len(v330));
        v325 = v331;
        v326 = v332;
    end;
    if v324.collection_position ~= nil then
        local v333 = v324.collection_position:encode();
        local v334, v335 = v0.writeTag(v325, v326, 3, v0.wireTypes.lengthDelimited);
        v334, v335 = v0.writeBuffer(v334, v335, v333, buffer.len(v333));
        v325 = v334;
        v326 = v335;
    end;
    local v336 = buffer.create(v326);
    buffer.copy(v336, 0, v325, 0, v326);
    return v336;
end;
v7.decode = function(v337) --[[ Line: 4358 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_13 (copy), v0 (copy), v5 (copy)
    local v338 = l_v7_13.new();
    local v339 = 0;
    while v339 < buffer.len(v337) do
        local v340 = nil;
        local v341 = nil;
        local v342, v343, v344 = v0.readTag(v337, v339);
        v340 = v342;
        v341 = v343;
        v339 = v344;
        if v341 == v0.wireTypes.varint then
            v342 = nil;
            v343, v344 = v0.readVarInt(v337, v339);
            v342 = v343;
            v339 = v344;
        elseif v341 == v0.wireTypes.lengthDelimited then
            if v340 == 1 then
                v342 = nil;
                v343, v344 = v0.readBuffer(v337, v339);
                v342 = v343;
                v339 = v344;
                v338.collection_id = v5.StringProp.decode(v342);
            elseif v340 == 2 then
                v342 = nil;
                v343, v344 = v0.readBuffer(v337, v339);
                v342 = v343;
                v339 = v344;
                v338.game_set_target_id = v5.StringProp.decode(v342);
            elseif v340 == 3 then
                v342 = nil;
                v343, v344 = v0.readBuffer(v337, v339);
                v342 = v343;
                v339 = v344;
                v338.collection_position = v5.StringProp.decode(v342);
            else
                v342 = nil;
                v343, v344 = v0.readVarInt(v337, v339);
                v339 = v344 + v343;
            end;
        elseif v341 == v0.wireTypes.i32 then
            v342 = nil;
            v343, v344 = v0.readFixed32(v337, v339);
            v342 = v343;
            v339 = v344;
        elseif v341 == v0.wireTypes.i64 then
            v342 = nil;
            v343, v344 = v0.readFixed64(v337, v339);
            v342 = v343;
            v339 = v344;
        else
            error("Unsupported wire type: " .. v341);
        end;
    end;
    return v338;
end;
v7.jsonEncode = function(v345) --[[ Line: 4412 ]] --[[ Name: jsonEncode ]]
    local v346 = {};
    if v345.collection_id ~= nil then
        v346.collectionId = v345.collection_id:jsonEncode();
    end;
    if v345.game_set_target_id ~= nil then
        v346.gameSetTargetId = v345.game_set_target_id:jsonEncode();
    end;
    if v345.collection_position ~= nil then
        v346.collectionPosition = v345.collection_position:jsonEncode();
    end;
    return v346;
end;
v7.jsonDecode = function(v347) --[[ Line: 4430 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_13 (copy), v5 (copy)
    local v348 = l_v7_13.new();
    if v347.collection_id ~= nil then
        v348.collection_id = v5.StringProp.jsonDecode(v347.collection_id);
    end;
    if v347.collectionId ~= nil then
        v348.collection_id = v5.StringProp.jsonDecode(v347.collectionId);
    end;
    if v347.game_set_target_id ~= nil then
        v348.game_set_target_id = v5.StringProp.jsonDecode(v347.game_set_target_id);
    end;
    if v347.gameSetTargetId ~= nil then
        v348.game_set_target_id = v5.StringProp.jsonDecode(v347.gameSetTargetId);
    end;
    if v347.collection_position ~= nil then
        v348.collection_position = v5.StringProp.jsonDecode(v347.collection_position);
    end;
    if v347.collectionPosition ~= nil then
        v348.collection_position = v5.StringProp.jsonDecode(v347.collectionPosition);
    end;
    return v348;
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
v7.new = function(v350) --[[ Line: 4480 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_14 (copy)
    return (setmetatable({
        action_type = if not (v350 ~= nil) or v350.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v350.action_type, 
        action_params = if not (v350 ~= nil) or v350.action_params == nil then nil else v350.action_params
    }, l_v7_14));
end;
v7.encode = function(v351) --[[ Line: 4491 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v352 = buffer.create(0);
    local v353 = 0;
    if v351.action_type ~= nil and (v351.action_type ~= nil and v351.action_type ~= 0 or v351.action_type ~= v2.ActionType.fromNumber(0)) then
        local v354, v355 = v0.writeTag(v352, v353, 1, v0.wireTypes.varint);
        v354, v355 = v0.writeVarInt(v354, v355, v2.ActionType.toNumber(v351.action_type));
        v352 = v354;
        v353 = v355;
    end;
    if v351.action_params ~= nil then
        local v356 = v351.action_params:encode();
        local v357, v358 = v0.writeTag(v352, v353, 2, v0.wireTypes.lengthDelimited);
        v357, v358 = v0.writeBuffer(v357, v358, v356, buffer.len(v356));
        v352 = v357;
        v353 = v358;
    end;
    local v359 = buffer.create(v353);
    buffer.copy(v359, 0, v352, 0, v353);
    return v359;
end;
v7.decode = function(v360) --[[ Line: 4517 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_14 (copy), v0 (copy), v2 (copy)
    local v361 = l_v7_14.new();
    local v362 = 0;
    while v362 < buffer.len(v360) do
        local v363 = nil;
        local v364 = nil;
        local v365, v366, v367 = v0.readTag(v360, v362);
        v363 = v365;
        v364 = v366;
        v362 = v367;
        if v364 == v0.wireTypes.varint then
            if v363 == 1 then
                v365 = nil;
                v366, v367 = v0.readVarIntI32(v360, v362);
                v365 = v366;
                v362 = v367;
                v361.action_type = v2.ActionType.fromNumber(v365) or v365;
            else
                v365 = nil;
                v366, v367 = v0.readVarInt(v360, v362);
                v365 = v366;
                v362 = v367;
            end;
        elseif v364 == v0.wireTypes.lengthDelimited then
            if v363 == 2 then
                v365 = nil;
                v366, v367 = v0.readBuffer(v360, v362);
                v365 = v366;
                v362 = v367;
                v361.action_params = v2.OpenSponsoredTooltipAction_Params.decode(v365);
            else
                v365 = nil;
                v366, v367 = v0.readVarInt(v360, v362);
                v362 = v367 + v366;
            end;
        elseif v364 == v0.wireTypes.i32 then
            v365 = nil;
            v366, v367 = v0.readFixed32(v360, v362);
            v365 = v366;
            v362 = v367;
        elseif v364 == v0.wireTypes.i64 then
            v365 = nil;
            v366, v367 = v0.readFixed64(v360, v362);
            v365 = v366;
            v362 = v367;
        else
            error("Unsupported wire type: " .. v364);
        end;
    end;
    return v361;
end;
v7.jsonEncode = function(v368) --[[ Line: 4565 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v369 = {};
    if v368.action_type ~= nil and (v368.action_type ~= nil and v368.action_type ~= 0 or v368.action_type ~= v2.ActionType.fromNumber(0)) then
        v369.actionType = if typeof(v368.action_type) == "number" then v368.action_type else v2.ActionType.toNumber(v368.action_type);
    end;
    if v368.action_params ~= nil then
        v369.actionParams = v368.action_params:jsonEncode();
    end;
    return v369;
end;
v7.jsonDecode = function(v370) --[[ Line: 4587 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_14 (copy), v2 (copy)
    local v371 = l_v7_14.new();
    if v370.action_type ~= nil then
        v371.action_type = if typeof(v370.action_type) == "number" then v2.ActionType.fromNumber(v370.action_type) or v370.action_type else v2.ActionType.fromName(v370.action_type) or v370.action_type;
    end;
    if v370.actionType ~= nil then
        v371.action_type = if typeof(v370.actionType) == "number" then v2.ActionType.fromNumber(v370.actionType) or v370.actionType else v2.ActionType.fromName(v370.actionType) or v370.actionType;
    end;
    if v370.action_params ~= nil then
        v371.action_params = v2.OpenSponsoredTooltipAction_Params.jsonDecode(v370.action_params);
    end;
    if v370.actionParams ~= nil then
        v371.action_params = v2.OpenSponsoredTooltipAction_Params.jsonDecode(v370.actionParams);
    end;
    return v371;
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
v7.new = function(_) --[[ Line: 4627 ]] --[[ Name: new ]]
    -- upvalues: l_v7_15 (copy)
    return (setmetatable({}, l_v7_15));
end;
v7.encode = function(_) --[[ Line: 4633 ]] --[[ Name: encode ]]
    local v375 = buffer.create(0);
    local v376 = buffer.create(0);
    buffer.copy(v376, 0, v375, 0, 0);
    return v376;
end;
v7.decode = function(v377) --[[ Line: 4642 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_15 (copy), v0 (copy)
    local v378 = l_v7_15.new();
    local v379 = 0;
    while v379 < buffer.len(v377) do
        local v380 = nil;
        local v381 = nil;
        local v382, v383, v384 = v0.readTag(v377, v379);
        v380 = v382;
        v381 = v383;
        v379 = v384;
        if v381 == v0.wireTypes.varint then
            v382 = nil;
            v383, v384 = v0.readVarInt(v377, v379);
            v382 = v383;
            v379 = v384;
        elseif v381 == v0.wireTypes.lengthDelimited then
            v382 = nil;
            v383, v384 = v0.readVarInt(v377, v379);
            v379 = v384 + v383;
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
v7.jsonEncode = function(_) --[[ Line: 4680 ]] --[[ Name: jsonEncode ]]
    return {};
end;
v7.jsonDecode = function(_) --[[ Line: 4686 ]] --[[ Name: jsonDecode ]]
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
v7.new = function(v388) --[[ Line: 4708 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_16 (copy)
    return (setmetatable({
        action_type = if not (v388 ~= nil) or v388.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v388.action_type, 
        action_params = if not (v388 ~= nil) or v388.action_params == nil then nil else v388.action_params
    }, l_v7_16));
end;
v7.encode = function(v389) --[[ Line: 4717 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v390 = buffer.create(0);
    local v391 = 0;
    if v389.action_type ~= nil and (v389.action_type ~= nil and v389.action_type ~= 0 or v389.action_type ~= v2.ActionType.fromNumber(0)) then
        local v392, v393 = v0.writeTag(v390, v391, 1, v0.wireTypes.varint);
        v392, v393 = v0.writeVarInt(v392, v393, v2.ActionType.toNumber(v389.action_type));
        v390 = v392;
        v391 = v393;
    end;
    if v389.action_params ~= nil then
        local v394 = v389.action_params:encode();
        local v395, v396 = v0.writeTag(v390, v391, 2, v0.wireTypes.lengthDelimited);
        v395, v396 = v0.writeBuffer(v395, v396, v394, buffer.len(v394));
        v390 = v395;
        v391 = v396;
    end;
    local v397 = buffer.create(v391);
    buffer.copy(v397, 0, v390, 0, v391);
    return v397;
end;
v7.decode = function(v398) --[[ Line: 4743 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_16 (copy), v0 (copy), v2 (copy)
    local v399 = l_v7_16.new();
    local v400 = 0;
    while v400 < buffer.len(v398) do
        local v401 = nil;
        local v402 = nil;
        local v403, v404, v405 = v0.readTag(v398, v400);
        v401 = v403;
        v402 = v404;
        v400 = v405;
        if v402 == v0.wireTypes.varint then
            if v401 == 1 then
                v403 = nil;
                v404, v405 = v0.readVarIntI32(v398, v400);
                v403 = v404;
                v400 = v405;
                v399.action_type = v2.ActionType.fromNumber(v403) or v403;
            else
                v403 = nil;
                v404, v405 = v0.readVarInt(v398, v400);
                v403 = v404;
                v400 = v405;
            end;
        elseif v402 == v0.wireTypes.lengthDelimited then
            if v401 == 2 then
                v403 = nil;
                v404, v405 = v0.readBuffer(v398, v400);
                v403 = v404;
                v400 = v405;
                v399.action_params = v2.PlayButtonClickAction_Params.decode(v403);
            else
                v403 = nil;
                v404, v405 = v0.readVarInt(v398, v400);
                v400 = v405 + v404;
            end;
        elseif v402 == v0.wireTypes.i32 then
            v403 = nil;
            v404, v405 = v0.readFixed32(v398, v400);
            v403 = v404;
            v400 = v405;
        elseif v402 == v0.wireTypes.i64 then
            v403 = nil;
            v404, v405 = v0.readFixed64(v398, v400);
            v403 = v404;
            v400 = v405;
        else
            error("Unsupported wire type: " .. v402);
        end;
    end;
    return v399;
end;
v7.jsonEncode = function(v406) --[[ Line: 4791 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v407 = {};
    if v406.action_type ~= nil and (v406.action_type ~= nil and v406.action_type ~= 0 or v406.action_type ~= v2.ActionType.fromNumber(0)) then
        v407.actionType = if typeof(v406.action_type) == "number" then v406.action_type else v2.ActionType.toNumber(v406.action_type);
    end;
    if v406.action_params ~= nil then
        v407.actionParams = v406.action_params:jsonEncode();
    end;
    return v407;
end;
v7.jsonDecode = function(v408) --[[ Line: 4813 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_16 (copy), v2 (copy)
    local v409 = l_v7_16.new();
    if v408.action_type ~= nil then
        v409.action_type = if typeof(v408.action_type) == "number" then v2.ActionType.fromNumber(v408.action_type) or v408.action_type else v2.ActionType.fromName(v408.action_type) or v408.action_type;
    end;
    if v408.actionType ~= nil then
        v409.action_type = if typeof(v408.actionType) == "number" then v2.ActionType.fromNumber(v408.actionType) or v408.actionType else v2.ActionType.fromName(v408.actionType) or v408.actionType;
    end;
    if v408.action_params ~= nil then
        v409.action_params = v2.PlayButtonClickAction_Params.jsonDecode(v408.action_params);
    end;
    if v408.actionParams ~= nil then
        v409.action_params = v2.PlayButtonClickAction_Params.jsonDecode(v408.actionParams);
    end;
    return v409;
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
v7.new = function(_) --[[ Line: 4853 ]] --[[ Name: new ]]
    -- upvalues: l_v7_17 (copy)
    return (setmetatable({}, l_v7_17));
end;
v7.encode = function(_) --[[ Line: 4859 ]] --[[ Name: encode ]]
    local v413 = buffer.create(0);
    local v414 = buffer.create(0);
    buffer.copy(v414, 0, v413, 0, 0);
    return v414;
end;
v7.decode = function(v415) --[[ Line: 4868 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_17 (copy), v0 (copy)
    local v416 = l_v7_17.new();
    local v417 = 0;
    while v417 < buffer.len(v415) do
        local v418 = nil;
        local v419 = nil;
        local v420, v421, v422 = v0.readTag(v415, v417);
        v418 = v420;
        v419 = v421;
        v417 = v422;
        if v419 == v0.wireTypes.varint then
            v420 = nil;
            v421, v422 = v0.readVarInt(v415, v417);
            v420 = v421;
            v417 = v422;
        elseif v419 == v0.wireTypes.lengthDelimited then
            v420 = nil;
            v421, v422 = v0.readVarInt(v415, v417);
            v417 = v422 + v421;
        elseif v419 == v0.wireTypes.i32 then
            v420 = nil;
            v421, v422 = v0.readFixed32(v415, v417);
            v420 = v421;
            v417 = v422;
        elseif v419 == v0.wireTypes.i64 then
            v420 = nil;
            v421, v422 = v0.readFixed64(v415, v417);
            v420 = v421;
            v417 = v422;
        else
            error("Unsupported wire type: " .. v419);
        end;
    end;
    return v416;
end;
v7.jsonEncode = function(_) --[[ Line: 4906 ]] --[[ Name: jsonEncode ]]
    return {};
end;
v7.jsonDecode = function(_) --[[ Line: 4912 ]] --[[ Name: jsonDecode ]]
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
v7.new = function(v426) --[[ Line: 4932 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_18 (copy)
    return (setmetatable({
        action_type = if not (v426 ~= nil) or v426.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v426.action_type, 
        action_params = if not (v426 ~= nil) or v426.action_params == nil then nil else v426.action_params
    }, l_v7_18));
end;
v7.encode = function(v427) --[[ Line: 4941 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v428 = buffer.create(0);
    local v429 = 0;
    if v427.action_type ~= nil and (v427.action_type ~= nil and v427.action_type ~= 0 or v427.action_type ~= v2.ActionType.fromNumber(0)) then
        local v430, v431 = v0.writeTag(v428, v429, 1, v0.wireTypes.varint);
        v430, v431 = v0.writeVarInt(v430, v431, v2.ActionType.toNumber(v427.action_type));
        v428 = v430;
        v429 = v431;
    end;
    if v427.action_params ~= nil then
        local v432 = v427.action_params:encode();
        local v433, v434 = v0.writeTag(v428, v429, 2, v0.wireTypes.lengthDelimited);
        v433, v434 = v0.writeBuffer(v433, v434, v432, buffer.len(v432));
        v428 = v433;
        v429 = v434;
    end;
    local v435 = buffer.create(v429);
    buffer.copy(v435, 0, v428, 0, v429);
    return v435;
end;
v7.decode = function(v436) --[[ Line: 4967 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_18 (copy), v0 (copy), v2 (copy)
    local v437 = l_v7_18.new();
    local v438 = 0;
    while v438 < buffer.len(v436) do
        local v439 = nil;
        local v440 = nil;
        local v441, v442, v443 = v0.readTag(v436, v438);
        v439 = v441;
        v440 = v442;
        v438 = v443;
        if v440 == v0.wireTypes.varint then
            if v439 == 1 then
                v441 = nil;
                v442, v443 = v0.readVarIntI32(v436, v438);
                v441 = v442;
                v438 = v443;
                v437.action_type = v2.ActionType.fromNumber(v441) or v441;
            else
                v441 = nil;
                v442, v443 = v0.readVarInt(v436, v438);
                v441 = v442;
                v438 = v443;
            end;
        elseif v440 == v0.wireTypes.lengthDelimited then
            if v439 == 2 then
                v441 = nil;
                v442, v443 = v0.readBuffer(v436, v438);
                v441 = v442;
                v438 = v443;
                v437.action_params = v2.UpdateUserSettingsAction_Params.decode(v441);
            else
                v441 = nil;
                v442, v443 = v0.readVarInt(v436, v438);
                v438 = v443 + v442;
            end;
        elseif v440 == v0.wireTypes.i32 then
            v441 = nil;
            v442, v443 = v0.readFixed32(v436, v438);
            v441 = v442;
            v438 = v443;
        elseif v440 == v0.wireTypes.i64 then
            v441 = nil;
            v442, v443 = v0.readFixed64(v436, v438);
            v441 = v442;
            v438 = v443;
        else
            error("Unsupported wire type: " .. v440);
        end;
    end;
    return v437;
end;
v7.jsonEncode = function(v444) --[[ Line: 5015 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v445 = {};
    if v444.action_type ~= nil and (v444.action_type ~= nil and v444.action_type ~= 0 or v444.action_type ~= v2.ActionType.fromNumber(0)) then
        v445.actionType = if typeof(v444.action_type) == "number" then v444.action_type else v2.ActionType.toNumber(v444.action_type);
    end;
    if v444.action_params ~= nil then
        v445.actionParams = v444.action_params:jsonEncode();
    end;
    return v445;
end;
v7.jsonDecode = function(v446) --[[ Line: 5037 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_18 (copy), v2 (copy)
    local v447 = l_v7_18.new();
    if v446.action_type ~= nil then
        v447.action_type = if typeof(v446.action_type) == "number" then v2.ActionType.fromNumber(v446.action_type) or v446.action_type else v2.ActionType.fromName(v446.action_type) or v446.action_type;
    end;
    if v446.actionType ~= nil then
        v447.action_type = if typeof(v446.actionType) == "number" then v2.ActionType.fromNumber(v446.actionType) or v446.actionType else v2.ActionType.fromName(v446.actionType) or v446.actionType;
    end;
    if v446.action_params ~= nil then
        v447.action_params = v2.UpdateUserSettingsAction_Params.jsonDecode(v446.action_params);
    end;
    if v446.actionParams ~= nil then
        v447.action_params = v2.UpdateUserSettingsAction_Params.jsonDecode(v446.actionParams);
    end;
    return v447;
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
v7.new = function(v449) --[[ Line: 5077 ]] --[[ Name: new ]]
    -- upvalues: l_v7_19 (copy)
    return (setmetatable({
        settings = if not (v449 ~= nil) or v449.settings == nil then nil else v449.settings, 
        audit_data = if not (v449 ~= nil) or v449.audit_data == nil then nil else v449.audit_data
    }, l_v7_19));
end;
v7.encode = function(v450) --[[ Line: 5086 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v451 = buffer.create(0);
    local v452 = 0;
    if v450.settings ~= nil then
        local v453 = v450.settings:encode();
        local v454, v455 = v0.writeTag(v451, v452, 1, v0.wireTypes.lengthDelimited);
        v454, v455 = v0.writeBuffer(v454, v455, v453, buffer.len(v453));
        v451 = v454;
        v452 = v455;
    end;
    if v450.audit_data ~= nil then
        local v456 = v450.audit_data:encode();
        local v457, v458 = v0.writeTag(v451, v452, 2, v0.wireTypes.lengthDelimited);
        v457, v458 = v0.writeBuffer(v457, v458, v456, buffer.len(v456));
        v451 = v457;
        v452 = v458;
    end;
    local v459 = buffer.create(v452);
    buffer.copy(v459, 0, v451, 0, v452);
    return v459;
end;
v7.decode = function(v460) --[[ Line: 5107 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_19 (copy), v0 (copy), v5 (copy)
    local v461 = l_v7_19.new();
    local v462 = 0;
    while v462 < buffer.len(v460) do
        local v463 = nil;
        local v464 = nil;
        local v465, v466, v467 = v0.readTag(v460, v462);
        v463 = v465;
        v464 = v466;
        v462 = v467;
        if v464 == v0.wireTypes.varint then
            v465 = nil;
            v466, v467 = v0.readVarInt(v460, v462);
            v465 = v466;
            v462 = v467;
        elseif v464 == v0.wireTypes.lengthDelimited then
            if v463 == 1 then
                v465 = nil;
                v466, v467 = v0.readBuffer(v460, v462);
                v465 = v466;
                v462 = v467;
                v461.settings = v5.StructProp.decode(v465);
            elseif v463 == 2 then
                v465 = nil;
                v466, v467 = v0.readBuffer(v460, v462);
                v465 = v466;
                v462 = v467;
                v461.audit_data = v5.StringProp.decode(v465);
            else
                v465 = nil;
                v466, v467 = v0.readVarInt(v460, v462);
                v462 = v467 + v466;
            end;
        elseif v464 == v0.wireTypes.i32 then
            v465 = nil;
            v466, v467 = v0.readFixed32(v460, v462);
            v465 = v466;
            v462 = v467;
        elseif v464 == v0.wireTypes.i64 then
            v465 = nil;
            v466, v467 = v0.readFixed64(v460, v462);
            v465 = v466;
            v462 = v467;
        else
            error("Unsupported wire type: " .. v464);
        end;
    end;
    return v461;
end;
v7.jsonEncode = function(v468) --[[ Line: 5155 ]] --[[ Name: jsonEncode ]]
    local v469 = {};
    if v468.settings ~= nil then
        v469.settings = v468.settings:jsonEncode();
    end;
    if v468.audit_data ~= nil then
        v469.auditData = v468.audit_data:jsonEncode();
    end;
    return v469;
end;
v7.jsonDecode = function(v470) --[[ Line: 5169 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_19 (copy), v5 (copy)
    local v471 = l_v7_19.new();
    if v470.settings ~= nil then
        v471.settings = v5.StructProp.jsonDecode(v470.settings);
    end;
    if v470.audit_data ~= nil then
        v471.audit_data = v5.StringProp.jsonDecode(v470.audit_data);
    end;
    if v470.auditData ~= nil then
        v471.audit_data = v5.StringProp.jsonDecode(v470.auditData);
    end;
    return v471;
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
v7.new = function(v473) --[[ Line: 5201 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_20 (copy)
    return (setmetatable({
        action_type = if not (v473 ~= nil) or v473.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v473.action_type, 
        action_params = if not (v473 ~= nil) or v473.action_params == nil then nil else v473.action_params
    }, l_v7_20));
end;
v7.encode = function(v474) --[[ Line: 5210 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v475 = buffer.create(0);
    local v476 = 0;
    if v474.action_type ~= nil and (v474.action_type ~= nil and v474.action_type ~= 0 or v474.action_type ~= v2.ActionType.fromNumber(0)) then
        local v477, v478 = v0.writeTag(v475, v476, 1, v0.wireTypes.varint);
        v477, v478 = v0.writeVarInt(v477, v478, v2.ActionType.toNumber(v474.action_type));
        v475 = v477;
        v476 = v478;
    end;
    if v474.action_params ~= nil then
        local v479 = v474.action_params:encode();
        local v480, v481 = v0.writeTag(v475, v476, 2, v0.wireTypes.lengthDelimited);
        v480, v481 = v0.writeBuffer(v480, v481, v479, buffer.len(v479));
        v475 = v480;
        v476 = v481;
    end;
    local v482 = buffer.create(v476);
    buffer.copy(v482, 0, v475, 0, v476);
    return v482;
end;
v7.decode = function(v483) --[[ Line: 5236 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_20 (copy), v0 (copy), v2 (copy)
    local v484 = l_v7_20.new();
    local v485 = 0;
    while v485 < buffer.len(v483) do
        local v486 = nil;
        local v487 = nil;
        local v488, v489, v490 = v0.readTag(v483, v485);
        v486 = v488;
        v487 = v489;
        v485 = v490;
        if v487 == v0.wireTypes.varint then
            if v486 == 1 then
                v488 = nil;
                v489, v490 = v0.readVarIntI32(v483, v485);
                v488 = v489;
                v485 = v490;
                v484.action_type = v2.ActionType.fromNumber(v488) or v488;
            else
                v488 = nil;
                v489, v490 = v0.readVarInt(v483, v485);
                v488 = v489;
                v485 = v490;
            end;
        elseif v487 == v0.wireTypes.lengthDelimited then
            if v486 == 2 then
                v488 = nil;
                v489, v490 = v0.readBuffer(v483, v485);
                v488 = v489;
                v485 = v490;
                v484.action_params = v2.OpenTooltipAction_Params.decode(v488);
            else
                v488 = nil;
                v489, v490 = v0.readVarInt(v483, v485);
                v485 = v490 + v489;
            end;
        elseif v487 == v0.wireTypes.i32 then
            v488 = nil;
            v489, v490 = v0.readFixed32(v483, v485);
            v488 = v489;
            v485 = v490;
        elseif v487 == v0.wireTypes.i64 then
            v488 = nil;
            v489, v490 = v0.readFixed64(v483, v485);
            v488 = v489;
            v485 = v490;
        else
            error("Unsupported wire type: " .. v487);
        end;
    end;
    return v484;
end;
v7.jsonEncode = function(v491) --[[ Line: 5284 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v492 = {};
    if v491.action_type ~= nil and (v491.action_type ~= nil and v491.action_type ~= 0 or v491.action_type ~= v2.ActionType.fromNumber(0)) then
        v492.actionType = if typeof(v491.action_type) == "number" then v491.action_type else v2.ActionType.toNumber(v491.action_type);
    end;
    if v491.action_params ~= nil then
        v492.actionParams = v491.action_params:jsonEncode();
    end;
    return v492;
end;
v7.jsonDecode = function(v493) --[[ Line: 5306 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_20 (copy), v2 (copy)
    local v494 = l_v7_20.new();
    if v493.action_type ~= nil then
        v494.action_type = if typeof(v493.action_type) == "number" then v2.ActionType.fromNumber(v493.action_type) or v493.action_type else v2.ActionType.fromName(v493.action_type) or v493.action_type;
    end;
    if v493.actionType ~= nil then
        v494.action_type = if typeof(v493.actionType) == "number" then v2.ActionType.fromNumber(v493.actionType) or v493.actionType else v2.ActionType.fromName(v493.actionType) or v493.actionType;
    end;
    if v493.action_params ~= nil then
        v494.action_params = v2.OpenTooltipAction_Params.jsonDecode(v493.action_params);
    end;
    if v493.actionParams ~= nil then
        v494.action_params = v2.OpenTooltipAction_Params.jsonDecode(v493.actionParams);
    end;
    return v494;
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
v7.new = function(v496) --[[ Line: 5346 ]] --[[ Name: new ]]
    -- upvalues: l_v7_21 (copy)
    return (setmetatable({
        tooltip_title = if not (v496 ~= nil) or v496.tooltip_title == nil then nil else v496.tooltip_title, 
        tooltip_info_text = if not (v496 ~= nil) or v496.tooltip_info_text == nil then nil else v496.tooltip_info_text
    }, l_v7_21));
end;
v7.encode = function(v497) --[[ Line: 5353 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v498 = buffer.create(0);
    local v499 = 0;
    if v497.tooltip_title ~= nil then
        local v500 = v497.tooltip_title:encode();
        local v501, v502 = v0.writeTag(v498, v499, 1, v0.wireTypes.lengthDelimited);
        v501, v502 = v0.writeBuffer(v501, v502, v500, buffer.len(v500));
        v498 = v501;
        v499 = v502;
    end;
    if v497.tooltip_info_text ~= nil then
        local v503 = v497.tooltip_info_text:encode();
        local v504, v505 = v0.writeTag(v498, v499, 2, v0.wireTypes.lengthDelimited);
        v504, v505 = v0.writeBuffer(v504, v505, v503, buffer.len(v503));
        v498 = v504;
        v499 = v505;
    end;
    local v506 = buffer.create(v499);
    buffer.copy(v506, 0, v498, 0, v499);
    return v506;
end;
v7.decode = function(v507) --[[ Line: 5374 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_21 (copy), v0 (copy), v5 (copy)
    local v508 = l_v7_21.new();
    local v509 = 0;
    while v509 < buffer.len(v507) do
        local v510 = nil;
        local v511 = nil;
        local v512, v513, v514 = v0.readTag(v507, v509);
        v510 = v512;
        v511 = v513;
        v509 = v514;
        if v511 == v0.wireTypes.varint then
            v512 = nil;
            v513, v514 = v0.readVarInt(v507, v509);
            v512 = v513;
            v509 = v514;
        elseif v511 == v0.wireTypes.lengthDelimited then
            if v510 == 1 then
                v512 = nil;
                v513, v514 = v0.readBuffer(v507, v509);
                v512 = v513;
                v509 = v514;
                v508.tooltip_title = v5.StringProp.decode(v512);
            elseif v510 == 2 then
                v512 = nil;
                v513, v514 = v0.readBuffer(v507, v509);
                v512 = v513;
                v509 = v514;
                v508.tooltip_info_text = v5.StringProp.decode(v512);
            else
                v512 = nil;
                v513, v514 = v0.readVarInt(v507, v509);
                v509 = v514 + v513;
            end;
        elseif v511 == v0.wireTypes.i32 then
            v512 = nil;
            v513, v514 = v0.readFixed32(v507, v509);
            v512 = v513;
            v509 = v514;
        elseif v511 == v0.wireTypes.i64 then
            v512 = nil;
            v513, v514 = v0.readFixed64(v507, v509);
            v512 = v513;
            v509 = v514;
        else
            error("Unsupported wire type: " .. v511);
        end;
    end;
    return v508;
end;
v7.jsonEncode = function(v515) --[[ Line: 5422 ]] --[[ Name: jsonEncode ]]
    local v516 = {};
    if v515.tooltip_title ~= nil then
        v516.tooltipTitle = v515.tooltip_title:jsonEncode();
    end;
    if v515.tooltip_info_text ~= nil then
        v516.tooltipInfoText = v515.tooltip_info_text:jsonEncode();
    end;
    return v516;
end;
v7.jsonDecode = function(v517) --[[ Line: 5436 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_21 (copy), v5 (copy)
    local v518 = l_v7_21.new();
    if v517.tooltip_title ~= nil then
        v518.tooltip_title = v5.StringProp.jsonDecode(v517.tooltip_title);
    end;
    if v517.tooltipTitle ~= nil then
        v518.tooltip_title = v5.StringProp.jsonDecode(v517.tooltipTitle);
    end;
    if v517.tooltip_info_text ~= nil then
        v518.tooltip_info_text = v5.StringProp.jsonDecode(v517.tooltip_info_text);
    end;
    if v517.tooltipInfoText ~= nil then
        v518.tooltip_info_text = v5.StringProp.jsonDecode(v517.tooltipInfoText);
    end;
    return v518;
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
v7.new = function(v520) --[[ Line: 5476 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_22 (copy)
    return (setmetatable({
        action_type = if not (v520 ~= nil) or v520.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v520.action_type, 
        action_params = if not (v520 ~= nil) or v520.action_params == nil then nil else v520.action_params
    }, l_v7_22));
end;
v7.encode = function(v521) --[[ Line: 5485 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v522 = buffer.create(0);
    local v523 = 0;
    if v521.action_type ~= nil and (v521.action_type ~= nil and v521.action_type ~= 0 or v521.action_type ~= v2.ActionType.fromNumber(0)) then
        local v524, v525 = v0.writeTag(v522, v523, 1, v0.wireTypes.varint);
        v524, v525 = v0.writeVarInt(v524, v525, v2.ActionType.toNumber(v521.action_type));
        v522 = v524;
        v523 = v525;
    end;
    if v521.action_params ~= nil then
        local v526 = v521.action_params:encode();
        local v527, v528 = v0.writeTag(v522, v523, 2, v0.wireTypes.lengthDelimited);
        v527, v528 = v0.writeBuffer(v527, v528, v526, buffer.len(v526));
        v522 = v527;
        v523 = v528;
    end;
    local v529 = buffer.create(v523);
    buffer.copy(v529, 0, v522, 0, v523);
    return v529;
end;
v7.decode = function(v530) --[[ Line: 5511 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_22 (copy), v0 (copy), v2 (copy)
    local v531 = l_v7_22.new();
    local v532 = 0;
    while v532 < buffer.len(v530) do
        local v533 = nil;
        local v534 = nil;
        local v535, v536, v537 = v0.readTag(v530, v532);
        v533 = v535;
        v534 = v536;
        v532 = v537;
        if v534 == v0.wireTypes.varint then
            if v533 == 1 then
                v535 = nil;
                v536, v537 = v0.readVarIntI32(v530, v532);
                v535 = v536;
                v532 = v537;
                v531.action_type = v2.ActionType.fromNumber(v535) or v535;
            else
                v535 = nil;
                v536, v537 = v0.readVarInt(v530, v532);
                v535 = v536;
                v532 = v537;
            end;
        elseif v534 == v0.wireTypes.lengthDelimited then
            if v533 == 2 then
                v535 = nil;
                v536, v537 = v0.readBuffer(v530, v532);
                v535 = v536;
                v532 = v537;
                v531.action_params = v2.OpenBadgeDetailsAction_Params.decode(v535);
            else
                v535 = nil;
                v536, v537 = v0.readVarInt(v530, v532);
                v532 = v537 + v536;
            end;
        elseif v534 == v0.wireTypes.i32 then
            v535 = nil;
            v536, v537 = v0.readFixed32(v530, v532);
            v535 = v536;
            v532 = v537;
        elseif v534 == v0.wireTypes.i64 then
            v535 = nil;
            v536, v537 = v0.readFixed64(v530, v532);
            v535 = v536;
            v532 = v537;
        else
            error("Unsupported wire type: " .. v534);
        end;
    end;
    return v531;
end;
v7.jsonEncode = function(v538) --[[ Line: 5559 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v539 = {};
    if v538.action_type ~= nil and (v538.action_type ~= nil and v538.action_type ~= 0 or v538.action_type ~= v2.ActionType.fromNumber(0)) then
        v539.actionType = if typeof(v538.action_type) == "number" then v538.action_type else v2.ActionType.toNumber(v538.action_type);
    end;
    if v538.action_params ~= nil then
        v539.actionParams = v538.action_params:jsonEncode();
    end;
    return v539;
end;
v7.jsonDecode = function(v540) --[[ Line: 5581 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_22 (copy), v2 (copy)
    local v541 = l_v7_22.new();
    if v540.action_type ~= nil then
        v541.action_type = if typeof(v540.action_type) == "number" then v2.ActionType.fromNumber(v540.action_type) or v540.action_type else v2.ActionType.fromName(v540.action_type) or v540.action_type;
    end;
    if v540.actionType ~= nil then
        v541.action_type = if typeof(v540.actionType) == "number" then v2.ActionType.fromNumber(v540.actionType) or v540.actionType else v2.ActionType.fromName(v540.actionType) or v540.actionType;
    end;
    if v540.action_params ~= nil then
        v541.action_params = v2.OpenBadgeDetailsAction_Params.jsonDecode(v540.action_params);
    end;
    if v540.actionParams ~= nil then
        v541.action_params = v2.OpenBadgeDetailsAction_Params.jsonDecode(v540.actionParams);
    end;
    return v541;
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
v7.new = function(v543) --[[ Line: 5621 ]] --[[ Name: new ]]
    -- upvalues: l_v7_23 (copy)
    return (setmetatable({
        badge_id = if not (v543 ~= nil) or v543.badge_id == nil then nil else v543.badge_id, 
        title_text = if not (v543 ~= nil) or v543.title_text == nil then nil else v543.title_text
    }, l_v7_23));
end;
v7.encode = function(v544) --[[ Line: 5630 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v545 = buffer.create(0);
    local v546 = 0;
    if v544.badge_id ~= nil then
        local v547 = v544.badge_id:encode();
        local v548, v549 = v0.writeTag(v545, v546, 1, v0.wireTypes.lengthDelimited);
        v548, v549 = v0.writeBuffer(v548, v549, v547, buffer.len(v547));
        v545 = v548;
        v546 = v549;
    end;
    if v544.title_text ~= nil then
        local v550 = v544.title_text:encode();
        local v551, v552 = v0.writeTag(v545, v546, 2, v0.wireTypes.lengthDelimited);
        v551, v552 = v0.writeBuffer(v551, v552, v550, buffer.len(v550));
        v545 = v551;
        v546 = v552;
    end;
    local v553 = buffer.create(v546);
    buffer.copy(v553, 0, v545, 0, v546);
    return v553;
end;
v7.decode = function(v554) --[[ Line: 5651 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_23 (copy), v0 (copy), v5 (copy)
    local v555 = l_v7_23.new();
    local v556 = 0;
    while v556 < buffer.len(v554) do
        local v557 = nil;
        local v558 = nil;
        local v559, v560, v561 = v0.readTag(v554, v556);
        v557 = v559;
        v558 = v560;
        v556 = v561;
        if v558 == v0.wireTypes.varint then
            v559 = nil;
            v560, v561 = v0.readVarInt(v554, v556);
            v559 = v560;
            v556 = v561;
        elseif v558 == v0.wireTypes.lengthDelimited then
            if v557 == 1 then
                v559 = nil;
                v560, v561 = v0.readBuffer(v554, v556);
                v559 = v560;
                v556 = v561;
                v555.badge_id = v5.StringProp.decode(v559);
            elseif v557 == 2 then
                v559 = nil;
                v560, v561 = v0.readBuffer(v554, v556);
                v559 = v560;
                v556 = v561;
                v555.title_text = v5.StringProp.decode(v559);
            else
                v559 = nil;
                v560, v561 = v0.readVarInt(v554, v556);
                v556 = v561 + v560;
            end;
        elseif v558 == v0.wireTypes.i32 then
            v559 = nil;
            v560, v561 = v0.readFixed32(v554, v556);
            v559 = v560;
            v556 = v561;
        elseif v558 == v0.wireTypes.i64 then
            v559 = nil;
            v560, v561 = v0.readFixed64(v554, v556);
            v559 = v560;
            v556 = v561;
        else
            error("Unsupported wire type: " .. v558);
        end;
    end;
    return v555;
end;
v7.jsonEncode = function(v562) --[[ Line: 5699 ]] --[[ Name: jsonEncode ]]
    local v563 = {};
    if v562.badge_id ~= nil then
        v563.badgeId = v562.badge_id:jsonEncode();
    end;
    if v562.title_text ~= nil then
        v563.titleText = v562.title_text:jsonEncode();
    end;
    return v563;
end;
v7.jsonDecode = function(v564) --[[ Line: 5713 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_23 (copy), v5 (copy)
    local v565 = l_v7_23.new();
    if v564.badge_id ~= nil then
        v565.badge_id = v5.StringProp.jsonDecode(v564.badge_id);
    end;
    if v564.badgeId ~= nil then
        v565.badge_id = v5.StringProp.jsonDecode(v564.badgeId);
    end;
    if v564.title_text ~= nil then
        v565.title_text = v5.StringProp.jsonDecode(v564.title_text);
    end;
    if v564.titleText ~= nil then
        v565.title_text = v5.StringProp.jsonDecode(v564.titleText);
    end;
    return v565;
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
v7.new = function(v567) --[[ Line: 5749 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_24 (copy)
    return (setmetatable({
        action_type = if not (v567 ~= nil) or v567.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v567.action_type, 
        action_params = if not (v567 ~= nil) or v567.action_params == nil then nil else v567.action_params
    }, l_v7_24));
end;
v7.encode = function(v568) --[[ Line: 5758 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v569 = buffer.create(0);
    local v570 = 0;
    if v568.action_type ~= nil and (v568.action_type ~= nil and v568.action_type ~= 0 or v568.action_type ~= v2.ActionType.fromNumber(0)) then
        local v571, v572 = v0.writeTag(v569, v570, 1, v0.wireTypes.varint);
        v571, v572 = v0.writeVarInt(v571, v572, v2.ActionType.toNumber(v568.action_type));
        v569 = v571;
        v570 = v572;
    end;
    if v568.action_params ~= nil then
        local v573 = v568.action_params:encode();
        local v574, v575 = v0.writeTag(v569, v570, 2, v0.wireTypes.lengthDelimited);
        v574, v575 = v0.writeBuffer(v574, v575, v573, buffer.len(v573));
        v569 = v574;
        v570 = v575;
    end;
    local v576 = buffer.create(v570);
    buffer.copy(v576, 0, v569, 0, v570);
    return v576;
end;
v7.decode = function(v577) --[[ Line: 5784 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_24 (copy), v0 (copy), v2 (copy)
    local v578 = l_v7_24.new();
    local v579 = 0;
    while v579 < buffer.len(v577) do
        local v580 = nil;
        local v581 = nil;
        local v582, v583, v584 = v0.readTag(v577, v579);
        v580 = v582;
        v581 = v583;
        v579 = v584;
        if v581 == v0.wireTypes.varint then
            if v580 == 1 then
                v582 = nil;
                v583, v584 = v0.readVarIntI32(v577, v579);
                v582 = v583;
                v579 = v584;
                v578.action_type = v2.ActionType.fromNumber(v582) or v582;
            else
                v582 = nil;
                v583, v584 = v0.readVarInt(v577, v579);
                v582 = v583;
                v579 = v584;
            end;
        elseif v581 == v0.wireTypes.lengthDelimited then
            if v580 == 2 then
                v582 = nil;
                v583, v584 = v0.readBuffer(v577, v579);
                v582 = v583;
                v579 = v584;
                v578.action_params = v2.LoadMoreFromApiAction_Params.decode(v582);
            else
                v582 = nil;
                v583, v584 = v0.readVarInt(v577, v579);
                v579 = v584 + v583;
            end;
        elseif v581 == v0.wireTypes.i32 then
            v582 = nil;
            v583, v584 = v0.readFixed32(v577, v579);
            v582 = v583;
            v579 = v584;
        elseif v581 == v0.wireTypes.i64 then
            v582 = nil;
            v583, v584 = v0.readFixed64(v577, v579);
            v582 = v583;
            v579 = v584;
        else
            error("Unsupported wire type: " .. v581);
        end;
    end;
    return v578;
end;
v7.jsonEncode = function(v585) --[[ Line: 5832 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v586 = {};
    if v585.action_type ~= nil and (v585.action_type ~= nil and v585.action_type ~= 0 or v585.action_type ~= v2.ActionType.fromNumber(0)) then
        v586.actionType = if typeof(v585.action_type) == "number" then v585.action_type else v2.ActionType.toNumber(v585.action_type);
    end;
    if v585.action_params ~= nil then
        v586.actionParams = v585.action_params:jsonEncode();
    end;
    return v586;
end;
v7.jsonDecode = function(v587) --[[ Line: 5854 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_24 (copy), v2 (copy)
    local v588 = l_v7_24.new();
    if v587.action_type ~= nil then
        v588.action_type = if typeof(v587.action_type) == "number" then v2.ActionType.fromNumber(v587.action_type) or v587.action_type else v2.ActionType.fromName(v587.action_type) or v587.action_type;
    end;
    if v587.actionType ~= nil then
        v588.action_type = if typeof(v587.actionType) == "number" then v2.ActionType.fromNumber(v587.actionType) or v587.actionType else v2.ActionType.fromName(v587.actionType) or v587.actionType;
    end;
    if v587.action_params ~= nil then
        v588.action_params = v2.LoadMoreFromApiAction_Params.jsonDecode(v587.action_params);
    end;
    if v587.actionParams ~= nil then
        v588.action_params = v2.LoadMoreFromApiAction_Params.jsonDecode(v587.actionParams);
    end;
    return v588;
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
v7.new = function(v590) --[[ Line: 5894 ]] --[[ Name: new ]]
    -- upvalues: l_v7_25 (copy)
    return (setmetatable({
        surface_key = if not (v590 ~= nil) or v590.surface_key == nil then nil else v590.surface_key, 
        config_key = if not (v590 ~= nil) or v590.config_key == nil then nil else v590.config_key
    }, l_v7_25));
end;
v7.encode = function(v591) --[[ Line: 5903 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v592 = buffer.create(0);
    local v593 = 0;
    if v591.surface_key ~= nil then
        local v594 = v591.surface_key:encode();
        local v595, v596 = v0.writeTag(v592, v593, 1, v0.wireTypes.lengthDelimited);
        v595, v596 = v0.writeBuffer(v595, v596, v594, buffer.len(v594));
        v592 = v595;
        v593 = v596;
    end;
    if v591.config_key ~= nil then
        local v597 = v591.config_key:encode();
        local v598, v599 = v0.writeTag(v592, v593, 2, v0.wireTypes.lengthDelimited);
        v598, v599 = v0.writeBuffer(v598, v599, v597, buffer.len(v597));
        v592 = v598;
        v593 = v599;
    end;
    local v600 = buffer.create(v593);
    buffer.copy(v600, 0, v592, 0, v593);
    return v600;
end;
v7.decode = function(v601) --[[ Line: 5924 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_25 (copy), v0 (copy), v5 (copy)
    local v602 = l_v7_25.new();
    local v603 = 0;
    while v603 < buffer.len(v601) do
        local v604 = nil;
        local v605 = nil;
        local v606, v607, v608 = v0.readTag(v601, v603);
        v604 = v606;
        v605 = v607;
        v603 = v608;
        if v605 == v0.wireTypes.varint then
            v606 = nil;
            v607, v608 = v0.readVarInt(v601, v603);
            v606 = v607;
            v603 = v608;
        elseif v605 == v0.wireTypes.lengthDelimited then
            if v604 == 1 then
                v606 = nil;
                v607, v608 = v0.readBuffer(v601, v603);
                v606 = v607;
                v603 = v608;
                v602.surface_key = v5.StringProp.decode(v606);
            elseif v604 == 2 then
                v606 = nil;
                v607, v608 = v0.readBuffer(v601, v603);
                v606 = v607;
                v603 = v608;
                v602.config_key = v5.StringProp.decode(v606);
            else
                v606 = nil;
                v607, v608 = v0.readVarInt(v601, v603);
                v603 = v608 + v607;
            end;
        elseif v605 == v0.wireTypes.i32 then
            v606 = nil;
            v607, v608 = v0.readFixed32(v601, v603);
            v606 = v607;
            v603 = v608;
        elseif v605 == v0.wireTypes.i64 then
            v606 = nil;
            v607, v608 = v0.readFixed64(v601, v603);
            v606 = v607;
            v603 = v608;
        else
            error("Unsupported wire type: " .. v605);
        end;
    end;
    return v602;
end;
v7.jsonEncode = function(v609) --[[ Line: 5972 ]] --[[ Name: jsonEncode ]]
    local v610 = {};
    if v609.surface_key ~= nil then
        v610.surfaceKey = v609.surface_key:jsonEncode();
    end;
    if v609.config_key ~= nil then
        v610.configKey = v609.config_key:jsonEncode();
    end;
    return v610;
end;
v7.jsonDecode = function(v611) --[[ Line: 5986 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_25 (copy), v5 (copy)
    local v612 = l_v7_25.new();
    if v611.surface_key ~= nil then
        v612.surface_key = v5.StringProp.jsonDecode(v611.surface_key);
    end;
    if v611.surfaceKey ~= nil then
        v612.surface_key = v5.StringProp.jsonDecode(v611.surfaceKey);
    end;
    if v611.config_key ~= nil then
        v612.config_key = v5.StringProp.jsonDecode(v611.config_key);
    end;
    if v611.configKey ~= nil then
        v612.config_key = v5.StringProp.jsonDecode(v611.configKey);
    end;
    return v612;
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
v7.new = function(v614) --[[ Line: 6023 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_26 (copy)
    return (setmetatable({
        action_type = if not (v614 ~= nil) or v614.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v614.action_type, 
        action_params = if not (v614 ~= nil) or v614.action_params == nil then nil else v614.action_params
    }, l_v7_26));
end;
v7.encode = function(v615) --[[ Line: 6032 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v616 = buffer.create(0);
    local v617 = 0;
    if v615.action_type ~= nil and (v615.action_type ~= nil and v615.action_type ~= 0 or v615.action_type ~= v2.ActionType.fromNumber(0)) then
        local v618, v619 = v0.writeTag(v616, v617, 1, v0.wireTypes.varint);
        v618, v619 = v0.writeVarInt(v618, v619, v2.ActionType.toNumber(v615.action_type));
        v616 = v618;
        v617 = v619;
    end;
    if v615.action_params ~= nil then
        local v620 = v615.action_params:encode();
        local v621, v622 = v0.writeTag(v616, v617, 2, v0.wireTypes.lengthDelimited);
        v621, v622 = v0.writeBuffer(v621, v622, v620, buffer.len(v620));
        v616 = v621;
        v617 = v622;
    end;
    local v623 = buffer.create(v617);
    buffer.copy(v623, 0, v616, 0, v617);
    return v623;
end;
v7.decode = function(v624) --[[ Line: 6058 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_26 (copy), v0 (copy), v2 (copy)
    local v625 = l_v7_26.new();
    local v626 = 0;
    while v626 < buffer.len(v624) do
        local v627 = nil;
        local v628 = nil;
        local v629, v630, v631 = v0.readTag(v624, v626);
        v627 = v629;
        v628 = v630;
        v626 = v631;
        if v628 == v0.wireTypes.varint then
            if v627 == 1 then
                v629 = nil;
                v630, v631 = v0.readVarIntI32(v624, v626);
                v629 = v630;
                v626 = v631;
                v625.action_type = v2.ActionType.fromNumber(v629) or v629;
            else
                v629 = nil;
                v630, v631 = v0.readVarInt(v624, v626);
                v629 = v630;
                v626 = v631;
            end;
        elseif v628 == v0.wireTypes.lengthDelimited then
            if v627 == 2 then
                v629 = nil;
                v630, v631 = v0.readBuffer(v624, v626);
                v629 = v630;
                v626 = v631;
                v625.action_params = v2.ShareAction_Params.decode(v629);
            else
                v629 = nil;
                v630, v631 = v0.readVarInt(v624, v626);
                v626 = v631 + v630;
            end;
        elseif v628 == v0.wireTypes.i32 then
            v629 = nil;
            v630, v631 = v0.readFixed32(v624, v626);
            v629 = v630;
            v626 = v631;
        elseif v628 == v0.wireTypes.i64 then
            v629 = nil;
            v630, v631 = v0.readFixed64(v624, v626);
            v629 = v630;
            v626 = v631;
        else
            error("Unsupported wire type: " .. v628);
        end;
    end;
    return v625;
end;
v7.jsonEncode = function(v632) --[[ Line: 6106 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v633 = {};
    if v632.action_type ~= nil and (v632.action_type ~= nil and v632.action_type ~= 0 or v632.action_type ~= v2.ActionType.fromNumber(0)) then
        v633.actionType = if typeof(v632.action_type) == "number" then v632.action_type else v2.ActionType.toNumber(v632.action_type);
    end;
    if v632.action_params ~= nil then
        v633.actionParams = v632.action_params:jsonEncode();
    end;
    return v633;
end;
v7.jsonDecode = function(v634) --[[ Line: 6128 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_26 (copy), v2 (copy)
    local v635 = l_v7_26.new();
    if v634.action_type ~= nil then
        v635.action_type = if typeof(v634.action_type) == "number" then v2.ActionType.fromNumber(v634.action_type) or v634.action_type else v2.ActionType.fromName(v634.action_type) or v634.action_type;
    end;
    if v634.actionType ~= nil then
        v635.action_type = if typeof(v634.actionType) == "number" then v2.ActionType.fromNumber(v634.actionType) or v634.actionType else v2.ActionType.fromName(v634.actionType) or v634.actionType;
    end;
    if v634.action_params ~= nil then
        v635.action_params = v2.ShareAction_Params.jsonDecode(v634.action_params);
    end;
    if v634.actionParams ~= nil then
        v635.action_params = v2.ShareAction_Params.jsonDecode(v634.actionParams);
    end;
    return v635;
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
v7.new = function(v637) --[[ Line: 6168 ]] --[[ Name: new ]]
    -- upvalues: l_v7_27 (copy)
    return (setmetatable({
        oneof_prop = if not (v637 ~= nil) or v637.oneof_prop == nil then nil else v637.oneof_prop
    }, l_v7_27));
end;
v7.encode = function(v638) --[[ Line: 6176 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v639 = buffer.create(0);
    local v640 = 0;
    if v638.oneof_prop ~= nil then
        if v638.oneof_prop.type == "generic_share_link_data" then
            local v641 = v638.oneof_prop.value:encode();
            local v642, v643 = v0.writeTag(v639, v640, 1, v0.wireTypes.lengthDelimited);
            v642, v643 = v0.writeBuffer(v642, v643, v641, buffer.len(v641));
            v639 = v642;
            v640 = v643;
        elseif v638.oneof_prop.type == "share_link_fetch_data" then
            local v644 = v638.oneof_prop.value:encode();
            local v645, v646 = v0.writeTag(v639, v640, 2, v0.wireTypes.lengthDelimited);
            v645, v646 = v0.writeBuffer(v645, v646, v644, buffer.len(v644));
            v639 = v645;
            v640 = v646;
        end;
    end;
    local v647 = buffer.create(v640);
    buffer.copy(v647, 0, v639, 0, v640);
    return v647;
end;
v7.decode = function(v648) --[[ Line: 6197 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_27 (copy), v0 (copy), v6 (copy)
    local v649 = l_v7_27.new();
    local v650 = 0;
    while v650 < buffer.len(v648) do
        local v651 = nil;
        local v652 = nil;
        local v653, v654, v655 = v0.readTag(v648, v650);
        v651 = v653;
        v652 = v654;
        v650 = v655;
        if v652 == v0.wireTypes.varint then
            v653 = nil;
            v654, v655 = v0.readVarInt(v648, v650);
            v653 = v654;
            v650 = v655;
        elseif v652 == v0.wireTypes.lengthDelimited then
            if v651 == 1 then
                v653 = nil;
                v654, v655 = v0.readBuffer(v648, v650);
                v653 = v654;
                v650 = v655;
                v649.oneof_prop = {
                    type = "generic_share_link_data", 
                    value = v6.GenericShareLinkData.decode(v653)
                };
            elseif v651 == 2 then
                v653 = nil;
                v654, v655 = v0.readBuffer(v648, v650);
                v653 = v654;
                v650 = v655;
                v649.oneof_prop = {
                    type = "share_link_fetch_data", 
                    value = v6.ShareLinkFetchData.decode(v653)
                };
            else
                v653 = nil;
                v654, v655 = v0.readVarInt(v648, v650);
                v650 = v655 + v654;
            end;
        elseif v652 == v0.wireTypes.i32 then
            v653 = nil;
            v654, v655 = v0.readFixed32(v648, v650);
            v653 = v654;
            v650 = v655;
        elseif v652 == v0.wireTypes.i64 then
            v653 = nil;
            v654, v655 = v0.readFixed64(v648, v650);
            v653 = v654;
            v650 = v655;
        else
            error("Unsupported wire type: " .. v652);
        end;
    end;
    return v649;
end;
v7.jsonEncode = function(v656) --[[ Line: 6253 ]] --[[ Name: jsonEncode ]]
    local v657 = {};
    if v656.oneof_prop ~= nil then
        if v656.oneof_prop.type == "generic_share_link_data" then
            v657.genericShareLinkData = v656.oneof_prop.value:jsonEncode();
            return v657;
        elseif v656.oneof_prop.type == "share_link_fetch_data" then
            v657.shareLinkFetchData = v656.oneof_prop.value:jsonEncode();
        end;
    end;
    return v657;
end;
v7.jsonDecode = function(v658) --[[ Line: 6267 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_27 (copy), v6 (copy)
    local v659 = l_v7_27.new();
    if v658.generic_share_link_data ~= nil then
        v659.oneof_prop = {
            type = "generic_share_link_data", 
            value = v6.GenericShareLinkData.jsonDecode(v658.generic_share_link_data)
        };
    end;
    if v658.genericShareLinkData ~= nil then
        v659.oneof_prop = {
            type = "generic_share_link_data", 
            value = v6.GenericShareLinkData.jsonDecode(v658.genericShareLinkData)
        };
    end;
    if v658.share_link_fetch_data ~= nil then
        v659.oneof_prop = {
            type = "share_link_fetch_data", 
            value = v6.ShareLinkFetchData.jsonDecode(v658.share_link_fetch_data)
        };
    end;
    if v658.shareLinkFetchData ~= nil then
        v659.oneof_prop = {
            type = "share_link_fetch_data", 
            value = v6.ShareLinkFetchData.jsonDecode(v658.shareLinkFetchData)
        };
    end;
    return v659;
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
v7.new = function(v661) --[[ Line: 6323 ]] --[[ Name: new ]]
    -- upvalues: l_v7_28 (copy)
    return (setmetatable({
        share_link_type = if not (v661 ~= nil) or v661.share_link_type == nil then nil else v661.share_link_type, 
        share_link_data = if not (v661 ~= nil) or v661.share_link_data == nil then nil else v661.share_link_data, 
        entry_point_key = if not (v661 ~= nil) or v661.entry_point_key == nil then nil else v661.entry_point_key
    }, l_v7_28));
end;
v7.encode = function(v662) --[[ Line: 6331 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v663 = buffer.create(0);
    local v664 = 0;
    if v662.share_link_type ~= nil then
        local v665 = v662.share_link_type:encode();
        local v666, v667 = v0.writeTag(v663, v664, 1, v0.wireTypes.lengthDelimited);
        v666, v667 = v0.writeBuffer(v666, v667, v665, buffer.len(v665));
        v663 = v666;
        v664 = v667;
    end;
    if v662.share_link_data ~= nil then
        local v668 = v662.share_link_data:encode();
        local v669, v670 = v0.writeTag(v663, v664, 2, v0.wireTypes.lengthDelimited);
        v669, v670 = v0.writeBuffer(v669, v670, v668, buffer.len(v668));
        v663 = v669;
        v664 = v670;
    end;
    if v662.entry_point_key ~= nil then
        local v671 = v662.entry_point_key:encode();
        local v672, v673 = v0.writeTag(v663, v664, 3, v0.wireTypes.lengthDelimited);
        v672, v673 = v0.writeBuffer(v672, v673, v671, buffer.len(v671));
        v663 = v672;
        v664 = v673;
    end;
    local v674 = buffer.create(v664);
    buffer.copy(v674, 0, v663, 0, v664);
    return v674;
end;
v7.decode = function(v675) --[[ Line: 6358 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_28 (copy), v0 (copy), v5 (copy), v2 (copy)
    local v676 = l_v7_28.new();
    local v677 = 0;
    while v677 < buffer.len(v675) do
        local v678 = nil;
        local v679 = nil;
        local v680, v681, v682 = v0.readTag(v675, v677);
        v678 = v680;
        v679 = v681;
        v677 = v682;
        if v679 == v0.wireTypes.varint then
            v680 = nil;
            v681, v682 = v0.readVarInt(v675, v677);
            v680 = v681;
            v677 = v682;
        elseif v679 == v0.wireTypes.lengthDelimited then
            if v678 == 1 then
                v680 = nil;
                v681, v682 = v0.readBuffer(v675, v677);
                v680 = v681;
                v677 = v682;
                v676.share_link_type = v5.StringProp.decode(v680);
            elseif v678 == 2 then
                v680 = nil;
                v681, v682 = v0.readBuffer(v675, v677);
                v680 = v681;
                v677 = v682;
                v676.share_link_data = v2.ShareAction_ShareLinkData.decode(v680);
            elseif v678 == 3 then
                v680 = nil;
                v681, v682 = v0.readBuffer(v675, v677);
                v680 = v681;
                v677 = v682;
                v676.entry_point_key = v5.StringProp.decode(v680);
            else
                v680 = nil;
                v681, v682 = v0.readVarInt(v675, v677);
                v677 = v682 + v681;
            end;
        elseif v679 == v0.wireTypes.i32 then
            v680 = nil;
            v681, v682 = v0.readFixed32(v675, v677);
            v680 = v681;
            v677 = v682;
        elseif v679 == v0.wireTypes.i64 then
            v680 = nil;
            v681, v682 = v0.readFixed64(v675, v677);
            v680 = v681;
            v677 = v682;
        else
            error("Unsupported wire type: " .. v679);
        end;
    end;
    return v676;
end;
v7.jsonEncode = function(v683) --[[ Line: 6411 ]] --[[ Name: jsonEncode ]]
    local v684 = {};
    if v683.share_link_type ~= nil then
        v684.shareLinkType = v683.share_link_type:jsonEncode();
    end;
    if v683.share_link_data ~= nil then
        v684.shareLinkData = v683.share_link_data:jsonEncode();
    end;
    if v683.entry_point_key ~= nil then
        v684.entryPointKey = v683.entry_point_key:jsonEncode();
    end;
    return v684;
end;
v7.jsonDecode = function(v685) --[[ Line: 6429 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_28 (copy), v5 (copy), v2 (copy)
    local v686 = l_v7_28.new();
    if v685.share_link_type ~= nil then
        v686.share_link_type = v5.StringProp.jsonDecode(v685.share_link_type);
    end;
    if v685.shareLinkType ~= nil then
        v686.share_link_type = v5.StringProp.jsonDecode(v685.shareLinkType);
    end;
    if v685.share_link_data ~= nil then
        v686.share_link_data = v2.ShareAction_ShareLinkData.jsonDecode(v685.share_link_data);
    end;
    if v685.shareLinkData ~= nil then
        v686.share_link_data = v2.ShareAction_ShareLinkData.jsonDecode(v685.shareLinkData);
    end;
    if v685.entry_point_key ~= nil then
        v686.entry_point_key = v5.StringProp.jsonDecode(v685.entry_point_key);
    end;
    if v685.entryPointKey ~= nil then
        v686.entry_point_key = v5.StringProp.jsonDecode(v685.entryPointKey);
    end;
    return v686;
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
v7.new = function(v688) --[[ Line: 6477 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_29 (copy)
    return (setmetatable({
        action_type = if not (v688 ~= nil) or v688.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v688.action_type, 
        action_params = if not (v688 ~= nil) or v688.action_params == nil then nil else v688.action_params
    }, l_v7_29));
end;
v7.encode = function(v689) --[[ Line: 6486 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v690 = buffer.create(0);
    local v691 = 0;
    if v689.action_type ~= nil and (v689.action_type ~= nil and v689.action_type ~= 0 or v689.action_type ~= v2.ActionType.fromNumber(0)) then
        local v692, v693 = v0.writeTag(v690, v691, 1, v0.wireTypes.varint);
        v692, v693 = v0.writeVarInt(v692, v693, v2.ActionType.toNumber(v689.action_type));
        v690 = v692;
        v691 = v693;
    end;
    if v689.action_params ~= nil then
        local v694 = v689.action_params:encode();
        local v695, v696 = v0.writeTag(v690, v691, 2, v0.wireTypes.lengthDelimited);
        v695, v696 = v0.writeBuffer(v695, v696, v694, buffer.len(v694));
        v690 = v695;
        v691 = v696;
    end;
    local v697 = buffer.create(v691);
    buffer.copy(v697, 0, v690, 0, v691);
    return v697;
end;
v7.decode = function(v698) --[[ Line: 6512 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_29 (copy), v0 (copy), v2 (copy)
    local v699 = l_v7_29.new();
    local v700 = 0;
    while v700 < buffer.len(v698) do
        local v701 = nil;
        local v702 = nil;
        local v703, v704, v705 = v0.readTag(v698, v700);
        v701 = v703;
        v702 = v704;
        v700 = v705;
        if v702 == v0.wireTypes.varint then
            if v701 == 1 then
                v703 = nil;
                v704, v705 = v0.readVarIntI32(v698, v700);
                v703 = v704;
                v700 = v705;
                v699.action_type = v2.ActionType.fromNumber(v703) or v703;
            else
                v703 = nil;
                v704, v705 = v0.readVarInt(v698, v700);
                v703 = v704;
                v700 = v705;
            end;
        elseif v702 == v0.wireTypes.lengthDelimited then
            if v701 == 2 then
                v703 = nil;
                v704, v705 = v0.readBuffer(v698, v700);
                v703 = v704;
                v700 = v705;
                v699.action_params = v2.OpenAbuseReportAction_Params.decode(v703);
            else
                v703 = nil;
                v704, v705 = v0.readVarInt(v698, v700);
                v700 = v705 + v704;
            end;
        elseif v702 == v0.wireTypes.i32 then
            v703 = nil;
            v704, v705 = v0.readFixed32(v698, v700);
            v703 = v704;
            v700 = v705;
        elseif v702 == v0.wireTypes.i64 then
            v703 = nil;
            v704, v705 = v0.readFixed64(v698, v700);
            v703 = v704;
            v700 = v705;
        else
            error("Unsupported wire type: " .. v702);
        end;
    end;
    return v699;
end;
v7.jsonEncode = function(v706) --[[ Line: 6560 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v707 = {};
    if v706.action_type ~= nil and (v706.action_type ~= nil and v706.action_type ~= 0 or v706.action_type ~= v2.ActionType.fromNumber(0)) then
        v707.actionType = if typeof(v706.action_type) == "number" then v706.action_type else v2.ActionType.toNumber(v706.action_type);
    end;
    if v706.action_params ~= nil then
        v707.actionParams = v706.action_params:jsonEncode();
    end;
    return v707;
end;
v7.jsonDecode = function(v708) --[[ Line: 6582 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_29 (copy), v2 (copy)
    local v709 = l_v7_29.new();
    if v708.action_type ~= nil then
        v709.action_type = if typeof(v708.action_type) == "number" then v2.ActionType.fromNumber(v708.action_type) or v708.action_type else v2.ActionType.fromName(v708.action_type) or v708.action_type;
    end;
    if v708.actionType ~= nil then
        v709.action_type = if typeof(v708.actionType) == "number" then v2.ActionType.fromNumber(v708.actionType) or v708.actionType else v2.ActionType.fromName(v708.actionType) or v708.actionType;
    end;
    if v708.action_params ~= nil then
        v709.action_params = v2.OpenAbuseReportAction_Params.jsonDecode(v708.action_params);
    end;
    if v708.actionParams ~= nil then
        v709.action_params = v2.OpenAbuseReportAction_Params.jsonDecode(v708.actionParams);
    end;
    return v709;
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
v7.new = function(v711) --[[ Line: 6622 ]] --[[ Name: new ]]
    -- upvalues: l_v7_30 (copy)
    return (setmetatable({
        target_id = if not (v711 ~= nil) or v711.target_id == nil then nil else v711.target_id, 
        abuse_vector = if not (v711 ~= nil) or v711.abuse_vector == nil then nil else v711.abuse_vector, 
        asset_type_name = if not (v711 ~= nil) or v711.asset_type_name == nil then nil else v711.asset_type_name, 
        universe_id = if not (v711 ~= nil) or v711.universe_id == nil then nil else v711.universe_id
    }, l_v7_30));
end;
v7.encode = function(v712) --[[ Line: 6633 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v713 = buffer.create(0);
    local v714 = 0;
    if v712.target_id ~= nil then
        local v715 = v712.target_id:encode();
        local v716, v717 = v0.writeTag(v713, v714, 1, v0.wireTypes.lengthDelimited);
        v716, v717 = v0.writeBuffer(v716, v717, v715, buffer.len(v715));
        v713 = v716;
        v714 = v717;
    end;
    if v712.abuse_vector ~= nil then
        local v718 = v712.abuse_vector:encode();
        local v719, v720 = v0.writeTag(v713, v714, 2, v0.wireTypes.lengthDelimited);
        v719, v720 = v0.writeBuffer(v719, v720, v718, buffer.len(v718));
        v713 = v719;
        v714 = v720;
    end;
    if v712.asset_type_name ~= nil then
        local v721 = v712.asset_type_name:encode();
        local v722, v723 = v0.writeTag(v713, v714, 3, v0.wireTypes.lengthDelimited);
        v722, v723 = v0.writeBuffer(v722, v723, v721, buffer.len(v721));
        v713 = v722;
        v714 = v723;
    end;
    if v712.universe_id ~= nil then
        local v724 = v712.universe_id:encode();
        local v725, v726 = v0.writeTag(v713, v714, 4, v0.wireTypes.lengthDelimited);
        v725, v726 = v0.writeBuffer(v725, v726, v724, buffer.len(v724));
        v713 = v725;
        v714 = v726;
    end;
    local v727 = buffer.create(v714);
    buffer.copy(v727, 0, v713, 0, v714);
    return v727;
end;
v7.decode = function(v728) --[[ Line: 6666 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_30 (copy), v0 (copy), v5 (copy)
    local v729 = l_v7_30.new();
    local v730 = 0;
    while v730 < buffer.len(v728) do
        local v731 = nil;
        local v732 = nil;
        local v733, v734, v735 = v0.readTag(v728, v730);
        v731 = v733;
        v732 = v734;
        v730 = v735;
        if v732 == v0.wireTypes.varint then
            v733 = nil;
            v734, v735 = v0.readVarInt(v728, v730);
            v733 = v734;
            v730 = v735;
        elseif v732 == v0.wireTypes.lengthDelimited then
            if v731 == 1 then
                v733 = nil;
                v734, v735 = v0.readBuffer(v728, v730);
                v733 = v734;
                v730 = v735;
                v729.target_id = v5.StringProp.decode(v733);
            elseif v731 == 2 then
                v733 = nil;
                v734, v735 = v0.readBuffer(v728, v730);
                v733 = v734;
                v730 = v735;
                v729.abuse_vector = v5.StringProp.decode(v733);
            elseif v731 == 3 then
                v733 = nil;
                v734, v735 = v0.readBuffer(v728, v730);
                v733 = v734;
                v730 = v735;
                v729.asset_type_name = v5.StringProp.decode(v733);
            elseif v731 == 4 then
                v733 = nil;
                v734, v735 = v0.readBuffer(v728, v730);
                v733 = v734;
                v730 = v735;
                v729.universe_id = v5.StringProp.decode(v733);
            else
                v733 = nil;
                v734, v735 = v0.readVarInt(v728, v730);
                v730 = v735 + v734;
            end;
        elseif v732 == v0.wireTypes.i32 then
            v733 = nil;
            v734, v735 = v0.readFixed32(v728, v730);
            v733 = v734;
            v730 = v735;
        elseif v732 == v0.wireTypes.i64 then
            v733 = nil;
            v734, v735 = v0.readFixed64(v728, v730);
            v733 = v734;
            v730 = v735;
        else
            error("Unsupported wire type: " .. v732);
        end;
    end;
    return v729;
end;
v7.jsonEncode = function(v736) --[[ Line: 6724 ]] --[[ Name: jsonEncode ]]
    local v737 = {};
    if v736.target_id ~= nil then
        v737.targetId = v736.target_id:jsonEncode();
    end;
    if v736.abuse_vector ~= nil then
        v737.abuseVector = v736.abuse_vector:jsonEncode();
    end;
    if v736.asset_type_name ~= nil then
        v737.assetTypeName = v736.asset_type_name:jsonEncode();
    end;
    if v736.universe_id ~= nil then
        v737.universeId = v736.universe_id:jsonEncode();
    end;
    return v737;
end;
v7.jsonDecode = function(v738) --[[ Line: 6746 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_30 (copy), v5 (copy)
    local v739 = l_v7_30.new();
    if v738.target_id ~= nil then
        v739.target_id = v5.StringProp.jsonDecode(v738.target_id);
    end;
    if v738.targetId ~= nil then
        v739.target_id = v5.StringProp.jsonDecode(v738.targetId);
    end;
    if v738.abuse_vector ~= nil then
        v739.abuse_vector = v5.StringProp.jsonDecode(v738.abuse_vector);
    end;
    if v738.abuseVector ~= nil then
        v739.abuse_vector = v5.StringProp.jsonDecode(v738.abuseVector);
    end;
    if v738.asset_type_name ~= nil then
        v739.asset_type_name = v5.StringProp.jsonDecode(v738.asset_type_name);
    end;
    if v738.assetTypeName ~= nil then
        v739.asset_type_name = v5.StringProp.jsonDecode(v738.assetTypeName);
    end;
    if v738.universe_id ~= nil then
        v739.universe_id = v5.StringProp.jsonDecode(v738.universe_id);
    end;
    if v738.universeId ~= nil then
        v739.universe_id = v5.StringProp.jsonDecode(v738.universeId);
    end;
    return v739;
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
v7.new = function(v741) --[[ Line: 6803 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_31 (copy)
    return (setmetatable({
        action_type = if not (v741 ~= nil) or v741.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v741.action_type, 
        action_params = if not (v741 ~= nil) or v741.action_params == nil then nil else v741.action_params
    }, l_v7_31));
end;
v7.encode = function(v742) --[[ Line: 6814 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v743 = buffer.create(0);
    local v744 = 0;
    if v742.action_type ~= nil and (v742.action_type ~= nil and v742.action_type ~= 0 or v742.action_type ~= v2.ActionType.fromNumber(0)) then
        local v745, v746 = v0.writeTag(v743, v744, 1, v0.wireTypes.varint);
        v745, v746 = v0.writeVarInt(v745, v746, v2.ActionType.toNumber(v742.action_type));
        v743 = v745;
        v744 = v746;
    end;
    if v742.action_params ~= nil then
        local v747 = v742.action_params:encode();
        local v748, v749 = v0.writeTag(v743, v744, 2, v0.wireTypes.lengthDelimited);
        v748, v749 = v0.writeBuffer(v748, v749, v747, buffer.len(v747));
        v743 = v748;
        v744 = v749;
    end;
    local v750 = buffer.create(v744);
    buffer.copy(v750, 0, v743, 0, v744);
    return v750;
end;
v7.decode = function(v751) --[[ Line: 6840 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_31 (copy), v0 (copy), v2 (copy)
    local v752 = l_v7_31.new();
    local v753 = 0;
    while v753 < buffer.len(v751) do
        local v754 = nil;
        local v755 = nil;
        local v756, v757, v758 = v0.readTag(v751, v753);
        v754 = v756;
        v755 = v757;
        v753 = v758;
        if v755 == v0.wireTypes.varint then
            if v754 == 1 then
                v756 = nil;
                v757, v758 = v0.readVarIntI32(v751, v753);
                v756 = v757;
                v753 = v758;
                v752.action_type = v2.ActionType.fromNumber(v756) or v756;
            else
                v756 = nil;
                v757, v758 = v0.readVarInt(v751, v753);
                v756 = v757;
                v753 = v758;
            end;
        elseif v755 == v0.wireTypes.lengthDelimited then
            if v754 == 2 then
                v756 = nil;
                v757, v758 = v0.readBuffer(v751, v753);
                v756 = v757;
                v753 = v758;
                v752.action_params = v2.RemoveBadgeFromInventoryAction_Params.decode(v756);
            else
                v756 = nil;
                v757, v758 = v0.readVarInt(v751, v753);
                v753 = v758 + v757;
            end;
        elseif v755 == v0.wireTypes.i32 then
            v756 = nil;
            v757, v758 = v0.readFixed32(v751, v753);
            v756 = v757;
            v753 = v758;
        elseif v755 == v0.wireTypes.i64 then
            v756 = nil;
            v757, v758 = v0.readFixed64(v751, v753);
            v756 = v757;
            v753 = v758;
        else
            error("Unsupported wire type: " .. v755);
        end;
    end;
    return v752;
end;
v7.jsonEncode = function(v759) --[[ Line: 6888 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v760 = {};
    if v759.action_type ~= nil and (v759.action_type ~= nil and v759.action_type ~= 0 or v759.action_type ~= v2.ActionType.fromNumber(0)) then
        v760.actionType = if typeof(v759.action_type) == "number" then v759.action_type else v2.ActionType.toNumber(v759.action_type);
    end;
    if v759.action_params ~= nil then
        v760.actionParams = v759.action_params:jsonEncode();
    end;
    return v760;
end;
v7.jsonDecode = function(v761) --[[ Line: 6910 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_31 (copy), v2 (copy)
    local v762 = l_v7_31.new();
    if v761.action_type ~= nil then
        v762.action_type = if typeof(v761.action_type) == "number" then v2.ActionType.fromNumber(v761.action_type) or v761.action_type else v2.ActionType.fromName(v761.action_type) or v761.action_type;
    end;
    if v761.actionType ~= nil then
        v762.action_type = if typeof(v761.actionType) == "number" then v2.ActionType.fromNumber(v761.actionType) or v761.actionType else v2.ActionType.fromName(v761.actionType) or v761.actionType;
    end;
    if v761.action_params ~= nil then
        v762.action_params = v2.RemoveBadgeFromInventoryAction_Params.jsonDecode(v761.action_params);
    end;
    if v761.actionParams ~= nil then
        v762.action_params = v2.RemoveBadgeFromInventoryAction_Params.jsonDecode(v761.actionParams);
    end;
    return v762;
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
v7.new = function(v764) --[[ Line: 6950 ]] --[[ Name: new ]]
    -- upvalues: l_v7_32 (copy)
    return (setmetatable({
        asset_id = if not (v764 ~= nil) or v764.asset_id == nil then nil else v764.asset_id
    }, l_v7_32));
end;
v7.encode = function(v765) --[[ Line: 6958 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v766 = buffer.create(0);
    local v767 = 0;
    if v765.asset_id ~= nil then
        local v768 = v765.asset_id:encode();
        local v769, v770 = v0.writeTag(v766, v767, 1, v0.wireTypes.lengthDelimited);
        v769, v770 = v0.writeBuffer(v769, v770, v768, buffer.len(v768));
        v766 = v769;
        v767 = v770;
    end;
    local v771 = buffer.create(v767);
    buffer.copy(v771, 0, v766, 0, v767);
    return v771;
end;
v7.decode = function(v772) --[[ Line: 6973 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_32 (copy), v0 (copy), v5 (copy)
    local v773 = l_v7_32.new();
    local v774 = 0;
    while v774 < buffer.len(v772) do
        local v775 = nil;
        local v776 = nil;
        local v777, v778, v779 = v0.readTag(v772, v774);
        v775 = v777;
        v776 = v778;
        v774 = v779;
        if v776 == v0.wireTypes.varint then
            v777 = nil;
            v778, v779 = v0.readVarInt(v772, v774);
            v777 = v778;
            v774 = v779;
        elseif v776 == v0.wireTypes.lengthDelimited then
            if v775 == 1 then
                v777 = nil;
                v778, v779 = v0.readBuffer(v772, v774);
                v777 = v778;
                v774 = v779;
                v773.asset_id = v5.StringProp.decode(v777);
            else
                v777 = nil;
                v778, v779 = v0.readVarInt(v772, v774);
                v774 = v779 + v778;
            end;
        elseif v776 == v0.wireTypes.i32 then
            v777 = nil;
            v778, v779 = v0.readFixed32(v772, v774);
            v777 = v778;
            v774 = v779;
        elseif v776 == v0.wireTypes.i64 then
            v777 = nil;
            v778, v779 = v0.readFixed64(v772, v774);
            v777 = v778;
            v774 = v779;
        else
            error("Unsupported wire type: " .. v776);
        end;
    end;
    return v773;
end;
v7.jsonEncode = function(v780) --[[ Line: 7016 ]] --[[ Name: jsonEncode ]]
    local v781 = {};
    if v780.asset_id ~= nil then
        v781.assetId = v780.asset_id:jsonEncode();
    end;
    return v781;
end;
v7.jsonDecode = function(v782) --[[ Line: 7026 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_32 (copy), v5 (copy)
    local v783 = l_v7_32.new();
    if v782.asset_id ~= nil then
        v783.asset_id = v5.StringProp.jsonDecode(v782.asset_id);
    end;
    if v782.assetId ~= nil then
        v783.asset_id = v5.StringProp.jsonDecode(v782.assetId);
    end;
    return v783;
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
v7.new = function(v785) --[[ Line: 7056 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_33 (copy)
    return (setmetatable({
        action_type = if not (v785 ~= nil) or v785.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v785.action_type, 
        action_params = if not (v785 ~= nil) or v785.action_params == nil then nil else v785.action_params
    }, l_v7_33));
end;
v7.encode = function(v786) --[[ Line: 7065 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v787 = buffer.create(0);
    local v788 = 0;
    if v786.action_type ~= nil and (v786.action_type ~= nil and v786.action_type ~= 0 or v786.action_type ~= v2.ActionType.fromNumber(0)) then
        local v789, v790 = v0.writeTag(v787, v788, 1, v0.wireTypes.varint);
        v789, v790 = v0.writeVarInt(v789, v790, v2.ActionType.toNumber(v786.action_type));
        v787 = v789;
        v788 = v790;
    end;
    if v786.action_params ~= nil then
        local v791 = v786.action_params:encode();
        local v792, v793 = v0.writeTag(v787, v788, 2, v0.wireTypes.lengthDelimited);
        v792, v793 = v0.writeBuffer(v792, v793, v791, buffer.len(v791));
        v787 = v792;
        v788 = v793;
    end;
    local v794 = buffer.create(v788);
    buffer.copy(v794, 0, v787, 0, v788);
    return v794;
end;
v7.decode = function(v795) --[[ Line: 7091 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_33 (copy), v0 (copy), v2 (copy)
    local v796 = l_v7_33.new();
    local v797 = 0;
    while v797 < buffer.len(v795) do
        local v798 = nil;
        local v799 = nil;
        local v800, v801, v802 = v0.readTag(v795, v797);
        v798 = v800;
        v799 = v801;
        v797 = v802;
        if v799 == v0.wireTypes.varint then
            if v798 == 1 then
                v800 = nil;
                v801, v802 = v0.readVarIntI32(v795, v797);
                v800 = v801;
                v797 = v802;
                v796.action_type = v2.ActionType.fromNumber(v800) or v800;
            else
                v800 = nil;
                v801, v802 = v0.readVarInt(v795, v797);
                v800 = v801;
                v797 = v802;
            end;
        elseif v799 == v0.wireTypes.lengthDelimited then
            if v798 == 2 then
                v800 = nil;
                v801, v802 = v0.readBuffer(v795, v797);
                v800 = v801;
                v797 = v802;
                v796.action_params = v2.OpenProfileAction_Params.decode(v800);
            else
                v800 = nil;
                v801, v802 = v0.readVarInt(v795, v797);
                v797 = v802 + v801;
            end;
        elseif v799 == v0.wireTypes.i32 then
            v800 = nil;
            v801, v802 = v0.readFixed32(v795, v797);
            v800 = v801;
            v797 = v802;
        elseif v799 == v0.wireTypes.i64 then
            v800 = nil;
            v801, v802 = v0.readFixed64(v795, v797);
            v800 = v801;
            v797 = v802;
        else
            error("Unsupported wire type: " .. v799);
        end;
    end;
    return v796;
end;
v7.jsonEncode = function(v803) --[[ Line: 7139 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v804 = {};
    if v803.action_type ~= nil and (v803.action_type ~= nil and v803.action_type ~= 0 or v803.action_type ~= v2.ActionType.fromNumber(0)) then
        v804.actionType = if typeof(v803.action_type) == "number" then v803.action_type else v2.ActionType.toNumber(v803.action_type);
    end;
    if v803.action_params ~= nil then
        v804.actionParams = v803.action_params:jsonEncode();
    end;
    return v804;
end;
v7.jsonDecode = function(v805) --[[ Line: 7161 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_33 (copy), v2 (copy)
    local v806 = l_v7_33.new();
    if v805.action_type ~= nil then
        v806.action_type = if typeof(v805.action_type) == "number" then v2.ActionType.fromNumber(v805.action_type) or v805.action_type else v2.ActionType.fromName(v805.action_type) or v805.action_type;
    end;
    if v805.actionType ~= nil then
        v806.action_type = if typeof(v805.actionType) == "number" then v2.ActionType.fromNumber(v805.actionType) or v805.actionType else v2.ActionType.fromName(v805.actionType) or v805.actionType;
    end;
    if v805.action_params ~= nil then
        v806.action_params = v2.OpenProfileAction_Params.jsonDecode(v805.action_params);
    end;
    if v805.actionParams ~= nil then
        v806.action_params = v2.OpenProfileAction_Params.jsonDecode(v805.actionParams);
    end;
    return v806;
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
v7.new = function(v808) --[[ Line: 7201 ]] --[[ Name: new ]]
    -- upvalues: l_v7_34 (copy)
    return (setmetatable({
        profile_id = if not (v808 ~= nil) or v808.profile_id == nil then nil else v808.profile_id, 
        profile_type = if not (v808 ~= nil) or v808.profile_type == nil then nil else v808.profile_type, 
        source = if not (v808 ~= nil) or v808.source == nil then nil else v808.source
    }, l_v7_34));
end;
v7.encode = function(v809) --[[ Line: 7209 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v810 = buffer.create(0);
    local v811 = 0;
    if v809.profile_id ~= nil then
        local v812 = v809.profile_id:encode();
        local v813, v814 = v0.writeTag(v810, v811, 1, v0.wireTypes.lengthDelimited);
        v813, v814 = v0.writeBuffer(v813, v814, v812, buffer.len(v812));
        v810 = v813;
        v811 = v814;
    end;
    if v809.profile_type ~= nil then
        local v815 = v809.profile_type:encode();
        local v816, v817 = v0.writeTag(v810, v811, 2, v0.wireTypes.lengthDelimited);
        v816, v817 = v0.writeBuffer(v816, v817, v815, buffer.len(v815));
        v810 = v816;
        v811 = v817;
    end;
    if v809.source ~= nil then
        local v818 = v809.source:encode();
        local v819, v820 = v0.writeTag(v810, v811, 3, v0.wireTypes.lengthDelimited);
        v819, v820 = v0.writeBuffer(v819, v820, v818, buffer.len(v818));
        v810 = v819;
        v811 = v820;
    end;
    local v821 = buffer.create(v811);
    buffer.copy(v821, 0, v810, 0, v811);
    return v821;
end;
v7.decode = function(v822) --[[ Line: 7236 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_34 (copy), v0 (copy), v5 (copy)
    local v823 = l_v7_34.new();
    local v824 = 0;
    while v824 < buffer.len(v822) do
        local v825 = nil;
        local v826 = nil;
        local v827, v828, v829 = v0.readTag(v822, v824);
        v825 = v827;
        v826 = v828;
        v824 = v829;
        if v826 == v0.wireTypes.varint then
            v827 = nil;
            v828, v829 = v0.readVarInt(v822, v824);
            v827 = v828;
            v824 = v829;
        elseif v826 == v0.wireTypes.lengthDelimited then
            if v825 == 1 then
                v827 = nil;
                v828, v829 = v0.readBuffer(v822, v824);
                v827 = v828;
                v824 = v829;
                v823.profile_id = v5.StringProp.decode(v827);
            elseif v825 == 2 then
                v827 = nil;
                v828, v829 = v0.readBuffer(v822, v824);
                v827 = v828;
                v824 = v829;
                v823.profile_type = v5.StringProp.decode(v827);
            elseif v825 == 3 then
                v827 = nil;
                v828, v829 = v0.readBuffer(v822, v824);
                v827 = v828;
                v824 = v829;
                v823.source = v5.StringProp.decode(v827);
            else
                v827 = nil;
                v828, v829 = v0.readVarInt(v822, v824);
                v824 = v829 + v828;
            end;
        elseif v826 == v0.wireTypes.i32 then
            v827 = nil;
            v828, v829 = v0.readFixed32(v822, v824);
            v827 = v828;
            v824 = v829;
        elseif v826 == v0.wireTypes.i64 then
            v827 = nil;
            v828, v829 = v0.readFixed64(v822, v824);
            v827 = v828;
            v824 = v829;
        else
            error("Unsupported wire type: " .. v826);
        end;
    end;
    return v823;
end;
v7.jsonEncode = function(v830) --[[ Line: 7289 ]] --[[ Name: jsonEncode ]]
    local v831 = {};
    if v830.profile_id ~= nil then
        v831.profileId = v830.profile_id:jsonEncode();
    end;
    if v830.profile_type ~= nil then
        v831.profileType = v830.profile_type:jsonEncode();
    end;
    if v830.source ~= nil then
        v831.source = v830.source:jsonEncode();
    end;
    return v831;
end;
v7.jsonDecode = function(v832) --[[ Line: 7307 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_34 (copy), v5 (copy)
    local v833 = l_v7_34.new();
    if v832.profile_id ~= nil then
        v833.profile_id = v5.StringProp.jsonDecode(v832.profile_id);
    end;
    if v832.profileId ~= nil then
        v833.profile_id = v5.StringProp.jsonDecode(v832.profileId);
    end;
    if v832.profile_type ~= nil then
        v833.profile_type = v5.StringProp.jsonDecode(v832.profile_type);
    end;
    if v832.profileType ~= nil then
        v833.profile_type = v5.StringProp.jsonDecode(v832.profileType);
    end;
    if v832.source ~= nil then
        v833.source = v5.StringProp.jsonDecode(v832.source);
    end;
    return v833;
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
v7.new = function(v835) --[[ Line: 7349 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_35 (copy)
    return (setmetatable({
        action_type = if not (v835 ~= nil) or v835.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v835.action_type, 
        action_params = if not (v835 ~= nil) or v835.action_params == nil then nil else v835.action_params
    }, l_v7_35));
end;
v7.encode = function(v836) --[[ Line: 7360 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v837 = buffer.create(0);
    local v838 = 0;
    if v836.action_type ~= nil and (v836.action_type ~= nil and v836.action_type ~= 0 or v836.action_type ~= v2.ActionType.fromNumber(0)) then
        local v839, v840 = v0.writeTag(v837, v838, 1, v0.wireTypes.varint);
        v839, v840 = v0.writeVarInt(v839, v840, v2.ActionType.toNumber(v836.action_type));
        v837 = v839;
        v838 = v840;
    end;
    if v836.action_params ~= nil then
        local v841 = v836.action_params:encode();
        local v842, v843 = v0.writeTag(v837, v838, 2, v0.wireTypes.lengthDelimited);
        v842, v843 = v0.writeBuffer(v842, v843, v841, buffer.len(v841));
        v837 = v842;
        v838 = v843;
    end;
    local v844 = buffer.create(v838);
    buffer.copy(v844, 0, v837, 0, v838);
    return v844;
end;
v7.decode = function(v845) --[[ Line: 7386 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_35 (copy), v0 (copy), v2 (copy)
    local v846 = l_v7_35.new();
    local v847 = 0;
    while v847 < buffer.len(v845) do
        local v848 = nil;
        local v849 = nil;
        local v850, v851, v852 = v0.readTag(v845, v847);
        v848 = v850;
        v849 = v851;
        v847 = v852;
        if v849 == v0.wireTypes.varint then
            if v848 == 1 then
                v850 = nil;
                v851, v852 = v0.readVarIntI32(v845, v847);
                v850 = v851;
                v847 = v852;
                v846.action_type = v2.ActionType.fromNumber(v850) or v850;
            else
                v850 = nil;
                v851, v852 = v0.readVarInt(v845, v847);
                v850 = v851;
                v847 = v852;
            end;
        elseif v849 == v0.wireTypes.lengthDelimited then
            if v848 == 2 then
                v850 = nil;
                v851, v852 = v0.readBuffer(v845, v847);
                v850 = v851;
                v847 = v852;
                v846.action_params = v2.OpenFacialAgeEstimationAction_Params.decode(v850);
            else
                v850 = nil;
                v851, v852 = v0.readVarInt(v845, v847);
                v847 = v852 + v851;
            end;
        elseif v849 == v0.wireTypes.i32 then
            v850 = nil;
            v851, v852 = v0.readFixed32(v845, v847);
            v850 = v851;
            v847 = v852;
        elseif v849 == v0.wireTypes.i64 then
            v850 = nil;
            v851, v852 = v0.readFixed64(v845, v847);
            v850 = v851;
            v847 = v852;
        else
            error("Unsupported wire type: " .. v849);
        end;
    end;
    return v846;
end;
v7.jsonEncode = function(v853) --[[ Line: 7434 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v854 = {};
    if v853.action_type ~= nil and (v853.action_type ~= nil and v853.action_type ~= 0 or v853.action_type ~= v2.ActionType.fromNumber(0)) then
        v854.actionType = if typeof(v853.action_type) == "number" then v853.action_type else v2.ActionType.toNumber(v853.action_type);
    end;
    if v853.action_params ~= nil then
        v854.actionParams = v853.action_params:jsonEncode();
    end;
    return v854;
end;
v7.jsonDecode = function(v855) --[[ Line: 7456 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_35 (copy), v2 (copy)
    local v856 = l_v7_35.new();
    if v855.action_type ~= nil then
        v856.action_type = if typeof(v855.action_type) == "number" then v2.ActionType.fromNumber(v855.action_type) or v855.action_type else v2.ActionType.fromName(v855.action_type) or v855.action_type;
    end;
    if v855.actionType ~= nil then
        v856.action_type = if typeof(v855.actionType) == "number" then v2.ActionType.fromNumber(v855.actionType) or v855.actionType else v2.ActionType.fromName(v855.actionType) or v855.actionType;
    end;
    if v855.action_params ~= nil then
        v856.action_params = v2.OpenFacialAgeEstimationAction_Params.jsonDecode(v855.action_params);
    end;
    if v855.actionParams ~= nil then
        v856.action_params = v2.OpenFacialAgeEstimationAction_Params.jsonDecode(v855.actionParams);
    end;
    return v856;
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
v7.new = function(v858) --[[ Line: 7496 ]] --[[ Name: new ]]
    -- upvalues: l_v7_36 (copy)
    return (setmetatable({
        user_id = if not (v858 ~= nil) or v858.user_id == nil then nil else v858.user_id, 
        source = if not (v858 ~= nil) or v858.source == nil then nil else v858.source
    }, l_v7_36));
end;
v7.encode = function(v859) --[[ Line: 7505 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v860 = buffer.create(0);
    local v861 = 0;
    if v859.user_id ~= nil then
        local v862 = v859.user_id:encode();
        local v863, v864 = v0.writeTag(v860, v861, 1, v0.wireTypes.lengthDelimited);
        v863, v864 = v0.writeBuffer(v863, v864, v862, buffer.len(v862));
        v860 = v863;
        v861 = v864;
    end;
    if v859.source ~= nil then
        local v865 = v859.source:encode();
        local v866, v867 = v0.writeTag(v860, v861, 2, v0.wireTypes.lengthDelimited);
        v866, v867 = v0.writeBuffer(v866, v867, v865, buffer.len(v865));
        v860 = v866;
        v861 = v867;
    end;
    local v868 = buffer.create(v861);
    buffer.copy(v868, 0, v860, 0, v861);
    return v868;
end;
v7.decode = function(v869) --[[ Line: 7526 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_36 (copy), v0 (copy), v5 (copy)
    local v870 = l_v7_36.new();
    local v871 = 0;
    while v871 < buffer.len(v869) do
        local v872 = nil;
        local v873 = nil;
        local v874, v875, v876 = v0.readTag(v869, v871);
        v872 = v874;
        v873 = v875;
        v871 = v876;
        if v873 == v0.wireTypes.varint then
            v874 = nil;
            v875, v876 = v0.readVarInt(v869, v871);
            v874 = v875;
            v871 = v876;
        elseif v873 == v0.wireTypes.lengthDelimited then
            if v872 == 1 then
                v874 = nil;
                v875, v876 = v0.readBuffer(v869, v871);
                v874 = v875;
                v871 = v876;
                v870.user_id = v5.StringProp.decode(v874);
            elseif v872 == 2 then
                v874 = nil;
                v875, v876 = v0.readBuffer(v869, v871);
                v874 = v875;
                v871 = v876;
                v870.source = v5.StringProp.decode(v874);
            else
                v874 = nil;
                v875, v876 = v0.readVarInt(v869, v871);
                v871 = v876 + v875;
            end;
        elseif v873 == v0.wireTypes.i32 then
            v874 = nil;
            v875, v876 = v0.readFixed32(v869, v871);
            v874 = v875;
            v871 = v876;
        elseif v873 == v0.wireTypes.i64 then
            v874 = nil;
            v875, v876 = v0.readFixed64(v869, v871);
            v874 = v875;
            v871 = v876;
        else
            error("Unsupported wire type: " .. v873);
        end;
    end;
    return v870;
end;
v7.jsonEncode = function(v877) --[[ Line: 7574 ]] --[[ Name: jsonEncode ]]
    local v878 = {};
    if v877.user_id ~= nil then
        v878.userId = v877.user_id:jsonEncode();
    end;
    if v877.source ~= nil then
        v878.source = v877.source:jsonEncode();
    end;
    return v878;
end;
v7.jsonDecode = function(v879) --[[ Line: 7588 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_36 (copy), v5 (copy)
    local v880 = l_v7_36.new();
    if v879.user_id ~= nil then
        v880.user_id = v5.StringProp.jsonDecode(v879.user_id);
    end;
    if v879.userId ~= nil then
        v880.user_id = v5.StringProp.jsonDecode(v879.userId);
    end;
    if v879.source ~= nil then
        v880.source = v5.StringProp.jsonDecode(v879.source);
    end;
    return v880;
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
v7.new = function(v882) --[[ Line: 7622 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_37 (copy)
    return (setmetatable({
        action_type = if not (v882 ~= nil) or v882.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v882.action_type, 
        action_params = if not (v882 ~= nil) or v882.action_params == nil then nil else v882.action_params
    }, l_v7_37));
end;
v7.encode = function(v883) --[[ Line: 7633 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v884 = buffer.create(0);
    local v885 = 0;
    if v883.action_type ~= nil and (v883.action_type ~= nil and v883.action_type ~= 0 or v883.action_type ~= v2.ActionType.fromNumber(0)) then
        local v886, v887 = v0.writeTag(v884, v885, 1, v0.wireTypes.varint);
        v886, v887 = v0.writeVarInt(v886, v887, v2.ActionType.toNumber(v883.action_type));
        v884 = v886;
        v885 = v887;
    end;
    if v883.action_params ~= nil then
        local v888 = v883.action_params:encode();
        local v889, v890 = v0.writeTag(v884, v885, 2, v0.wireTypes.lengthDelimited);
        v889, v890 = v0.writeBuffer(v889, v890, v888, buffer.len(v888));
        v884 = v889;
        v885 = v890;
    end;
    local v891 = buffer.create(v885);
    buffer.copy(v891, 0, v884, 0, v885);
    return v891;
end;
v7.decode = function(v892) --[[ Line: 7659 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_37 (copy), v0 (copy), v2 (copy)
    local v893 = l_v7_37.new();
    local v894 = 0;
    while v894 < buffer.len(v892) do
        local v895 = nil;
        local v896 = nil;
        local v897, v898, v899 = v0.readTag(v892, v894);
        v895 = v897;
        v896 = v898;
        v894 = v899;
        if v896 == v0.wireTypes.varint then
            if v895 == 1 then
                v897 = nil;
                v898, v899 = v0.readVarIntI32(v892, v894);
                v897 = v898;
                v894 = v899;
                v893.action_type = v2.ActionType.fromNumber(v897) or v897;
            else
                v897 = nil;
                v898, v899 = v0.readVarInt(v892, v894);
                v897 = v898;
                v894 = v899;
            end;
        elseif v896 == v0.wireTypes.lengthDelimited then
            if v895 == 2 then
                v897 = nil;
                v898, v899 = v0.readBuffer(v892, v894);
                v897 = v898;
                v894 = v899;
                v893.action_params = v2.OpenAddConnectionsPageAction_Params.decode(v897);
            else
                v897 = nil;
                v898, v899 = v0.readVarInt(v892, v894);
                v894 = v899 + v898;
            end;
        elseif v896 == v0.wireTypes.i32 then
            v897 = nil;
            v898, v899 = v0.readFixed32(v892, v894);
            v897 = v898;
            v894 = v899;
        elseif v896 == v0.wireTypes.i64 then
            v897 = nil;
            v898, v899 = v0.readFixed64(v892, v894);
            v897 = v898;
            v894 = v899;
        else
            error("Unsupported wire type: " .. v896);
        end;
    end;
    return v893;
end;
v7.jsonEncode = function(v900) --[[ Line: 7707 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v901 = {};
    if v900.action_type ~= nil and (v900.action_type ~= nil and v900.action_type ~= 0 or v900.action_type ~= v2.ActionType.fromNumber(0)) then
        v901.actionType = if typeof(v900.action_type) == "number" then v900.action_type else v2.ActionType.toNumber(v900.action_type);
    end;
    if v900.action_params ~= nil then
        v901.actionParams = v900.action_params:jsonEncode();
    end;
    return v901;
end;
v7.jsonDecode = function(v902) --[[ Line: 7729 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_37 (copy), v2 (copy)
    local v903 = l_v7_37.new();
    if v902.action_type ~= nil then
        v903.action_type = if typeof(v902.action_type) == "number" then v2.ActionType.fromNumber(v902.action_type) or v902.action_type else v2.ActionType.fromName(v902.action_type) or v902.action_type;
    end;
    if v902.actionType ~= nil then
        v903.action_type = if typeof(v902.actionType) == "number" then v2.ActionType.fromNumber(v902.actionType) or v902.actionType else v2.ActionType.fromName(v902.actionType) or v902.actionType;
    end;
    if v902.action_params ~= nil then
        v903.action_params = v2.OpenAddConnectionsPageAction_Params.jsonDecode(v902.action_params);
    end;
    if v902.actionParams ~= nil then
        v903.action_params = v2.OpenAddConnectionsPageAction_Params.jsonDecode(v902.actionParams);
    end;
    return v903;
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
v7.new = function(v905) --[[ Line: 7769 ]] --[[ Name: new ]]
    -- upvalues: l_v7_38 (copy)
    return (setmetatable({
        user_id = if not (v905 ~= nil) or v905.user_id == nil then nil else v905.user_id, 
        source = if not (v905 ~= nil) or v905.source == nil then nil else v905.source
    }, l_v7_38));
end;
v7.encode = function(v906) --[[ Line: 7778 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v907 = buffer.create(0);
    local v908 = 0;
    if v906.user_id ~= nil then
        local v909 = v906.user_id:encode();
        local v910, v911 = v0.writeTag(v907, v908, 1, v0.wireTypes.lengthDelimited);
        v910, v911 = v0.writeBuffer(v910, v911, v909, buffer.len(v909));
        v907 = v910;
        v908 = v911;
    end;
    if v906.source ~= nil then
        local v912 = v906.source:encode();
        local v913, v914 = v0.writeTag(v907, v908, 2, v0.wireTypes.lengthDelimited);
        v913, v914 = v0.writeBuffer(v913, v914, v912, buffer.len(v912));
        v907 = v913;
        v908 = v914;
    end;
    local v915 = buffer.create(v908);
    buffer.copy(v915, 0, v907, 0, v908);
    return v915;
end;
v7.decode = function(v916) --[[ Line: 7799 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_38 (copy), v0 (copy), v5 (copy)
    local v917 = l_v7_38.new();
    local v918 = 0;
    while v918 < buffer.len(v916) do
        local v919 = nil;
        local v920 = nil;
        local v921, v922, v923 = v0.readTag(v916, v918);
        v919 = v921;
        v920 = v922;
        v918 = v923;
        if v920 == v0.wireTypes.varint then
            v921 = nil;
            v922, v923 = v0.readVarInt(v916, v918);
            v921 = v922;
            v918 = v923;
        elseif v920 == v0.wireTypes.lengthDelimited then
            if v919 == 1 then
                v921 = nil;
                v922, v923 = v0.readBuffer(v916, v918);
                v921 = v922;
                v918 = v923;
                v917.user_id = v5.StringProp.decode(v921);
            elseif v919 == 2 then
                v921 = nil;
                v922, v923 = v0.readBuffer(v916, v918);
                v921 = v922;
                v918 = v923;
                v917.source = v5.StringProp.decode(v921);
            else
                v921 = nil;
                v922, v923 = v0.readVarInt(v916, v918);
                v918 = v923 + v922;
            end;
        elseif v920 == v0.wireTypes.i32 then
            v921 = nil;
            v922, v923 = v0.readFixed32(v916, v918);
            v921 = v922;
            v918 = v923;
        elseif v920 == v0.wireTypes.i64 then
            v921 = nil;
            v922, v923 = v0.readFixed64(v916, v918);
            v921 = v922;
            v918 = v923;
        else
            error("Unsupported wire type: " .. v920);
        end;
    end;
    return v917;
end;
v7.jsonEncode = function(v924) --[[ Line: 7847 ]] --[[ Name: jsonEncode ]]
    local v925 = {};
    if v924.user_id ~= nil then
        v925.userId = v924.user_id:jsonEncode();
    end;
    if v924.source ~= nil then
        v925.source = v924.source:jsonEncode();
    end;
    return v925;
end;
v7.jsonDecode = function(v926) --[[ Line: 7861 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_38 (copy), v5 (copy)
    local v927 = l_v7_38.new();
    if v926.user_id ~= nil then
        v927.user_id = v5.StringProp.jsonDecode(v926.user_id);
    end;
    if v926.userId ~= nil then
        v927.user_id = v5.StringProp.jsonDecode(v926.userId);
    end;
    if v926.source ~= nil then
        v927.source = v5.StringProp.jsonDecode(v926.source);
    end;
    return v927;
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
v7.new = function(v929) --[[ Line: 7895 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_39 (copy)
    return (setmetatable({
        action_type = if not (v929 ~= nil) or v929.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v929.action_type, 
        action_params = if not (v929 ~= nil) or v929.action_params == nil then nil else v929.action_params
    }, l_v7_39));
end;
v7.encode = function(v930) --[[ Line: 7904 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v931 = buffer.create(0);
    local v932 = 0;
    if v930.action_type ~= nil and (v930.action_type ~= nil and v930.action_type ~= 0 or v930.action_type ~= v2.ActionType.fromNumber(0)) then
        local v933, v934 = v0.writeTag(v931, v932, 1, v0.wireTypes.varint);
        v933, v934 = v0.writeVarInt(v933, v934, v2.ActionType.toNumber(v930.action_type));
        v931 = v933;
        v932 = v934;
    end;
    if v930.action_params ~= nil then
        local v935 = v930.action_params:encode();
        local v936, v937 = v0.writeTag(v931, v932, 2, v0.wireTypes.lengthDelimited);
        v936, v937 = v0.writeBuffer(v936, v937, v935, buffer.len(v935));
        v931 = v936;
        v932 = v937;
    end;
    local v938 = buffer.create(v932);
    buffer.copy(v938, 0, v931, 0, v932);
    return v938;
end;
v7.decode = function(v939) --[[ Line: 7930 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_39 (copy), v0 (copy), v2 (copy)
    local v940 = l_v7_39.new();
    local v941 = 0;
    while v941 < buffer.len(v939) do
        local v942 = nil;
        local v943 = nil;
        local v944, v945, v946 = v0.readTag(v939, v941);
        v942 = v944;
        v943 = v945;
        v941 = v946;
        if v943 == v0.wireTypes.varint then
            if v942 == 1 then
                v944 = nil;
                v945, v946 = v0.readVarIntI32(v939, v941);
                v944 = v945;
                v941 = v946;
                v940.action_type = v2.ActionType.fromNumber(v944) or v944;
            else
                v944 = nil;
                v945, v946 = v0.readVarInt(v939, v941);
                v944 = v945;
                v941 = v946;
            end;
        elseif v943 == v0.wireTypes.lengthDelimited then
            if v942 == 2 then
                v944 = nil;
                v945, v946 = v0.readBuffer(v939, v941);
                v944 = v945;
                v941 = v946;
                v940.action_params = v2.OpenMarketplaceAction_Params.decode(v944);
            else
                v944 = nil;
                v945, v946 = v0.readVarInt(v939, v941);
                v941 = v946 + v945;
            end;
        elseif v943 == v0.wireTypes.i32 then
            v944 = nil;
            v945, v946 = v0.readFixed32(v939, v941);
            v944 = v945;
            v941 = v946;
        elseif v943 == v0.wireTypes.i64 then
            v944 = nil;
            v945, v946 = v0.readFixed64(v939, v941);
            v944 = v945;
            v941 = v946;
        else
            error("Unsupported wire type: " .. v943);
        end;
    end;
    return v940;
end;
v7.jsonEncode = function(v947) --[[ Line: 7978 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v948 = {};
    if v947.action_type ~= nil and (v947.action_type ~= nil and v947.action_type ~= 0 or v947.action_type ~= v2.ActionType.fromNumber(0)) then
        v948.actionType = if typeof(v947.action_type) == "number" then v947.action_type else v2.ActionType.toNumber(v947.action_type);
    end;
    if v947.action_params ~= nil then
        v948.actionParams = v947.action_params:jsonEncode();
    end;
    return v948;
end;
v7.jsonDecode = function(v949) --[[ Line: 8000 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_39 (copy), v2 (copy)
    local v950 = l_v7_39.new();
    if v949.action_type ~= nil then
        v950.action_type = if typeof(v949.action_type) == "number" then v2.ActionType.fromNumber(v949.action_type) or v949.action_type else v2.ActionType.fromName(v949.action_type) or v949.action_type;
    end;
    if v949.actionType ~= nil then
        v950.action_type = if typeof(v949.actionType) == "number" then v2.ActionType.fromNumber(v949.actionType) or v949.actionType else v2.ActionType.fromName(v949.actionType) or v949.actionType;
    end;
    if v949.action_params ~= nil then
        v950.action_params = v2.OpenMarketplaceAction_Params.jsonDecode(v949.action_params);
    end;
    if v949.actionParams ~= nil then
        v950.action_params = v2.OpenMarketplaceAction_Params.jsonDecode(v949.actionParams);
    end;
    return v950;
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
v7.new = function(v952) --[[ Line: 8040 ]] --[[ Name: new ]]
    -- upvalues: l_v7_40 (copy)
    return (setmetatable({
        user_id = if not (v952 ~= nil) or v952.user_id == nil then nil else v952.user_id, 
        source = if not (v952 ~= nil) or v952.source == nil then nil else v952.source
    }, l_v7_40));
end;
v7.encode = function(v953) --[[ Line: 8049 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v954 = buffer.create(0);
    local v955 = 0;
    if v953.user_id ~= nil then
        local v956 = v953.user_id:encode();
        local v957, v958 = v0.writeTag(v954, v955, 1, v0.wireTypes.lengthDelimited);
        v957, v958 = v0.writeBuffer(v957, v958, v956, buffer.len(v956));
        v954 = v957;
        v955 = v958;
    end;
    if v953.source ~= nil then
        local v959 = v953.source:encode();
        local v960, v961 = v0.writeTag(v954, v955, 2, v0.wireTypes.lengthDelimited);
        v960, v961 = v0.writeBuffer(v960, v961, v959, buffer.len(v959));
        v954 = v960;
        v955 = v961;
    end;
    local v962 = buffer.create(v955);
    buffer.copy(v962, 0, v954, 0, v955);
    return v962;
end;
v7.decode = function(v963) --[[ Line: 8070 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_40 (copy), v0 (copy), v5 (copy)
    local v964 = l_v7_40.new();
    local v965 = 0;
    while v965 < buffer.len(v963) do
        local v966 = nil;
        local v967 = nil;
        local v968, v969, v970 = v0.readTag(v963, v965);
        v966 = v968;
        v967 = v969;
        v965 = v970;
        if v967 == v0.wireTypes.varint then
            v968 = nil;
            v969, v970 = v0.readVarInt(v963, v965);
            v968 = v969;
            v965 = v970;
        elseif v967 == v0.wireTypes.lengthDelimited then
            if v966 == 1 then
                v968 = nil;
                v969, v970 = v0.readBuffer(v963, v965);
                v968 = v969;
                v965 = v970;
                v964.user_id = v5.StringProp.decode(v968);
            elseif v966 == 2 then
                v968 = nil;
                v969, v970 = v0.readBuffer(v963, v965);
                v968 = v969;
                v965 = v970;
                v964.source = v5.StringProp.decode(v968);
            else
                v968 = nil;
                v969, v970 = v0.readVarInt(v963, v965);
                v965 = v970 + v969;
            end;
        elseif v967 == v0.wireTypes.i32 then
            v968 = nil;
            v969, v970 = v0.readFixed32(v963, v965);
            v968 = v969;
            v965 = v970;
        elseif v967 == v0.wireTypes.i64 then
            v968 = nil;
            v969, v970 = v0.readFixed64(v963, v965);
            v968 = v969;
            v965 = v970;
        else
            error("Unsupported wire type: " .. v967);
        end;
    end;
    return v964;
end;
v7.jsonEncode = function(v971) --[[ Line: 8118 ]] --[[ Name: jsonEncode ]]
    local v972 = {};
    if v971.user_id ~= nil then
        v972.userId = v971.user_id:jsonEncode();
    end;
    if v971.source ~= nil then
        v972.source = v971.source:jsonEncode();
    end;
    return v972;
end;
v7.jsonDecode = function(v973) --[[ Line: 8132 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_40 (copy), v5 (copy)
    local v974 = l_v7_40.new();
    if v973.user_id ~= nil then
        v974.user_id = v5.StringProp.jsonDecode(v973.user_id);
    end;
    if v973.userId ~= nil then
        v974.user_id = v5.StringProp.jsonDecode(v973.userId);
    end;
    if v973.source ~= nil then
        v974.source = v5.StringProp.jsonDecode(v973.source);
    end;
    return v974;
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
v7.new = function(v976) --[[ Line: 8164 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_41 (copy)
    return (setmetatable({
        action_type = if not (v976 ~= nil) or v976.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v976.action_type, 
        action_params = if not (v976 ~= nil) or v976.action_params == nil then nil else v976.action_params
    }, l_v7_41));
end;
v7.encode = function(v977) --[[ Line: 8175 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v978 = buffer.create(0);
    local v979 = 0;
    if v977.action_type ~= nil and (v977.action_type ~= nil and v977.action_type ~= 0 or v977.action_type ~= v2.ActionType.fromNumber(0)) then
        local v980, v981 = v0.writeTag(v978, v979, 1, v0.wireTypes.varint);
        v980, v981 = v0.writeVarInt(v980, v981, v2.ActionType.toNumber(v977.action_type));
        v978 = v980;
        v979 = v981;
    end;
    if v977.action_params ~= nil then
        local v982 = v977.action_params:encode();
        local v983, v984 = v0.writeTag(v978, v979, 2, v0.wireTypes.lengthDelimited);
        v983, v984 = v0.writeBuffer(v983, v984, v982, buffer.len(v982));
        v978 = v983;
        v979 = v984;
    end;
    local v985 = buffer.create(v979);
    buffer.copy(v985, 0, v978, 0, v979);
    return v985;
end;
v7.decode = function(v986) --[[ Line: 8201 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_41 (copy), v0 (copy), v2 (copy)
    local v987 = l_v7_41.new();
    local v988 = 0;
    while v988 < buffer.len(v986) do
        local v989 = nil;
        local v990 = nil;
        local v991, v992, v993 = v0.readTag(v986, v988);
        v989 = v991;
        v990 = v992;
        v988 = v993;
        if v990 == v0.wireTypes.varint then
            if v989 == 1 then
                v991 = nil;
                v992, v993 = v0.readVarIntI32(v986, v988);
                v991 = v992;
                v988 = v993;
                v987.action_type = v2.ActionType.fromNumber(v991) or v991;
            else
                v991 = nil;
                v992, v993 = v0.readVarInt(v986, v988);
                v991 = v992;
                v988 = v993;
            end;
        elseif v990 == v0.wireTypes.lengthDelimited then
            if v989 == 2 then
                v991 = nil;
                v992, v993 = v0.readBuffer(v986, v988);
                v991 = v992;
                v988 = v993;
                v987.action_params = v2.HideProfileCompletionAction_Params.decode(v991);
            else
                v991 = nil;
                v992, v993 = v0.readVarInt(v986, v988);
                v988 = v993 + v992;
            end;
        elseif v990 == v0.wireTypes.i32 then
            v991 = nil;
            v992, v993 = v0.readFixed32(v986, v988);
            v991 = v992;
            v988 = v993;
        elseif v990 == v0.wireTypes.i64 then
            v991 = nil;
            v992, v993 = v0.readFixed64(v986, v988);
            v991 = v992;
            v988 = v993;
        else
            error("Unsupported wire type: " .. v990);
        end;
    end;
    return v987;
end;
v7.jsonEncode = function(v994) --[[ Line: 8249 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v995 = {};
    if v994.action_type ~= nil and (v994.action_type ~= nil and v994.action_type ~= 0 or v994.action_type ~= v2.ActionType.fromNumber(0)) then
        v995.actionType = if typeof(v994.action_type) == "number" then v994.action_type else v2.ActionType.toNumber(v994.action_type);
    end;
    if v994.action_params ~= nil then
        v995.actionParams = v994.action_params:jsonEncode();
    end;
    return v995;
end;
v7.jsonDecode = function(v996) --[[ Line: 8271 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_41 (copy), v2 (copy)
    local v997 = l_v7_41.new();
    if v996.action_type ~= nil then
        v997.action_type = if typeof(v996.action_type) == "number" then v2.ActionType.fromNumber(v996.action_type) or v996.action_type else v2.ActionType.fromName(v996.action_type) or v996.action_type;
    end;
    if v996.actionType ~= nil then
        v997.action_type = if typeof(v996.actionType) == "number" then v2.ActionType.fromNumber(v996.actionType) or v996.actionType else v2.ActionType.fromName(v996.actionType) or v996.actionType;
    end;
    if v996.action_params ~= nil then
        v997.action_params = v2.HideProfileCompletionAction_Params.jsonDecode(v996.action_params);
    end;
    if v996.actionParams ~= nil then
        v997.action_params = v2.HideProfileCompletionAction_Params.jsonDecode(v996.actionParams);
    end;
    return v997;
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
v7.new = function(v999) --[[ Line: 8311 ]] --[[ Name: new ]]
    -- upvalues: l_v7_42 (copy)
    return (setmetatable({
        user_id = if not (v999 ~= nil) or v999.user_id == nil then nil else v999.user_id, 
        prompt_id = if not (v999 ~= nil) or v999.prompt_id == nil then nil else v999.prompt_id, 
        source = if not (v999 ~= nil) or v999.source == nil then nil else v999.source, 
        prompt_type = if not (v999 ~= nil) or v999.prompt_type == nil then nil else v999.prompt_type
    }, l_v7_42));
end;
v7.encode = function(v1000) --[[ Line: 8322 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1001 = buffer.create(0);
    local v1002 = 0;
    if v1000.user_id ~= nil then
        local v1003 = v1000.user_id:encode();
        local v1004, v1005 = v0.writeTag(v1001, v1002, 1, v0.wireTypes.lengthDelimited);
        v1004, v1005 = v0.writeBuffer(v1004, v1005, v1003, buffer.len(v1003));
        v1001 = v1004;
        v1002 = v1005;
    end;
    if v1000.prompt_id ~= nil then
        local v1006 = v1000.prompt_id:encode();
        local v1007, v1008 = v0.writeTag(v1001, v1002, 2, v0.wireTypes.lengthDelimited);
        v1007, v1008 = v0.writeBuffer(v1007, v1008, v1006, buffer.len(v1006));
        v1001 = v1007;
        v1002 = v1008;
    end;
    if v1000.source ~= nil then
        local v1009 = v1000.source:encode();
        local v1010, v1011 = v0.writeTag(v1001, v1002, 3, v0.wireTypes.lengthDelimited);
        v1010, v1011 = v0.writeBuffer(v1010, v1011, v1009, buffer.len(v1009));
        v1001 = v1010;
        v1002 = v1011;
    end;
    if v1000.prompt_type ~= nil then
        local v1012 = v1000.prompt_type:encode();
        local v1013, v1014 = v0.writeTag(v1001, v1002, 4, v0.wireTypes.lengthDelimited);
        v1013, v1014 = v0.writeBuffer(v1013, v1014, v1012, buffer.len(v1012));
        v1001 = v1013;
        v1002 = v1014;
    end;
    local v1015 = buffer.create(v1002);
    buffer.copy(v1015, 0, v1001, 0, v1002);
    return v1015;
end;
v7.decode = function(v1016) --[[ Line: 8355 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_42 (copy), v0 (copy), v5 (copy)
    local v1017 = l_v7_42.new();
    local v1018 = 0;
    while v1018 < buffer.len(v1016) do
        local v1019 = nil;
        local v1020 = nil;
        local v1021, v1022, v1023 = v0.readTag(v1016, v1018);
        v1019 = v1021;
        v1020 = v1022;
        v1018 = v1023;
        if v1020 == v0.wireTypes.varint then
            v1021 = nil;
            v1022, v1023 = v0.readVarInt(v1016, v1018);
            v1021 = v1022;
            v1018 = v1023;
        elseif v1020 == v0.wireTypes.lengthDelimited then
            if v1019 == 1 then
                v1021 = nil;
                v1022, v1023 = v0.readBuffer(v1016, v1018);
                v1021 = v1022;
                v1018 = v1023;
                v1017.user_id = v5.StringProp.decode(v1021);
            elseif v1019 == 2 then
                v1021 = nil;
                v1022, v1023 = v0.readBuffer(v1016, v1018);
                v1021 = v1022;
                v1018 = v1023;
                v1017.prompt_id = v5.StringProp.decode(v1021);
            elseif v1019 == 3 then
                v1021 = nil;
                v1022, v1023 = v0.readBuffer(v1016, v1018);
                v1021 = v1022;
                v1018 = v1023;
                v1017.source = v5.StringProp.decode(v1021);
            elseif v1019 == 4 then
                v1021 = nil;
                v1022, v1023 = v0.readBuffer(v1016, v1018);
                v1021 = v1022;
                v1018 = v1023;
                v1017.prompt_type = v5.StringProp.decode(v1021);
            else
                v1021 = nil;
                v1022, v1023 = v0.readVarInt(v1016, v1018);
                v1018 = v1023 + v1022;
            end;
        elseif v1020 == v0.wireTypes.i32 then
            v1021 = nil;
            v1022, v1023 = v0.readFixed32(v1016, v1018);
            v1021 = v1022;
            v1018 = v1023;
        elseif v1020 == v0.wireTypes.i64 then
            v1021 = nil;
            v1022, v1023 = v0.readFixed64(v1016, v1018);
            v1021 = v1022;
            v1018 = v1023;
        else
            error("Unsupported wire type: " .. v1020);
        end;
    end;
    return v1017;
end;
v7.jsonEncode = function(v1024) --[[ Line: 8413 ]] --[[ Name: jsonEncode ]]
    local v1025 = {};
    if v1024.user_id ~= nil then
        v1025.userId = v1024.user_id:jsonEncode();
    end;
    if v1024.prompt_id ~= nil then
        v1025.promptId = v1024.prompt_id:jsonEncode();
    end;
    if v1024.source ~= nil then
        v1025.source = v1024.source:jsonEncode();
    end;
    if v1024.prompt_type ~= nil then
        v1025.promptType = v1024.prompt_type:jsonEncode();
    end;
    return v1025;
end;
v7.jsonDecode = function(v1026) --[[ Line: 8435 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_42 (copy), v5 (copy)
    local v1027 = l_v7_42.new();
    if v1026.user_id ~= nil then
        v1027.user_id = v5.StringProp.jsonDecode(v1026.user_id);
    end;
    if v1026.userId ~= nil then
        v1027.user_id = v5.StringProp.jsonDecode(v1026.userId);
    end;
    if v1026.prompt_id ~= nil then
        v1027.prompt_id = v5.StringProp.jsonDecode(v1026.prompt_id);
    end;
    if v1026.promptId ~= nil then
        v1027.prompt_id = v5.StringProp.jsonDecode(v1026.promptId);
    end;
    if v1026.source ~= nil then
        v1027.source = v5.StringProp.jsonDecode(v1026.source);
    end;
    if v1026.prompt_type ~= nil then
        v1027.prompt_type = v5.StringProp.jsonDecode(v1026.prompt_type);
    end;
    if v1026.promptType ~= nil then
        v1027.prompt_type = v5.StringProp.jsonDecode(v1026.promptType);
    end;
    return v1027;
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
v7.new = function(v1029) --[[ Line: 8486 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_43 (copy)
    return (setmetatable({
        action_type = if not (v1029 ~= nil) or v1029.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1029.action_type, 
        action_params = if not (v1029 ~= nil) or v1029.action_params == nil then nil else v1029.action_params
    }, l_v7_43));
end;
v7.encode = function(v1030) --[[ Line: 8497 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1031 = buffer.create(0);
    local v1032 = 0;
    if v1030.action_type ~= nil and (v1030.action_type ~= nil and v1030.action_type ~= 0 or v1030.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1033, v1034 = v0.writeTag(v1031, v1032, 1, v0.wireTypes.varint);
        v1033, v1034 = v0.writeVarInt(v1033, v1034, v2.ActionType.toNumber(v1030.action_type));
        v1031 = v1033;
        v1032 = v1034;
    end;
    if v1030.action_params ~= nil then
        local v1035 = v1030.action_params:encode();
        local v1036, v1037 = v0.writeTag(v1031, v1032, 2, v0.wireTypes.lengthDelimited);
        v1036, v1037 = v0.writeBuffer(v1036, v1037, v1035, buffer.len(v1035));
        v1031 = v1036;
        v1032 = v1037;
    end;
    local v1038 = buffer.create(v1032);
    buffer.copy(v1038, 0, v1031, 0, v1032);
    return v1038;
end;
v7.decode = function(v1039) --[[ Line: 8523 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_43 (copy), v0 (copy), v2 (copy)
    local v1040 = l_v7_43.new();
    local v1041 = 0;
    while v1041 < buffer.len(v1039) do
        local v1042 = nil;
        local v1043 = nil;
        local v1044, v1045, v1046 = v0.readTag(v1039, v1041);
        v1042 = v1044;
        v1043 = v1045;
        v1041 = v1046;
        if v1043 == v0.wireTypes.varint then
            if v1042 == 1 then
                v1044 = nil;
                v1045, v1046 = v0.readVarIntI32(v1039, v1041);
                v1044 = v1045;
                v1041 = v1046;
                v1040.action_type = v2.ActionType.fromNumber(v1044) or v1044;
            else
                v1044 = nil;
                v1045, v1046 = v0.readVarInt(v1039, v1041);
                v1044 = v1045;
                v1041 = v1046;
            end;
        elseif v1043 == v0.wireTypes.lengthDelimited then
            if v1042 == 2 then
                v1044 = nil;
                v1045, v1046 = v0.readBuffer(v1039, v1041);
                v1044 = v1045;
                v1041 = v1046;
                v1040.action_params = v2.SelectMarketplaceCatalogCategory_Params.decode(v1044);
            else
                v1044 = nil;
                v1045, v1046 = v0.readVarInt(v1039, v1041);
                v1041 = v1046 + v1045;
            end;
        elseif v1043 == v0.wireTypes.i32 then
            v1044 = nil;
            v1045, v1046 = v0.readFixed32(v1039, v1041);
            v1044 = v1045;
            v1041 = v1046;
        elseif v1043 == v0.wireTypes.i64 then
            v1044 = nil;
            v1045, v1046 = v0.readFixed64(v1039, v1041);
            v1044 = v1045;
            v1041 = v1046;
        else
            error("Unsupported wire type: " .. v1043);
        end;
    end;
    return v1040;
end;
v7.jsonEncode = function(v1047) --[[ Line: 8571 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1048 = {};
    if v1047.action_type ~= nil and (v1047.action_type ~= nil and v1047.action_type ~= 0 or v1047.action_type ~= v2.ActionType.fromNumber(0)) then
        v1048.actionType = if typeof(v1047.action_type) == "number" then v1047.action_type else v2.ActionType.toNumber(v1047.action_type);
    end;
    if v1047.action_params ~= nil then
        v1048.actionParams = v1047.action_params:jsonEncode();
    end;
    return v1048;
end;
v7.jsonDecode = function(v1049) --[[ Line: 8593 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_43 (copy), v2 (copy)
    local v1050 = l_v7_43.new();
    if v1049.action_type ~= nil then
        v1050.action_type = if typeof(v1049.action_type) == "number" then v2.ActionType.fromNumber(v1049.action_type) or v1049.action_type else v2.ActionType.fromName(v1049.action_type) or v1049.action_type;
    end;
    if v1049.actionType ~= nil then
        v1050.action_type = if typeof(v1049.actionType) == "number" then v2.ActionType.fromNumber(v1049.actionType) or v1049.actionType else v2.ActionType.fromName(v1049.actionType) or v1049.actionType;
    end;
    if v1049.action_params ~= nil then
        v1050.action_params = v2.SelectMarketplaceCatalogCategory_Params.jsonDecode(v1049.action_params);
    end;
    if v1049.actionParams ~= nil then
        v1050.action_params = v2.SelectMarketplaceCatalogCategory_Params.jsonDecode(v1049.actionParams);
    end;
    return v1050;
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
v7.new = function(v1052) --[[ Line: 8635 ]] --[[ Name: new ]]
    -- upvalues: l_v7_44 (copy)
    return (setmetatable({
        category_id = if not (v1052 ~= nil) or v1052.category_id == nil then nil else v1052.category_id
    }, l_v7_44));
end;
v7.encode = function(v1053) --[[ Line: 8643 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1054 = buffer.create(0);
    local v1055 = 0;
    if v1053.category_id ~= nil then
        local v1056 = v1053.category_id:encode();
        local v1057, v1058 = v0.writeTag(v1054, v1055, 1, v0.wireTypes.lengthDelimited);
        v1057, v1058 = v0.writeBuffer(v1057, v1058, v1056, buffer.len(v1056));
        v1054 = v1057;
        v1055 = v1058;
    end;
    local v1059 = buffer.create(v1055);
    buffer.copy(v1059, 0, v1054, 0, v1055);
    return v1059;
end;
v7.decode = function(v1060) --[[ Line: 8658 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_44 (copy), v0 (copy), v5 (copy)
    local v1061 = l_v7_44.new();
    local v1062 = 0;
    while v1062 < buffer.len(v1060) do
        local v1063 = nil;
        local v1064 = nil;
        local v1065, v1066, v1067 = v0.readTag(v1060, v1062);
        v1063 = v1065;
        v1064 = v1066;
        v1062 = v1067;
        if v1064 == v0.wireTypes.varint then
            v1065 = nil;
            v1066, v1067 = v0.readVarInt(v1060, v1062);
            v1065 = v1066;
            v1062 = v1067;
        elseif v1064 == v0.wireTypes.lengthDelimited then
            if v1063 == 1 then
                v1065 = nil;
                v1066, v1067 = v0.readBuffer(v1060, v1062);
                v1065 = v1066;
                v1062 = v1067;
                v1061.category_id = v5.StringProp.decode(v1065);
            else
                v1065 = nil;
                v1066, v1067 = v0.readVarInt(v1060, v1062);
                v1062 = v1067 + v1066;
            end;
        elseif v1064 == v0.wireTypes.i32 then
            v1065 = nil;
            v1066, v1067 = v0.readFixed32(v1060, v1062);
            v1065 = v1066;
            v1062 = v1067;
        elseif v1064 == v0.wireTypes.i64 then
            v1065 = nil;
            v1066, v1067 = v0.readFixed64(v1060, v1062);
            v1065 = v1066;
            v1062 = v1067;
        else
            error("Unsupported wire type: " .. v1064);
        end;
    end;
    return v1061;
end;
v7.jsonEncode = function(v1068) --[[ Line: 8701 ]] --[[ Name: jsonEncode ]]
    local v1069 = {};
    if v1068.category_id ~= nil then
        v1069.categoryId = v1068.category_id:jsonEncode();
    end;
    return v1069;
end;
v7.jsonDecode = function(v1070) --[[ Line: 8711 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_44 (copy), v5 (copy)
    local v1071 = l_v7_44.new();
    if v1070.category_id ~= nil then
        v1071.category_id = v5.StringProp.jsonDecode(v1070.category_id);
    end;
    if v1070.categoryId ~= nil then
        v1071.category_id = v5.StringProp.jsonDecode(v1070.categoryId);
    end;
    return v1071;
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
v7.new = function(v1073) --[[ Line: 8742 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_45 (copy)
    return (setmetatable({
        action_type = if not (v1073 ~= nil) or v1073.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1073.action_type, 
        action_params = if not (v1073 ~= nil) or v1073.action_params == nil then nil else v1073.action_params
    }, l_v7_45));
end;
v7.encode = function(v1074) --[[ Line: 8753 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1075 = buffer.create(0);
    local v1076 = 0;
    if v1074.action_type ~= nil and (v1074.action_type ~= nil and v1074.action_type ~= 0 or v1074.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1077, v1078 = v0.writeTag(v1075, v1076, 1, v0.wireTypes.varint);
        v1077, v1078 = v0.writeVarInt(v1077, v1078, v2.ActionType.toNumber(v1074.action_type));
        v1075 = v1077;
        v1076 = v1078;
    end;
    if v1074.action_params ~= nil then
        local v1079 = v1074.action_params:encode();
        local v1080, v1081 = v0.writeTag(v1075, v1076, 2, v0.wireTypes.lengthDelimited);
        v1080, v1081 = v0.writeBuffer(v1080, v1081, v1079, buffer.len(v1079));
        v1075 = v1080;
        v1076 = v1081;
    end;
    local v1082 = buffer.create(v1076);
    buffer.copy(v1082, 0, v1075, 0, v1076);
    return v1082;
end;
v7.decode = function(v1083) --[[ Line: 8779 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_45 (copy), v0 (copy), v2 (copy)
    local v1084 = l_v7_45.new();
    local v1085 = 0;
    while v1085 < buffer.len(v1083) do
        local v1086 = nil;
        local v1087 = nil;
        local v1088, v1089, v1090 = v0.readTag(v1083, v1085);
        v1086 = v1088;
        v1087 = v1089;
        v1085 = v1090;
        if v1087 == v0.wireTypes.varint then
            if v1086 == 1 then
                v1088 = nil;
                v1089, v1090 = v0.readVarIntI32(v1083, v1085);
                v1088 = v1089;
                v1085 = v1090;
                v1084.action_type = v2.ActionType.fromNumber(v1088) or v1088;
            else
                v1088 = nil;
                v1089, v1090 = v0.readVarInt(v1083, v1085);
                v1088 = v1089;
                v1085 = v1090;
            end;
        elseif v1087 == v0.wireTypes.lengthDelimited then
            if v1086 == 2 then
                v1088 = nil;
                v1089, v1090 = v0.readBuffer(v1083, v1085);
                v1088 = v1089;
                v1085 = v1090;
                v1084.action_params = v2.SelectMarketplaceCatalogSubcategory_Params.decode(v1088);
            else
                v1088 = nil;
                v1089, v1090 = v0.readVarInt(v1083, v1085);
                v1085 = v1090 + v1089;
            end;
        elseif v1087 == v0.wireTypes.i32 then
            v1088 = nil;
            v1089, v1090 = v0.readFixed32(v1083, v1085);
            v1088 = v1089;
            v1085 = v1090;
        elseif v1087 == v0.wireTypes.i64 then
            v1088 = nil;
            v1089, v1090 = v0.readFixed64(v1083, v1085);
            v1088 = v1089;
            v1085 = v1090;
        else
            error("Unsupported wire type: " .. v1087);
        end;
    end;
    return v1084;
end;
v7.jsonEncode = function(v1091) --[[ Line: 8827 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1092 = {};
    if v1091.action_type ~= nil and (v1091.action_type ~= nil and v1091.action_type ~= 0 or v1091.action_type ~= v2.ActionType.fromNumber(0)) then
        v1092.actionType = if typeof(v1091.action_type) == "number" then v1091.action_type else v2.ActionType.toNumber(v1091.action_type);
    end;
    if v1091.action_params ~= nil then
        v1092.actionParams = v1091.action_params:jsonEncode();
    end;
    return v1092;
end;
v7.jsonDecode = function(v1093) --[[ Line: 8849 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_45 (copy), v2 (copy)
    local v1094 = l_v7_45.new();
    if v1093.action_type ~= nil then
        v1094.action_type = if typeof(v1093.action_type) == "number" then v2.ActionType.fromNumber(v1093.action_type) or v1093.action_type else v2.ActionType.fromName(v1093.action_type) or v1093.action_type;
    end;
    if v1093.actionType ~= nil then
        v1094.action_type = if typeof(v1093.actionType) == "number" then v2.ActionType.fromNumber(v1093.actionType) or v1093.actionType else v2.ActionType.fromName(v1093.actionType) or v1093.actionType;
    end;
    if v1093.action_params ~= nil then
        v1094.action_params = v2.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(v1093.action_params);
    end;
    if v1093.actionParams ~= nil then
        v1094.action_params = v2.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(v1093.actionParams);
    end;
    return v1094;
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
v7.new = function(v1096) --[[ Line: 8891 ]] --[[ Name: new ]]
    -- upvalues: l_v7_46 (copy)
    return (setmetatable({
        subcategory_id = if not (v1096 ~= nil) or v1096.subcategory_id == nil then nil else v1096.subcategory_id
    }, l_v7_46));
end;
v7.encode = function(v1097) --[[ Line: 8899 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1098 = buffer.create(0);
    local v1099 = 0;
    if v1097.subcategory_id ~= nil then
        local v1100 = v1097.subcategory_id:encode();
        local v1101, v1102 = v0.writeTag(v1098, v1099, 1, v0.wireTypes.lengthDelimited);
        v1101, v1102 = v0.writeBuffer(v1101, v1102, v1100, buffer.len(v1100));
        v1098 = v1101;
        v1099 = v1102;
    end;
    local v1103 = buffer.create(v1099);
    buffer.copy(v1103, 0, v1098, 0, v1099);
    return v1103;
end;
v7.decode = function(v1104) --[[ Line: 8916 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_46 (copy), v0 (copy), v5 (copy)
    local v1105 = l_v7_46.new();
    local v1106 = 0;
    while v1106 < buffer.len(v1104) do
        local v1107 = nil;
        local v1108 = nil;
        local v1109, v1110, v1111 = v0.readTag(v1104, v1106);
        v1107 = v1109;
        v1108 = v1110;
        v1106 = v1111;
        if v1108 == v0.wireTypes.varint then
            v1109 = nil;
            v1110, v1111 = v0.readVarInt(v1104, v1106);
            v1109 = v1110;
            v1106 = v1111;
        elseif v1108 == v0.wireTypes.lengthDelimited then
            if v1107 == 1 then
                v1109 = nil;
                v1110, v1111 = v0.readBuffer(v1104, v1106);
                v1109 = v1110;
                v1106 = v1111;
                v1105.subcategory_id = v5.StringProp.decode(v1109);
            else
                v1109 = nil;
                v1110, v1111 = v0.readVarInt(v1104, v1106);
                v1106 = v1111 + v1110;
            end;
        elseif v1108 == v0.wireTypes.i32 then
            v1109 = nil;
            v1110, v1111 = v0.readFixed32(v1104, v1106);
            v1109 = v1110;
            v1106 = v1111;
        elseif v1108 == v0.wireTypes.i64 then
            v1109 = nil;
            v1110, v1111 = v0.readFixed64(v1104, v1106);
            v1109 = v1110;
            v1106 = v1111;
        else
            error("Unsupported wire type: " .. v1108);
        end;
    end;
    return v1105;
end;
v7.jsonEncode = function(v1112) --[[ Line: 8961 ]] --[[ Name: jsonEncode ]]
    local v1113 = {};
    if v1112.subcategory_id ~= nil then
        v1113.subcategoryId = v1112.subcategory_id:jsonEncode();
    end;
    return v1113;
end;
v7.jsonDecode = function(v1114) --[[ Line: 8973 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_46 (copy), v5 (copy)
    local v1115 = l_v7_46.new();
    if v1114.subcategory_id ~= nil then
        v1115.subcategory_id = v5.StringProp.jsonDecode(v1114.subcategory_id);
    end;
    if v1114.subcategoryId ~= nil then
        v1115.subcategory_id = v5.StringProp.jsonDecode(v1114.subcategoryId);
    end;
    return v1115;
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
v7.new = function(v1117) --[[ Line: 9005 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_47 (copy)
    return (setmetatable({
        action_type = if not (v1117 ~= nil) or v1117.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1117.action_type, 
        action_params = if not (v1117 ~= nil) or v1117.action_params == nil then nil else v1117.action_params
    }, l_v7_47));
end;
v7.encode = function(v1118) --[[ Line: 9016 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1119 = buffer.create(0);
    local v1120 = 0;
    if v1118.action_type ~= nil and (v1118.action_type ~= nil and v1118.action_type ~= 0 or v1118.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1121, v1122 = v0.writeTag(v1119, v1120, 1, v0.wireTypes.varint);
        v1121, v1122 = v0.writeVarInt(v1121, v1122, v2.ActionType.toNumber(v1118.action_type));
        v1119 = v1121;
        v1120 = v1122;
    end;
    if v1118.action_params ~= nil then
        local v1123 = v1118.action_params:encode();
        local v1124, v1125 = v0.writeTag(v1119, v1120, 2, v0.wireTypes.lengthDelimited);
        v1124, v1125 = v0.writeBuffer(v1124, v1125, v1123, buffer.len(v1123));
        v1119 = v1124;
        v1120 = v1125;
    end;
    local v1126 = buffer.create(v1120);
    buffer.copy(v1126, 0, v1119, 0, v1120);
    return v1126;
end;
v7.decode = function(v1127) --[[ Line: 9042 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_47 (copy), v0 (copy), v2 (copy)
    local v1128 = l_v7_47.new();
    local v1129 = 0;
    while v1129 < buffer.len(v1127) do
        local v1130 = nil;
        local v1131 = nil;
        local v1132, v1133, v1134 = v0.readTag(v1127, v1129);
        v1130 = v1132;
        v1131 = v1133;
        v1129 = v1134;
        if v1131 == v0.wireTypes.varint then
            if v1130 == 1 then
                v1132 = nil;
                v1133, v1134 = v0.readVarIntI32(v1127, v1129);
                v1132 = v1133;
                v1129 = v1134;
                v1128.action_type = v2.ActionType.fromNumber(v1132) or v1132;
            else
                v1132 = nil;
                v1133, v1134 = v0.readVarInt(v1127, v1129);
                v1132 = v1133;
                v1129 = v1134;
            end;
        elseif v1131 == v0.wireTypes.lengthDelimited then
            if v1130 == 2 then
                v1132 = nil;
                v1133, v1134 = v0.readBuffer(v1127, v1129);
                v1132 = v1133;
                v1129 = v1134;
                v1128.action_params = v2.OpenMarketplaceCatalogSeeAll_Params.decode(v1132);
            else
                v1132 = nil;
                v1133, v1134 = v0.readVarInt(v1127, v1129);
                v1129 = v1134 + v1133;
            end;
        elseif v1131 == v0.wireTypes.i32 then
            v1132 = nil;
            v1133, v1134 = v0.readFixed32(v1127, v1129);
            v1132 = v1133;
            v1129 = v1134;
        elseif v1131 == v0.wireTypes.i64 then
            v1132 = nil;
            v1133, v1134 = v0.readFixed64(v1127, v1129);
            v1132 = v1133;
            v1129 = v1134;
        else
            error("Unsupported wire type: " .. v1131);
        end;
    end;
    return v1128;
end;
v7.jsonEncode = function(v1135) --[[ Line: 9090 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1136 = {};
    if v1135.action_type ~= nil and (v1135.action_type ~= nil and v1135.action_type ~= 0 or v1135.action_type ~= v2.ActionType.fromNumber(0)) then
        v1136.actionType = if typeof(v1135.action_type) == "number" then v1135.action_type else v2.ActionType.toNumber(v1135.action_type);
    end;
    if v1135.action_params ~= nil then
        v1136.actionParams = v1135.action_params:jsonEncode();
    end;
    return v1136;
end;
v7.jsonDecode = function(v1137) --[[ Line: 9112 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_47 (copy), v2 (copy)
    local v1138 = l_v7_47.new();
    if v1137.action_type ~= nil then
        v1138.action_type = if typeof(v1137.action_type) == "number" then v2.ActionType.fromNumber(v1137.action_type) or v1137.action_type else v2.ActionType.fromName(v1137.action_type) or v1137.action_type;
    end;
    if v1137.actionType ~= nil then
        v1138.action_type = if typeof(v1137.actionType) == "number" then v2.ActionType.fromNumber(v1137.actionType) or v1137.actionType else v2.ActionType.fromName(v1137.actionType) or v1137.actionType;
    end;
    if v1137.action_params ~= nil then
        v1138.action_params = v2.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(v1137.action_params);
    end;
    if v1137.actionParams ~= nil then
        v1138.action_params = v2.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(v1137.actionParams);
    end;
    return v1138;
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
v7.new = function(v1140) --[[ Line: 9152 ]] --[[ Name: new ]]
    -- upvalues: l_v7_48 (copy)
    return (setmetatable({
        sort_id = if not (v1140 ~= nil) or v1140.sort_id == nil then nil else v1140.sort_id, 
        title = if not (v1140 ~= nil) or v1140.title == nil then nil else v1140.title, 
        description = if not (v1140 ~= nil) or v1140.description == nil then nil else v1140.description, 
        tooltip_text = if not (v1140 ~= nil) or v1140.tooltip_text == nil then nil else v1140.tooltip_text
    }, l_v7_48));
end;
v7.encode = function(v1141) --[[ Line: 9163 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1142 = buffer.create(0);
    local v1143 = 0;
    if v1141.sort_id ~= nil then
        local v1144 = v1141.sort_id:encode();
        local v1145, v1146 = v0.writeTag(v1142, v1143, 1, v0.wireTypes.lengthDelimited);
        v1145, v1146 = v0.writeBuffer(v1145, v1146, v1144, buffer.len(v1144));
        v1142 = v1145;
        v1143 = v1146;
    end;
    if v1141.title ~= nil then
        local v1147 = v1141.title:encode();
        local v1148, v1149 = v0.writeTag(v1142, v1143, 2, v0.wireTypes.lengthDelimited);
        v1148, v1149 = v0.writeBuffer(v1148, v1149, v1147, buffer.len(v1147));
        v1142 = v1148;
        v1143 = v1149;
    end;
    if v1141.description ~= nil then
        local v1150 = v1141.description:encode();
        local v1151, v1152 = v0.writeTag(v1142, v1143, 3, v0.wireTypes.lengthDelimited);
        v1151, v1152 = v0.writeBuffer(v1151, v1152, v1150, buffer.len(v1150));
        v1142 = v1151;
        v1143 = v1152;
    end;
    if v1141.tooltip_text ~= nil then
        local v1153 = v1141.tooltip_text:encode();
        local v1154, v1155 = v0.writeTag(v1142, v1143, 4, v0.wireTypes.lengthDelimited);
        v1154, v1155 = v0.writeBuffer(v1154, v1155, v1153, buffer.len(v1153));
        v1142 = v1154;
        v1143 = v1155;
    end;
    local v1156 = buffer.create(v1143);
    buffer.copy(v1156, 0, v1142, 0, v1143);
    return v1156;
end;
v7.decode = function(v1157) --[[ Line: 9196 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_48 (copy), v0 (copy), v5 (copy)
    local v1158 = l_v7_48.new();
    local v1159 = 0;
    while v1159 < buffer.len(v1157) do
        local v1160 = nil;
        local v1161 = nil;
        local v1162, v1163, v1164 = v0.readTag(v1157, v1159);
        v1160 = v1162;
        v1161 = v1163;
        v1159 = v1164;
        if v1161 == v0.wireTypes.varint then
            v1162 = nil;
            v1163, v1164 = v0.readVarInt(v1157, v1159);
            v1162 = v1163;
            v1159 = v1164;
        elseif v1161 == v0.wireTypes.lengthDelimited then
            if v1160 == 1 then
                v1162 = nil;
                v1163, v1164 = v0.readBuffer(v1157, v1159);
                v1162 = v1163;
                v1159 = v1164;
                v1158.sort_id = v5.StringProp.decode(v1162);
            elseif v1160 == 2 then
                v1162 = nil;
                v1163, v1164 = v0.readBuffer(v1157, v1159);
                v1162 = v1163;
                v1159 = v1164;
                v1158.title = v5.StringProp.decode(v1162);
            elseif v1160 == 3 then
                v1162 = nil;
                v1163, v1164 = v0.readBuffer(v1157, v1159);
                v1162 = v1163;
                v1159 = v1164;
                v1158.description = v5.StringProp.decode(v1162);
            elseif v1160 == 4 then
                v1162 = nil;
                v1163, v1164 = v0.readBuffer(v1157, v1159);
                v1162 = v1163;
                v1159 = v1164;
                v1158.tooltip_text = v5.StringProp.decode(v1162);
            else
                v1162 = nil;
                v1163, v1164 = v0.readVarInt(v1157, v1159);
                v1159 = v1164 + v1163;
            end;
        elseif v1161 == v0.wireTypes.i32 then
            v1162 = nil;
            v1163, v1164 = v0.readFixed32(v1157, v1159);
            v1162 = v1163;
            v1159 = v1164;
        elseif v1161 == v0.wireTypes.i64 then
            v1162 = nil;
            v1163, v1164 = v0.readFixed64(v1157, v1159);
            v1162 = v1163;
            v1159 = v1164;
        else
            error("Unsupported wire type: " .. v1161);
        end;
    end;
    return v1158;
end;
v7.jsonEncode = function(v1165) --[[ Line: 9254 ]] --[[ Name: jsonEncode ]]
    local v1166 = {};
    if v1165.sort_id ~= nil then
        v1166.sortId = v1165.sort_id:jsonEncode();
    end;
    if v1165.title ~= nil then
        v1166.title = v1165.title:jsonEncode();
    end;
    if v1165.description ~= nil then
        v1166.description = v1165.description:jsonEncode();
    end;
    if v1165.tooltip_text ~= nil then
        v1166.tooltipText = v1165.tooltip_text:jsonEncode();
    end;
    return v1166;
end;
v7.jsonDecode = function(v1167) --[[ Line: 9276 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_48 (copy), v5 (copy)
    local v1168 = l_v7_48.new();
    if v1167.sort_id ~= nil then
        v1168.sort_id = v5.StringProp.jsonDecode(v1167.sort_id);
    end;
    if v1167.sortId ~= nil then
        v1168.sort_id = v5.StringProp.jsonDecode(v1167.sortId);
    end;
    if v1167.title ~= nil then
        v1168.title = v5.StringProp.jsonDecode(v1167.title);
    end;
    if v1167.description ~= nil then
        v1168.description = v5.StringProp.jsonDecode(v1167.description);
    end;
    if v1167.tooltip_text ~= nil then
        v1168.tooltip_text = v5.StringProp.jsonDecode(v1167.tooltip_text);
    end;
    if v1167.tooltipText ~= nil then
        v1168.tooltip_text = v5.StringProp.jsonDecode(v1167.tooltipText);
    end;
    return v1168;
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
v7.new = function(v1170) --[[ Line: 9325 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_49 (copy)
    return (setmetatable({
        action_type = if not (v1170 ~= nil) or v1170.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1170.action_type, 
        action_params = if not (v1170 ~= nil) or v1170.action_params == nil then nil else v1170.action_params
    }, l_v7_49));
end;
v7.encode = function(v1171) --[[ Line: 9336 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1172 = buffer.create(0);
    local v1173 = 0;
    if v1171.action_type ~= nil and (v1171.action_type ~= nil and v1171.action_type ~= 0 or v1171.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1174, v1175 = v0.writeTag(v1172, v1173, 1, v0.wireTypes.varint);
        v1174, v1175 = v0.writeVarInt(v1174, v1175, v2.ActionType.toNumber(v1171.action_type));
        v1172 = v1174;
        v1173 = v1175;
    end;
    if v1171.action_params ~= nil then
        local v1176 = v1171.action_params:encode();
        local v1177, v1178 = v0.writeTag(v1172, v1173, 2, v0.wireTypes.lengthDelimited);
        v1177, v1178 = v0.writeBuffer(v1177, v1178, v1176, buffer.len(v1176));
        v1172 = v1177;
        v1173 = v1178;
    end;
    local v1179 = buffer.create(v1173);
    buffer.copy(v1179, 0, v1172, 0, v1173);
    return v1179;
end;
v7.decode = function(v1180) --[[ Line: 9362 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_49 (copy), v0 (copy), v2 (copy)
    local v1181 = l_v7_49.new();
    local v1182 = 0;
    while v1182 < buffer.len(v1180) do
        local v1183 = nil;
        local v1184 = nil;
        local v1185, v1186, v1187 = v0.readTag(v1180, v1182);
        v1183 = v1185;
        v1184 = v1186;
        v1182 = v1187;
        if v1184 == v0.wireTypes.varint then
            if v1183 == 1 then
                v1185 = nil;
                v1186, v1187 = v0.readVarIntI32(v1180, v1182);
                v1185 = v1186;
                v1182 = v1187;
                v1181.action_type = v2.ActionType.fromNumber(v1185) or v1185;
            else
                v1185 = nil;
                v1186, v1187 = v0.readVarInt(v1180, v1182);
                v1185 = v1186;
                v1182 = v1187;
            end;
        elseif v1184 == v0.wireTypes.lengthDelimited then
            if v1183 == 2 then
                v1185 = nil;
                v1186, v1187 = v0.readBuffer(v1180, v1182);
                v1185 = v1186;
                v1182 = v1187;
                v1181.action_params = v2.CloseMarketplaceCategoryTooltip_Params.decode(v1185);
            else
                v1185 = nil;
                v1186, v1187 = v0.readVarInt(v1180, v1182);
                v1182 = v1187 + v1186;
            end;
        elseif v1184 == v0.wireTypes.i32 then
            v1185 = nil;
            v1186, v1187 = v0.readFixed32(v1180, v1182);
            v1185 = v1186;
            v1182 = v1187;
        elseif v1184 == v0.wireTypes.i64 then
            v1185 = nil;
            v1186, v1187 = v0.readFixed64(v1180, v1182);
            v1185 = v1186;
            v1182 = v1187;
        else
            error("Unsupported wire type: " .. v1184);
        end;
    end;
    return v1181;
end;
v7.jsonEncode = function(v1188) --[[ Line: 9410 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1189 = {};
    if v1188.action_type ~= nil and (v1188.action_type ~= nil and v1188.action_type ~= 0 or v1188.action_type ~= v2.ActionType.fromNumber(0)) then
        v1189.actionType = if typeof(v1188.action_type) == "number" then v1188.action_type else v2.ActionType.toNumber(v1188.action_type);
    end;
    if v1188.action_params ~= nil then
        v1189.actionParams = v1188.action_params:jsonEncode();
    end;
    return v1189;
end;
v7.jsonDecode = function(v1190) --[[ Line: 9432 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_49 (copy), v2 (copy)
    local v1191 = l_v7_49.new();
    if v1190.action_type ~= nil then
        v1191.action_type = if typeof(v1190.action_type) == "number" then v2.ActionType.fromNumber(v1190.action_type) or v1190.action_type else v2.ActionType.fromName(v1190.action_type) or v1190.action_type;
    end;
    if v1190.actionType ~= nil then
        v1191.action_type = if typeof(v1190.actionType) == "number" then v2.ActionType.fromNumber(v1190.actionType) or v1190.actionType else v2.ActionType.fromName(v1190.actionType) or v1190.actionType;
    end;
    if v1190.action_params ~= nil then
        v1191.action_params = v2.CloseMarketplaceCategoryTooltip_Params.jsonDecode(v1190.action_params);
    end;
    if v1190.actionParams ~= nil then
        v1191.action_params = v2.CloseMarketplaceCategoryTooltip_Params.jsonDecode(v1190.actionParams);
    end;
    return v1191;
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
v7.new = function(v1193) --[[ Line: 9472 ]] --[[ Name: new ]]
    -- upvalues: l_v7_50 (copy)
    return (setmetatable({
        tooltip_id = if not (v1193 ~= nil) or v1193.tooltip_id == nil then nil else v1193.tooltip_id
    }, l_v7_50));
end;
v7.encode = function(v1194) --[[ Line: 9480 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1195 = buffer.create(0);
    local v1196 = 0;
    if v1194.tooltip_id ~= nil then
        local v1197 = v1194.tooltip_id:encode();
        local v1198, v1199 = v0.writeTag(v1195, v1196, 1, v0.wireTypes.lengthDelimited);
        v1198, v1199 = v0.writeBuffer(v1198, v1199, v1197, buffer.len(v1197));
        v1195 = v1198;
        v1196 = v1199;
    end;
    local v1200 = buffer.create(v1196);
    buffer.copy(v1200, 0, v1195, 0, v1196);
    return v1200;
end;
v7.decode = function(v1201) --[[ Line: 9495 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_50 (copy), v0 (copy), v5 (copy)
    local v1202 = l_v7_50.new();
    local v1203 = 0;
    while v1203 < buffer.len(v1201) do
        local v1204 = nil;
        local v1205 = nil;
        local v1206, v1207, v1208 = v0.readTag(v1201, v1203);
        v1204 = v1206;
        v1205 = v1207;
        v1203 = v1208;
        if v1205 == v0.wireTypes.varint then
            v1206 = nil;
            v1207, v1208 = v0.readVarInt(v1201, v1203);
            v1206 = v1207;
            v1203 = v1208;
        elseif v1205 == v0.wireTypes.lengthDelimited then
            if v1204 == 1 then
                v1206 = nil;
                v1207, v1208 = v0.readBuffer(v1201, v1203);
                v1206 = v1207;
                v1203 = v1208;
                v1202.tooltip_id = v5.StringProp.decode(v1206);
            else
                v1206 = nil;
                v1207, v1208 = v0.readVarInt(v1201, v1203);
                v1203 = v1208 + v1207;
            end;
        elseif v1205 == v0.wireTypes.i32 then
            v1206 = nil;
            v1207, v1208 = v0.readFixed32(v1201, v1203);
            v1206 = v1207;
            v1203 = v1208;
        elseif v1205 == v0.wireTypes.i64 then
            v1206 = nil;
            v1207, v1208 = v0.readFixed64(v1201, v1203);
            v1206 = v1207;
            v1203 = v1208;
        else
            error("Unsupported wire type: " .. v1205);
        end;
    end;
    return v1202;
end;
v7.jsonEncode = function(v1209) --[[ Line: 9538 ]] --[[ Name: jsonEncode ]]
    local v1210 = {};
    if v1209.tooltip_id ~= nil then
        v1210.tooltipId = v1209.tooltip_id:jsonEncode();
    end;
    return v1210;
end;
v7.jsonDecode = function(v1211) --[[ Line: 9548 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_50 (copy), v5 (copy)
    local v1212 = l_v7_50.new();
    if v1211.tooltip_id ~= nil then
        v1212.tooltip_id = v5.StringProp.jsonDecode(v1211.tooltip_id);
    end;
    if v1211.tooltipId ~= nil then
        v1212.tooltip_id = v5.StringProp.jsonDecode(v1211.tooltipId);
    end;
    return v1212;
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
v7.new = function(v1214) --[[ Line: 9578 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_51 (copy)
    return (setmetatable({
        action_type = if not (v1214 ~= nil) or v1214.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1214.action_type, 
        action_params = if not (v1214 ~= nil) or v1214.action_params == nil then nil else v1214.action_params
    }, l_v7_51));
end;
v7.encode = function(v1215) --[[ Line: 9587 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1216 = buffer.create(0);
    local v1217 = 0;
    if v1215.action_type ~= nil and (v1215.action_type ~= nil and v1215.action_type ~= 0 or v1215.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1218, v1219 = v0.writeTag(v1216, v1217, 1, v0.wireTypes.varint);
        v1218, v1219 = v0.writeVarInt(v1218, v1219, v2.ActionType.toNumber(v1215.action_type));
        v1216 = v1218;
        v1217 = v1219;
    end;
    if v1215.action_params ~= nil then
        local v1220 = v1215.action_params:encode();
        local v1221, v1222 = v0.writeTag(v1216, v1217, 2, v0.wireTypes.lengthDelimited);
        v1221, v1222 = v0.writeBuffer(v1221, v1222, v1220, buffer.len(v1220));
        v1216 = v1221;
        v1217 = v1222;
    end;
    local v1223 = buffer.create(v1217);
    buffer.copy(v1223, 0, v1216, 0, v1217);
    return v1223;
end;
v7.decode = function(v1224) --[[ Line: 9613 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_51 (copy), v0 (copy), v2 (copy)
    local v1225 = l_v7_51.new();
    local v1226 = 0;
    while v1226 < buffer.len(v1224) do
        local v1227 = nil;
        local v1228 = nil;
        local v1229, v1230, v1231 = v0.readTag(v1224, v1226);
        v1227 = v1229;
        v1228 = v1230;
        v1226 = v1231;
        if v1228 == v0.wireTypes.varint then
            if v1227 == 1 then
                v1229 = nil;
                v1230, v1231 = v0.readVarIntI32(v1224, v1226);
                v1229 = v1230;
                v1226 = v1231;
                v1225.action_type = v2.ActionType.fromNumber(v1229) or v1229;
            else
                v1229 = nil;
                v1230, v1231 = v0.readVarInt(v1224, v1226);
                v1229 = v1230;
                v1226 = v1231;
            end;
        elseif v1228 == v0.wireTypes.lengthDelimited then
            if v1227 == 2 then
                v1229 = nil;
                v1230, v1231 = v0.readBuffer(v1224, v1226);
                v1229 = v1230;
                v1226 = v1231;
                v1225.action_params = v2.ResizeMarketplaceCatalog_Params.decode(v1229);
            else
                v1229 = nil;
                v1230, v1231 = v0.readVarInt(v1224, v1226);
                v1226 = v1231 + v1230;
            end;
        elseif v1228 == v0.wireTypes.i32 then
            v1229 = nil;
            v1230, v1231 = v0.readFixed32(v1224, v1226);
            v1229 = v1230;
            v1226 = v1231;
        elseif v1228 == v0.wireTypes.i64 then
            v1229 = nil;
            v1230, v1231 = v0.readFixed64(v1224, v1226);
            v1229 = v1230;
            v1226 = v1231;
        else
            error("Unsupported wire type: " .. v1228);
        end;
    end;
    return v1225;
end;
v7.jsonEncode = function(v1232) --[[ Line: 9661 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1233 = {};
    if v1232.action_type ~= nil and (v1232.action_type ~= nil and v1232.action_type ~= 0 or v1232.action_type ~= v2.ActionType.fromNumber(0)) then
        v1233.actionType = if typeof(v1232.action_type) == "number" then v1232.action_type else v2.ActionType.toNumber(v1232.action_type);
    end;
    if v1232.action_params ~= nil then
        v1233.actionParams = v1232.action_params:jsonEncode();
    end;
    return v1233;
end;
v7.jsonDecode = function(v1234) --[[ Line: 9683 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_51 (copy), v2 (copy)
    local v1235 = l_v7_51.new();
    if v1234.action_type ~= nil then
        v1235.action_type = if typeof(v1234.action_type) == "number" then v2.ActionType.fromNumber(v1234.action_type) or v1234.action_type else v2.ActionType.fromName(v1234.action_type) or v1234.action_type;
    end;
    if v1234.actionType ~= nil then
        v1235.action_type = if typeof(v1234.actionType) == "number" then v2.ActionType.fromNumber(v1234.actionType) or v1234.actionType else v2.ActionType.fromName(v1234.actionType) or v1234.actionType;
    end;
    if v1234.action_params ~= nil then
        v1235.action_params = v2.ResizeMarketplaceCatalog_Params.jsonDecode(v1234.action_params);
    end;
    if v1234.actionParams ~= nil then
        v1235.action_params = v2.ResizeMarketplaceCatalog_Params.jsonDecode(v1234.actionParams);
    end;
    return v1235;
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
v7.new = function(v1237) --[[ Line: 9723 ]] --[[ Name: new ]]
    -- upvalues: l_v7_52 (copy)
    return (setmetatable({
        category_id = if not (v1237 ~= nil) or v1237.category_id == nil then nil else v1237.category_id, 
        subcategory_id = if not (v1237 ~= nil) or v1237.subcategory_id == nil then nil else v1237.subcategory_id, 
        screen_size = if not (v1237 ~= nil) or v1237.screen_size == nil then nil else v1237.screen_size
    }, l_v7_52));
end;
v7.encode = function(v1238) --[[ Line: 9733 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1239 = buffer.create(0);
    local v1240 = 0;
    if v1238.category_id ~= nil then
        local v1241 = v1238.category_id:encode();
        local v1242, v1243 = v0.writeTag(v1239, v1240, 1, v0.wireTypes.lengthDelimited);
        v1242, v1243 = v0.writeBuffer(v1242, v1243, v1241, buffer.len(v1241));
        v1239 = v1242;
        v1240 = v1243;
    end;
    if v1238.subcategory_id ~= nil then
        local v1244 = v1238.subcategory_id:encode();
        local v1245, v1246 = v0.writeTag(v1239, v1240, 2, v0.wireTypes.lengthDelimited);
        v1245, v1246 = v0.writeBuffer(v1245, v1246, v1244, buffer.len(v1244));
        v1239 = v1245;
        v1240 = v1246;
    end;
    if v1238.screen_size ~= nil then
        local v1247 = v1238.screen_size:encode();
        local v1248, v1249 = v0.writeTag(v1239, v1240, 3, v0.wireTypes.lengthDelimited);
        v1248, v1249 = v0.writeBuffer(v1248, v1249, v1247, buffer.len(v1247));
        v1239 = v1248;
        v1240 = v1249;
    end;
    local v1250 = buffer.create(v1240);
    buffer.copy(v1250, 0, v1239, 0, v1240);
    return v1250;
end;
v7.decode = function(v1251) --[[ Line: 9760 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_52 (copy), v0 (copy), v5 (copy)
    local v1252 = l_v7_52.new();
    local v1253 = 0;
    while v1253 < buffer.len(v1251) do
        local v1254 = nil;
        local v1255 = nil;
        local v1256, v1257, v1258 = v0.readTag(v1251, v1253);
        v1254 = v1256;
        v1255 = v1257;
        v1253 = v1258;
        if v1255 == v0.wireTypes.varint then
            v1256 = nil;
            v1257, v1258 = v0.readVarInt(v1251, v1253);
            v1256 = v1257;
            v1253 = v1258;
        elseif v1255 == v0.wireTypes.lengthDelimited then
            if v1254 == 1 then
                v1256 = nil;
                v1257, v1258 = v0.readBuffer(v1251, v1253);
                v1256 = v1257;
                v1253 = v1258;
                v1252.category_id = v5.StringProp.decode(v1256);
            elseif v1254 == 2 then
                v1256 = nil;
                v1257, v1258 = v0.readBuffer(v1251, v1253);
                v1256 = v1257;
                v1253 = v1258;
                v1252.subcategory_id = v5.StringProp.decode(v1256);
            elseif v1254 == 3 then
                v1256 = nil;
                v1257, v1258 = v0.readBuffer(v1251, v1253);
                v1256 = v1257;
                v1253 = v1258;
                v1252.screen_size = v5.StringProp.decode(v1256);
            else
                v1256 = nil;
                v1257, v1258 = v0.readVarInt(v1251, v1253);
                v1253 = v1258 + v1257;
            end;
        elseif v1255 == v0.wireTypes.i32 then
            v1256 = nil;
            v1257, v1258 = v0.readFixed32(v1251, v1253);
            v1256 = v1257;
            v1253 = v1258;
        elseif v1255 == v0.wireTypes.i64 then
            v1256 = nil;
            v1257, v1258 = v0.readFixed64(v1251, v1253);
            v1256 = v1257;
            v1253 = v1258;
        else
            error("Unsupported wire type: " .. v1255);
        end;
    end;
    return v1252;
end;
v7.jsonEncode = function(v1259) --[[ Line: 9813 ]] --[[ Name: jsonEncode ]]
    local v1260 = {};
    if v1259.category_id ~= nil then
        v1260.categoryId = v1259.category_id:jsonEncode();
    end;
    if v1259.subcategory_id ~= nil then
        v1260.subcategoryId = v1259.subcategory_id:jsonEncode();
    end;
    if v1259.screen_size ~= nil then
        v1260.screenSize = v1259.screen_size:jsonEncode();
    end;
    return v1260;
end;
v7.jsonDecode = function(v1261) --[[ Line: 9831 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_52 (copy), v5 (copy)
    local v1262 = l_v7_52.new();
    if v1261.category_id ~= nil then
        v1262.category_id = v5.StringProp.jsonDecode(v1261.category_id);
    end;
    if v1261.categoryId ~= nil then
        v1262.category_id = v5.StringProp.jsonDecode(v1261.categoryId);
    end;
    if v1261.subcategory_id ~= nil then
        v1262.subcategory_id = v5.StringProp.jsonDecode(v1261.subcategory_id);
    end;
    if v1261.subcategoryId ~= nil then
        v1262.subcategory_id = v5.StringProp.jsonDecode(v1261.subcategoryId);
    end;
    if v1261.screen_size ~= nil then
        v1262.screen_size = v5.StringProp.jsonDecode(v1261.screen_size);
    end;
    if v1261.screenSize ~= nil then
        v1262.screen_size = v5.StringProp.jsonDecode(v1261.screenSize);
    end;
    return v1262;
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
v7.new = function(v1264) --[[ Line: 9879 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_53 (copy)
    return (setmetatable({
        action_type = if not (v1264 ~= nil) or v1264.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1264.action_type, 
        action_params = if not (v1264 ~= nil) or v1264.action_params == nil then nil else v1264.action_params
    }, l_v7_53));
end;
v7.encode = function(v1265) --[[ Line: 9890 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1266 = buffer.create(0);
    local v1267 = 0;
    if v1265.action_type ~= nil and (v1265.action_type ~= nil and v1265.action_type ~= 0 or v1265.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1268, v1269 = v0.writeTag(v1266, v1267, 1, v0.wireTypes.varint);
        v1268, v1269 = v0.writeVarInt(v1268, v1269, v2.ActionType.toNumber(v1265.action_type));
        v1266 = v1268;
        v1267 = v1269;
    end;
    if v1265.action_params ~= nil then
        local v1270 = v1265.action_params:encode();
        local v1271, v1272 = v0.writeTag(v1266, v1267, 2, v0.wireTypes.lengthDelimited);
        v1271, v1272 = v0.writeBuffer(v1271, v1272, v1270, buffer.len(v1270));
        v1266 = v1271;
        v1267 = v1272;
    end;
    local v1273 = buffer.create(v1267);
    buffer.copy(v1273, 0, v1266, 0, v1267);
    return v1273;
end;
v7.decode = function(v1274) --[[ Line: 9916 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_53 (copy), v0 (copy), v2 (copy)
    local v1275 = l_v7_53.new();
    local v1276 = 0;
    while v1276 < buffer.len(v1274) do
        local v1277 = nil;
        local v1278 = nil;
        local v1279, v1280, v1281 = v0.readTag(v1274, v1276);
        v1277 = v1279;
        v1278 = v1280;
        v1276 = v1281;
        if v1278 == v0.wireTypes.varint then
            if v1277 == 1 then
                v1279 = nil;
                v1280, v1281 = v0.readVarIntI32(v1274, v1276);
                v1279 = v1280;
                v1276 = v1281;
                v1275.action_type = v2.ActionType.fromNumber(v1279) or v1279;
            else
                v1279 = nil;
                v1280, v1281 = v0.readVarInt(v1274, v1276);
                v1279 = v1280;
                v1276 = v1281;
            end;
        elseif v1278 == v0.wireTypes.lengthDelimited then
            if v1277 == 2 then
                v1279 = nil;
                v1280, v1281 = v0.readBuffer(v1274, v1276);
                v1279 = v1280;
                v1276 = v1281;
                v1275.action_params = v2.OpenChartsSortDetailAction_Params.decode(v1279);
            else
                v1279 = nil;
                v1280, v1281 = v0.readVarInt(v1274, v1276);
                v1276 = v1281 + v1280;
            end;
        elseif v1278 == v0.wireTypes.i32 then
            v1279 = nil;
            v1280, v1281 = v0.readFixed32(v1274, v1276);
            v1279 = v1280;
            v1276 = v1281;
        elseif v1278 == v0.wireTypes.i64 then
            v1279 = nil;
            v1280, v1281 = v0.readFixed64(v1274, v1276);
            v1279 = v1280;
            v1276 = v1281;
        else
            error("Unsupported wire type: " .. v1278);
        end;
    end;
    return v1275;
end;
v7.jsonEncode = function(v1282) --[[ Line: 9964 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1283 = {};
    if v1282.action_type ~= nil and (v1282.action_type ~= nil and v1282.action_type ~= 0 or v1282.action_type ~= v2.ActionType.fromNumber(0)) then
        v1283.actionType = if typeof(v1282.action_type) == "number" then v1282.action_type else v2.ActionType.toNumber(v1282.action_type);
    end;
    if v1282.action_params ~= nil then
        v1283.actionParams = v1282.action_params:jsonEncode();
    end;
    return v1283;
end;
v7.jsonDecode = function(v1284) --[[ Line: 9986 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_53 (copy), v2 (copy)
    local v1285 = l_v7_53.new();
    if v1284.action_type ~= nil then
        v1285.action_type = if typeof(v1284.action_type) == "number" then v2.ActionType.fromNumber(v1284.action_type) or v1284.action_type else v2.ActionType.fromName(v1284.action_type) or v1284.action_type;
    end;
    if v1284.actionType ~= nil then
        v1285.action_type = if typeof(v1284.actionType) == "number" then v2.ActionType.fromNumber(v1284.actionType) or v1284.actionType else v2.ActionType.fromName(v1284.actionType) or v1284.actionType;
    end;
    if v1284.action_params ~= nil then
        v1285.action_params = v2.OpenChartsSortDetailAction_Params.jsonDecode(v1284.action_params);
    end;
    if v1284.actionParams ~= nil then
        v1285.action_params = v2.OpenChartsSortDetailAction_Params.jsonDecode(v1284.actionParams);
    end;
    return v1285;
end;
v7.descriptor = {
    name = "OpenChartsSortDetailAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenChartsSortDetailAction"
};
v2.OpenChartsSortDetailAction = v7;
v1.default:register(v2.OpenChartsSortDetailAction);
v7 = {};
v7.__index = v7;
local l_v7_54 = v7 --[[ copy: 7 -> 62 ]];
v7.new = function(v1287) --[[ Line: 10026 ]] --[[ Name: new ]]
    -- upvalues: l_v7_54 (copy)
    return (setmetatable({
        sort_id = if not (v1287 ~= nil) or v1287.sort_id == nil then nil else v1287.sort_id, 
        secondary_sort_id = if not (v1287 ~= nil) or v1287.secondary_sort_id == nil then nil else v1287.secondary_sort_id
    }, l_v7_54));
end;
v7.encode = function(v1288) --[[ Line: 10035 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1289 = buffer.create(0);
    local v1290 = 0;
    if v1288.sort_id ~= nil then
        local v1291 = v1288.sort_id:encode();
        local v1292, v1293 = v0.writeTag(v1289, v1290, 1, v0.wireTypes.lengthDelimited);
        v1292, v1293 = v0.writeBuffer(v1292, v1293, v1291, buffer.len(v1291));
        v1289 = v1292;
        v1290 = v1293;
    end;
    if v1288.secondary_sort_id ~= nil then
        local v1294 = v1288.secondary_sort_id:encode();
        local v1295, v1296 = v0.writeTag(v1289, v1290, 2, v0.wireTypes.lengthDelimited);
        v1295, v1296 = v0.writeBuffer(v1295, v1296, v1294, buffer.len(v1294));
        v1289 = v1295;
        v1290 = v1296;
    end;
    local v1297 = buffer.create(v1290);
    buffer.copy(v1297, 0, v1289, 0, v1290);
    return v1297;
end;
v7.decode = function(v1298) --[[ Line: 10056 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_54 (copy), v0 (copy), v5 (copy)
    local v1299 = l_v7_54.new();
    local v1300 = 0;
    while v1300 < buffer.len(v1298) do
        local v1301 = nil;
        local v1302 = nil;
        local v1303, v1304, v1305 = v0.readTag(v1298, v1300);
        v1301 = v1303;
        v1302 = v1304;
        v1300 = v1305;
        if v1302 == v0.wireTypes.varint then
            v1303 = nil;
            v1304, v1305 = v0.readVarInt(v1298, v1300);
            v1303 = v1304;
            v1300 = v1305;
        elseif v1302 == v0.wireTypes.lengthDelimited then
            if v1301 == 1 then
                v1303 = nil;
                v1304, v1305 = v0.readBuffer(v1298, v1300);
                v1303 = v1304;
                v1300 = v1305;
                v1299.sort_id = v5.StringProp.decode(v1303);
            elseif v1301 == 2 then
                v1303 = nil;
                v1304, v1305 = v0.readBuffer(v1298, v1300);
                v1303 = v1304;
                v1300 = v1305;
                v1299.secondary_sort_id = v5.Int32Prop.decode(v1303);
            else
                v1303 = nil;
                v1304, v1305 = v0.readVarInt(v1298, v1300);
                v1300 = v1305 + v1304;
            end;
        elseif v1302 == v0.wireTypes.i32 then
            v1303 = nil;
            v1304, v1305 = v0.readFixed32(v1298, v1300);
            v1303 = v1304;
            v1300 = v1305;
        elseif v1302 == v0.wireTypes.i64 then
            v1303 = nil;
            v1304, v1305 = v0.readFixed64(v1298, v1300);
            v1303 = v1304;
            v1300 = v1305;
        else
            error("Unsupported wire type: " .. v1302);
        end;
    end;
    return v1299;
end;
v7.jsonEncode = function(v1306) --[[ Line: 10104 ]] --[[ Name: jsonEncode ]]
    local v1307 = {};
    if v1306.sort_id ~= nil then
        v1307.sortId = v1306.sort_id:jsonEncode();
    end;
    if v1306.secondary_sort_id ~= nil then
        v1307.secondarySortId = v1306.secondary_sort_id:jsonEncode();
    end;
    return v1307;
end;
v7.jsonDecode = function(v1308) --[[ Line: 10118 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_54 (copy), v5 (copy)
    local v1309 = l_v7_54.new();
    if v1308.sort_id ~= nil then
        v1309.sort_id = v5.StringProp.jsonDecode(v1308.sort_id);
    end;
    if v1308.sortId ~= nil then
        v1309.sort_id = v5.StringProp.jsonDecode(v1308.sortId);
    end;
    if v1308.secondary_sort_id ~= nil then
        v1309.secondary_sort_id = v5.Int32Prop.jsonDecode(v1308.secondary_sort_id);
    end;
    if v1308.secondarySortId ~= nil then
        v1309.secondary_sort_id = v5.Int32Prop.jsonDecode(v1308.secondarySortId);
    end;
    return v1309;
end;
v7.descriptor = {
    name = "OpenChartsSortDetailAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenChartsSortDetailAction_Params = v7;
v1.default:register(v2.OpenChartsSortDetailAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_55 = v7 --[[ copy: 7 -> 63 ]];
v7.new = function(v1311) --[[ Line: 10158 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_55 (copy)
    return (setmetatable({
        action_type = if not (v1311 ~= nil) or v1311.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1311.action_type, 
        action_params = if not (v1311 ~= nil) or v1311.action_params == nil then nil else v1311.action_params
    }, l_v7_55));
end;
v7.encode = function(v1312) --[[ Line: 10167 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1313 = buffer.create(0);
    local v1314 = 0;
    if v1312.action_type ~= nil and (v1312.action_type ~= nil and v1312.action_type ~= 0 or v1312.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1315, v1316 = v0.writeTag(v1313, v1314, 1, v0.wireTypes.varint);
        v1315, v1316 = v0.writeVarInt(v1315, v1316, v2.ActionType.toNumber(v1312.action_type));
        v1313 = v1315;
        v1314 = v1316;
    end;
    if v1312.action_params ~= nil then
        local v1317 = v1312.action_params:encode();
        local v1318, v1319 = v0.writeTag(v1313, v1314, 2, v0.wireTypes.lengthDelimited);
        v1318, v1319 = v0.writeBuffer(v1318, v1319, v1317, buffer.len(v1317));
        v1313 = v1318;
        v1314 = v1319;
    end;
    local v1320 = buffer.create(v1314);
    buffer.copy(v1320, 0, v1313, 0, v1314);
    return v1320;
end;
v7.decode = function(v1321) --[[ Line: 10193 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_55 (copy), v0 (copy), v2 (copy)
    local v1322 = l_v7_55.new();
    local v1323 = 0;
    while v1323 < buffer.len(v1321) do
        local v1324 = nil;
        local v1325 = nil;
        local v1326, v1327, v1328 = v0.readTag(v1321, v1323);
        v1324 = v1326;
        v1325 = v1327;
        v1323 = v1328;
        if v1325 == v0.wireTypes.varint then
            if v1324 == 1 then
                v1326 = nil;
                v1327, v1328 = v0.readVarIntI32(v1321, v1323);
                v1326 = v1327;
                v1323 = v1328;
                v1322.action_type = v2.ActionType.fromNumber(v1326) or v1326;
            else
                v1326 = nil;
                v1327, v1328 = v0.readVarInt(v1321, v1323);
                v1326 = v1327;
                v1323 = v1328;
            end;
        elseif v1325 == v0.wireTypes.lengthDelimited then
            if v1324 == 2 then
                v1326 = nil;
                v1327, v1328 = v0.readBuffer(v1321, v1323);
                v1326 = v1327;
                v1323 = v1328;
                v1322.action_params = v2.OpenSongDetailAction_Params.decode(v1326);
            else
                v1326 = nil;
                v1327, v1328 = v0.readVarInt(v1321, v1323);
                v1323 = v1328 + v1327;
            end;
        elseif v1325 == v0.wireTypes.i32 then
            v1326 = nil;
            v1327, v1328 = v0.readFixed32(v1321, v1323);
            v1326 = v1327;
            v1323 = v1328;
        elseif v1325 == v0.wireTypes.i64 then
            v1326 = nil;
            v1327, v1328 = v0.readFixed64(v1321, v1323);
            v1326 = v1327;
            v1323 = v1328;
        else
            error("Unsupported wire type: " .. v1325);
        end;
    end;
    return v1322;
end;
v7.jsonEncode = function(v1329) --[[ Line: 10241 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1330 = {};
    if v1329.action_type ~= nil and (v1329.action_type ~= nil and v1329.action_type ~= 0 or v1329.action_type ~= v2.ActionType.fromNumber(0)) then
        v1330.actionType = if typeof(v1329.action_type) == "number" then v1329.action_type else v2.ActionType.toNumber(v1329.action_type);
    end;
    if v1329.action_params ~= nil then
        v1330.actionParams = v1329.action_params:jsonEncode();
    end;
    return v1330;
end;
v7.jsonDecode = function(v1331) --[[ Line: 10263 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_55 (copy), v2 (copy)
    local v1332 = l_v7_55.new();
    if v1331.action_type ~= nil then
        v1332.action_type = if typeof(v1331.action_type) == "number" then v2.ActionType.fromNumber(v1331.action_type) or v1331.action_type else v2.ActionType.fromName(v1331.action_type) or v1331.action_type;
    end;
    if v1331.actionType ~= nil then
        v1332.action_type = if typeof(v1331.actionType) == "number" then v2.ActionType.fromNumber(v1331.actionType) or v1331.actionType else v2.ActionType.fromName(v1331.actionType) or v1331.actionType;
    end;
    if v1331.action_params ~= nil then
        v1332.action_params = v2.OpenSongDetailAction_Params.jsonDecode(v1331.action_params);
    end;
    if v1331.actionParams ~= nil then
        v1332.action_params = v2.OpenSongDetailAction_Params.jsonDecode(v1331.actionParams);
    end;
    return v1332;
end;
v7.descriptor = {
    name = "OpenSongDetailAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenSongDetailAction"
};
v2.OpenSongDetailAction = v7;
v1.default:register(v2.OpenSongDetailAction);
v7 = {};
v7.__index = v7;
local l_v7_56 = v7 --[[ copy: 7 -> 64 ]];
v7.new = function(v1334) --[[ Line: 10303 ]] --[[ Name: new ]]
    -- upvalues: l_v7_56 (copy)
    return (setmetatable({
        song_id = if not (v1334 ~= nil) or v1334.song_id == nil then nil else v1334.song_id
    }, l_v7_56));
end;
v7.encode = function(v1335) --[[ Line: 10311 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1336 = buffer.create(0);
    local v1337 = 0;
    if v1335.song_id ~= nil then
        local v1338 = v1335.song_id:encode();
        local v1339, v1340 = v0.writeTag(v1336, v1337, 1, v0.wireTypes.lengthDelimited);
        v1339, v1340 = v0.writeBuffer(v1339, v1340, v1338, buffer.len(v1338));
        v1336 = v1339;
        v1337 = v1340;
    end;
    local v1341 = buffer.create(v1337);
    buffer.copy(v1341, 0, v1336, 0, v1337);
    return v1341;
end;
v7.decode = function(v1342) --[[ Line: 10326 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_56 (copy), v0 (copy), v5 (copy)
    local v1343 = l_v7_56.new();
    local v1344 = 0;
    while v1344 < buffer.len(v1342) do
        local v1345 = nil;
        local v1346 = nil;
        local v1347, v1348, v1349 = v0.readTag(v1342, v1344);
        v1345 = v1347;
        v1346 = v1348;
        v1344 = v1349;
        if v1346 == v0.wireTypes.varint then
            v1347 = nil;
            v1348, v1349 = v0.readVarInt(v1342, v1344);
            v1347 = v1348;
            v1344 = v1349;
        elseif v1346 == v0.wireTypes.lengthDelimited then
            if v1345 == 1 then
                v1347 = nil;
                v1348, v1349 = v0.readBuffer(v1342, v1344);
                v1347 = v1348;
                v1344 = v1349;
                v1343.song_id = v5.StringProp.decode(v1347);
            else
                v1347 = nil;
                v1348, v1349 = v0.readVarInt(v1342, v1344);
                v1344 = v1349 + v1348;
            end;
        elseif v1346 == v0.wireTypes.i32 then
            v1347 = nil;
            v1348, v1349 = v0.readFixed32(v1342, v1344);
            v1347 = v1348;
            v1344 = v1349;
        elseif v1346 == v0.wireTypes.i64 then
            v1347 = nil;
            v1348, v1349 = v0.readFixed64(v1342, v1344);
            v1347 = v1348;
            v1344 = v1349;
        else
            error("Unsupported wire type: " .. v1346);
        end;
    end;
    return v1343;
end;
v7.jsonEncode = function(v1350) --[[ Line: 10369 ]] --[[ Name: jsonEncode ]]
    local v1351 = {};
    if v1350.song_id ~= nil then
        v1351.songId = v1350.song_id:jsonEncode();
    end;
    return v1351;
end;
v7.jsonDecode = function(v1352) --[[ Line: 10379 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_56 (copy), v5 (copy)
    local v1353 = l_v7_56.new();
    if v1352.song_id ~= nil then
        v1353.song_id = v5.StringProp.jsonDecode(v1352.song_id);
    end;
    if v1352.songId ~= nil then
        v1353.song_id = v5.StringProp.jsonDecode(v1352.songId);
    end;
    return v1353;
end;
v7.descriptor = {
    name = "OpenSongDetailAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenSongDetailAction_Params = v7;
v1.default:register(v2.OpenSongDetailAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_57 = v7 --[[ copy: 7 -> 65 ]];
v7.new = function(v1355) --[[ Line: 10407 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_57 (copy)
    return (setmetatable({
        action_type = if not (v1355 ~= nil) or v1355.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1355.action_type, 
        action_params = if not (v1355 ~= nil) or v1355.action_params == nil then nil else v1355.action_params
    }, l_v7_57));
end;
v7.encode = function(v1356) --[[ Line: 10418 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1357 = buffer.create(0);
    local v1358 = 0;
    if v1356.action_type ~= nil and (v1356.action_type ~= nil and v1356.action_type ~= 0 or v1356.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1359, v1360 = v0.writeTag(v1357, v1358, 1, v0.wireTypes.varint);
        v1359, v1360 = v0.writeVarInt(v1359, v1360, v2.ActionType.toNumber(v1356.action_type));
        v1357 = v1359;
        v1358 = v1360;
    end;
    if v1356.action_params ~= nil then
        local v1361 = v1356.action_params:encode();
        local v1362, v1363 = v0.writeTag(v1357, v1358, 2, v0.wireTypes.lengthDelimited);
        v1362, v1363 = v0.writeBuffer(v1362, v1363, v1361, buffer.len(v1361));
        v1357 = v1362;
        v1358 = v1363;
    end;
    local v1364 = buffer.create(v1358);
    buffer.copy(v1364, 0, v1357, 0, v1358);
    return v1364;
end;
v7.decode = function(v1365) --[[ Line: 10444 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_57 (copy), v0 (copy), v2 (copy)
    local v1366 = l_v7_57.new();
    local v1367 = 0;
    while v1367 < buffer.len(v1365) do
        local v1368 = nil;
        local v1369 = nil;
        local v1370, v1371, v1372 = v0.readTag(v1365, v1367);
        v1368 = v1370;
        v1369 = v1371;
        v1367 = v1372;
        if v1369 == v0.wireTypes.varint then
            if v1368 == 1 then
                v1370 = nil;
                v1371, v1372 = v0.readVarIntI32(v1365, v1367);
                v1370 = v1371;
                v1367 = v1372;
                v1366.action_type = v2.ActionType.fromNumber(v1370) or v1370;
            else
                v1370 = nil;
                v1371, v1372 = v0.readVarInt(v1365, v1367);
                v1370 = v1371;
                v1367 = v1372;
            end;
        elseif v1369 == v0.wireTypes.lengthDelimited then
            if v1368 == 2 then
                v1370 = nil;
                v1371, v1372 = v0.readBuffer(v1365, v1367);
                v1370 = v1371;
                v1367 = v1372;
                v1366.action_params = v2.OpenMarketplaceCatalogFilters_Params.decode(v1370);
            else
                v1370 = nil;
                v1371, v1372 = v0.readVarInt(v1365, v1367);
                v1367 = v1372 + v1371;
            end;
        elseif v1369 == v0.wireTypes.i32 then
            v1370 = nil;
            v1371, v1372 = v0.readFixed32(v1365, v1367);
            v1370 = v1371;
            v1367 = v1372;
        elseif v1369 == v0.wireTypes.i64 then
            v1370 = nil;
            v1371, v1372 = v0.readFixed64(v1365, v1367);
            v1370 = v1371;
            v1367 = v1372;
        else
            error("Unsupported wire type: " .. v1369);
        end;
    end;
    return v1366;
end;
v7.jsonEncode = function(v1373) --[[ Line: 10492 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1374 = {};
    if v1373.action_type ~= nil and (v1373.action_type ~= nil and v1373.action_type ~= 0 or v1373.action_type ~= v2.ActionType.fromNumber(0)) then
        v1374.actionType = if typeof(v1373.action_type) == "number" then v1373.action_type else v2.ActionType.toNumber(v1373.action_type);
    end;
    if v1373.action_params ~= nil then
        v1374.actionParams = v1373.action_params:jsonEncode();
    end;
    return v1374;
end;
v7.jsonDecode = function(v1375) --[[ Line: 10514 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_57 (copy), v2 (copy)
    local v1376 = l_v7_57.new();
    if v1375.action_type ~= nil then
        v1376.action_type = if typeof(v1375.action_type) == "number" then v2.ActionType.fromNumber(v1375.action_type) or v1375.action_type else v2.ActionType.fromName(v1375.action_type) or v1375.action_type;
    end;
    if v1375.actionType ~= nil then
        v1376.action_type = if typeof(v1375.actionType) == "number" then v2.ActionType.fromNumber(v1375.actionType) or v1375.actionType else v2.ActionType.fromName(v1375.actionType) or v1375.actionType;
    end;
    if v1375.action_params ~= nil then
        v1376.action_params = v2.OpenMarketplaceCatalogFilters_Params.jsonDecode(v1375.action_params);
    end;
    if v1375.actionParams ~= nil then
        v1376.action_params = v2.OpenMarketplaceCatalogFilters_Params.jsonDecode(v1375.actionParams);
    end;
    return v1376;
end;
v7.descriptor = {
    name = "OpenMarketplaceCatalogFilters", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceCatalogFilters"
};
v2.OpenMarketplaceCatalogFilters = v7;
v1.default:register(v2.OpenMarketplaceCatalogFilters);
v7 = {};
v7.__index = v7;
local l_v7_58 = v7 --[[ copy: 7 -> 66 ]];
v7.new = function(_) --[[ Line: 10554 ]] --[[ Name: new ]]
    -- upvalues: l_v7_58 (copy)
    return (setmetatable({}, l_v7_58));
end;
v7.encode = function(_) --[[ Line: 10560 ]] --[[ Name: encode ]]
    local v1380 = buffer.create(0);
    local v1381 = buffer.create(0);
    buffer.copy(v1381, 0, v1380, 0, 0);
    return v1381;
end;
v7.decode = function(v1382) --[[ Line: 10569 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_58 (copy), v0 (copy)
    local v1383 = l_v7_58.new();
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
            v1387 = nil;
            v1388, v1389 = v0.readVarInt(v1382, v1384);
            v1384 = v1389 + v1388;
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
v7.jsonEncode = function(_) --[[ Line: 10607 ]] --[[ Name: jsonEncode ]]
    return {};
end;
v7.jsonDecode = function(_) --[[ Line: 10613 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_58 (copy)
    return (l_v7_58.new());
end;
v7.descriptor = {
    name = "OpenMarketplaceCatalogFilters_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenMarketplaceCatalogFilters_Params = v7;
v1.default:register(v2.OpenMarketplaceCatalogFilters_Params);
v7 = {};
v7.__index = v7;
local l_v7_59 = v7 --[[ copy: 7 -> 67 ]];
v7.new = function(v1393) --[[ Line: 10635 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_59 (copy)
    return (setmetatable({
        action_type = if not (v1393 ~= nil) or v1393.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1393.action_type, 
        action_params = if not (v1393 ~= nil) or v1393.action_params == nil then nil else v1393.action_params
    }, l_v7_59));
end;
v7.encode = function(v1394) --[[ Line: 10644 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1395 = buffer.create(0);
    local v1396 = 0;
    if v1394.action_type ~= nil and (v1394.action_type ~= nil and v1394.action_type ~= 0 or v1394.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1397, v1398 = v0.writeTag(v1395, v1396, 1, v0.wireTypes.varint);
        v1397, v1398 = v0.writeVarInt(v1397, v1398, v2.ActionType.toNumber(v1394.action_type));
        v1395 = v1397;
        v1396 = v1398;
    end;
    if v1394.action_params ~= nil then
        local v1399 = v1394.action_params:encode();
        local v1400, v1401 = v0.writeTag(v1395, v1396, 2, v0.wireTypes.lengthDelimited);
        v1400, v1401 = v0.writeBuffer(v1400, v1401, v1399, buffer.len(v1399));
        v1395 = v1400;
        v1396 = v1401;
    end;
    local v1402 = buffer.create(v1396);
    buffer.copy(v1402, 0, v1395, 0, v1396);
    return v1402;
end;
v7.decode = function(v1403) --[[ Line: 10670 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_59 (copy), v0 (copy), v2 (copy)
    local v1404 = l_v7_59.new();
    local v1405 = 0;
    while v1405 < buffer.len(v1403) do
        local v1406 = nil;
        local v1407 = nil;
        local v1408, v1409, v1410 = v0.readTag(v1403, v1405);
        v1406 = v1408;
        v1407 = v1409;
        v1405 = v1410;
        if v1407 == v0.wireTypes.varint then
            if v1406 == 1 then
                v1408 = nil;
                v1409, v1410 = v0.readVarIntI32(v1403, v1405);
                v1408 = v1409;
                v1405 = v1410;
                v1404.action_type = v2.ActionType.fromNumber(v1408) or v1408;
            else
                v1408 = nil;
                v1409, v1410 = v0.readVarInt(v1403, v1405);
                v1408 = v1409;
                v1405 = v1410;
            end;
        elseif v1407 == v0.wireTypes.lengthDelimited then
            if v1406 == 2 then
                v1408 = nil;
                v1409, v1410 = v0.readBuffer(v1403, v1405);
                v1408 = v1409;
                v1405 = v1410;
                v1404.action_params = v2.RefreshFromApiAction_Params.decode(v1408);
            else
                v1408 = nil;
                v1409, v1410 = v0.readVarInt(v1403, v1405);
                v1405 = v1410 + v1409;
            end;
        elseif v1407 == v0.wireTypes.i32 then
            v1408 = nil;
            v1409, v1410 = v0.readFixed32(v1403, v1405);
            v1408 = v1409;
            v1405 = v1410;
        elseif v1407 == v0.wireTypes.i64 then
            v1408 = nil;
            v1409, v1410 = v0.readFixed64(v1403, v1405);
            v1408 = v1409;
            v1405 = v1410;
        else
            error("Unsupported wire type: " .. v1407);
        end;
    end;
    return v1404;
end;
v7.jsonEncode = function(v1411) --[[ Line: 10718 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1412 = {};
    if v1411.action_type ~= nil and (v1411.action_type ~= nil and v1411.action_type ~= 0 or v1411.action_type ~= v2.ActionType.fromNumber(0)) then
        v1412.actionType = if typeof(v1411.action_type) == "number" then v1411.action_type else v2.ActionType.toNumber(v1411.action_type);
    end;
    if v1411.action_params ~= nil then
        v1412.actionParams = v1411.action_params:jsonEncode();
    end;
    return v1412;
end;
v7.jsonDecode = function(v1413) --[[ Line: 10740 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_59 (copy), v2 (copy)
    local v1414 = l_v7_59.new();
    if v1413.action_type ~= nil then
        v1414.action_type = if typeof(v1413.action_type) == "number" then v2.ActionType.fromNumber(v1413.action_type) or v1413.action_type else v2.ActionType.fromName(v1413.action_type) or v1413.action_type;
    end;
    if v1413.actionType ~= nil then
        v1414.action_type = if typeof(v1413.actionType) == "number" then v2.ActionType.fromNumber(v1413.actionType) or v1413.actionType else v2.ActionType.fromName(v1413.actionType) or v1413.actionType;
    end;
    if v1413.action_params ~= nil then
        v1414.action_params = v2.RefreshFromApiAction_Params.jsonDecode(v1413.action_params);
    end;
    if v1413.actionParams ~= nil then
        v1414.action_params = v2.RefreshFromApiAction_Params.jsonDecode(v1413.actionParams);
    end;
    return v1414;
end;
v7.descriptor = {
    name = "RefreshFromApiAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.RefreshFromApiAction"
};
v2.RefreshFromApiAction = v7;
v1.default:register(v2.RefreshFromApiAction);
v7 = {};
v7.__index = v7;
local l_v7_60 = v7 --[[ copy: 7 -> 68 ]];
v7.new = function(v1416) --[[ Line: 10780 ]] --[[ Name: new ]]
    -- upvalues: l_v7_60 (copy)
    return (setmetatable({
        surface_key = if not (v1416 ~= nil) or v1416.surface_key == nil then nil else v1416.surface_key, 
        config_key = if not (v1416 ~= nil) or v1416.config_key == nil then nil else v1416.config_key
    }, l_v7_60));
end;
v7.encode = function(v1417) --[[ Line: 10789 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1418 = buffer.create(0);
    local v1419 = 0;
    if v1417.surface_key ~= nil then
        local v1420 = v1417.surface_key:encode();
        local v1421, v1422 = v0.writeTag(v1418, v1419, 1, v0.wireTypes.lengthDelimited);
        v1421, v1422 = v0.writeBuffer(v1421, v1422, v1420, buffer.len(v1420));
        v1418 = v1421;
        v1419 = v1422;
    end;
    if v1417.config_key ~= nil then
        local v1423 = v1417.config_key:encode();
        local v1424, v1425 = v0.writeTag(v1418, v1419, 2, v0.wireTypes.lengthDelimited);
        v1424, v1425 = v0.writeBuffer(v1424, v1425, v1423, buffer.len(v1423));
        v1418 = v1424;
        v1419 = v1425;
    end;
    local v1426 = buffer.create(v1419);
    buffer.copy(v1426, 0, v1418, 0, v1419);
    return v1426;
end;
v7.decode = function(v1427) --[[ Line: 10810 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_60 (copy), v0 (copy), v5 (copy)
    local v1428 = l_v7_60.new();
    local v1429 = 0;
    while v1429 < buffer.len(v1427) do
        local v1430 = nil;
        local v1431 = nil;
        local v1432, v1433, v1434 = v0.readTag(v1427, v1429);
        v1430 = v1432;
        v1431 = v1433;
        v1429 = v1434;
        if v1431 == v0.wireTypes.varint then
            v1432 = nil;
            v1433, v1434 = v0.readVarInt(v1427, v1429);
            v1432 = v1433;
            v1429 = v1434;
        elseif v1431 == v0.wireTypes.lengthDelimited then
            if v1430 == 1 then
                v1432 = nil;
                v1433, v1434 = v0.readBuffer(v1427, v1429);
                v1432 = v1433;
                v1429 = v1434;
                v1428.surface_key = v5.StringProp.decode(v1432);
            elseif v1430 == 2 then
                v1432 = nil;
                v1433, v1434 = v0.readBuffer(v1427, v1429);
                v1432 = v1433;
                v1429 = v1434;
                v1428.config_key = v5.StringProp.decode(v1432);
            else
                v1432 = nil;
                v1433, v1434 = v0.readVarInt(v1427, v1429);
                v1429 = v1434 + v1433;
            end;
        elseif v1431 == v0.wireTypes.i32 then
            v1432 = nil;
            v1433, v1434 = v0.readFixed32(v1427, v1429);
            v1432 = v1433;
            v1429 = v1434;
        elseif v1431 == v0.wireTypes.i64 then
            v1432 = nil;
            v1433, v1434 = v0.readFixed64(v1427, v1429);
            v1432 = v1433;
            v1429 = v1434;
        else
            error("Unsupported wire type: " .. v1431);
        end;
    end;
    return v1428;
end;
v7.jsonEncode = function(v1435) --[[ Line: 10858 ]] --[[ Name: jsonEncode ]]
    local v1436 = {};
    if v1435.surface_key ~= nil then
        v1436.surfaceKey = v1435.surface_key:jsonEncode();
    end;
    if v1435.config_key ~= nil then
        v1436.configKey = v1435.config_key:jsonEncode();
    end;
    return v1436;
end;
v7.jsonDecode = function(v1437) --[[ Line: 10872 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_60 (copy), v5 (copy)
    local v1438 = l_v7_60.new();
    if v1437.surface_key ~= nil then
        v1438.surface_key = v5.StringProp.jsonDecode(v1437.surface_key);
    end;
    if v1437.surfaceKey ~= nil then
        v1438.surface_key = v5.StringProp.jsonDecode(v1437.surfaceKey);
    end;
    if v1437.config_key ~= nil then
        v1438.config_key = v5.StringProp.jsonDecode(v1437.config_key);
    end;
    if v1437.configKey ~= nil then
        v1438.config_key = v5.StringProp.jsonDecode(v1437.configKey);
    end;
    return v1438;
end;
v7.descriptor = {
    name = "RefreshFromApiAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.RefreshFromApiAction_Params = v7;
v1.default:register(v2.RefreshFromApiAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_61 = v7 --[[ copy: 7 -> 69 ]];
v7.new = function(v1440) --[[ Line: 10909 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_61 (copy)
    return (setmetatable({
        action_type = if not (v1440 ~= nil) or v1440.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1440.action_type, 
        action_params = if not (v1440 ~= nil) or v1440.action_params == nil then nil else v1440.action_params
    }, l_v7_61));
end;
v7.encode = function(v1441) --[[ Line: 10918 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1442 = buffer.create(0);
    local v1443 = 0;
    if v1441.action_type ~= nil and (v1441.action_type ~= nil and v1441.action_type ~= 0 or v1441.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1444, v1445 = v0.writeTag(v1442, v1443, 1, v0.wireTypes.varint);
        v1444, v1445 = v0.writeVarInt(v1444, v1445, v2.ActionType.toNumber(v1441.action_type));
        v1442 = v1444;
        v1443 = v1445;
    end;
    if v1441.action_params ~= nil then
        local v1446 = v1441.action_params:encode();
        local v1447, v1448 = v0.writeTag(v1442, v1443, 2, v0.wireTypes.lengthDelimited);
        v1447, v1448 = v0.writeBuffer(v1447, v1448, v1446, buffer.len(v1446));
        v1442 = v1447;
        v1443 = v1448;
    end;
    local v1449 = buffer.create(v1443);
    buffer.copy(v1449, 0, v1442, 0, v1443);
    return v1449;
end;
v7.decode = function(v1450) --[[ Line: 10944 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_61 (copy), v0 (copy), v2 (copy)
    local v1451 = l_v7_61.new();
    local v1452 = 0;
    while v1452 < buffer.len(v1450) do
        local v1453 = nil;
        local v1454 = nil;
        local v1455, v1456, v1457 = v0.readTag(v1450, v1452);
        v1453 = v1455;
        v1454 = v1456;
        v1452 = v1457;
        if v1454 == v0.wireTypes.varint then
            if v1453 == 1 then
                v1455 = nil;
                v1456, v1457 = v0.readVarIntI32(v1450, v1452);
                v1455 = v1456;
                v1452 = v1457;
                v1451.action_type = v2.ActionType.fromNumber(v1455) or v1455;
            else
                v1455 = nil;
                v1456, v1457 = v0.readVarInt(v1450, v1452);
                v1455 = v1456;
                v1452 = v1457;
            end;
        elseif v1454 == v0.wireTypes.lengthDelimited then
            if v1453 == 2 then
                v1455 = nil;
                v1456, v1457 = v0.readBuffer(v1450, v1452);
                v1455 = v1456;
                v1452 = v1457;
                v1451.action_params = v2.RsvpToEventAction_Params.decode(v1455);
            else
                v1455 = nil;
                v1456, v1457 = v0.readVarInt(v1450, v1452);
                v1452 = v1457 + v1456;
            end;
        elseif v1454 == v0.wireTypes.i32 then
            v1455 = nil;
            v1456, v1457 = v0.readFixed32(v1450, v1452);
            v1455 = v1456;
            v1452 = v1457;
        elseif v1454 == v0.wireTypes.i64 then
            v1455 = nil;
            v1456, v1457 = v0.readFixed64(v1450, v1452);
            v1455 = v1456;
            v1452 = v1457;
        else
            error("Unsupported wire type: " .. v1454);
        end;
    end;
    return v1451;
end;
v7.jsonEncode = function(v1458) --[[ Line: 10992 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1459 = {};
    if v1458.action_type ~= nil and (v1458.action_type ~= nil and v1458.action_type ~= 0 or v1458.action_type ~= v2.ActionType.fromNumber(0)) then
        v1459.actionType = if typeof(v1458.action_type) == "number" then v1458.action_type else v2.ActionType.toNumber(v1458.action_type);
    end;
    if v1458.action_params ~= nil then
        v1459.actionParams = v1458.action_params:jsonEncode();
    end;
    return v1459;
end;
v7.jsonDecode = function(v1460) --[[ Line: 11014 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_61 (copy), v2 (copy)
    local v1461 = l_v7_61.new();
    if v1460.action_type ~= nil then
        v1461.action_type = if typeof(v1460.action_type) == "number" then v2.ActionType.fromNumber(v1460.action_type) or v1460.action_type else v2.ActionType.fromName(v1460.action_type) or v1460.action_type;
    end;
    if v1460.actionType ~= nil then
        v1461.action_type = if typeof(v1460.actionType) == "number" then v2.ActionType.fromNumber(v1460.actionType) or v1460.actionType else v2.ActionType.fromName(v1460.actionType) or v1460.actionType;
    end;
    if v1460.action_params ~= nil then
        v1461.action_params = v2.RsvpToEventAction_Params.jsonDecode(v1460.action_params);
    end;
    if v1460.actionParams ~= nil then
        v1461.action_params = v2.RsvpToEventAction_Params.jsonDecode(v1460.actionParams);
    end;
    return v1461;
end;
v7.descriptor = {
    name = "RsvpToEventAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.RsvpToEventAction"
};
v2.RsvpToEventAction = v7;
v1.default:register(v2.RsvpToEventAction);
v7 = {};
v7.__index = v7;
local l_v7_62 = v7 --[[ copy: 7 -> 70 ]];
v7.new = function(v1463) --[[ Line: 11054 ]] --[[ Name: new ]]
    -- upvalues: l_v7_62 (copy)
    return (setmetatable({
        event_id = if not (v1463 ~= nil) or v1463.event_id == nil then nil else v1463.event_id, 
        user_rsvp = if not (v1463 ~= nil) or v1463.user_rsvp == nil then nil else v1463.user_rsvp
    }, l_v7_62));
end;
v7.encode = function(v1464) --[[ Line: 11061 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1465 = buffer.create(0);
    local v1466 = 0;
    if v1464.event_id ~= nil then
        local v1467 = v1464.event_id:encode();
        local v1468, v1469 = v0.writeTag(v1465, v1466, 1, v0.wireTypes.lengthDelimited);
        v1468, v1469 = v0.writeBuffer(v1468, v1469, v1467, buffer.len(v1467));
        v1465 = v1468;
        v1466 = v1469;
    end;
    if v1464.user_rsvp ~= nil then
        local v1470 = v1464.user_rsvp:encode();
        local v1471, v1472 = v0.writeTag(v1465, v1466, 2, v0.wireTypes.lengthDelimited);
        v1471, v1472 = v0.writeBuffer(v1471, v1472, v1470, buffer.len(v1470));
        v1465 = v1471;
        v1466 = v1472;
    end;
    local v1473 = buffer.create(v1466);
    buffer.copy(v1473, 0, v1465, 0, v1466);
    return v1473;
end;
v7.decode = function(v1474) --[[ Line: 11082 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_62 (copy), v0 (copy), v5 (copy)
    local v1475 = l_v7_62.new();
    local v1476 = 0;
    while v1476 < buffer.len(v1474) do
        local v1477 = nil;
        local v1478 = nil;
        local v1479, v1480, v1481 = v0.readTag(v1474, v1476);
        v1477 = v1479;
        v1478 = v1480;
        v1476 = v1481;
        if v1478 == v0.wireTypes.varint then
            v1479 = nil;
            v1480, v1481 = v0.readVarInt(v1474, v1476);
            v1479 = v1480;
            v1476 = v1481;
        elseif v1478 == v0.wireTypes.lengthDelimited then
            if v1477 == 1 then
                v1479 = nil;
                v1480, v1481 = v0.readBuffer(v1474, v1476);
                v1479 = v1480;
                v1476 = v1481;
                v1475.event_id = v5.StringProp.decode(v1479);
            elseif v1477 == 2 then
                v1479 = nil;
                v1480, v1481 = v0.readBuffer(v1474, v1476);
                v1479 = v1480;
                v1476 = v1481;
                v1475.user_rsvp = v5.BoolProp.decode(v1479);
            else
                v1479 = nil;
                v1480, v1481 = v0.readVarInt(v1474, v1476);
                v1476 = v1481 + v1480;
            end;
        elseif v1478 == v0.wireTypes.i32 then
            v1479 = nil;
            v1480, v1481 = v0.readFixed32(v1474, v1476);
            v1479 = v1480;
            v1476 = v1481;
        elseif v1478 == v0.wireTypes.i64 then
            v1479 = nil;
            v1480, v1481 = v0.readFixed64(v1474, v1476);
            v1479 = v1480;
            v1476 = v1481;
        else
            error("Unsupported wire type: " .. v1478);
        end;
    end;
    return v1475;
end;
v7.jsonEncode = function(v1482) --[[ Line: 11130 ]] --[[ Name: jsonEncode ]]
    local v1483 = {};
    if v1482.event_id ~= nil then
        v1483.eventId = v1482.event_id:jsonEncode();
    end;
    if v1482.user_rsvp ~= nil then
        v1483.userRsvp = v1482.user_rsvp:jsonEncode();
    end;
    return v1483;
end;
v7.jsonDecode = function(v1484) --[[ Line: 11144 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_62 (copy), v5 (copy)
    local v1485 = l_v7_62.new();
    if v1484.event_id ~= nil then
        v1485.event_id = v5.StringProp.jsonDecode(v1484.event_id);
    end;
    if v1484.eventId ~= nil then
        v1485.event_id = v5.StringProp.jsonDecode(v1484.eventId);
    end;
    if v1484.user_rsvp ~= nil then
        v1485.user_rsvp = v5.BoolProp.jsonDecode(v1484.user_rsvp);
    end;
    if v1484.userRsvp ~= nil then
        v1485.user_rsvp = v5.BoolProp.jsonDecode(v1484.userRsvp);
    end;
    return v1485;
end;
v7.descriptor = {
    name = "RsvpToEventAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.RsvpToEventAction_Params = v7;
v1.default:register(v2.RsvpToEventAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_63 = v7 --[[ copy: 7 -> 71 ]];
v7.new = function(v1487) --[[ Line: 11180 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_63 (copy)
    return (setmetatable({
        action_type = if not (v1487 ~= nil) or v1487.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1487.action_type, 
        action_params = if not (v1487 ~= nil) or v1487.action_params == nil then nil else v1487.action_params
    }, l_v7_63));
end;
v7.encode = function(v1488) --[[ Line: 11189 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1489 = buffer.create(0);
    local v1490 = 0;
    if v1488.action_type ~= nil and (v1488.action_type ~= nil and v1488.action_type ~= 0 or v1488.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1491, v1492 = v0.writeTag(v1489, v1490, 1, v0.wireTypes.varint);
        v1491, v1492 = v0.writeVarInt(v1491, v1492, v2.ActionType.toNumber(v1488.action_type));
        v1489 = v1491;
        v1490 = v1492;
    end;
    if v1488.action_params ~= nil then
        local v1493 = v1488.action_params:encode();
        local v1494, v1495 = v0.writeTag(v1489, v1490, 2, v0.wireTypes.lengthDelimited);
        v1494, v1495 = v0.writeBuffer(v1494, v1495, v1493, buffer.len(v1493));
        v1489 = v1494;
        v1490 = v1495;
    end;
    local v1496 = buffer.create(v1490);
    buffer.copy(v1496, 0, v1489, 0, v1490);
    return v1496;
end;
v7.decode = function(v1497) --[[ Line: 11215 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_63 (copy), v0 (copy), v2 (copy)
    local v1498 = l_v7_63.new();
    local v1499 = 0;
    while v1499 < buffer.len(v1497) do
        local v1500 = nil;
        local v1501 = nil;
        local v1502, v1503, v1504 = v0.readTag(v1497, v1499);
        v1500 = v1502;
        v1501 = v1503;
        v1499 = v1504;
        if v1501 == v0.wireTypes.varint then
            if v1500 == 1 then
                v1502 = nil;
                v1503, v1504 = v0.readVarIntI32(v1497, v1499);
                v1502 = v1503;
                v1499 = v1504;
                v1498.action_type = v2.ActionType.fromNumber(v1502) or v1502;
            else
                v1502 = nil;
                v1503, v1504 = v0.readVarInt(v1497, v1499);
                v1502 = v1503;
                v1499 = v1504;
            end;
        elseif v1501 == v0.wireTypes.lengthDelimited then
            if v1500 == 2 then
                v1502 = nil;
                v1503, v1504 = v0.readBuffer(v1497, v1499);
                v1502 = v1503;
                v1499 = v1504;
                v1498.action_params = v2.ApplyChartsFilterAction_Params.decode(v1502);
            else
                v1502 = nil;
                v1503, v1504 = v0.readVarInt(v1497, v1499);
                v1499 = v1504 + v1503;
            end;
        elseif v1501 == v0.wireTypes.i32 then
            v1502 = nil;
            v1503, v1504 = v0.readFixed32(v1497, v1499);
            v1502 = v1503;
            v1499 = v1504;
        elseif v1501 == v0.wireTypes.i64 then
            v1502 = nil;
            v1503, v1504 = v0.readFixed64(v1497, v1499);
            v1502 = v1503;
            v1499 = v1504;
        else
            error("Unsupported wire type: " .. v1501);
        end;
    end;
    return v1498;
end;
v7.jsonEncode = function(v1505) --[[ Line: 11263 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1506 = {};
    if v1505.action_type ~= nil and (v1505.action_type ~= nil and v1505.action_type ~= 0 or v1505.action_type ~= v2.ActionType.fromNumber(0)) then
        v1506.actionType = if typeof(v1505.action_type) == "number" then v1505.action_type else v2.ActionType.toNumber(v1505.action_type);
    end;
    if v1505.action_params ~= nil then
        v1506.actionParams = v1505.action_params:jsonEncode();
    end;
    return v1506;
end;
v7.jsonDecode = function(v1507) --[[ Line: 11285 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_63 (copy), v2 (copy)
    local v1508 = l_v7_63.new();
    if v1507.action_type ~= nil then
        v1508.action_type = if typeof(v1507.action_type) == "number" then v2.ActionType.fromNumber(v1507.action_type) or v1507.action_type else v2.ActionType.fromName(v1507.action_type) or v1507.action_type;
    end;
    if v1507.actionType ~= nil then
        v1508.action_type = if typeof(v1507.actionType) == "number" then v2.ActionType.fromNumber(v1507.actionType) or v1507.actionType else v2.ActionType.fromName(v1507.actionType) or v1507.actionType;
    end;
    if v1507.action_params ~= nil then
        v1508.action_params = v2.ApplyChartsFilterAction_Params.jsonDecode(v1507.action_params);
    end;
    if v1507.actionParams ~= nil then
        v1508.action_params = v2.ApplyChartsFilterAction_Params.jsonDecode(v1507.actionParams);
    end;
    return v1508;
end;
v7.descriptor = {
    name = "ApplyChartsFilterAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ApplyChartsFilterAction"
};
v2.ApplyChartsFilterAction = v7;
v1.default:register(v2.ApplyChartsFilterAction);
v7 = {};
v7.__index = v7;
local l_v7_64 = v7 --[[ copy: 7 -> 72 ]];
v7.new = function(v1510) --[[ Line: 11325 ]] --[[ Name: new ]]
    -- upvalues: l_v7_64 (copy)
    return (setmetatable({
        session_id = if not (v1510 ~= nil) or v1510.session_id == nil then nil else v1510.session_id
    }, l_v7_64));
end;
v7.encode = function(v1511) --[[ Line: 11333 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1512 = buffer.create(0);
    local v1513 = 0;
    if v1511.session_id ~= nil then
        local v1514 = v1511.session_id:encode();
        local v1515, v1516 = v0.writeTag(v1512, v1513, 1, v0.wireTypes.lengthDelimited);
        v1515, v1516 = v0.writeBuffer(v1515, v1516, v1514, buffer.len(v1514));
        v1512 = v1515;
        v1513 = v1516;
    end;
    local v1517 = buffer.create(v1513);
    buffer.copy(v1517, 0, v1512, 0, v1513);
    return v1517;
end;
v7.decode = function(v1518) --[[ Line: 11348 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_64 (copy), v0 (copy), v5 (copy)
    local v1519 = l_v7_64.new();
    local v1520 = 0;
    while v1520 < buffer.len(v1518) do
        local v1521 = nil;
        local v1522 = nil;
        local v1523, v1524, v1525 = v0.readTag(v1518, v1520);
        v1521 = v1523;
        v1522 = v1524;
        v1520 = v1525;
        if v1522 == v0.wireTypes.varint then
            v1523 = nil;
            v1524, v1525 = v0.readVarInt(v1518, v1520);
            v1523 = v1524;
            v1520 = v1525;
        elseif v1522 == v0.wireTypes.lengthDelimited then
            if v1521 == 1 then
                v1523 = nil;
                v1524, v1525 = v0.readBuffer(v1518, v1520);
                v1523 = v1524;
                v1520 = v1525;
                v1519.session_id = v5.StringProp.decode(v1523);
            else
                v1523 = nil;
                v1524, v1525 = v0.readVarInt(v1518, v1520);
                v1520 = v1525 + v1524;
            end;
        elseif v1522 == v0.wireTypes.i32 then
            v1523 = nil;
            v1524, v1525 = v0.readFixed32(v1518, v1520);
            v1523 = v1524;
            v1520 = v1525;
        elseif v1522 == v0.wireTypes.i64 then
            v1523 = nil;
            v1524, v1525 = v0.readFixed64(v1518, v1520);
            v1523 = v1524;
            v1520 = v1525;
        else
            error("Unsupported wire type: " .. v1522);
        end;
    end;
    return v1519;
end;
v7.jsonEncode = function(v1526) --[[ Line: 11391 ]] --[[ Name: jsonEncode ]]
    local v1527 = {};
    if v1526.session_id ~= nil then
        v1527.sessionId = v1526.session_id:jsonEncode();
    end;
    return v1527;
end;
v7.jsonDecode = function(v1528) --[[ Line: 11401 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_64 (copy), v5 (copy)
    local v1529 = l_v7_64.new();
    if v1528.session_id ~= nil then
        v1529.session_id = v5.StringProp.jsonDecode(v1528.session_id);
    end;
    if v1528.sessionId ~= nil then
        v1529.session_id = v5.StringProp.jsonDecode(v1528.sessionId);
    end;
    return v1529;
end;
v7.descriptor = {
    name = "ApplyChartsFilterAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.ApplyChartsFilterAction_Params = v7;
v1.default:register(v2.ApplyChartsFilterAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_65 = v7 --[[ copy: 7 -> 73 ]];
v7.new = function(v1531) --[[ Line: 11429 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_65 (copy)
    return (setmetatable({
        action_type = if not (v1531 ~= nil) or v1531.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1531.action_type, 
        action_params = if not (v1531 ~= nil) or v1531.action_params == nil then nil else v1531.action_params
    }, l_v7_65));
end;
v7.encode = function(v1532) --[[ Line: 11438 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1533 = buffer.create(0);
    local v1534 = 0;
    if v1532.action_type ~= nil and (v1532.action_type ~= nil and v1532.action_type ~= 0 or v1532.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1535, v1536 = v0.writeTag(v1533, v1534, 1, v0.wireTypes.varint);
        v1535, v1536 = v0.writeVarInt(v1535, v1536, v2.ActionType.toNumber(v1532.action_type));
        v1533 = v1535;
        v1534 = v1536;
    end;
    if v1532.action_params ~= nil then
        local v1537 = v1532.action_params:encode();
        local v1538, v1539 = v0.writeTag(v1533, v1534, 2, v0.wireTypes.lengthDelimited);
        v1538, v1539 = v0.writeBuffer(v1538, v1539, v1537, buffer.len(v1537));
        v1533 = v1538;
        v1534 = v1539;
    end;
    local v1540 = buffer.create(v1534);
    buffer.copy(v1540, 0, v1533, 0, v1534);
    return v1540;
end;
v7.decode = function(v1541) --[[ Line: 11464 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_65 (copy), v0 (copy), v2 (copy)
    local v1542 = l_v7_65.new();
    local v1543 = 0;
    while v1543 < buffer.len(v1541) do
        local v1544 = nil;
        local v1545 = nil;
        local v1546, v1547, v1548 = v0.readTag(v1541, v1543);
        v1544 = v1546;
        v1545 = v1547;
        v1543 = v1548;
        if v1545 == v0.wireTypes.varint then
            if v1544 == 1 then
                v1546 = nil;
                v1547, v1548 = v0.readVarIntI32(v1541, v1543);
                v1546 = v1547;
                v1543 = v1548;
                v1542.action_type = v2.ActionType.fromNumber(v1546) or v1546;
            else
                v1546 = nil;
                v1547, v1548 = v0.readVarInt(v1541, v1543);
                v1546 = v1547;
                v1543 = v1548;
            end;
        elseif v1545 == v0.wireTypes.lengthDelimited then
            if v1544 == 2 then
                v1546 = nil;
                v1547, v1548 = v0.readBuffer(v1541, v1543);
                v1546 = v1547;
                v1543 = v1548;
                v1542.action_params = v2.AnalyticsEventAction_Params.decode(v1546);
            else
                v1546 = nil;
                v1547, v1548 = v0.readVarInt(v1541, v1543);
                v1543 = v1548 + v1547;
            end;
        elseif v1545 == v0.wireTypes.i32 then
            v1546 = nil;
            v1547, v1548 = v0.readFixed32(v1541, v1543);
            v1546 = v1547;
            v1543 = v1548;
        elseif v1545 == v0.wireTypes.i64 then
            v1546 = nil;
            v1547, v1548 = v0.readFixed64(v1541, v1543);
            v1546 = v1547;
            v1543 = v1548;
        else
            error("Unsupported wire type: " .. v1545);
        end;
    end;
    return v1542;
end;
v7.jsonEncode = function(v1549) --[[ Line: 11512 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1550 = {};
    if v1549.action_type ~= nil and (v1549.action_type ~= nil and v1549.action_type ~= 0 or v1549.action_type ~= v2.ActionType.fromNumber(0)) then
        v1550.actionType = if typeof(v1549.action_type) == "number" then v1549.action_type else v2.ActionType.toNumber(v1549.action_type);
    end;
    if v1549.action_params ~= nil then
        v1550.actionParams = v1549.action_params:jsonEncode();
    end;
    return v1550;
end;
v7.jsonDecode = function(v1551) --[[ Line: 11534 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_65 (copy), v2 (copy)
    local v1552 = l_v7_65.new();
    if v1551.action_type ~= nil then
        v1552.action_type = if typeof(v1551.action_type) == "number" then v2.ActionType.fromNumber(v1551.action_type) or v1551.action_type else v2.ActionType.fromName(v1551.action_type) or v1551.action_type;
    end;
    if v1551.actionType ~= nil then
        v1552.action_type = if typeof(v1551.actionType) == "number" then v2.ActionType.fromNumber(v1551.actionType) or v1551.actionType else v2.ActionType.fromName(v1551.actionType) or v1551.actionType;
    end;
    if v1551.action_params ~= nil then
        v1552.action_params = v2.AnalyticsEventAction_Params.jsonDecode(v1551.action_params);
    end;
    if v1551.actionParams ~= nil then
        v1552.action_params = v2.AnalyticsEventAction_Params.jsonDecode(v1551.actionParams);
    end;
    return v1552;
end;
v7.descriptor = {
    name = "AnalyticsEventAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.AnalyticsEventAction"
};
v2.AnalyticsEventAction = v7;
v1.default:register(v2.AnalyticsEventAction);
v7 = {};
v7.__index = v7;
local l_v7_66 = v7 --[[ copy: 7 -> 74 ]];
v7.new = function(v1554) --[[ Line: 11574 ]] --[[ Name: new ]]
    -- upvalues: l_v7_66 (copy)
    return (setmetatable({
        event_name = if not (v1554 ~= nil) or v1554.event_name == nil then nil else v1554.event_name, 
        event_fields = if not (v1554 ~= nil) or v1554.event_fields == nil then nil else v1554.event_fields
    }, l_v7_66));
end;
v7.encode = function(v1555) --[[ Line: 11583 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1556 = buffer.create(0);
    local v1557 = 0;
    if v1555.event_name ~= nil then
        local v1558 = v1555.event_name:encode();
        local v1559, v1560 = v0.writeTag(v1556, v1557, 1, v0.wireTypes.lengthDelimited);
        v1559, v1560 = v0.writeBuffer(v1559, v1560, v1558, buffer.len(v1558));
        v1556 = v1559;
        v1557 = v1560;
    end;
    if v1555.event_fields ~= nil then
        local v1561 = v1555.event_fields:encode();
        local v1562, v1563 = v0.writeTag(v1556, v1557, 2, v0.wireTypes.lengthDelimited);
        v1562, v1563 = v0.writeBuffer(v1562, v1563, v1561, buffer.len(v1561));
        v1556 = v1562;
        v1557 = v1563;
    end;
    local v1564 = buffer.create(v1557);
    buffer.copy(v1564, 0, v1556, 0, v1557);
    return v1564;
end;
v7.decode = function(v1565) --[[ Line: 11604 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_66 (copy), v0 (copy), v5 (copy)
    local v1566 = l_v7_66.new();
    local v1567 = 0;
    while v1567 < buffer.len(v1565) do
        local v1568 = nil;
        local v1569 = nil;
        local v1570, v1571, v1572 = v0.readTag(v1565, v1567);
        v1568 = v1570;
        v1569 = v1571;
        v1567 = v1572;
        if v1569 == v0.wireTypes.varint then
            v1570 = nil;
            v1571, v1572 = v0.readVarInt(v1565, v1567);
            v1570 = v1571;
            v1567 = v1572;
        elseif v1569 == v0.wireTypes.lengthDelimited then
            if v1568 == 1 then
                v1570 = nil;
                v1571, v1572 = v0.readBuffer(v1565, v1567);
                v1570 = v1571;
                v1567 = v1572;
                v1566.event_name = v5.StringProp.decode(v1570);
            elseif v1568 == 2 then
                v1570 = nil;
                v1571, v1572 = v0.readBuffer(v1565, v1567);
                v1570 = v1571;
                v1567 = v1572;
                v1566.event_fields = v5.StructProp.decode(v1570);
            else
                v1570 = nil;
                v1571, v1572 = v0.readVarInt(v1565, v1567);
                v1567 = v1572 + v1571;
            end;
        elseif v1569 == v0.wireTypes.i32 then
            v1570 = nil;
            v1571, v1572 = v0.readFixed32(v1565, v1567);
            v1570 = v1571;
            v1567 = v1572;
        elseif v1569 == v0.wireTypes.i64 then
            v1570 = nil;
            v1571, v1572 = v0.readFixed64(v1565, v1567);
            v1570 = v1571;
            v1567 = v1572;
        else
            error("Unsupported wire type: " .. v1569);
        end;
    end;
    return v1566;
end;
v7.jsonEncode = function(v1573) --[[ Line: 11652 ]] --[[ Name: jsonEncode ]]
    local v1574 = {};
    if v1573.event_name ~= nil then
        v1574.eventName = v1573.event_name:jsonEncode();
    end;
    if v1573.event_fields ~= nil then
        v1574.eventFields = v1573.event_fields:jsonEncode();
    end;
    return v1574;
end;
v7.jsonDecode = function(v1575) --[[ Line: 11666 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_66 (copy), v5 (copy)
    local v1576 = l_v7_66.new();
    if v1575.event_name ~= nil then
        v1576.event_name = v5.StringProp.jsonDecode(v1575.event_name);
    end;
    if v1575.eventName ~= nil then
        v1576.event_name = v5.StringProp.jsonDecode(v1575.eventName);
    end;
    if v1575.event_fields ~= nil then
        v1576.event_fields = v5.StructProp.jsonDecode(v1575.event_fields);
    end;
    if v1575.eventFields ~= nil then
        v1576.event_fields = v5.StructProp.jsonDecode(v1575.eventFields);
    end;
    return v1576;
end;
v7.descriptor = {
    name = "AnalyticsEventAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.AnalyticsEventAction_Params = v7;
v1.default:register(v2.AnalyticsEventAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_67 = v7 --[[ copy: 7 -> 75 ]];
v7.new = function(v1578) --[[ Line: 11704 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_67 (copy)
    return (setmetatable({
        action_type = if not (v1578 ~= nil) or v1578.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1578.action_type, 
        action_params = if not (v1578 ~= nil) or v1578.action_params == nil then nil else v1578.action_params
    }, l_v7_67));
end;
v7.encode = function(v1579) --[[ Line: 11715 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1580 = buffer.create(0);
    local v1581 = 0;
    if v1579.action_type ~= nil and (v1579.action_type ~= nil and v1579.action_type ~= 0 or v1579.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1582, v1583 = v0.writeTag(v1580, v1581, 1, v0.wireTypes.varint);
        v1582, v1583 = v0.writeVarInt(v1582, v1583, v2.ActionType.toNumber(v1579.action_type));
        v1580 = v1582;
        v1581 = v1583;
    end;
    if v1579.action_params ~= nil then
        local v1584 = v1579.action_params:encode();
        local v1585, v1586 = v0.writeTag(v1580, v1581, 2, v0.wireTypes.lengthDelimited);
        v1585, v1586 = v0.writeBuffer(v1585, v1586, v1584, buffer.len(v1584));
        v1580 = v1585;
        v1581 = v1586;
    end;
    local v1587 = buffer.create(v1581);
    buffer.copy(v1587, 0, v1580, 0, v1581);
    return v1587;
end;
v7.decode = function(v1588) --[[ Line: 11741 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_67 (copy), v0 (copy), v2 (copy)
    local v1589 = l_v7_67.new();
    local v1590 = 0;
    while v1590 < buffer.len(v1588) do
        local v1591 = nil;
        local v1592 = nil;
        local v1593, v1594, v1595 = v0.readTag(v1588, v1590);
        v1591 = v1593;
        v1592 = v1594;
        v1590 = v1595;
        if v1592 == v0.wireTypes.varint then
            if v1591 == 1 then
                v1593 = nil;
                v1594, v1595 = v0.readVarIntI32(v1588, v1590);
                v1593 = v1594;
                v1590 = v1595;
                v1589.action_type = v2.ActionType.fromNumber(v1593) or v1593;
            else
                v1593 = nil;
                v1594, v1595 = v0.readVarInt(v1588, v1590);
                v1593 = v1594;
                v1590 = v1595;
            end;
        elseif v1592 == v0.wireTypes.lengthDelimited then
            if v1591 == 2 then
                v1593 = nil;
                v1594, v1595 = v0.readBuffer(v1588, v1590);
                v1593 = v1594;
                v1590 = v1595;
                v1589.action_params = v2.CustomAnalyticsEventAction_Params.decode(v1593);
            else
                v1593 = nil;
                v1594, v1595 = v0.readVarInt(v1588, v1590);
                v1590 = v1595 + v1594;
            end;
        elseif v1592 == v0.wireTypes.i32 then
            v1593 = nil;
            v1594, v1595 = v0.readFixed32(v1588, v1590);
            v1593 = v1594;
            v1590 = v1595;
        elseif v1592 == v0.wireTypes.i64 then
            v1593 = nil;
            v1594, v1595 = v0.readFixed64(v1588, v1590);
            v1593 = v1594;
            v1590 = v1595;
        else
            error("Unsupported wire type: " .. v1592);
        end;
    end;
    return v1589;
end;
v7.jsonEncode = function(v1596) --[[ Line: 11789 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1597 = {};
    if v1596.action_type ~= nil and (v1596.action_type ~= nil and v1596.action_type ~= 0 or v1596.action_type ~= v2.ActionType.fromNumber(0)) then
        v1597.actionType = if typeof(v1596.action_type) == "number" then v1596.action_type else v2.ActionType.toNumber(v1596.action_type);
    end;
    if v1596.action_params ~= nil then
        v1597.actionParams = v1596.action_params:jsonEncode();
    end;
    return v1597;
end;
v7.jsonDecode = function(v1598) --[[ Line: 11811 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_67 (copy), v2 (copy)
    local v1599 = l_v7_67.new();
    if v1598.action_type ~= nil then
        v1599.action_type = if typeof(v1598.action_type) == "number" then v2.ActionType.fromNumber(v1598.action_type) or v1598.action_type else v2.ActionType.fromName(v1598.action_type) or v1598.action_type;
    end;
    if v1598.actionType ~= nil then
        v1599.action_type = if typeof(v1598.actionType) == "number" then v2.ActionType.fromNumber(v1598.actionType) or v1598.actionType else v2.ActionType.fromName(v1598.actionType) or v1598.actionType;
    end;
    if v1598.action_params ~= nil then
        v1599.action_params = v2.CustomAnalyticsEventAction_Params.jsonDecode(v1598.action_params);
    end;
    if v1598.actionParams ~= nil then
        v1599.action_params = v2.CustomAnalyticsEventAction_Params.jsonDecode(v1598.actionParams);
    end;
    return v1599;
end;
v7.descriptor = {
    name = "CustomAnalyticsEventAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CustomAnalyticsEventAction"
};
v2.CustomAnalyticsEventAction = v7;
v1.default:register(v2.CustomAnalyticsEventAction);
v7 = {};
v7.__index = v7;
local l_v7_68 = v7 --[[ copy: 7 -> 76 ]];
v7.new = function(v1601) --[[ Line: 11851 ]] --[[ Name: new ]]
    -- upvalues: l_v7_68 (copy)
    return (setmetatable({
        event_name = if not (v1601 ~= nil) or v1601.event_name == nil then nil else v1601.event_name, 
        event_fields = if not (v1601 ~= nil) or v1601.event_fields == nil then nil else v1601.event_fields
    }, l_v7_68));
end;
v7.encode = function(v1602) --[[ Line: 11860 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1603 = buffer.create(0);
    local v1604 = 0;
    if v1602.event_name ~= nil then
        local v1605 = v1602.event_name:encode();
        local v1606, v1607 = v0.writeTag(v1603, v1604, 1, v0.wireTypes.lengthDelimited);
        v1606, v1607 = v0.writeBuffer(v1606, v1607, v1605, buffer.len(v1605));
        v1603 = v1606;
        v1604 = v1607;
    end;
    if v1602.event_fields ~= nil then
        local v1608 = v1602.event_fields:encode();
        local v1609, v1610 = v0.writeTag(v1603, v1604, 2, v0.wireTypes.lengthDelimited);
        v1609, v1610 = v0.writeBuffer(v1609, v1610, v1608, buffer.len(v1608));
        v1603 = v1609;
        v1604 = v1610;
    end;
    local v1611 = buffer.create(v1604);
    buffer.copy(v1611, 0, v1603, 0, v1604);
    return v1611;
end;
v7.decode = function(v1612) --[[ Line: 11881 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_68 (copy), v0 (copy), v5 (copy)
    local v1613 = l_v7_68.new();
    local v1614 = 0;
    while v1614 < buffer.len(v1612) do
        local v1615 = nil;
        local v1616 = nil;
        local v1617, v1618, v1619 = v0.readTag(v1612, v1614);
        v1615 = v1617;
        v1616 = v1618;
        v1614 = v1619;
        if v1616 == v0.wireTypes.varint then
            v1617 = nil;
            v1618, v1619 = v0.readVarInt(v1612, v1614);
            v1617 = v1618;
            v1614 = v1619;
        elseif v1616 == v0.wireTypes.lengthDelimited then
            if v1615 == 1 then
                v1617 = nil;
                v1618, v1619 = v0.readBuffer(v1612, v1614);
                v1617 = v1618;
                v1614 = v1619;
                v1613.event_name = v5.StringProp.decode(v1617);
            elseif v1615 == 2 then
                v1617 = nil;
                v1618, v1619 = v0.readBuffer(v1612, v1614);
                v1617 = v1618;
                v1614 = v1619;
                v1613.event_fields = v5.StructProp.decode(v1617);
            else
                v1617 = nil;
                v1618, v1619 = v0.readVarInt(v1612, v1614);
                v1614 = v1619 + v1618;
            end;
        elseif v1616 == v0.wireTypes.i32 then
            v1617 = nil;
            v1618, v1619 = v0.readFixed32(v1612, v1614);
            v1617 = v1618;
            v1614 = v1619;
        elseif v1616 == v0.wireTypes.i64 then
            v1617 = nil;
            v1618, v1619 = v0.readFixed64(v1612, v1614);
            v1617 = v1618;
            v1614 = v1619;
        else
            error("Unsupported wire type: " .. v1616);
        end;
    end;
    return v1613;
end;
v7.jsonEncode = function(v1620) --[[ Line: 11929 ]] --[[ Name: jsonEncode ]]
    local v1621 = {};
    if v1620.event_name ~= nil then
        v1621.eventName = v1620.event_name:jsonEncode();
    end;
    if v1620.event_fields ~= nil then
        v1621.eventFields = v1620.event_fields:jsonEncode();
    end;
    return v1621;
end;
v7.jsonDecode = function(v1622) --[[ Line: 11943 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_68 (copy), v5 (copy)
    local v1623 = l_v7_68.new();
    if v1622.event_name ~= nil then
        v1623.event_name = v5.StringProp.jsonDecode(v1622.event_name);
    end;
    if v1622.eventName ~= nil then
        v1623.event_name = v5.StringProp.jsonDecode(v1622.eventName);
    end;
    if v1622.event_fields ~= nil then
        v1623.event_fields = v5.StructProp.jsonDecode(v1622.event_fields);
    end;
    if v1622.eventFields ~= nil then
        v1623.event_fields = v5.StructProp.jsonDecode(v1622.eventFields);
    end;
    return v1623;
end;
v7.descriptor = {
    name = "CustomAnalyticsEventAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.CustomAnalyticsEventAction_Params = v7;
v1.default:register(v2.CustomAnalyticsEventAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_69 = v7 --[[ copy: 7 -> 77 ]];
v7.new = function(v1625) --[[ Line: 11983 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v7_69 (copy)
    return (setmetatable({
        action_type = if not (v1625 ~= nil) or v1625.action_type == nil then assert(v2.ActionType.fromNumber(0), "Enum has no 0 default") else v1625.action_type, 
        action_params = if not (v1625 ~= nil) or v1625.action_params == nil then nil else v1625.action_params
    }, l_v7_69));
end;
v7.encode = function(v1626) --[[ Line: 11992 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v1627 = buffer.create(0);
    local v1628 = 0;
    if v1626.action_type ~= nil and (v1626.action_type ~= nil and v1626.action_type ~= 0 or v1626.action_type ~= v2.ActionType.fromNumber(0)) then
        local v1629, v1630 = v0.writeTag(v1627, v1628, 1, v0.wireTypes.varint);
        v1629, v1630 = v0.writeVarInt(v1629, v1630, v2.ActionType.toNumber(v1626.action_type));
        v1627 = v1629;
        v1628 = v1630;
    end;
    if v1626.action_params ~= nil then
        local v1631 = v1626.action_params:encode();
        local v1632, v1633 = v0.writeTag(v1627, v1628, 2, v0.wireTypes.lengthDelimited);
        v1632, v1633 = v0.writeBuffer(v1632, v1633, v1631, buffer.len(v1631));
        v1627 = v1632;
        v1628 = v1633;
    end;
    local v1634 = buffer.create(v1628);
    buffer.copy(v1634, 0, v1627, 0, v1628);
    return v1634;
end;
v7.decode = function(v1635) --[[ Line: 12018 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_69 (copy), v0 (copy), v2 (copy)
    local v1636 = l_v7_69.new();
    local v1637 = 0;
    while v1637 < buffer.len(v1635) do
        local v1638 = nil;
        local v1639 = nil;
        local v1640, v1641, v1642 = v0.readTag(v1635, v1637);
        v1638 = v1640;
        v1639 = v1641;
        v1637 = v1642;
        if v1639 == v0.wireTypes.varint then
            if v1638 == 1 then
                v1640 = nil;
                v1641, v1642 = v0.readVarIntI32(v1635, v1637);
                v1640 = v1641;
                v1637 = v1642;
                v1636.action_type = v2.ActionType.fromNumber(v1640) or v1640;
            else
                v1640 = nil;
                v1641, v1642 = v0.readVarInt(v1635, v1637);
                v1640 = v1641;
                v1637 = v1642;
            end;
        elseif v1639 == v0.wireTypes.lengthDelimited then
            if v1638 == 2 then
                v1640 = nil;
                v1641, v1642 = v0.readBuffer(v1635, v1637);
                v1640 = v1641;
                v1637 = v1642;
                v1636.action_params = v2.OpenGameInviteAction_Params.decode(v1640);
            else
                v1640 = nil;
                v1641, v1642 = v0.readVarInt(v1635, v1637);
                v1637 = v1642 + v1641;
            end;
        elseif v1639 == v0.wireTypes.i32 then
            v1640 = nil;
            v1641, v1642 = v0.readFixed32(v1635, v1637);
            v1640 = v1641;
            v1637 = v1642;
        elseif v1639 == v0.wireTypes.i64 then
            v1640 = nil;
            v1641, v1642 = v0.readFixed64(v1635, v1637);
            v1640 = v1641;
            v1637 = v1642;
        else
            error("Unsupported wire type: " .. v1639);
        end;
    end;
    return v1636;
end;
v7.jsonEncode = function(v1643) --[[ Line: 12066 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v1644 = {};
    if v1643.action_type ~= nil and (v1643.action_type ~= nil and v1643.action_type ~= 0 or v1643.action_type ~= v2.ActionType.fromNumber(0)) then
        v1644.actionType = if typeof(v1643.action_type) == "number" then v1643.action_type else v2.ActionType.toNumber(v1643.action_type);
    end;
    if v1643.action_params ~= nil then
        v1644.actionParams = v1643.action_params:jsonEncode();
    end;
    return v1644;
end;
v7.jsonDecode = function(v1645) --[[ Line: 12088 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_69 (copy), v2 (copy)
    local v1646 = l_v7_69.new();
    if v1645.action_type ~= nil then
        v1646.action_type = if typeof(v1645.action_type) == "number" then v2.ActionType.fromNumber(v1645.action_type) or v1645.action_type else v2.ActionType.fromName(v1645.action_type) or v1645.action_type;
    end;
    if v1645.actionType ~= nil then
        v1646.action_type = if typeof(v1645.actionType) == "number" then v2.ActionType.fromNumber(v1645.actionType) or v1645.actionType else v2.ActionType.fromName(v1645.actionType) or v1645.actionType;
    end;
    if v1645.action_params ~= nil then
        v1646.action_params = v2.OpenGameInviteAction_Params.jsonDecode(v1645.action_params);
    end;
    if v1645.actionParams ~= nil then
        v1646.action_params = v2.OpenGameInviteAction_Params.jsonDecode(v1645.actionParams);
    end;
    return v1646;
end;
v7.descriptor = {
    name = "OpenGameInviteAction", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameInviteAction"
};
v2.OpenGameInviteAction = v7;
v1.default:register(v2.OpenGameInviteAction);
v7 = {};
v7.__index = v7;
local l_v7_70 = v7 --[[ copy: 7 -> 78 ]];
v7.new = function(v1648) --[[ Line: 12128 ]] --[[ Name: new ]]
    -- upvalues: l_v7_70 (copy)
    return (setmetatable({
        universe_id = if not (v1648 ~= nil) or v1648.universe_id == nil then nil else v1648.universe_id, 
        root_place_id = if not (v1648 ~= nil) or v1648.root_place_id == nil then nil else v1648.root_place_id, 
        trigger = if not (v1648 ~= nil) or v1648.trigger == nil then nil else v1648.trigger, 
        button_name = if not (v1648 ~= nil) or v1648.button_name == nil then nil else v1648.button_name
    }, l_v7_70));
end;
v7.encode = function(v1649) --[[ Line: 12139 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1650 = buffer.create(0);
    local v1651 = 0;
    if v1649.universe_id ~= nil then
        local v1652 = v1649.universe_id:encode();
        local v1653, v1654 = v0.writeTag(v1650, v1651, 1, v0.wireTypes.lengthDelimited);
        v1653, v1654 = v0.writeBuffer(v1653, v1654, v1652, buffer.len(v1652));
        v1650 = v1653;
        v1651 = v1654;
    end;
    if v1649.root_place_id ~= nil then
        local v1655 = v1649.root_place_id:encode();
        local v1656, v1657 = v0.writeTag(v1650, v1651, 2, v0.wireTypes.lengthDelimited);
        v1656, v1657 = v0.writeBuffer(v1656, v1657, v1655, buffer.len(v1655));
        v1650 = v1656;
        v1651 = v1657;
    end;
    if v1649.trigger ~= nil then
        local v1658 = v1649.trigger:encode();
        local v1659, v1660 = v0.writeTag(v1650, v1651, 3, v0.wireTypes.lengthDelimited);
        v1659, v1660 = v0.writeBuffer(v1659, v1660, v1658, buffer.len(v1658));
        v1650 = v1659;
        v1651 = v1660;
    end;
    if v1649.button_name ~= nil then
        local v1661 = v1649.button_name:encode();
        local v1662, v1663 = v0.writeTag(v1650, v1651, 4, v0.wireTypes.lengthDelimited);
        v1662, v1663 = v0.writeBuffer(v1662, v1663, v1661, buffer.len(v1661));
        v1650 = v1662;
        v1651 = v1663;
    end;
    local v1664 = buffer.create(v1651);
    buffer.copy(v1664, 0, v1650, 0, v1651);
    return v1664;
end;
v7.decode = function(v1665) --[[ Line: 12172 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_70 (copy), v0 (copy), v5 (copy)
    local v1666 = l_v7_70.new();
    local v1667 = 0;
    while v1667 < buffer.len(v1665) do
        local v1668 = nil;
        local v1669 = nil;
        local v1670, v1671, v1672 = v0.readTag(v1665, v1667);
        v1668 = v1670;
        v1669 = v1671;
        v1667 = v1672;
        if v1669 == v0.wireTypes.varint then
            v1670 = nil;
            v1671, v1672 = v0.readVarInt(v1665, v1667);
            v1670 = v1671;
            v1667 = v1672;
        elseif v1669 == v0.wireTypes.lengthDelimited then
            if v1668 == 1 then
                v1670 = nil;
                v1671, v1672 = v0.readBuffer(v1665, v1667);
                v1670 = v1671;
                v1667 = v1672;
                v1666.universe_id = v5.StringProp.decode(v1670);
            elseif v1668 == 2 then
                v1670 = nil;
                v1671, v1672 = v0.readBuffer(v1665, v1667);
                v1670 = v1671;
                v1667 = v1672;
                v1666.root_place_id = v5.StringProp.decode(v1670);
            elseif v1668 == 3 then
                v1670 = nil;
                v1671, v1672 = v0.readBuffer(v1665, v1667);
                v1670 = v1671;
                v1667 = v1672;
                v1666.trigger = v5.StringProp.decode(v1670);
            elseif v1668 == 4 then
                v1670 = nil;
                v1671, v1672 = v0.readBuffer(v1665, v1667);
                v1670 = v1671;
                v1667 = v1672;
                v1666.button_name = v5.StringProp.decode(v1670);
            else
                v1670 = nil;
                v1671, v1672 = v0.readVarInt(v1665, v1667);
                v1667 = v1672 + v1671;
            end;
        elseif v1669 == v0.wireTypes.i32 then
            v1670 = nil;
            v1671, v1672 = v0.readFixed32(v1665, v1667);
            v1670 = v1671;
            v1667 = v1672;
        elseif v1669 == v0.wireTypes.i64 then
            v1670 = nil;
            v1671, v1672 = v0.readFixed64(v1665, v1667);
            v1670 = v1671;
            v1667 = v1672;
        else
            error("Unsupported wire type: " .. v1669);
        end;
    end;
    return v1666;
end;
v7.jsonEncode = function(v1673) --[[ Line: 12230 ]] --[[ Name: jsonEncode ]]
    local v1674 = {};
    if v1673.universe_id ~= nil then
        v1674.universeId = v1673.universe_id:jsonEncode();
    end;
    if v1673.root_place_id ~= nil then
        v1674.rootPlaceId = v1673.root_place_id:jsonEncode();
    end;
    if v1673.trigger ~= nil then
        v1674.trigger = v1673.trigger:jsonEncode();
    end;
    if v1673.button_name ~= nil then
        v1674.buttonName = v1673.button_name:jsonEncode();
    end;
    return v1674;
end;
v7.jsonDecode = function(v1675) --[[ Line: 12252 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_70 (copy), v5 (copy)
    local v1676 = l_v7_70.new();
    if v1675.universe_id ~= nil then
        v1676.universe_id = v5.StringProp.jsonDecode(v1675.universe_id);
    end;
    if v1675.universeId ~= nil then
        v1676.universe_id = v5.StringProp.jsonDecode(v1675.universeId);
    end;
    if v1675.root_place_id ~= nil then
        v1676.root_place_id = v5.StringProp.jsonDecode(v1675.root_place_id);
    end;
    if v1675.rootPlaceId ~= nil then
        v1676.root_place_id = v5.StringProp.jsonDecode(v1675.rootPlaceId);
    end;
    if v1675.trigger ~= nil then
        v1676.trigger = v5.StringProp.jsonDecode(v1675.trigger);
    end;
    if v1675.button_name ~= nil then
        v1676.button_name = v5.StringProp.jsonDecode(v1675.button_name);
    end;
    if v1675.buttonName ~= nil then
        v1676.button_name = v5.StringProp.jsonDecode(v1675.buttonName);
    end;
    return v1676;
end;
v7.descriptor = {
    name = "OpenGameInviteAction_Params", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Params"
};
v2.OpenGameInviteAction_Params = v7;
v1.default:register(v2.OpenGameInviteAction_Params);
v7 = {};
v7.__index = v7;
local l_v7_71 = v7 --[[ copy: 7 -> 79 ]];
v7.new = function(v1678) --[[ Line: 12304 ]] --[[ Name: new ]]
    -- upvalues: l_v7_71 (copy)
    return (setmetatable({
        kind = if not (v1678 ~= nil) or v1678.kind == nil then nil else v1678.kind, 
        telemetry_handler = if not (v1678 ~= nil) or v1678.telemetry_handler == nil then nil else v1678.telemetry_handler
    }, l_v7_71));
end;
v7.encode = function(v1679) --[[ Line: 12311 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1680 = buffer.create(0);
    local v1681 = 0;
    if v1679.kind ~= nil then
        if v1679.kind.type == "dismiss_dialog_action" then
            local v1682 = v1679.kind.value:encode();
            local v1683, v1684 = v0.writeTag(v1680, v1681, 1, v0.wireTypes.lengthDelimited);
            v1683, v1684 = v0.writeBuffer(v1683, v1684, v1682, buffer.len(v1682));
            v1680 = v1683;
            v1681 = v1684;
        elseif v1679.kind.type == "link_action" then
            local v1685 = v1679.kind.value:encode();
            local v1686, v1687 = v0.writeTag(v1680, v1681, 2, v0.wireTypes.lengthDelimited);
            v1686, v1687 = v0.writeBuffer(v1686, v1687, v1685, buffer.len(v1685));
            v1680 = v1686;
            v1681 = v1687;
        elseif v1679.kind.type == "open_game_details_action" then
            local v1688 = v1679.kind.value:encode();
            local v1689, v1690 = v0.writeTag(v1680, v1681, 3, v0.wireTypes.lengthDelimited);
            v1689, v1690 = v0.writeBuffer(v1689, v1690, v1688, buffer.len(v1688));
            v1680 = v1689;
            v1681 = v1690;
        elseif v1679.kind.type == "open_join_friends_action" then
            local v1691 = v1679.kind.value:encode();
            local v1692, v1693 = v0.writeTag(v1680, v1681, 4, v0.wireTypes.lengthDelimited);
            v1692, v1693 = v0.writeBuffer(v1692, v1693, v1691, buffer.len(v1691));
            v1680 = v1692;
            v1681 = v1693;
        elseif v1679.kind.type == "open_marketplace_try_on_action" then
            local v1694 = v1679.kind.value:encode();
            local v1695, v1696 = v0.writeTag(v1680, v1681, 5, v0.wireTypes.lengthDelimited);
            v1695, v1696 = v0.writeBuffer(v1695, v1696, v1694, buffer.len(v1694));
            v1680 = v1695;
            v1681 = v1696;
        elseif v1679.kind.type == "open_see_all_action" then
            local v1697 = v1679.kind.value:encode();
            local v1698, v1699 = v0.writeTag(v1680, v1681, 6, v0.wireTypes.lengthDelimited);
            v1698, v1699 = v0.writeBuffer(v1698, v1699, v1697, buffer.len(v1697));
            v1680 = v1698;
            v1681 = v1699;
        elseif v1679.kind.type == "open_sponsored_tooltip_action" then
            local v1700 = v1679.kind.value:encode();
            local v1701, v1702 = v0.writeTag(v1680, v1681, 7, v0.wireTypes.lengthDelimited);
            v1701, v1702 = v0.writeBuffer(v1701, v1702, v1700, buffer.len(v1700));
            v1680 = v1701;
            v1681 = v1702;
        elseif v1679.kind.type == "play_button_click_action" then
            local v1703 = v1679.kind.value:encode();
            local v1704, v1705 = v0.writeTag(v1680, v1681, 8, v0.wireTypes.lengthDelimited);
            v1704, v1705 = v0.writeBuffer(v1704, v1705, v1703, buffer.len(v1703));
            v1680 = v1704;
            v1681 = v1705;
        elseif v1679.kind.type == "update_user_settings_action" then
            local v1706 = v1679.kind.value:encode();
            local v1707, v1708 = v0.writeTag(v1680, v1681, 9, v0.wireTypes.lengthDelimited);
            v1707, v1708 = v0.writeBuffer(v1707, v1708, v1706, buffer.len(v1706));
            v1680 = v1707;
            v1681 = v1708;
        elseif v1679.kind.type == "open_tooltip_action" then
            local v1709 = v1679.kind.value:encode();
            local v1710, v1711 = v0.writeTag(v1680, v1681, 10, v0.wireTypes.lengthDelimited);
            v1710, v1711 = v0.writeBuffer(v1710, v1711, v1709, buffer.len(v1709));
            v1680 = v1710;
            v1681 = v1711;
        elseif v1679.kind.type == "open_badge_details_action" then
            local v1712 = v1679.kind.value:encode();
            local v1713, v1714 = v0.writeTag(v1680, v1681, 11, v0.wireTypes.lengthDelimited);
            v1713, v1714 = v0.writeBuffer(v1713, v1714, v1712, buffer.len(v1712));
            v1680 = v1713;
            v1681 = v1714;
        elseif v1679.kind.type == "load_more_from_api_action" then
            local v1715 = v1679.kind.value:encode();
            local v1716, v1717 = v0.writeTag(v1680, v1681, 12, v0.wireTypes.lengthDelimited);
            v1716, v1717 = v0.writeBuffer(v1716, v1717, v1715, buffer.len(v1715));
            v1680 = v1716;
            v1681 = v1717;
        elseif v1679.kind.type == "share_action" then
            local v1718 = v1679.kind.value:encode();
            local v1719, v1720 = v0.writeTag(v1680, v1681, 13, v0.wireTypes.lengthDelimited);
            v1719, v1720 = v0.writeBuffer(v1719, v1720, v1718, buffer.len(v1718));
            v1680 = v1719;
            v1681 = v1720;
        elseif v1679.kind.type == "open_abuse_report_action" then
            local v1721 = v1679.kind.value:encode();
            local v1722, v1723 = v0.writeTag(v1680, v1681, 14, v0.wireTypes.lengthDelimited);
            v1722, v1723 = v0.writeBuffer(v1722, v1723, v1721, buffer.len(v1721));
            v1680 = v1722;
            v1681 = v1723;
        elseif v1679.kind.type == "remove_badge_from_inventory_action" then
            local v1724 = v1679.kind.value:encode();
            local v1725, v1726 = v0.writeTag(v1680, v1681, 15, v0.wireTypes.lengthDelimited);
            v1725, v1726 = v0.writeBuffer(v1725, v1726, v1724, buffer.len(v1724));
            v1680 = v1725;
            v1681 = v1726;
        elseif v1679.kind.type == "open_profile_action" then
            local v1727 = v1679.kind.value:encode();
            local v1728, v1729 = v0.writeTag(v1680, v1681, 16, v0.wireTypes.lengthDelimited);
            v1728, v1729 = v0.writeBuffer(v1728, v1729, v1727, buffer.len(v1727));
            v1680 = v1728;
            v1681 = v1729;
        elseif v1679.kind.type == "open_facial_age_estimation_action" then
            local v1730 = v1679.kind.value:encode();
            local v1731, v1732 = v0.writeTag(v1680, v1681, 17, v0.wireTypes.lengthDelimited);
            v1731, v1732 = v0.writeBuffer(v1731, v1732, v1730, buffer.len(v1730));
            v1680 = v1731;
            v1681 = v1732;
        elseif v1679.kind.type == "open_add_connections_page_action" then
            local v1733 = v1679.kind.value:encode();
            local v1734, v1735 = v0.writeTag(v1680, v1681, 18, v0.wireTypes.lengthDelimited);
            v1734, v1735 = v0.writeBuffer(v1734, v1735, v1733, buffer.len(v1733));
            v1680 = v1734;
            v1681 = v1735;
        elseif v1679.kind.type == "open_marketplace_action" then
            local v1736 = v1679.kind.value:encode();
            local v1737, v1738 = v0.writeTag(v1680, v1681, 19, v0.wireTypes.lengthDelimited);
            v1737, v1738 = v0.writeBuffer(v1737, v1738, v1736, buffer.len(v1736));
            v1680 = v1737;
            v1681 = v1738;
        elseif v1679.kind.type == "hide_profile_completion_action" then
            local v1739 = v1679.kind.value:encode();
            local v1740, v1741 = v0.writeTag(v1680, v1681, 20, v0.wireTypes.lengthDelimited);
            v1740, v1741 = v0.writeBuffer(v1740, v1741, v1739, buffer.len(v1739));
            v1680 = v1740;
            v1681 = v1741;
        elseif v1679.kind.type == "select_marketplace_catalog_category" then
            local v1742 = v1679.kind.value:encode();
            local v1743, v1744 = v0.writeTag(v1680, v1681, 21, v0.wireTypes.lengthDelimited);
            v1743, v1744 = v0.writeBuffer(v1743, v1744, v1742, buffer.len(v1742));
            v1680 = v1743;
            v1681 = v1744;
        elseif v1679.kind.type == "select_marketplace_catalog_subcategory" then
            local v1745 = v1679.kind.value:encode();
            local v1746, v1747 = v0.writeTag(v1680, v1681, 22, v0.wireTypes.lengthDelimited);
            v1746, v1747 = v0.writeBuffer(v1746, v1747, v1745, buffer.len(v1745));
            v1680 = v1746;
            v1681 = v1747;
        elseif v1679.kind.type == "open_marketplace_catalog_see_all" then
            local v1748 = v1679.kind.value:encode();
            local v1749, v1750 = v0.writeTag(v1680, v1681, 23, v0.wireTypes.lengthDelimited);
            v1749, v1750 = v0.writeBuffer(v1749, v1750, v1748, buffer.len(v1748));
            v1680 = v1749;
            v1681 = v1750;
        elseif v1679.kind.type == "close_marketplace_category_tooltip" then
            local v1751 = v1679.kind.value:encode();
            local v1752, v1753 = v0.writeTag(v1680, v1681, 24, v0.wireTypes.lengthDelimited);
            v1752, v1753 = v0.writeBuffer(v1752, v1753, v1751, buffer.len(v1751));
            v1680 = v1752;
            v1681 = v1753;
        elseif v1679.kind.type == "resize_marketplace_catalog" then
            local v1754 = v1679.kind.value:encode();
            local v1755, v1756 = v0.writeTag(v1680, v1681, 25, v0.wireTypes.lengthDelimited);
            v1755, v1756 = v0.writeBuffer(v1755, v1756, v1754, buffer.len(v1754));
            v1680 = v1755;
            v1681 = v1756;
        elseif v1679.kind.type == "open_marketplace_catalog_filters" then
            local v1757 = v1679.kind.value:encode();
            local v1758, v1759 = v0.writeTag(v1680, v1681, 26, v0.wireTypes.lengthDelimited);
            v1758, v1759 = v0.writeBuffer(v1758, v1759, v1757, buffer.len(v1757));
            v1680 = v1758;
            v1681 = v1759;
        elseif v1679.kind.type == "open_social_link_action" then
            local v1760 = v1679.kind.value:encode();
            local v1761, v1762 = v0.writeTag(v1680, v1681, 27, v0.wireTypes.lengthDelimited);
            v1761, v1762 = v0.writeBuffer(v1761, v1762, v1760, buffer.len(v1760));
            v1680 = v1761;
            v1681 = v1762;
        elseif v1679.kind.type == "open_charts_sort_detail_action" then
            local v1763 = v1679.kind.value:encode();
            local v1764, v1765 = v0.writeTag(v1680, v1681, 28, v0.wireTypes.lengthDelimited);
            v1764, v1765 = v0.writeBuffer(v1764, v1765, v1763, buffer.len(v1763));
            v1680 = v1764;
            v1681 = v1765;
        elseif v1679.kind.type == "open_song_detail_action" then
            local v1766 = v1679.kind.value:encode();
            local v1767, v1768 = v0.writeTag(v1680, v1681, 29, v0.wireTypes.lengthDelimited);
            v1767, v1768 = v0.writeBuffer(v1767, v1768, v1766, buffer.len(v1766));
            v1680 = v1767;
            v1681 = v1768;
        elseif v1679.kind.type == "refresh_from_api_action" then
            local v1769 = v1679.kind.value:encode();
            local v1770, v1771 = v0.writeTag(v1680, v1681, 30, v0.wireTypes.lengthDelimited);
            v1770, v1771 = v0.writeBuffer(v1770, v1771, v1769, buffer.len(v1769));
            v1680 = v1770;
            v1681 = v1771;
        elseif v1679.kind.type == "rsvp_to_event_action" then
            local v1772 = v1679.kind.value:encode();
            local v1773, v1774 = v0.writeTag(v1680, v1681, 31, v0.wireTypes.lengthDelimited);
            v1773, v1774 = v0.writeBuffer(v1773, v1774, v1772, buffer.len(v1772));
            v1680 = v1773;
            v1681 = v1774;
        elseif v1679.kind.type == "apply_charts_filter_action" then
            local v1775 = v1679.kind.value:encode();
            local v1776, v1777 = v0.writeTag(v1680, v1681, 32, v0.wireTypes.lengthDelimited);
            v1776, v1777 = v0.writeBuffer(v1776, v1777, v1775, buffer.len(v1775));
            v1680 = v1776;
            v1681 = v1777;
        elseif v1679.kind.type == "analytics_event_action" then
            local v1778 = v1679.kind.value:encode();
            local v1779, v1780 = v0.writeTag(v1680, v1681, 33, v0.wireTypes.lengthDelimited);
            v1779, v1780 = v0.writeBuffer(v1779, v1780, v1778, buffer.len(v1778));
            v1680 = v1779;
            v1681 = v1780;
        elseif v1679.kind.type == "custom_analytics_event_action" then
            local v1781 = v1679.kind.value:encode();
            local v1782, v1783 = v0.writeTag(v1680, v1681, 34, v0.wireTypes.lengthDelimited);
            v1782, v1783 = v0.writeBuffer(v1782, v1783, v1781, buffer.len(v1781));
            v1680 = v1782;
            v1681 = v1783;
        elseif v1679.kind.type == "open_game_invite_action" then
            local v1784 = v1679.kind.value:encode();
            local v1785, v1786 = v0.writeTag(v1680, v1681, 35, v0.wireTypes.lengthDelimited);
            v1785, v1786 = v0.writeBuffer(v1785, v1786, v1784, buffer.len(v1784));
            v1680 = v1785;
            v1681 = v1786;
        end;
    end;
    if v1679.telemetry_handler ~= nil then
        local v1787 = v1679.telemetry_handler:encode();
        local v1788, v1789 = v0.writeTag(v1680, v1681, 1000, v0.wireTypes.lengthDelimited);
        v1788, v1789 = v0.writeBuffer(v1788, v1789, v1787, buffer.len(v1787));
        v1680 = v1788;
        v1681 = v1789;
    end;
    local v1790 = buffer.create(v1681);
    buffer.copy(v1790, 0, v1680, 0, v1681);
    return v1790;
end;
v7.decode = function(v1791) --[[ Line: 12470 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_71 (copy), v0 (copy), v2 (copy), v5 (copy)
    local v1792 = l_v7_71.new();
    local v1793 = 0;
    while v1793 < buffer.len(v1791) do
        local v1794 = nil;
        local v1795 = nil;
        local v1796, v1797, v1798 = v0.readTag(v1791, v1793);
        v1794 = v1796;
        v1795 = v1797;
        v1793 = v1798;
        if v1795 == v0.wireTypes.varint then
            v1796 = nil;
            v1797, v1798 = v0.readVarInt(v1791, v1793);
            v1796 = v1797;
            v1793 = v1798;
        elseif v1795 == v0.wireTypes.lengthDelimited then
            if v1794 == 1 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "dismiss_dialog_action", 
                    value = v2.DismissDialogAction.decode(v1796)
                };
            elseif v1794 == 2 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "link_action", 
                    value = v2.LinkAction.decode(v1796)
                };
            elseif v1794 == 3 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "open_game_details_action", 
                    value = v2.OpenGameDetailsAction.decode(v1796)
                };
            elseif v1794 == 4 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "open_join_friends_action", 
                    value = v2.OpenJoinFriendsAction.decode(v1796)
                };
            elseif v1794 == 5 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "open_marketplace_try_on_action", 
                    value = v2.OpenMarketplaceTryOnAction.decode(v1796)
                };
            elseif v1794 == 6 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "open_see_all_action", 
                    value = v2.OpenSeeAllAction.decode(v1796)
                };
            elseif v1794 == 7 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "open_sponsored_tooltip_action", 
                    value = v2.OpenSponsoredTooltipAction.decode(v1796)
                };
            elseif v1794 == 8 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "play_button_click_action", 
                    value = v2.PlayButtonClickAction.decode(v1796)
                };
            elseif v1794 == 9 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "update_user_settings_action", 
                    value = v2.UpdateUserSettingsAction.decode(v1796)
                };
            elseif v1794 == 10 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "open_tooltip_action", 
                    value = v2.OpenTooltipAction.decode(v1796)
                };
            elseif v1794 == 11 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "open_badge_details_action", 
                    value = v2.OpenBadgeDetailsAction.decode(v1796)
                };
            elseif v1794 == 12 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "load_more_from_api_action", 
                    value = v2.LoadMoreFromApiAction.decode(v1796)
                };
            elseif v1794 == 13 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "share_action", 
                    value = v2.ShareAction.decode(v1796)
                };
            elseif v1794 == 14 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "open_abuse_report_action", 
                    value = v2.OpenAbuseReportAction.decode(v1796)
                };
            elseif v1794 == 15 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "remove_badge_from_inventory_action", 
                    value = v2.RemoveBadgeFromInventoryAction.decode(v1796)
                };
            elseif v1794 == 16 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "open_profile_action", 
                    value = v2.OpenProfileAction.decode(v1796)
                };
            elseif v1794 == 17 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "open_facial_age_estimation_action", 
                    value = v2.OpenFacialAgeEstimationAction.decode(v1796)
                };
            elseif v1794 == 18 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "open_add_connections_page_action", 
                    value = v2.OpenAddConnectionsPageAction.decode(v1796)
                };
            elseif v1794 == 19 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "open_marketplace_action", 
                    value = v2.OpenMarketplaceAction.decode(v1796)
                };
            elseif v1794 == 20 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "hide_profile_completion_action", 
                    value = v2.HideProfileCompletionAction.decode(v1796)
                };
            elseif v1794 == 21 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "select_marketplace_catalog_category", 
                    value = v2.SelectMarketplaceCatalogCategory.decode(v1796)
                };
            elseif v1794 == 22 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "select_marketplace_catalog_subcategory", 
                    value = v2.SelectMarketplaceCatalogSubcategory.decode(v1796)
                };
            elseif v1794 == 23 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "open_marketplace_catalog_see_all", 
                    value = v2.OpenMarketplaceCatalogSeeAll.decode(v1796)
                };
            elseif v1794 == 24 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "close_marketplace_category_tooltip", 
                    value = v2.CloseMarketplaceCategoryTooltip.decode(v1796)
                };
            elseif v1794 == 25 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "resize_marketplace_catalog", 
                    value = v2.ResizeMarketplaceCatalog.decode(v1796)
                };
            elseif v1794 == 26 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "open_marketplace_catalog_filters", 
                    value = v2.OpenMarketplaceCatalogFilters.decode(v1796)
                };
            elseif v1794 == 27 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "open_social_link_action", 
                    value = v2.OpenSocialLinkAction.decode(v1796)
                };
            elseif v1794 == 28 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "open_charts_sort_detail_action", 
                    value = v2.OpenChartsSortDetailAction.decode(v1796)
                };
            elseif v1794 == 29 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "open_song_detail_action", 
                    value = v2.OpenSongDetailAction.decode(v1796)
                };
            elseif v1794 == 30 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "refresh_from_api_action", 
                    value = v2.RefreshFromApiAction.decode(v1796)
                };
            elseif v1794 == 31 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "rsvp_to_event_action", 
                    value = v2.RsvpToEventAction.decode(v1796)
                };
            elseif v1794 == 32 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "apply_charts_filter_action", 
                    value = v2.ApplyChartsFilterAction.decode(v1796)
                };
            elseif v1794 == 33 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "analytics_event_action", 
                    value = v2.AnalyticsEventAction.decode(v1796)
                };
            elseif v1794 == 34 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "custom_analytics_event_action", 
                    value = v2.CustomAnalyticsEventAction.decode(v1796)
                };
            elseif v1794 == 35 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.kind = {
                    type = "open_game_invite_action", 
                    value = v2.OpenGameInviteAction.decode(v1796)
                };
            elseif v1794 == 1000 then
                v1796 = nil;
                v1797, v1798 = v0.readBuffer(v1791, v1793);
                v1796 = v1797;
                v1793 = v1798;
                v1792.telemetry_handler = v5.StringProp.decode(v1796);
            else
                v1796 = nil;
                v1797, v1798 = v0.readVarInt(v1791, v1793);
                v1793 = v1798 + v1797;
            end;
        elseif v1795 == v0.wireTypes.i32 then
            v1796 = nil;
            v1797, v1798 = v0.readFixed32(v1791, v1793);
            v1796 = v1797;
            v1793 = v1798;
        elseif v1795 == v0.wireTypes.i64 then
            v1796 = nil;
            v1797, v1798 = v0.readFixed64(v1791, v1793);
            v1796 = v1797;
            v1793 = v1798;
        else
            error("Unsupported wire type: " .. v1795);
        end;
    end;
    return v1792;
end;
v7.jsonEncode = function(v1799) --[[ Line: 12743 ]] --[[ Name: jsonEncode ]]
    local v1800 = {};
    if v1799.kind ~= nil then
        if v1799.kind.type == "dismiss_dialog_action" then
            v1800.dismissDialogAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "link_action" then
            v1800.linkAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "open_game_details_action" then
            v1800.openGameDetailsAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "open_join_friends_action" then
            v1800.openJoinFriendsAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "open_marketplace_try_on_action" then
            v1800.openMarketplaceTryOnAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "open_see_all_action" then
            v1800.openSeeAllAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "open_sponsored_tooltip_action" then
            v1800.openSponsoredTooltipAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "play_button_click_action" then
            v1800.playButtonClickAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "update_user_settings_action" then
            v1800.updateUserSettingsAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "open_tooltip_action" then
            v1800.openTooltipAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "open_badge_details_action" then
            v1800.openBadgeDetailsAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "load_more_from_api_action" then
            v1800.loadMoreFromApiAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "share_action" then
            v1800.shareAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "open_abuse_report_action" then
            v1800.openAbuseReportAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "remove_badge_from_inventory_action" then
            v1800.removeBadgeFromInventoryAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "open_profile_action" then
            v1800.openProfileAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "open_facial_age_estimation_action" then
            v1800.openFacialAgeEstimationAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "open_add_connections_page_action" then
            v1800.openAddConnectionsPageAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "open_marketplace_action" then
            v1800.openMarketplaceAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "hide_profile_completion_action" then
            v1800.hideProfileCompletionAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "select_marketplace_catalog_category" then
            v1800.selectMarketplaceCatalogCategory = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "select_marketplace_catalog_subcategory" then
            v1800.selectMarketplaceCatalogSubcategory = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "open_marketplace_catalog_see_all" then
            v1800.openMarketplaceCatalogSeeAll = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "close_marketplace_category_tooltip" then
            v1800.closeMarketplaceCategoryTooltip = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "resize_marketplace_catalog" then
            v1800.resizeMarketplaceCatalog = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "open_marketplace_catalog_filters" then
            v1800.openMarketplaceCatalogFilters = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "open_social_link_action" then
            v1800.openSocialLinkAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "open_charts_sort_detail_action" then
            v1800.openChartsSortDetailAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "open_song_detail_action" then
            v1800.openSongDetailAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "refresh_from_api_action" then
            v1800.refreshFromApiAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "rsvp_to_event_action" then
            v1800.rsvpToEventAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "apply_charts_filter_action" then
            v1800.applyChartsFilterAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "analytics_event_action" then
            v1800.analyticsEventAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "custom_analytics_event_action" then
            v1800.customAnalyticsEventAction = v1799.kind.value:jsonEncode();
        elseif v1799.kind.type == "open_game_invite_action" then
            v1800.openGameInviteAction = v1799.kind.value:jsonEncode();
        end;
    end;
    if v1799.telemetry_handler ~= nil then
        v1800.telemetryHandler = v1799.telemetry_handler:jsonEncode();
    end;
    return v1800;
end;
v7.jsonDecode = function(v1801) --[[ Line: 12827 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_71 (copy), v2 (copy), v5 (copy)
    local v1802 = l_v7_71.new();
    if v1801.dismiss_dialog_action ~= nil then
        v1802.kind = {
            type = "dismiss_dialog_action", 
            value = v2.DismissDialogAction.jsonDecode(v1801.dismiss_dialog_action)
        };
    end;
    if v1801.dismissDialogAction ~= nil then
        v1802.kind = {
            type = "dismiss_dialog_action", 
            value = v2.DismissDialogAction.jsonDecode(v1801.dismissDialogAction)
        };
    end;
    if v1801.link_action ~= nil then
        v1802.kind = {
            type = "link_action", 
            value = v2.LinkAction.jsonDecode(v1801.link_action)
        };
    end;
    if v1801.linkAction ~= nil then
        v1802.kind = {
            type = "link_action", 
            value = v2.LinkAction.jsonDecode(v1801.linkAction)
        };
    end;
    if v1801.open_game_details_action ~= nil then
        v1802.kind = {
            type = "open_game_details_action", 
            value = v2.OpenGameDetailsAction.jsonDecode(v1801.open_game_details_action)
        };
    end;
    if v1801.openGameDetailsAction ~= nil then
        v1802.kind = {
            type = "open_game_details_action", 
            value = v2.OpenGameDetailsAction.jsonDecode(v1801.openGameDetailsAction)
        };
    end;
    if v1801.open_join_friends_action ~= nil then
        v1802.kind = {
            type = "open_join_friends_action", 
            value = v2.OpenJoinFriendsAction.jsonDecode(v1801.open_join_friends_action)
        };
    end;
    if v1801.openJoinFriendsAction ~= nil then
        v1802.kind = {
            type = "open_join_friends_action", 
            value = v2.OpenJoinFriendsAction.jsonDecode(v1801.openJoinFriendsAction)
        };
    end;
    if v1801.open_marketplace_try_on_action ~= nil then
        v1802.kind = {
            type = "open_marketplace_try_on_action", 
            value = v2.OpenMarketplaceTryOnAction.jsonDecode(v1801.open_marketplace_try_on_action)
        };
    end;
    if v1801.openMarketplaceTryOnAction ~= nil then
        v1802.kind = {
            type = "open_marketplace_try_on_action", 
            value = v2.OpenMarketplaceTryOnAction.jsonDecode(v1801.openMarketplaceTryOnAction)
        };
    end;
    if v1801.open_see_all_action ~= nil then
        v1802.kind = {
            type = "open_see_all_action", 
            value = v2.OpenSeeAllAction.jsonDecode(v1801.open_see_all_action)
        };
    end;
    if v1801.openSeeAllAction ~= nil then
        v1802.kind = {
            type = "open_see_all_action", 
            value = v2.OpenSeeAllAction.jsonDecode(v1801.openSeeAllAction)
        };
    end;
    if v1801.open_sponsored_tooltip_action ~= nil then
        v1802.kind = {
            type = "open_sponsored_tooltip_action", 
            value = v2.OpenSponsoredTooltipAction.jsonDecode(v1801.open_sponsored_tooltip_action)
        };
    end;
    if v1801.openSponsoredTooltipAction ~= nil then
        v1802.kind = {
            type = "open_sponsored_tooltip_action", 
            value = v2.OpenSponsoredTooltipAction.jsonDecode(v1801.openSponsoredTooltipAction)
        };
    end;
    if v1801.play_button_click_action ~= nil then
        v1802.kind = {
            type = "play_button_click_action", 
            value = v2.PlayButtonClickAction.jsonDecode(v1801.play_button_click_action)
        };
    end;
    if v1801.playButtonClickAction ~= nil then
        v1802.kind = {
            type = "play_button_click_action", 
            value = v2.PlayButtonClickAction.jsonDecode(v1801.playButtonClickAction)
        };
    end;
    if v1801.update_user_settings_action ~= nil then
        v1802.kind = {
            type = "update_user_settings_action", 
            value = v2.UpdateUserSettingsAction.jsonDecode(v1801.update_user_settings_action)
        };
    end;
    if v1801.updateUserSettingsAction ~= nil then
        v1802.kind = {
            type = "update_user_settings_action", 
            value = v2.UpdateUserSettingsAction.jsonDecode(v1801.updateUserSettingsAction)
        };
    end;
    if v1801.open_tooltip_action ~= nil then
        v1802.kind = {
            type = "open_tooltip_action", 
            value = v2.OpenTooltipAction.jsonDecode(v1801.open_tooltip_action)
        };
    end;
    if v1801.openTooltipAction ~= nil then
        v1802.kind = {
            type = "open_tooltip_action", 
            value = v2.OpenTooltipAction.jsonDecode(v1801.openTooltipAction)
        };
    end;
    if v1801.open_badge_details_action ~= nil then
        v1802.kind = {
            type = "open_badge_details_action", 
            value = v2.OpenBadgeDetailsAction.jsonDecode(v1801.open_badge_details_action)
        };
    end;
    if v1801.openBadgeDetailsAction ~= nil then
        v1802.kind = {
            type = "open_badge_details_action", 
            value = v2.OpenBadgeDetailsAction.jsonDecode(v1801.openBadgeDetailsAction)
        };
    end;
    if v1801.load_more_from_api_action ~= nil then
        v1802.kind = {
            type = "load_more_from_api_action", 
            value = v2.LoadMoreFromApiAction.jsonDecode(v1801.load_more_from_api_action)
        };
    end;
    if v1801.loadMoreFromApiAction ~= nil then
        v1802.kind = {
            type = "load_more_from_api_action", 
            value = v2.LoadMoreFromApiAction.jsonDecode(v1801.loadMoreFromApiAction)
        };
    end;
    if v1801.share_action ~= nil then
        v1802.kind = {
            type = "share_action", 
            value = v2.ShareAction.jsonDecode(v1801.share_action)
        };
    end;
    if v1801.shareAction ~= nil then
        v1802.kind = {
            type = "share_action", 
            value = v2.ShareAction.jsonDecode(v1801.shareAction)
        };
    end;
    if v1801.open_abuse_report_action ~= nil then
        v1802.kind = {
            type = "open_abuse_report_action", 
            value = v2.OpenAbuseReportAction.jsonDecode(v1801.open_abuse_report_action)
        };
    end;
    if v1801.openAbuseReportAction ~= nil then
        v1802.kind = {
            type = "open_abuse_report_action", 
            value = v2.OpenAbuseReportAction.jsonDecode(v1801.openAbuseReportAction)
        };
    end;
    if v1801.remove_badge_from_inventory_action ~= nil then
        v1802.kind = {
            type = "remove_badge_from_inventory_action", 
            value = v2.RemoveBadgeFromInventoryAction.jsonDecode(v1801.remove_badge_from_inventory_action)
        };
    end;
    if v1801.removeBadgeFromInventoryAction ~= nil then
        v1802.kind = {
            type = "remove_badge_from_inventory_action", 
            value = v2.RemoveBadgeFromInventoryAction.jsonDecode(v1801.removeBadgeFromInventoryAction)
        };
    end;
    if v1801.open_profile_action ~= nil then
        v1802.kind = {
            type = "open_profile_action", 
            value = v2.OpenProfileAction.jsonDecode(v1801.open_profile_action)
        };
    end;
    if v1801.openProfileAction ~= nil then
        v1802.kind = {
            type = "open_profile_action", 
            value = v2.OpenProfileAction.jsonDecode(v1801.openProfileAction)
        };
    end;
    if v1801.open_facial_age_estimation_action ~= nil then
        v1802.kind = {
            type = "open_facial_age_estimation_action", 
            value = v2.OpenFacialAgeEstimationAction.jsonDecode(v1801.open_facial_age_estimation_action)
        };
    end;
    if v1801.openFacialAgeEstimationAction ~= nil then
        v1802.kind = {
            type = "open_facial_age_estimation_action", 
            value = v2.OpenFacialAgeEstimationAction.jsonDecode(v1801.openFacialAgeEstimationAction)
        };
    end;
    if v1801.open_add_connections_page_action ~= nil then
        v1802.kind = {
            type = "open_add_connections_page_action", 
            value = v2.OpenAddConnectionsPageAction.jsonDecode(v1801.open_add_connections_page_action)
        };
    end;
    if v1801.openAddConnectionsPageAction ~= nil then
        v1802.kind = {
            type = "open_add_connections_page_action", 
            value = v2.OpenAddConnectionsPageAction.jsonDecode(v1801.openAddConnectionsPageAction)
        };
    end;
    if v1801.open_marketplace_action ~= nil then
        v1802.kind = {
            type = "open_marketplace_action", 
            value = v2.OpenMarketplaceAction.jsonDecode(v1801.open_marketplace_action)
        };
    end;
    if v1801.openMarketplaceAction ~= nil then
        v1802.kind = {
            type = "open_marketplace_action", 
            value = v2.OpenMarketplaceAction.jsonDecode(v1801.openMarketplaceAction)
        };
    end;
    if v1801.hide_profile_completion_action ~= nil then
        v1802.kind = {
            type = "hide_profile_completion_action", 
            value = v2.HideProfileCompletionAction.jsonDecode(v1801.hide_profile_completion_action)
        };
    end;
    if v1801.hideProfileCompletionAction ~= nil then
        v1802.kind = {
            type = "hide_profile_completion_action", 
            value = v2.HideProfileCompletionAction.jsonDecode(v1801.hideProfileCompletionAction)
        };
    end;
    if v1801.select_marketplace_catalog_category ~= nil then
        v1802.kind = {
            type = "select_marketplace_catalog_category", 
            value = v2.SelectMarketplaceCatalogCategory.jsonDecode(v1801.select_marketplace_catalog_category)
        };
    end;
    if v1801.selectMarketplaceCatalogCategory ~= nil then
        v1802.kind = {
            type = "select_marketplace_catalog_category", 
            value = v2.SelectMarketplaceCatalogCategory.jsonDecode(v1801.selectMarketplaceCatalogCategory)
        };
    end;
    if v1801.select_marketplace_catalog_subcategory ~= nil then
        v1802.kind = {
            type = "select_marketplace_catalog_subcategory", 
            value = v2.SelectMarketplaceCatalogSubcategory.jsonDecode(v1801.select_marketplace_catalog_subcategory)
        };
    end;
    if v1801.selectMarketplaceCatalogSubcategory ~= nil then
        v1802.kind = {
            type = "select_marketplace_catalog_subcategory", 
            value = v2.SelectMarketplaceCatalogSubcategory.jsonDecode(v1801.selectMarketplaceCatalogSubcategory)
        };
    end;
    if v1801.open_marketplace_catalog_see_all ~= nil then
        v1802.kind = {
            type = "open_marketplace_catalog_see_all", 
            value = v2.OpenMarketplaceCatalogSeeAll.jsonDecode(v1801.open_marketplace_catalog_see_all)
        };
    end;
    if v1801.openMarketplaceCatalogSeeAll ~= nil then
        v1802.kind = {
            type = "open_marketplace_catalog_see_all", 
            value = v2.OpenMarketplaceCatalogSeeAll.jsonDecode(v1801.openMarketplaceCatalogSeeAll)
        };
    end;
    if v1801.close_marketplace_category_tooltip ~= nil then
        v1802.kind = {
            type = "close_marketplace_category_tooltip", 
            value = v2.CloseMarketplaceCategoryTooltip.jsonDecode(v1801.close_marketplace_category_tooltip)
        };
    end;
    if v1801.closeMarketplaceCategoryTooltip ~= nil then
        v1802.kind = {
            type = "close_marketplace_category_tooltip", 
            value = v2.CloseMarketplaceCategoryTooltip.jsonDecode(v1801.closeMarketplaceCategoryTooltip)
        };
    end;
    if v1801.resize_marketplace_catalog ~= nil then
        v1802.kind = {
            type = "resize_marketplace_catalog", 
            value = v2.ResizeMarketplaceCatalog.jsonDecode(v1801.resize_marketplace_catalog)
        };
    end;
    if v1801.resizeMarketplaceCatalog ~= nil then
        v1802.kind = {
            type = "resize_marketplace_catalog", 
            value = v2.ResizeMarketplaceCatalog.jsonDecode(v1801.resizeMarketplaceCatalog)
        };
    end;
    if v1801.open_marketplace_catalog_filters ~= nil then
        v1802.kind = {
            type = "open_marketplace_catalog_filters", 
            value = v2.OpenMarketplaceCatalogFilters.jsonDecode(v1801.open_marketplace_catalog_filters)
        };
    end;
    if v1801.openMarketplaceCatalogFilters ~= nil then
        v1802.kind = {
            type = "open_marketplace_catalog_filters", 
            value = v2.OpenMarketplaceCatalogFilters.jsonDecode(v1801.openMarketplaceCatalogFilters)
        };
    end;
    if v1801.open_social_link_action ~= nil then
        v1802.kind = {
            type = "open_social_link_action", 
            value = v2.OpenSocialLinkAction.jsonDecode(v1801.open_social_link_action)
        };
    end;
    if v1801.openSocialLinkAction ~= nil then
        v1802.kind = {
            type = "open_social_link_action", 
            value = v2.OpenSocialLinkAction.jsonDecode(v1801.openSocialLinkAction)
        };
    end;
    if v1801.open_charts_sort_detail_action ~= nil then
        v1802.kind = {
            type = "open_charts_sort_detail_action", 
            value = v2.OpenChartsSortDetailAction.jsonDecode(v1801.open_charts_sort_detail_action)
        };
    end;
    if v1801.openChartsSortDetailAction ~= nil then
        v1802.kind = {
            type = "open_charts_sort_detail_action", 
            value = v2.OpenChartsSortDetailAction.jsonDecode(v1801.openChartsSortDetailAction)
        };
    end;
    if v1801.open_song_detail_action ~= nil then
        v1802.kind = {
            type = "open_song_detail_action", 
            value = v2.OpenSongDetailAction.jsonDecode(v1801.open_song_detail_action)
        };
    end;
    if v1801.openSongDetailAction ~= nil then
        v1802.kind = {
            type = "open_song_detail_action", 
            value = v2.OpenSongDetailAction.jsonDecode(v1801.openSongDetailAction)
        };
    end;
    if v1801.refresh_from_api_action ~= nil then
        v1802.kind = {
            type = "refresh_from_api_action", 
            value = v2.RefreshFromApiAction.jsonDecode(v1801.refresh_from_api_action)
        };
    end;
    if v1801.refreshFromApiAction ~= nil then
        v1802.kind = {
            type = "refresh_from_api_action", 
            value = v2.RefreshFromApiAction.jsonDecode(v1801.refreshFromApiAction)
        };
    end;
    if v1801.rsvp_to_event_action ~= nil then
        v1802.kind = {
            type = "rsvp_to_event_action", 
            value = v2.RsvpToEventAction.jsonDecode(v1801.rsvp_to_event_action)
        };
    end;
    if v1801.rsvpToEventAction ~= nil then
        v1802.kind = {
            type = "rsvp_to_event_action", 
            value = v2.RsvpToEventAction.jsonDecode(v1801.rsvpToEventAction)
        };
    end;
    if v1801.apply_charts_filter_action ~= nil then
        v1802.kind = {
            type = "apply_charts_filter_action", 
            value = v2.ApplyChartsFilterAction.jsonDecode(v1801.apply_charts_filter_action)
        };
    end;
    if v1801.applyChartsFilterAction ~= nil then
        v1802.kind = {
            type = "apply_charts_filter_action", 
            value = v2.ApplyChartsFilterAction.jsonDecode(v1801.applyChartsFilterAction)
        };
    end;
    if v1801.analytics_event_action ~= nil then
        v1802.kind = {
            type = "analytics_event_action", 
            value = v2.AnalyticsEventAction.jsonDecode(v1801.analytics_event_action)
        };
    end;
    if v1801.analyticsEventAction ~= nil then
        v1802.kind = {
            type = "analytics_event_action", 
            value = v2.AnalyticsEventAction.jsonDecode(v1801.analyticsEventAction)
        };
    end;
    if v1801.custom_analytics_event_action ~= nil then
        v1802.kind = {
            type = "custom_analytics_event_action", 
            value = v2.CustomAnalyticsEventAction.jsonDecode(v1801.custom_analytics_event_action)
        };
    end;
    if v1801.customAnalyticsEventAction ~= nil then
        v1802.kind = {
            type = "custom_analytics_event_action", 
            value = v2.CustomAnalyticsEventAction.jsonDecode(v1801.customAnalyticsEventAction)
        };
    end;
    if v1801.open_game_invite_action ~= nil then
        v1802.kind = {
            type = "open_game_invite_action", 
            value = v2.OpenGameInviteAction.jsonDecode(v1801.open_game_invite_action)
        };
    end;
    if v1801.openGameInviteAction ~= nil then
        v1802.kind = {
            type = "open_game_invite_action", 
            value = v2.OpenGameInviteAction.jsonDecode(v1801.openGameInviteAction)
        };
    end;
    if v1801.telemetry_handler ~= nil then
        v1802.telemetry_handler = v5.StringProp.jsonDecode(v1801.telemetry_handler);
    end;
    if v1801.telemetryHandler ~= nil then
        v1802.telemetry_handler = v5.StringProp.jsonDecode(v1801.telemetryHandler);
    end;
    return v1802;
end;
v7.descriptor = {
    name = "Action", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Action"
};
v2.Action = v7;
v1.default:register(v2.Action);
v7 = {};
v7.__index = v7;
local l_v7_72 = v7 --[[ copy: 7 -> 80 ]];
v7.new = function(v1804) --[[ Line: 13333 ]] --[[ Name: new ]]
    -- upvalues: l_v7_72 (copy)
    return (setmetatable({
        kind = if not (v1804 ~= nil) or v1804.kind == nil then nil else v1804.kind
    }, l_v7_72));
end;
v7.encode = function(v1805) --[[ Line: 13339 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1806 = buffer.create(0);
    local v1807 = 0;
    if v1805.kind ~= nil then
        if v1805.kind.type == "value" then
            local v1808 = v1805.kind.value:encode();
            local v1809, v1810 = v0.writeTag(v1806, v1807, 1, v0.wireTypes.lengthDelimited);
            v1809, v1810 = v0.writeBuffer(v1809, v1810, v1808, buffer.len(v1808));
            v1806 = v1809;
            v1807 = v1810;
        elseif v1805.kind.type == "conditional" then
            local v1811 = v1805.kind.value:encode();
            local v1812, v1813 = v0.writeTag(v1806, v1807, 2, v0.wireTypes.lengthDelimited);
            v1812, v1813 = v0.writeBuffer(v1812, v1813, v1811, buffer.len(v1811));
            v1806 = v1812;
            v1807 = v1813;
        end;
    end;
    local v1814 = buffer.create(v1807);
    buffer.copy(v1814, 0, v1806, 0, v1807);
    return v1814;
end;
v7.decode = function(v1815) --[[ Line: 13360 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_72 (copy), v0 (copy), v2 (copy)
    local v1816 = l_v7_72.new();
    local v1817 = 0;
    while v1817 < buffer.len(v1815) do
        local v1818 = nil;
        local v1819 = nil;
        local v1820, v1821, v1822 = v0.readTag(v1815, v1817);
        v1818 = v1820;
        v1819 = v1821;
        v1817 = v1822;
        if v1819 == v0.wireTypes.varint then
            v1820 = nil;
            v1821, v1822 = v0.readVarInt(v1815, v1817);
            v1820 = v1821;
            v1817 = v1822;
        elseif v1819 == v0.wireTypes.lengthDelimited then
            if v1818 == 1 then
                v1820 = nil;
                v1821, v1822 = v0.readBuffer(v1815, v1817);
                v1820 = v1821;
                v1817 = v1822;
                v1816.kind = {
                    type = "value", 
                    value = v2.Action.decode(v1820)
                };
            elseif v1818 == 2 then
                v1820 = nil;
                v1821, v1822 = v0.readBuffer(v1815, v1817);
                v1820 = v1821;
                v1817 = v1822;
                v1816.kind = {
                    type = "conditional", 
                    value = v2.ActionProp_ConditionalOptions.decode(v1820)
                };
            else
                v1820 = nil;
                v1821, v1822 = v0.readVarInt(v1815, v1817);
                v1817 = v1822 + v1821;
            end;
        elseif v1819 == v0.wireTypes.i32 then
            v1820 = nil;
            v1821, v1822 = v0.readFixed32(v1815, v1817);
            v1820 = v1821;
            v1817 = v1822;
        elseif v1819 == v0.wireTypes.i64 then
            v1820 = nil;
            v1821, v1822 = v0.readFixed64(v1815, v1817);
            v1820 = v1821;
            v1817 = v1822;
        else
            error("Unsupported wire type: " .. v1819);
        end;
    end;
    return v1816;
end;
v7.jsonEncode = function(v1823) --[[ Line: 13408 ]] --[[ Name: jsonEncode ]]
    local v1824 = {};
    if v1823.kind ~= nil then
        if v1823.kind.type == "value" then
            v1824.value = v1823.kind.value:jsonEncode();
            return v1824;
        elseif v1823.kind.type == "conditional" then
            v1824.conditional = v1823.kind.value:jsonEncode();
        end;
    end;
    return v1824;
end;
v7.jsonDecode = function(v1825) --[[ Line: 13422 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_72 (copy), v2 (copy)
    local v1826 = l_v7_72.new();
    if v1825.value ~= nil then
        v1826.kind = {
            type = "value", 
            value = v2.Action.jsonDecode(v1825.value)
        };
    end;
    if v1825.conditional ~= nil then
        v1826.kind = {
            type = "conditional", 
            value = v2.ActionProp_ConditionalOptions.jsonDecode(v1825.conditional)
        };
    end;
    return v1826;
end;
v7.descriptor = {
    name = "ActionProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ActionProp"
};
v2.ActionProp = v7;
v1.default:register(v2.ActionProp);
v7 = {};
v7.__index = v7;
local l_v7_73 = v7 --[[ copy: 7 -> 81 ]];
v7.new = function(v1828) --[[ Line: 13451 ]] --[[ Name: new ]]
    -- upvalues: l_v7_73 (copy)
    return (setmetatable({
        condition = if not (v1828 ~= nil) or v1828.condition == nil then nil else v1828.condition, 
        kind = if not (v1828 ~= nil) or v1828.kind == nil then nil else v1828.kind
    }, l_v7_73));
end;
v7.encode = function(v1829) --[[ Line: 13460 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1830 = buffer.create(0);
    local v1831 = 0;
    if v1829.condition ~= nil then
        local v1832 = v1829.condition:encode();
        local v1833, v1834 = v0.writeTag(v1830, v1831, 1, v0.wireTypes.lengthDelimited);
        v1833, v1834 = v0.writeBuffer(v1833, v1834, v1832, buffer.len(v1832));
        v1830 = v1833;
        v1831 = v1834;
    end;
    if v1829.kind ~= nil and v1829.kind.type == "value" then
        local v1835 = v1829.kind.value:encode();
        local v1836, v1837 = v0.writeTag(v1830, v1831, 3, v0.wireTypes.lengthDelimited);
        v1836, v1837 = v0.writeBuffer(v1836, v1837, v1835, buffer.len(v1835));
        v1830 = v1836;
        v1831 = v1837;
    end;
    local v1838 = buffer.create(v1831);
    buffer.copy(v1838, 0, v1830, 0, v1831);
    return v1838;
end;
v7.decode = function(v1839) --[[ Line: 13483 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_73 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v1840 = l_v7_73.new();
    local v1841 = 0;
    while v1841 < buffer.len(v1839) do
        local v1842 = nil;
        local v1843 = nil;
        local v1844, v1845, v1846 = v0.readTag(v1839, v1841);
        v1842 = v1844;
        v1843 = v1845;
        v1841 = v1846;
        if v1843 == v0.wireTypes.varint then
            v1844 = nil;
            v1845, v1846 = v0.readVarInt(v1839, v1841);
            v1844 = v1845;
            v1841 = v1846;
        elseif v1843 == v0.wireTypes.lengthDelimited then
            if v1842 == 1 then
                v1844 = nil;
                v1845, v1846 = v0.readBuffer(v1839, v1841);
                v1844 = v1845;
                v1841 = v1846;
                v1840.condition = v4.PropCondition.decode(v1844);
            elseif v1842 == 3 then
                v1844 = nil;
                v1845, v1846 = v0.readBuffer(v1839, v1841);
                v1844 = v1845;
                v1841 = v1846;
                v1840.kind = {
                    type = "value", 
                    value = v2.Action.decode(v1844)
                };
            else
                v1844 = nil;
                v1845, v1846 = v0.readVarInt(v1839, v1841);
                v1841 = v1846 + v1845;
            end;
        elseif v1843 == v0.wireTypes.i32 then
            v1844 = nil;
            v1845, v1846 = v0.readFixed32(v1839, v1841);
            v1844 = v1845;
            v1841 = v1846;
        elseif v1843 == v0.wireTypes.i64 then
            v1844 = nil;
            v1845, v1846 = v0.readFixed64(v1839, v1841);
            v1844 = v1845;
            v1841 = v1846;
        else
            error("Unsupported wire type: " .. v1843);
        end;
    end;
    return v1840;
end;
v7.jsonEncode = function(v1847) --[[ Line: 13531 ]] --[[ Name: jsonEncode ]]
    local v1848 = {};
    if v1847.condition ~= nil then
        v1848.condition = v1847.condition:jsonEncode();
    end;
    if v1847.kind ~= nil and v1847.kind.type == "value" then
        v1848.value = v1847.kind.value:jsonEncode();
    end;
    return v1848;
end;
v7.jsonDecode = function(v1849) --[[ Line: 13547 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_73 (copy), v4 (copy), v2 (copy)
    local v1850 = l_v7_73.new();
    if v1849.condition ~= nil then
        v1850.condition = v4.PropCondition.jsonDecode(v1849.condition);
    end;
    if v1849.value ~= nil then
        v1850.kind = {
            type = "value", 
            value = v2.Action.jsonDecode(v1849.value)
        };
    end;
    return v1850;
end;
v7.descriptor = {
    name = "ActionProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ActionProp_ConditionalOption = v7;
v1.default:register(v2.ActionProp_ConditionalOption);
v7 = {};
v7.__index = v7;
local l_v7_74 = v7 --[[ copy: 7 -> 82 ]];
v7.new = function(v1852) --[[ Line: 13576 ]] --[[ Name: new ]]
    -- upvalues: l_v7_74 (copy)
    return (setmetatable({
        options = if not (v1852 ~= nil) or v1852.options == nil then {} else v1852.options
    }, l_v7_74));
end;
v7.encode = function(v1853) --[[ Line: 13584 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1854 = buffer.create(0);
    local v1855 = 0;
    if v1853.options ~= nil and #v1853.options > 0 then
        for _, v1857 in v1853.options do
            local v1858 = v1857:encode();
            local v1859, v1860 = v0.writeTag(v1854, v1855, 1, v0.wireTypes.lengthDelimited);
            v1859, v1860 = v0.writeBuffer(v1859, v1860, v1858, buffer.len(v1858));
            v1854 = v1859;
            v1855 = v1860;
        end;
    end;
    local v1861 = buffer.create(v1855);
    buffer.copy(v1861, 0, v1854, 0, v1855);
    return v1861;
end;
v7.decode = function(v1862) --[[ Line: 13601 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_74 (copy), v0 (copy), v2 (copy)
    local v1863 = l_v7_74.new();
    local v1864 = 0;
    while v1864 < buffer.len(v1862) do
        local v1865 = nil;
        local v1866 = nil;
        local v1867, v1868, v1869 = v0.readTag(v1862, v1864);
        v1865 = v1867;
        v1866 = v1868;
        v1864 = v1869;
        if v1866 == v0.wireTypes.varint then
            v1867 = nil;
            v1868, v1869 = v0.readVarInt(v1862, v1864);
            v1867 = v1868;
            v1864 = v1869;
        elseif v1866 == v0.wireTypes.lengthDelimited then
            if v1865 == 1 then
                v1867 = nil;
                v1868, v1869 = v0.readBuffer(v1862, v1864);
                v1867 = v1868;
                v1864 = v1869;
                table.insert(v1863.options, v2.ActionProp_ConditionalOption.decode(v1867));
            else
                v1867 = nil;
                v1868, v1869 = v0.readVarInt(v1862, v1864);
                v1864 = v1869 + v1868;
            end;
        elseif v1866 == v0.wireTypes.i32 then
            v1867 = nil;
            v1868, v1869 = v0.readFixed32(v1862, v1864);
            v1867 = v1868;
            v1864 = v1869;
        elseif v1866 == v0.wireTypes.i64 then
            v1867 = nil;
            v1868, v1869 = v0.readFixed64(v1862, v1864);
            v1867 = v1868;
            v1864 = v1869;
        else
            error("Unsupported wire type: " .. v1866);
        end;
    end;
    return v1863;
end;
v7.jsonEncode = function(v1870) --[[ Line: 13644 ]] --[[ Name: jsonEncode ]]
    local v1871 = {};
    if v1870.options ~= nil and #v1870.options > 0 then
        local v1872 = {};
        for _, v1874 in v1870.options do
            table.insert(v1872, v1874:jsonEncode());
        end;
        v1871.options = v1872;
    end;
    return v1871;
end;
v7.jsonDecode = function(v1875) --[[ Line: 13658 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_74 (copy), v2 (copy)
    local v1876 = l_v7_74.new();
    if v1875.options ~= nil then
        local v1877 = {};
        for _, v1879 in v1875.options do
            table.insert(v1877, v2.ActionProp_ConditionalOption.jsonDecode(v1879));
        end;
        v1876.options = v1877;
    end;
    return v1876;
end;
v7.descriptor = {
    name = "ActionProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ActionProp_ConditionalOptions = v7;
v1.default:register(v2.ActionProp_ConditionalOptions);
v7 = {};
v7.__index = v7;
local l_v7_75 = v7 --[[ copy: 7 -> 83 ]];
v7.new = function(v1881) --[[ Line: 13687 ]] --[[ Name: new ]]
    -- upvalues: l_v7_75 (copy)
    return (setmetatable({
        kind = if not (v1881 ~= nil) or v1881.kind == nil then nil else v1881.kind
    }, l_v7_75));
end;
v7.encode = function(v1882) --[[ Line: 13693 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1883 = buffer.create(0);
    local v1884 = 0;
    if v1882.kind ~= nil then
        if v1882.kind.type == "value" then
            local v1885 = v1882.kind.value:encode();
            local v1886, v1887 = v0.writeTag(v1883, v1884, 1, v0.wireTypes.lengthDelimited);
            v1886, v1887 = v0.writeBuffer(v1886, v1887, v1885, buffer.len(v1885));
            v1883 = v1886;
            v1884 = v1887;
        elseif v1882.kind.type == "conditional" then
            local v1888 = v1882.kind.value:encode();
            local v1889, v1890 = v0.writeTag(v1883, v1884, 2, v0.wireTypes.lengthDelimited);
            v1889, v1890 = v0.writeBuffer(v1889, v1890, v1888, buffer.len(v1888));
            v1883 = v1889;
            v1884 = v1890;
        end;
    end;
    local v1891 = buffer.create(v1884);
    buffer.copy(v1891, 0, v1883, 0, v1884);
    return v1891;
end;
v7.decode = function(v1892) --[[ Line: 13714 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_75 (copy), v0 (copy), v2 (copy)
    local v1893 = l_v7_75.new();
    local v1894 = 0;
    while v1894 < buffer.len(v1892) do
        local v1895 = nil;
        local v1896 = nil;
        local v1897, v1898, v1899 = v0.readTag(v1892, v1894);
        v1895 = v1897;
        v1896 = v1898;
        v1894 = v1899;
        if v1896 == v0.wireTypes.varint then
            v1897 = nil;
            v1898, v1899 = v0.readVarInt(v1892, v1894);
            v1897 = v1898;
            v1894 = v1899;
        elseif v1896 == v0.wireTypes.lengthDelimited then
            if v1895 == 1 then
                v1897 = nil;
                v1898, v1899 = v0.readBuffer(v1892, v1894);
                v1897 = v1898;
                v1894 = v1899;
                v1893.kind = {
                    type = "value", 
                    value = v2.FocusNavActionsProp_FocusNavData.decode(v1897)
                };
            elseif v1895 == 2 then
                v1897 = nil;
                v1898, v1899 = v0.readBuffer(v1892, v1894);
                v1897 = v1898;
                v1894 = v1899;
                v1893.kind = {
                    type = "conditional", 
                    value = v2.FocusNavActionsProp_ConditionalOptions.decode(v1897)
                };
            else
                v1897 = nil;
                v1898, v1899 = v0.readVarInt(v1892, v1894);
                v1894 = v1899 + v1898;
            end;
        elseif v1896 == v0.wireTypes.i32 then
            v1897 = nil;
            v1898, v1899 = v0.readFixed32(v1892, v1894);
            v1897 = v1898;
            v1894 = v1899;
        elseif v1896 == v0.wireTypes.i64 then
            v1897 = nil;
            v1898, v1899 = v0.readFixed64(v1892, v1894);
            v1897 = v1898;
            v1894 = v1899;
        else
            error("Unsupported wire type: " .. v1896);
        end;
    end;
    return v1893;
end;
v7.jsonEncode = function(v1900) --[[ Line: 13763 ]] --[[ Name: jsonEncode ]]
    local v1901 = {};
    if v1900.kind ~= nil then
        if v1900.kind.type == "value" then
            v1901.value = v1900.kind.value:jsonEncode();
            return v1901;
        elseif v1900.kind.type == "conditional" then
            v1901.conditional = v1900.kind.value:jsonEncode();
        end;
    end;
    return v1901;
end;
v7.jsonDecode = function(v1902) --[[ Line: 13777 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_75 (copy), v2 (copy)
    local v1903 = l_v7_75.new();
    if v1902.value ~= nil then
        v1903.kind = {
            type = "value", 
            value = v2.FocusNavActionsProp_FocusNavData.jsonDecode(v1902.value)
        };
    end;
    if v1902.conditional ~= nil then
        v1903.kind = {
            type = "conditional", 
            value = v2.FocusNavActionsProp_ConditionalOptions.jsonDecode(v1902.conditional)
        };
    end;
    return v1903;
end;
v7.descriptor = {
    name = "FocusNavActionsProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavActionsProp"
};
v2.FocusNavActionsProp = v7;
v1.default:register(v2.FocusNavActionsProp);
v7 = {};
v7.__index = v7;
local l_v7_76 = v7 --[[ copy: 7 -> 84 ]];
v7.new = function(v1905) --[[ Line: 13808 ]] --[[ Name: new ]]
    -- upvalues: l_v7_76 (copy)
    return (setmetatable({
        condition = if not (v1905 ~= nil) or v1905.condition == nil then nil else v1905.condition, 
        kind = if not (v1905 ~= nil) or v1905.kind == nil then nil else v1905.kind
    }, l_v7_76));
end;
v7.encode = function(v1906) --[[ Line: 13817 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1907 = buffer.create(0);
    local v1908 = 0;
    if v1906.condition ~= nil then
        local v1909 = v1906.condition:encode();
        local v1910, v1911 = v0.writeTag(v1907, v1908, 1, v0.wireTypes.lengthDelimited);
        v1910, v1911 = v0.writeBuffer(v1910, v1911, v1909, buffer.len(v1909));
        v1907 = v1910;
        v1908 = v1911;
    end;
    if v1906.kind ~= nil and v1906.kind.type == "value" then
        local v1912 = v1906.kind.value:encode();
        local v1913, v1914 = v0.writeTag(v1907, v1908, 3, v0.wireTypes.lengthDelimited);
        v1913, v1914 = v0.writeBuffer(v1913, v1914, v1912, buffer.len(v1912));
        v1907 = v1913;
        v1908 = v1914;
    end;
    local v1915 = buffer.create(v1908);
    buffer.copy(v1915, 0, v1907, 0, v1908);
    return v1915;
end;
v7.decode = function(v1916) --[[ Line: 13840 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_76 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v1917 = l_v7_76.new();
    local v1918 = 0;
    while v1918 < buffer.len(v1916) do
        local v1919 = nil;
        local v1920 = nil;
        local v1921, v1922, v1923 = v0.readTag(v1916, v1918);
        v1919 = v1921;
        v1920 = v1922;
        v1918 = v1923;
        if v1920 == v0.wireTypes.varint then
            v1921 = nil;
            v1922, v1923 = v0.readVarInt(v1916, v1918);
            v1921 = v1922;
            v1918 = v1923;
        elseif v1920 == v0.wireTypes.lengthDelimited then
            if v1919 == 1 then
                v1921 = nil;
                v1922, v1923 = v0.readBuffer(v1916, v1918);
                v1921 = v1922;
                v1918 = v1923;
                v1917.condition = v4.PropCondition.decode(v1921);
            elseif v1919 == 3 then
                v1921 = nil;
                v1922, v1923 = v0.readBuffer(v1916, v1918);
                v1921 = v1922;
                v1918 = v1923;
                v1917.kind = {
                    type = "value", 
                    value = v2.FocusNavActionsProp_FocusNavData.decode(v1921)
                };
            else
                v1921 = nil;
                v1922, v1923 = v0.readVarInt(v1916, v1918);
                v1918 = v1923 + v1922;
            end;
        elseif v1920 == v0.wireTypes.i32 then
            v1921 = nil;
            v1922, v1923 = v0.readFixed32(v1916, v1918);
            v1921 = v1922;
            v1918 = v1923;
        elseif v1920 == v0.wireTypes.i64 then
            v1921 = nil;
            v1922, v1923 = v0.readFixed64(v1916, v1918);
            v1921 = v1922;
            v1918 = v1923;
        else
            error("Unsupported wire type: " .. v1920);
        end;
    end;
    return v1917;
end;
v7.jsonEncode = function(v1924) --[[ Line: 13888 ]] --[[ Name: jsonEncode ]]
    local v1925 = {};
    if v1924.condition ~= nil then
        v1925.condition = v1924.condition:jsonEncode();
    end;
    if v1924.kind ~= nil and v1924.kind.type == "value" then
        v1925.value = v1924.kind.value:jsonEncode();
    end;
    return v1925;
end;
v7.jsonDecode = function(v1926) --[[ Line: 13904 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_76 (copy), v4 (copy), v2 (copy)
    local v1927 = l_v7_76.new();
    if v1926.condition ~= nil then
        v1927.condition = v4.PropCondition.jsonDecode(v1926.condition);
    end;
    if v1926.value ~= nil then
        v1927.kind = {
            type = "value", 
            value = v2.FocusNavActionsProp_FocusNavData.jsonDecode(v1926.value)
        };
    end;
    return v1927;
end;
v7.descriptor = {
    name = "FocusNavActionsProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.FocusNavActionsProp_ConditionalOption = v7;
v1.default:register(v2.FocusNavActionsProp_ConditionalOption);
v7 = {};
v7.__index = v7;
local l_v7_77 = v7 --[[ copy: 7 -> 85 ]];
v7.new = function(v1929) --[[ Line: 13935 ]] --[[ Name: new ]]
    -- upvalues: l_v7_77 (copy)
    return (setmetatable({
        options = if not (v1929 ~= nil) or v1929.options == nil then {} else v1929.options
    }, l_v7_77));
end;
v7.encode = function(v1930) --[[ Line: 13943 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1931 = buffer.create(0);
    local v1932 = 0;
    if v1930.options ~= nil and #v1930.options > 0 then
        for _, v1934 in v1930.options do
            local v1935 = v1934:encode();
            local v1936, v1937 = v0.writeTag(v1931, v1932, 1, v0.wireTypes.lengthDelimited);
            v1936, v1937 = v0.writeBuffer(v1936, v1937, v1935, buffer.len(v1935));
            v1931 = v1936;
            v1932 = v1937;
        end;
    end;
    local v1938 = buffer.create(v1932);
    buffer.copy(v1938, 0, v1931, 0, v1932);
    return v1938;
end;
v7.decode = function(v1939) --[[ Line: 13960 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_77 (copy), v0 (copy), v2 (copy)
    local v1940 = l_v7_77.new();
    local v1941 = 0;
    while v1941 < buffer.len(v1939) do
        local v1942 = nil;
        local v1943 = nil;
        local v1944, v1945, v1946 = v0.readTag(v1939, v1941);
        v1942 = v1944;
        v1943 = v1945;
        v1941 = v1946;
        if v1943 == v0.wireTypes.varint then
            v1944 = nil;
            v1945, v1946 = v0.readVarInt(v1939, v1941);
            v1944 = v1945;
            v1941 = v1946;
        elseif v1943 == v0.wireTypes.lengthDelimited then
            if v1942 == 1 then
                v1944 = nil;
                v1945, v1946 = v0.readBuffer(v1939, v1941);
                v1944 = v1945;
                v1941 = v1946;
                table.insert(v1940.options, v2.FocusNavActionsProp_ConditionalOption.decode(v1944));
            else
                v1944 = nil;
                v1945, v1946 = v0.readVarInt(v1939, v1941);
                v1941 = v1946 + v1945;
            end;
        elseif v1943 == v0.wireTypes.i32 then
            v1944 = nil;
            v1945, v1946 = v0.readFixed32(v1939, v1941);
            v1944 = v1945;
            v1941 = v1946;
        elseif v1943 == v0.wireTypes.i64 then
            v1944 = nil;
            v1945, v1946 = v0.readFixed64(v1939, v1941);
            v1944 = v1945;
            v1941 = v1946;
        else
            error("Unsupported wire type: " .. v1943);
        end;
    end;
    return v1940;
end;
v7.jsonEncode = function(v1947) --[[ Line: 14003 ]] --[[ Name: jsonEncode ]]
    local v1948 = {};
    if v1947.options ~= nil and #v1947.options > 0 then
        local v1949 = {};
        for _, v1951 in v1947.options do
            table.insert(v1949, v1951:jsonEncode());
        end;
        v1948.options = v1949;
    end;
    return v1948;
end;
v7.jsonDecode = function(v1952) --[[ Line: 14017 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_77 (copy), v2 (copy)
    local v1953 = l_v7_77.new();
    if v1952.options ~= nil then
        local v1954 = {};
        for _, v1956 in v1952.options do
            table.insert(v1954, v2.FocusNavActionsProp_ConditionalOption.jsonDecode(v1956));
        end;
        v1953.options = v1954;
    end;
    return v1953;
end;
v7.descriptor = {
    name = "FocusNavActionsProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.FocusNavActionsProp_ConditionalOptions = v7;
v1.default:register(v2.FocusNavActionsProp_ConditionalOptions);
v7 = {};
v7.__index = v7;
local l_v7_78 = v7 --[[ copy: 7 -> 86 ]];
v7.new = function(v1958) --[[ Line: 14048 ]] --[[ Name: new ]]
    -- upvalues: l_v7_78 (copy)
    return (setmetatable({
        keys = if not (v1958 ~= nil) or v1958.keys == nil then {} else v1958.keys, 
        events = if not (v1958 ~= nil) or v1958.events == nil then {} else v1958.events
    }, l_v7_78));
end;
v7.encode = function(v1959) --[[ Line: 14057 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1960 = buffer.create(0);
    local v1961 = 0;
    if v1959.keys ~= nil and next(v1959.keys) ~= nil then
        for v1962, v1963 in v1959.keys do
            local v1964 = buffer.create(0);
            local v1965, v1966 = v0.writeTag(v1964, 0, 1, v0.wireTypes.lengthDelimited);
            v1965, v1966 = v0.writeString(v1965, v1966, v1962);
            v1965, v1966 = v0.writeTag(v1965, v1966, 2, v0.wireTypes.lengthDelimited);
            v1965, v1966 = v0.writeString(v1965, v1966, v1963);
            v1964 = v1965;
            local l_v1966_0 = v1966;
            v1965, v1966 = v0.writeTag(v1960, v1961, 1, v0.wireTypes.lengthDelimited);
            v1965, v1966 = v0.writeBuffer(v1965, v1966, v1964, l_v1966_0);
            v1960 = v1965;
            v1961 = v1966;
        end;
    end;
    if v1959.events ~= nil and next(v1959.events) ~= nil then
        for v1968, v1969 in v1959.events do
            local v1970 = buffer.create(0);
            local v1971, v1972 = v0.writeTag(v1970, 0, 1, v0.wireTypes.lengthDelimited);
            v1971, v1972 = v0.writeString(v1971, v1972, v1968);
            v1970 = v1971;
            local l_v1972_0 = v1972;
            v1971 = v1969:encode();
            local v1974;
            v1972, v1974 = v0.writeTag(v1970, l_v1972_0, 2, v0.wireTypes.lengthDelimited);
            v1972, v1974 = v0.writeBuffer(v1972, v1974, v1971, buffer.len(v1971));
            v1970 = v1972;
            l_v1972_0 = v1974;
            v1972, v1974 = v0.writeTag(v1960, v1961, 2, v0.wireTypes.lengthDelimited);
            v1972, v1974 = v0.writeBuffer(v1972, v1974, v1970, l_v1972_0);
            v1960 = v1972;
            v1961 = v1974;
        end;
    end;
    local v1975 = buffer.create(v1961);
    buffer.copy(v1975, 0, v1960, 0, v1961);
    return v1975;
end;
v7.decode = function(v1976) --[[ Line: 14093 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_78 (copy), v0 (copy), v2 (copy), v3 (copy)
    local v1977 = l_v7_78.new();
    local v1978 = 0;
    while v1978 < buffer.len(v1976) do
        local v1979 = nil;
        local v1980 = nil;
        local v1981, v1982, v1983 = v0.readTag(v1976, v1978);
        v1979 = v1981;
        v1980 = v1982;
        v1978 = v1983;
        if v1980 == v0.wireTypes.varint then
            v1981 = nil;
            v1982, v1983 = v0.readVarInt(v1976, v1978);
            v1981 = v1982;
            v1978 = v1983;
        elseif v1980 == v0.wireTypes.lengthDelimited then
            if v1979 == 1 then
                v1981 = nil;
                v1982, v1983 = v0.readBuffer(v1976, v1978);
                v1981 = v1982;
                v1978 = v1983;
                v1982 = v2.FocusNavActionsProp_FocusNavData_KeysEntry.decode(v1981);
                v1977.keys[v1982.key or ""] = v1982.value or "";
            elseif v1979 == 2 then
                v1981 = nil;
                v1982, v1983 = v0.readBuffer(v1976, v1978);
                v1981 = v1982;
                v1978 = v1983;
                v1982 = v2.FocusNavActionsProp_FocusNavData_EventsEntry.decode(v1981);
                v1983 = v3.Struct.new();
                v1977.events[v1982.key or ""] = v1982.value or v1983;
            else
                v1981 = nil;
                v1982, v1983 = v0.readVarInt(v1976, v1978);
                v1978 = v1983 + v1982;
            end;
        elseif v1980 == v0.wireTypes.i32 then
            v1981 = nil;
            v1982, v1983 = v0.readFixed32(v1976, v1978);
            v1981 = v1982;
            v1978 = v1983;
        elseif v1980 == v0.wireTypes.i64 then
            v1981 = nil;
            v1982, v1983 = v0.readFixed64(v1976, v1978);
            v1981 = v1982;
            v1978 = v1983;
        else
            error("Unsupported wire type: " .. v1980);
        end;
    end;
    return v1977;
end;
v7.jsonEncode = function(v1984) --[[ Line: 14155 ]] --[[ Name: jsonEncode ]]
    local v1985 = {};
    if v1984.keys ~= nil and next(v1984.keys) ~= nil then
        local v1986 = {};
        for v1987, v1988 in v1984.keys do
            v1986[v1987] = v1988;
        end;
        v1985.keys = v1986;
    end;
    if v1984.events ~= nil and next(v1984.events) ~= nil then
        local v1989 = {};
        for v1990, v1991 in v1984.events do
            v1989[v1990] = v1991:jsonEncode();
        end;
        v1985.events = v1989;
    end;
    return v1985;
end;
v7.jsonDecode = function(v1992) --[[ Line: 14177 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_78 (copy), v3 (copy)
    local v1993 = l_v7_78.new();
    if v1992.keys ~= nil then
        local v1994 = {};
        for v1995, v1996 in v1992.keys do
            v1994[v1995] = v1996;
        end;
        v1993.keys = v1994;
    end;
    if v1992.events ~= nil then
        local v1997 = {};
        for v1998, v1999 in v1992.events do
            v1997[v1998] = v3.Struct.jsonDecode(v1999);
        end;
        v1993.events = v1997;
    end;
    return v1993;
end;
v7.descriptor = {
    name = "FocusNavActionsProp_FocusNavData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavData"
};
v2.FocusNavActionsProp_FocusNavData = v7;
v1.default:register(v2.FocusNavActionsProp_FocusNavData);
v7 = {};
v7.__index = v7;
local l_v7_79 = v7 --[[ copy: 7 -> 87 ]];
v7.new = function(v2001) --[[ Line: 14217 ]] --[[ Name: new ]]
    -- upvalues: l_v7_79 (copy)
    return (setmetatable({
        key = (not (v2001 ~= nil) or v2001.key == nil) and "" or v2001.key, 
        value = (not (v2001 ~= nil) or v2001.value == nil) and "" or v2001.value
    }, l_v7_79));
end;
v7.encode = function(v2002) --[[ Line: 14226 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2003 = buffer.create(0);
    local v2004 = 0;
    if v2002.key ~= nil and v2002.key ~= "" then
        local v2005, v2006 = v0.writeTag(v2003, v2004, 1, v0.wireTypes.lengthDelimited);
        v2005, v2006 = v0.writeString(v2005, v2006, v2002.key);
        v2003 = v2005;
        v2004 = v2006;
    end;
    if v2002.value ~= nil and v2002.value ~= "" then
        local v2007, v2008 = v0.writeTag(v2003, v2004, 2, v0.wireTypes.lengthDelimited);
        v2007, v2008 = v0.writeString(v2007, v2008, v2002.value);
        v2003 = v2007;
        v2004 = v2008;
    end;
    local v2009 = buffer.create(v2004);
    buffer.copy(v2009, 0, v2003, 0, v2004);
    return v2009;
end;
v7.decode = function(v2010) --[[ Line: 14247 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_79 (copy), v0 (copy)
    local v2011 = l_v7_79.new();
    local v2012 = 0;
    while v2012 < buffer.len(v2010) do
        local v2013 = nil;
        local v2014 = nil;
        local v2015, v2016, v2017 = v0.readTag(v2010, v2012);
        v2013 = v2015;
        v2014 = v2016;
        v2012 = v2017;
        if v2014 == v0.wireTypes.varint then
            v2015 = nil;
            v2016, v2017 = v0.readVarInt(v2010, v2012);
            v2015 = v2016;
            v2012 = v2017;
        elseif v2014 == v0.wireTypes.lengthDelimited then
            if v2013 == 1 then
                v2015 = nil;
                v2016, v2017 = v0.readBuffer(v2010, v2012);
                v2015 = v2016;
                v2012 = v2017;
                v2011.key = buffer.tostring(v2015);
            elseif v2013 == 2 then
                v2015 = nil;
                v2016, v2017 = v0.readBuffer(v2010, v2012);
                v2015 = v2016;
                v2012 = v2017;
                v2011.value = buffer.tostring(v2015);
            else
                v2015 = nil;
                v2016, v2017 = v0.readVarInt(v2010, v2012);
                v2012 = v2017 + v2016;
            end;
        elseif v2014 == v0.wireTypes.i32 then
            v2015 = nil;
            v2016, v2017 = v0.readFixed32(v2010, v2012);
            v2015 = v2016;
            v2012 = v2017;
        elseif v2014 == v0.wireTypes.i64 then
            v2015 = nil;
            v2016, v2017 = v0.readFixed64(v2010, v2012);
            v2015 = v2016;
            v2012 = v2017;
        else
            error("Unsupported wire type: " .. v2014);
        end;
    end;
    return v2011;
end;
v7.jsonEncode = function(v2018) --[[ Line: 14297 ]] --[[ Name: jsonEncode ]]
    local v2019 = {};
    if v2018.key ~= nil and v2018.key ~= "" then
        v2019.key = v2018.key;
    end;
    if v2018.value ~= nil and v2018.value ~= "" then
        v2019.value = v2018.value;
    end;
    return v2019;
end;
v7.jsonDecode = function(v2020) --[[ Line: 14313 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_79 (copy)
    local v2021 = l_v7_79.new();
    if v2020.key ~= nil then
        v2021.key = v2020.key;
    end;
    if v2020.value ~= nil then
        v2021.value = v2020.value;
    end;
    return v2021;
end;
v7.descriptor = {
    name = "FocusNavActionsProp_FocusNavData_KeysEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.KeysEntry"
};
v2.FocusNavActionsProp_FocusNavData_KeysEntry = v7;
v1.default:register(v2.FocusNavActionsProp_FocusNavData_KeysEntry);
v7 = {};
v7.__index = v7;
v7.new = function(v2022) --[[ Line: 14343 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({
        key = (not (v2022 ~= nil) or v2022.key == nil) and "" or v2022.key, 
        value = if not (v2022 ~= nil) or v2022.value == nil then nil else v2022.value
    }, v7));
end;
v7.encode = function(v2023) --[[ Line: 14352 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2024 = buffer.create(0);
    local v2025 = 0;
    if v2023.key ~= nil and v2023.key ~= "" then
        local v2026, v2027 = v0.writeTag(v2024, v2025, 1, v0.wireTypes.lengthDelimited);
        v2026, v2027 = v0.writeString(v2026, v2027, v2023.key);
        v2024 = v2026;
        v2025 = v2027;
    end;
    if v2023.value ~= nil then
        local v2028 = v2023.value:encode();
        local v2029, v2030 = v0.writeTag(v2024, v2025, 2, v0.wireTypes.lengthDelimited);
        v2029, v2030 = v0.writeBuffer(v2029, v2030, v2028, buffer.len(v2028));
        v2024 = v2029;
        v2025 = v2030;
    end;
    local v2031 = buffer.create(v2025);
    buffer.copy(v2031, 0, v2024, 0, v2025);
    return v2031;
end;
v7.decode = function(v2032) --[[ Line: 14374 ]] --[[ Name: decode ]]
    -- upvalues: v7 (copy), v0 (copy), v3 (copy)
    local v2033 = v7.new();
    local v2034 = 0;
    while v2034 < buffer.len(v2032) do
        local v2035 = nil;
        local v2036 = nil;
        local v2037, v2038, v2039 = v0.readTag(v2032, v2034);
        v2035 = v2037;
        v2036 = v2038;
        v2034 = v2039;
        if v2036 == v0.wireTypes.varint then
            v2037 = nil;
            v2038, v2039 = v0.readVarInt(v2032, v2034);
            v2037 = v2038;
            v2034 = v2039;
        elseif v2036 == v0.wireTypes.lengthDelimited then
            if v2035 == 1 then
                v2037 = nil;
                v2038, v2039 = v0.readBuffer(v2032, v2034);
                v2037 = v2038;
                v2034 = v2039;
                v2033.key = buffer.tostring(v2037);
            elseif v2035 == 2 then
                v2037 = nil;
                v2038, v2039 = v0.readBuffer(v2032, v2034);
                v2037 = v2038;
                v2034 = v2039;
                v2033.value = v3.Struct.decode(v2037);
            else
                v2037 = nil;
                v2038, v2039 = v0.readVarInt(v2032, v2034);
                v2034 = v2039 + v2038;
            end;
        elseif v2036 == v0.wireTypes.i32 then
            v2037 = nil;
            v2038, v2039 = v0.readFixed32(v2032, v2034);
            v2037 = v2038;
            v2034 = v2039;
        elseif v2036 == v0.wireTypes.i64 then
            v2037 = nil;
            v2038, v2039 = v0.readFixed64(v2032, v2034);
            v2037 = v2038;
            v2034 = v2039;
        else
            error("Unsupported wire type: " .. v2036);
        end;
    end;
    return v2033;
end;
v7.jsonEncode = function(v2040) --[[ Line: 14424 ]] --[[ Name: jsonEncode ]]
    local v2041 = {};
    if v2040.key ~= nil and v2040.key ~= "" then
        v2041.key = v2040.key;
    end;
    if v2040.value ~= nil then
        v2041.value = v2040.value:jsonEncode();
    end;
    return v2041;
end;
v7.jsonDecode = function(v2042) --[[ Line: 14440 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v7 (copy), v3 (copy)
    local v2043 = v7.new();
    if v2042.key ~= nil then
        v2043.key = v2042.key;
    end;
    if v2042.value ~= nil then
        v2043.value = v3.Struct.jsonDecode(v2042.value);
    end;
    return v2043;
end;
v7.descriptor = {
    name = "FocusNavActionsProp_FocusNavData_EventsEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventsEntry"
};
v2.FocusNavActionsProp_FocusNavData_EventsEntry = v7;
v1.default:register(v2.FocusNavActionsProp_FocusNavData_EventsEntry);
v2.ActionType = {
    fromNumber = function(v2044) --[[ Line: 14467 ]] --[[ Name: fromNumber ]]
        if v2044 == 0 then
            return "ACTION_TYPE_INVALID";
        elseif v2044 == 1 then
            return "ACTION_TYPE_DISMISS_DIALOG";
        elseif v2044 == 2 then
            return "ACTION_TYPE_LINK";
        elseif v2044 == 3 then
            return "ACTION_TYPE_OPEN_GAME_DETAILS";
        elseif v2044 == 4 then
            return "ACTION_TYPE_OPEN_JOIN_FRIENDS";
        elseif v2044 == 5 then
            return "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON";
        elseif v2044 == 6 then
            return "ACTION_TYPE_OPEN_SEE_ALL";
        elseif v2044 == 7 then
            return "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP";
        elseif v2044 == 8 then
            return "ACTION_TYPE_PLAY_BUTTON_CLICK";
        elseif v2044 == 9 then
            return "ACTION_TYPE_UPDATE_USER_SETTINGS";
        elseif v2044 == 10 then
            return "ACTION_TYPE_OPEN_TOOLTIP";
        elseif v2044 == 11 then
            return "ACTION_TYPE_OPEN_BADGE_DETAILS";
        elseif v2044 == 12 then
            return "ACTION_TYPE_LOAD_MORE_FROM_API";
        elseif v2044 == 13 then
            return "ACTION_TYPE_SHARE";
        elseif v2044 == 14 then
            return "ACTION_TYPE_OPEN_ABUSE_REPORT";
        elseif v2044 == 15 then
            return "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY";
        elseif v2044 == 16 then
            return "ACTION_TYPE_OPEN_PROFILE";
        elseif v2044 == 17 then
            return "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION";
        elseif v2044 == 18 then
            return "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE";
        elseif v2044 == 19 then
            return "ACTION_TYPE_OPEN_MARKETPLACE";
        elseif v2044 == 20 then
            return "ACTION_TYPE_HIDE_PROFILE_COMPLETION";
        elseif v2044 == 21 then
            return "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY";
        elseif v2044 == 22 then
            return "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY";
        elseif v2044 == 23 then
            return "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL";
        elseif v2044 == 24 then
            return "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP";
        elseif v2044 == 25 then
            return "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG";
        elseif v2044 == 26 then
            return "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS";
        elseif v2044 == 27 then
            return "ACTION_TYPE_OPEN_SOCIAL_LINK";
        elseif v2044 == 28 then
            return "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL";
        elseif v2044 == 29 then
            return "ACTION_TYPE_OPEN_SONG_DETAIL";
        elseif v2044 == 30 then
            return "ACTION_TYPE_REFRESH_FROM_API";
        elseif v2044 == 31 then
            return "ACTION_TYPE_RSVP_TO_EVENT";
        elseif v2044 == 32 then
            return "ACTION_TYPE_APPLY_CHARTS_FILTER";
        elseif v2044 == 33 then
            return "ACTION_TYPE_ANALYTICS_EVENT";
        elseif v2044 == 34 then
            return "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT";
        elseif v2044 == 35 then
            return "ACTION_TYPE_OPEN_GAME_INVITE";
        else
            return nil;
        end;
    end, 
    toNumber = function(v2045) --[[ Line: 14545 ]] --[[ Name: toNumber ]]
        if v2045 == "ACTION_TYPE_INVALID" then
            return 0;
        elseif v2045 == "ACTION_TYPE_DISMISS_DIALOG" then
            return 1;
        elseif v2045 == "ACTION_TYPE_LINK" then
            return 2;
        elseif v2045 == "ACTION_TYPE_OPEN_GAME_DETAILS" then
            return 3;
        elseif v2045 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then
            return 4;
        elseif v2045 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then
            return 5;
        elseif v2045 == "ACTION_TYPE_OPEN_SEE_ALL" then
            return 6;
        elseif v2045 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then
            return 7;
        elseif v2045 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then
            return 8;
        elseif v2045 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then
            return 9;
        elseif v2045 == "ACTION_TYPE_OPEN_TOOLTIP" then
            return 10;
        elseif v2045 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then
            return 11;
        elseif v2045 == "ACTION_TYPE_LOAD_MORE_FROM_API" then
            return 12;
        elseif v2045 == "ACTION_TYPE_SHARE" then
            return 13;
        elseif v2045 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then
            return 14;
        elseif v2045 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then
            return 15;
        elseif v2045 == "ACTION_TYPE_OPEN_PROFILE" then
            return 16;
        elseif v2045 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then
            return 17;
        elseif v2045 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then
            return 18;
        elseif v2045 == "ACTION_TYPE_OPEN_MARKETPLACE" then
            return 19;
        elseif v2045 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then
            return 20;
        elseif v2045 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then
            return 21;
        elseif v2045 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then
            return 22;
        elseif v2045 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then
            return 23;
        elseif v2045 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then
            return 24;
        elseif v2045 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then
            return 25;
        elseif v2045 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then
            return 26;
        elseif v2045 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then
            return 27;
        elseif v2045 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then
            return 28;
        elseif v2045 == "ACTION_TYPE_OPEN_SONG_DETAIL" then
            return 29;
        elseif v2045 == "ACTION_TYPE_REFRESH_FROM_API" then
            return 30;
        elseif v2045 == "ACTION_TYPE_RSVP_TO_EVENT" then
            return 31;
        elseif v2045 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then
            return 32;
        elseif v2045 == "ACTION_TYPE_ANALYTICS_EVENT" then
            return 33;
        elseif v2045 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then
            return 34;
        elseif v2045 == "ACTION_TYPE_OPEN_GAME_INVITE" then
            return 35;
        else
            return v2045;
        end;
    end, 
    fromName = function(v2046) --[[ Line: 14623 ]] --[[ Name: fromName ]]
        if v2046 == "ACTION_TYPE_INVALID" then
            return "ACTION_TYPE_INVALID";
        elseif v2046 == "ACTION_TYPE_DISMISS_DIALOG" then
            return "ACTION_TYPE_DISMISS_DIALOG";
        elseif v2046 == "ACTION_TYPE_LINK" then
            return "ACTION_TYPE_LINK";
        elseif v2046 == "ACTION_TYPE_OPEN_GAME_DETAILS" then
            return "ACTION_TYPE_OPEN_GAME_DETAILS";
        elseif v2046 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then
            return "ACTION_TYPE_OPEN_JOIN_FRIENDS";
        elseif v2046 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then
            return "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON";
        elseif v2046 == "ACTION_TYPE_OPEN_SEE_ALL" then
            return "ACTION_TYPE_OPEN_SEE_ALL";
        elseif v2046 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then
            return "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP";
        elseif v2046 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then
            return "ACTION_TYPE_PLAY_BUTTON_CLICK";
        elseif v2046 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then
            return "ACTION_TYPE_UPDATE_USER_SETTINGS";
        elseif v2046 == "ACTION_TYPE_OPEN_TOOLTIP" then
            return "ACTION_TYPE_OPEN_TOOLTIP";
        elseif v2046 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then
            return "ACTION_TYPE_OPEN_BADGE_DETAILS";
        elseif v2046 == "ACTION_TYPE_LOAD_MORE_FROM_API" then
            return "ACTION_TYPE_LOAD_MORE_FROM_API";
        elseif v2046 == "ACTION_TYPE_SHARE" then
            return "ACTION_TYPE_SHARE";
        elseif v2046 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then
            return "ACTION_TYPE_OPEN_ABUSE_REPORT";
        elseif v2046 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then
            return "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY";
        elseif v2046 == "ACTION_TYPE_OPEN_PROFILE" then
            return "ACTION_TYPE_OPEN_PROFILE";
        elseif v2046 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then
            return "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION";
        elseif v2046 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then
            return "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE";
        elseif v2046 == "ACTION_TYPE_OPEN_MARKETPLACE" then
            return "ACTION_TYPE_OPEN_MARKETPLACE";
        elseif v2046 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then
            return "ACTION_TYPE_HIDE_PROFILE_COMPLETION";
        elseif v2046 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then
            return "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY";
        elseif v2046 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then
            return "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY";
        elseif v2046 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then
            return "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL";
        elseif v2046 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then
            return "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP";
        elseif v2046 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then
            return "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG";
        elseif v2046 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then
            return "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS";
        elseif v2046 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then
            return "ACTION_TYPE_OPEN_SOCIAL_LINK";
        elseif v2046 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then
            return "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL";
        elseif v2046 == "ACTION_TYPE_OPEN_SONG_DETAIL" then
            return "ACTION_TYPE_OPEN_SONG_DETAIL";
        elseif v2046 == "ACTION_TYPE_REFRESH_FROM_API" then
            return "ACTION_TYPE_REFRESH_FROM_API";
        elseif v2046 == "ACTION_TYPE_RSVP_TO_EVENT" then
            return "ACTION_TYPE_RSVP_TO_EVENT";
        elseif v2046 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then
            return "ACTION_TYPE_APPLY_CHARTS_FILTER";
        elseif v2046 == "ACTION_TYPE_ANALYTICS_EVENT" then
            return "ACTION_TYPE_ANALYTICS_EVENT";
        elseif v2046 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then
            return "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT";
        elseif v2046 == "ACTION_TYPE_OPEN_GAME_INVITE" then
            return "ACTION_TYPE_OPEN_GAME_INVITE";
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
    OpenChartsSortDetailAction = v2.OpenChartsSortDetailAction, 
    OpenChartsSortDetailAction_Params = v2.OpenChartsSortDetailAction_Params, 
    OpenSongDetailAction = v2.OpenSongDetailAction, 
    OpenSongDetailAction_Params = v2.OpenSongDetailAction_Params, 
    OpenMarketplaceCatalogFilters = v2.OpenMarketplaceCatalogFilters, 
    OpenMarketplaceCatalogFilters_Params = v2.OpenMarketplaceCatalogFilters_Params, 
    RefreshFromApiAction = v2.RefreshFromApiAction, 
    RefreshFromApiAction_Params = v2.RefreshFromApiAction_Params, 
    RsvpToEventAction = v2.RsvpToEventAction, 
    RsvpToEventAction_Params = v2.RsvpToEventAction_Params, 
    ApplyChartsFilterAction = v2.ApplyChartsFilterAction, 
    ApplyChartsFilterAction_Params = v2.ApplyChartsFilterAction_Params, 
    AnalyticsEventAction = v2.AnalyticsEventAction, 
    AnalyticsEventAction_Params = v2.AnalyticsEventAction_Params, 
    CustomAnalyticsEventAction = v2.CustomAnalyticsEventAction, 
    CustomAnalyticsEventAction_Params = v2.CustomAnalyticsEventAction_Params, 
    OpenGameInviteAction = v2.OpenGameInviteAction, 
    OpenGameInviteAction_Params = v2.OpenGameInviteAction_Params, 
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