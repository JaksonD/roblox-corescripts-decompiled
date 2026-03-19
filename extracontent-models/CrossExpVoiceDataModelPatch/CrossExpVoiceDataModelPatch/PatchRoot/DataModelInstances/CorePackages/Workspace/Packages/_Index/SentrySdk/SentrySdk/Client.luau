local v0 = require(script.Parent.RobloxTransport);
local v1 = require(script.Parent.Version);
local v2 = game:GetService("RunService"):IsStudio();
local function _() --[[ Line: 8 ]] --[[ Name: isBundled ]]
    return type(_G.LUAUFORGE_BUNDLED_FILE_PATH) == "string";
end;
local function _(v4) --[[ Line: 13 ]] --[[ Name: isTableEmpty ]]
    return next(v4) == nil;
end;
local function _(v6, v7) --[[ Line: 18 ]] --[[ Name: parseJSON ]]
    if type(v7) ~= "string" then
        return nil, "Input is not a string";
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 23 ]]
            -- upvalues: v6 (copy), v7 (copy)
            return v6:JSONDecode(v7);
        end);
        if l_status_0 then
            return l_result_0, nil;
        else
            return nil, (tostring(l_result_0));
        end;
    end;
end;
local _ = function(v11, v12) --[[ Line: 35 ]] --[[ Name: createCallbackWithEventId ]]
    if not v12 then
        return nil;
    else
        return function(v13, v14) --[[ Line: 46 ]]
            -- upvalues: v11 (copy), v12 (copy)
            local v15 = nil;
            local v16 = nil;
            if v13 and v14 and v14.body then
                if type(v14.body) == "table" and v14.body.Body then
                    local l_v11_0 = v11;
                    local l_Body_0 = v14.body.Body;
                    local v19;
                    if type(l_Body_0) ~= "string" then
                        v19 = nil;
                        local _ = "Input is not a string";
                    else
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 23 ]]
                            -- upvalues: l_v11_0 (copy), l_Body_0 (copy)
                            return l_v11_0:JSONDecode(l_Body_0);
                        end);
                        if l_status_1 then
                            v19 = l_result_1;
                            local _ = nil;
                        else
                            v19 = nil;
                            local _ = tostring(l_result_1);
                        end;
                    end;
                    if v19 and v19.id then
                        v15 = v19.id;
                    end;
                end;
                v16 = v14;
            elseif v14 then
                v16 = v14;
            end;
            v12(v13, v16, v15);
        end;
    end;
end;
local v26 = {};
v26.__index = v26;
v26.new = function(_, v28, v29) --[[ Line: 148 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v26 (copy)
    if not v28.dsn then
        error("DSN is required");
    end;
    return (setmetatable({
        transport = v0:new(v28.dsn, v29), 
        httpService = v29, 
        user = nil, 
        tags = {}, 
        extra = {}, 
        breadcrumbs = {}, 
        config = v28
    }, v26));
end;
v26._buildDebugMeta = function(_) --[[ Line: 179 ]] --[[ Name: _buildDebugMeta ]]
    local l_LUAUFORGE_SENTRY_DEBUG_IDS_0 = _G.LUAUFORGE_SENTRY_DEBUG_IDS;
    if type(l_LUAUFORGE_SENTRY_DEBUG_IDS_0) ~= "table" then
        return nil;
    else
        local v32 = {};
        for v33, v34 in l_LUAUFORGE_SENTRY_DEBUG_IDS_0 do
            table.insert(v32, {
                type = "sourcemap", 
                code_file = v33, 
                debug_id = v34
            });
        end;
        if #v32 == 0 then
            return nil;
        else
            return {
                images = v32
            };
        end;
    end;
end;
v26.capture_message = function(v35, v36, v37, v38) --[[ Line: 205 ]] --[[ Name: capture_message ]]
    -- upvalues: v1 (copy)
    local v39 = v37 or "info";
    local v40 = {
        message = {
            message = v36
        }, 
        level = v39, 
        timestamp = os.time(), 
        environment = v35.config.environment or "production", 
        release = v35.config.release or "unknown", 
        platform = "roblox", 
        sdk = {
            name = "sentry.lua", 
            version = v1.SDK_VERSION
        }, 
        server_name = "roblox-server", 
        user = v35.user, 
        tags = v35.tags
    };
    local l_extra_0 = v35.extra;
    v40.extra = if next(l_extra_0) == nil then nil else v35.extra;
    v40.breadcrumbs = v35.breadcrumbs;
    v40.contexts = {
        roblox = {
            version = v1.SDK_VERSION, 
            place_id = tostring(game.PlaceId), 
            job_id = game.JobId or "unknown"
        }
    };
    local l_httpService_0 = v35.httpService;
    local v55 = if not v38 then nil else function(v43, v44) --[[ Line: 46 ]]
        -- upvalues: l_httpService_0 (copy), v38 (copy)
        local v45 = nil;
        local v46 = nil;
        if v43 and v44 and v44.body then
            if type(v44.body) == "table" and v44.body.Body then
                local l_l_httpService_0_0 = l_httpService_0;
                local l_Body_1 = v44.body.Body;
                local v49;
                if type(l_Body_1) ~= "string" then
                    v49 = nil;
                    local _ = "Input is not a string";
                else
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 23 ]]
                        -- upvalues: l_l_httpService_0_0 (copy), l_Body_1 (copy)
                        return l_l_httpService_0_0:JSONDecode(l_Body_1);
                    end);
                    if l_status_2 then
                        v49 = l_result_2;
                        local _ = nil;
                    else
                        v49 = nil;
                        local _ = tostring(l_result_2);
                    end;
                end;
                if v49 and v49.id then
                    v45 = v49.id;
                end;
            end;
            v46 = v44;
        elseif v44 then
            v46 = v44;
        end;
        v38(v43, v46, v45);
    end;
    v35.transport:send(v40, v55);
end;
v26.capture_exception = function(v56, v57, v58, v59, v60, v61) --[[ Line: 248 ]] --[[ Name: capture_exception ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v62 = v58 or "error";
    local v63 = {
        roblox = {
            version = v1.SDK_VERSION, 
            place_id = tostring(game.PlaceId), 
            job_id = game.JobId or "unknown"
        }
    };
    if v59 then
        for v64, v65 in pairs(v59) do
            v63[v64] = v65;
        end;
    end;
    local v66 = {
        type = v57.type or "RobloxError", 
        value = v57.message or tostring(v57)
    };
    if v57.stacktrace and v57.stacktrace.frames and #v57.stacktrace.frames > 0 then
        v66.stacktrace = v57.stacktrace;
        if type(_G.LUAUFORGE_BUNDLED_FILE_PATH) == "string" then
            for _, v68 in v57.stacktrace.frames do
                v68.platform = "javascript";
            end;
        end;
    end;
    local v69 = {
        values = {
            v66
        }
    };
    if v2 then
        print("\240\159\148\141 Exception structure:", v69);
    end;
    local v70 = {
        exception = v69, 
        level = v62, 
        timestamp = os.time(), 
        environment = v56.config.environment or "production", 
        release = v56.config.release or "unknown", 
        platform = "roblox", 
        sdk = {
            name = "sentry.lua", 
            version = v1.SDK_VERSION
        }, 
        server_name = "roblox-server", 
        user = v56.user, 
        tags = v56.tags
    };
    local l_extra_1 = v56.extra;
    v70.extra = if next(l_extra_1) == nil then nil else v56.extra;
    v70.breadcrumbs = v56.breadcrumbs;
    v70.contexts = v63;
    if v60 then
        v70.threads = v60;
    end;
    v70.debug_meta = v56:_buildDebugMeta();
    local l_httpService_1 = v56.httpService;
    local v85 = if not v61 then nil else function(v73, v74) --[[ Line: 46 ]]
        -- upvalues: l_httpService_1 (copy), v61 (copy)
        local v75 = nil;
        local v76 = nil;
        if v73 and v74 and v74.body then
            if type(v74.body) == "table" and v74.body.Body then
                local l_l_httpService_1_0 = l_httpService_1;
                local l_Body_2 = v74.body.Body;
                local v79;
                if type(l_Body_2) ~= "string" then
                    v79 = nil;
                    local _ = "Input is not a string";
                else
                    local l_status_3, l_result_3 = pcall(function() --[[ Line: 23 ]]
                        -- upvalues: l_l_httpService_1_0 (copy), l_Body_2 (copy)
                        return l_l_httpService_1_0:JSONDecode(l_Body_2);
                    end);
                    if l_status_3 then
                        v79 = l_result_3;
                        local _ = nil;
                    else
                        v79 = nil;
                        local _ = tostring(l_result_3);
                    end;
                end;
                if v79 and v79.id then
                    v75 = v79.id;
                end;
            end;
            v76 = v74;
        elseif v74 then
            v76 = v74;
        end;
        v61(v73, v76, v75);
    end;
    v56.transport:send(v70, v85);
end;
v26.send_event_with_attachments = function(v86, v87, v88, v89) --[[ Line: 339 ]] --[[ Name: send_event_with_attachments ]]
    if not v87 or #v88 == 0 then
        if v89 then
            v89(false, {
                error = "eventId and attachments are required"
            }, nil);
        end;
        return;
    else
        local l_httpService_2 = v86.httpService;
        local v103 = if not v89 then nil else function(v91, v92) --[[ Line: 46 ]]
            -- upvalues: l_httpService_2 (copy), v89 (copy)
            local v93 = nil;
            local v94 = nil;
            if v91 and v92 and v92.body then
                if type(v92.body) == "table" and v92.body.Body then
                    local l_l_httpService_2_0 = l_httpService_2;
                    local l_Body_3 = v92.body.Body;
                    local v97;
                    if type(l_Body_3) ~= "string" then
                        v97 = nil;
                        local _ = "Input is not a string";
                    else
                        local l_status_4, l_result_4 = pcall(function() --[[ Line: 23 ]]
                            -- upvalues: l_l_httpService_2_0 (copy), l_Body_3 (copy)
                            return l_l_httpService_2_0:JSONDecode(l_Body_3);
                        end);
                        if l_status_4 then
                            v97 = l_result_4;
                            local _ = nil;
                        else
                            v97 = nil;
                            local _ = tostring(l_result_4);
                        end;
                    end;
                    if v97 and v97.id then
                        v93 = v97.id;
                    end;
                end;
                v94 = v92;
            elseif v92 then
                v94 = v92;
            end;
            v89(v91, v94, v93);
        end;
        v86.transport:send_attachments(v87, v88, v103);
        return;
    end;
end;
v26.set_user = function(v104, v105) --[[ Line: 361 ]] --[[ Name: set_user ]]
    v104.user = v105;
end;
v26.set_tag = function(v106, v107, v108) --[[ Line: 366 ]] --[[ Name: set_tag ]]
    v106.tags[v107] = tostring(v108);
end;
v26.set_extra = function(v109, v110, v111) --[[ Line: 371 ]] --[[ Name: set_extra ]]
    v109.extra[v110] = v111;
end;
v26.add_breadcrumb = function(v112, v113) --[[ Line: 376 ]] --[[ Name: add_breadcrumb ]]
    v113.timestamp = os.time();
    table.insert(v112.breadcrumbs, v113);
    if #v112.breadcrumbs > 50 then
        table.remove(v112.breadcrumbs, 1);
    end;
end;
return v26;