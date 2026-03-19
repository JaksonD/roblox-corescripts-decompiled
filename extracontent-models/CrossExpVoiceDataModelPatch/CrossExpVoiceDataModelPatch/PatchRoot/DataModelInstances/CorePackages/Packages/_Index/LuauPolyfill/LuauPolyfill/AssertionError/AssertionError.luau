local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Array);
local v2 = require(l_Parent_0.Boolean);
local v3 = require(l_Parent_0.Object);
local v4 = require(l_Parent_0.String);
local v5 = require(l_Parent_0.Error);
local v6 = require(l_Parent_0.instanceof);
local v7 = require(l_Parent_0.util.inspect);
local _ = require(l_Parent_0.types);
local v9 = {
    stderr = {
        isTTY = false, 
        columns = 0, 
        hasColors = function(...) --[[ Line: 24 ]] --[[ Name: hasColors ]]
            return true;
        end
    }
};
ErrorCaptureStackTrace = function(...) --[[ Line: 31 ]] --[[ Name: ErrorCaptureStackTrace ]]

end;
local function _(v10) --[[ Line: 34 ]] --[[ Name: removeColors ]]
    return v10;
end;
local v12 = "";
local v13 = "";
local v14 = "";
local v15 = "";
local v16 = {
    deepStrictEqual = "Expected values to be strictly deep-equal:", 
    strictEqual = "Expected values to be strictly equal:", 
    strictEqualObject = "Expected \"actual\" to be reference-equal to \"expected\":", 
    deepEqual = "Expected values to be loosely deep-equal:", 
    notDeepStrictEqual = "Expected \"actual\" not to be strictly deep-equal to:", 
    notStrictEqual = "Expected \"actual\" to be strictly unequal to:", 
    notStrictEqualObject = "Expected \"actual\" not to be reference-equal to \"expected\":", 
    notDeepEqual = "Expected \"actual\" not to be loosely deep-equal to:", 
    notIdentical = "Values have same structure but are not reference-equal:", 
    notDeepEqualUnequal = "Expected values not to be loosely deep-equal:"
};
local _ = function(v17) --[[ Line: 62 ]] --[[ Name: copyError ]]
    -- upvalues: v3 (copy)
    local v18 = v3.keys(v17);
    local v19 = {};
    for _, v21 in v18 do
        v19[v21] = v17[v21];
    end;
    v19.message = v17.message;
    return v19;
end;
local function _(v23) --[[ Line: 73 ]] --[[ Name: inspectValue ]]
    -- upvalues: v7 (copy)
    return v7(v23, {
        compact = false, 
        customInspect = false, 
        depth = 1000, 
        maxArrayLength = 1e999, 
        showHidden = false, 
        showProxy = false, 
        sorted = true, 
        getters = true
    });
end;
local function v56(v25, v26, v27) --[[ Line: 88 ]] --[[ Name: createErrDiff ]]
    -- upvalues: v7 (copy), v4 (copy), v2 (copy), v16 (copy), v9 (copy), v12 (ref), v15 (ref), v1 (copy), v13 (ref), v14 (ref)
    local v28 = "";
    local v29 = "";
    local v30 = "";
    local v31 = false;
    local v32 = v7(v25, {
        compact = false, 
        customInspect = false, 
        depth = 1000, 
        maxArrayLength = 1e999, 
        showHidden = false, 
        showProxy = false, 
        sorted = true, 
        getters = true
    });
    local v33 = v4.split(v32, "\n");
    local v34 = v4.split(v7(v26, {
        compact = false, 
        customInspect = false, 
        depth = 1000, 
        maxArrayLength = 1e999, 
        showHidden = false, 
        showProxy = false, 
        sorted = true, 
        getters = true
    }), "\n");
    local v35 = 0;
    local v36 = "";
    if v27 == "strictEqual" and (typeof(v25) == "table" and v25 ~= nil and typeof(v26) == "table" and v26 ~= nil or typeof(v25) == "function" and typeof(v26) == "function") then
        v27 = "strictEqualObject";
    end;
    if #v33 == 1 and #v34 == 1 and v33[1] ~= v34[1] then
        local v37 = v33[1];
        local v38 = if v2.toJSBoolean(false) then v34[1] else v34[1];
        local v39 = string.len(v37) + string.len(v38);
        if v39 <= 12 then
            if (typeof(v25) ~= "table" or v25 == nil) and (typeof(v26) ~= "table" or v26 == nil) and (v25 ~= 0 or v26 ~= 0) then
                return ("%s\n\n"):format(v16[v27]) .. ("%s !== %s\n"):format(v33[1], v34[1]);
            end;
        elseif v27 ~= "strictEqualObject" and v39 < if v9.stderr.isTTY then v9.stderr.columns else 80 then
            while string.sub(v37, v35 + 1, v35 + 1) == string.sub(v38, v35 + 1, v35 + 1) do
                v35 = v35 + 1;
            end;
            if v35 > 2 then
                v36 = ("\n  %s^"):format(string.rep(" ", v35));
                v35 = 0;
            end;
        end;
    end;
    local v40 = v33[#v33];
    local v41 = v34[#v34];
    while v40 == v41 do
        local l_v35_0 = v35;
        v35 = v35 + 1;
        if l_v35_0 < 3 then
            v30 = ("\n  %s%s"):format(v40, v30);
        else
            v28 = v40;
        end;
        table.remove(v33);
        table.remove(v34);
        if #v33 ~= 0 and #v34 ~= 0 then
            v40 = v33[#v33];
            v41 = v34[#v34];
        else
            break;
        end;
    end;
    local v43 = math.max(#v33, #v34);
    if v43 == 0 then
        local v44 = v4.split(v32, "\n");
        if #v44 > 50 then
            v44[47] = ("%s...%s"):format(v12, v15);
            while #v44 > 47 do
                table.remove(v44);
            end;
        end;
        return ("%s\n\n"):format(v16.notIdentical) .. ("%s\n"):format(v1.join(v44, "\n"));
    else
        if v35 >= 5 then
            v30 = ("\n%s...%s%s"):format(v12, v15, v30);
            v31 = true;
        end;
        if v28 ~= "" then
            v30 = ("\n  %s%s"):format(v28, v30);
            v28 = "";
        end;
        local v45 = 0;
        local v46 = 0;
        local v47 = v16[v27] .. ("\n%s+ actual%s %s- expected%s"):format(v13, v15, v14, v15);
        local v48 = (" %s...%s Lines skipped"):format(v12, v15);
        local l_v33_0 = v33;
        local v50 = ("%s+%s"):format(v13, v15);
        local v51 = #v34;
        if #v33 < v43 then
            l_v33_0 = v34;
            v50 = ("%s-%s"):format(v14, v15);
            v51 = #v33;
        end;
        for v52 = 1, v43 do
            v35 = v52;
            if v51 < v52 then
                if v46 > 2 then
                    if v46 > 3 then
                        if v46 > 4 then
                            if v46 == 5 then
                                v29 = v29 .. ("\n  %s"):format(l_v33_0[v52 - 3]);
                                v45 = v45 + 1;
                            else
                                v29 = v29 .. ("\n%s...%s"):format(v12, v15);
                                v31 = true;
                            end;
                        end;
                        v29 = v29 .. ("\n  %s"):format(l_v33_0[v52 - 2]);
                        v45 = v45 + 1;
                    end;
                    v29 = v29 .. ("\n  %s"):format(l_v33_0[v52 - 1]);
                    v45 = v45 + 1;
                end;
                v46 = 0;
                if l_v33_0 == v33 then
                    v29 = v29 .. ("\n%s %s"):format(v50, l_v33_0[v52]);
                else
                    v28 = v28 .. ("\n%s %s"):format(v50, l_v33_0[v52]);
                end;
                v45 = v45 + 1;
            else
                local v53 = v34[v52];
                local v54 = v33[v52];
                local v55 = false;
                if v54 ~= v53 then
                    v55 = not v2.toJSBoolean(v4.endsWith(v54, ",")) or v4.slice(v54, 0, -1) ~= v53;
                end;
                if v55 and v4.endsWith(v53, ",") and v4.slice(v53, 0, -1) == v54 then
                    v55 = false;
                    v54 = v54 .. ",";
                end;
                if v55 then
                    if v46 > 2 then
                        if v46 > 3 then
                            if v46 > 4 then
                                if v46 == 5 then
                                    v29 = v29 .. ("\n  %s"):format(v33[v52 - 3]);
                                    v45 = v45 + 1;
                                else
                                    v29 = v29 .. ("\n%s...%s"):format(v12, v15);
                                    v31 = true;
                                end;
                            end;
                            v29 = v29 .. ("\n  %s"):format(v33[v52 - 2]);
                            v45 = v45 + 1;
                        end;
                        v29 = v29 .. ("\n  %s"):format(v33[v52 - 1]);
                        v45 = v45 + 1;
                    end;
                    v46 = 0;
                    v29 = v29 .. ("\n%s+%s %s"):format(v13, v15, v54);
                    v28 = v28 .. ("\n%s-%s %s"):format(v14, v15, v53);
                    v45 = v45 + 2;
                else
                    v29 = v29 .. v28;
                    v28 = "";
                    v46 = v46 + 1;
                    if v46 <= 2 then
                        v29 = v29 .. ("\n  %s"):format(v54);
                        v45 = v45 + 1;
                    end;
                end;
            end;
            if v45 > 50 and v52 < v43 - 2 then
                return ("%s%s\n%s\n%s...%s%s\n"):format(v47, v48, v29, v12, v15, v28) .. ("%s...%s"):format(v12, v15);
            end;
        end;
        return ("%s%s\n%s%s%s%s"):format(v47, if v31 then v48 else "", v29, v28, v30, v36);
    end;
end;
local v57 = setmetatable({}, {
    __index = v5
});
v57.__index = v57;
v57.__tostring = function(v58) --[[ Line: 368 ]]
    return v58:toString();
end;
v57.new = function(v59) --[[ Line: 381 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v57 (copy), v9 (copy), v12 (ref), v13 (ref), v15 (ref), v14 (ref), v1 (copy), v3 (copy), v6 (copy), v56 (copy), v16 (copy), v4 (copy), v7 (copy), v2 (copy)
    local v60 = nil;
    local l_message_0 = v59.message;
    local l_operator_0 = v59.operator;
    local l_stackStartFn_0 = v59.stackStartFn;
    local l_actual_0 = v59.actual;
    local l_expected_0 = v59.expected;
    if l_message_0 ~= nil then
        v60 = setmetatable(v5.new((tostring(l_message_0))), v57);
    else
        if v9.stderr.isTTY then
            if v9.stderr:hasColors() then
                v12 = "\027[34m";
                v13 = "\027[32m";
                v15 = "\027[39m";
                v14 = "\027[31m";
            else
                v12 = "";
                v13 = "";
                v15 = "";
                v14 = "";
            end;
        end;
        if typeof(l_actual_0) == "table" and l_actual_0 ~= nil and typeof(l_expected_0) == "table" and l_expected_0 ~= nil and v1.indexOf(v3.keys(l_actual_0), "stack") ~= -1 and v6(l_actual_0, v5) and v1.indexOf(v3.keys(l_expected_0), "stack") ~= -1 and v6(l_expected_0, v5) then
            local l_l_actual_0_0 = l_actual_0;
            local v67 = v3.keys(l_l_actual_0_0);
            local v68 = {};
            for _, v70 in v67 do
                v68[v70] = l_l_actual_0_0[v70];
            end;
            v68.message = l_l_actual_0_0.message;
            l_actual_0 = v68;
            l_l_actual_0_0 = l_expected_0;
            v67 = v3.keys(l_l_actual_0_0);
            v68 = {};
            for _, v72 in v67 do
                v68[v72] = l_l_actual_0_0[v72];
            end;
            v68.message = l_l_actual_0_0.message;
            l_expected_0 = v68;
        end;
        if l_operator_0 == "deepStrictEqual" or l_operator_0 == "strictEqual" then
            v60 = setmetatable(v5.new(v56(l_actual_0, l_expected_0, l_operator_0)), v57);
        elseif l_operator_0 == "notDeepStrictEqual" or l_operator_0 == "notStrictEqual" then
            local v73 = v16[l_operator_0];
            local v74 = v4.split(v7(l_actual_0, {
                compact = false, 
                customInspect = false, 
                depth = 1000, 
                maxArrayLength = 1e999, 
                showHidden = false, 
                showProxy = false, 
                sorted = true, 
                getters = true
            }), "\n");
            if l_operator_0 == "notStrictEqual" and (typeof(l_actual_0) == "table" and l_actual_0 ~= nil or typeof(l_actual_0) == "function") then
                v73 = v16.notStrictEqualObject;
            end;
            if #v74 > 50 then
                v74[47] = ("%s...%s"):format(v12, v15);
                while #v74 > 47 do
                    table.remove(v74);
                end;
            end;
            v60 = if #v74 == 1 then setmetatable(v5.new(("%s%s%s"):format(v73, string.len(v74[1]) > 5 and "\n\n" or " ", v74[1])), v57) else setmetatable(v5.new(("%s\n\n%s\n"):format(v73, v1.join(v74, "\n"))), v57);
        else
            local v75 = v7(l_actual_0, {
                compact = false, 
                customInspect = false, 
                depth = 1000, 
                maxArrayLength = 1e999, 
                showHidden = false, 
                showProxy = false, 
                sorted = true, 
                getters = true
            });
            local v76 = v7(l_expected_0, {
                compact = false, 
                customInspect = false, 
                depth = 1000, 
                maxArrayLength = 1e999, 
                showHidden = false, 
                showProxy = false, 
                sorted = true, 
                getters = true
            });
            local v77 = v16[tostring(l_operator_0)];
            if l_operator_0 == "notDeepEqual" and v75 == v76 then
                v75 = ("%s\n\n%s"):format(v77, v75);
                if string.len(v75) > 1024 then
                    v75 = ("%s..."):format(v4.slice(v75, 0, 1021));
                end;
                v60 = setmetatable(v5.new(v75), v57);
            else
                if string.len(v75) > 512 then
                    v75 = ("%s..."):format(v4.slice(v75, 0, 509));
                end;
                if string.len(v76) > 512 then
                    v76 = ("%s..."):format(v4.slice(v76, 0, 509));
                end;
                if l_operator_0 == "deepEqual" then
                    v75 = ("%s\n\n%s\n\nshould loosely deep-equal\n\n"):format(v77, v75);
                else
                    local v78 = v16[("%sUnequal"):format((tostring(l_operator_0)))];
                    if v2.toJSBoolean(v78) then
                        v75 = ("%s\n\n%s\n\nshould not loosely deep-equal\n\n"):format(v78, v75);
                    else
                        v76 = (" %s %s"):format(tostring(l_operator_0), v76);
                    end;
                end;
                v60 = setmetatable(v5.new(("%s%s"):format(v75, v76)), v57);
            end;
        end;
    end;
    v60.generatedMessage = not v2.toJSBoolean(l_message_0);
    v60.name = "AssertionError [ERR_ASSERTION]";
    v60.code = "ERR_ASSERTION";
    v60.actual = l_actual_0;
    v60.expected = l_expected_0;
    v60.operator = l_operator_0;
    ErrorCaptureStackTrace(v60, l_stackStartFn_0);
    v60.name = "AssertionError";
    return v60;
end;
v57.toString = function(v79) --[[ Line: 550 ]] --[[ Name: toString ]]
    return ("%s [%s]: %s"):format(v79.name, v79.code, v79.message);
end;
v57.name = "AssertionError";
return {
    AssertionError = v57
};