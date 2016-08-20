[[
@owner root
@group NULL
@perms 744
]]

local isUserValid(u)
    return type(u) == "string" and u:gsub("[%w-_]", "") == ""
end

local function saveUsers()
    local f = fs.open("/etc/passwd", "w")
    local isFirst = true
    for user, udata in pairs(users) do
        if not isFirst then
            f.write("\n")
        else
            isFirst = false
        end
        f.write(user .. (default + (

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
