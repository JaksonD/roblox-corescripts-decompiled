local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_condition);
local v4 = require(script.Parent.prop_types);
local v5 = {};
v5.__index = v5;
local l_v5_0 = v5 --[[ copy: 5 -> 6 ]];
v5.new = function(v7) --[[ Line: 434 ]] --[[ Name: new ]]
    -- upvalues: l_v5_0 (copy)
    return (setmetatable({
        content_type = if not (v7 ~= nil) or v7.content_type == nil then nil else v7.content_type
    }, l_v5_0));
end;
v5.encode = function(v8) --[[ Line: 440 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v9 = buffer.create(0);
    local v10 = 0;
    if v8.content_type ~= nil then
        local v11 = v8.content_type:encode();
        local v12, v13 = v0.writeTag(v9, v10, 1, v0.wireTypes.lengthDelimited);
        v12, v13 = v0.writeBuffer(v12, v13, v11, buffer.len(v11));
        v9 = v12;
        v10 = v13;
    end;
    local v14 = buffer.create(v10);
    buffer.copy(v14, 0, v9, 0, v10);
    return v14;
end;
v5.decode = function(v15) --[[ Line: 455 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_0 (copy), v0 (copy), v4 (copy)
    local v16 = l_v5_0.new();
    local v17 = 0;
    while v17 < buffer.len(v15) do
        local v18 = nil;
        local v19 = nil;
        local v20, v21, v22 = v0.readTag(v15, v17);
        v18 = v20;
        v19 = v21;
        v17 = v22;
        if v19 == v0.wireTypes.varint then
            v20 = nil;
            v21, v22 = v0.readVarInt(v15, v17);
            v20 = v21;
            v17 = v22;
        elseif v19 == v0.wireTypes.lengthDelimited then
            if v18 == 1 then
                v20 = nil;
                v21, v22 = v0.readBuffer(v15, v17);
                v20 = v21;
                v17 = v22;
                v16.content_type = v4.StringProp.decode(v20);
            else
                v20 = nil;
                v21, v22 = v0.readVarInt(v15, v17);
                v17 = v22 + v21;
            end;
        elseif v19 == v0.wireTypes.i32 then
            v20 = nil;
            v21, v22 = v0.readFixed32(v15, v17);
            v20 = v21;
            v17 = v22;
        elseif v19 == v0.wireTypes.i64 then
            v20 = nil;
            v21, v22 = v0.readFixed64(v15, v17);
            v20 = v21;
            v17 = v22;
        else
            error("Unsupported wire type: " .. v19);
        end;
    end;
    return v16;
end;
v5.jsonEncode = function(v23) --[[ Line: 498 ]] --[[ Name: jsonEncode ]]
    local v24 = {};
    if v23.content_type ~= nil then
        v24.contentType = v23.content_type:jsonEncode();
    end;
    return v24;
end;
v5.jsonDecode = function(v25) --[[ Line: 508 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_0 (copy), v4 (copy)
    local v26 = l_v5_0.new();
    if v25.content_type ~= nil then
        v26.content_type = v4.StringProp.jsonDecode(v25.content_type);
    end;
    if v25.contentType ~= nil then
        v26.content_type = v4.StringProp.jsonDecode(v25.contentType);
    end;
    return v26;
end;
v5.descriptor = {
    name = "ItemFooter", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ItemFooter"
};
v2.ItemFooter = v5;
v1.default:register(v2.ItemFooter);
v5 = {};
v5.__index = v5;
local l_v5_1 = v5 --[[ copy: 5 -> 7 ]];
v5.new = function(v28) --[[ Line: 538 ]] --[[ Name: new ]]
    -- upvalues: l_v5_1 (copy)
    return (setmetatable({
        kind = if not (v28 ~= nil) or v28.kind == nil then nil else v28.kind
    }, l_v5_1));
end;
v5.encode = function(v29) --[[ Line: 544 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v30 = buffer.create(0);
    local v31 = 0;
    if v29.kind ~= nil then
        if v29.kind.type == "literal" then
            local v32 = v29.kind.value:encode();
            local v33, v34 = v0.writeTag(v30, v31, 1, v0.wireTypes.lengthDelimited);
            v33, v34 = v0.writeBuffer(v33, v34, v32, buffer.len(v32));
            v30 = v33;
            v31 = v34;
        elseif v29.kind.type == "binding_path" then
            local v35, v36 = v0.writeTag(v30, v31, 2, v0.wireTypes.lengthDelimited);
            v35, v36 = v0.writeString(v35, v36, v29.kind.value);
            v30 = v35;
            v31 = v36;
        elseif v29.kind.type == "conditional" then
            local v37 = v29.kind.value:encode();
            local v38, v39 = v0.writeTag(v30, v31, 3, v0.wireTypes.lengthDelimited);
            v38, v39 = v0.writeBuffer(v38, v39, v37, buffer.len(v37));
            v30 = v38;
            v31 = v39;
        end;
    end;
    local v40 = buffer.create(v31);
    buffer.copy(v40, 0, v30, 0, v31);
    return v40;
end;
v5.decode = function(v41) --[[ Line: 568 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_1 (copy), v0 (copy), v2 (copy)
    local v42 = l_v5_1.new();
    local v43 = 0;
    while v43 < buffer.len(v41) do
        local v44 = nil;
        local v45 = nil;
        local v46, v47, v48 = v0.readTag(v41, v43);
        v44 = v46;
        v45 = v47;
        v43 = v48;
        if v45 == v0.wireTypes.varint then
            v46 = nil;
            v47, v48 = v0.readVarInt(v41, v43);
            v46 = v47;
            v43 = v48;
        elseif v45 == v0.wireTypes.lengthDelimited then
            if v44 == 1 then
                v46 = nil;
                v47, v48 = v0.readBuffer(v41, v43);
                v46 = v47;
                v43 = v48;
                v42.kind = {
                    type = "literal", 
                    value = v2.ArrayOfItemFooterProp_ArrayOfItemFooter.decode(v46)
                };
            elseif v44 == 2 then
                v46 = nil;
                v47, v48 = v0.readBuffer(v41, v43);
                v46 = v47;
                v43 = v48;
                v42.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v46)
                };
            elseif v44 == 3 then
                v46 = nil;
                v47, v48 = v0.readBuffer(v41, v43);
                v46 = v47;
                v43 = v48;
                v42.kind = {
                    type = "conditional", 
                    value = v2.ArrayOfItemFooterProp_ConditionalOptions.decode(v46)
                };
            else
                v46 = nil;
                v47, v48 = v0.readVarInt(v41, v43);
                v43 = v48 + v47;
            end;
        elseif v45 == v0.wireTypes.i32 then
            v46 = nil;
            v47, v48 = v0.readFixed32(v41, v43);
            v46 = v47;
            v43 = v48;
        elseif v45 == v0.wireTypes.i64 then
            v46 = nil;
            v47, v48 = v0.readFixed64(v41, v43);
            v46 = v47;
            v43 = v48;
        else
            error("Unsupported wire type: " .. v45);
        end;
    end;
    return v42;
end;
v5.jsonEncode = function(v49) --[[ Line: 625 ]] --[[ Name: jsonEncode ]]
    local v50 = {};
    if v49.kind ~= nil then
        if v49.kind.type == "literal" then
            v50.literal = v49.kind.value:jsonEncode();
            return v50;
        elseif v49.kind.type == "binding_path" then
            v50.bindingPath = v49.kind.value;
            return v50;
        elseif v49.kind.type == "conditional" then
            v50.conditional = v49.kind.value:jsonEncode();
        end;
    end;
    return v50;
end;
v5.jsonDecode = function(v51) --[[ Line: 641 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_1 (copy), v2 (copy)
    local v52 = l_v5_1.new();
    if v51.literal ~= nil then
        v52.kind = {
            type = "literal", 
            value = v2.ArrayOfItemFooterProp_ArrayOfItemFooter.jsonDecode(v51.literal)
        };
    end;
    if v51.binding_path ~= nil then
        v52.kind = {
            type = "binding_path", 
            value = v51.binding_path
        };
    end;
    if v51.bindingPath ~= nil then
        v52.kind = {
            type = "binding_path", 
            value = v51.bindingPath
        };
    end;
    if v51.conditional ~= nil then
        v52.kind = {
            type = "conditional", 
            value = v2.ArrayOfItemFooterProp_ConditionalOptions.jsonDecode(v51.conditional)
        };
    end;
    return v52;
end;
v5.descriptor = {
    name = "ArrayOfItemFooterProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfItemFooterProp"
};
v2.ArrayOfItemFooterProp = v5;
v1.default:register(v2.ArrayOfItemFooterProp);
v5 = {};
v5.__index = v5;
local l_v5_2 = v5 --[[ copy: 5 -> 8 ]];
v5.new = function(v54) --[[ Line: 681 ]] --[[ Name: new ]]
    -- upvalues: l_v5_2 (copy)
    return (setmetatable({
        condition = if not (v54 ~= nil) or v54.condition == nil then nil else v54.condition, 
        kind = if not (v54 ~= nil) or v54.kind == nil then nil else v54.kind
    }, l_v5_2));
end;
v5.encode = function(v55) --[[ Line: 690 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v56 = buffer.create(0);
    local v57 = 0;
    if v55.condition ~= nil then
        local v58 = v55.condition:encode();
        local v59, v60 = v0.writeTag(v56, v57, 1, v0.wireTypes.lengthDelimited);
        v59, v60 = v0.writeBuffer(v59, v60, v58, buffer.len(v58));
        v56 = v59;
        v57 = v60;
    end;
    if v55.kind ~= nil then
        if v55.kind.type == "literal" then
            local v61 = v55.kind.value:encode();
            local v62, v63 = v0.writeTag(v56, v57, 2, v0.wireTypes.lengthDelimited);
            v62, v63 = v0.writeBuffer(v62, v63, v61, buffer.len(v61));
            v56 = v62;
            v57 = v63;
        elseif v55.kind.type == "binding_path" then
            local v64, v65 = v0.writeTag(v56, v57, 3, v0.wireTypes.lengthDelimited);
            v64, v65 = v0.writeString(v64, v65, v55.kind.value);
            v56 = v64;
            v57 = v65;
        end;
    end;
    local v66 = buffer.create(v57);
    buffer.copy(v66, 0, v56, 0, v57);
    return v66;
end;
v5.decode = function(v67) --[[ Line: 716 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_2 (copy), v0 (copy), v3 (copy), v2 (copy)
    local v68 = l_v5_2.new();
    local v69 = 0;
    while v69 < buffer.len(v67) do
        local v70 = nil;
        local v71 = nil;
        local v72, v73, v74 = v0.readTag(v67, v69);
        v70 = v72;
        v71 = v73;
        v69 = v74;
        if v71 == v0.wireTypes.varint then
            v72 = nil;
            v73, v74 = v0.readVarInt(v67, v69);
            v72 = v73;
            v69 = v74;
        elseif v71 == v0.wireTypes.lengthDelimited then
            if v70 == 1 then
                v72 = nil;
                v73, v74 = v0.readBuffer(v67, v69);
                v72 = v73;
                v69 = v74;
                v68.condition = v3.PropCondition.decode(v72);
            elseif v70 == 2 then
                v72 = nil;
                v73, v74 = v0.readBuffer(v67, v69);
                v72 = v73;
                v69 = v74;
                v68.kind = {
                    type = "literal", 
                    value = v2.ArrayOfItemFooterProp_ArrayOfItemFooter.decode(v72)
                };
            elseif v70 == 3 then
                v72 = nil;
                v73, v74 = v0.readBuffer(v67, v69);
                v72 = v73;
                v69 = v74;
                v68.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v72)
                };
            else
                v72 = nil;
                v73, v74 = v0.readVarInt(v67, v69);
                v69 = v74 + v73;
            end;
        elseif v71 == v0.wireTypes.i32 then
            v72 = nil;
            v73, v74 = v0.readFixed32(v67, v69);
            v72 = v73;
            v69 = v74;
        elseif v71 == v0.wireTypes.i64 then
            v72 = nil;
            v73, v74 = v0.readFixed64(v67, v69);
            v72 = v73;
            v69 = v74;
        else
            error("Unsupported wire type: " .. v71);
        end;
    end;
    return v68;
end;
v5.jsonEncode = function(v75) --[[ Line: 770 ]] --[[ Name: jsonEncode ]]
    local v76 = {};
    if v75.condition ~= nil then
        v76.condition = v75.condition:jsonEncode();
    end;
    if v75.kind ~= nil then
        if v75.kind.type == "literal" then
            v76.literal = v75.kind.value:jsonEncode();
            return v76;
        elseif v75.kind.type == "binding_path" then
            v76.bindingPath = v75.kind.value;
        end;
    end;
    return v76;
end;
v5.jsonDecode = function(v77) --[[ Line: 788 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_2 (copy), v3 (copy), v2 (copy)
    local v78 = l_v5_2.new();
    if v77.condition ~= nil then
        v78.condition = v3.PropCondition.jsonDecode(v77.condition);
    end;
    if v77.literal ~= nil then
        v78.kind = {
            type = "literal", 
            value = v2.ArrayOfItemFooterProp_ArrayOfItemFooter.jsonDecode(v77.literal)
        };
    end;
    if v77.binding_path ~= nil then
        v78.kind = {
            type = "binding_path", 
            value = v77.binding_path
        };
    end;
    if v77.bindingPath ~= nil then
        v78.kind = {
            type = "binding_path", 
            value = v77.bindingPath
        };
    end;
    return v78;
end;
v5.descriptor = {
    name = "ArrayOfItemFooterProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ArrayOfItemFooterProp_ConditionalOption = v5;
v1.default:register(v2.ArrayOfItemFooterProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_3 = v5 --[[ copy: 5 -> 9 ]];
v5.new = function(v80) --[[ Line: 828 ]] --[[ Name: new ]]
    -- upvalues: l_v5_3 (copy)
    return (setmetatable({
        options = if not (v80 ~= nil) or v80.options == nil then {} else v80.options
    }, l_v5_3));
end;
v5.encode = function(v81) --[[ Line: 836 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v82 = buffer.create(0);
    local v83 = 0;
    if v81.options ~= nil and #v81.options > 0 then
        for _, v85 in v81.options do
            local v86 = v85:encode();
            local v87, v88 = v0.writeTag(v82, v83, 1, v0.wireTypes.lengthDelimited);
            v87, v88 = v0.writeBuffer(v87, v88, v86, buffer.len(v86));
            v82 = v87;
            v83 = v88;
        end;
    end;
    local v89 = buffer.create(v83);
    buffer.copy(v89, 0, v82, 0, v83);
    return v89;
end;
v5.decode = function(v90) --[[ Line: 855 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_3 (copy), v0 (copy), v2 (copy)
    local v91 = l_v5_3.new();
    local v92 = 0;
    while v92 < buffer.len(v90) do
        local v93 = nil;
        local v94 = nil;
        local v95, v96, v97 = v0.readTag(v90, v92);
        v93 = v95;
        v94 = v96;
        v92 = v97;
        if v94 == v0.wireTypes.varint then
            v95 = nil;
            v96, v97 = v0.readVarInt(v90, v92);
            v95 = v96;
            v92 = v97;
        elseif v94 == v0.wireTypes.lengthDelimited then
            if v93 == 1 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                table.insert(v91.options, v2.ArrayOfItemFooterProp_ConditionalOption.decode(v95));
            else
                v95 = nil;
                v96, v97 = v0.readVarInt(v90, v92);
                v92 = v97 + v96;
            end;
        elseif v94 == v0.wireTypes.i32 then
            v95 = nil;
            v96, v97 = v0.readFixed32(v90, v92);
            v95 = v96;
            v92 = v97;
        elseif v94 == v0.wireTypes.i64 then
            v95 = nil;
            v96, v97 = v0.readFixed64(v90, v92);
            v95 = v96;
            v92 = v97;
        else
            error("Unsupported wire type: " .. v94);
        end;
    end;
    return v91;
end;
v5.jsonEncode = function(v98) --[[ Line: 900 ]] --[[ Name: jsonEncode ]]
    local v99 = {};
    if v98.options ~= nil and #v98.options > 0 then
        local v100 = {};
        for _, v102 in v98.options do
            table.insert(v100, v102:jsonEncode());
        end;
        v99.options = v100;
    end;
    return v99;
end;
v5.jsonDecode = function(v103) --[[ Line: 916 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_3 (copy), v2 (copy)
    local v104 = l_v5_3.new();
    if v103.options ~= nil then
        local v105 = {};
        for _, v107 in v103.options do
            table.insert(v105, v2.ArrayOfItemFooterProp_ConditionalOption.jsonDecode(v107));
        end;
        v104.options = v105;
    end;
    return v104;
end;
v5.descriptor = {
    name = "ArrayOfItemFooterProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ArrayOfItemFooterProp_ConditionalOptions = v5;
v1.default:register(v2.ArrayOfItemFooterProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_4 = v5 --[[ copy: 5 -> 10 ]];
v5.new = function(v109) --[[ Line: 947 ]] --[[ Name: new ]]
    -- upvalues: l_v5_4 (copy)
    return (setmetatable({
        array = if not (v109 ~= nil) or v109.array == nil then {} else v109.array
    }, l_v5_4));
end;
v5.encode = function(v110) --[[ Line: 955 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v111 = buffer.create(0);
    local v112 = 0;
    if v110.array ~= nil and #v110.array > 0 then
        for _, v114 in v110.array do
            local v115 = v114:encode();
            local v116, v117 = v0.writeTag(v111, v112, 1, v0.wireTypes.lengthDelimited);
            v116, v117 = v0.writeBuffer(v116, v117, v115, buffer.len(v115));
            v111 = v116;
            v112 = v117;
        end;
    end;
    local v118 = buffer.create(v112);
    buffer.copy(v118, 0, v111, 0, v112);
    return v118;
end;
v5.decode = function(v119) --[[ Line: 972 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_4 (copy), v0 (copy), v2 (copy)
    local v120 = l_v5_4.new();
    local v121 = 0;
    while v121 < buffer.len(v119) do
        local v122 = nil;
        local v123 = nil;
        local v124, v125, v126 = v0.readTag(v119, v121);
        v122 = v124;
        v123 = v125;
        v121 = v126;
        if v123 == v0.wireTypes.varint then
            v124 = nil;
            v125, v126 = v0.readVarInt(v119, v121);
            v124 = v125;
            v121 = v126;
        elseif v123 == v0.wireTypes.lengthDelimited then
            if v122 == 1 then
                v124 = nil;
                v125, v126 = v0.readBuffer(v119, v121);
                v124 = v125;
                v121 = v126;
                table.insert(v120.array, v2.ItemFooter.decode(v124));
            else
                v124 = nil;
                v125, v126 = v0.readVarInt(v119, v121);
                v121 = v126 + v125;
            end;
        elseif v123 == v0.wireTypes.i32 then
            v124 = nil;
            v125, v126 = v0.readFixed32(v119, v121);
            v124 = v125;
            v121 = v126;
        elseif v123 == v0.wireTypes.i64 then
            v124 = nil;
            v125, v126 = v0.readFixed64(v119, v121);
            v124 = v125;
            v121 = v126;
        else
            error("Unsupported wire type: " .. v123);
        end;
    end;
    return v120;
end;
v5.jsonEncode = function(v127) --[[ Line: 1015 ]] --[[ Name: jsonEncode ]]
    local v128 = {};
    if v127.array ~= nil and #v127.array > 0 then
        local v129 = {};
        for _, v131 in v127.array do
            table.insert(v129, v131:jsonEncode());
        end;
        v128.array = v129;
    end;
    return v128;
end;
v5.jsonDecode = function(v132) --[[ Line: 1029 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_4 (copy), v2 (copy)
    local v133 = l_v5_4.new();
    if v132.array ~= nil then
        local v134 = {};
        for _, v136 in v132.array do
            table.insert(v134, v2.ItemFooter.jsonDecode(v136));
        end;
        v133.array = v134;
    end;
    return v133;
end;
v5.descriptor = {
    name = "ArrayOfItemFooterProp_ArrayOfItemFooter", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfItemFooter"
};
v2.ArrayOfItemFooterProp_ArrayOfItemFooter = v5;
v1.default:register(v2.ArrayOfItemFooterProp_ArrayOfItemFooter);
v5 = {};
v5.__index = v5;
local l_v5_5 = v5 --[[ copy: 5 -> 11 ]];
v5.new = function(v138) --[[ Line: 1060 ]] --[[ Name: new ]]
    -- upvalues: l_v5_5 (copy)
    return (setmetatable({
        thumbnail_aspect_ratio = if not (v138 ~= nil) or v138.thumbnail_aspect_ratio == nil then nil else v138.thumbnail_aspect_ratio
    }, l_v5_5));
end;
v5.encode = function(v139) --[[ Line: 1068 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v140 = buffer.create(0);
    local v141 = 0;
    if v139.thumbnail_aspect_ratio ~= nil then
        local v142 = v139.thumbnail_aspect_ratio:encode();
        local v143, v144 = v0.writeTag(v140, v141, 1, v0.wireTypes.lengthDelimited);
        v143, v144 = v0.writeBuffer(v143, v144, v142, buffer.len(v142));
        v140 = v143;
        v141 = v144;
    end;
    local v145 = buffer.create(v141);
    buffer.copy(v145, 0, v140, 0, v141);
    return v145;
end;
v5.decode = function(v146) --[[ Line: 1083 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_5 (copy), v0 (copy), v4 (copy)
    local v147 = l_v5_5.new();
    local v148 = 0;
    while v148 < buffer.len(v146) do
        local v149 = nil;
        local v150 = nil;
        local v151, v152, v153 = v0.readTag(v146, v148);
        v149 = v151;
        v150 = v152;
        v148 = v153;
        if v150 == v0.wireTypes.varint then
            v151 = nil;
            v152, v153 = v0.readVarInt(v146, v148);
            v151 = v152;
            v148 = v153;
        elseif v150 == v0.wireTypes.lengthDelimited then
            if v149 == 1 then
                v151 = nil;
                v152, v153 = v0.readBuffer(v146, v148);
                v151 = v152;
                v148 = v153;
                v147.thumbnail_aspect_ratio = v4.StringProp.decode(v151);
            else
                v151 = nil;
                v152, v153 = v0.readVarInt(v146, v148);
                v148 = v153 + v152;
            end;
        elseif v150 == v0.wireTypes.i32 then
            v151 = nil;
            v152, v153 = v0.readFixed32(v146, v148);
            v151 = v152;
            v148 = v153;
        elseif v150 == v0.wireTypes.i64 then
            v151 = nil;
            v152, v153 = v0.readFixed64(v146, v148);
            v151 = v152;
            v148 = v153;
        else
            error("Unsupported wire type: " .. v150);
        end;
    end;
    return v147;
end;
v5.jsonEncode = function(v154) --[[ Line: 1127 ]] --[[ Name: jsonEncode ]]
    local v155 = {};
    if v154.thumbnail_aspect_ratio ~= nil then
        v155.thumbnailAspectRatio = v154.thumbnail_aspect_ratio:jsonEncode();
    end;
    return v155;
end;
v5.jsonDecode = function(v156) --[[ Line: 1137 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_5 (copy), v4 (copy)
    local v157 = l_v5_5.new();
    if v156.thumbnail_aspect_ratio ~= nil then
        v157.thumbnail_aspect_ratio = v4.StringProp.jsonDecode(v156.thumbnail_aspect_ratio);
    end;
    if v156.thumbnailAspectRatio ~= nil then
        v157.thumbnail_aspect_ratio = v4.StringProp.jsonDecode(v156.thumbnailAspectRatio);
    end;
    return v157;
end;
v5.descriptor = {
    name = "CardStyle", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CardStyle"
};
v2.CardStyle = v5;
v1.default:register(v2.CardStyle);
v5 = {};
v5.__index = v5;
local l_v5_6 = v5 --[[ copy: 5 -> 12 ]];
v5.new = function(v159) --[[ Line: 1167 ]] --[[ Name: new ]]
    -- upvalues: l_v5_6 (copy)
    return (setmetatable({
        kind = if not (v159 ~= nil) or v159.kind == nil then nil else v159.kind
    }, l_v5_6));
end;
v5.encode = function(v160) --[[ Line: 1173 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v161 = buffer.create(0);
    local v162 = 0;
    if v160.kind ~= nil then
        if v160.kind.type == "literal" then
            local v163 = v160.kind.value:encode();
            local v164, v165 = v0.writeTag(v161, v162, 1, v0.wireTypes.lengthDelimited);
            v164, v165 = v0.writeBuffer(v164, v165, v163, buffer.len(v163));
            v161 = v164;
            v162 = v165;
        elseif v160.kind.type == "binding_path" then
            local v166, v167 = v0.writeTag(v161, v162, 2, v0.wireTypes.lengthDelimited);
            v166, v167 = v0.writeString(v166, v167, v160.kind.value);
            v161 = v166;
            v162 = v167;
        elseif v160.kind.type == "conditional" then
            local v168 = v160.kind.value:encode();
            local v169, v170 = v0.writeTag(v161, v162, 3, v0.wireTypes.lengthDelimited);
            v169, v170 = v0.writeBuffer(v169, v170, v168, buffer.len(v168));
            v161 = v169;
            v162 = v170;
        end;
    end;
    local v171 = buffer.create(v162);
    buffer.copy(v171, 0, v161, 0, v162);
    return v171;
end;
v5.decode = function(v172) --[[ Line: 1197 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_6 (copy), v0 (copy), v2 (copy)
    local v173 = l_v5_6.new();
    local v174 = 0;
    while v174 < buffer.len(v172) do
        local v175 = nil;
        local v176 = nil;
        local v177, v178, v179 = v0.readTag(v172, v174);
        v175 = v177;
        v176 = v178;
        v174 = v179;
        if v176 == v0.wireTypes.varint then
            v177 = nil;
            v178, v179 = v0.readVarInt(v172, v174);
            v177 = v178;
            v174 = v179;
        elseif v176 == v0.wireTypes.lengthDelimited then
            if v175 == 1 then
                v177 = nil;
                v178, v179 = v0.readBuffer(v172, v174);
                v177 = v178;
                v174 = v179;
                v173.kind = {
                    type = "literal", 
                    value = v2.CardStyle.decode(v177)
                };
            elseif v175 == 2 then
                v177 = nil;
                v178, v179 = v0.readBuffer(v172, v174);
                v177 = v178;
                v174 = v179;
                v173.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v177)
                };
            elseif v175 == 3 then
                v177 = nil;
                v178, v179 = v0.readBuffer(v172, v174);
                v177 = v178;
                v174 = v179;
                v173.kind = {
                    type = "conditional", 
                    value = v2.CardStyleProp_ConditionalOptions.decode(v177)
                };
            else
                v177 = nil;
                v178, v179 = v0.readVarInt(v172, v174);
                v174 = v179 + v178;
            end;
        elseif v176 == v0.wireTypes.i32 then
            v177 = nil;
            v178, v179 = v0.readFixed32(v172, v174);
            v177 = v178;
            v174 = v179;
        elseif v176 == v0.wireTypes.i64 then
            v177 = nil;
            v178, v179 = v0.readFixed64(v172, v174);
            v177 = v178;
            v174 = v179;
        else
            error("Unsupported wire type: " .. v176);
        end;
    end;
    return v173;
end;
v5.jsonEncode = function(v180) --[[ Line: 1251 ]] --[[ Name: jsonEncode ]]
    local v181 = {};
    if v180.kind ~= nil then
        if v180.kind.type == "literal" then
            v181.literal = v180.kind.value:jsonEncode();
            return v181;
        elseif v180.kind.type == "binding_path" then
            v181.bindingPath = v180.kind.value;
            return v181;
        elseif v180.kind.type == "conditional" then
            v181.conditional = v180.kind.value:jsonEncode();
        end;
    end;
    return v181;
end;
v5.jsonDecode = function(v182) --[[ Line: 1267 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_6 (copy), v2 (copy)
    local v183 = l_v5_6.new();
    if v182.literal ~= nil then
        v183.kind = {
            type = "literal", 
            value = v2.CardStyle.jsonDecode(v182.literal)
        };
    end;
    if v182.binding_path ~= nil then
        v183.kind = {
            type = "binding_path", 
            value = v182.binding_path
        };
    end;
    if v182.bindingPath ~= nil then
        v183.kind = {
            type = "binding_path", 
            value = v182.bindingPath
        };
    end;
    if v182.conditional ~= nil then
        v183.kind = {
            type = "conditional", 
            value = v2.CardStyleProp_ConditionalOptions.jsonDecode(v182.conditional)
        };
    end;
    return v183;
end;
v5.descriptor = {
    name = "CardStyleProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CardStyleProp"
};
v2.CardStyleProp = v5;
v1.default:register(v2.CardStyleProp);
v5 = {};
v5.__index = v5;
local l_v5_7 = v5 --[[ copy: 5 -> 13 ]];
v5.new = function(v185) --[[ Line: 1306 ]] --[[ Name: new ]]
    -- upvalues: l_v5_7 (copy)
    return (setmetatable({
        condition = if not (v185 ~= nil) or v185.condition == nil then nil else v185.condition, 
        kind = if not (v185 ~= nil) or v185.kind == nil then nil else v185.kind
    }, l_v5_7));
end;
v5.encode = function(v186) --[[ Line: 1315 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v187 = buffer.create(0);
    local v188 = 0;
    if v186.condition ~= nil then
        local v189 = v186.condition:encode();
        local v190, v191 = v0.writeTag(v187, v188, 1, v0.wireTypes.lengthDelimited);
        v190, v191 = v0.writeBuffer(v190, v191, v189, buffer.len(v189));
        v187 = v190;
        v188 = v191;
    end;
    if v186.kind ~= nil then
        if v186.kind.type == "literal" then
            local v192 = v186.kind.value:encode();
            local v193, v194 = v0.writeTag(v187, v188, 2, v0.wireTypes.lengthDelimited);
            v193, v194 = v0.writeBuffer(v193, v194, v192, buffer.len(v192));
            v187 = v193;
            v188 = v194;
        elseif v186.kind.type == "binding_path" then
            local v195, v196 = v0.writeTag(v187, v188, 3, v0.wireTypes.lengthDelimited);
            v195, v196 = v0.writeString(v195, v196, v186.kind.value);
            v187 = v195;
            v188 = v196;
        end;
    end;
    local v197 = buffer.create(v188);
    buffer.copy(v197, 0, v187, 0, v188);
    return v197;
end;
v5.decode = function(v198) --[[ Line: 1341 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_7 (copy), v0 (copy), v3 (copy), v2 (copy)
    local v199 = l_v5_7.new();
    local v200 = 0;
    while v200 < buffer.len(v198) do
        local v201 = nil;
        local v202 = nil;
        local v203, v204, v205 = v0.readTag(v198, v200);
        v201 = v203;
        v202 = v204;
        v200 = v205;
        if v202 == v0.wireTypes.varint then
            v203 = nil;
            v204, v205 = v0.readVarInt(v198, v200);
            v203 = v204;
            v200 = v205;
        elseif v202 == v0.wireTypes.lengthDelimited then
            if v201 == 1 then
                v203 = nil;
                v204, v205 = v0.readBuffer(v198, v200);
                v203 = v204;
                v200 = v205;
                v199.condition = v3.PropCondition.decode(v203);
            elseif v201 == 2 then
                v203 = nil;
                v204, v205 = v0.readBuffer(v198, v200);
                v203 = v204;
                v200 = v205;
                v199.kind = {
                    type = "literal", 
                    value = v2.CardStyle.decode(v203)
                };
            elseif v201 == 3 then
                v203 = nil;
                v204, v205 = v0.readBuffer(v198, v200);
                v203 = v204;
                v200 = v205;
                v199.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v203)
                };
            else
                v203 = nil;
                v204, v205 = v0.readVarInt(v198, v200);
                v200 = v205 + v204;
            end;
        elseif v202 == v0.wireTypes.i32 then
            v203 = nil;
            v204, v205 = v0.readFixed32(v198, v200);
            v203 = v204;
            v200 = v205;
        elseif v202 == v0.wireTypes.i64 then
            v203 = nil;
            v204, v205 = v0.readFixed64(v198, v200);
            v203 = v204;
            v200 = v205;
        else
            error("Unsupported wire type: " .. v202);
        end;
    end;
    return v199;
end;
v5.jsonEncode = function(v206) --[[ Line: 1394 ]] --[[ Name: jsonEncode ]]
    local v207 = {};
    if v206.condition ~= nil then
        v207.condition = v206.condition:jsonEncode();
    end;
    if v206.kind ~= nil then
        if v206.kind.type == "literal" then
            v207.literal = v206.kind.value:jsonEncode();
            return v207;
        elseif v206.kind.type == "binding_path" then
            v207.bindingPath = v206.kind.value;
        end;
    end;
    return v207;
end;
v5.jsonDecode = function(v208) --[[ Line: 1412 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_7 (copy), v3 (copy), v2 (copy)
    local v209 = l_v5_7.new();
    if v208.condition ~= nil then
        v209.condition = v3.PropCondition.jsonDecode(v208.condition);
    end;
    if v208.literal ~= nil then
        v209.kind = {
            type = "literal", 
            value = v2.CardStyle.jsonDecode(v208.literal)
        };
    end;
    if v208.binding_path ~= nil then
        v209.kind = {
            type = "binding_path", 
            value = v208.binding_path
        };
    end;
    if v208.bindingPath ~= nil then
        v209.kind = {
            type = "binding_path", 
            value = v208.bindingPath
        };
    end;
    return v209;
end;
v5.descriptor = {
    name = "CardStyleProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.CardStyleProp_ConditionalOption = v5;
v1.default:register(v2.CardStyleProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_8 = v5 --[[ copy: 5 -> 14 ]];
v5.new = function(v211) --[[ Line: 1449 ]] --[[ Name: new ]]
    -- upvalues: l_v5_8 (copy)
    return (setmetatable({
        options = if not (v211 ~= nil) or v211.options == nil then {} else v211.options
    }, l_v5_8));
end;
v5.encode = function(v212) --[[ Line: 1457 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v213 = buffer.create(0);
    local v214 = 0;
    if v212.options ~= nil and #v212.options > 0 then
        for _, v216 in v212.options do
            local v217 = v216:encode();
            local v218, v219 = v0.writeTag(v213, v214, 1, v0.wireTypes.lengthDelimited);
            v218, v219 = v0.writeBuffer(v218, v219, v217, buffer.len(v217));
            v213 = v218;
            v214 = v219;
        end;
    end;
    local v220 = buffer.create(v214);
    buffer.copy(v220, 0, v213, 0, v214);
    return v220;
end;
v5.decode = function(v221) --[[ Line: 1474 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_8 (copy), v0 (copy), v2 (copy)
    local v222 = l_v5_8.new();
    local v223 = 0;
    while v223 < buffer.len(v221) do
        local v224 = nil;
        local v225 = nil;
        local v226, v227, v228 = v0.readTag(v221, v223);
        v224 = v226;
        v225 = v227;
        v223 = v228;
        if v225 == v0.wireTypes.varint then
            v226 = nil;
            v227, v228 = v0.readVarInt(v221, v223);
            v226 = v227;
            v223 = v228;
        elseif v225 == v0.wireTypes.lengthDelimited then
            if v224 == 1 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                table.insert(v222.options, v2.CardStyleProp_ConditionalOption.decode(v226));
            else
                v226 = nil;
                v227, v228 = v0.readVarInt(v221, v223);
                v223 = v228 + v227;
            end;
        elseif v225 == v0.wireTypes.i32 then
            v226 = nil;
            v227, v228 = v0.readFixed32(v221, v223);
            v226 = v227;
            v223 = v228;
        elseif v225 == v0.wireTypes.i64 then
            v226 = nil;
            v227, v228 = v0.readFixed64(v221, v223);
            v226 = v227;
            v223 = v228;
        else
            error("Unsupported wire type: " .. v225);
        end;
    end;
    return v222;
end;
v5.jsonEncode = function(v229) --[[ Line: 1517 ]] --[[ Name: jsonEncode ]]
    local v230 = {};
    if v229.options ~= nil and #v229.options > 0 then
        local v231 = {};
        for _, v233 in v229.options do
            table.insert(v231, v233:jsonEncode());
        end;
        v230.options = v231;
    end;
    return v230;
end;
v5.jsonDecode = function(v234) --[[ Line: 1531 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_8 (copy), v2 (copy)
    local v235 = l_v5_8.new();
    if v234.options ~= nil then
        local v236 = {};
        for _, v238 in v234.options do
            table.insert(v236, v2.CardStyleProp_ConditionalOption.jsonDecode(v238));
        end;
        v235.options = v236;
    end;
    return v235;
end;
v5.descriptor = {
    name = "CardStyleProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.CardStyleProp_ConditionalOptions = v5;
v1.default:register(v2.CardStyleProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_9 = v5 --[[ copy: 5 -> 15 ]];
v5.new = function(v240) --[[ Line: 1562 ]] --[[ Name: new ]]
    -- upvalues: l_v5_9 (copy)
    return (setmetatable({
        id = if not (v240 ~= nil) or v240.id == nil then nil else v240.id, 
        type = if not (v240 ~= nil) or v240.type == nil then nil else v240.type
    }, l_v5_9));
end;
v5.encode = function(v241) --[[ Line: 1569 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v242 = buffer.create(0);
    local v243 = 0;
    if v241.id ~= nil then
        local v244 = v241.id:encode();
        local v245, v246 = v0.writeTag(v242, v243, 1, v0.wireTypes.lengthDelimited);
        v245, v246 = v0.writeBuffer(v245, v246, v244, buffer.len(v244));
        v242 = v245;
        v243 = v246;
    end;
    if v241.type ~= nil then
        local v247 = v241.type:encode();
        local v248, v249 = v0.writeTag(v242, v243, 2, v0.wireTypes.lengthDelimited);
        v248, v249 = v0.writeBuffer(v248, v249, v247, buffer.len(v247));
        v242 = v248;
        v243 = v249;
    end;
    local v250 = buffer.create(v243);
    buffer.copy(v250, 0, v242, 0, v243);
    return v250;
end;
v5.decode = function(v251) --[[ Line: 1590 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_9 (copy), v0 (copy), v4 (copy)
    local v252 = l_v5_9.new();
    local v253 = 0;
    while v253 < buffer.len(v251) do
        local v254 = nil;
        local v255 = nil;
        local v256, v257, v258 = v0.readTag(v251, v253);
        v254 = v256;
        v255 = v257;
        v253 = v258;
        if v255 == v0.wireTypes.varint then
            v256 = nil;
            v257, v258 = v0.readVarInt(v251, v253);
            v256 = v257;
            v253 = v258;
        elseif v255 == v0.wireTypes.lengthDelimited then
            if v254 == 1 then
                v256 = nil;
                v257, v258 = v0.readBuffer(v251, v253);
                v256 = v257;
                v253 = v258;
                v252.id = v4.StringProp.decode(v256);
            elseif v254 == 2 then
                v256 = nil;
                v257, v258 = v0.readBuffer(v251, v253);
                v256 = v257;
                v253 = v258;
                v252.type = v4.StringProp.decode(v256);
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
v5.jsonEncode = function(v259) --[[ Line: 1638 ]] --[[ Name: jsonEncode ]]
    local v260 = {};
    if v259.id ~= nil then
        v260.id = v259.id:jsonEncode();
    end;
    if v259.type ~= nil then
        v260.type = v259.type:jsonEncode();
    end;
    return v260;
end;
v5.jsonDecode = function(v261) --[[ Line: 1652 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_9 (copy), v4 (copy)
    local v262 = l_v5_9.new();
    if v261.id ~= nil then
        v262.id = v4.StringProp.jsonDecode(v261.id);
    end;
    if v261.type ~= nil then
        v262.type = v4.StringProp.jsonDecode(v261.type);
    end;
    return v262;
end;
v5.descriptor = {
    name = "CatalogSortContent", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortContent"
};
v2.CatalogSortContent = v5;
v1.default:register(v2.CatalogSortContent);
v5 = {};
v5.__index = v5;
local l_v5_10 = v5 --[[ copy: 5 -> 16 ]];
v5.new = function(v264) --[[ Line: 1680 ]] --[[ Name: new ]]
    -- upvalues: l_v5_10 (copy)
    return (setmetatable({
        kind = if not (v264 ~= nil) or v264.kind == nil then nil else v264.kind
    }, l_v5_10));
end;
v5.encode = function(v265) --[[ Line: 1688 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v266 = buffer.create(0);
    local v267 = 0;
    if v265.kind ~= nil then
        if v265.kind.type == "literal" then
            local v268 = v265.kind.value:encode();
            local v269, v270 = v0.writeTag(v266, v267, 1, v0.wireTypes.lengthDelimited);
            v269, v270 = v0.writeBuffer(v269, v270, v268, buffer.len(v268));
            v266 = v269;
            v267 = v270;
        elseif v265.kind.type == "binding_path" then
            local v271, v272 = v0.writeTag(v266, v267, 2, v0.wireTypes.lengthDelimited);
            v271, v272 = v0.writeString(v271, v272, v265.kind.value);
            v266 = v271;
            v267 = v272;
        elseif v265.kind.type == "conditional" then
            local v273 = v265.kind.value:encode();
            local v274, v275 = v0.writeTag(v266, v267, 3, v0.wireTypes.lengthDelimited);
            v274, v275 = v0.writeBuffer(v274, v275, v273, buffer.len(v273));
            v266 = v274;
            v267 = v275;
        end;
    end;
    local v276 = buffer.create(v267);
    buffer.copy(v276, 0, v266, 0, v267);
    return v276;
end;
v5.decode = function(v277) --[[ Line: 1712 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_10 (copy), v0 (copy), v2 (copy)
    local v278 = l_v5_10.new();
    local v279 = 0;
    while v279 < buffer.len(v277) do
        local v280 = nil;
        local v281 = nil;
        local v282, v283, v284 = v0.readTag(v277, v279);
        v280 = v282;
        v281 = v283;
        v279 = v284;
        if v281 == v0.wireTypes.varint then
            v282 = nil;
            v283, v284 = v0.readVarInt(v277, v279);
            v282 = v283;
            v279 = v284;
        elseif v281 == v0.wireTypes.lengthDelimited then
            if v280 == 1 then
                v282 = nil;
                v283, v284 = v0.readBuffer(v277, v279);
                v282 = v283;
                v279 = v284;
                v278.kind = {
                    type = "literal", 
                    value = v2.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent.decode(v282)
                };
            elseif v280 == 2 then
                v282 = nil;
                v283, v284 = v0.readBuffer(v277, v279);
                v282 = v283;
                v279 = v284;
                v278.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v282)
                };
            elseif v280 == 3 then
                v282 = nil;
                v283, v284 = v0.readBuffer(v277, v279);
                v282 = v283;
                v279 = v284;
                v278.kind = {
                    type = "conditional", 
                    value = v2.ArrayOfCatalogSortContentProp_ConditionalOptions.decode(v282)
                };
            else
                v282 = nil;
                v283, v284 = v0.readVarInt(v277, v279);
                v279 = v284 + v283;
            end;
        elseif v281 == v0.wireTypes.i32 then
            v282 = nil;
            v283, v284 = v0.readFixed32(v277, v279);
            v282 = v283;
            v279 = v284;
        elseif v281 == v0.wireTypes.i64 then
            v282 = nil;
            v283, v284 = v0.readFixed64(v277, v279);
            v282 = v283;
            v279 = v284;
        else
            error("Unsupported wire type: " .. v281);
        end;
    end;
    return v278;
end;
v5.jsonEncode = function(v285) --[[ Line: 1771 ]] --[[ Name: jsonEncode ]]
    local v286 = {};
    if v285.kind ~= nil then
        if v285.kind.type == "literal" then
            v286.literal = v285.kind.value:jsonEncode();
            return v286;
        elseif v285.kind.type == "binding_path" then
            v286.bindingPath = v285.kind.value;
            return v286;
        elseif v285.kind.type == "conditional" then
            v286.conditional = v285.kind.value:jsonEncode();
        end;
    end;
    return v286;
end;
v5.jsonDecode = function(v287) --[[ Line: 1787 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_10 (copy), v2 (copy)
    local v288 = l_v5_10.new();
    if v287.literal ~= nil then
        v288.kind = {
            type = "literal", 
            value = v2.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent.jsonDecode(v287.literal)
        };
    end;
    if v287.binding_path ~= nil then
        v288.kind = {
            type = "binding_path", 
            value = v287.binding_path
        };
    end;
    if v287.bindingPath ~= nil then
        v288.kind = {
            type = "binding_path", 
            value = v287.bindingPath
        };
    end;
    if v287.conditional ~= nil then
        v288.kind = {
            type = "conditional", 
            value = v2.ArrayOfCatalogSortContentProp_ConditionalOptions.jsonDecode(v287.conditional)
        };
    end;
    return v288;
end;
v5.descriptor = {
    name = "ArrayOfCatalogSortContentProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfCatalogSortContentProp"
};
v2.ArrayOfCatalogSortContentProp = v5;
v1.default:register(v2.ArrayOfCatalogSortContentProp);
v5 = {};
v5.__index = v5;
local l_v5_11 = v5 --[[ copy: 5 -> 17 ]];
v5.new = function(v290) --[[ Line: 1829 ]] --[[ Name: new ]]
    -- upvalues: l_v5_11 (copy)
    return (setmetatable({
        condition = if not (v290 ~= nil) or v290.condition == nil then nil else v290.condition, 
        kind = if not (v290 ~= nil) or v290.kind == nil then nil else v290.kind
    }, l_v5_11));
end;
v5.encode = function(v291) --[[ Line: 1838 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v292 = buffer.create(0);
    local v293 = 0;
    if v291.condition ~= nil then
        local v294 = v291.condition:encode();
        local v295, v296 = v0.writeTag(v292, v293, 1, v0.wireTypes.lengthDelimited);
        v295, v296 = v0.writeBuffer(v295, v296, v294, buffer.len(v294));
        v292 = v295;
        v293 = v296;
    end;
    if v291.kind ~= nil then
        if v291.kind.type == "literal" then
            local v297 = v291.kind.value:encode();
            local v298, v299 = v0.writeTag(v292, v293, 2, v0.wireTypes.lengthDelimited);
            v298, v299 = v0.writeBuffer(v298, v299, v297, buffer.len(v297));
            v292 = v298;
            v293 = v299;
        elseif v291.kind.type == "binding_path" then
            local v300, v301 = v0.writeTag(v292, v293, 3, v0.wireTypes.lengthDelimited);
            v300, v301 = v0.writeString(v300, v301, v291.kind.value);
            v292 = v300;
            v293 = v301;
        end;
    end;
    local v302 = buffer.create(v293);
    buffer.copy(v302, 0, v292, 0, v293);
    return v302;
end;
v5.decode = function(v303) --[[ Line: 1866 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_11 (copy), v0 (copy), v3 (copy), v2 (copy)
    local v304 = l_v5_11.new();
    local v305 = 0;
    while v305 < buffer.len(v303) do
        local v306 = nil;
        local v307 = nil;
        local v308, v309, v310 = v0.readTag(v303, v305);
        v306 = v308;
        v307 = v309;
        v305 = v310;
        if v307 == v0.wireTypes.varint then
            v308 = nil;
            v309, v310 = v0.readVarInt(v303, v305);
            v308 = v309;
            v305 = v310;
        elseif v307 == v0.wireTypes.lengthDelimited then
            if v306 == 1 then
                v308 = nil;
                v309, v310 = v0.readBuffer(v303, v305);
                v308 = v309;
                v305 = v310;
                v304.condition = v3.PropCondition.decode(v308);
            elseif v306 == 2 then
                v308 = nil;
                v309, v310 = v0.readBuffer(v303, v305);
                v308 = v309;
                v305 = v310;
                v304.kind = {
                    type = "literal", 
                    value = v2.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent.decode(v308)
                };
            elseif v306 == 3 then
                v308 = nil;
                v309, v310 = v0.readBuffer(v303, v305);
                v308 = v309;
                v305 = v310;
                v304.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v308)
                };
            else
                v308 = nil;
                v309, v310 = v0.readVarInt(v303, v305);
                v305 = v310 + v309;
            end;
        elseif v307 == v0.wireTypes.i32 then
            v308 = nil;
            v309, v310 = v0.readFixed32(v303, v305);
            v308 = v309;
            v305 = v310;
        elseif v307 == v0.wireTypes.i64 then
            v308 = nil;
            v309, v310 = v0.readFixed64(v303, v305);
            v308 = v309;
            v305 = v310;
        else
            error("Unsupported wire type: " .. v307);
        end;
    end;
    return v304;
end;
v5.jsonEncode = function(v311) --[[ Line: 1924 ]] --[[ Name: jsonEncode ]]
    local v312 = {};
    if v311.condition ~= nil then
        v312.condition = v311.condition:jsonEncode();
    end;
    if v311.kind ~= nil then
        if v311.kind.type == "literal" then
            v312.literal = v311.kind.value:jsonEncode();
            return v312;
        elseif v311.kind.type == "binding_path" then
            v312.bindingPath = v311.kind.value;
        end;
    end;
    return v312;
end;
v5.jsonDecode = function(v313) --[[ Line: 1944 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_11 (copy), v3 (copy), v2 (copy)
    local v314 = l_v5_11.new();
    if v313.condition ~= nil then
        v314.condition = v3.PropCondition.jsonDecode(v313.condition);
    end;
    if v313.literal ~= nil then
        v314.kind = {
            type = "literal", 
            value = v2.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent.jsonDecode(v313.literal)
        };
    end;
    if v313.binding_path ~= nil then
        v314.kind = {
            type = "binding_path", 
            value = v313.binding_path
        };
    end;
    if v313.bindingPath ~= nil then
        v314.kind = {
            type = "binding_path", 
            value = v313.bindingPath
        };
    end;
    return v314;
end;
v5.descriptor = {
    name = "ArrayOfCatalogSortContentProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ArrayOfCatalogSortContentProp_ConditionalOption = v5;
v1.default:register(v2.ArrayOfCatalogSortContentProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_12 = v5 --[[ copy: 5 -> 18 ]];
v5.new = function(v316) --[[ Line: 1988 ]] --[[ Name: new ]]
    -- upvalues: l_v5_12 (copy)
    return (setmetatable({
        options = if not (v316 ~= nil) or v316.options == nil then {} else v316.options
    }, l_v5_12));
end;
v5.encode = function(v317) --[[ Line: 1999 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v318 = buffer.create(0);
    local v319 = 0;
    if v317.options ~= nil and #v317.options > 0 then
        for _, v321 in v317.options do
            local v322 = v321:encode();
            local v323, v324 = v0.writeTag(v318, v319, 1, v0.wireTypes.lengthDelimited);
            v323, v324 = v0.writeBuffer(v323, v324, v322, buffer.len(v322));
            v318 = v323;
            v319 = v324;
        end;
    end;
    local v325 = buffer.create(v319);
    buffer.copy(v325, 0, v318, 0, v319);
    return v325;
end;
v5.decode = function(v326) --[[ Line: 2018 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_12 (copy), v0 (copy), v2 (copy)
    local v327 = l_v5_12.new();
    local v328 = 0;
    while v328 < buffer.len(v326) do
        local v329 = nil;
        local v330 = nil;
        local v331, v332, v333 = v0.readTag(v326, v328);
        v329 = v331;
        v330 = v332;
        v328 = v333;
        if v330 == v0.wireTypes.varint then
            v331 = nil;
            v332, v333 = v0.readVarInt(v326, v328);
            v331 = v332;
            v328 = v333;
        elseif v330 == v0.wireTypes.lengthDelimited then
            if v329 == 1 then
                v331 = nil;
                v332, v333 = v0.readBuffer(v326, v328);
                v331 = v332;
                v328 = v333;
                table.insert(v327.options, v2.ArrayOfCatalogSortContentProp_ConditionalOption.decode(v331));
            else
                v331 = nil;
                v332, v333 = v0.readVarInt(v326, v328);
                v328 = v333 + v332;
            end;
        elseif v330 == v0.wireTypes.i32 then
            v331 = nil;
            v332, v333 = v0.readFixed32(v326, v328);
            v331 = v332;
            v328 = v333;
        elseif v330 == v0.wireTypes.i64 then
            v331 = nil;
            v332, v333 = v0.readFixed64(v326, v328);
            v331 = v332;
            v328 = v333;
        else
            error("Unsupported wire type: " .. v330);
        end;
    end;
    return v327;
end;
v5.jsonEncode = function(v334) --[[ Line: 2063 ]] --[[ Name: jsonEncode ]]
    local v335 = {};
    if v334.options ~= nil and #v334.options > 0 then
        local v336 = {};
        for _, v338 in v334.options do
            table.insert(v336, v338:jsonEncode());
        end;
        v335.options = v336;
    end;
    return v335;
end;
v5.jsonDecode = function(v339) --[[ Line: 2079 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_12 (copy), v2 (copy)
    local v340 = l_v5_12.new();
    if v339.options ~= nil then
        local v341 = {};
        for _, v343 in v339.options do
            table.insert(v341, v2.ArrayOfCatalogSortContentProp_ConditionalOption.jsonDecode(v343));
        end;
        v340.options = v341;
    end;
    return v340;
end;
v5.descriptor = {
    name = "ArrayOfCatalogSortContentProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ArrayOfCatalogSortContentProp_ConditionalOptions = v5;
v1.default:register(v2.ArrayOfCatalogSortContentProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
v5.new = function(v344) --[[ Line: 2112 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        array = if not (v344 ~= nil) or v344.array == nil then {} else v344.array
    }, v5));
end;
v5.encode = function(v345) --[[ Line: 2123 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v346 = buffer.create(0);
    local v347 = 0;
    if v345.array ~= nil and #v345.array > 0 then
        for _, v349 in v345.array do
            local v350 = v349:encode();
            local v351, v352 = v0.writeTag(v346, v347, 1, v0.wireTypes.lengthDelimited);
            v351, v352 = v0.writeBuffer(v351, v352, v350, buffer.len(v350));
            v346 = v351;
            v347 = v352;
        end;
    end;
    local v353 = buffer.create(v347);
    buffer.copy(v353, 0, v346, 0, v347);
    return v353;
end;
v5.decode = function(v354) --[[ Line: 2142 ]] --[[ Name: decode ]]
    -- upvalues: v5 (copy), v0 (copy), v2 (copy)
    local v355 = v5.new();
    local v356 = 0;
    while v356 < buffer.len(v354) do
        local v357 = nil;
        local v358 = nil;
        local v359, v360, v361 = v0.readTag(v354, v356);
        v357 = v359;
        v358 = v360;
        v356 = v361;
        if v358 == v0.wireTypes.varint then
            v359 = nil;
            v360, v361 = v0.readVarInt(v354, v356);
            v359 = v360;
            v356 = v361;
        elseif v358 == v0.wireTypes.lengthDelimited then
            if v357 == 1 then
                v359 = nil;
                v360, v361 = v0.readBuffer(v354, v356);
                v359 = v360;
                v356 = v361;
                table.insert(v355.array, v2.CatalogSortContent.decode(v359));
            else
                v359 = nil;
                v360, v361 = v0.readVarInt(v354, v356);
                v356 = v361 + v360;
            end;
        elseif v358 == v0.wireTypes.i32 then
            v359 = nil;
            v360, v361 = v0.readFixed32(v354, v356);
            v359 = v360;
            v356 = v361;
        elseif v358 == v0.wireTypes.i64 then
            v359 = nil;
            v360, v361 = v0.readFixed64(v354, v356);
            v359 = v360;
            v356 = v361;
        else
            error("Unsupported wire type: " .. v358);
        end;
    end;
    return v355;
end;
v5.jsonEncode = function(v362) --[[ Line: 2187 ]] --[[ Name: jsonEncode ]]
    local v363 = {};
    if v362.array ~= nil and #v362.array > 0 then
        local v364 = {};
        for _, v366 in v362.array do
            table.insert(v364, v366:jsonEncode());
        end;
        v363.array = v364;
    end;
    return v363;
end;
v5.jsonDecode = function(v367) --[[ Line: 2203 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v5 (copy), v2 (copy)
    local v368 = v5.new();
    if v367.array ~= nil then
        local v369 = {};
        for _, v371 in v367.array do
            table.insert(v369, v2.CatalogSortContent.jsonDecode(v371));
        end;
        v368.array = v369;
    end;
    return v368;
end;
v5.descriptor = {
    name = "ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfCatalogSortContent"
};
v2.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent = v5;
v1.default:register(v2.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent);
return {
    ItemFooter = v2.ItemFooter, 
    ArrayOfItemFooterProp = v2.ArrayOfItemFooterProp, 
    ArrayOfItemFooterProp_ConditionalOption = v2.ArrayOfItemFooterProp_ConditionalOption, 
    ArrayOfItemFooterProp_ConditionalOptions = v2.ArrayOfItemFooterProp_ConditionalOptions, 
    ArrayOfItemFooterProp_ArrayOfItemFooter = v2.ArrayOfItemFooterProp_ArrayOfItemFooter, 
    CardStyle = v2.CardStyle, 
    CardStyleProp = v2.CardStyleProp, 
    CardStyleProp_ConditionalOption = v2.CardStyleProp_ConditionalOption, 
    CardStyleProp_ConditionalOptions = v2.CardStyleProp_ConditionalOptions, 
    CatalogSortContent = v2.CatalogSortContent, 
    ArrayOfCatalogSortContentProp = v2.ArrayOfCatalogSortContentProp, 
    ArrayOfCatalogSortContentProp_ConditionalOption = v2.ArrayOfCatalogSortContentProp_ConditionalOption, 
    ArrayOfCatalogSortContentProp_ConditionalOptions = v2.ArrayOfCatalogSortContentProp_ConditionalOptions, 
    ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent = v2.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent
};