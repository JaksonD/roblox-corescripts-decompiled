local v0 = {
    BAD_REQUEST = 400, 
    UNAUTHORIZED = 401, 
    FORBIDDEN = 403, 
    NOT_FOUND = 404, 
    INTERNAL_SERVER_ERROR = 500, 
    BAD_GATEWAY = 502, 
    SERVICE_UNAVAILABLE = 503
};
local v1 = {
    TIMEOUT = "timeout", 
    AUTHENTICATION = "authentication", 
    PERMISSION = "permission", 
    VALIDATION = "validation", 
    SERVER_ERROR = "server_error", 
    NETWORK = "network", 
    UNKNOWN = "unknown"
};
local v2 = {
    [v1.TIMEOUT] = "Request timed out. Please try again.", 
    [v1.AUTHENTICATION] = "Authentication failed. Please log in again.", 
    [v1.PERMISSION] = "You don't have permission to update this profile.", 
    [v1.VALIDATION] = "Invalid request. Please check your input.", 
    [v1.SERVER_ERROR] = "Server error. Please try again later.", 
    [v1.NETWORK] = "Network error. Please check your connection and try again.", 
    [v1.UNKNOWN] = "An unexpected error occurred. Please try again."
};
local v3 = {
    SAVE_BACKGROUND = "Failed to save background", 
    LOAD_BACKGROUND = "Failed to load background", 
    UPDATE_PROFILE = "Failed to update profile"
};
local function v6(v4) --[[ Line: 37 ]] --[[ Name: getErrorType ]]
    -- upvalues: v1 (copy), v0 (copy)
    if typeof(v4) == "table" then
        if v4.message and string.find(string.lower(v4.message), "timeout") then
            return v1.TIMEOUT;
        else
            local v5 = v4.StatusCode or v4.statusCode;
            if v5 then
                if v5 == v0.UNAUTHORIZED then
                    return v1.AUTHENTICATION;
                elseif v5 == v0.FORBIDDEN then
                    return v1.PERMISSION;
                elseif v5 == v0.BAD_REQUEST then
                    return v1.VALIDATION;
                elseif v0.INTERNAL_SERVER_ERROR <= v5 then
                    return v1.SERVER_ERROR;
                end;
            end;
        end;
    elseif typeof(v4) == "string" then
        if string.find(string.lower(v4), "timeout") then
            return v1.TIMEOUT;
        elseif string.find(string.lower(v4), "network") or string.find(string.lower(v4), "connection") then
            return v1.NETWORK;
        end;
    end;
    return v1.UNKNOWN;
end;
return {
    HttpStatusCode = v0, 
    ErrorType = v1, 
    ERROR_MESSAGES = v2, 
    DEFAULT_ERROR_MESSAGES = v3, 
    getErrorType = v6, 
    getErrorMessage = function(v7, v8) --[[ Line: 66 ]] --[[ Name: getErrorMessage ]]
        -- upvalues: v6 (copy), v2 (copy), v3 (copy)
        local v9 = v2[v6(v7)];
        if v8 and v3[v8] then
            return v9 or v3[v8];
        else
            return v9 or v3.SAVE_BACKGROUND;
        end;
    end
};