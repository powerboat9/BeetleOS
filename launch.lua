function parseMetadata(f)
    local data = {}
    local f = fs.open(f, "r")
    if !f then
        return false
    end
    while true do
        local line = f.readLine()
        if !line then
            break
        end
        if line:sub(1, 1) ~= "@" then
            break
        end
        local _, _, k, v = line:find("@([^%s]*) (.*)")
        local i = 1
        local dArray = {}
        while i <= #v do
            local iv = {line:find(", ?", i)}
            dArray[#dArray + 1] = line:sub(1, iv[1] - 1)
            line = line:sub(iv[2] + 1, -1)
            i = iv[2] + 1
        end
        if dArray[2] then
            v = dArray
        end
        data[k] = v
    end
    return data
end

function readAPIs(path, names)
    local name = names[1]
    table.remove(names, 1)
    local fullPath = path .. "/" .. name
    local data
    if fs.exists(fullPath .. "/pkg.txt") then
        data = parseMetadata(fullPath .. "/pkg.text") or {}
        f.close()
    else
        return false
    end
    if type(data.name) ~= "string" then
        return false
    elseif type(data.author) == "table" then
        return false
    end
    if data.dependencies then
        data.dependencies = ((type(data.dependencies) == "table") and data.dependencies) or {data.dependencies}
        for _, v in ipairs(data.dependencies) do
            names[#names + 1] = v
        end
    end
end

local errAPIS = {}
for _, v in ipairs(fs.list("/.APIS")) do
    if not os.loadAPI("/.APIS/" .. v) then
        errAPIS[#errAPIS + 1] = v
    end
end

local copyTable
do
    local copyTableRaw(t1, t2, seen, nextIters)
        local function parse(k, v)
            if type(v) == "table" then
                if not seen[v] then
                    local newT = {}
                    seen[v] = newT
                    t2[k] = newT
                    nextIters[#nextIters + 1] = {v, newT}
                else
                    t2[k] = seen[v]
                end
            else
                t2[k] = v
            end
        end
        for k, v in ipairs(t1) do parse(k, v) end
        for k, v in pairs(t1) do parse(k, v) end
    end
    copyTable = function(t)
        local newT = {}
        local seen, nextIters = {}, {{t, newT}}
        while nextIters[1] do
            copyTableRaw(nextIters[1][1], nextIters[1][2], seen, nextIters)
            table.remove(nextIters, 1)
        end
        return newT
    end
end

local users = {
    root = {
        default = 7,
        except = {},
        status = 0
    }
}

local function createUser(name, def, status)
    def = def ~= nil and def or 3
    if type(name) ~= "string" or name == "" or type(def) ~= number or def < 0 or def > 7 then
        return false, "Invalid parameters"
    end
    if users[name] then
        return false, "User already exists"
    else
        users[name] = {
            default = def,
            except = {},
            status = status
        }
    end
end

local function getFileOperation(user, file, op)
local modEnv = copyTable(_G)

do
    modEnv.fs.open = function(file)

local processes = {}
local function get(self, t, kList)
    if

local function createProccess(data, name, parent, permissions)
    local 

function getPermName

function askNewPermit(puid, name)
    

function createProcessPerms(

function createEnv(puid) --0 = none, 1 = when actice, 2 = always
    local permissions = getPermissions(puid)
    local env = {
        os = {},
        pcall = _G.pcall,
        error = _G.error,
    }
    function env.os.pullEventRaw(s)
        while true do
            local data = {os.pullEventRaw(s)}
            if type(permissions.events) == "table" then
                local permLevel = permissions.events[data[1]]
                if (((permLevel == 1) && isActive(id)) || (permLevel == 2)) || ((not permLevel) && permissions.events.assumeSafe) then --assume unlisted events are safe
                    return table.unpack(data)
                end
            else
                return "beetle:no-permit"
            end
        end
    end
    function env.os.pullEvent(s)
        data = {env.os.pullEventRaw(s)}
        if data[1] = "terminate" then
            error("Terminated")
        end
        return table.unpack(data)
    end
    function env.os.
