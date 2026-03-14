local v0 = require(script.Parent.RobloxTransport);
local v1 = require(script.Parent.Version);
local v2 = game:GetService("RunService"):IsStudio();
local function _(v3) --[[ Line: 8 ]] --[[ Name: isTableEmpty ]]
    return next(v3) == nil;
end;
local function _(v5, v6) --[[ Line: 13 ]] --[[ Name: parseJSON ]]
    if type(v6) ~= "string" then
        return nil, "Input is not a string";
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 18 ]]
            -- upvalues: v5 (copy), v6 (copy)
            return v5:JSONDecode(v6);
        end);
        if l_status_0 then
            return l_result_0, nil;
        else
            return nil, (tostring(l_result_0));
        end;
    end;
end;
local _ = function(v10, v11) --[[ Line: 30 ]] --[[ Name: createCallbackWithEventId ]]
    if not v11 then
        return nil;
    else
        return function(v12, v13) --[[ Line: 41 ]]
            -- upvalues: v10 (copy), v11 (copy)
            local v14 = nil;
            local v15 = nil;
            if v12 and v13 and v13.body then
                if type(v13.body) == "table" and v13.body.Body then
                    local l_v10_0 = v10;
                    local l_Body_0 = v13.body.Body;
                    local v18;
                    if type(l_Body_0) ~= "string" then
                        v18 = nil;
                        local _ = "Input is not a string";
                    else
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 18 ]]
                            -- upvalues: l_v10_0 (copy), l_Body_0 (copy)
                            return l_v10_0:JSONDecode(l_Body_0);
                        end);
                        if l_status_1 then
                            v18 = l_result_1;
                            local _ = nil;
                        else
                            v18 = nil;
                            local _ = tostring(l_result_1);
                        end;
                    end;
                    if v18 and v18.id then
                        v14 = v18.id;
                    end;
                end;
                v15 = v13;
            elseif v13 then
                v15 = v13;
            end;
            v11(v12, v15, v14);
        end;
    end;
end;
local v25 = {};
v25.__index = v25;
v25.new = function(_, v27, v28) --[[ Line: 143 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v25 (copy)
    if not v27.dsn then
        error("DSN is required");
    end;
    return (setmetatable({
        transport = v0:new(v27.dsn, v28), 
        httpService = v28, 
        user = nil, 
        tags = {}, 
        extra = {}, 
        breadcrumbs = {}, 
        config = v27
    }, v25));
end;
v25.capture_message = function(v29, v30, v31, v32) --[[ Line: 166 ]] --[[ Name: capture_message ]]
    -- upvalues: v1 (copy)
    local v33 = v31 or "info";
    local v34 = {
        message = {
            message = v30
        }, 
        level = v33, 
        timestamp = os.time(), 
        environment = v29.config.environment or "production", 
        release = v29.config.release or "unknown", 
        platform = "roblox", 
        sdk = {
            name = "sentry.lua", 
            version = v1.SDK_VERSION
        }, 
        server_name = "roblox-server", 
        user = v29.user, 
        tags = v29.tags
    };
    local l_extra_0 = v29.extra;
    v34.extra = if next(l_extra_0) == nil then nil else v29.extra;
    v34.breadcrumbs = v29.breadcrumbs;
    v34.contexts = {
        roblox = {
            version = v1.SDK_VERSION, 
            place_id = tostring(game.PlaceId), 
            job_id = game.JobId or "unknown"
        }
    };
    local l_httpService_0 = v29.httpService;
    local v49 = if not v32 then nil else function(v37, v38) --[[ Line: 41 ]]
        -- upvalues: l_httpService_0 (copy), v32 (copy)
        local v39 = nil;
        local v40 = nil;
        if v37 and v38 and v38.body then
            if type(v38.body) == "table" and v38.body.Body then
                local l_l_httpService_0_0 = l_httpService_0;
                local l_Body_1 = v38.body.Body;
                local v43;
                if type(l_Body_1) ~= "string" then
                    v43 = nil;
                    local _ = "Input is not a string";
                else
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 18 ]]
                        -- upvalues: l_l_httpService_0_0 (copy), l_Body_1 (copy)
                        return l_l_httpService_0_0:JSONDecode(l_Body_1);
                    end);
                    if l_status_2 then
                        v43 = l_result_2;
                        local _ = nil;
                    else
                        v43 = nil;
                        local _ = tostring(l_result_2);
                    end;
                end;
                if v43 and v43.id then
                    v39 = v43.id;
                end;
            end;
            v40 = v38;
        elseif v38 then
            v40 = v38;
        end;
        v32(v37, v40, v39);
    end;
    v29.transport:send(v34, v49);
end;
v25.capture_exception = function(v50, v51, v52, v53, v54, v55) --[[ Line: 209 ]] --[[ Name: capture_exception ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v56 = v52 or "error";
    local v57 = {
        roblox = {
            version = v1.SDK_VERSION, 
            place_id = tostring(game.PlaceId), 
            job_id = game.JobId or "unknown"
        }
    };
    if v53 then
        for v58, v59 in pairs(v53) do
            v57[v58] = v59;
        end;
    end;
    local v60 = {
        type = v51.type or "RobloxError", 
        value = v51.message or tostring(v51)
    };
    if v51.stacktrace and v51.stacktrace.frames and #v51.stacktrace.frames > 0 then
        v60.stacktrace = v51.stacktrace;
    end;
    local v61 = {
        values = {
            v60
        }
    };
    if v2 then
        print("\240\159\148\141 Exception structure:", v61);
    end;
    local v62 = {
        exception = v61, 
        level = v56, 
        timestamp = os.time(), 
        environment = v50.config.environment or "production", 
        release = v50.config.release or "unknown", 
        platform = "roblox", 
        sdk = {
            name = "sentry.lua", 
            version = v1.SDK_VERSION
        }, 
        server_name = "roblox-server", 
        user = v50.user, 
        tags = v50.tags
    };
    local l_extra_1 = v50.extra;
    v62.extra = if next(l_extra_1) == nil then nil else v50.extra;
    v62.breadcrumbs = v50.breadcrumbs;
    v62.contexts = v57;
    if v54 then
        v62.threads = v54;
    end;
    local l_httpService_1 = v50.httpService;
    local v77 = if not v55 then nil else function(v65, v66) --[[ Line: 41 ]]
        -- upvalues: l_httpService_1 (copy), v55 (copy)
        local v67 = nil;
        local v68 = nil;
        if v65 and v66 and v66.body then
            if type(v66.body) == "table" and v66.body.Body then
                local l_l_httpService_1_0 = l_httpService_1;
                local l_Body_2 = v66.body.Body;
                local v71;
                if type(l_Body_2) ~= "string" then
                    v71 = nil;
                    local _ = "Input is not a string";
                else
                    local l_status_3, l_result_3 = pcall(function() --[[ Line: 18 ]]
                        -- upvalues: l_l_httpService_1_0 (copy), l_Body_2 (copy)
                        return l_l_httpService_1_0:JSONDecode(l_Body_2);
                    end);
                    if l_status_3 then
                        v71 = l_result_3;
                        local _ = nil;
                    else
                        v71 = nil;
                        local _ = tostring(l_result_3);
                    end;
                end;
                if v71 and v71.id then
                    v67 = v71.id;
                end;
            end;
            v68 = v66;
        elseif v66 then
            v68 = v66;
        end;
        v55(v65, v68, v67);
    end;
    v50.transport:send(v62, v77);
end;
v25.send_event_with_attachments = function(v78, v79, v80, v81) --[[ Line: 288 ]] --[[ Name: send_event_with_attachments ]]
    if not v79 or #v80 == 0 then
        if v81 then
            v81(false, {
                error = "eventId and attachments are required"
            }, nil);
        end;
        return;
    else
        local l_httpService_2 = v78.httpService;
        local v95 = if not v81 then nil else function(v83, v84) --[[ Line: 41 ]]
            -- upvalues: l_httpService_2 (copy), v81 (copy)
            local v85 = nil;
            local v86 = nil;
            if v83 and v84 and v84.body then
                if type(v84.body) == "table" and v84.body.Body then
                    local l_l_httpService_2_0 = l_httpService_2;
                    local l_Body_3 = v84.body.Body;
                    local v89;
                    if type(l_Body_3) ~= "string" then
                        v89 = nil;
                        local _ = "Input is not a string";
                    else
                        local l_status_4, l_result_4 = pcall(function() --[[ Line: 18 ]]
                            -- upvalues: l_l_httpService_2_0 (copy), l_Body_3 (copy)
                            return l_l_httpService_2_0:JSONDecode(l_Body_3);
                        end);
                        if l_status_4 then
                            v89 = l_result_4;
                            local _ = nil;
                        else
                            v89 = nil;
                            local _ = tostring(l_result_4);
                        end;
                    end;
                    if v89 and v89.id then
                        v85 = v89.id;
                    end;
                end;
                v86 = v84;
            elseif v84 then
                v86 = v84;
            end;
            v81(v83, v86, v85);
        end;
        v78.transport:send_attachments(v79, v80, v95);
        return;
    end;
end;
v25.set_user = function(v96, v97) --[[ Line: 310 ]] --[[ Name: set_user ]]
    v96.user = v97;
end;
v25.set_tag = function(v98, v99, v100) --[[ Line: 315 ]] --[[ Name: set_tag ]]
    v98.tags[v99] = tostring(v100);
end;
v25.set_extra = function(v101, v102, v103) --[[ Line: 320 ]] --[[ Name: set_extra ]]
    v101.extra[v102] = v103;
end;
v25.add_breadcrumb = function(v104, v105) --[[ Line: 325 ]] --[[ Name: add_breadcrumb ]]
    v105.timestamp = os.time();
    table.insert(v104.breadcrumbs, v105);
    if #v104.breadcrumbs > 50 then
        table.remove(v104.breadcrumbs, 1);
    end;
end;
return v25;