local v0 = {
    back = "back", 
    close = "close", 
    none = "none"
};
local v1 = {
    FailedToLoad = "FailedToLoad", 
    LoadedFromCache = "LoadedFromCache", 
    LoadedFromNetwork = "LoadedFromNetwork"
};
local v2 = {
    Protobuf = "protobuf", 
    ProtobufJson = "protobuf-json"
};
return {
    NavButtonType = v0, 
    SduiRequestStatus = v1, 
    SduiResponseType = v2
};