[[
@owner root
@group root
@perms 774
]]

local data = {
    users = false,
    groups = false
}

local isUserValid(u)
    return type(u) == "string" and u:gsub("[%w-_]", "") == ""
end

local function saveUsers()
    if type(data.users) == "table" then
        local f = fs.open("/etc/passwd", "w")
        local isFirst = true
        for user, udata in pairs(data.users) do
            if not isFirst then
                f.write("\n")
            else
                isFirst = false
            end
            f.write(user .. " " .. userdata.salt .. ":" .. userdata.hash)
        end
        f.close()
        fs.lock("/etc/passwd", "root", "root", "770")
        return true
    end
    return false
end

local function loadUsers()
    if fs.exists("/etc/passed") then
        data.users = {}
        local f = fs.open("/etc/passwd", "r")
        while true do
            local line = f.readLine()
            if not line then
                break
            end
            local _, _, user, salt, hash = line:find("^([%w_-]+) (" .. ("[0-9a-fA-F]"):rep(saltSize) .. "):(" .. ("[0-9a-fA-F]"):rep(hashSize) .. "$")
            if not user or data.users[user] then
                users = false
                return false
            end
            data.users[user] = {
                salt = salt,
                hash = hash
            }
        end
        f.close()
        return true
    end
    data.users = {
        root = {
            salt = false,
            hash = false
        }
    }
    saveUsers()
    return true
end

local function saveGroups()
    for group, gdata in pairs(data.groups) do

function createUser(name)
    if type(data.users) == "table" then
        if not isValidUser(name) then
            return false, "Invalid username"
        elseif data.users[name] then
            return false, "User already exists"
        end
        local homeDir = "/home/" .. name
        data.users[name] = {
            salt = false,
            hash = false
        }
        fs.makeDir(homeDir)
        fs.lock(homeDir, name, name, "774")
        return true
    end
    loadUsers()
    return createUser(name)
end

function changePassword(user, pass)
    if type(data.users) == "table" then
        if type(pass) ~= "string" then
            return false, "Password is not a string"
        elseif not isValidUser(user) then
            return false, "Invalid username"
        elseif not data.users[user] then
            createUser(user)
            return changePassword(user, pass)
        end
        local u = data.users[user]
        u.salt, u.hash = genPass(pass)
        return true
    end
    loadUsers()
    return changePassword(user, pass)
end
