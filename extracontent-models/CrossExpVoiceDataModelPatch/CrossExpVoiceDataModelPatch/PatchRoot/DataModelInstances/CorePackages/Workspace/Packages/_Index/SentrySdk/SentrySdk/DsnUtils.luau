local v0 = require(script.Parent.Version);
return {
    parse_dsn = function(v1) --[[ Line: 14 ]] --[[ Name: parse_dsn ]]
        if not v1 or v1 == "" then
            return nil, "DSN is required";
        else
            local v2, v3, v4 = v1:match("^(https?)://([^@]+)@(.+)$");
            if not v2 or not v3 or not v4 then
                return nil, "Invalid DSN format";
            else
                local v5, v6 = v3:match("^([^:]+):(.+)$");
                if not v5 then
                    v5 = v3;
                    v6 = "";
                end;
                if not v5 or v5 == "" then
                    return nil, "Invalid DSN format";
                else
                    local v7, v8 = v4:match("^([^/]+)(.*)$");
                    if not v7 or not v8 or v8 == "" then
                        return nil, "Invalid DSN format";
                    else
                        local v9 = v8:match("/([%d]+)$");
                        if not v9 then
                            return nil, "Could not extract project ID from DSN";
                        else
                            return {
                                protocol = v2, 
                                public_key = v5, 
                                secret_key = v6 or "", 
                                host = v7, 
                                path = v8, 
                                project_id = v9
                            }, nil;
                        end;
                    end;
                end;
            end;
        end;
    end, 
    build_ingest_url = function(v10) --[[ Line: 59 ]] --[[ Name: build_ingest_url ]]
        return (("https://%*/api/%*/store/"):format(v10.host, v10.project_id));
    end, 
    build_envelope_url = function(v11) --[[ Line: 63 ]] --[[ Name: build_envelope_url ]]
        return (("https://%*/api/%*/envelope/"):format(v11.host, v11.project_id));
    end, 
    build_auth_header = function(v12) --[[ Line: 67 ]] --[[ Name: build_auth_header ]]
        -- upvalues: v0 (copy)
        return (("Sentry sentry_version=%*, sentry_key=%*, sentry_client=sentry-lua/%*"):format(v0.SENTRY_VERSION, v12.public_key, v0.SDK_VERSION));
    end
};