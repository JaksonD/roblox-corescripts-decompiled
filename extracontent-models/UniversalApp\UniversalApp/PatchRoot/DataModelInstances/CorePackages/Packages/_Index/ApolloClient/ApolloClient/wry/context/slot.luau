local v0 = false;
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Boolean_0 = v3.Boolean;
local l_uuid_0 = require(l_Parent_0.utilities.common.makeUniqueId).uuid;
local v7 = {};
local v8 = nil;
local v9 = {};
local v10 = 1;
local function v41() --[[ Line: 62 ]] --[[ Name: makeSlotClass ]]
    -- upvalues: l_Array_0 (copy), v10 (ref), l_uuid_0 (copy), v8 (ref), v9 (copy)
    local v11 = {};
    v11.__index = v11;
    v11.new = function() --[[ Line: 66 ]] --[[ Name: new ]]
        -- upvalues: v11 (copy), l_Array_0 (ref), v10 (ref), l_uuid_0 (ref)
        local v12 = setmetatable({}, v11);
        v12.id = l_Array_0.join({
            "slot", 
            v10, 
            DateTime.now().UnixTimestampMillis, 
            l_uuid_0()
        }, ":");
        v10 = v10 + 1;
        return v12;
    end;
    v11.hasValue = function(v13) --[[ Line: 84 ]] --[[ Name: hasValue ]]
        -- upvalues: v8 (ref), v9 (ref)
        local l_v8_0 = v8;
        while l_v8_0 do
            if l_v8_0.slots[v13.id] then
                local v15 = l_v8_0.slots[v13.id];
                if v15 ~= v9 then
                    if l_v8_0 ~= v8 then
                        v8.slots[v13.id] = v15;
                    end;
                    return true;
                else
                    break;
                end;
            else
                l_v8_0 = l_v8_0.parent;
            end;
        end;
        if v8 then
            v8.slots[v13.id] = v9;
        end;
        return false;
    end;
    v11.getValue = function(v16) --[[ Line: 120 ]] --[[ Name: getValue ]]
        -- upvalues: v8 (ref)
        if v16:hasValue() then
            return v8.slots[v16.id];
        else
            return nil;
        end;
    end;
    v11.withValue = function(v17, v18, v19, v20, v21) --[[ Line: 127 ]] --[[ Name: withValue ]]
        -- upvalues: v8 (ref)
        local v22 = {
            [v17.id] = v18
        };
        local l_v8_1 = v8;
        v8 = {
            parent = l_v8_1, 
            slots = v22
        };
        local v24, v25, v26 = pcall(function() --[[ Line: 144 ]]
            -- upvalues: v19 (copy), v21 (copy), v20 (copy)
            return v19(v21, table.unpack(v20 or {})), true;
        end);
        v8 = l_v8_1;
        if v26 then
            return v25;
        else
            if not v24 then
                error(v25);
            end;
            return nil;
        end;
    end;
    v11.bind = function(v27) --[[ Line: 162 ]] --[[ Name: bind ]]
        -- upvalues: v8 (ref)
        local l_v8_2 = v8;
        return function(v29, ...) --[[ Line: 164 ]]
            -- upvalues: v8 (ref), l_v8_2 (copy), v27 (copy)
            local v30 = {
                ...
            };
            local l_v8_3 = v8;
            v8 = l_v8_2;
            local l_status_0, l_result_0 = pcall(v27, v29, table.unpack(v30));
            v8 = l_v8_3;
            if not l_status_0 then
                error(l_result_0);
            end;
            return l_result_0;
        end;
    end;
    v11.noContext = function(v34, v35, v36) --[[ Line: 178 ]] --[[ Name: noContext ]]
        -- upvalues: v8 (ref)
        if v8 then
            local l_v8_4 = v8;
            local v38, v39, v40 = pcall(function() --[[ Line: 189 ]]
                -- upvalues: v8 (ref), v34 (copy), v36 (copy), v35 (copy)
                v8 = nil;
                return v34(v36, table.unpack(v35 or {})), true;
            end);
            v8 = l_v8_4;
            if v40 then
                return v39;
            else
                if not v38 then
                    error(v39);
                end;
                return nil;
            end;
        else
            return v34(v36, table.unpack(v35 or {}));
        end;
    end;
    return v11;
end;
local v42, v43;
if l_Boolean_0.toJSBoolean(l_Array_0["@wry/context:Slot"]) then
    v43 = l_Array_0["@wry/context:Slot"];
    v0 = v43;
end;
if not v0 then
    v42 = v41();
    pcall(function() --[[ Line: 227 ]]
        -- upvalues: l_Array_0 (copy), v42 (copy)
        l_Array_0["@wry/context:Slot"] = v42;
    end);
    v43 = v42;
end;
v0 = false;
v7.Slot = v43;
return v7;