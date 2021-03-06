local sprotoparser = require "sprotoparser"

--module("loginmsg")

--login msg
local loginmsg = {}
loginmsg.id = {}
loginmsg.str = {}
loginmsg.msg = {}

--note: c2s client to server ; s2c server to client

loginmsg.id.login           = 1   -- c2s loginmsg.msg[loginmsg.id.login]
loginmsg.id.loginok         = 2
loginmsg.id.loginerr        = 3
loginmsg.id.register        = 4

loginmsg.str[loginmsg.id.login] = "login"
loginmsg.str[loginmsg.id.loginok] = "login_ok"
loginmsg.str[loginmsg.id.loginerr] = "login_error"

local sp = sprotoparser.parse [[
.login {
	logintype   0 : integer    # 登陆方式
	account     1 : string	   # 玩家账户
	passwd      2 : string     # 玩家密码
	cversion    3 : string     # 客户端版本				
}

.login_ok {
    uid        0 : integer     # 玩家ID
    token      1 : string      # 访问令牌
}

.login_error {
    code       0 : integer     # 错误码    
    des        1 : string      # 描述 
}

]]

loginmsg.decode = function (id, msg, sz)
    
    return sp:decode(loginmsg.str[id], msg, sz)

end

loginmsg.encode = function (id, msg)
    
    return sp:encode(loginmsg.str[id], msg)
end

return loginmsg




