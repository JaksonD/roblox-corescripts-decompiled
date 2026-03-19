local v0 = require(script.Parent.DsnUtils);
local v1 = {};
v1.__index = v1;
v1.new = function(_, v3, v4) --[[ Line: 47 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v5, v6 = v0.parse_dsn(v3 or "");
    if not v5 then
        error("Invalid DSN: " .. (v6 or "Unknown error"));
    end;
    return (setmetatable({
        httpServiceImpl = v4, 
        dsn = v5, 
        endpoint = v0.build_ingest_url(v5), 
        headers = {
            ["X-Sentry-Auth"] = v0.build_auth_header(v5)
        }
    }, v1));
end;
v1.send = function(v7, v8, v9) --[[ Line: 64 ]] --[[ Name: send ]]
    local v10 = v7.httpServiceImpl:JSONEncode(v8);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 68 ]]
        -- upvalues: v7 (copy), v10 (copy), v9 (copy)
        v7.httpServiceImpl:RequestInternal({
            Url = v7.endpoint, 
            Method = "POST", 
            Headers = v7.headers, 
            Body = v10
        }):Start(function(v11, v12) --[[ Line: 76 ]]
            -- upvalues: v9 (ref)
            if v9 then
                if v11 then
                    local v13 = {
                        error = nil, 
                        body = v12
                    };
                    v9(true, v13);
                    return;
                else
                    local v14 = {
                        error = "HTTP request failed: " .. tostring(v12), 
                        body = nil
                    };
                    v9(false, v14);
                end;
            end;
        end);
    end);
    if not l_status_0 and v9 then
        v9(false, {
            error = "Failed to create HTTP request: " .. tostring(l_result_0), 
            body = nil
        });
    end;
end;
v1.send_attachments = function(v17, v18, v19, v20) --[[ Line: 110 ]] --[[ Name: send_attachments ]]
    -- upvalues: v0 (copy)
    local l_httpServiceImpl_0 = v17.httpServiceImpl;
    if not v18 or #v19 == 0 then
        if v20 then
            v20(false, {
                error = "eventId and attachments are required", 
                body = nil
            });
        end;
        return;
    else
        local v22 = {
            (l_httpServiceImpl_0:JSONEncode({
                event_id = v18, 
                sent_at = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }))
        };
        for _, v24 in ipairs(v19) do
            table.insert(v22, (l_httpServiceImpl_0:JSONEncode({
                type = "attachment", 
                length = string.len(v24.data), 
                filename = v24.filename, 
                content_type = v24.content_type or "application/octet-stream"
            })));
            table.insert(v22, v24.data);
        end;
        local v25 = table.concat(v22, "\n");
        local v26 = v0.build_envelope_url(v17.dsn);
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 154 ]]
            -- upvalues: l_httpServiceImpl_0 (copy), v26 (copy), v17 (copy), v25 (copy), v20 (copy)
            l_httpServiceImpl_0:RequestInternal({
                Url = v26, 
                Method = "POST", 
                Headers = v17.headers, 
                Body = v25
            }):Start(function(v27, v28) --[[ Line: 162 ]]
                -- upvalues: v20 (ref)
                if v20 then
                    if v27 then
                        local v29 = {
                            error = nil, 
                            body = v28
                        };
                        v20(true, v29);
                        return;
                    else
                        local v30 = {
                            error = "HTTP request failed: " .. tostring(v28), 
                            body = nil
                        };
                        v20(false, v30);
                    end;
                end;
            end);
        end);
        if not l_status_1 and v20 then
            v20(false, {
                error = "Failed to create HTTP request: " .. tostring(l_result_1), 
                body = nil
            });
        end;
        return;
    end;
end;
return v1;