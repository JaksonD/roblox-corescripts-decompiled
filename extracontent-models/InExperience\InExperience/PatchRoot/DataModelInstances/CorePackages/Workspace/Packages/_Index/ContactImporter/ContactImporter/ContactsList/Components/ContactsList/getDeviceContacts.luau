local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local l_Dash_0 = require(l_script_FirstAncestor_0.dependencies).Dash;
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local v3 = {};
local function v5(v4) --[[ Line: 8 ]]
    -- upvalues: v3 (copy)
    return v4.byDeviceContactId or v3;
end;
local function _(v6) --[[ Line: 12 ]]
    -- upvalues: v3 (copy), l_Dash_0 (copy)
    return function(v7) --[[ Line: 13 ]]
        -- upvalues: v6 (copy), v3 (ref), l_Dash_0 (ref)
        local v8 = v6.hasSentRequest or v3;
        return l_Dash_0.map(v7, function(v9) --[[ Line: 16 ]]
            -- upvalues: l_Dash_0 (ref), v8 (copy)
            return l_Dash_0.join(v9, {
                hasSentRequest = v8[v9.id]
            });
        end);
    end;
end;
local function v13(v11) --[[ Line: 24 ]]
    -- upvalues: l_Dash_0 (copy)
    return l_Dash_0.map(v11, function(v12) --[[ Line: 25 ]]
        -- upvalues: l_Dash_0 (ref)
        return l_Dash_0.join(v12, {
            phoneNumber = tostring(v12.phoneNumbers[1]), 
            phoneNumbers = l_Dash_0.None
        });
    end);
end;
local function _(v14) --[[ Line: 33 ]]
    -- upvalues: l_Dash_0 (copy)
    return function(v15) --[[ Line: 34 ]]
        -- upvalues: l_Dash_0 (ref), v14 (copy)
        local v16 = {};
        l_Dash_0.forEach(v15, function(v17) --[[ Line: 37 ]]
            -- upvalues: v14 (ref), v16 (copy), l_Dash_0 (ref)
            if not v14.deviceContactToRobloxContact or not v14.deviceContactToRobloxContact[v17.id] then
                v16[v17.id] = l_Dash_0.join(v17, {
                    deviceContactId = v17.id, 
                    isMatchedContact = false, 
                    id = l_Dash_0.None
                });
            end;
        end);
        return v16;
    end;
end;
local function v20(v19) --[[ Line: 53 ]]
    -- upvalues: l_Dash_0 (copy)
    return l_Dash_0.values(v19);
end;
local function _(v21) --[[ Line: 57 ]] --[[ Name: stripLeadingWhitespace ]]
    return string.gsub(v21, "^%s*(.*)$", "%1");
end;
local function v29(v23) --[[ Line: 61 ]]
    table.sort(v23, function(v24, v25) --[[ Line: 62 ]]
        if v24.contactName and v25.contactName then
            local v26 = string.upper(v24.contactName);
            local v27 = string.gsub(v26, "^%s*(.*)$", "%1");
            local v28 = string.upper(v25.contactName);
            v26 = string.gsub(v28, "^%s*(.*)$", "%1");
            if v27 and v26 and v27 ~= v26 then
                return v27 < v26;
            end;
        end;
        return v24.deviceContactId < v25.deviceContactId;
    end);
    return v23;
end;
return function(v30) --[[ Line: 75 ]]
    -- upvalues: v3 (copy), l_Dash_0 (copy), v5 (copy), v13 (copy), v20 (copy), v29 (copy)
    local v31 = v30 or v3;
    return l_Dash_0.pipe(v5, function(v32) --[[ Line: 13 ]]
        -- upvalues: v31 (copy), v3 (ref), l_Dash_0 (ref)
        local v33 = v31.hasSentRequest or v3;
        return l_Dash_0.map(v32, function(v34) --[[ Line: 16 ]]
            -- upvalues: l_Dash_0 (ref), v33 (copy)
            return l_Dash_0.join(v34, {
                hasSentRequest = v33[v34.id]
            });
        end);
    end, v13, function(v35) --[[ Line: 34 ]]
        -- upvalues: l_Dash_0 (ref), v31 (copy)
        local v36 = {};
        l_Dash_0.forEach(v35, function(v37) --[[ Line: 37 ]]
            -- upvalues: v31 (ref), v36 (copy), l_Dash_0 (ref)
            if not v31.deviceContactToRobloxContact or not v31.deviceContactToRobloxContact[v37.id] then
                v36[v37.id] = l_Dash_0.join(v37, {
                    deviceContactId = v37.id, 
                    isMatchedContact = false, 
                    id = l_Dash_0.None
                });
            end;
        end);
        return v36;
    end, v20, v29)(v31 or {});
end;