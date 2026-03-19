local function _(v0) --[[ Line: 3 ]] --[[ Name: rine ]]
    return v0 and #v0 > 0 and v0;
end;
local function _(v2) --[[ Line: 6 ]] --[[ Name: rit ]]
    local v3 = false;
    if type(v2) == "table" then
        v3 = v2;
    end;
    return v3;
end;
local function _() --[[ Line: 10 ]] --[[ Name: dont_crash ]]
    if math.random() <= 0.004 then
        wait();
    end;
    return true;
end;
local function v6() --[[ Line: 18 ]]

end;
local function _(v7) --[[ Line: 19 ]]
    return string.gsub(v7, "([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1");
end;
local l_tostring_0 = tostring;
local l_char_0 = string.char;
local v11 = {};
local v16 = v11.silent and v6 or function(v12, v13, ...) --[[ Line: 26 ]]
    -- upvalues: v11 (copy)
    local _ = v12 == "i" and "stdout" or "stderr";
    local v15 = (" [%s] "):format(v12:upper());
    print("[HTMLParser]" .. v15 .. v13:format(...) .. (v11.nonl or "\n"));
end;
local v18 = v11.noerr and v6 or function(v17, ...) --[[ Line: 32 ]]
    -- upvalues: v16 (copy)
    v16("e", v17, ...);
end;
if not v11.noout or not v6 then
    local function _(v19, ...) --[[ Line: 36 ]]
        -- upvalues: v16 (copy)
        v16("i", v19, ...);
    end;
end;
local v22 = v11.debug and function(v21, ...) --[[ Line: 41 ]]
    -- upvalues: v16 (copy), v6 (copy), l_tostring_0 (copy)
    v16("d", v21:gsub("#LINE#", (l_tostring_0(v6(3)))), ...);
end or v6;
local v23 = require(script.ElementNode);
local v24 = require(script.voidelements);
return {
    parse = function(v25, v26, v27) --[[ Line: 53 ]] --[[ Name: parse ]]
        -- upvalues: v11 (copy), l_tostring_0 (copy), l_char_0 (copy), v22 (copy), v18 (copy), v23 (copy), v24 (copy)
        local l_v11_0 = v11;
        local v29 = l_v11_0 and #l_v11_0 > 0 and l_v11_0 or {} or {};
        v29.looplimit = v29.looplimit or 100000000;
        l_v11_0 = l_tostring_0(v25);
        local v30 = v26 or v29.looplimit or 100000000;
        local v31 = false;
        if not v29.keep_comments then
            l_v11_0 = l_v11_0:gsub("<!%-%-.-%-%->", "");
        end;
        local v32 = {};
        if not v29.keep_danger_placeholders then
            local v33 = {};
            local v34 = 0;
            repeat
                local v35 = l_char_0(v34);
                if not l_v11_0:match(v35) then
                    if not v32["<"] or not v32[">"] then
                        if not v33[v34] then
                            if not v32["<"] then
                                v32["<"] = v35;
                            elseif not v32[">"] then
                                v32[">"] = v35;
                            end;
                            v33[v34] = true;
                            v22("c:{%s}||cc:{%d}||tpr[c]:{%s}", l_tostring_0(c), v35:byte(), (l_tostring_0(v32[c])));
                            v22("busy[i]:{%s},i:{%d}", l_tostring_0(v33[v34]), v34);
                            v22("[FindPH]:#LINE# Success! || i=%d", v34);
                        else
                            v22("[FindPH]:#LINE# Busy! || i=%d", v34);
                        end;
                        v22("c:{%s}||cc:{%d}||tpr[c]:{%s}", c, v35:byte(), (l_tostring_0(v32[c])));
                        v22("%s", (l_tostring_0(v33[v34])));
                    else
                        v22("[FindPH]:#LINE# Done!", v34);
                        break;
                    end;
                else
                    v22("[FindPH]:#LINE# Text contains this byte! || i=%d", v34);
                end;
                local v36 = 1;
                if v34 == 31 then
                    v36 = 96;
                end;
                v34 = v34 + v36;
            until v34 == 255;
            v34 = nil;
            if not v32["<"] or not v32[">"] then
                v18("Impossible to find at least two unused byte codes in this HTML-code. We need it to escape bracket-contained placeholders inside tags.");
                v18("Consider enabling 'keep_danger_placeholders' option (to silence this error, if parser wasn't failed with current HTML-code) or manually replace few random bytes, to free up the codes.");
            else
                v22("[FindPH]:#LINE# Found! || '<'=%d, '>'=%d", v32["<"]:byte(), v32[">"]:byte());
            end;
            local function v40(v37, ...) --[[ Line: 124 ]] --[[ Name: g ]]
                -- upvalues: v32 (copy), v31 (ref), v22 (ref), l_tostring_0 (ref)
                local v38 = {
                    ...
                };
                local v39 = v38[v37];
                v38[v37] = v38[v37]:gsub("(.)", v32);
                if v38[v37] ~= v39 then
                    v31 = true;
                    v22("[g]:#LINE# orig: %s", (l_tostring_0(v39)));
                    v22("[g]:#LINE# replaced: %s", (l_tostring_0(v38[v37])));
                end;
                v22("[g]:#LINE# called, id: %s, arg[id]: %s, args { " .. ("{%s}, "):rep(#v38):gsub(", $", "") .. " }", v37, v38[v37], ...);
                v22("[g]:#LINE# concat(arg): %s", table.concat(v38));
                return table.concat(v38);
            end;
            local l_v40_0 = v40 --[[ copy: 10 -> 33 ]];
            l_v11_0 = l_v11_0:gsub("(=[%s]-)(%b'')", function(...) --[[ Line: 144 ]]
                -- upvalues: l_v40_0 (copy)
                return l_v40_0(2, ...);
            end):gsub("(=[%s]-)(%b\"\")", function(...) --[[ Line: 146 ]]
                -- upvalues: l_v40_0 (copy)
                return l_v40_0(2, ...);
            end):gsub("(<" .. (v29.tpl_skip_pattern or "[^!]") .. ")([^>]+)" .. "(>)", function(...) --[[ Line: 150 ]]
                -- upvalues: l_v40_0 (copy)
                return l_v40_0(2, ...);
            end):gsub("(" .. (v32["<"] or "__FAILED__") .. ")(" .. (v29.tpl_marker_pattern or "[^%w%s]") .. ")([%g%s]-)" .. "(%2)(>)" .. "([^>]*>)", function(...) --[[ Line: 156 ]]
                -- upvalues: l_v40_0 (copy)
                return l_v40_0(5, ...);
            end);
        end;
        local v42 = 0;
        local v43 = v23:new(v42, (l_tostring_0(l_v11_0)));
        v43.page_url = v27;
        local l_v43_0 = v43;
        local v45 = true;
        local v46 = 1;
        local v47 = {};
        while true do
            if math.random() <= 0.004 then
                wait();
            end;
            if true then
                if v42 == v30 then
                    v18("Main loop reached loop limit (%d). Consider either increasing it or checking HTML-code for syntax errors", v30);
                    break;
                else
                    local v48 = nil;
                    local v49 = nil;
                    local v50, v51, v52 = v43._text:find("<([%w-]+)[^>]*>", v46);
                    v48 = v50;
                    v46 = v51;
                    v49 = v52;
                    v22("[MainLoop]:#LINE# openstart=%s || tpos=%s || name=%s", l_tostring_0(v48), l_tostring_0(v46), (l_tostring_0(v49)));
                    if v49 then
                        v42 = v42 + 1;
                        v50 = v23:new(v42, l_tostring_0(v49), l_v43_0 or {}, v45, v48, v46);
                        v50.page_url = v27;
                        l_v43_0 = v50;
                        v51 = nil;
                        v52 = v50:gettext();
                        local v53 = 1;
                        while true do
                            if math.random() <= 0.004 then
                                wait();
                            end;
                            if true then
                                if v51 == v30 then
                                    v18("Tag parsing loop reached loop limit (%d). Consider either increasing it or checking HTML-code for syntax errors", v30);
                                    break;
                                else
                                    local v54 = nil;
                                    local v55 = nil;
                                    local v56 = nil;
                                    local v57 = nil;
                                    local v58 = nil;
                                    local v59 = nil;
                                    local v60, v61, v62, v63, v64, v65, v66 = v52:find("%s+([^%s=/>]+)([%s]-)(=?)([%s]-)(['\"]?)", v53);
                                    v54 = v60;
                                    v53 = v61;
                                    v55 = v62;
                                    v59 = v63;
                                    v56 = v64;
                                    v59 = v65;
                                    v57 = v66;
                                    v22("[TagLoop]:#LINE# start=%s || apos=%s || k=%s || zsp='%s' || eq='%s', quote=[%s]", l_tostring_0(v54), l_tostring_0(v53), l_tostring_0(v55), l_tostring_0(v59), l_tostring_0(v56), (l_tostring_0(v57)));
                                    if v55 and v55 ~= "/>" and v55 ~= ">" then
                                        if v56 == "=" then
                                            v60 = "=([^%s>]*)";
                                            if v57 ~= "" then
                                                v60 = v57 .. "([^" .. v57 .. "]*)" .. v57;
                                            end;
                                            v61, v62, v63 = v52:find(v60, v53);
                                            v54 = v61;
                                            v53 = v62;
                                            v58 = v63;
                                            v22("[TagLoop]:#LINE# start=%s || apos=%s || v=%s || pattern=%s", l_tostring_0(v54), l_tostring_0(v53), l_tostring_0(v58), (l_tostring_0(v60)));
                                        end;
                                        v58 = v58 or "";
                                        if v31 then
                                            for v67, v68 in pairs(v32) do
                                                v58 = v58:gsub(v68, v67);
                                                v22("[TagLoop]:#LINE# rv=%s || rk=%s", l_tostring_0(v68), (l_tostring_0(v67)));
                                            end;
                                        end;
                                        v22("[TagLoop]:#LINE# k=%s || v=%s", l_tostring_0(v55), (l_tostring_0(v58)));
                                        v50:addattribute(v55, v58);
                                        v51 = (v51 or 0) + 1;
                                    else
                                        break;
                                    end;
                                end;
                            else
                                break;
                            end;
                        end;
                        if v24[v50.name:lower()] then
                            v45 = false;
                            v50:close();
                        else
                            v47[v50.name] = v47[v50.name] or {};
                            table.insert(v47[v50.name], v50);
                        end;
                        local l_v46_0 = v46;
                        local v70 = nil;
                        while true do
                            if math.random() <= 0.004 then
                                wait();
                            end;
                            if true then
                                if v70 == v30 then
                                    v18("Tag closing loop reached loop limit (%d). Consider either increasing it or checking HTML-code for syntax errors", v30);
                                    break;
                                else
                                    local v71 = nil;
                                    local v72 = nil;
                                    local v73 = nil;
                                    local v74, v75, v76, v77 = v43._text:find("[^<]*<(/?)([%w-]+)", l_v46_0);
                                    v71 = v74;
                                    l_v46_0 = v75;
                                    v72 = v76;
                                    v73 = v77;
                                    v22("[TagCloseLoop]:#LINE# closestart=%s || closeend=%s || closing=%s || closename=%s", l_tostring_0(v71), l_tostring_0(l_v46_0), l_tostring_0(v72), (l_tostring_0(v73)));
                                    if v72 and v72 ~= "" then
                                        v50 = table.remove(v47[v73] or {}) or v50;
                                        v71 = v43._text:find("<", v71);
                                        v22("[TagCloseLoop]:#LINE# closestart=%s", (l_tostring_0(v71)));
                                        v50:close(v71, l_v46_0 + 1);
                                        l_v43_0 = v50.parent;
                                        v45 = true;
                                        v70 = (v70 or 0) + 1;
                                    else
                                        break;
                                    end;
                                end;
                            else
                                break;
                            end;
                        end;
                    else
                        break;
                    end;
                end;
            else
                break;
            end;
        end;
        if v31 then
            v22("tpl");
            for v78, v79 in pairs(v32) do
                v43._text = v43._text:gsub(v79, v78);
            end;
        end;
        return v43;
    end
};