local SUDO = sudouserid,useridapihelper -- put Your ID here! <===
local function modadd(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
    if not is_admin(msg) then
   if not lang then
        return '*#》Ƴσυ αяє ησт вσт αɗмιη 🚷*\n*〰〰〰〰〰〰〰〰*\n💠 `Run this command only for Admins and deputies is`'
else
     return '#》 `شما` #مدیر `گروه نیستید` 🚷\n*〰〰〰〰〰〰〰〰*\n💠 اجرای این دستور فقط برای مدیران و معاونان است.'
    end
end
    local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)] then
if not lang then
   return '#》 *Ɠяσυρ ιѕ αƖяєαɗу αɗɗєɗ* ‼️\n*〰〰〰〰〰〰〰〰*\n💠 `The robot is already in the group, the robot was is no longer need to do not`'
else
return '#》 `ربات در` #لیست `گروه ربات از قبل بود` ‼️\n*〰〰〰〰〰〰〰〰*\n💠 ربات از قبل در لیست گروه های ربات بود است دیگر نیازی به این‌کار نیست.'
  end
end
        -- create data array in moderation.json
      data[tostring(msg.to.id)] = {
			owners = {},
			mods ={},
			banned ={},
			is_silent_users ={},
			filterlist ={},
			whitelist ={},
			settings = {
				set_name = msg.to.title,
				lock_link = 'yes',
				lock_tag = 'no',
				lock_username = 'yes',
				lock_spam = 'yes',
				lock_webpage = 'yes',
				lock_mention = 'no',
				lock_markdown = 'no',
				lock_flood = 'yes',
				lock_bots = 'yes',
				lock_pin = 'no',
				welcome = 'no',
				lock_join = 'no',
				lock_edit = 'no',
				lock_arabic = 'no',
				lock_english = 'no',
				lock_all = 'no',
				num_msg_max = '5',
				set_char = '1000',
				time_check = '2',
				},
   mutes = {
                  mute_forward = 'no',
                  mute_audio = 'no',
                  mute_video = 'no',
                  mute_contact = 'warn',
                  mute_text = 'no',
                  mute_photo = 'no',
                  mute_gif = 'no',
                  mute_location = 'warn',
                  mute_document = 'no',
                  mute_sticker = 'no',
                  mute_voice = 'no',
				  mute_all = 'no',
				  mute_keyboard = 'warn',
				  mute_game = 'no',
				  mute_inline = 'warn',
				  mute_tgservice = 'no',
          }
      }
  save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
    if not lang then
  return '#》 *Ɠяσυρ нαѕ вєєη αɗɗєɗ* ✅🤖\n\n*Ɠяσυρ Ɲαмє :*'..msg.to.title..'\n*OяɗєяƁу :* [@'..check_markdown(msg.from.username or '')..'*|*`'..msg.from.id..'`]\n*〰〰〰〰〰〰〰〰*\n💠 `Group now to list the groups the robot was added`\n\n*Ɠяσυρ cнαяgєɗ 3 мιηυтєѕ  fσя ѕєттιηgѕ.*'
else
  return '#》 `گروه به` #لیست `گروه ربات اضافه شده` ✅🤖\n\n*اسم گروه :*'..msg.to.title..'\n*توسط :* [@'..check_markdown(msg.from.username or '')..'*|*`'..msg.from.id..'`]\n*〰〰〰〰〰〰〰〰*\n💠 گروه هم اکنون به لیست گروه ربات اضافه شد.\n\n_گروه به مدت_ *3* _دقیقه برای اجرای تنظیمات شارژ میباشد._'
end
end
----------------------------------------
local function modrem(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
    local data = load_data(_config.moderation.data)
    local receiver = msg.to.id
  if not data[tostring(msg.to.id)] then
  if not lang then
    return '#》 *Ɠяσυρ ιѕ ησт αɗɗєɗ* 🚫\n*〰〰〰〰〰〰〰〰*\n💠 `Group from the first to the group list, the robot was not added`'
else
    return '#》 `گروه در` #لیست `گروه ربات  نیست` 🚫\n*〰〰〰〰〰〰〰〰*\n💠 گروه از اول به لیست گروه ربات اضافه نشده است .'
   end
  end

  data[tostring(msg.to.id)] = nil
  save_data(_config.moderation.data, data)
     local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end
       data[tostring(groups)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
 if not lang then
  return '#》 *Ɠяσυρ нαѕ вєєη яємσνєɗ* ❌🤖\n\n*Ɠяσυρ Ɲαмє :*'..msg.to.title..'\n*OяɗєяƁу :* [@'..check_markdown(msg.from.username or '')..'*|*`'..msg.from.id..'`]\n*〰〰〰〰〰〰〰〰*\n💠 `The group now from the list of groups, the robot was removed`'
 else
  return '#》 `گروه از` #لیست `گروه های ربات حدف شد` ❌🤖\n\n*اسم گروه :*'..msg.to.title..'\n*توسط :* [@'..check_markdown(msg.from.username or '')..'*|*`'..msg.from.id..'`]\n*〰〰〰〰〰〰〰〰*\n💠 گروه هم اکنون از لیست گروه ربات حذف شد.'
end
end
----------------------------------------
 local function config_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
  --print(serpent.block(data))
   for k,v in pairs(data.members_) do
   local function config_mods(arg, data)
       local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    return
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   end
tdcli_function ({
    ID = "GetUser",
    user_id_ = v.user_id_
  }, config_mods, {chat_id=arg.chat_id,user_id=v.user_id_})
 
if data.members_[k].status_.ID == "ChatMemberStatusCreator" then
owner_id = v.user_id_
   local function config_owner(arg, data)
 -- print(serpent.block(data))
       local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    return
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   end
tdcli_function ({
    ID = "GetUser",
    user_id_ = owner_id
  }, config_owner, {chat_id=arg.chat_id,user_id=owner_id})
   end
end
 if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*AƖƖ gяσυρ αɗмιηѕ нαѕ вєєη ρяσмσтєɗ αηɗ gяσυρ cяєαтσя ιѕ ησω gяσυρ σωηєя*👤😎", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "`تمام ادمین های گروه به مقام مدیر منتصب شدند و سازنده گروه به مقام مالک گروه منتصب شد`👤😎", 0, "md")
     end
 end
----------------------------------------
local function filter_word(msg, word)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)]['filterlist'] then
    data[tostring(msg.to.id)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
if data[tostring(msg.to.id)]['filterlist'][(word)] then
   if not lang then
         return "*Ɯσяɗ* [`"..word.."`] *ιѕ αƖяєαɗу fιƖтєяєɗ*♻️⚠️"
            else
         return "*کلمه* [`"..word.."`] *از قبل فیلتر بود*♻️⚠️"
    end
end
   data[tostring(msg.to.id)]['filterlist'][(word)] = true
     save_data(_config.moderation.data, data)
   if not lang then
         return "*Ɯσяɗ* [`"..word.."`] *αɗɗєɗ тσ fιƖтєяєɗ ωσяɗѕ Ɩιѕт*✔️📝"
            else
         return "*کلمه* [`"..word.."`] *به لیست کلمات فیلتر شده اضافه شد*✔️📝"
    end
end
----------------------------------------
local function unfilter_word(msg, word)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)]['filterlist'] then
    data[tostring(msg.to.id)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
      if data[tostring(msg.to.id)]['filterlist'][word] then
      data[tostring(msg.to.id)]['filterlist'][(word)] = nil
       save_data(_config.moderation.data, data)
       if not lang then
         return "*Ɯσяɗ* [`"..word.."`] *яємσνєɗ fяσм fιƖтєяєɗ ωσяɗѕ Ɩιѕт*❌📝"
       elseif lang then
         return "*کلمه* [`"..word.."`] *از لیست کلمات فیلتر شده حذف شد*❌📝"
     end
      else
       if not lang then
         return "*Ɯσяɗ* [`"..word.."`] *ιѕ ησт fιƖтєяєɗ*🚫👣"
       elseif lang then
         return "*کلمه* [`"..word.."`] *از قبل فیلتر نبود*🚫👣"
      end
   end
end
----------------------------------------
function exi_files(cpath)
    local files = {}
    local pth = cpath
    for k, v in pairs(scandir(pth)) do
		table.insert(files, v)
    end
    return files
end
----------------------------------------
local function file_exi(name, cpath)
    for k,v in pairs(exi_files(cpath)) do
        if name == v then
            return true
        end
    end
    return false
end
----------------------------------------
local function index_function(user_id)
  for k,v in pairs(_config.admins) do
    if user_id == v[1] then
    	print(k)
      return k
    end
  end
  -- If not found
  return false
end
----------------------------------------
local function getindex(t,id) 
for i,v in pairs(t) do 
if v == id then 
return i 
end 
end 
return nil 
end 
----------------------------------------
local function already_sudo(user_id)
  for k,v in pairs(_config.sudo_users) do
    if user_id == v then
      return k
    end
  end
  -- If not found
  return false
end
----------------------------------------
local function reload_plugins( ) 
  plugins = {} 
  load_plugins() 
end
----------------------------------------
local function exi_file()
    local files = {}
    local pth = tcpath..'/data/document'
    for k, v in pairs(scandir(pth)) do
        if (v:match('.lua$')) then
            table.insert(files, v)
        end
    end
    return files
end
----------------------------------------
local function pl_exi(name)
    for k,v in pairs(exi_file()) do
        if name == v then
            return true
        end
    end
    return false
end
----------------------------------------
local function sudolist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local sudo_users = _config.sudo_users
  if not lang then
 text = "*Lιѕт σf ѕυɗσ υѕєяѕ :*\n"
   else
 text = "*لــیسـت سـودو هـای ربــات :*\n"
  end
for i=1,#sudo_users do
    text = text..i.." - "..sudo_users[i].."\n"
end
return text
end

local function adminlist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local sudo_users = _config.sudo_users
  if not lang then
 text = '*Lιѕт σf вσт αɗмιηѕ :*\n'
   else
 text = "*لــیست ادمـین هـای ربــات :*\n"
  end
		  	local compare = text
		  	local i = 1
		  	for v,user in pairs(_config.admins) do
			    text = text..i..'- '..(user[2] or '')..' ➣ ('..user[1]..')\n'
		  	i = i +1
		  	end
		  	if compare == text then
   if not lang then
		  		text = '`Ɲσ` *αɗмιηѕ* `αναιƖαвƖє`'
      else
		  		text = '*ادمـینـی بـرای ربـات تـعیـیـن نـشده*'
           end
		  	end
		  	return text
    end
----------------------------------------
local function chat_list(msg)
	i = 1
	local data = load_data(_config.moderation.data)
    local groups = 'groups'
    if not data[tostring(groups)] then
        return '*65Ɲσ gяσυρѕ αт тнє мσмєηт*'
    end
    local message = 'Lιѕт σf Ɠяσυρѕ:\n*Use #join (ID) тσ נσιη*\n\n'
    for k,v in pairsByKeys(data[tostring(groups)]) do
		local group_id = v
		if data[tostring(group_id)] then
			settings = data[tostring(group_id)]['settings']
		end
        for m,n in pairsByKeys(settings) do
			if m == 'set_name' then
				name = n:gsub("", "")
				chat_name = name:gsub("‮", "")
				group_name_id = name .. '\n(ID: ' ..group_id.. ')\n\n'
				if name:match("[\216-\219][\128-\191]") then
					group_info = i..' - \n'..group_name_id
				else
					group_info = i..' - '..group_name_id
				end
				i = i + 1
			end
        end
		message = message..group_info
    end
	return message
end
----------------------------------------
local function botrem(msg)
	local data = load_data(_config.moderation.data)
	data[tostring(msg.to.id)] = nil
	save_data(_config.moderation.data, data)
	local groups = 'groups'
	if not data[tostring(groups)] then
		data[tostring(groups)] = nil
		save_data(_config.moderation.data, data)
	end
	data[tostring(groups)][tostring(msg.to.id)] = nil
	save_data(_config.moderation.data, data)
	if redis:get('CheckExpire::'..msg.to.id) then
		redis:del('CheckExpire::'..msg.to.id)
	end
	if redis:get('ExpireDate:'..msg.to.id) then
		redis:del('ExpireDate:'..msg.to.id)
	end
	tdcli.changeChatMemberStatus(msg.to.id, our_id, 'Left', dl_cb, nil)
end
----------------------------------------
local function run_bash(str)
    local cmd = io.popen(str)
    local result = cmd:read('*all')
    return result
end
----------------------------------------
local api_key = nil
local base_api = "https://maps.googleapis.com/maps/api"
----------------------------------------
local function get_latlong(area)
	local api      = base_api .. "/geocode/json?"
	local parameters = "address=".. (URL.escape(area) or "")
	if api_key ~= nil then
		parameters = parameters .. "&key="..api_key
	end
	local res, code = https.request(api..parameters)
	if code ~=200 then return nil  end
	local data = json:decode(res)
	if (data.status == "ZERO_RESULTS") then
		return nil
	end
	if (data.status == "OK") then
		lat  = data.results[1].geometry.location.lat
		lng  = data.results[1].geometry.location.lng
		acc  = data.results[1].geometry.location_type
		types= data.results[1].types
		return lat,lng,acc,types
	end
end
----------------------------------------
local function get_staticmap(area)
	local api        = base_api .. "/staticmap?"
	local lat,lng,acc,types = get_latlong(area)
	local scale = types[1]
	if scale == "locality" then
		zoom=8
	elseif scale == "country" then 
		zoom=4
	else 
		zoom = 13 
	end
	local parameters =
		"size=600x300" ..
		"&zoom="  .. zoom ..
		"&center=" .. URL.escape(area) ..
		"&markers=color:red"..URL.escape("|"..area)
	if api_key ~= nil and api_key ~= "" then
		parameters = parameters .. "&key="..api_key
	end
	return lat, lng, api..parameters
end
----------------------------------------
function string:split(sep)
  local sep, fields = sep or ":", {}
  local pattern = string.format("([^%s]+)", sep)
  self:gsub(pattern, function(c) fields[#fields+1] = c end)
  return fields
end
----------------------------------------
local function get_weather(location)
	print("Finding weather in ", location)
	local BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
	local url = BASE_URL
	url = url..'?q='..location..'&APPID=eedbc05ba060c787ab0614cad1f2e12b'
	url = url..'&units=metric'
	local b, c, h = http.request(url)
	if c ~= 200 then return nil end
	local weather = json:decode(b)
	local city = weather.name
	local country = weather.sys.country
	local temp = 'دمای شهر '..city..' هم اکنون '..weather.main.temp..' درجه سانتی گراد می باشد :)'
	local conditions = 'شرایط فعلی آب و هوا : '
	if weather.weather[1].main == 'Clear' then
		conditions = conditions .. 'آفتابی☀'
	elseif weather.weather[1].main == 'Clouds' then
		conditions = conditions .. 'ابری ☁☁'
	elseif weather.weather[1].main == 'Rain' then
		conditions = conditions .. 'بارانی ☔'
	elseif weather.weather[1].main == 'Thunderstorm' then
		conditions = conditions .. 'طوفانی ☔☔☔☔'
	elseif weather.weather[1].main == 'Mist' then
		conditions = conditions .. 'مه 💨'
	end
	return temp .. '\n' .. conditions
end
----------------------------------------
local function warning(msg)
	local hash = "gp_lang:"..msg.to.id
	local lang = redis:get(hash)
	local expiretime = redis:ttl('ExpireDate:'..msg.to.id)
	if expiretime == -1 then
		return
	else
	local d = math.floor(expiretime / 86400) + 1
        if tonumber(d) == 1 and not is_sudo(msg) and is_mod(msg) then
				tdcli.sendMessage(msg.to.id, 0, 1, '`از شارژ گروه فقط 1 روز باقی مانده است برای اطلاعات بیشتر به پیوی سازنده مراجعه کنید.`', 1, 'md')
		end
	end
end
----------------------------------------
local function calc(exp)
	url = 'http://api.mathjs.org/v1/'
	url = url..'?expr='..URL.escape(exp)
	b,c = http.request(url)
	text = nil
	if c == 200 then
    text = 'Result = '..b..' :)'
	elseif c == 400 then
		text = b
	else
		text = 'Unexpected error\n'
		..'Is api.mathjs.org up?'
	end
	return text
end
----------------------------------------
local function info_by_reply(arg, data)
    if tonumber(data.sender_user_id_) then
local function info_cb(arg, data)
    if data.username_ then
  username = "@"..check_markdown(data.username_)
    else
  username = ""
  end
    if data.first_name_ then
  firstname = check_markdown(data.first_name_)
    else
  firstname = ""
  end
    if data.last_name_ then
  lastname = check_markdown(data.last_name_)
    else
  lastname = ""
  end
	local hash = 'rank:'..arg.chat_id..':variables'
   local text = "_First name :_ *"..firstname.."*\n_Last name :_ *"..lastname.."*\n_Username :_ "..username.."\n_ID :_ *"..data.id_.."*\n\n"
		    if data.id_ == tonumber(SUDO) then
		       text = text..'_Rank :_ *Executive Admin*\n\n'
			   elseif is_sudo1(data.id_) then
	           text = text..'_Rank :_ *Full Access Admin*\n\n'
		     elseif is_admin1(data.id_) then
		       text = text..'_Rank :_ *Bot Admin*\n\n'
		     elseif is_owner1(arg.chat_id, data.id_) then
		       text = text..'_Rank :_ *Group Owner*\n\n'
		     elseif is_mod1(arg.chat_id, data.id_) then
		       text = text..'_Rank :_ *Group Moderator*\n\n'
		 else
		       text = text..'_Rank :_ *Group Member*\n\n'
			end
         local user_info = {} 
  local uhash = 'user:'..data.id_
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..data.id_..':'..arg.chat_id
  user_info_msgs = tonumber(redis:get(um_hash) or 0)
  text = text..'Total messages : '..user_info_msgs..'\n'
  text = text..MaTaDoRpm
  tdcli.sendMessage(arg.chat_id, arg.msgid, 0, text, 0, "md")
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, info_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_,msgid=data.id_})
    else
tdcli.sendMessage(data.chat_id_, "", 0, "*User not found*", 0, "md")
   end
end
----------------------------------------
local function info_by_username(arg, data)
    if tonumber(data.id_) then
    if data.type_.user_.username_ then
  username = "@"..check_markdown(data.type_.user_.username_)
    else
  username = ""
  end
    if data.type_.user_.first_name_ then
  firstname = check_markdown(data.type_.user_.first_name_)
    else
  firstname = ""
  end
    if data.type_.user_.last_name_ then
  lastname = check_markdown(data.type_.user_.last_name_)
    else
  lastname = ""
  end
	local hash = 'rank:'..arg.chat_id..':variables'
   local text = "_First name :_ *"..firstname.."*\n_Last name :_ *"..lastname.."*\n_Username :_ "..username.."\n_ID :_ *"..data.id_.."*\n\n"
		    if data.id_ == tonumber(SUDO) then
		       text = text..'_Rank :_ *Executive Admin*\n\n'
			   elseif is_sudo1(data.id_) then
	           text = text..'_Rank :_ *Full Access Admin*\n\n'
		     elseif is_admin1(data.id_) then
		       text = text..'_Rank :_ *Bot Admin*\n\n'
		     elseif is_owner1(arg.chat_id, data.id_) then
		       text = text..'_Rank :_ *Group Owner*\n\n'
		     elseif is_mod1(arg.chat_id, data.id_) then
		       text = text..'_Rank :_ *Group Moderator*\n\n'
		 else
		       text = text..'_Rank :_ *Group Member*\n\n'
			end
         local user_info = {} 
  local uhash = 'user:'..data.id_
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..data.id_..':'..arg.chat_id
  user_info_msgs = tonumber(redis:get(um_hash) or 0)
  text = text..'Total messages : '..user_info_msgs..'\n'
  text = text..MaTaDoRpm
  tdcli.sendMessage(arg.chat_id, arg.msgid, 0, text, 0, "md")
   else
   tdcli.sendMessage(arg.chat_id, "", 0, "*User not found*", 0, "md")
  end
end
----------------------------------------
local function info_by_id(arg, data)
      if tonumber(data.id_) then
    if data.username_ then
  username = "@"..check_markdown(data.username_)
    else
  username = ""
  end
    if data.first_name_ then
  firstname = check_markdown(data.first_name_)
    else
  firstname = ""
  end
    if data.last_name_ then
  lastname = check_markdown(data.last_name_)
    else
  lastname = ""
  end
	local hash = 'rank:'..arg.chat_id..':variables'
   local text = "_First name :_ *"..firstname.."*\n_Last name :_ *"..lastname.."*\n_Username :_ "..username.."\n_ID :_ *"..data.id_.."*\n\n"
		    if data.id_ == tonumber(SUDO) then
		       text = text..'_Rank :_ *Executive Admin*\n\n'
			   elseif is_sudo1(data.id_) then
	           text = text..'_Rank :_ *Full Access Admin*\n\n'
		     elseif is_admin1(data.id_) then
		       text = text..'_Rank :_ *Bot Admin*\n\n'
		     elseif is_owner1(arg.chat_id, data.id_) then
		       text = text..'_Rank :_ *Group Owner*\n\n'
		     elseif is_mod1(arg.chat_id, data.id_) then
		       text = text..'_Rank :_ *Group Moderator*\n\n'
		 else
		       text = text..'_Rank :_ *Group Member*\n\n'
			end
         local user_info = {} 
  local uhash = 'user:'..data.id_
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..data.id_..':'..arg.chat_id
  user_info_msgs = tonumber(redis:get(um_hash) or 0)
  text = text..'Total messages : '..user_info_msgs..'\n'
  text = text..MaTaDoRpm
  tdcli.sendMessage(arg.chat_id, arg.msgid, 0, text, 0, "md")
   else
   tdcli.sendMessage(arg.chat_id, "", 0, "*User not found*", 0, "md")
   end
end
----------------------------------------
local function delmsg (MaTaDoR,MahDiRoO)
    msgs = MaTaDoR.msgs 
    for k,v in pairs(MahDiRoO.messages_) do
        msgs = msgs - 1
        tdcli.deleteMessages(v.chat_id_,{[0] = v.id_}, dl_cb, cmd)
        if msgs == 1 then
            tdcli.deleteMessages(MahDiRoO.messages_[0].chat_id_,{[0] = MahDiRoO.messages_[0].id_}, dl_cb, cmd)
            return false
        end
    end
    tdcli.getChatHistory(MahDiRoO.messages_[0].chat_id_, MahDiRoO.messages_[0].id_,0 , 100, delmsg, {msgs=msgs})
end
----------------------------------------
local function modlist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.chat_id_)] then
  if not lang then
    return "#》 *Ɠяσυρ ιѕ ησт αɗɗєɗ* 🚫\n*〰〰〰〰〰〰〰〰*\n💠 `Group from the first to the group list, the robot was not added`"
 else
    return "#》 `گروه در` #لیست `گروه ربات  نیست` 🚫\n*〰〰〰〰〰〰〰〰*\n💠 گروه از اول به لیست گروه ربات اضافه نشده است ."
  end
 end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['mods']) == nil then --fix way
  if not lang then
    return "`Ɲσ` *MσɗєяαƬσя* `ιη Ƭнιѕ Ɠяσυρ`🚫⚠️"
else
   return "`در حال حاضر هیچ` #مدیری `برای گروه انتخاب نشده است`🚫⚠️"
  end
end
if not lang then
   message = '*⚜Lιѕт σf мσɗєяαтσяѕ :*\n'
else
   message = '*⚜لیست مدیران گروه :*\n'
end
  for k,v in pairs(data[tostring(msg.to.id)]['mods'])
do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end
----------------------------------------
local function ownerlist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.to.id)] then
if not lang then
    return "#》 *Ɠяσυρ ιѕ ησт αɗɗєɗ* 🚫\n*〰〰〰〰〰〰〰〰*\n💠 `Group from the first to the group list, the robot was not added`"
else
return "#》 `گروه در` #لیست `گروه ربات  نیست` 🚫\n*〰〰〰〰〰〰〰〰*\n💠 گروه از اول به لیست گروه ربات اضافه نشده است ."
  end
end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['owners']) == nil then --fix way
 if not lang then
    return "`Ɲσ` *Oωηєя* `ιη Ƭнιѕ Ɠяσυρ`🚫⚠️"
else
    return "`در حال حاضر هیچ` #مالکی `برای گروه انتخاب نشده است`🚫⚠️"
  end
end
if not lang then
   message = '*⚜Lιѕт σf σωηєяѕ :*\n'
else
   message = '*⚜لیست مالکین گروه :*\n'
end
  for k,v in pairs(data[tostring(msg.to.id)]['owners']) do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end
----------------------------------------
local function pre_processb(msg)
   if msg.to.type ~= 'pv' then
chat = msg.to.id
user = msg.from.id
	local function check_newmember(arg, data)
		test = load_data(_config.moderation.data)
		lock_bots = test[arg.chat_id]['settings']['lock_bots']
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    if data.type_.ID == "UserTypeBot" then
      if not is_owner(arg.msg) and lock_bots == 'yes' then
kick_user(data.id_, arg.chat_id)
end
end
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if is_banned(data.id_, arg.chat_id) then
   if not lang then
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, "_User_ "..user_name.." *[ "..data.id_.." ]* _is banned_", 0, "md")
   else
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, "_کاربر_ "..user_name.." *[ "..data.id_.." ]* _از گروه محروم است_", 0, "md")
end
kick_user(data.id_, arg.chat_id)
end
if is_gbanned(data.id_) then
     if not lang then
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, "_User_ "..user_name.." *[ "..data.id_.." ]* _is globally banned_", 0, "md")
    else
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, "_کاربر_ "..user_name.." *[ "..data.id_.." ]* _از تمام گروه های ربات محروم است_", 0, "md")
   end
kick_user(data.id_, arg.chat_id)
     end
	end
	if msg.adduser then
			tdcli_function ({
	      ID = "GetUser",
      	user_id_ = msg.adduser
    	}, check_newmember, {chat_id=chat,msg_id=msg.id,user_id=user,msg=msg})
	end
	if msg.joinuser then
			tdcli_function ({
	      ID = "GetUser",
      	user_id_ = msg.joinuser
    	}, check_newmember, {chat_id=chat,msg_id=msg.id,user_id=user,msg=msg})
	   end
   end
   -- return msg
end
----------------------------------------
local TIME_CHECK = 2
local function pre_process(msg)
local chat = msg.to.id
local user = msg.from.id
local hash = "gp_lang:"..chat
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
local is_channel = msg.to.type == "channel"
local is_chat = msg.to.type == "chat"
local auto_leave = 'auto_leave_bot'
local muteallchk = 'muteall:'..msg.to.id
local hashwarn = msg.to.id..':warn'
local warnhash = redis:hget(hashwarn, user) or 1
local max_warn = tonumber(redis:get('max_warn:'..chat) or 5)
if is_channel or is_chat then
        local TIME_CHECK = 2
        if data[tostring(chat)] then
          if data[tostring(chat)]['settings']['time_check'] then
            TIME_CHECK = tonumber(data[tostring(chat)]['settings']['time_check'])
          end
        end
    if msg.text then
  if msg.text:match("(.*)") then
    if not data[tostring(msg.to.id)] and not redis:get(auto_leave) and not is_admin(msg) then
  tdcli.sendMessage(msg.to.id, "", 0, "_This Is Not One Of My_ *Groups*", 0, "md")
  tdcli.changeChatMemberStatus(chat, our_id, 'Left', dl_cb, nil)
      end
   end
end
  if redis:get(muteallchk) and not is_mod(msg) and not is_whitelist(msg.from.id, msg.to.id) then
  if is_channel then
    del_msg(chat, tonumber(msg.id))
	elseif is_chat then
	kick_user(user, chat)
  end
  end
if not redis:get('autodeltime') then
redis:setex('autodeltime', 3600, true)
     run_bash("rm -rf ~/.telegram-cli/data/sticker/*")
     run_bash("rm -rf ~/.telegram-cli/data/photo/*")
     run_bash("rm -rf ~/.telegram-cli/data/animation/*")
     run_bash("rm -rf ~/.telegram-cli/data/video/*")
     run_bash("rm -rf ~/.telegram-cli/data/audio/*")
     run_bash("rm -rf ~/.telegram-cli/data/voice/*")
     run_bash("rm -rf ~/.telegram-cli/data/temp/*")
     run_bash("rm -rf ~/.telegram-cli/data/thumb/*")
     run_bash("rm -rf ~/.telegram-cli/data/document/*")
     run_bash("rm -rf ~/.telegram-cli/data/profile_photo/*")
     run_bash("rm -rf ~/.telegram-cli/data/encrypted/*")
	 run_bash("rm -rf ./data/photos/*")
end
    if data[tostring(chat)] and data[tostring(chat)]['mutes'] then
		mutes = data[tostring(chat)]['mutes']
	else
		return
	end
	if mutes.mute_all then
		mute_all = mutes.mute_all
	else
		mute_all = 'no'
	end
	if mutes.mute_gif then
		mute_gif = mutes.mute_gif
	else
		mute_gif = 'no'
	end
	if mutes.mute_gif then
		mute_gif_ban = mutes.mute_gif
	else
		mute_gif_ban = 'ban'
	end
	if mutes.mute_gif then
		mute_gif_kick = mutes.mute_gif
	else
		mute_gif_kick = 'kick'
	end
	if mutes.mute_gif then
		mute_gif_warn = mutes.mute_gif
	else
		mute_gif_warn = 'warn'
	end
   if mutes.mute_photo then
		mute_photo = mutes.mute_photo
	else
		mute_photo = 'no'
	end
	if mutes.mute_photo then
		mute_photo_ban = mutes.mute_photo
	else
		mute_photo_ban = 'ban'
	end
	if mutes.mute_photo then
		mute_photo_kick = mutes.mute_photo
	else
		mute_photo_kick = 'kick'
	end
	if mutes.mute_photo then
		mute_photo_warn = mutes.mute_photo
	else
		mute_photo_warn = 'warn'
	end
	if mutes.mute_sticker then
		mute_sticker = mutes.mute_sticker
	else
		mute_sticker = 'no'
	end
	if mutes.mute_sticker then
		mute_sticker_ban = mutes.mute_sticker
	else
		mute_sticker_ban = 'ban'
	end
	if mutes.mute_sticker then
		mute_sticker_kick = mutes.mute_sticker
	else
		mute_sticker_kick = 'kick'
	end
	if mutes.mute_sticker then
		mute_sticker_warn = mutes.mute_sticker
	else
		mute_sticker_warn = 'warn'
	end
	if mutes.mute_contact then
		mute_contact = mutes.mute_contact
	else
		mute_contact = 'no'
	end
	if mutes.mute_contact then
		mute_contact_ban = mutes.mute_contact
	else
		mute_contact_ban = 'ban'
	end
	if mutes.mute_contact then
		mute_contact_kick = mutes.mute_contact
	else
		mute_contact_kick = 'kick'
	end
	if mutes.mute_contact then
		mute_contact_warn = mutes.mute_contact
	else
		mute_contact_warn = 'warn'
	end
	if mutes.mute_inline then
		mute_inline = mutes.mute_inline
	else
		mute_inline = 'no'
	end
	if mutes.mute_inline then
		mute_inline_ban = mutes.mute_inline
	else
		mute_inline_ban = 'ban'
	end
	if mutes.mute_inline then
		mute_inline_kick = mutes.mute_inline
	else
		mute_inline_kick = 'kick'
	end
	if mutes.mute_inline then
		mute_inline_warn = mutes.mute_inline
	else
		mute_inline_warn = 'warn'
	end
	if mutes.mute_game then
		mute_game = mutes.mute_game
	else
		mute_game = 'no'
	end
	if mutes.mute_game then
		mute_game_ban = mutes.mute_game
	else
		mute_game_ban = 'ban'
	end
	if mutes.mute_game then
		mute_game_kick = mutes.mute_game
	else
		mute_game_kick = 'kick'
	end
	if mutes.mute_game then
		mute_game_warn = mutes.mute_game
	else
		mute_game_warn = 'warn'
	end
	if mutes.mute_text then
		mute_text = mutes.mute_text
	else
		mute_text = 'no'
	end
	if mutes.mute_text then
		mute_text_ban = mutes.mute_text
	else
		mute_text_ban = 'ban'
	end
	if mutes.mute_text then
		mute_text_kick = mutes.mute_text
	else
		mute_text_kick = 'kick'
	end
	if mutes.mute_text then
		mute_text_warn = mutes.mute_text
	else
		mute_text_warn = 'warn'
	end
	if mutes.mute_keyboard then
		mute_keyboard = mutes.mute_keyboard
	else
		mute_keyboard = 'no'
	end
	if mutes.mute_keyboard then
		mute_keyboard_ban = mutes.mute_keyboard
	else
		mute_keyboard_ban = 'ban'
	end
	if mutes.mute_keyboard then
		mute_keyboard_kick = mutes.mute_keyboard
	else
		mute_keyboard_kick = 'kick'
	end
	if mutes.mute_keyboard then
		mute_keyboard_warn = mutes.mute_keyboard
	else
		mute_keyboard_warn = 'warn'
	end
	if mutes.mute_forward then
		mute_forward = mutes.mute_forward
	else
		mute_forward = 'no'
	end
	if mutes.mute_forward then
		mute_forward_ban = mutes.mute_forward
	else
		mute_forward_ban = 'ban'
	end
	if mutes.mute_forward then
		mute_forward_kick = mutes.mute_forward
	else
		mute_forward_kick = 'kick'
	end
	if mutes.mute_forward then
		mute_forward_warn = mutes.mute_forward
	else
		mute_forward_warn = 'warn'
	end
	if mutes.mute_location then
		mute_location = mutes.mute_location
	else
		mute_location = 'no'
	end
	if mutes.mute_location then
		mute_location_ban = mutes.mute_location
	else
		mute_location_ban = 'ban'
	end
	if mutes.mute_location then
		mute_location_kick = mutes.mute_location
	else
		mute_location_kick = 'kick'
	end
	if mutes.mute_location then
		mute_location_warn = mutes.mute_location
	else
		mute_location_warn = 'warn'
	end
   if mutes.mute_document then
		mute_document = mutes.mute_document
	else
		mute_document = 'no'
	end
	if mutes.mute_document then
		mute_document_ban = mutes.mute_document
	else
		mute_document_ban = 'ban'
	end
	if mutes.mute_document then
		mute_document_kick = mutes.mute_document
	else
		mute_document_kick = 'kick'
	end
	if mutes.mute_document then
		mute_document_warn = mutes.mute_document
	else
		mute_document_warn = 'warn'
	end
	if mutes.mute_voice then
		mute_voice = mutes.mute_voice
	else
		mute_voice = 'no'
	end
	if mutes.mute_voice then
		mute_voice_ban = mutes.mute_voice
	else
		mute_voice_ban = 'ban'
	end
	if mutes.mute_voice then
		mute_voice_kick = mutes.mute_voice
	else
		mute_voice_kick = 'kick'
	end
	if mutes.mute_voice then
		mute_voice_warn = mutes.mute_voice
	else
		mute_voice_warn = 'warn'
	end
	if mutes.mute_audio then
		mute_audio = mutes.mute_audio
	else
		mute_audio = 'no'
	end
	if mutes.mute_audio then
		mute_audio_ban = mutes.mute_audio
	else
		mute_audio_ban = 'ban'
	end
	if mutes.mute_audio then
		mute_audio_kick = mutes.mute_audio
	else
		mute_audio_kick = 'kick'
	end
	if mutes.mute_audio then
		mute_audio_warn = mutes.mute_audio
	else
		mute_audio_warn = 'warn'
	end
	if mutes.mute_video then
		mute_video = mutes.mute_video
	else
		mute_video = 'no'
	end
	if mutes.mute_video then
		mute_video_ban = mutes.mute_video
	else
		mute_video_ban = 'ban'
	end
	if mutes.mute_video then
		mute_video_kick = mutes.mute_video
	else
		mute_video_kick = 'kick'
	end
	if mutes.mute_video then
		mute_video_warn = mutes.mute_video
	else
		mute_video_warn = 'warn'
	end
	if mutes.mute_tgservice then
		mute_tgservice = mutes.mute_tgservice
	else
		mute_tgservice = 'no'
	end
	if data[tostring(chat)] and data[tostring(chat)]['settings'] then
		settings = data[tostring(chat)]['settings']
	else
		return
	end
	if settings.lock_link then
		lock_link = settings.lock_link
	else
		lock_link = 'no'
	end
	if settings.lock_link then
		lock_link_ban = settings.lock_link
	else
		lock_link_ban = 'ban'
	end
    if settings.lock_link then
		lock_link_warn = settings.lock_link
	else
		lock_link_warn = 'warn'
	end
	if settings.lock_link then
		lock_link_kick = settings.lock_link
	else
		lock_link_kick = 'kick'
	end
	if settings.lock_join then
		lock_join = settings.lock_join
	else
		lock_join = 'no'
	end
	if settings.lock_tag then
		lock_tag = settings.lock_tag
	else
		lock_tag = 'no'
	end
	if settings.lock_tag then
		lock_tag_ban = settings.lock_tag
	else
		lock_tag_ban = 'no'
	end
	if settings.lock_tag then
		lock_tag_kick = settings.lock_tag
	else
		lock_tag_kick = 'no'
	end
	if settings.lock_tag then
		lock_tag_warn = settings.lock_tag
	else
		lock_tag_warn = 'no'
	end
	if settings.lock_username then
		lock_username = settings.lock_username
	else
		lock_username = 'no'
	end
	if settings.lock_username then
		lock_username_ban = settings.lock_username
	else
		lock_username_ban = 'no'
	end
	if settings.lock_username then
		lock_username_kick = settings.lock_username
	else
		lock_username_kick = 'no'
	end
	if settings.lock_username then
		lock_username_warn = settings.lock_username
	else
		lock_username_warn = 'no'
	end
	if settings.lock_pin then
		lock_pin = settings.lock_pin
	else
		lock_pin = 'no'
	end
	if settings.lock_arabic then
		lock_arabic = settings.lock_arabic
	else
		lock_arabic = 'no'
	end
	if settings.lock_arabic then
		lock_arabic_ban = settings.lock_arabic
	else
		lock_arabic_ban = 'no'
	end
	if settings.lock_arabic then
		lock_arabic_kick = settings.lock_arabic
	else
		lock_arabic_kick = 'no'
	end
	if settings.lock_arabic then
		lock_arabic_warn = settings.lock_arabic
	else
		lock_arabic_warn = 'no'
	end
	if settings.lock_english then
		lock_english = settings.lock_english
	else
		lock_english = 'no'
	end
    if settings.lock_english then
		lock_english_ban = settings.lock_english
	else
		lock_english_ban = 'no'
	end	
    if settings.lock_english then
		lock_english_kick = settings.lock_english
	else
		lock_english_kick = 'no'
	end	
    if settings.lock_english then
		lock_english_warn = settings.lock_english
	else
		lock_english_warn = 'no'
	end		
	if settings.lock_mention then
		lock_mention = settings.lock_mention
	else
		lock_mention = 'no'
	end
	if settings.lock_mention then
		lock_mention_ban = settings.lock_mention
	else
		lock_mention_ban = 'no'
	end
	if settings.lock_mention then
		lock_mention_kick = settings.lock_mention
	else
		lock_mention_kick = 'no'
	end
	if settings.lock_mention then
		lock_mention_warn = settings.lock_mention
	else
		lock_mention_warn = 'no'
	end
	if settings.lock_edit then
		lock_edit = settings.lock_edit
	else
		lock_edit = 'no'
	end
	if settings.lock_edit then
		lock_edit_ban = settings.lock_edit
	else
		lock_edit_ban = 'no'
	end
	if settings.lock_edit then
		lock_edit_kick = settings.lock_edit
	else
		lock_edit_kick = 'no'
	end
	if settings.lock_edit then
		lock_edit_warn = settings.lock_edit
	else
		lock_edit_warn = 'no'
	end
	if settings.lock_spam then
		lock_spam = settings.lock_spam
	else
		lock_spam = 'no'
	end
	if settings.lock_flood then
		lock_flood = settings.lock_flood
	else
		lock_flood = 'no'
	end
	if settings.lock_markdown then
		lock_markdown = settings.lock_markdown
	else
		lock_markdown = 'no'
	end
	if settings.lock_markdown then
		lock_markdown_ban = settings.lock_markdown
	else
		lock_markdown_ban = 'no'
	end
	if settings.lock_markdown then
		lock_markdown_kick = settings.lock_markdown
	else
		lock_markdown_kick = 'no'
	end
	if settings.lock_markdown then
		lock_markdown_warn = settings.lock_markdown
	else
		lock_markdown_warn = 'no'
	end
	if settings.lock_webpage then
		lock_webpage = settings.lock_webpage
	else
		lock_webpage = 'no'
	end
	if settings.lock_webpage then
		lock_webpage_ban = settings.lock_webpage
	else
		lock_webpage_ban = 'no'
	end
	if settings.lock_webpage then
		lock_webpage_kick = settings.lock_webpage
	else
		lock_webpage_kick = 'no'
	end
	if settings.lock_webpage then
		lock_webpage_warn = settings.lock_webpage
	else
		lock_webpage_warn = 'no'
	end
  if msg.adduser or msg.joinuser or msg.deluser then
  if mute_tgservice == 'yes' then
del_msg(chat, tonumber(msg.id))
  end
end
if not is_mod(msg) and not is_whitelist(msg.from.id, msg.to.id) then
	if msg.adduser or msg.joinuser then
		if lock_join == 'yes' then
			function join_kick(arg, data)
				kick_user(data.id_, msg.to.id)
			end
			if msg.adduser then
				tdcli.getUser(msg.adduser, join_kick, nil)
			elseif msg.joinuser then
				tdcli.getUser(msg.joinuser, join_kick, nil)
			end
		end
	end
end
   if msg.pinned and is_channel then
  if lock_pin == 'yes' then
     if is_owner(msg) then
      return
     end
     if tonumber(msg.from.id) == our_id then
      return
     end
    local pin_msg = data[tostring(chat)]['pin']
      if pin_msg then
  tdcli.pinChannelMessage(msg.to.id, pin_msg, 1)
       elseif not pin_msg then
   tdcli.unpinChannelMessage(msg.to.id)
          end
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<b>User ID :</b> <code>'..msg.from.id..'</code>\n<b>Username :</b> '..('@'..msg.from.username or '<i>No Username</i>')..'\n<i>شما اجازه دسترسی به سنجاق پیام را ندارید، به همین دلیل پیام قبلی مجدد سنجاق میگردد</i>', 0, "html")
     elseif not lang then
    tdcli.sendMessage(msg.to.id, msg.id, 0, '<b>User ID :</b> <code>'..msg.from.id..'</code>\n<b>Username :</b> '..('@'..msg.from.username or '<i>No Username</i>')..'\n<i>You Have Not Permission To Pin Message, Last Message Has Been Pinned Again</i>', 0, "html")
          end
      end
  end
if not is_mod(msg) and not is_whitelist(msg.from.id, msg.to.id) then
------------------------------------
  if msg.edited and lock_edit == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
    end
  end
if msg.edited and lock_edit_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `ویرایش مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Edit Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
end
end
if msg.edited and lock_edit_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `ویرایش اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Edit Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
    end
  end 
if msg.edited and lock_edit_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `ویرایش اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Edit Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `ویرایش اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Edit Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
end
end
------------------------------------
if msg.forward_info_ and mute_forward == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
    end
  end
if msg.forward_info_ and mute_forward_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `فوروارد مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Forward Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
    end
  end
if msg.forward_info_ and mute_forward_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `فوروارد اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Forward Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
    end
  end 
if msg.forward_info_ and mute_forward_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `فوروارد اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Forward Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `فوروارد اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Forward Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
if msg.photo_ and mute_photo == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.photo_ and mute_photo_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `عکس مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Photo Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.photo_ and mute_photo_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `عکس اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Photo Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.photo_ and mute_photo_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `عکس اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Photo Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `عکس اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Photo Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
if msg.video_ and mute_video == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.video_ and mute_video_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `فیلم مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Video Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.video_ and mute_video_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `فیلم اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Video Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.video_ and mute_video_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `فیلم اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Video Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `فیلم اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Video Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
if msg.document_ and mute_document == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.document_ and mute_document_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `فایل مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Document Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.document_ and mute_document_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `فایل اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Document Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.document_ and mute_document_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `فایل اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Document Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `فایل اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Document Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
end
end
------------------------------------
if msg.sticker_ and mute_sticker == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.sticker_ and mute_sticker_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `استیکر مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Sticker Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.sticker_ and mute_sticker_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `استیکر اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Sticker Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.sticker_ and mute_sticker_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `استیکر اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Sticker Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `استیکر اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Sticker Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
if msg.animation_ and mute_gif == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.animation_ and mute_gif_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `گیف مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Gif Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.animation_ and mute_gif_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `گیف اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Gif Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.animation_ and mute_gif_warn == 'warn' then
if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `گیف اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Gif Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `گیف اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Gif Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
if msg.contact_ and mute_contact == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.contact_ and mute_contact_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Contact Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.contact_ and mute_contact_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Contact Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.contact_ and mute_contact_warn == 'warn' then
if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Contact Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Contact Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
if msg.location_ and mute_location == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.location_ and mute_location_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `مکان مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Location Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.location_ and mute_location_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `مکان اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Location Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.location_ and mute_location_warn == 'warn' then
if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `مکان اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Location Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `مکان اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Location Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
if msg.voice_ and mute_voice == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.voice_ and mute_voice_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `ویس مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Voice Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.voice_ and mute_voice_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `ویس اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Voice Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.voice_ and mute_voice_warn == 'warn' then
if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `ویس اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Voice Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `ویس اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Voice Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
if msg.content_ and mute_keyboard == 'yes' then
  if msg.reply_markup_ and  msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
      end
   end
end
if msg.content_ and mute_keyboard_ban == 'ban' then
  if msg.reply_markup_ and  msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Keyboard Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
      end
   end
end
if msg.content_ and mute_keyboard_kick == 'kick' then
  if msg.reply_markup_ and  msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `کیبورد اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Keyboard Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
      end
   end
end
if msg.content_ and mute_keyboard_warn == 'warn' then
 if msg.reply_markup_ and  msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" then
if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `کیبورد اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Keyboard Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `کیبورد اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Keyboard Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
  end
end
------------------------------------
if tonumber(msg.via_bot_user_id_) ~= 0 and mute_inline == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
if tonumber(msg.via_bot_user_id_) ~= 0 and mute_inline_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `دکمه شیشه ای مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Inline Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
if tonumber(msg.via_bot_user_id_) ~= 0 and mute_inline_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `دکمه شیشه ای اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Inline Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
if tonumber(msg.via_bot_user_id_) ~= 0 and mute_inline_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `دکمه شیشه ای اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Inline Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `دکمه شیشه ای اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Inline Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
if msg.game_ and mute_game == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.game_ and mute_game_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Game Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.game_ and mute_game_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `بازی اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Game Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.game_ and mute_game_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `بازی اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Game Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `بازی اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Game Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
if msg.audio_ and mute_audio == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.audio_ and mute_audio_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `آهنگ مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Audio Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.audio_ and mute_audio_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
  if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `آهنگ اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Audio Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.audio_ and mute_audio_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `آهنگ اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Audio Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `آهنگ اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Audio Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
if msg.media.caption then
local link_caption = msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.media.caption:match("[Tt].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
if link_caption
and lock_link == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
local link_caption = msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.media.caption:match("[Tt].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
if link_caption and lock_link_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `لینک مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Link Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
local link_caption = msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.media.caption:match("[Tt].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
if link_caption and lock_link_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `لینک اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Link Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
local link_caption = msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.media.caption:match("[Tt].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
if link_caption and lock_link_warn == "warn" then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `لینک اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Link Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `لینک اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Link Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
local tag_caption = msg.media.caption:match("#")
if tag_caption and lock_tag == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
local tag_caption = msg.media.caption:match("#")
if tag_caption and lock_tag_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `تگ مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Tag Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
local tag_caption = msg.media.caption:match("#")
if tag_caption and lock_tag_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `تگ اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Tag Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
local tag_caption = msg.media.caption:match("#")
if tag_caption and lock_tag_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `تگ اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Tag Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `تگ اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Tag Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
local username_caption = msg.media.caption:match("@")
if username_caption and lock_username == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
local username_caption = msg.media.caption:match("@")
if username_caption and lock_username_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `نام کاربری مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Username Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
local username_caption = msg.media.caption:match("@")
if username_caption and lock_username_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `نام کاربری اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Username Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
local username_caption = msg.media.caption:match("@")
if username_caption and lock_username_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `نام کاربری اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Username Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `نام کاربری اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Username Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
local english_caption = msg.media.caption:match("[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]")
if english_caption and lock_english == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
local english_caption = msg.media.caption:match("[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]")
if english_caption and lock_english_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `انگلیسی مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `English Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
local english_caption = msg.media.caption:match("[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]")
if english_caption and lock_english_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `انگلیسی اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `English Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
local english_caption = msg.media.caption:match("[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]")
if english_caption and lock_english_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `انگلیسی اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `English Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `انگلیسی اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `English Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
if is_filter(msg, msg.media.caption) then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
      end
 end
------------------------------------
local arabic_caption = msg.media.caption:match("[\216-\219][\128-\191]")
if arabic_caption and lock_arabic == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
      end
end
local arabic_caption = msg.media.caption:match("[\216-\219][\128-\191]")
if arabic_caption and lock_arabic_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `فارسی مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Arabic Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
      end
end
local arabic_caption = msg.media.caption:match("[\216-\219][\128-\191]")
if arabic_caption and lock_arabic_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `فارسی اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Arabic Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
      end
end
local arabic_caption = msg.media.caption:match("[\216-\219][\128-\191]")
if arabic_caption and lock_arabic_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `فارسی اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Arabic Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `فارسی اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Arabic Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
end
if msg.text then
			local _nl, ctrl_chars = string.gsub(msg.text, '%c', '')
        local max_chars = 40
        if data[tostring(msg.to.id)] then
          if data[tostring(msg.to.id)]['settings']['set_char'] then
            max_chars = tonumber(data[tostring(msg.to.id)]['settings']['set_char'])
          end
        end
			 local _nl, real_digits = string.gsub(msg.text, '%d', '')
			local max_real_digits = tonumber(max_chars) * 50
			local max_len = tonumber(max_chars) * 51
			if lock_spam == 'yes' then
			if string.len(msg.text) > max_len or ctrl_chars > max_chars or real_digits > max_real_digits then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
      end
   end
end
------------------------------------
local link_msg = msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
if link_msg and lock_link == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
local link_msg = msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
if link_msg and lock_link_ban == "ban" then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `لینک مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Link Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
local link_msg = msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
if link_msg and lock_link_kick == "kick" then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `لینک اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Link Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
  sleep(1)
  channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
local link_msg = msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
if link_msg and lock_link_warn == "warn" then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `لینک اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Link Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `لینک اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Link Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
local tag_msg = msg.text:match("#")
if tag_msg and lock_tag == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
local tag_msg = msg.text:match("#")
if tag_msg and lock_tag_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `تگ مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Tag Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
local tag_msg = msg.text:match("#")
if tag_msg and lock_tag_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `تگ اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Tag Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
  sleep(1)
  channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
local tag_msg = msg.text:match("#")
if tag_msg and lock_tag_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `تگ اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Tag Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `تگ اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Tag Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
local username_msg = msg.text:match("@")
if username_msg and lock_username == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
local username_msg = msg.text:match("@")
if username_msg and lock_username_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `نام کاربری مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Username Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
local username_msg = msg.text:match("@")
if username_msg and lock_username_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `نام کاربری اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Username Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
local username_msg = msg.text:match("@")
if username_msg and lock_username_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `نام کاربری اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Username Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `نام کاربری اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Username Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
local english_msg = msg.text:match("[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]") 
if english_msg and lock_english == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
local english_msg = msg.text:match("[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]") 
if english_msg and lock_english_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `انگلیسی مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `English Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
local english_msg = msg.text:match("[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]") 
if english_msg and lock_english_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `انگلیسی اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `English Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
local english_msg = msg.text:match("[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]") 
if english_msg and lock_english_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `انگلیسی اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `English Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `انگلیسی اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `English Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
if is_filter(msg, msg.text) then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
      end
    end
------------------------------------
local arabic_msg = msg.text:match("[\216-\219][\128-\191]")
if arabic_msg and lock_arabic == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
local arabic_msg = msg.text:match("[\216-\219][\128-\191]")
if arabic_msg and lock_arabic_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `فارسی مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Arabic Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
end
local arabic_msg = msg.text:match("[\216-\219][\128-\191]")
if arabic_msg and lock_arabic_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `فارسی اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Arabic Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
end
local arabic_msg = msg.text:match("[\216-\219][\128-\191]")
if arabic_msg and lock_arabic_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `فارسی اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Arabic Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `فارسی اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Arabic Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
if mute_all == "yes" then 
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
end
------------------------------------
if msg.text:match("(.*)") and mute_text == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
     end
   end
if msg.text:match("(.*)") and mute_text_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Text Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
     end
   end
if msg.text:match("(.*)") and mute_text_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `متن اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Text Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
     end
end
if msg.text:match("(.*)") and mute_text_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `متن اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Text Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `متن اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Text Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
------------------------------------
end
if msg.content_.entities_ and msg.content_.entities_[0] then
if msg.content_.entities_[0].ID == "MessageEntityMentionName" then
   if lock_mention == 'yes' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
  end
 end
 if msg.content_.entities_[0].ID == "MessageEntityMentionName" then
   if lock_mention_ban == 'ban' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `فراخوانی مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Mention Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
  end
 end
 if msg.content_.entities_[0].ID == "MessageEntityMentionName" then
   if lock_mention_kick == 'kick' then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `فراخوانی اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Mention Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
  end
 end
 if msg.content_.entities_[0].ID == "MessageEntityMentionName" then
   if lock_mention_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `فراخوانی اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Mention Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `فراخوانی اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Mention Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
end
------------------------------------
if msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
   if lock_webpage == 'yes' then
if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
  end
 end
 if msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
   if lock_webpage_ban == 'ban' then
if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `وب مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Webpage Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
  end
 end
 if msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
   if lock_webpage_kick == 'kick' then
if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `وب اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Webpage Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
  end
 end
 if msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
   if lock_webpage_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `وب اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Webpage Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `وب اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Webpage Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
end
------------------------------------
if msg.content_.entities_[0].ID == "MessageEntityBold" or msg.content_.entities_[0].ID == "MessageEntityCode" or msg.content_.entities_[0].ID == "MessageEntityPre" or msg.content_.entities_[0].ID == "MessageEntityItalic" then
   if lock_markdown == 'yes' then
if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
   end
  end
 end
 if msg.content_.entities_[0].ID == "MessageEntityBold" or msg.content_.entities_[0].ID == "MessageEntityCode" or msg.content_.entities_[0].ID == "MessageEntityPre" or msg.content_.entities_[0].ID == "MessageEntityItalic" then
   if lock_markdown == 'ban' then
if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `مسدود`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه مسدود شد 🚷⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Ban`\n\n*Uѕєя ɗυє тσ ρσѕт мєɗια, υηαυтнσяιzєɗ fяσм тнιѕ gяσυρ ωєяє вƖσcкєɗ 🚷⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
end
  elseif is_chat then
kick_user(user, chat)
   end
  end
 end
 if msg.content_.entities_[0].ID == "MessageEntityBold" or msg.content_.entities_[0].ID == "MessageEntityCode" or msg.content_.entities_[0].ID == "MessageEntityPre" or msg.content_.entities_[0].ID == "MessageEntityItalic" then
   if lock_markdown_kick == 'kick' then
if is_channel then
 del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
 if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *وضعیت :* `اخراج`\n\n*کاربر به دلیل ارسال رسانه های غیر مجاز از این گروه اخراج شد 🚫⚠️*\n\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 ایدی  :* `'..msg.from.id..'`\n*👤 نام :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 else
tdcli.sendMessage(msg.to.id, msg.id, 0, '♨️ *Ƭнє ѕιтєυαтιση :* `Kick`\n\n*Uѕєя Ɓєcαυѕє σf тнє Sєηɗ, мєɗια, ηση-αυтнσяιzєɗ fяσм тнє gяσυρ, ωαѕ єxρєƖƖєɗ 🚫⚠️*\n\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @'..check_markdown(msg.from.username or '404NoTUserName')..'\n*🔖 Uѕєя :* `'..msg.from.id..'`\n*👤 ηαмє :* `'..check_markdown(msg.from.first_name or '404NoTName')..'`', 0, "md")
 end
 sleep(1)
channel_unblock(msg.chat_id_, msg.sender_user_id_)
  elseif is_chat then
kick_user(user, chat)
   end
  end
 end
 if msg.content_.entities_[0].ID == "MessageEntityBold" or msg.content_.entities_[0].ID == "MessageEntityCode" or msg.content_.entities_[0].ID == "MessageEntityPre" or msg.content_.entities_[0].ID == "MessageEntityItalic" then
   if lock_markdown_warn == 'warn' then
 if is_channel then
if tonumber(warnhash) == tonumber(max_warn) then
if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n *به دلیل دریافت اخطار بیش از حد اخراج شد*\n_تعداد اخطار ها :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n `Hαѕ Beeɴ` *Kιcĸed* `Becαυѕe Mαх Wαrɴιɴɢ`\n_Nυмвer oғ wαrɴ :_ *[*`"..warnhash.."`*/*`"..max_warn.."`*]*", 0, "md")
end
del_msg(chat, tonumber(msg.id))
kick_user(user, chat)
redis:hdel(hashwarn, user, '0')
else
redis:hset(hashwarn, user, tonumber(warnhash) + 1)
del_msg(chat, tonumber(msg.id))
   if lang then
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *وضعیت :* `اخطار`\n`اطلاعات کاربر :`\n*🆔 نام کاربری :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 آیدی :* `"..msg.from.id.."`\n*👤 نام :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_شما یک اخطار دریافت کردید_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _تعداد اخطار های شما_", 0, "md")
else
tdcli.sendMessage(msg.to.id, msg.id, 0, "♨️ *Ƭнє ѕιтєυαтιση :* `Warn`\n`UѕєяIηfσ :`\n*🆔 Uѕєяηαмє :* @"..check_markdown(msg.from.username or '404NoTUserName').."\n*🔖 Uѕєя :* `"..msg.from.id.."`\n*👤 ηαмє :* `"..check_markdown(msg.from.first_name or '404NoTName').."`\n\n_Yoυ've_ *[*`"..warnhash.."`*]* *oғ* *[*`"..max_warn.."`*]* _Wαrɴѕ!_", 0, "md")
end
end
  end
end
end
------------------------------------
 end
if msg.to.type ~= 'pv' then
  if lock_flood == 'yes' then
    if is_mod(msg) and is_whitelist(msg.from.id, msg.to.id) then
    return
  end
  if msg.adduser or msg.joinuser then
    return
  end
    local hash = 'user:'..user..':msgs'
    local msgs = tonumber(redis:get(hash) or 0)
        local NUM_MSG_MAX = 5
        if data[tostring(chat)] then
          if data[tostring(chat)]['settings']['num_msg_max'] then
            NUM_MSG_MAX = tonumber(data[tostring(chat)]['settings']['num_msg_max'])
          end
        end
    if msgs > NUM_MSG_MAX then
   if msg.from.username then
      user_name = "@"..msg.from.username
         else
      user_name = msg.from.first_name
     end
if redis:get('sender:'..user..':flood') then
return
else
   del_msg(chat, msg.id)
    kick_user(user, chat)
	redis:del(hash)
   if not lang then
  tdcli.sendMessage(chat, msg.id, 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..user.."]`\n _нαѕ вєєη_ *кιcкєɗ* _вєcαυѕє σf_ *fƖσσɗιηg*", 0, "md")
   elseif lang then
  tdcli.sendMessage(chat, msg.id, 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..user.."]`\n *به دلیل ارسال پیام های مکرر اخراج شد*", 0, "md")
    end
redis:setex('sender:'..user..':flood', 30, true)
      end
    end
    redis:setex(hash, TIME_CHECK, msgs+1)
               end
           end
      end
   end
	--return msg
 end
----------------------------------------
local function action_by_reply(arg, data)
local hash = "gp_lang:"..data.chat_id_
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
if not tonumber(data.sender_user_id_) then return false end
    if data.sender_user_id_ then
  if not administration[tostring(data.chat_id_)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "#》 *Ɠяσυρ ιѕ ησт αɗɗєɗ* 🚫\n*〰〰〰〰〰〰〰〰*\n💠 `Group from the first to the group list, the robot was not added`", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_#》 `گروه در` #لیست `گروه ربات  نیست` 🚫\n*〰〰〰〰〰〰〰〰*\n💠 گروه از اول به لیست گروه ربات اضافه نشده است ._", 0, "md")
     end
  end
  if cmd == "ban" then
local function ban_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
   if is_mod1(arg.chat_id, data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_Ƴσυ cαη'т вαη_ *мσɗѕ,σωηєяѕ αηɗ вσт αɗмιηѕ*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*شما نمیتوانید مدیران،صاحبان گروه، و ادمین های ربات رو از گروه محروم کنید*", 0, "md")
         end
     end
if administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ αƖяєαɗу_ *вαηηєɗ*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n * از گروه محروم بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ вєєη_ *вαηηєɗ*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از گروه محروم شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, ban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
   if cmd == "unban" then
local function unban_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ ησт_ *вαηηєɗ*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از گروه محروم نبود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ вєєη_ *υηвαηηєɗ*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از محرومیت گروه خارج شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, unban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "silent" then
local function silent_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
   if is_mod1(arg.chat_id, data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_Ƴσυ cαη'т ѕιƖєηт_ *мσɗѕ,σωηєяѕ αηɗ вσт αɗмιηѕ*", 0, "md")
    else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*شما نمیتوانید توانایی چت کردن رو از مدیران،صاحبان گروه، و ادمین های ربات بگیرید*", 0, "md")
       end
     end
if administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ αƖяєαɗу_ *ѕιƖєηт*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل توانایی چت کردن رو نداشت*", 0, "md")
     end
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
  if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _αɗɗєɗ тσ_ *ѕιƖєηт υѕєяѕ Ɩιѕт*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *توانایی چت کردن رو از دست داد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, silent_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "unsilent" then
local function unsilent_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ ησт_ *ѕιƖєηт*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل توانایی چت کردن را داشت*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _яємσνєɗ fяσм_ *ѕιƖєηт υѕєяѕ Ɩιѕт*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *توانایی چت کردن رو به دست آورد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, unsilent_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "banall" then
local function gban_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
   if is_admin1(data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_Ƴσυ cαη'т_ *gƖσвαƖƖу вαη* _σтнєя αɗмιηѕ_", 0, "md")
  else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*شما نمیتوانید ادمین های ربات رو از تمامی گروه های ربات محروم کنید*", 0, "md")
        end
     end
if is_gbanned(data.id_) then
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ αƖяєαɗу_ *gƖσвαƖƖу вαηηєɗ*", 0, "md")
    else
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از گروه های ربات محروم بود*", 0, "md")
      end
   end
  administration['gban_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
     if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ вєєη_ *gƖσвαƖƖу вαηηєɗ*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از تمام گروه های ربات محروم شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, gban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "unbanall" then
local function ungban_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
if not is_gbanned(data.id_) then
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ ησт_ *gƖσвαƖƖу вαηηєɗ*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از گروه های ربات محروم نبود*", 0, "md")
      end
   end
  administration['gban_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ вєєη_ *gƖσвαƖƖу υηвαηηєɗ*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از محرومیت گروه های ربات خارج شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, ungban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "kick" then
   if is_mod1(data.chat_id_, data.sender_user_id_) then
   if not lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "_Ƴσυ cαη'т кιcк_ *мσɗѕ,σωηєяѕ αηɗ вσт αɗмιηѕ*", 0, "md")
    elseif lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*شما نمیتوانید مدیران،صاحبان گروه و ادمین های ربات رو اخراج کنید*", 0, "md")
   end
  else
     kick_user(data.sender_user_id_, data.chat_id_)
     end
  end
  if cmd == "delall" then
   if is_mod1(data.chat_id_, data.sender_user_id_) then
   if not lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "_Ƴσυ cαη'т ɗєƖєтє мєѕѕαgєѕ_ *мσɗѕ,σωηєяѕ αηɗ вσт αɗмιηѕ*", 0, "md")
   elseif lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*شما نمیتوانید پیام های مدیران،صاحبان گروه و ادمین های ربات رو پاک کنید*", 0, "md")
   end
  else
tdcli.deleteMessagesFromUser(data.chat_id_, data.sender_user_id_, dl_cb, nil)
   if not lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "_AƖƖ_ *мєѕѕαgєѕ* _σf_ *[ "..data.sender_user_id_.." ]* _нαѕ вєєη_ *ɗєƖєтєɗ*", 0, "md")
      elseif lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*تمام پیام های* *[ "..data.sender_user_id_.." ]* *پاک شد*", 0, "md")
       end
    end
  end
    if cmd == "adminprom" then
local function adminprom_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if is_admin1(tonumber(data.id_)) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `ιѕ αƖяєαɗу α` *αɗмιη*", 0, "md")
  else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _از قبل ادمین ربات بود_", 0, "md")
      end
   end
	    table.insert(_config.admins, {tonumber(data.id_), user_name})
		save_config()
     if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `нαѕ вєєη ρяσмσтєɗ αѕ` *αɗмιη*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _به مقام ادمین ربات منتصب شد_", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, adminprom_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "admindem" then
local function admindem_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
	local nameid = index_function(tonumber(data.id_))
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not is_admin1(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `ιѕ ησт α` *αɗмιη*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _از قبل ادمین ربات نبود_", 0, "md")
      end
   end
		table.remove(_config.admins, getindex( _config.admins, tonumber(data.id_)))
		save_config()
		reload_plugins(true)
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `нαѕ вєєη ɗємσтєɗ fяσм` *αɗмιη*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _از مقام ادمین ربات برکنار شد_", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, admindem_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "visudo" then
local function visudo_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if already_sudo(tonumber(data.id_)) then
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `ιѕ αƖяєαɗу α` *ѕυɗσєя*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _از قبل سودو ربات بود_", 0, "md")
      end
   end
          table.insert(_config.sudo_users, tonumber(data.id_))
		save_config()
     reload_plugins(true)
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `ιѕ ησω` *ѕυɗσєя*", 0, "md")
  else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _به مقام سودو ربات منتصب شد_", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, visudo_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "desudo" then
local function desudo_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
     if not already_sudo(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `ιѕ ησт α` *ѕυɗσєя*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _از قبل سودو ربات نبود_", 0, "md")
      end
   end
          table.remove(_config.sudo_users, getindex( _config.sudo_users, tonumber(data.id_)))
		save_config()
     reload_plugins(true) 
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `нαѕ вєєη ɗємσтєɗ fяσм` *ѕυɗσєя*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _از مقام سودو ربات برکنار شد_", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, desudo_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
if cmd == "setmanager" then
local function manager_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  channel_set_admin(arg.chat_id, data.id_)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n_ιѕ Ɲσω Ƭнє_ *Ɠяσυρ Mαηαgєя*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n*ادمین گروه شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, manager_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
if cmd == "remmanager" then
local function rem_manager_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  channel_demote(arg.chat_id, data.id_)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ Ɲσ Lσηgєя_ *Ɠяσυρ Mαηαgєя*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از ادمینی گروه برکنار شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, rem_manager_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "setwhitelist" then
local function setwhitelist_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ AƖяєαɗу ιη_ *Ɯнιтє Lιѕт*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل در لیست سفید بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ Ɓєєη Aɗɗєɗ Ƭσ_ *Ɯнιтє Lιѕт*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *به لیست سفید اضافه شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, setwhitelist_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "remwhitelist" then
local function remwhitelist_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if not administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ Ɲσт ιη_ *Ɯнιтє Lιѕт*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل در لیست سفید نبود*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ Ɓєєη Rємσνєɗ Ƒяσм_ *Ɯнιтє Lιѕт*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از لیست سفید حذف شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, remwhitelist_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
if cmd == "setowner" then
local function owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ AƖяєαɗу α_ *Ɠяσυρ Oωηєя*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل صاحب گروه بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ Ɲσω Ƭнє_ *Ɠяσυρ Oωηєя*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *به مقام صاحب گروه منتصب شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "promote" then
local function promote_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ AƖяєαɗу α_ *Mσɗєяαтσя*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل مدیر گروه بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ Ɓєєη_ *Mσɗєяαтσя*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *به مقام مدیر گروه منتصب شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, promote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
     if cmd == "remowner" then
local function rem_owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ Ɲσт α_ *Ɠяσυρ Oωηєя*", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل صاحب گروه نبود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ Ɲσ Lσηgєя α_ *Ɠяσυρ Oωηєя*", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از مقام صاحب گروه برکنار شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, rem_owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "demote" then
local function demote_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ ησт α_ *Mσɗєяαтσя*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل مدیر گروه نبود*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ Ɓєєη_ *Ɗємσтєɗ*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از مقام مدیر گروه برکنار شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, demote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "id" then
local function id_cb(arg, data)
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, id_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
else
    if lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "`کاربر یافت نشد`⚠️👣", 0, "md")
   else
  return tdcli.sendMessage(data.chat_id_, "", 0, "`Uѕєя Ɲσт Ƒσυηɗ`⚠️👣", 0, "md")
      end
   end
end
----------------------------------------
local function action_by_username(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "#》 *Ɠяσυρ ιѕ ησт αɗɗєɗ* 🚫\n*〰〰〰〰〰〰〰〰*\n💠 `Group from the first to the group list, the robot was not added`", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_#》 `گروه در` #لیست `گروه ربات  نیست` 🚫\n*〰〰〰〰〰〰〰〰*\n💠 گروه از اول به لیست گروه ربات اضافه نشده است ._", 0, "md")
     end
  end
if not arg.username then return false end
   if data.id_ then
if data.type_.user_.username_ then
user_name = '@'..check_markdown(data.type_.user_.username_)
else
user_name = check_markdown(data.title_)
end
  if cmd == "ban" then
   if is_mod1(arg.chat_id, data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_Ƴσυ cαη'т вαη_ *мσɗѕ,σωηєяѕ αηɗ вσт αɗмιηѕ*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*شما نمیتوانید مدیران،صاحبان گروه، و ادمین های ربات رو از گروه محروم کنید*", 0, "md")
         end
     end
if administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ αƖяєαɗу_ *вαηηєɗ*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n * از گروه محروم بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ вєєη_ *вαηηєɗ*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از گروه محروم شد*", 0, "md")
   end
end
   if cmd == "unban" then
if not administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ ησт_ *вαηηєɗ*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از گروه محروم نبود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ вєєη_ *υηвαηηєɗ*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از محرومیت گروه خارج شد*", 0, "md")
   end
end
  if cmd == "silent" then
   if is_mod1(arg.chat_id, data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_Ƴσυ cαη'т ѕιƖєηт_ *мσɗѕ,σωηєяѕ αηɗ вσт αɗмιηѕ*", 0, "md")
    else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*شما نمیتوانید توانایی چت کردن رو از مدیران،صاحبان گروه، و ادمین های ربات بگیرید*", 0, "md")
       end
     end
if administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ αƖяєαɗу_ *ѕιƖєηт*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل توانایی چت کردن رو نداشت*", 0, "md")
     end
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
  if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _αɗɗєɗ тσ_ *ѕιƖєηт υѕєяѕ Ɩιѕт*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *توانایی چت کردن رو از دست داد*", 0, "md")
   end
end
  if cmd == "unsilent" then
if not administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ ησт_ *ѕιƖєηт*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل توانایی چت کردن را داشت*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _яємσνєɗ fяσм_ *ѕιƖєηт υѕєяѕ Ɩιѕт*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *توانایی چت کردن رو به دست آورد*", 0, "md")
   end
end
  if cmd == "banall" then
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
   if is_admin1(data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_Ƴσυ cαη'т_ *gƖσвαƖƖу вαη* _σтнєя αɗмιηѕ_", 0, "md")
  else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*شما نمیتوانید ادمین های ربات رو از تمامی گروه های ربات محروم کنید*", 0, "md")
        end
     end
if is_gbanned(data.id_) then
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ αƖяєαɗу_ *gƖσвαƖƖу вαηηєɗ*", 0, "md")
    else
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از گروه های ربات محروم بود*", 0, "md")
      end
   end
  administration['gban_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
     if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ вєєη_ *gƖσвαƖƖу вαηηєɗ*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از تمام گروه های ربات محروم شد*", 0, "md")
   end
end
  if cmd == "unbanall" then
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
if not is_gbanned(data.id_) then
     if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ ησт_ *gƖσвαƖƖу вαηηєɗ*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از گروه های ربات محروم نبود*", 0, "md")
      end
   end
  administration['gban_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ вєєη_ *gƖσвαƖƖу υηвαηηєɗ*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از محرومیت گروه های ربات خارج شد*", 0, "md")
   end
end
  if cmd == "kick" then
   if is_mod1(arg.chat_id, data.id_) then
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_Ƴσυ cαη'т кιcк_ *мσɗѕ,σωηєяѕ αηɗ вσт αɗмιηѕ*", 0, "md")
    elseif lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*شما نمیتوانید مدیران،صاحبان گروه و ادمین های ربات رو اخراج کنید*", 0, "md")
   end
  else
     kick_user(data.id_, arg.chat_id)
     end
  end
  if cmd == "delall" then
   if is_mod1(arg.chat_id, data.id_) then
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_Ƴσυ cαη'т ɗєƖєтє мєѕѕαgєѕ_ *мσɗѕ,σωηєяѕ αηɗ вσт αɗмιηѕ*", 0, "md")
   elseif lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*شما نمیتوانید پیام های مدیران،صاحبان گروه و ادمین های ربات رو پاک کنید*", 0, "md")
   end
  else
tdcli.deleteMessagesFromUser(arg.chat_id, data.id_, dl_cb, nil)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_AƖƖ_ *мєѕѕαgєѕ* _σf_ "..user_name.." *[ "..data.id_.." ]* _нαѕ вєєη_ *ɗєƖєтєɗ*", 0, "md")
      elseif lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*تمام پیام های* "..user_name.." *[ "..data.id_.." ]* *پاک شد*", 0, "md")
       end
    end
  end
    if cmd == "adminprom" then
if is_admin1(tonumber(data.id_)) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `ιѕ αƖяєαɗу αη` *αɗмιη*", 0, "md")
  else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _از قبل ادمین ربات بود_", 0, "md")
      end
   end
	    table.insert(_config.admins, {tonumber(data.id_), user_name})
		save_config()
     if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `нαѕ вєєη ρяσмσтєɗ αѕ` *αɗмιη*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _به مقام ادمین ربات منتصب شد_", 0, "md")
   end
end
    if cmd == "admindem" then
	local nameid = index_function(tonumber(data.id_))
if not is_admin1(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `ιѕ ησт α` *αɗмιη*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _از قبل ادمین ربات نبود_", 0, "md")
      end
   end
		table.remove(_config.admins, nameid)
		save_config()
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `нαѕ вєєη ɗємσтєɗ fяσм` *αɗмιη*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _از مقام ادمین ربات برکنار شد_", 0, "md")
   end
end
    if cmd == "visudo" then
if already_sudo(tonumber(data.id_)) then
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `ιѕ αƖяєαɗу α` *ѕυɗσєя*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _از قبل سودو ربات بود_", 0, "md")
      end
   end
          table.insert(_config.sudo_users, tonumber(data.id_))
		save_config()
     reload_plugins(true)
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `ιѕ ησω` *ѕυɗσєя*", 0, "md")
  else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _به مقام سودو ربات منتصب شد_", 0, "md")
   end
end
    if cmd == "desudo" then
     if not already_sudo(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `ιѕ ησт α` *ѕυɗσєя*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _از قبل سودو ربات نبود_", 0, "md")
      end
   end
          table.remove(_config.sudo_users, getindex( _config.sudo_users, tonumber(data.id_)))
		save_config()
     reload_plugins(true) 
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `нαѕ вєєη ɗємσтєɗ fяσм` *ѕυɗσєя*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _از مقام سودو ربات برکنار شد_", 0, "md")
      end
   end
if cmd == "setmanager" then
  channel_set_admin(arg.chat_id, data.id_)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n_ιѕ Ɲσω Ƭнє_ *Ɠяσυρ Mαηαgєя*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n*ادمین گروه شد*", 0, "md")
   end
end
if cmd == "remmanager" then
  channel_demote(arg.chat_id, data.id_)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ Ɲσ Lσηgєя_ *Ɠяσυρ Mαηαgєя*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از ادمینی گروه برکنار شد*", 0, "md")
   end
 end
    if cmd == "setwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ AƖяєαɗу ιη_ *Ɯнιтє Lιѕт*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل در لیست سفید بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ Ɓєєη Aɗɗєɗ Ƭσ_ *Ɯнιтє Lιѕт*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *به لیست سفید اضافه شد*", 0, "md")
   end
end
    if cmd == "remwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if not administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ Ɲσт ιη_ *Ɯнιтє Lιѕт*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل در لیست سفید نبود*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ Ɓєєη Rємσνєɗ Ƒяσм_ *Ɯнιтє Lιѕт*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از لیست سفید حذف شد*", 0, "md")
   end
end
if cmd == "setowner" then
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ AƖяєαɗу α_ *Ɠяσυρ Oωηєя*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل صاحب گروه بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ Ɲσω Ƭнє_ *Ɠяσυρ Oωηєя*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *به مقام صاحب گروه منتصب شد*", 0, "md")
   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ AƖяєαɗу α_ *Mσɗєяαтσя*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل مدیر گروه بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ Ɓєєη_ *Mσɗєяαтσя*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *به مقام مدیر گروه منتصب شد*", 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ Ɲσт α_ *Ɠяσυρ Oωηєя*", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل صاحب گروه نبود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ Ɲσ Lσηgєя α_ *Ɠяσυρ Oωηєя*", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از مقام صاحب گروه برکنار شد*", 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ ησт α_ *Mσɗєяαтσя*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل مدیر گروه نبود*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ Ɓєєη_ *Ɗємσтєɗ*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از مقام مدیر گروه برکنار شد*", 0, "md")
   end
end
   if cmd == "id" then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
    if cmd == "res" then
    if not lang then
     text = "Result for [ "..check_markdown(data.type_.user_.username_).." ] :\n"
    .. ""..check_markdown(data.title_).."\n"
    .. " ["..data.id_.."]"
  else
     text = "اطلاعات برای [ "..check_markdown(data.type_.user_.username_).." ] :\n"
    .. "".. check_markdown(data.title_) .."\n"
    .. " [".. data.id_ .."]"
         end
       return tdcli.sendMessage(arg.chat_id, 0, 1, text, 1, 'md')
   end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "`کاربر یافت نشد`⚠️👣", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "`Uѕєя Ɲσт Ƒσυηɗ`⚠️👣", 0, "md")
      end
   end
end
----------------------------------------
local function action_by_id(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "#》 *Ɠяσυρ ιѕ ησт αɗɗєɗ* 🚫\n*〰〰〰〰〰〰〰〰*\n💠 `Group from the first to the group list, the robot was not added`", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_#》 `گروه در` #لیست `گروه ربات  نیست` 🚫\n*〰〰〰〰〰〰〰〰*\n💠 گروه از اول به لیست گروه ربات اضافه نشده است ._", 0, "md")
     end
  end
if not tonumber(arg.user_id) then return false end
   if data.id_ then
if data.first_name_ then
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
    if cmd == "adminprom" then
if is_admin1(tonumber(data.id_)) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `ιѕ αƖяєαɗу αη` *αɗмιη*", 0, "md")
  else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _از قبل ادمین ربات بود_", 0, "md")
      end
   end
	    table.insert(_config.admins, {tonumber(data.id_), user_name})
		save_config()
     if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `нαѕ вєєη ρяσмσтєɗ αѕ` *αɗмιη*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _به مقام ادمین ربات منتصب شد_", 0, "md")
   end
end 
    if cmd == "admindem" then
	local nameid = index_function(tonumber(data.id_))
if not is_admin1(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `ιѕ ησт α` *αɗмιη*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _از قبل ادمین ربات نبود_", 0, "md")
      end
   end
		table.remove(_config.admins, nameid)
		save_config()
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `нαѕ вєєη ɗємσтєɗ fяσм` *αɗмιη*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _از مقام ادمین ربات برکنار شد_", 0, "md")
   end
end
    if cmd == "visudo" then
if already_sudo(tonumber(data.id_)) then
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `ιѕ αƖяєαɗу α` *ѕυɗσєя*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _از قبل سودو ربات بود_", 0, "md")
      end
   end
          table.insert(_config.sudo_users, tonumber(data.id_))
		save_config()
     reload_plugins(true)
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `ιѕ ησω` *ѕυɗσєя*", 0, "md")
  else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _به مقام سودو ربات منتصب شد_", 0, "md")
   end
end
    if cmd == "desudo" then
     if not already_sudo(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `ιѕ ησт α` *ѕυɗσєя*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _از قبل سودو ربات نبود_", 0, "md")
      end
   end
          table.remove(_config.sudo_users, getindex( _config.sudo_users, tonumber(data.id_)))
		save_config()
     reload_plugins(true) 
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n `нαѕ вєєη ɗємσтєɗ fяσм` *ѕυɗσєя*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n _از مقام سودو ربات برکنار شد_", 0, "md")
      end
   end
if cmd == "setmanager" then
  channel_set_admin(arg.chat_id, data.id_)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n_ιѕ Ɲσω Ƭнє_ *Ɠяσυρ Mαηαgєя*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n*ادمین گروه شد*", 0, "md")
   end
end
if cmd == "remmanager" then
  channel_demote(arg.chat_id, data.id_)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*✴️》Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]` _ιѕ Ɲσ Lσηgєя_ *Ɠяσυρ Mαηαgєя*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از ادمینی گروه برکنار شد*", 0, "md")
   end
 end
    if cmd == "setwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ AƖяєαɗу ιη_ *Ɯнιтє Lιѕт*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل در لیست سفید بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ Ɓєєη Aɗɗєɗ Ƭσ_ *Ɯнιтє Lιѕт*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *به لیست سفید اضافه شد*", 0, "md")
   end
end
    if cmd == "remwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if not administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ Ɲσт ιη_ *Ɯнιтє Lιѕт*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل در لیست سفید نبود*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ Ɓєєη Rємσνєɗ Ƒяσм_ *Ɯнιтє Lιѕт*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از لیست سفید حذف شد*", 0, "md")
   end
end
  if cmd == "setowner" then
  if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ AƖяєαɗу α_ *Ɠяσυρ Oωηєя*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل صاحب گروه بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ Ɲσω Ƭнє_ *Ɠяσυρ Oωηєя*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *به مقام صاحب گروه منتصب شد*", 0, "md")
   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ AƖяєαɗу α_ *Mσɗєяαтσя*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل مدیر گروه بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ Ɓєєη_ *Mσɗєяαтσя*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *به مقام مدیر گروه منتصب شد*", 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ Ɲσт α_ *Ɠяσυρ Oωηєя*", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل صاحب گروه نبود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ Ɲσ Lσηgєя α_ *Ɠяσυρ Oωηєя*", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از مقام صاحب گروه برکنار شد*", 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _ιѕ ησт α_ *Mσɗєяαтσя*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از قبل مدیر گروه نبود*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*Uѕєя :* ["..user_name.."]\n🆔》*IƊ :* `["..data.id_.."]`\n _нαѕ Ɓєєη_ *Ɗємσтєɗ*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "✴️》*کاربر :* ["..user_name.."]\n🆔》*ایدی :* `["..data.id_.."]`\n *از مقام مدیر گروه برکنار شد*", 0, "md")
   end
end
 else
    if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "`Uѕєя Ɲσт Ƒσυηɗ`⚠️👣", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "`کاربر یافت نشد`⚠️👣", 0, "md")
    end
  end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "`کاربر یافت نشد`⚠️👣", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "`Uѕєя Ɲσт Ƒσυηɗ`⚠️👣", 0, "md")
      end
   end
end
----------------------------------------
local function getChatId(chat_id)
  local chat = {}
  local chat_id = tostring(chat_id)
  if chat_id:match('^-100') then
    local channel_id = chat_id:gsub('-100', '')
    chat = {ID = channel_id, type = 'channel'}
  else
    local group_id = chat_id:gsub('-', '')
    chat = {ID = group_id, type = 'group'}
  end
  return chat
end
--------Mute all--------------------------
local function mute_all(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_all = data[tostring(target)]["mutes"]["mute_all"] 
if mute_all == "yes" then 
if not lang then
return "*>Ɛяяσя*\n`Iѕ AƖяєαɗу AƖƖ Uѕєя SιƖєηт` ♻️⚠️" 
elseif lang then
return "*>انجام نشد*\n`تمامی کاربران از قبل در حالت سکوت بودن` ♻️⚠️"
end
else 
data[tostring(target)]["mutes"]["mute_all"] = "yes"
 save_data(_config.moderation.data, data) 
if not lang then
return "*>Ɗσηє*\n`AƖƖ Uѕєя SιƖєηт` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "*>انجام شد*\n`تمام کاربران در حالت سکوت قرار گرفتن` 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
local function unmute_all(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_all = data[tostring(target)]["mutes"]["mute_all"] 
if mute_all == "no" then 
if not lang then
return "*>Ɛяяσя*\n`Iѕ Ɲσт AƖƖ Uѕєя SιƖєηт` ❌🔐" 
elseif lang then
return "*>انجام نشد*\n`تمام کاربران در حالت سکوت قرار نگرفتن` ❌🔐"
end
else 
data[tostring(target)]["mutes"]["mute_all"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*>Ɗσηє*\n`AƖƖ Uѕєя UηѕιƖєηт` 🤖🔓\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "*>انجام شد*\n`تمام کاربران از حالت سکوت ازاد شدن` 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end 
end
end
---------------Lock Link-------------------
local function lock_link(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_link = data[tostring(target)]["settings"]["lock_link"] 
if lock_link == 'yes' then
if not lang then
 return "*>Lιηк* `Ƥσѕтιηg Iѕ AƖяєαɗу Lσcкєɗ` ♻️⚠️"
elseif lang then
 return "ارسال لینک در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_link"] = 'yes'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lιηк* `Ƥσѕтιηg Hαѕ Ɓєєη Lσcкєɗ` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "ارسال لینک در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_link(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_link_ban = data[tostring(target)]["settings"]["lock_link"] 
if lock_link_ban == 'ban' then
if not lang then
 return "*>Lιηк* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود لینک در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_link"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lιηк* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود لینک در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_link(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_link_kick = data[tostring(target)]["settings"]["lock_link"] 
if lock_link_kick == 'kick' then
if not lang then
 return "*>Lιηк* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج لینک در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_link"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lιηк* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج لینک در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_link(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_link_warn = data[tostring(target)]["settings"]["lock_link"] 
if lock_link_warn == 'warn' then
if not lang then
 return "*>Lιηк* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار لینک در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_link"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lιηк* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار لینک در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unlock_link(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_link = data[tostring(target)]["settings"]["lock_link"]
 if lock_link == 'no' then
if not lang then
return "*>Lιηк* `Ƥσѕтιηg Iѕ Ɲσт Lσcкєɗ` ❌🔐" 
elseif lang then
return "ارسال لینک در گروه ممنوع نمیباشد ❌🔐"
end
else 
data[tostring(target)]["settings"]["lock_link"] = 'no' save_data(_config.moderation.data, data) 
if not lang then
return "*>Lιηк* `Ƥσѕтιηg Hαѕ Ɓєєη UηƖσcкєɗ` 🤖🔓\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "ارسال لینک در گروه آزاد شد 🤖🔓\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end

---------------Lock Tag-------------------
local function lock_tag(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_tag = data[tostring(target)]["settings"]["lock_tag"] 
if lock_tag == 'yes' then
if not lang then
 return "*Tag* `Ƥσѕтιηg Iѕ AƖяєαɗу Lσcкєɗ` ♻️⚠️"
elseif lang then
 return "ارسال تگ در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
 data[tostring(target)]["settings"]["lock_tag"] = 'yes'
save_data(_config.moderation.data, data) 
if not lang then
 return "*Tag* `Ƥσѕтιηg Hαѕ Ɓєєη Lσcкєɗ` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "ارسال تگ در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_tag(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_tag_ban = data[tostring(target)]["settings"]["lock_tag"] 
if lock_tag_ban == 'ban' then
if not lang then
 return "*>Tag* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود تگ در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_tag"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Tag* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود تگ در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_tag(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_tag_kick = data[tostring(target)]["settings"]["lock_tag"] 
if lock_tag_kick == 'kick' then
if not lang then
 return "*>Tag* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج تگ در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_+"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Tag* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج تگ در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_tag(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_tag_warn = data[tostring(target)]["settings"]["lock_tag"] 
if lock_tag_warn == 'warn' then
if not lang then
 return "*>Tag* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار تگ در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_tag"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Tag* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار تگ در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unlock_tag(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_tag = data[tostring(target)]["settings"]["lock_tag"]
 if lock_tag == 'no' then
if not lang then
return "*Tag* `Ƥσѕтιηg Iѕ Ɲσт Lσcкєɗ` ❌🔐" 
elseif lang then
return "ارسال تگ در گروه ممنوع نمیباشد ❌🔐"
end
else 
data[tostring(target)]["settings"]["lock_tag"] = 'no' save_data(_config.moderation.data, data) 
if not lang then
return "*Tag* `Ƥσѕтιηg Hαѕ Ɓєєη UηƖσcкєɗ` 🤖🔓\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "ارسال تگ در گروه آزاد شد 🤖🔓\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end

---------------Lock Username-------------------
local function lock_username(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_username = data[tostring(target)]["settings"]["lock_username"] 
if lock_username == 'yes' then
if not lang then
 return "*username* `Ƥσѕтιηg Iѕ AƖяєαɗу Lσcкєɗ` ♻️⚠️"
elseif lang then
 return "ارسال نام کاربری در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
 data[tostring(target)]["settings"]["lock_username"] = 'yes'
save_data(_config.moderation.data, data) 
if not lang then
 return "*username* `Ƥσѕтιηg Hαѕ Ɓєєη Lσcкєɗ` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "ارسال نام کاربری در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_username(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_username_ban = data[tostring(target)]["settings"]["lock_username"] 
if lock_username_ban == 'ban' then
if not lang then
 return "*>username* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود نام کاربری در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_+"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>username* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود نام کاربری در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_username(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_username_kick = data[tostring(target)]["settings"]["lock_username"] 
if lock_username_kick == 'kick' then
if not lang then
 return "*>username* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج نام کاربری در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_username"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>username* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج نام کاربری در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_username(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_username_warn = data[tostring(target)]["settings"]["lock_username"] 
if lock_username_warn == 'warn' then
if not lang then
 return "*>username* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار نام کاربری در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_username"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>username* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار نام کاربری در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unlock_username(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_tag = data[tostring(target)]["settings"]["lock_username"]
 if lock_username == 'no' then
if not lang then
return "*username* `Ƥσѕтιηg Iѕ Ɲσт Lσcкєɗ` ❌🔐" 
elseif lang then
return "ارسال نام کاربری در گروه ممنوع نمیباشد ❌🔐"
end
else 
data[tostring(target)]["settings"]["lock_username"] = 'no' save_data(_config.moderation.data, data) 
if not lang then
return "*username* `Ƥσѕтιηg Hαѕ Ɓєєη UηƖσcкєɗ` 🤖🔓\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "ارسال نام کاربری در گروه آزاد شد 🤖🔓\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end

---------------Lock Mention-------------------
local function lock_mention(msg, data, target)
 local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_mention = data[tostring(target)]["settings"]["lock_mention"] 
if lock_mention == 'yes' then
if not lang then
 return "*>Mєηтιση* `Ƥσѕтιηg Iѕ AƖяєαɗу Lσcкєɗ` ♻️⚠️"
elseif lang then
 return "ارسال فراخوانی افراد هم اکنون ممنوع است ♻️⚠️"
end
else
 data[tostring(target)]["settings"]["lock_mention"] = 'yes'
save_data(_config.moderation.data, data)
if not lang then 
 return "*>Mєηтιση* `Ƥσѕтιηg Hαѕ Ɓєєη Lσcкєɗ` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else 
 return "ارسال فراخوانی افراد در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_mention(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_mention_ban = data[tostring(target)]["settings"]["lock_mention"] 
if lock_mention_ban == 'ban' then
if not lang then
 return "*>Mєηтιση* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود فراخوانی افراد در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_mention"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Mєηтιση* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود فراخوانی افراد در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_mention(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_mention_kick = data[tostring(target)]["settings"]["lock_mention"] 
if lock_mention_kick == 'kick' then
if not lang then
 return "*>Mєηтιση* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج فراخوانی افراد در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_mention"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Mєηтιση* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج فراخوانی افراد در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_mention(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_mention_warn = data[tostring(target)]["settings"]["lock_mention"] 
if lock_mention_warn == 'warn' then
if not lang then
 return "*>Mєηтιση* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار فراخوانی افراد در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_mention"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Mєηтιση* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار فراخوانی افراد در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unlock_mention(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_mention = data[tostring(target)]["settings"]["lock_mention"]
 if lock_mention == 'no' then
if not lang then
return "*>Mєηтιση* `Ƥσѕтιηg Iѕ Ɲσт Lσcкєɗ` ❌🔐" 
elseif lang then
return "ارسال فراخوانی افراد در گروه ممنوع نمیباشد ❌🔐"
end
else 
data[tostring(target)]["settings"]["lock_mention"] = 'no' save_data(_config.moderation.data, data) 
if not lang then
return "*>Mєηтιση* `Ƥσѕтιηg Hαѕ Ɓєєη UηƖσcкєɗ` 🤖🔓\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "ارسال فراخوانی افراد در گروه آزاد شد 🤖🔓\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end

---------------Lock Arabic--------------
local function lock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"] 
if lock_arabic == 'yes' then
if not lang then
 return "*>Aяαвιc/Ƥєяѕιαη* `Ƥσѕтιηg Iѕ AƖяєαɗу Lσcкєɗ` ♻️⚠️"
elseif lang then
 return "ارسال کلمات عربی/فارسی در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_arabic"] = 'yes'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Aяαвιc/Ƥєяѕιαη* `Ƥσѕтιηg Hαѕ Ɓєєη Lσcкєɗ` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "ارسال کلمات عربی/فارسی در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_arabic(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_arabic_ban = data[tostring(target)]["settings"]["lock_arabic"] 
if lock_arabic_ban == 'ban' then
if not lang then
 return "*>Aяαвιc/Ƥєяѕιαη* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود کلمات عربی/فارسی در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_arabic"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Aяαвιc/Ƥєяѕιαη* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود کلمات عربی/فارسی در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_arabic(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_arabic_kick = data[tostring(target)]["settings"]["lock_arabic"] 
if lock_arabic_kick == 'kick' then
if not lang then
 return "*>Aяαвιc/Ƥєяѕιαη* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج کلمات عربی/فارسی در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_arabic"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Aяαвιc/Ƥєяѕιαη* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج کلمات عربی/فارسی در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_arabic(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_arabic_warn = data[tostring(target)]["settings"]["lock_arabic"] 
if lock_arabic_warn == 'warn' then
if not lang then
 return "*>Aяαвιc/Ƥєяѕιαη* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار کلمات عربی/فارسی در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_arabic"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Aяαвιc/Ƥєяѕιαη* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار کلمات عربی/فارسی در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unlock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"]
 if lock_arabic == 'no' then
if not lang then
return "*>Aяαвιc/Ƥєяѕιαη* `Ƥσѕтιηg Iѕ Ɲσт Lσcкєɗ` ❌🔐" 
elseif lang then
return "ارسال کلمات عربی/فارسی در گروه ممنوع نمیباشد ❌🔐"
end
else 
data[tostring(target)]["settings"]["lock_arabic"] = 'no' save_data(_config.moderation.data, data) 
if not lang then
return "*>Aяαвιc/Ƥєяѕιαη* `Ƥσѕтιηg Hαѕ Ɓєєη UηƖσcкєɗ` 🤖🔓\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "ارسال کلمات عربی/فارسی در گروه آزاد شد 🤖🔓\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end

---------------Lock english--------------
local function lock_english(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_english = data[tostring(target)]["settings"]["lock_english"] 
if lock_english == 'yes' then
if not lang then
 return "*english* `Ƥσѕтιηg Iѕ AƖяєαɗу Lσcкєɗ` ♻️⚠️"
elseif lang then
 return "ارسال کلمات انگلیسی در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_english"] = 'yes'
save_data(_config.moderation.data, data) 
if not lang then
 return "*english* `Ƥσѕтιηg Hαѕ Ɓєєη Lσcкєɗ` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "ارسال کلمات انگلیسی در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_english(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_english_ban = data[tostring(target)]["settings"]["lock_english"] 
if lock_english_ban == 'ban' then
if not lang then
 return "*>english* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود کلمات انگلیسی در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_english"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>english* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود کلمات انگلیسی در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_english(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_english_kick = data[tostring(target)]["settings"]["lock_english"] 
if lock_english_kick == 'kick' then
if not lang then
 return "*>english* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج کلمات انگلیسی در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_english"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>english* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج کلمات انگلیسی در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_english(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_english_warn = data[tostring(target)]["settings"]["lock_english"] 
if lock_english_warn == 'warn' then
if not lang then
 return "*>english* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار کلمات انگلیسی در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_+"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>english* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار کلمات انگلیسی در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unlock_english(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_english = data[tostring(target)]["settings"]["lock_english"]
 if lock_english == 'no' then
if not lang then
return "*english* `Ƥσѕтιηg Iѕ Ɲσт Lσcкєɗ` ❌🔐" 
elseif lang then
return "ارسال کلمات انگلیسی در گروه ممنوع نمیباشد ❌🔐"
end
else 
data[tostring(target)]["settings"]["lock_english"] = 'no' save_data(_config.moderation.data, data) 
if not lang then
return "*english* `Ƥσѕтιηg Hαѕ Ɓєєη UηƖσcкєɗ` 🤖🔓\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "ارسال کلمات انگلیسی در گروه آزاد شد 🤖🔓\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end

---------------Lock Edit-------------------
local function lock_edit(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_edit = data[tostring(target)]["settings"]["lock_edit"] 
if lock_edit == 'yes' then
if not lang then
 return "*>Ɛɗιтιηg* `Iѕ AƖяєαɗу Lσcкєɗ` ♻️⚠️"
elseif lang then
 return "ویرایش پیام هم اکنون ممنوع است ♻️⚠️"
end
else
 data[tostring(target)]["settings"]["lock_edit"] = 'yes'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Ɛɗιтιηg* `Hαѕ Ɓєєη Lσcкєɗ` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "ویرایش پیام در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_edit(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_edit_ban = data[tostring(target)]["settings"]["lock_edit"] 
if lock_edit_ban == 'ban' then
if not lang then
 return "*>Ɛɗιтιηg* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود ویرایش پیام در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_edit"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Ɛɗιтιηg* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود ویرایش پیام در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_edit(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_edit_kick = data[tostring(target)]["settings"]["lock_edit"] 
if lock_edit_kick == 'kick' then
if not lang then
 return "*>Ɛɗιтιηg* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج ویرایش پیام در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_edit"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Ɛɗιтιηg* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج ویرایش پیام در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_edit(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_edit_warn = data[tostring(target)]["settings"]["lock_edit"] 
if lock_edit_warn == 'warn' then
if not lang then
 return "*>Ɛɗιтιηg* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار ویرایش پیام در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_edit"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Ɛɗιтιηg* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار ویرایش پیام در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unlock_edit(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_edit = data[tostring(target)]["settings"]["lock_edit"]
 if lock_edit == 'no' then
if not lang then
return "*>Ɛɗιтιηg* `Iѕ Ɲσт Lσcкєɗ` ❌🔐" 
elseif lang then
return "ویرایش پیام در گروه ممنوع نمیباشد ❌🔐"
end
else 
data[tostring(target)]["settings"]["lock_edit"] = 'no' save_data(_config.moderation.data, data) 
if not lang then
return "*>Ɛɗιтιηg* `Hαѕ Ɓєєη UηƖσcкєɗ` 🤖🔓\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "ویرایش پیام در گروه آزاد شد 🤖🔓\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
---------------Lock spam-------------------
local function lock_spam(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_spam = data[tostring(target)]["settings"]["lock_spam"] 
if lock_spam == 'yes' then
if not lang then
 return "*>Sραм* `Iѕ AƖяєαɗу Lσcкєɗ` ♻️⚠️"
elseif lang then
 return "ارسال هرزنامه در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
 data[tostring(target)]["settings"]["lock_spam"] = 'yes'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Sραм* `Hαѕ Ɓєєη Lσcкєɗ` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "ارسال هرزنامه در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end

local function unlock_spam(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_spam = data[tostring(target)]["settings"]["lock_spam"]
 if lock_spam == 'no' then
if not lang then
return "*>Sραм* `Ƥσѕтιηg Iѕ Ɲσт Lσcкєɗ` ❌🔐" 
elseif lang then
 return "ارسال هرزنامه در گروه ممنوع نمیباشد ❌🔐"
end
else 
data[tostring(target)]["settings"]["lock_spam"] = 'no' 
save_data(_config.moderation.data, data)
if not lang then 
return "*>Sραм* `Ƥσѕтιηg Hαѕ Ɓєєη UηƖσcкєɗ` 🤖🔓\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
 return "ارسال هرزنامه در گروه آزاد شد 🤖🔓\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end

---------------Lock Flood-------------------
local function lock_flood(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_flood = data[tostring(target)]["settings"]["lock_flood"] 
if lock_flood == 'yes' then
if not lang then
 return "*>ƑƖσσɗιηg* `Iѕ AƖяєαɗу Lσcкєɗ` ♻️⚠️"
elseif lang then
 return "ارسال پیام مکرر در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
 data[tostring(target)]["settings"]["lock_flood"] = 'yes'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>ƑƖσσɗιηg* `Hαѕ Ɓєєη Lσcкєɗ` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "ارسال پیام مکرر در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end

local function unlock_flood(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_flood = data[tostring(target)]["settings"]["lock_flood"]
 if lock_flood == 'no' then
if not lang then
return "*>ƑƖσσɗιηg* `Iѕ Ɲσт Lσcкєɗ` ❌🔐" 
elseif lang then
return "ارسال پیام مکرر در گروه ممنوع نمیباشد ❌🔐"
end
else 
data[tostring(target)]["settings"]["lock_flood"] = 'no' save_data(_config.moderation.data, data) 
if not lang then
return "*>ƑƖσσɗιηg* `Hαѕ Ɓєєη UηƖσcкєɗ` 🤖🔓\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "ارسال پیام مکرر در گروه آزاد شد 🤖🔓\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end

---------------Lock Bots-------------------
local function lock_bots(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_bots = data[tostring(target)]["settings"]["lock_bots"] 
if lock_bots == 'yes' then
if not lang then
 return "*>Ɓσтѕ* `Ƥяσтєcтιση Iѕ AƖяєαɗу ƐηαвƖєɗ` ♻️⚠️"
elseif lang then
 return "محافظت از گروه در برابر ربات ها هم اکنون فعال است  ♻️⚠️"
end
else
 data[tostring(target)]["settings"]["lock_bots"] = 'yes'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Ɓσтѕ* `Ƥяσтєcтιση Hαѕ Ɓєєη ƐηαвƖєɗ` 🤖✅\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "محافظت از گروه در برابر ربات ها فعال شد 🤖✅\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end

local function unlock_bots(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)


local lock_bots = data[tostring(target)]["settings"]["lock_bots"]
 if lock_bots == 'no' then
if not lang then
return "*>Ɓσтѕ* `Ƥяσтєcтιση Iѕ Ɲσт ƐηαвƖєɗ` ❌🔐" 
elseif lang then
return "محافظت از گروه در برابر ربات ها غیر فعال است  ❌🔐"
end
else 
data[tostring(target)]["settings"]["lock_bots"] = 'no' save_data(_config.moderation.data, data) 
if not lang then
return "*>Ɓσтѕ* `Ƥяσтєcтιση Hαѕ Ɓєєη ƊιѕαвƖєɗ` 🤖❌\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "محافظت از گروه در برابر ربات ها غیر فعال شد 🤖❌\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end

---------------Lock Join-------------------
local function lock_join(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_join = data[tostring(target)]["settings"]["lock_join"] 
if lock_join == 'yes' then
if not lang then
 return "*>Lσcк Jσιη* `Iѕ AƖяєαɗу Lσcкєɗ` ♻️⚠️"
elseif lang then
 return "ورود به گروه هم اکنون ممنوع است ♻️⚠️"
end
else
 data[tostring(target)]["settings"]["lock_join"] = 'yes'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Jσιη* `Hαѕ Ɓєєη Lσcкєɗ` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "ورود به گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end

local function unlock_join(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)


local lock_join = data[tostring(target)]["settings"]["lock_join"]
 if lock_join == 'no' then
if not lang then
return "*>Lσcк Jσιη* `Iѕ Ɲσт Lσcкєɗ` ❌🔐" 
elseif lang then
return "ورود به گروه ممنوع نمیباشد ❌🔐"
end
else 
data[tostring(target)]["settings"]["lock_join"] = 'no'
save_data(_config.moderation.data, data) 
if not lang then
return "*>Lσcк Jσιη* `Hαѕ Ɓєєη UηƖσcкєɗ` 🤖🔓\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "ورود به گروه آزاد شد 🤖🔓\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end

---------------Lock Markdown-------------------
local function lock_markdown(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"] 
if lock_markdown == 'yes' then
if not lang then 
 return "*>Mαякɗσωη* `Ƥσѕтιηg Iѕ AƖяєαɗу Lσcкєɗ` ♻️⚠️"
elseif lang then
 return "ارسال پیام های دارای فونت در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
 data[tostring(target)]["settings"]["lock_markdown"] = 'yes'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Mαякɗσωη* `Ƥσѕтιηg Hαѕ Ɓєєη Lσcкєɗ` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "ارسال پیام های دارای فونت در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_markdown(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_markdown_ban = data[tostring(target)]["settings"]["lock_markdown"] 
if lock_markdown_ban == 'ban' then
if not lang then
 return "*>Mαякɗσωη* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود پیام های دارای فونت در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_markdown"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Mαякɗσωη* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود پیام های دارای فونت در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_markdown(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_markdown_kick = data[tostring(target)]["settings"]["lock_markdown"] 
if lock_markdown_kick == 'kick' then
if not lang then
 return "*>Mαякɗσωη* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج پیام های دارای فونت در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_markdown"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Mαякɗσωη* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج پیام های دارای فونت در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_markdown(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_markdown_warn = data[tostring(target)]["settings"]["lock_markdown"] 
if lock_markdown_warn == 'warn' then
if not lang then
 return "*>Mαякɗσωη* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار پیام های دارای فونت در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_markdown"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Mαякɗσωη* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار پیام های دارای فونت در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unlock_markdown(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)


local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"]
 if lock_markdown == 'no' then
if not lang then
return "*>Mαякɗσωη* `Ƥσѕтιηg Iѕ Ɲσт Lσcкєɗ` ❌🔐"
elseif lang then
return "ارسال پیام های دارای فونت در گروه ممنوع نمیباشد ❌🔐"
end
else 
data[tostring(target)]["settings"]["lock_markdown"] = 'no' save_data(_config.moderation.data, data) 
if not lang then
return "*>Mαякɗσωη* `Ƥσѕтιηg Hαѕ Ɓєєη UηƖσcкєɗ` 🤖🔓\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
return "ارسال پیام های دارای فونت در گروه آزاد شد 🤖🔓\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end

---------------Lock Webpage-------------------
local function lock_webpage(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"] 
if lock_webpage == 'yes' then
if not lang then
 return "*>Ɯєвραgє* `Iѕ AƖяєαɗу Lσcкєɗ` ♻️⚠️"
elseif lang then
 return "ارسال صفحات وب در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
 data[tostring(target)]["settings"]["lock_webpage"] = 'yes'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Ɯєвραgє* `Hαѕ Ɓєєη Lσcкєɗ` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "ارسال صفحات وب در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_webpage(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_webpage_ban = data[tostring(target)]["settings"]["lock_webpage"] 
if lock_webpage_ban == 'ban' then
if not lang then
 return "*>Ɯєвραgє* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود صفحات وب در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_webpage"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Ɯєвραgє* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود صفحات وب در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_webpage(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_webpage_kick = data[tostring(target)]["settings"]["lock_webpage"] 
if lock_webpage_kick == 'kick' then
if not lang then
 return "*>Ɯєвραgє* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج صفحات وب در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_webpage"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Ɯєвραgє* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج صفحات وب در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_webpage(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_webpage_warn = data[tostring(target)]["settings"]["lock_webpage"] 
if lock_webpage_warn == 'warn' then
if not lang then
 return "*>Ɯєвραgє* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار صفحات وب در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["settings"]["lock_webpage"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Ɯєвραgє* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار صفحات وب در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unlock_webpage(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)


local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"]
 if lock_webpage == 'no' then
if not lang then
return "*>Ɯєвραgє* `Iѕ Ɲσт Lσcкєɗ` ❌🔐" 
elseif lang then
return "ارسال صفحات وب در گروه ممنوع نمیباشد ❌🔐"
end
else 
data[tostring(target)]["settings"]["lock_webpage"] = 'no'
save_data(_config.moderation.data, data) 
if not lang then
return "*>Ɯєвραgє* `Hαѕ Ɓєєη UηƖσcкєɗ` 🤖🔓\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "ارسال صفحات وب در گروه آزاد شد 🤖🔓\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
---------------Lock Pin-------------------
local function lock_pin(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local lock_pin = data[tostring(target)]["settings"]["lock_pin"] 
if lock_pin == 'yes' then
if not lang then
 return "*>Ƥιηηєɗ Mєѕѕαgє* `Iѕ AƖяєαɗу Lσcкєɗ` ♻️⚠️"
elseif lang then
 return "سنجاق کردن پیام در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
 data[tostring(target)]["settings"]["lock_pin"] = 'yes'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Ƥιηηєɗ Mєѕѕαgє* `Hαѕ Ɓєєη Lσcкєɗ` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "سنجاق کردن پیام در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end

local function unlock_pin(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)


local lock_pin = data[tostring(target)]["settings"]["lock_pin"]
 if lock_pin == 'no' then
if not lang then
return "*>Ƥιηηєɗ Mєѕѕαgє* `Iѕ Ɲσт Lσcкєɗ` ❌🔐" 
elseif lang then
return "سنجاق کردن پیام در گروه ممنوع نمیباشد ❌🔐"
end
else 
data[tostring(target)]["settings"]["lock_pin"] = 'no'
save_data(_config.moderation.data, data) 
if not lang then
return "*>Ƥιηηєɗ Mєѕѕαgє* `Hαѕ Ɓєєη UηƖσcкєɗ` 🤖🔓\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "سنجاق کردن پیام در گروه آزاد شد 🤖🔓\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
--------Mutes---------
---------------Mute Gif-------------------
local function mute_gif(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_gif = data[tostring(target)]["mutes"]["mute_gif"] 
if mute_gif == 'yes' then
if not lang then
 return "*>Lσcк Ɠιf* `Iѕ AƖяєαɗу ƐηαвƖєɗ` ♻️⚠️"
elseif lang then
 return "بیصدا کردن تصاویر متحرک فعال است  ♻️⚠️"
end
else
 data[tostring(target)]["mutes"]["mute_gif"] = 'yes' 
save_data(_config.moderation.data, data) 
if not lang then 
 return "*>Lσcк Ɠιf* `Hαѕ Ɓєєη ƐηαвƖєɗ` 🤖🔇\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "بیصدا کردن تصاویر متحرک فعال شد 🤖🔇\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_gif(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_gif_ban = data[tostring(target)]["mutes"]["mute_gif"] 
if mute_gif_ban == 'ban' then
if not lang then
 return "*>Lσcк Ɠιf* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود تصاویر متحرک در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_gif"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ɠιf* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود تصاویر متحرک در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_gif(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_gif_kick = data[tostring(target)]["mutes"]["mute_gif"] 
if mute_gif_kick == 'kick' then
if not lang then
 return "*>Lσcк Ɠιf* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج تصاویر متحرک در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_gif"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ɠιf* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج تصاویر متحرک در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_gif(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_gif_warn = data[tostring(target)]["mutes"]["mute_gif"] 
if mute_gif_warn == 'warn' then
if not lang then
 return "*>Lσcк Ɠιf* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار تصاویر متحرک در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_+"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ɠιf* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار تصاویر متحرک در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unmute_gif(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_gif = data[tostring(target)]["mutes"]["mute_gif"]
 if mute_gif == 'no' then
if not lang then
return "*>Lσcк Ɠιf* `Iѕ AƖяєαɗу ƊιѕαвƖєɗ` ❌🔐" 
elseif lang then
return "بیصدا کردن تصاویر متحرک غیر فعال بود ❌🔐"
end
else 
data[tostring(target)]["mutes"]["mute_gif"] = 'no'
 save_data(_config.moderation.data, data) 
if not lang then
return "*>Lσcк Ɠιf* `Hαѕ Ɓєєη ƊιѕαвƖєɗ` 🤖🔊\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "بیصدا کردن تصاویر متحرک غیر فعال شد 🤖🔊\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
---------------Mute Game-------------------
local function mute_game(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_game = data[tostring(target)]["mutes"]["mute_game"] 
if mute_game == 'yes' then
if not lang then
 return "*>Lσcк Ɠαмє* `Iѕ AƖяєαɗу ƐηαвƖєɗ` ♻️⚠️"
elseif lang then
 return "بیصدا کردن بازی های تحت وب فعال است  ♻️⚠️"
end
else
 data[tostring(target)]["mutes"]["mute_game"] = 'yes' 
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ɠαмє* `Hαѕ Ɓєєη ƐηαвƖєɗ` 🤖🔇\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "بیصدا کردن بازی های تحت وب فعال شد 🤖🔇\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_game(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_game_ban = data[tostring(target)]["mutes"]["mute_game"] 
if mute_game_ban == 'ban' then
if not lang then
 return "*>Lσcк Ɠαмє* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود بازی های تحت وب در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_game"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ɠαмє* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود بازی های تحت وب در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_game(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_game_kick = data[tostring(target)]["mutes"]["mute_game"] 
if mute_game_kick == 'kick' then
if not lang then
 return "*>Lσcк Ɠαмє* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج بازی های تحت وب در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_game"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ɠαмє* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج بازی های تحت وب در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_game(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_game_warn = data[tostring(target)]["mutes"]["mute_game"] 
if mute_game_warn == 'warn' then
if not lang then
 return "*>Lσcк Ɠαмє* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار بازی های تحت وب در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_game"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ɠαмє* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار بازی های تحت وب در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unmute_game(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_game = data[tostring(target)]["mutes"]["mute_game"]
 if mute_game == 'no' then
if not lang then
return "*>Lσcк Ɠαмє* `Iѕ AƖяєαɗу ƊιѕαвƖєɗ` ❌🔐" 
elseif lang then
return "بیصدا کردن بازی های تحت وب غیر فعال است  ♻️⚠️"
end
else 
data[tostring(target)]["mutes"]["mute_game"] = 'no'
 save_data(_config.moderation.data, data)
if not lang then 
return "*>Lσcк Ɠαмє* `Hαѕ Ɓєєη ƊιѕαвƖєɗ` 🤖🔊\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "بیصدا کردن بازی های تحت وب غیر فعال شد 🤖🔊\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
---------------Mute Inline-------------------
local function mute_inline(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_inline = data[tostring(target)]["mutes"]["mute_inline"] 
if mute_inline == 'yes' then
if not lang then
 return "*>Lσcк IηƖιηє* `Iѕ AƖяєαɗу ƐηαвƖєɗ` ♻️⚠️"
elseif lang then
 return "بیصدا کردن کیبورد شیشه ای فعال است  ♻️⚠️"
end
else
 data[tostring(target)]["mutes"]["mute_inline"] = 'yes' 
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк IηƖιηє* `Hαѕ Ɓєєη ƐηαвƖєɗ` 🤖🔇\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "بیصدا کردن کیبورد شیشه ای فعال شد 🤖🔇\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_inline(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_inline_ban = data[tostring(target)]["mutes"]["mute_inline"] 
if mute_inline_ban == 'ban' then
if not lang then
 return "*>Lσcк IηƖιηє* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود کیبورد شیشه ای در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_inline"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк IηƖιηє* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود کیبورد شیشه ای در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_inline(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_inline_kick = data[tostring(target)]["mutes"]["mute_inline"] 
if mute_inline_kick == 'kick' then
if not lang then
 return "*>Lσcк IηƖιηє* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج کیبورد شیشه ای در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_inline"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк IηƖιηє* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج کیبورد شیشه ای در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_inline(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_inline_warn = data[tostring(target)]["mutes"]["mute_inline"] 
if mute_inline_warn == 'warn' then
if not lang then
 return "*>Lσcк IηƖιηє* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار کیبورد شیشه ای در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_inline"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк IηƖιηє* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار کیبورد شیشه ای در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unmute_inline(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_inline = data[tostring(target)]["mutes"]["mute_inline"]
 if mute_inline == 'no' then
if not lang then
return "*>Lσcк IηƖιηє* `Iѕ AƖяєαɗу ƊιѕαвƖєɗ` ❌🔐" 
elseif lang then
return "بیصدا کردن کیبورد شیشه ای غیر فعال است  ♻️⚠️"
end
else 
data[tostring(target)]["mutes"]["mute_inline"] = 'no'
 save_data(_config.moderation.data, data) 
if not lang then
return "*>Lσcк IηƖιηє* `Hαѕ Ɓєєη ƊιѕαвƖєɗ` 🤖🔊\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "بیصدا کردن کیبورد شیشه ای غیر فعال شد 🤖🔊\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
---------------Mute Text-------------------
local function mute_text(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_text = data[tostring(target)]["mutes"]["mute_text"] 
if mute_text == 'yes' then
if not lang then
 return "*>Lσcк Ƭєxт* `Iѕ AƖяєαɗу ƐηαвƖєɗ` ♻️⚠️"
elseif lang then
 return "بیصدا کردن متن فعال است  ♻️⚠️"
end
else
 data[tostring(target)]["mutes"]["mute_text"] = 'yes' 
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƭєxт* `Hαѕ Ɓєєη ƐηαвƖєɗ` 🤖🔇\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "بیصدا کردن متن فعال شد 🤖🔇\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_text(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_text_ban = data[tostring(target)]["mutes"]["mute_text"] 
if mute_text_ban == 'ban' then
if not lang then
 return "*>Lσcк Ƭєxт* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود متن در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_text"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƭєxт* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود متن در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_text(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_text_kick = data[tostring(target)]["mutes"]["mute_text"] 
if mute_text_kick == 'kick' then
if not lang then
 return "*>Lσcк Ƭєxт* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج متن در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_text"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƭєxт* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج متن در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_text(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_text_warn = data[tostring(target)]["mutes"]["mute_text"] 
if mute_text_warn == 'warn' then
if not lang then
 return "*>Lσcк Ƭєxт* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار متن در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_text"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƭєxт* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار متن در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unmute_text(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_text = data[tostring(target)]["mutes"]["mute_text"]
 if mute_text == 'no' then
if not lang then
return "*>Lσcк Ƭєxт* `Iѕ AƖяєαɗу ƊιѕαвƖєɗ` ❌🔐"
elseif lang then
return "بیصدا کردن متن غیر فعال است  ♻️⚠️" 
end
else 
data[tostring(target)]["mutes"]["mute_text"] = 'no'
 save_data(_config.moderation.data, data) 
if not lang then
return "*>Lσcк Ƭєxт* `Hαѕ Ɓєєη ƊιѕαвƖєɗ` 🤖🔊\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "بیصدا کردن متن غیر فعال شد 🤖🔊\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
---------------Mute photo-------------------
local function mute_photo(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_photo = data[tostring(target)]["mutes"]["mute_photo"] 
if mute_photo == 'yes' then
if not lang then
 return "*>Lσcк Ƥнσтσ* `Iѕ AƖяєαɗу ƐηαвƖєɗ` ♻️⚠️"
elseif lang then
 return "بیصدا کردن عکس فعال است  ♻️⚠️"
end
else
 data[tostring(target)]["mutes"]["mute_photo"] = 'yes' 
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƥнσтσ* `Hαѕ Ɓєєη ƐηαвƖєɗ` 🤖🔇\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "بیصدا کردن عکس فعال شد 🤖🔇\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_photo(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_photo_ban = data[tostring(target)]["mutes"]["mute_photo"] 
if mute_photo_ban == 'ban' then
if not lang then
 return "*>Lσcк Ƥнσтσ* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود عکس در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_photo"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƥнσтσ* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود عکس در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_photo(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_photo_kick = data[tostring(target)]["mutes"]["mute_photo"] 
if mute_photo_kick == 'kick' then
if not lang then
 return "*>Lσcк Ƥнσтσ* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج عکس در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_photo"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƥнσтσ* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج عکس در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_photo(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_photo_warn = data[tostring(target)]["mutes"]["mute_photo"] 
if mute_photo_warn == 'warn' then
if not lang then
 return "*>Lσcк Ƥнσтσ* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار عکس در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_photo"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƥнσтσ* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار عکس در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unmute_photo(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_photo = data[tostring(target)]["mutes"]["mute_photo"]
 if mute_photo == 'no' then
if not lang then
return "*>Lσcк Ƥнσтσ* `Iѕ AƖяєαɗу ƊιѕαвƖєɗ` ❌🔐" 
elseif lang then
return "بیصدا کردن عکس غیر فعال است  ♻️⚠️"
end
else 
data[tostring(target)]["mutes"]["mute_photo"] = 'no'
 save_data(_config.moderation.data, data) 
if not lang then
return "*>Lσcк Ƥнσтσ* `Hαѕ Ɓєєη ƊιѕαвƖєɗ` 🤖🔊\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "بیصدا کردن عکس غیر فعال شد 🤖🔊\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
---------------Mute Video-------------------
local function mute_video(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_video = data[tostring(target)]["mutes"]["mute_video"] 
if mute_video == 'yes' then
if not lang then
 return "*>Lσcк Ʋιɗєσ* `Iѕ AƖяєαɗу ƐηαвƖєɗ` ♻️⚠️"
elseif lang then
 return "بیصدا کردن فیلم فعال است  ♻️⚠️"
end
else
 data[tostring(target)]["mutes"]["mute_video"] = 'yes' 
save_data(_config.moderation.data, data)
if not lang then 
 return "*>Lσcк Ʋιɗєσ* `Hαѕ Ɓєєη ƐηαвƖєɗ` 🤖🔇\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "بیصدا کردن فیلم فعال شد 🤖🔇\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_video(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_video_ban = data[tostring(target)]["mutes"]["mute_video"] 
if mute_video_ban == 'ban' then
if not lang then
 return "*>Lσcк Ʋιɗєσ* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود فیلم در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_video"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ʋιɗєσ* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود فیلم در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_video(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_video_kick = data[tostring(target)]["mutes"]["mute_video"] 
if mute_video_kick == 'kick' then
if not lang then
 return "*>Lσcк Ʋιɗєσ* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج فیلم در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_video"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ʋιɗєσ* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج فیلم در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_video(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_video_warn = data[tostring(target)]["mutes"]["mute_video"] 
if mute_video_warn == 'warn' then
if not lang then
 return "*>Lσcк Ʋιɗєσ* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار فیلم در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_video"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ʋιɗєσ* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار فیلم در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unmute_video(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_video = data[tostring(target)]["mutes"]["mute_video"]
 if mute_video == 'no' then
if not lang then
return "*>Lσcк Ʋιɗєσ* `Iѕ AƖяєαɗу ƊιѕαвƖєɗ` ❌🔐" 
elseif lang then
return "بیصدا کردن فیلم غیر فعال است  ♻️⚠️"
end
else 
data[tostring(target)]["mutes"]["mute_video"] = 'no'
 save_data(_config.moderation.data, data) 
if not lang then
return "*>Lσcк Ʋιɗєσ* `Hαѕ Ɓєєη ƊιѕαвƖєɗ` 🤖🔊\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "بیصدا کردن فیلم غیر فعال شد 🤖🔊\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
---------------Mute Audio-------------------
local function mute_audio(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_audio = data[tostring(target)]["mutes"]["mute_audio"] 
if mute_audio == 'yes' then
if not lang then
 return "*>Lσcк Aυɗισ* `Iѕ AƖяєαɗу ƐηαвƖєɗ` ♻️⚠️"
elseif lang then
 return "بیصدا کردن آهنگ فعال است  ♻️⚠️"
end
else
 data[tostring(target)]["mutes"]["mute_audio"] = 'yes' 
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Aυɗισ* `Hαѕ Ɓєєη ƐηαвƖєɗ` 🤖🔇\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else 
return "بیصدا کردن آهنگ فعال شد 🤖🔇\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_audio(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_audio_ban = data[tostring(target)]["mutes"]["mute_audio"] 
if mute_audio_ban == 'ban' then
if not lang then
 return "*>Lσcк Aυɗισ* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود آهنگ در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_audio"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Aυɗισ* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود آهنگ در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_audio(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_audio_kick = data[tostring(target)]["mutes"]["mute_audio"] 
if mute_audio_kick == 'kick' then
if not lang then
 return "*>Lσcк Aυɗισ* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج + در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_audio"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Aυɗισ* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج آهنگ در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_audio(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_audio_warn = data[tostring(target)]["mutes"]["mute_audio"] 
if mute_audio_warn == 'warn' then
if not lang then
 return "*>Lσcк Aυɗισ* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار آهنگ در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_audio"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Aυɗισ* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار آهنگ در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unmute_audio(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_audio = data[tostring(target)]["mutes"]["mute_audio"]
 if mute_audio == 'no' then
if not lang then
return "*>Lσcк Aυɗισ* `Iѕ AƖяєαɗу ƊιѕαвƖєɗ` ❌🔐" 
elseif lang then
return "بیصدا کردن آهنک غیر فعال است  ♻️⚠️"
end
else 
data[tostring(target)]["mutes"]["mute_audio"] = 'no'
 save_data(_config.moderation.data, data)
if not lang then 
return "*>Lσcк Aυɗισ* `Hαѕ Ɓєєη ƊιѕαвƖєɗ` 🤖🔊\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
return "بیصدا کردن آهنگ غیر فعال شد 🤖🔊\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
end
end
end
---------------Mute Voice-------------------
local function mute_voice(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_voice = data[tostring(target)]["mutes"]["mute_voice"] 
if mute_voice == 'yes' then
if not lang then
 return "*>Lσcк Ʋσιcє* `Iѕ AƖяєαɗу ƐηαвƖєɗ` ♻️⚠️"
elseif lang then
 return "بیصدا کردن صدا فعال است  ♻️⚠️"
end
else
 data[tostring(target)]["mutes"]["mute_voice"] = 'yes' 
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ʋσιcє* `Hαѕ Ɓєєη ƐηαвƖєɗ` 🤖🔇\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "بیصدا کردن صدا فعال شد 🤖🔇\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_voice(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_voice_ban = data[tostring(target)]["mutes"]["mute_voice"] 
if mute_voice_ban == 'ban' then
if not lang then
 return "*>Lσcк Ʋσιcє* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود صدا در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_voice"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ʋσιcє* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود صدا در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_voice(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_voice_kick = data[tostring(target)]["mutes"]["mute_voice"] 
if mute_voice_kick == 'kick' then
if not lang then
 return "*>+* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج صدا در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_voice"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ʋσιcє* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج صدا در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_voice(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_voice_warn = data[tostring(target)]["mutes"]["mute_voice"] 
if mute_voice_warn == 'warn' then
if not lang then
 return "*>Lσcк Ʋσιcє* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار صدا در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_voice"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ʋσιcє* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار صدا در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unmute_voice(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_voice = data[tostring(target)]["mutes"]["mute_voice"]
 if mute_voice == 'no' then
if not lang then
return "*>Lσcк Ʋσιcє* `Iѕ AƖяєαɗу ƊιѕαвƖєɗ` ❌🔐" 
elseif lang then
return "بیصدا کردن صدا غیر فعال است  ♻️⚠️"
end
else 
data[tostring(target)]["mutes"]["mute_voice"] = 'no'
 save_data(_config.moderation.data, data)
if not lang then 
return "*>Lσcк Ʋσιcє* `Hαѕ Ɓєєη ƊιѕαвƖєɗ` 🤖🔊\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "بیصدا کردن صدا غیر فعال شد 🤖🔊\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
---------------Mute Sticker-------------------
local function mute_sticker(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_sticker = data[tostring(target)]["mutes"]["mute_sticker"] 
if mute_sticker == 'yes' then
if not lang then
 return "*>Lσcк Sтιcкєя* `Iѕ AƖяєαɗу ƐηαвƖєɗ` ♻️⚠️"
elseif lang then
 return "بیصدا کردن برچسب فعال است  ♻️⚠️"
end
else
 data[tostring(target)]["mutes"]["mute_sticker"] = 'yes' 
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Sтιcкєя* `Hαѕ Ɓєєη ƐηαвƖєɗ` 🤖🔇\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "بیصدا کردن برچسب فعال شد 🤖🔇\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_sticker(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_sticker_ban = data[tostring(target)]["mutes"]["mute_sticker"] 
if mute_sticker_ban == 'ban' then
if not lang then
 return "*>Lσcк Sticker* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود برچسب در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_sticker"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Sticker* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود برچسب در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_sticker(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_sticker_kick = data[tostring(target)]["mutes"]["mute_sticker"] 
if mute_sticker_kick == 'kick' then
if not lang then
 return "*>Lσcк Sticker* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج برچسب در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_sticker"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Sticker* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج برچسب در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_sticker(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_sticker_warn = data[tostring(target)]["mutes"]["mute_sticker"] 
if mute_sticker_warn == 'warn' then
if not lang then
 return "*>Lσcк Sticker* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار برچسب در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_sticker"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Sticker* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار برچسب در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unmute_sticker(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_sticker = data[tostring(target)]["mutes"]["mute_sticker"]
 if mute_sticker == 'no' then
if not lang then
return "*>Lσcк Sтιcкєя* `Iѕ AƖяєαɗу ƊιѕαвƖєɗ` ❌🔐" 
elseif lang then
return "بیصدا کردن برچسب غیر فعال است  ♻️⚠️"
end
else 
data[tostring(target)]["mutes"]["mute_sticker"] = 'no'
 save_data(_config.moderation.data, data)
if not lang then 
return "*>Lσcк Sticker* `Hαѕ Ɓєєη ƊιѕαвƖєɗ` 🤖🔊\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
return "بیصدا کردن برچسب غیر فعال شد 🤖🔊\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end 
end
end
---------------Mute Contact-------------------
local function mute_contact(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_contact = data[tostring(target)]["mutes"]["mute_contact"] 
if mute_contact == 'yes' then
if not lang then
 return "*>Lσcк Ƈσηтαcт* `Iѕ AƖяєαɗу ƐηαвƖєɗ` ♻️⚠️"
elseif lang then
 return "بیصدا کردن مخاطب فعال است  ♻️⚠️"
end
else
 data[tostring(target)]["mutes"]["mute_contact"] = 'yes' 
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƈσηтαcт* `Hαѕ Ɓєєη ƐηαвƖєɗ` 🤖🔇\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "بیصدا کردن مخاطب فعال شد 🤖🔇\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_contact(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_contact_ban = data[tostring(target)]["mutes"]["mute_contact"] 
if mute_contact_ban == 'ban' then
if not lang then
 return "*>Lσcк Ƈσηтαcт* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود مخاطب در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_contact"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƈσηтαcт* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود مخاطب در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_contact(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_contact_kick = data[tostring(target)]["mutes"]["mute_contact"] 
if mute_contact_kick == 'kick' then
if not lang then
 return "*>Lσcк Ƈσηтαcт* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج مخاطب در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_contact"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƈσηтαcт* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج مخاطب در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_contact(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_contact_warn = data[tostring(target)]["mutes"]["mute_contact"] 
if mute_contact_warn == 'warn' then
if not lang then
 return "*>Lσcк Ƈσηтαcт* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار مخاطب در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_contact"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƈσηтαcт* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار مخاطب در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unmute_contact(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_contact = data[tostring(target)]["mutes"]["mute_contact"]
 if mute_contact == 'no' then
if not lang then
return "*>Lσcк Ƈσηтαcт* `Iѕ AƖяєαɗу ƊιѕαвƖєɗ` ❌🔐" 
elseif lang then
return "بیصدا کردن مخاطب غیر فعال است  ♻️⚠️"
end
else 
data[tostring(target)]["mutes"]["mute_contact"] = 'no'
 save_data(_config.moderation.data, data) 
if not lang then
return "*>Lσcк Ƈσηтαcт* `Hαѕ Ɓєєη ƊιѕαвƖєɗ` 🤖🔊\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "بیصدا کردن مخاطب غیر فعال شد 🤖🔊\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
---------------Mute Forward-------------------
local function mute_forward(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_forward = data[tostring(target)]["mutes"]["mute_forward"] 
if mute_forward == 'yes' then
if not lang then
 return "*>Lσcк Ƒσяωαяɗ* `Iѕ AƖяєαɗу ƐηαвƖєɗ` ♻️⚠️"
elseif lang then
 return "بیصدا کردن نقل قول فعال است  ♻️⚠️"
end
else
 data[tostring(target)]["mutes"]["mute_forward"] = 'yes' 
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƒσяωαяɗ* `Hαѕ Ɓєєη ƐηαвƖєɗ` 🤖🔇\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "بیصدا کردن نقل قول فعال شد 🤖🔇\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_forward(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_forward_ban = data[tostring(target)]["mutes"]["mute_forward"] 
if mute_forward_ban == 'ban' then
if not lang then
 return "*>Lσcк Ƒσяωαяɗ* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود نقل قول در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_forward"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƒσяωαяɗ* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود نقل قول در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_forward(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_forward_kick = data[tostring(target)]["mutes"]["mute_forward"] 
if mute_forward_kick == 'kick' then
if not lang then
 return "*>Lσcк Ƒσяωαяɗ* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج نقل قول در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_forward"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƒσяωαяɗ* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج نقل قول در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_forward(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_forward_warn = data[tostring(target)]["mutes"]["mute_forward"] 
if mute_forward_warn == 'warn' then
if not lang then
 return "*>Lσcк Ƒσяωαяɗ* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار نقل قول در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_forward"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƒσяωαяɗ* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار نقل قول در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unmute_forward(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_forward = data[tostring(target)]["mutes"]["mute_forward"]
 if mute_forward == 'no' then
if not lang then
return "*>Lσcк Ƒσяωαяɗ* `Iѕ AƖяєαɗу ƊιѕαвƖєɗ` ❌🔐"
elseif lang then
return "بیصدا کردن نقل قول غیر فعال است  ♻️⚠️"
end 
else 
data[tostring(target)]["mutes"]["mute_forward"] = 'no'
 save_data(_config.moderation.data, data)
if not lang then 
return "*>Lσcк Ƒσяωαяɗ* `Hαѕ Ɓєєη ƊιѕαвƖєɗ` 🤖🔊\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "بیصدا کردن نقل قول غیر فعال شد 🤖🔊\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
---------------Mute Location-------------------
local function mute_location(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_location = data[tostring(target)]["mutes"]["mute_location"] 
if mute_location == 'yes' then
if not lang then
 return "*>Lσcк Lσcαтιση* `Iѕ AƖяєαɗу ƐηαвƖєɗ` ♻️⚠️"
elseif lang then
 return "بیصدا کردن موقعیت فعال است  ♻️⚠️"
end
else
 data[tostring(target)]["mutes"]["mute_location"] = 'yes' 
save_data(_config.moderation.data, data)
if not lang then
 return "*>Lσcк Lσcαтιση* `Hαѕ Ɓєєη ƐηαвƖєɗ` 🤖🔇\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "بیصدا کردن موقعیت فعال شد 🤖🔇\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_location(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_location_ban = data[tostring(target)]["mutes"]["mute_location"] 
if mute_location_ban == 'ban' then
if not lang then
 return "*>Lσcк Lσcαтιση* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود موقعیت در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_location"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Lσcαтιση* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود موقعیت در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_location(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_location_kick = data[tostring(target)]["mutes"]["mute_location"] 
if mute_location_kick == 'kick' then
if not lang then
 return "*>Lσcк Lσcαтιση* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج موقعیت در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_location"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Lσcαтιση* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج موقعیت در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_location(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_location_warn = data[tostring(target)]["mutes"]["mute_location"] 
if mute_location_warn == 'warn' then
if not lang then
 return "*>Lσcк Lσcαтιση* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار موقعیت در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_location"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Lσcαтιση* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار موقعیت در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unmute_location(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_location = data[tostring(target)]["mutes"]["mute_location"]
 if mute_location == 'no' then
if not lang then
return "*>Lσcк Lσcαтιση* `Iѕ AƖяєαɗу ƊιѕαвƖєɗ` ❌🔐" 
elseif lang then
return "بیصدا کردن موقعیت غیر فعال است  ♻️⚠️"
end
else 
data[tostring(target)]["mutes"]["mute_location"] = 'no'
 save_data(_config.moderation.data, data) 
if not lang then
return "*>Lσcк Lσcαтιση* `Hαѕ Ɓєєη ƊιѕαвƖєɗ` 🤖🔊\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "بیصدا کردن موقعیت غیر فعال شد 🤖🔊\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
---------------Mute Document-------------------
local function mute_document(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_document = data[tostring(target)]["mutes"]["mute_document"] 
if mute_document == 'yes' then
if not lang then
 return "*>Lσcк Dᴏᴄᴜᴍᴇɴᴛ* `Iѕ AƖяєαɗу ƐηαвƖєɗ` ♻️⚠️"
elseif lang then
 return "بیصدا کردن اسناد فعال لست"
end
else
 data[tostring(target)]["mutes"]["mute_document"] = 'yes' 
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Dᴏᴄᴜᴍᴇɴᴛ* `Hαѕ Ɓєєη ƐηαвƖєɗ` 🤖🔇\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "بیصدا کردن اسناد فعال شد 🤖🔇\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_document(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_document_ban = data[tostring(target)]["mutes"]["mute_document"] 
if mute_document_ban == 'ban' then
if not lang then
 return "*>Lσcк Dᴏᴄᴜᴍᴇɴᴛ* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود اسناد در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_document"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Dᴏᴄᴜᴍᴇɴᴛ* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود اسناد در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_document(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_document_kick = data[tostring(target)]["mutes"]["mute_document"] 
if mute_document_kick == 'kick' then
if not lang then
 return "*>Lσcк Dᴏᴄᴜᴍᴇɴᴛ* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج اسناد در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_document"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Dᴏᴄᴜᴍᴇɴᴛ* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج اسناد در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_document(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_document_warn = data[tostring(target)]["mutes"]["mute_document"] 
if mute_document_warn == 'warn' then
if not lang then
 return "*>Lσcк Dᴏᴄᴜᴍᴇɴᴛ* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار اسناد در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_document"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Dᴏᴄᴜᴍᴇɴᴛ* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار اسناد در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unmute_document(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_document = data[tostring(target)]["mutes"]["mute_document"]
 if mute_document == 'no' then
if not lang then
return "*>Lσcк Dᴏᴄᴜᴍᴇɴᴛ* `Iѕ AƖяєαɗу ƊιѕαвƖєɗ` ❌🔐" 
elseif lang then
return "بیصدا کردن اسناد غیر فعال است  ♻️⚠️"
end
else 
data[tostring(target)]["mutes"]["mute_document"] = 'no'
 save_data(_config.moderation.data, data) 
if not lang then
return "*>Lσcк Dᴏᴄᴜᴍᴇɴᴛ* `Hαѕ Ɓєєη ƊιѕαвƖєɗ` 🤖🔊\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]" 
else
return "بیصدا کردن اسناد غیر فعال شد 🤖🔊\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
---------------Mute TgService-------------------
local function mute_tgservice(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_tgservice = data[tostring(target)]["mutes"]["mute_tgservice"] 
if mute_tgservice == 'yes' then
if not lang then
 return "*>Lσcк ƬgSєяνιcє* `Iѕ AƖяєαɗу ƐηαвƖєɗ` ♻️⚠️"
elseif lang then
 return "بیصدا کردن خدمات تلگرام فعال است  ♻️⚠️"
end
else
 data[tostring(target)]["mutes"]["mute_tgservice"] = 'yes' 
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк ƬgSєяνιcє* `Hαѕ Ɓєєη ƐηαвƖєɗ` 🤖🔇\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
return "بیصدا کردن خدمات تلگرام فعال شد 🤖🔇\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end

local function unmute_tgservice(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "شما مدیر گروه نیستید"
end 
end

local mute_tgservice = data[tostring(target)]["mutes"]["mute_tgservice"]
 if mute_tgservice == 'no' then
if not lang then
return "*>Lσcк ƬgSєяνιcє* `Iѕ AƖяєαɗу ƊιѕαвƖєɗ` ❌🔐"
elseif lang then
return "بیصدا کردن خدمات تلگرام غیر فعال است  ♻️⚠️"
end 
else 
data[tostring(target)]["mutes"]["mute_tgservice"] = 'no'
 save_data(_config.moderation.data, data) 
if not lang then
return "*>Lσcк ƬgSєяνιcє* `Hαѕ Ɓєєη ƊιѕαвƖєɗ` 🤖🔊\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
return "بیصدا کردن خدمات تلگرام غیر فعال شد 🤖🔊\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end 
end
end

---------------Mute Keyboard-------------------
local function mute_keyboard(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_keyboard = data[tostring(target)]["mutes"]["mute_keyboard"] 
if mute_keyboard == 'yes' then
if not lang then
 return "*>Lσcк Ƙєувσαяɗ* `Iѕ AƖяєαɗу ƐηαвƖєɗ` ♻️⚠️"
elseif lang then
 return "بیصدا کردن صفحه کلید فعال است  ♻️⚠️"
end
else
 data[tostring(target)]["mutes"]["mute_keyboard"] = 'yes' 
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƙєувσαяɗ* `Hαѕ Ɓєєη ƐηαвƖєɗ` 🤖🔇\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
return "بیصدا کردن صفحه کلید فعال شد 🤖🔇\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------ban--------------------
local function ban_keyboard(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_keyboard_ban = data[tostring(target)]["mutes"]["mute_keyboard"] 
if mute_keyboard_ban == 'ban' then
if not lang then
 return "*>Lσcк Ƙєувσαяɗ* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɓαηιηg` ♻️⚠️"
elseif lang then
 return "مسدود صفحه کلید در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_keyboard"] = 'ban'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƙєувσαяɗ* `Ƥσѕтιηg Hαѕ Ɓєєη Ɓαηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "مسدود صفحه کلید در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------kick--------------------
local function kick_keyboard(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_keyboard_kick = data[tostring(target)]["mutes"]["mute_keyboard"] 
if mute_keyboard_kick == 'kick' then
if not lang then
 return "*>Lσcк Ƙєувσαяɗ* `Ƥσѕтιηg Iѕ AƖяєαɗу кιcкιηg` ♻️⚠️"
elseif lang then
 return "اخراج صفحه کلید در گروه هم اکنون ممنوع است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_keyboard"] = 'kick'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƙєувσαяɗ* `Ƥσѕтιηg Hαѕ Ɓєєη кιcкιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخراج صفحه کلید در گروه ممنوع شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------warn--------------------
local function warn_keyboard(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_keyboard_warn = data[tostring(target)]["mutes"]["mute_keyboard"] 
if mute_keyboard_warn == 'warn' then
if not lang then
 return "*>Lσcк Ƙєувσαяɗ* `Ƥσѕтιηg Iѕ AƖяєαɗу Ɯαяηιηg` ♻️⚠️"
elseif lang then
 return "اخطار صفحه کلید در گروه هم اکنون فعال است ♻️⚠️"
end
else
data[tostring(target)]["mutes"]["mute_keyboard"] = 'warn'
save_data(_config.moderation.data, data) 
if not lang then
 return "*>Lσcк Ƙєувσαяɗ* `Ƥσѕтιηg Hαѕ Ɓєєη Ɯαяηιηg` 🤖🔒\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
 return "اخطار صفحه کلید در گروه فعال شد 🤖🔒\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end
end
end
----------------------------------------
local function unmute_keyboard(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local mute_keyboard = data[tostring(target)]["mutes"]["mute_keyboard"]
 if mute_keyboard == 'no' then
if not lang then
return "*>Lσcк Ƙєувσαяɗ* `Iѕ AƖяєαɗу ƊιѕαвƖєɗ` ❌🔐"
elseif lang then
return "بیصدا کردن صفحه کلید غیرفعال است  ♻️⚠️"
end 
else 
data[tostring(target)]["mutes"]["mute_keyboard"] = 'no'
 save_data(_config.moderation.data, data) 
if not lang then
return "*>Lσcк Ƙєувσαяɗ* `Hαѕ Ɓєєη ƊιѕαвƖєɗ` 🤖🔊\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
else
return "بیصدا کردن صفحه کلید غیرفعال شد 🤖🔊\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
end 
end
end
----------------------------------------
function group_settings(msg, target) 	
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 	return "_You're Not_ *Moderator*"
else
  return "شما مدیر گروه نمیباشید"
end
end
local data = load_data(_config.moderation.data)
local target = msg.to.id 
if data[tostring(target)] then 	
if data[tostring(target)]["settings"]["num_msg_max"] then 	
NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['num_msg_max'])
	print('custom'..NUM_MSG_MAX) 	
else 	
NUM_MSG_MAX = 5
end
if data[tostring(target)]["settings"]["set_char"] then 	
SETCHAR = tonumber(data[tostring(target)]['settings']['set_char'])
	print('custom'..SETCHAR) 	
else 	
SETCHAR = 1000
end
if data[tostring(target)]["settings"]["time_check"] then 	
TIME_CHECK = tonumber(data[tostring(target)]['settings']['time_check'])
	print('custom'..TIME_CHECK) 	
else 	
TIME_CHECK = 2
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_link"] then			
data[tostring(target)]["settings"]["lock_link"] = 'yes'		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_tag"] then			
data[tostring(target)]["settings"]["lock_tag"] = 'no'		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_username"] then			
data[tostring(target)]["settings"]["lock_username"] = 'yes'		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_mention"] then			
data[tostring(target)]["settings"]["lock_mention"] = 'no'		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_arabic"] then			
data[tostring(target)]["settings"]["lock_arabic"] = 'no'		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_english"] then			
data[tostring(target)]["settings"]["lock_english"] = 'no'		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_edit"] then			
data[tostring(target)]["settings"]["lock_edit"] = 'no'		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_spam"] then			
data[tostring(target)]["settings"]["lock_spam"] = 'no'		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_flood"] then			
data[tostring(target)]["settings"]["lock_flood"] = 'yes'		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_bots"] then			
data[tostring(target)]["settings"]["lock_bots"] = 'yes'		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_markdown"] then			
data[tostring(target)]["settings"]["lock_markdown"] = 'no'		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_webpage"] then			
data[tostring(target)]["settings"]["lock_webpage"] = 'no'		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["welcome"] then			
data[tostring(target)]["settings"]["welcome"] = "no"		
end
end

 if data[tostring(target)]["settings"] then		
 if not data[tostring(target)]["settings"]["lock_pin"] then			
 data[tostring(target)]["settings"]["lock_pin"] = 'no'		
 end
 end

 if data[tostring(target)]["settings"] then		
 if not data[tostring(target)]["settings"]["lock_all"] then			
 data[tostring(target)]["settings"]["lock_all"] = 'no'		
 end
 end
if data[tostring(target)]["settings"] then		
 if not data[tostring(target)]["settings"]["lock_join"] then			
 data[tostring(target)]["settings"]["lock_join"] = 'no'		
 end
 end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_gif"] then			
data[tostring(target)]["mutes"]["mute_gif"] = 'no'		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_all"] then			
data[tostring(target)]["mutes"]["mute_all"] = 'no'		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_text"] then			
data[tostring(target)]["mutes"]["mute_text"] = 'no'		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_photo"] then			
data[tostring(target)]["mutes"]["mute_photo"] = 'no'		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_video"] then			
data[tostring(target)]["mutes"]["mute_video"] = 'no'		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_audio"] then			
data[tostring(target)]["mutes"]["mute_audio"] = 'no'		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_voice"] then			
data[tostring(target)]["mutes"]["mute_voice"] = 'no'		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_sticker"] then			
data[tostring(target)]["mutes"]["mute_sticker"] = 'no'		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_contact"] then			
data[tostring(target)]["mutes"]["mute_contact"] = 'no'		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_forward"] then			
data[tostring(target)]["mutes"]["mute_forward"] = 'no'		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_location"] then			
data[tostring(target)]["mutes"]["mute_location"] = 'no'		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_document"] then			
data[tostring(target)]["mutes"]["mute_document"] = 'no'		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_tgservice"] then			
data[tostring(target)]["mutes"]["mute_tgservice"] = 'no'		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_inline"] then			
data[tostring(target)]["mutes"]["mute_inline"] = 'no'		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_game"] then			
data[tostring(target)]["mutes"]["mute_game"] = 'no'		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_keyboard"] then			
data[tostring(target)]["mutes"]["mute_keyboard"] = 'no'		
end
end

local hash = "muteall:"..msg.to.id
local check_time = redis:ttl(hash)
day = math.floor(check_time / 86400)
MRay = check_time % 86400
hours = math.floor( MRay / 3600)
bhours = MRay % 3600
min = math.floor(bhours / 60)
sec = math.floor(bhours % 60)
if not lang then
if not redis:get(hash) or check_time == -1 then
 mute_all1 = 'n time'
elseif tonumber(check_time) > 1 and check_time < 60 then
 mute_all1 = '_enable for_ *'..sec..'* _sec_'
elseif tonumber(check_time) > 60 and check_time < 3600 then
 mute_all1 = '_enable for_ '..min..' _min_ *'..sec..'* _sec_'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
 mute_all1 = '_enable for_ *'..hours..'* _hour_ *'..min..'* _min_ *'..sec..'* _sec_'
elseif tonumber(check_time) > 86400 then
 mute_all1 = '_enable for_ *'..day..'* _day_ *'..hours..'* _hour_ *'..min..'* _min_ *'..sec..'* _sec_'
 end
elseif lang then
if not redis:get(hash) or check_time == -1 then
 mute_all2 = 'n time'
elseif tonumber(check_time) > 1 and check_time < 60 then
 mute_all2 = '_فعال برای_ *'..sec..'* _ثانیه_'
elseif tonumber(check_time) > 60 and check_time < 3600 then
 mute_all2 = '_فعال برای_ *'..min..'* _دقیقه و_ *'..sec..'* _ثانیه_'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
 mute_all2 = '_فعال برای_ *'..hours..'* _ساعت و_ *'..min..'* _دقیقه و_ *'..sec..'* _ثانیه_'
elseif tonumber(check_time) > 86400 then
 mute_all2 = '_فعال برای_ *'..day..'* _روز و_ *'..hours..'* _ساعت و_ *'..min..'* _دقیقه و_ *'..sec..'* _ثانیه_'
 end
end

 local expire_date = ''
local expi = redis:ttl('ExpireDate:'..msg.to.id)
if expi == -1 then
if lang then
	expire_date = 'نامحدود!'
else
	expire_date = 'Unlimited!'
end
else
	local day = math.floor(expi / 86400) + 1
if lang then
	expire_date = day..' روز'
else
	expire_date = day..' Days'
end
end
local cmdss = redis:hget('group:'..msg.to.id..':cmd', 'bot')
	local cmdsss = ''
	if lang then
	if cmdss == 'owner' then
	cmdsss = cmdsss..'اونر و بالاتر'
	elseif cmdss == 'moderator' then
	cmdsss = cmdsss..'مدیر و بالاتر'
	else
	cmdsss = cmdsss..'کاربر و بالاتر'
	end
	else
	if cmdss == 'owner' then
	cmdsss = cmdsss..'Owner or higher'
	elseif cmdss == 'moderator' then
	cmdsss = cmdsss..'Moderator or higher'
	else
	cmdsss = cmdsss..'Member or higher'
	end
	end
if not lang then
local settings = data[tostring(target)]["settings"]
local mutes = data[tostring(target)]["mutes"]
text ="*MαƬαƊσR SєƬƬιηgѕ :*\n\n🔐 `ƓяσUρ` #Lσcк `Ƥяσ Lιѕт :`\n\n*>Lιηк :* "..settings.lock_link.."\n*>Ɛɗιт :* "..settings.lock_edit.."\n*>Uѕєяηαмє :* "..settings.lock_username.."\n*>Ƭαg :* "..settings.lock_tag.."\n*>Mєηтιση :* "..settings.lock_mention.."\n*>Ɯєвραgє :* "..settings.lock_webpage.."\n*>Aяαвιc :* "..settings.lock_arabic.."\n*>ƐηgƖιѕн :* "..settings.lock_english.."\n*>Mαякɗσωη :* "..settings.lock_markdown.."\n*>Ɠιf :* "..mutes.mute_gif.."\n*>Ƭєxт :* "..mutes.mute_text.."\n*>IηƖιηє :* "..mutes.mute_inline.."\n*>Ɠαмє :* "..mutes.mute_game.."\n*>Ƥнσтσ :* "..mutes.mute_photo.."\n*>Ʋιɗєσ :* "..mutes.mute_video.."\n*>Aυɗισ :* "..mutes.mute_audio.."\n*>Ʋσιcє :* "..mutes.mute_voice.."\n*>Sтιcкєя :* "..mutes.mute_sticker.."\n*>Ƈσηтαcт :* "..mutes.mute_contact.."\n*>Ƒσяωαяɗ :* "..mutes.mute_forward.."\n*>Lσcαтιση :* "..mutes.mute_location.."\n*>Ɗσcυмєηт :* "..mutes.mute_document.."\n*>ƘєуƁσαяɗ :* "..mutes.mute_keyboard.."\n=============\n🔐 `ƓяσUρ` #Lσcк `Lιѕт :`\n\n*>SιƖєηт Ɠρ :* "..mutes.mute_all.."\n*>Lσcк Ƭιмє :* "..mute_all1.."\n*>Lσcк ƬƓѕєяνιcє :* "..mutes.mute_tgservice.."\n*>Lσcк Jσιη :* "..settings.lock_join.."\n*>Lσcк Spam :* "..settings.lock_spam.."\n*>Lσcк ƑƖσσɗ :* "..settings.lock_flood.."\n*>Ƥιη Mєѕѕαgє :* "..settings.lock_pin.."\n=============\n💠 `ƓяσUρ` #OƬнƐя `SєттιηƓѕ :`\n\n*>Ɠяσυρ ƜєƖcσмє :* "..settings.welcome.."\n*>Ɓσтѕ Ƥяσтєcтιση :* "..settings.lock_bots.."\n*>ƑƖσσɗ Sєηѕιтινιту :* `"..NUM_MSG_MAX.."`\n*>ƑƖσσɗ Ƈнєcк Ƭιмє :* `"..TIME_CHECK.."`\n*>Ƈнαяαcтєя Sєηѕιтινιту :* `"..SETCHAR.."`\n*>Ɓσтѕ Ƈσммαηɗѕ :* "..cmdsss.."\n*>Ɛxριяє Ɗαтє :* `"..expire_date.."`\n\n=============\n🌐 `IηfσRмαƬιση :`\n\n*>Ɠяσυρ Ɲαмє :* "..(check_markdown(msg.to.title) or "").."\n*>Ɠяσυρ IƊ :* `"..msg.to.id.."`\n*>Ƴσυя Ɲαмє :* "..(check_markdown(msg.from.first_name) or "No ɳαɱҽ").."\n*>Ƴσυя IƊ :* `"..msg.from.id.."`\n*>Uѕєяηαмє :* @"..check_markdown(msg.from.username or "").."\n\n=============\n*>ƇнαηηєƖ :* @MaTaDoRTeaM\n*>Ƥσωєяєɗ Ɓу :* @MahDiRoO\n*>Ɠяσυρ Lαηgυαgє :* `Eɴ`"
else
local settings = data[tostring(target)]["settings"]
local mutes = data[tostring(target)]["mutes"] 
text ="*تنظیمات ماتادور :*\n\n🔐 `لیست` #قفل `پیشرفته گروه :`\n\n*>لینک :* "..settings.lock_link.."\n*>ویرایش :* "..settings.lock_edit.."\n*>یوزرنیم :* "..settings.lock_username.."\n*>هشتگ :* "..settings.lock_tag.."\n*>فونت :* "..settings.lock_mention.."\n*>صفحات وب :* "..settings.lock_webpage.."\n*>عربی :* "..settings.lock_arabic.."\n*>انگلیسی :* "..settings.lock_english.."\n*>فراخوانی :* "..settings.lock_markdown.."\n*>گیف :* "..mutes.mute_gif.."\n*>متن :* "..mutes.mute_text.."\n*>دکمه شیشه ای :* "..mutes.mute_inline.."\n*>بازی :* "..mutes.mute_game.."\n*>عکس :* "..mutes.mute_photo.."\n*>فیلم :* "..mutes.mute_video.."\n*>آهنگ :* "..mutes.mute_audio.."\n*>ویس :* "..mutes.mute_voice.."\n*>استیکر :* "..mutes.mute_sticker.."\n*>مخاطب :* "..mutes.mute_contact.."\n*>نقل قول :* "..mutes.mute_forward.."\n*>مکان :* "..mutes.mute_location.."\n*>فایل :* "..mutes.mute_document.."\n*>کیبورد شیشه ای :* "..mutes.mute_keyboard.."\n=============\n🔐 `لیست` #قفل ها `گروه :`\n\n*>گروه سکوت :* "..mutes.mute_all.."\n*>قفل زمان بیصدا :* "..mute_all2.."\n*>قفل خدمات تلگرام :* "..mutes.mute_tgservice.."\n*>قفل ورود :* "..settings.lock_join.."\n*>قفل هرزنامه :* "..settings.lock_spam.."\n*>قفل رگباری :* "..settings.lock_flood.."\n*>سنجاق پیام :* "..settings.lock_pin.."\n=============\n💠 `لیست` #دیگر `تنظیمات گروه :`\n\n*>خوش آمدگویی :* "..settings.welcome.."\n*>محافظت در برابر ربات :* "..settings.lock_bots.."\n*>حداکثر پیام رگباری :* `"..NUM_MSG_MAX.."`\n*>زمان بررسی رگباری :* `"..TIME_CHECK.."`\n*>حداکثر کاراکتر مجاز :* `"..SETCHAR.."`\n*>دستورات ربات :* "..cmdsss.."\n*>تاریخ انقضا :* `"..expire_date.."`\n\n=============\n🌐 `اطلاعات :`\n\n*>نام گروه :* "..(check_markdown(msg.to.title) or "").."\n*>آیدی گروه :* `"..msg.to.id.."`\n*>نام شما :* "..(check_markdown(msg.from.first_name) or "No ɳαɱҽ").."\n*>آیدی شما :* `"..msg.from.id.."`\n*>یوزرنیم شما :* @"..check_markdown(msg.from.username or "").."\n\n=============\n*>کانال :* @MaTaDoRTeaM\n*>برنامه نویس :* @MahDiRoO\n*>زبان گروه :* `فارسی`"
end
if not lang then
text = string.gsub(text, "yes", "`Del ✅`")
text = string.gsub(text, "no", "`Ok ❌`")
text = string.gsub(text, 'warn', "`Warn ⚠️`")
text = string.gsub(text, 'kick', "`Kick 👣`")
text = string.gsub(text, 'ban', "`Lock 🚫`")
 else
text = string.gsub(text, "yes", "#حذف ✅")
text = string.gsub(text, "no", "#اوکی ❌")
text = string.gsub(text, 'warn', "#اخطار ⚠️")
text = string.gsub(text, 'kick', "#اخراج 👣")
text = string.gsub(text, 'ban', "#مسدود 🚫")
 end
return text
end
----------------------------------------
local function plugin_enabled( name )
  for k,v in pairs(_config.enabled_plugins) do
    if name == v then
      return k
    end
  end
  return false
end
----------------------------------------
local function plugin_exists( name )
  for k,v in pairs(plugins_names()) do
    if name..'.lua' == v then
      return true
    end
  end
  return false
end
----------------------------------------
----------------------------------------
local function list_all_plugins(only_enabled, msg)
  local tmp = '\n'..MaTaDoRpm
  local text = ''
  local nsum = 0
  for k, v in pairs( plugins_names( )) do
    local status = '|✖️| >'
    nsum = nsum+1
    nact = 0
    for k2, v2 in pairs(_config.enabled_plugins) do
      if v == v2..'.lua' then 
        status = '|✔| >'
      end
      nact = nact+1
    end
    if not only_enabled or status == '|✔| >'then
      v = string.match (v, "(.*)%.lua")
      text = text..nsum..'.'..status..' '..v..' \n'
    end
  end
  text = '`'..text..'`\n *ιηѕтαƖƖєɗ ρƖυgιηѕ :* _['..nsum..']_\n *ρƖυgιηѕ єηαвƖєɗ :* _['..nact..']_\n *ρƖυgιηѕ ɗιѕαвƖєɗ :* _['..nsum-nact..']_'..tmp
  tdcli.sendMessage(msg.to.id, msg.id_, 1, text, 1, 'mt')
end
----------------------------------------
local function list_plugins(only_enabled, msg)
  local text = ''
  local nsum = 0
  for k, v in pairs( plugins_names( )) do
    local status = '*|✖️|>*'
    nsum = nsum+1
    nact = 0
    for k2, v2 in pairs(_config.enabled_plugins) do
      if v == v2..'.lua' then 
        status = '*|✔|>*'
      end
      nact = nact+1
    end
    if not only_enabled or status == '*|✔|>*'then
      v = string.match (v, "(.*)%.lua")
    end
  end
  text = "\n*Ɗσηє!*\n*MαƬαƊσR Ɓσт* `RєƖσαɗєɗ`\n*ƤƖυgιηѕ* : `["..nact.."]`\n"..MaTaDoRpm
  tdcli.sendMessage(msg.to.id, msg.id_, 1, text, 1, 'md')
end
----------------------------------------
local function reload_plugins(checks, msg)
  plugins = {}
  load_plugins()
  return list_plugins(true, msg)
end
----------------------------------------
local function enable_plugin( plugin_name, msg )
  print('checking if '..plugin_name..' exists')
  if plugin_enabled(plugin_name) then
    local text = '<b>'..plugin_name..'</b> <i>is online.</i>'
	tdcli.sendMessage(msg.to.id, msg.id_, 1, text, 1, 'html')
	return
  end
  if plugin_exists(plugin_name) then
    table.insert(_config.enabled_plugins, plugin_name)
    print(plugin_name..' added to _config table')
    save_config()
    return reload_plugins(true, msg)
  else
    local text = '<b>'..plugin_name..'</b> <i>does not exists.</i>'
	tdcli.sendMessage(msg.to.id, msg.id_, 1, text, 1, 'html')
  end
end
----------------------------------------
local function disable_plugin( name, msg )
  local k = plugin_enabled(name)
  if not k then
    local text = '<b>'..name..'</b> <i>not online.</i>'
	tdcli.sendMessage(msg.to.id, msg.id_, 1, text, 1, 'html')
	return
  end
  if not plugin_exists(name) then
    local text = '<b>'..name..'</b> <i>does not exists.</i>'
	tdcli.sendMessage(msg.to.id, msg.id_, 1, text, 1, 'html')
  else
  table.remove(_config.enabled_plugins, k)
  save_config( )
  return reload_plugins(true, msg)
end  
end
----------------------------------------
local function disable_plugin_on_chat(receiver, plugin, msg)
  if not plugin_exists(plugin) then
    return "_Plugin does not exists_"
  end

  if not _config.disabled_plugin_on_chat then
    _config.disabled_plugin_on_chat = {}
  end

  if not _config.disabled_plugin_on_chat[receiver] then
    _config.disabled_plugin_on_chat[receiver] = {}
  end

  _config.disabled_plugin_on_chat[receiver][plugin] = true

  save_config()
  local text = '<b>'..plugin..'</b> <i>offline on this chat.</i>'
  tdcli.sendMessage(msg.to.id, msg.id_, 1, text, 1, 'html')
end
----------------------------------------
local function reenable_plugin_on_chat(receiver, plugin, msg)
  if not _config.disabled_plugin_on_chat then
    return 'There aren\'t any offline plugins'
  end

  if not _config.disabled_plugin_on_chat[receiver] then
    return 'There aren\'t any offline plugins for this chat'
  end

  if not _config.disabled_plugin_on_chat[receiver][plugin] then
    return '_This plugin is not offline_'
  end

  _config.disabled_plugin_on_chat[receiver][plugin] = false
  save_config()
  local text = '<b>'..plugin..'</b> <i>is online again.</i>'
  tdcli.sendMessage(msg.to.id, msg.id_, 1, text, 1, 'html')
end
----------------------------------------
local function pre_processt(msg)
	if msg.to.type ~= 'pv' then
		local hash = "gp_lang:"..msg.to.id
		local lang = redis:get(hash)
		local data = load_data(_config.moderation.data)
		local gpst = data[tostring(msg.to.id)]
		local chex = redis:get('CheckExpire::'..msg.to.id)
		local exd = redis:get('ExpireDate:'..msg.to.id)
		if gpst and not chex and msg.from.id ~= SUDO and not is_sudo(msg) then
			redis:set('CheckExpire::'..msg.to.id,true)
			redis:set('ExpireDate:'..msg.to.id,true)
			redis:setex('ExpireDate:'..msg.to.id, 86400, true)
				tdcli.sendMessage(msg.to.id, msg.id_, 1, '`گروه به مدت 1 روز شارژ شد. لطفا با سودو برای شارژ بیشتر تماس بگیرید. در غیر اینصورت گروه شما از لیست ربات حذف و ربات گروه را ترک خواهد کرد.`', 1, 'md')
		end
		if chex and not exd and msg.from.id ~= SUDO and not is_sudo(msg) then
			local text1 = 'شارژ این گروه به اتمام رسید \n\nID:  <code>'..msg.to.id..'</code>\n\nدر صورتی که میخواهید ربات این گروه را ترک کند از دستور زیر استفاده کنید\n\n/leave '..msg.to.id..'\nبرای جوین دادن توی این گروه میتونی از دستور زیر استفاده کنی:\n/jointo '..msg.to.id..'\n_________________\nدر صورتی که میخواهید گروه رو دوباره شارژ کنید میتوانید از کد های زیر استفاده کنید...\n\n<b>برای شارژ 1 ماهه:</b>\n/plan 1 '..msg.to.id..'\n\n<b>برای شارژ 3 ماهه:</b>\n/plan 2 '..msg.to.id..'\n\n<b>برای شارژ نامحدود:</b>\n/plan 3 '..msg.to.id
			local text2 = '`شارژ این گروه به پایان رسید. به دلیل عدم شارژ مجدد، گروه از لیست ربات حذف و ربات از گروه خارج میشود.`'
				tdcli.sendMessage(SUDO, 0, 1, text1, 1, 'html')
				tdcli.sendMessage(msg.to.id, 0, 1, text2, 1, 'md')
			botrem(msg)
		else
			local expiretime = redis:ttl('ExpireDate:'..msg.to.id)
			local day = (expiretime / 86400)
			if tonumber(day) > 0.208 and not is_sudo(msg) and is_mod(msg) then
				warning(msg)
			end
		end
	end
end
----------------------------------------
local function run(msg, matches)
if is_banned(msg.from.id, msg.to.id) or is_gbanned(msg.from.id, msg.to.id) or is_silent_user(msg.from.id, msg.to.id) then
return false
end
local cmd = redis:hget('group:'..msg.to.id..':cmd', 'bot')
local mutealll = redis:get('group:'..msg.to.id..':muteall')
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
local chat = msg.to.id
local user = msg.from.id
local uhash = 'user:'..msg.from.id
local user = redis:hgetall(uhash)
local um_hash = 'msgs:'..msg.from.id..':'..msg.to.id
user_info_msgs = tonumber(redis:get(um_hash) or 0)
if cmd == 'moderator' and not is_mod(msg) or cmd == 'owner' and not is_owner(msg) or mutealll and not is_mod(msg) then
else
if msg.to.type ~= 'pv' then
if (matches[1]:lower() == "id" and not lang) or (matches[1] == 'ایدی' and lang) then
if not matches[2] and not msg.reply_id then
local function getpro(arg, data)
 if data.photos_[0] then
       if not lang then
            tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_,"Ɠяσυρ ηαмє : "..(check_markdown(msg.to.title)).."\nƓяσυρ IƊ : "..msg.to.id.."\nƝαмє : "..(msg.from.first_name or "----").."\nUѕєяƝαмє : @"..(msg.from.username or "----").."\nUѕєя IƊ : "..msg.from.id.."",dl_cb,nil)
       elseif lang then
          tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_,"نام گروه : "..(check_markdown(msg.to.title)).."\nشناسه گروه : "..msg.to.id.."\nنام شما : "..(msg.from.first_name or "----").."\nنام کاربری : @"..(msg.from.username or "----").."\nشناسه شما : "..msg.from.id.."",dl_cb,nil)
     end
   else
       if not lang then
      tdcli.sendMessage(msg.to.id, msg.id_, 1, "`You Have Not Profile Photo...!`\n\n> *Chat ID :* `"..msg.to.id.."`\n*User ID :* `"..msg.from.id.."`", 1, 'md')
       elseif lang then
      tdcli.sendMessage(msg.to.id, msg.id_, 1, "_شما هیچ عکسی ندارید...!_\n\n> _شناسه گروه :_ `"..msg.to.id.."`\n_شناسه شما :_ `"..msg.from.id.."`", 1, 'md')
            end
        end
end
	   tdcli_function ({
    ID = "GetUserProfilePhotos",
    user_id_ = msg.from.id,
    offset_ = 0,
    limit_ = 1
  }, getpro, nil)	
end
if msg.reply_id and not matches[2] then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="id"})
  end
if matches[2] then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="id"})
      end
   end
if (matches[1]:lower() == "me" and not lang) or (matches[1] == 'اطلاعات من' and lang) then
if not matches[2] and not msg.reply_id then
local function getpro(arg, data)
 if data.photos_[0] then
       if not lang then
            tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_,"Ɲαмє : "..(msg.from.first_name or "----").."\nUѕєяƝαмє : @"..(msg.from.username or "----").."\nUѕєя IƊ : "..msg.from.id.."\nтσтαƖ мєѕѕαgєѕ : "..user_info_msgs.."",dl_cb,nil)
       elseif lang then
          tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_,"نام شما : "..(msg.from.first_name or "----").."\nنام کاربری : @"..(msg.from.username or "----").."\nشناسه شما : "..msg.from.id.."\nتعداد پیام شما : "..user_info_msgs.."",dl_cb,nil)
     end
   else
       if not lang then
      tdcli.sendMessage(msg.to.id, msg.id_, 1, "`You Have Not Profile Photo...!`\n\n> *Chat ID :* `"..msg.to.id.."`\n*User ID :* `"..msg.from.id.."`", 1, 'md')
       elseif lang then
      tdcli.sendMessage(msg.to.id, msg.id_, 1, "_شما هیچ عکسی ندارید...!_\n\n> _شناسه گروه :_ `"..msg.to.id.."`\n_شناسه شما :_ `"..msg.from.id.."`", 1, 'md')
            end
        end
end
	   tdcli_function ({
    ID = "GetUserProfilePhotos",
    user_id_ = msg.from.id,
    offset_ = 0,
    limit_ = 1
  }, getpro, nil)	
end
if msg.reply_id and not matches[2] then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="id"})
  end
if matches[2] then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="id"})
      end
   end
if ((matches[1]:lower() == "pin" and not lang) or (matches[1] == 'سنجاق' and lang)) and is_mod(msg) and msg.reply_id then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
    data[tostring(chat)]['pin'] = msg.reply_id
	  save_data(_config.moderation.data, data)
tdcli.pinChannelMessage(msg.to.id, msg.reply_id, 1)
if not lang then
return "*Message Has Been Pinned*"
elseif lang then
return "پیام سجاق شد"
end
elseif not is_owner(msg) then
   return
 end
 elseif lock_pin == 'no' then
    data[tostring(chat)]['pin'] = msg.reply_id
	  save_data(_config.moderation.data, data)
tdcli.pinChannelMessage(msg.to.id, msg.reply_id, 1)
if not lang then
return "*Message Has Been Pinned*"
elseif lang then
return "پیام سجاق شد"
end
end
end
if ((matches[1]:lower() == 'unpin' and not lang) or (matches[1] == 'حذف سنجاق' and lang)) and is_mod(msg) then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
tdcli.unpinChannelMessage(msg.to.id)
if not lang then
return "*Pin message has been unpinned*"
elseif lang then
return "پیام سنجاق شده پاک شد"
end
elseif not is_owner(msg) then
   return 
 end
 elseif lock_pin == 'no' then
tdcli.unpinChannelMessage(msg.to.id)
if not lang then
return "*Pin message has been unpinned*"
elseif lang then
return "پیام سنجاق شده پاک شد"
end
end
end
if ((matches[1]:lower() == "add" and not lang) or (matches[1] == 'نصب' and lang)) and is_sudo(msg) then
redis:set('ExpireDate:'..msg.to.id,true)
redis:setex('ExpireDate:'..msg.to.id, 180, true)
if not redis:get('CheckExpire::'..msg.to.id) then
redis:set('CheckExpire::'..msg.to.id,true)
end
return modadd(msg)
end
if ((matches[1]:lower() == "rem" and not lang) or (matches[1] == 'لغو نصب' and lang))and is_admin(msg) then
			if redis:get('CheckExpire::'..msg.to.id) then
				redis:del('CheckExpire::'..msg.to.id)
			end
			redis:del('ExpireDate:'..msg.to.id)
return modrem(msg)
end
if ((matches[1]:lower() == "setmanager" and not lang) or (matches[1] == 'ادمین گروه' and lang)) and is_owner(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="setmanager"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="setmanager"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="setmanager"})
      end
   end
if ((matches[1]:lower() == "remmanager" and not lang) or (matches[1] == 'حذف ادمین گروه' and lang)) and is_owner(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="remmanager"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="remmanager"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="remmanager"})
      end
   end
if ((matches[1]:lower() == "whitelist" and not lang) or (matches[1] == 'لیست سفید' and lang)) and matches[2] == "+" and is_mod(msg) then
if not matches[3] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="setwhitelist"})
  end
  if matches[3] and string.match(matches[3], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[3],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[3],cmd="setwhitelist"})
    end
  if matches[3] and not string.match(matches[3], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[3]
    }, action_by_username, {chat_id=msg.to.id,username=matches[3],cmd="setwhitelist"})
      end
   end
if ((matches[1]:lower() == "whitelist" and not lang) or (matches[1] == 'لیست سفید' and lang)) and matches[2] == "-" and is_mod(msg) then
if not matches[3] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="remwhitelist"})
  end
  if matches[3] and string.match(matches[3], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[3],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[3],cmd="remwhitelist"})
    end
  if matches[3] and not string.match(matches[3], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[3]
    }, action_by_username, {chat_id=msg.to.id,username=matches[3],cmd="remwhitelist"})
      end
   end
if ((matches[1]:lower() == "setowner" and not lang) or (matches[1] == 'مالک' and lang)) and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="setowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="setowner"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="setowner"})
      end
   end
if ((matches[1]:lower() == "remowner" and not lang) or (matches[1] == 'حذف مالک' and lang)) and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="remowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="remowner"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="remowner"})
      end
   end
if ((matches[1]:lower() == "promote"and not lang) or (matches[1] == 'مدیر'and lang)) and is_owner(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="promote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="promote"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="promote"})
      end
   end
if ((matches[1]:lower() == "demote" and not lang) or (matches[1] == 'حذف مدیر' and lang)) and is_owner(msg) then
if not matches[2] and msg.reply_id then
 tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="demote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="demote"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="demote"})
      end
   end
local target = msg.to.id
if ((matches[1]:lower() == "link" and not lang) or (matches[1] == "لینک" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_link(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_link(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_link(msg, data, target)
end
end
--------------------------------------
if ((matches[1]:lower() == "tag" and not lang) or (matches[1] == "تگ" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_tag(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_tag(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_tag(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "username" and not lang) or (matches[1] == "نام کاربری" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_username(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_username(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_username(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "mention" and not lang) or (matches[1] == "فراخوانی" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_mention(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_mention(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_mention(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "arabic" and not lang) or (matches[1] == "عربی" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_arabic(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_arabic(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_arabic(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "english" and not lang) or (matches[1] == "انگلیسی" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_english(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_english(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_english(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "edit" and not lang) or (matches[1] == "ویرایش" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_edit(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_edit(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_edit(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "join" and not lang) or (matches[1] == "ورود" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_join(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_join(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_join(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "markdown" and not lang) or (matches[1] == "فونت" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_markdown(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_markdown(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_markdown(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "webpage" and not lang) or (matches[1] == "وب" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_webpage(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_webpage(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_webpage(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "gif" and not lang) or (matches[1] == "گیف" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_gif(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_gif(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_gif(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "text" and not lang) or (matches[1] == "متن" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_text(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_text(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_text(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "photo" and not lang) or (matches[1] == "عکس" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_photo(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_photo(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_photo(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "video" and not lang) or (matches[1] == "فیلم" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_video(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_video(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_video(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "audio" and not lang) or (matches[1] == "اهنگ" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_audio(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_audio(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_audio(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "voice" and not lang) or (matches[1] == "ویس" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_voice(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_voice(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_voice(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "sticker" and not lang) or (matches[1] == "استیکر" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_sticker(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_sticker(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_sticker(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "contact" and not lang) or (matches[1] == "مخاطب" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_contact(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_contact(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_contact(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "forward" and not lang) or (matches[1] == "فوروارد" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_forward(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_forward(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_forward(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "location" and not lang) or (matches[1] == "مکان" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_location(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_location(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_location(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "document" and not lang) or (matches[1] == "فایل" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_document(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_document(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_document(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "inline" and not lang) or (matches[1] == "کیبورد شیشه ای" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_inline(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_inline(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_inline(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "game" and not lang) or (matches[1] == "بازی" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_game(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_game(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_game(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "keyboard" and not lang) or (matches[1] == "صفحه کلید" and lang)) and is_mod(msg) then
if ((matches[2] == "ban" and not lang) or (matches[2] == "مسدود" and lang)) then
return ban_keyboard(msg, data, target)
end
if ((matches[2] == "warn" and not lang) or (matches[2] == "اخطار" and lang)) then
return warn_keyboard(msg, data, target)
end
if ((matches[2] == "kick" and not lang) or (matches[2] == "اخراج" and lang)) then
return kick_keyboard(msg, data, target)
end
end
----------------------------------------
if ((matches[1]:lower() == "lock" and not lang) or (matches[1] == "قفل" and lang)) and is_mod(msg) then
if ((matches[2] == "gif" and not lang) or (matches[2] == "گیف" and lang)) then
return mute_gif(msg, data, target)
end
if ((matches[2] == "text" and not lang) or (matches[2] == "متن" and lang)) then
return mute_text(msg ,data, target)
end
if ((matches[2] == "photo" and not lang) or (matches[2] == "عکس" and lang)) then
return mute_photo(msg ,data, target)
end
if ((matches[2] == "video" and not lang) or (matches[2] == "فیلم" and lang)) then
return mute_video(msg ,data, target)
end
if ((matches[2] == "audio" and not lang) or (matches[2] == "اهنگ" and lang)) then
return mute_audio(msg ,data, target)
end
if ((matches[2] == "voice" and not lang) or (matches[2] == "ویس" and lang)) then
return mute_voice(msg ,data, target)
end
if ((matches[2] == "sticker" and not lang) or (matches[2] == "استیکر" and lang)) then
return mute_sticker(msg ,data, target)
end
if ((matches[2] == "contact" and not lang) or (matches[2] == "مخاطب" and lang)) then
return mute_contact(msg ,data, target)
end
if ((matches[2] == "forward" and not lang) or (matches[2] == "فوروارد" and lang)) then
return mute_forward(msg ,data, target)
end
if ((matches[2] == "location" and not lang) or (matches[2] == "مکان" and lang)) then
return mute_location(msg ,data, target)
end
if ((matches[2] == "document" and not lang) or (matches[2] == "فایل" and lang)) then
return mute_document(msg ,data, target)
end
if ((matches[2] == "inline" and not lang) or (matches[2] == "کیبورد شیشه ای" and lang)) then
return mute_inline(msg ,data, target)
end
if ((matches[2] == "game" and not lang) or (matches[2] == "بازی" and lang)) then
return mute_game(msg ,data, target)
end
if ((matches[2] == "keyboard" and not lang) or (matches[2] == "صفحه کلید" and lang)) then
return mute_keyboard(msg ,data, target)
end
if ((matches[2] == "link" and not lang) or (matches[2] == "لینک" and lang)) then
return lock_link(msg, data, target)
end
if ((matches[2] == "join" and not lang) or (matches[2] == "ورود" and lang)) then
return lock_join(msg, data, target)
end
if ((matches[2] == "tag" and not lang) or (matches[2] == "تگ" and lang)) then
return lock_tag(msg, data, target)
end
if ((matches[2] == "username" and not lang) or (matches[2] == "نام کاربری" and lang)) then
return lock_username(msg, data, target)
end
if ((matches[2] == "mention" and not lang) or (matches[2] == "فراخوانی" and lang)) then
return lock_mention(msg, data, target)
end
if ((matches[2] == "arabic" and not lang) or (matches[2] == "عربی" and lang)) then
return lock_arabic(msg, data, target)
end
if ((matches[2] == "english" and not lang) or (matches[2] == "انگلیسی" and lang)) then
return lock_english(msg, data, target)
end
if ((matches[2] == "edit" and not lang) or (matches[2] == "ویرایش" and lang)) then
return lock_edit(msg, data, target)
end
if ((matches[2] == "markdown" and not lang) or (matches[2] == "فونت" and lang)) then
return lock_markdown(msg, data, target)
end
if ((matches[2] == "webpage" and not lang) or (matches[2] == "وب" and lang)) then
return lock_webpage(msg, data, target)
end
if ((matches[2] == "bots" and not lang) or (matches[2] == "ربات" and lang)) then
return lock_bots(msg, data, target)
end
if ((matches[2] == "pin" and not lang) or (matches[2] == "سنجاق" and lang)) and is_owner(msg) then
return lock_pin(msg, data, target)
end
if ((matches[2] == "spam" and not lang) or (matches[2] == "هرزنامه" and lang)) then
return lock_spam(msg, data, target)
end
if ((matches[2] == "flood" and not lang) or (matches[2] == "پیام مکرر" and lang)) then
return lock_flood(msg, data, target)
end
if ((matches[2] == "tgservice" and not lang) or (matches[2] == "سرویس تلگرام" and lang)) then
return mute_tgservice(msg ,data, target)
end
if ((matches[2]:lower() == 'cmds') or (matches[2]:lower() == 'دستورات')) and is_owner(msg) then
			redis:hset('group:'..msg.to.id..':cmd', 'bot', 'moderator')
			if not lang then
			return '>Ƈмɗѕ нαѕ вєєη Ɩσcкєɗ fσя мємвєя🤖🔒\n*OяɗєяƁу :* [@'..check_markdown(msg.from.username or '')..'*|*`'..msg.from.id..'`]'
			else
			return 'دستورات برای کاربر عادی قفل شد 🤖🔒\n*سفارش توسط :* [@'..check_markdown(msg.from.username or '')..'*|*`'..msg.from.id..'`]'
			end
			end
end
if ((matches[1]:lower() == "unlock" and not lang) or (matches[1] == "بازکردن" and lang)) and is_mod(msg) then	
if ((matches[2] == "gif" and not lang) or (matches[2] == "گیف" and lang)) then
return unmute_gif(msg, data, target)
end
if ((matches[2] == "text" and not lang) or (matches[2] == "متن" and lang)) then
return unmute_text(msg ,data, target)
end
if ((matches[2] == "photo" and not lang) or (matches[2] == "عکس" and lang)) then
return unmute_photo(msg ,data, target)
end
if ((matches[2] == "video" and not lang) or (matches[2] == "فیلم" and lang)) then
return unmute_video(msg ,data, target)
end
if ((matches[2] == "audio" and not lang) or (matches[2] == "اهنگ" and lang)) then
return unmute_audio(msg ,data, target)
end
if ((matches[2] == "voice" and not lang) or (matches[2] == "ویس" and lang)) then
return unmute_voice(msg ,data, target)
end
if ((matches[2] == "sticker" and not lang) or (matches[2] == "استیکر" and lang)) then
return unmute_sticker(msg ,data, target)
end
if ((matches[2] == "contact" and not lang) or (matches[2] == "مخاطب" and lang)) then
return unmute_contact(msg ,data, target)
end
if ((matches[2] == "forward" and not lang) or (matches[2] == "فوروارد" and lang)) then
return unmute_forward(msg ,data, target)
end
if ((matches[2] == "location" and not lang) or (matches[2] == "مکان" and lang)) then
return unmute_location(msg ,data, target)
end
if ((matches[2] == "document" and not lang) or (matches[2] == "فایل" and lang)) then
return unmute_document(msg ,data, target)
end
if ((matches[2] == "inline" and not lang) or (matches[2] == "کیبورد شیشه ای" and lang)) then
return unmute_inline(msg ,data, target)
end
if ((matches[2] == "game" and not lang) or (matches[2] == "بازی" and lang)) then
return unmute_game(msg ,data, target)
end
if ((matches[2] == "keyboard" and not lang) or (matches[2] == "صفحه کلید" and lang)) then
return unmute_keyboard(msg ,data, target)
end
if ((matches[2] == "link" and not lang) or (matches[2] == "لینک" and lang)) then
return unlock_link(msg, data, target)
end
if ((matches[2] == "join" and not lang) or (matches[2] == "ورود" and lang)) then
return unlock_join(msg, data, target)
end
if ((matches[2] == "tag" and not lang) or (matches[2] == "تگ" and lang)) then
return unlock_tag(msg, data, target)
end
if ((matches[2] == "username" and not lang) or (matches[2] == "نام کاربری" and lang)) then
return unlock_username(msg, data, target)
end
if ((matches[2] == "mention" and not lang) or (matches[2] == "فراخوانی" and lang)) then
return unlock_mention(msg, data, target)
end
if ((matches[2] == "arabic" and not lang) or (matches[2] == "عربی" and lang)) then
return unlock_arabic(msg, data, target)
end
if ((matches[2] == "english" and not lang) or (matches[2] == "انگلیسی" and lang)) then
return unlock_english(msg, data, target)
end
if ((matches[2] == "edit" and not lang) or (matches[2] == "ویرایش" and lang)) then
return unlock_edit(msg, data, target)
end
if ((matches[2] == "markdown" and not lang) or (matches[2] == "فونت" and lang)) then
return unlock_markdown(msg, data, target)
end
if ((matches[2] == "webpage" and not lang) or (matches[2] == "وب" and lang)) then
return unlock_webpage(msg, data, target)
end
if ((matches[2] == "bots" and not lang) or (matches[2] == "ربات" and lang)) then
return unlock_bots(msg, data, target)
end
if ((matches[2] == "pin" and not lang) or (matches[2] == "سنجاق" and lang)) and is_owner(msg) then
return unlock_pin(msg, data, target)
end
if ((matches[2] == "spam" and not lang) or (matches[2] == "هرزنامه" and lang)) then
return unlock_spam(msg, data, target)
end
if ((matches[2] == "flood" and not lang) or (matches[2] == "پیام مکرر" and lang)) then
return unlock_flood(msg, data, target)
end
if ((matches[2] == "tgservice" and not lang) or (matches[2] == "سرویس تلگرام" and lang)) then
return unmute_tgservice(msg ,data, target)
end		
if ((matches[2]:lower() == 'cmds') or (matches[2]:lower() == 'دستورات')) and is_owner(msg) then
			redis:del('group:'..msg.to.id..':cmd')
			if not lang then
			return '>Ƈмɗѕ нαѕ вєєη υηƖσcкєɗ fσя мємвєя 🤖🔓\n*OяɗєяƁу :* [@'..check_markdown(msg.from.username or '')..'*|*`'..msg.from.id..'`]'
			else
			return 'دستورات برای کاربر عادی باز شد 🤖🔓\n*سفارش توسط :* [@'..check_markdown(msg.from.username or '')..'*|*`'..msg.from.id..'`]'
			end
end
 if matches[2]:lower() == 'mutetime' or matches[2] == 'زمان بیصدا' then
         local hash = 'muteall:'..msg.to.id
        redis:del(hash)
		if not lang then
          return "*>Lσcк тιмє* `Hαѕ Ɓєєη ƊιѕαвƖєɗ` 🤖🔊\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
		  else
		  return "گروه ازاد شد و افراد می توانند دوباره پست بگذارند 🤖🔊\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
		  end
end
end
if ((matches[1]:lower() == "gpsilent" and not lang) or (matches[1] == "گروه سکوت" and lang)) and is_mod(msg) then
return mute_all(msg, data, target)
end
if ((matches[1]:lower() == "gpunsilent" and not lang) or (matches[1] == "گروه حذف سکوت" and lang)) and is_mod(msg) then
return unmute_all(msg, data, target)
end
if ((matches[1]:lower() == 'cmds' and not lang) or (matches[1] == 'دستورات' and lang)) and is_owner(msg) then 
	if not lang then
		if matches[2]:lower() == 'owners' then 
		redis:hset('group:'..msg.to.id..':cmd', 'bot', 'owner') 
		return 'cmds set for owner or higher' 
		end
		if matches[2]:lower() == 'mods' then 
		redis:hset('group:'..msg.to.id..':cmd', 'bot', 'moderator')
		return 'cmds set for moderator or higher'
		end 
		if matches[2]:lower() == 'members' then 
		redis:hset('group:'..msg.to.id..':cmd', 'bot', 'member') 
		return 'cmds set for member or higher' 
		end 
	else
		if matches[2] == 'مالک' then 
		redis:hset('group:'..msg.to.id..':cmd', 'bot', 'owner') 
		return 'دستورات برای مدیرکل به بالا دیگر جواب می دهد' 
		end
		if matches[2] == 'مدیر' then 
		redis:hset('group:'..msg.to.id..':cmd', 'bot', 'moderator')
		return 'دستورات برای مدیر به بالا دیگر جواب می دهد' 
		end 
		if matches[2] == 'کاربر' then 
		redis:hset('group:'..msg.to.id..':cmd', 'bot', 'member') 
		return 'دستورات برای کاربر عادی به بالا دیگر جواب می دهد' 
		end 
		end
	end
if ((matches[1]:lower() == "gpinfo" and not lang) or (matches[1] == 'اطلاعات گروه' and lang)) and is_mod(msg) and msg.to.type == "channel" then
local function group_info(arg, data)
if not lang then
ginfo = "*Group Info :*\n_Admin Count :_ *"..data.administrator_count_.."*\n_Member Count :_ *"..data.member_count_.."*\n_Kicked Count :_ *"..data.kicked_count_.."*\n_Group ID :_ *"..data.channel_.id_.."*"
elseif lang then
ginfo = "*اطلاعات گروه :*\n_تعداد مدیران :_ *"..data.administrator_count_.."*\n_تعداد اعضا :_ *"..data.member_count_.."*\n_تعداد اعضای حذف شده :_ *"..data.kicked_count_.."*\n_شناسه گروه :_ *"..data.channel_.id_.."*"
end
        tdcli.sendMessage(arg.chat_id, arg.msg_id, 1, ginfo, 1, 'md')
end
 tdcli.getChannelFull(msg.to.id, group_info, {chat_id=msg.to.id,msg_id=msg.id})
end
if ((matches[1]:lower() == 'newlink' and not lang) or (matches[1] == 'لینک جدید' and lang)) and is_mod(msg) and not matches[2] then
	local function callback_link (arg, data)
    local administration = load_data(_config.moderation.data) 
				if not data.invite_link_ then
					administration[tostring(msg.to.id)]['settings']['linkgp'] = nil
					save_data(_config.moderation.data, administration)
       if not lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_Bot is not group creator_\n_set a link for group with using_ /setlink", 1, 'md')
       elseif lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_ربات سازنده گروه نیست_\n_با دستور_ setlink/ _لینک جدیدی برای گروه ثبت کنید_", 1, 'md')
    end
				else
					administration[tostring(msg.to.id)]['settings']['linkgp'] = data.invite_link_
					save_data(_config.moderation.data, administration)
        if not lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "*Newlink Created*", 1, 'md')
        elseif lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_لینک جدید ساخته شد_", 1, 'md')
            end
				end
			end
 tdcli.exportChatInviteLink(msg.to.id, callback_link, nil)
		end
		if ((matches[1]:lower() == 'setlink' and not lang) or (matches[1] == 'تنظیم لینک' and lang)) and is_owner(msg) then
		if not matches[2] then
		data[tostring(chat)]['settings']['linkgp'] = 'waiting'
			save_data(_config.moderation.data, data)
			if not lang then
			return '_Please send the new group_ *link* _now_'
    else 
         return 'لطفا لینک گروه خود را ارسال کنید'
       end
	   end
		 data[tostring(chat)]['settings']['linkgp'] = matches[2]
			 save_data(_config.moderation.data, data)
      if not lang then
			return '_Group Link Was Saved Successfully._'
    else 
         return 'لینک گروه شما با موفقیت ذخیره شد'
       end
		end
		if msg.text then
   local is_link = msg.text:match("^([https?://w]*.?telegram.me/joinchat/%S+)$") or msg.text:match("^([https?://w]*.?t.me/joinchat/%S+)$")
			if is_link and data[tostring(chat)]['settings']['linkgp'] == 'waiting' and is_owner(msg) then
				data[tostring(chat)]['settings']['linkgp'] = msg.text
				save_data(_config.moderation.data, data)
            if not lang then
				return "*Newlink* _has been set_"
           else
           return "لینک جدید ذخیره شد"
		 	end
       end
		end
if (matches[1]:lower() == "link" and not lang) or (matches[1] == "لینک" and lang) then
      local linkgp = data[tostring(chat)]['settings']['linkgp']
      if not linkgp then
      if not lang then
        return "_First create a link for group with using_ /newlink\n_If bot not group creator set a link with using_ /setlink"
     else
        return "ابتدا با دستور newlink/ لینک جدیدی برای گروه بسازید\nو اگر ربات سازنده گروه نیس با دستور setlink/ لینک جدیدی برای گروه ثبت کنید"
      end
      end
    if not lang then
    texth = "Tab Here For Join To ➣"
        elseif lang then
    texth = "کلیک کنید برای وارد شدن به ➣"
    end
local function inline_link_cb(TM, MR)
      if MR.results_ and MR.results_[0] then
tdcli.sendInlineQueryResultMessage(msg.to.id, 0, 0, 1, MR.inline_query_id_, MR.results_[0].id_, dl_cb, nil)
    else
     if not lang then
       text = "<b>Bold is offline</b>\n\n<b>Group Link :</b>\n"..linkgp
     else
      text = "<i>ربات Bold خاموش است</i>\n\n<b>لینک گروه :</b>\n"..linkgp
         end
  return tdcli.sendMessage(msg.to.id, msg.id, 0, text, 0, "html")
   end
end
tdcli.getInlineQueryResults(107705060, msg.to.id, 0, 0, ""..texth.."\n[ "..msg.to.title.."]("..linkgp..")", 0, inline_link_cb, nil)
end
  if ((matches[1]:lower() == "setrules" and not lang) or (matches[1] == 'تنظیم قوانین' and lang)) and matches[2] and is_mod(msg) then
    data[tostring(chat)]['rules'] = matches[2]
	  save_data(_config.moderation.data, data)
     if not lang then
    return "*Group rules* _has been set_"
   else 
  return "قوانین گروه ثبت شد"
   end
  end
  if (matches[1]:lower() == "rules" and not lang) or (matches[1] == 'قوانین' and lang) then
 if not data[tostring(chat)]['rules'] then
   if not lang then
     rules = "ℹ️ The Default Rules :\n1⃣ No Flood.\n2⃣ No Spam.\n3⃣ No Advertising.\n4⃣ Try to stay on topic.\n5⃣ Forbidden any racist, sexual, homophobic or gore content.\n➡️ Repeated failure to comply with these rules will cause ban."
    elseif lang then
       rules = "ℹ️ قوانین پپیشفرض:\n1⃣ ارسال پیام مکرر ممنوع.\n2⃣ اسپم ممنوع.\n3⃣ تبلیغ ممنوع.\n4⃣ سعی کنید از موضوع خارج نشید.\n5⃣ هرنوع نژاد پرستی, شاخ بازی و پورنوگرافی ممنوع .\n➡️ از قوانین پیروی کنید, در صورت عدم رعایت قوانین اول اخطار و در صورت تکرار مسدود."
 end
        else
     rules = "*Group Rules :*\n"..data[tostring(chat)]['rules']
      end
    return rules
  end
if ((matches[1]:lower() == "res" and not lang) or (matches[1] == 'کاربری' and lang)) and matches[2] and is_mod(msg) then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="res"})
  end
if ((matches[1]:lower() == "whois" and not lang) or (matches[1] == 'شناسه' and lang)) and matches[2] and string.match(matches[2], '^%d+$') and is_mod(msg) then
local texten = "Click To See The User's Profile..!"
local textfa = "کلیک کنید برای دیدن مشخصات کاربر..!"
local id = matches[2]
if not lang then
tdcli_function ({ID="SendMessage", chat_id_=msg.to.id, reply_to_message_id_=msg.id, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_= texten, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=34, user_id_=id}}}}, dl_cb, nil)
else
tdcli_function ({ID="SendMessage", chat_id_=msg.to.id, reply_to_message_id_=msg.id, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_= textfa, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=35, user_id_=id}}}}, dl_cb, nil)
end
end

if ((matches[1]:lower() == 'setchar' and not lang) or (matches[1]:lower() == 'حداکثر حروف مجاز' and lang)) then
			if not is_mod(msg) then
				return
			end
			local chars_max = matches[2]
			data[tostring(msg.to.id)]['settings']['set_char'] = chars_max
			save_data(_config.moderation.data, data)
    if not lang then
     return "*Character sensitivity* _has been set to :_ *[ "..matches[2].." ]*"
   else
     return "_حداکثر حروف مجاز در پیام تنظیم شد به :_ *[ "..matches[2].." ]*"
		end
  end
  if ((matches[1]:lower() == 'setflood' and not lang) or (matches[1] == 'تنظیم پیام مکرر' and lang)) and is_mod(msg) then
			if tonumber(matches[2]) < 1 or tonumber(matches[2]) > 50 then
				return "_Wrong number, range is_ *[2-50]*"
      end
			local flood_max = matches[2]
			data[tostring(chat)]['settings']['num_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
			if not lang then
    return "_Group_ *flood* _sensitivity has been set to :_ *[ "..matches[2].." ]*"
    else
    return '_محدودیت پیام مکرر به_ *'..tonumber(matches[2])..'* _تنظیم شد._'
    end
       end
  if ((matches[1]:lower() == 'setfloodtime' and not lang) or (matches[1] == 'تنظیم زمان بررسی' and lang)) and is_mod(msg) then
			if tonumber(matches[2]) < 2 or tonumber(matches[2]) > 10 then
				return "_Wrong number, range is_ *[2-10]*"
      end
			local time_max = matches[2]
			data[tostring(chat)]['settings']['time_check'] = time_max
			save_data(_config.moderation.data, data)
			if not lang then
    return "_Group_ *flood* _check time has been set to :_ *[ "..matches[2].." ]*"
    else
    return "_حداکثر زمان بررسی پیام های مکرر تنظیم شد به :_ *[ "..matches[2].." ]*"
    end
       end
		if ((matches[1]:lower() == 'clean' and not lang) or (matches[1] == 'پاک کردن' and lang)) and is_owner(msg) then
					if matches[2]:lower() == 'bans' or matches[2] == 'لیست بن' then
				if next(data[tostring(chat)]['banned']) == nil then
                     if not lang then
					return "_No_ *banned* _users in this group_"
					else
					return "*هیچ کاربری از این گروه محروم نشده*"
					end
				end
				for k,v in pairs(data[tostring(chat)]['banned']) do
					data[tostring(chat)]['banned'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
				if not lang then
				return "_All_ *banned* _users has been unbanned_"
				else
				return "*تمام کاربران محروم شده از گروه از محرومیت خارج شدند*"
				end
			end
			if matches[2]:lower() == 'silentlist' or matches[2] == 'لیست سکوت' then
				if next(data[tostring(chat)]['is_silent_users']) == nil then
				if not lang then
					return "_No_ *silent* _users in this group_"
					else
					return "*لیست کاربران سایلنت شده خالی است*"
					end
				end
				for k,v in pairs(data[tostring(chat)]['is_silent_users']) do
					data[tostring(chat)]['is_silent_users'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				    end
					if not lang then
				return "*Silent list* _has been cleaned_"
				else
				return "*لیست کاربران سایلنت شده پاک شد*"
				end
			    end
			if matches[2] == 'mods' or matches[2] == 'مدیران' then
				if next(data[tostring(chat)]['mods']) == nil then
				if not lang then
					return "_No_ *moderators* _in this group_"
					else
					return "هیچ مدیری برای گروه انتخاب نشده است"
					end
            end
				for k,v in pairs(data[tostring(chat)]['mods']) do
					data[tostring(chat)]['mods'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
				if not lang then
				return "_All_ *moderators* _has been demoted_"
				else
				return "تمام مدیران گروه تنزیل مقام شدند"
				end
         end
if matches[2] == 'bot' or matches[2] == 'ربات'then
  function clbot(arg, data)
    for k, v in pairs(data.members_) do
      kick_user(v.user_id_, msg.to.id)
	end
	if not lang then
    tdcli.sendMessage(msg.to.id, msg.id, 1, '_All Bots was cleared._', 1, 'md')
	else
	tdcli.sendMessage(msg.to.id, msg.id, 1, '_تمام ربات های مخرب پاکسازی شد._', 1, 'md')
	end
  end
  tdcli.getChannelMembers(msg.to.id, 0, 'Bots', 200, clbot, nil)
  end
    if matches[2] == 'blacklist' or matches[2] == 'لیست سیاه' then
    local function cleanbl(ext, res)
      if tonumber(res.total_count_) == 0 then
	  if not lang then
        return tdcli.sendMessage(ext.chat_id, ext.msg_id, 0, ' _blackList Group is empty_⚠️', 1, 'md')
		else
		return tdcli.sendMessage(ext.chat_id, ext.msg_id, 0, '⚠️ _لیست مسدودی های گروه خالی است_ !', 1, 'md')
		end
      end
      local x = 0
      for x,y in pairs(res.members_) do
        x = x + 1
        tdcli.changeChatMemberStatus(ext.chat_id, y.user_id_, 'Left', dl_cb, nil)
      end
	  if not lang then
      return tdcli.sendMessage(ext.chat_id, ext.msg_id, 0, ' _Users of the black list group was_✅ ', 1, 'md')
	  else
	  return tdcli.sendMessage(ext.chat_id, ext.msg_id, 0, '✅ _ کاربر از لیست مسدودی های گروه آزاد شدند_ !', 1, 'md')
	  end
    end
	
    return tdcli.getChannelMembers(msg.to.id, 0, 'Kicked', 200, cleanbl, {chat_id = msg.to.id, msg_id = msg.id})
  end
           if matches[2] == 'filterlist' or matches[2] == 'لیست فیلتر' then
				if next(data[tostring(chat)]['filterlist']) == nil then
				if not lang then
					return "*Filtered words list* _is empty_"
					else
					return "_لیست کلمات فیلتر شده خالی است_"
					end
				end
				for k,v in pairs(data[tostring(chat)]['filterlist']) do
					data[tostring(chat)]['filterlist'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
				if not lang then
				return "*Filtered words list* _has been cleaned_"
				else
				return "_لیست کلمات فیلتر شده پاک شد_"
				end
			end
			if matches[2] == 'rules' or matches[2] == 'قوانین' then
				if not data[tostring(chat)]['rules'] then
				if not lang then
					return "_No_ *rules* _available_"
					else
					return "قوانین برای گروه ثبت نشده است"
					end
				end
					data[tostring(chat)]['rules'] = nil
					save_data(_config.moderation.data, data)
					if not lang then
				return "*Group rules* _has been cleaned_"
				else
				return "قوانین گروه پاک شد"
				end
       end
			if matches[2] == 'welcome' or matches[2] == 'خوشآمد' then
				if not data[tostring(chat)]['setwelcome'] then
				if not lang then
					return "*Welcome Message not set*"
					else
					return "پیام خوشآمد گویی ثبت نشده است"
					end
				end
					data[tostring(chat)]['setwelcome'] = nil
					save_data(_config.moderation.data, data)
					if not lang then
				return "*Welcome message* _has been cleaned_"
				else
				return "پیام خوشآمد گویی پاک شد"
				end
       end
			if matches[2] == 'about' or matches[2] == 'درباره' then
        if msg.to.type == "chat" then
				if not data[tostring(chat)]['about'] then
				if not lang then
					return "_No_ *description* _available_"
					else
					return "پیامی مبنی بر درباره گروه ثبت نشده است"
					end
				end
					data[tostring(chat)]['about'] = nil
					save_data(_config.moderation.data, data)
        elseif msg.to.type == "channel" then
   tdcli.changeChannelAbout(chat, "", dl_cb, nil)
             end
			if not lang then
				return "*Group description* _has been cleaned_"
			else
				return "پیام مبنی بر درباره گروه پاک شد"
			end
		   	end
			if (matches[2] == 'deleted' or matches[2] == 'اکانت پاک شده') and msg.to.type == "channel" then 
  function check_deleted(TM, MR) 
    for k, v in pairs(MR.members_) do 
local function clean_cb(TM, MR)
if not MR.first_name_ then
kick_user(MR.id_, msg.to.id) 
end
end
tdcli.getUser(v.user_id_, clean_cb, nil)
 end 
if not lang then
    tdcli.sendMessage(msg.to.id, msg.id, 1, '*All Deleted Account was cleared*', 1, 'md')
else
    tdcli.sendMessage(msg.to.id, msg.id, 1, '_تمام اکانتی های پاک شده پاکسازی شدند._', 1, 'md')	
end
  end 
  tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.to.id).ID,offset_ = 0,limit_ = 1000}, check_deleted, nil)
end
        end
		if ((matches[1]:lower() == 'clean' and not lang) or (matches[1] == 'پاک کردن' and lang)) and is_admin(msg) then
			if matches[2] == 'owners' or matches[2] == 'مالکان' then
				if next(data[tostring(chat)]['owners']) == nil then
				if not lang then
					return "_No_ *owners* _in this group_"
					else
					return "مالکی برای گروه انتخاب نشده است"
					end
				end
				for k,v in pairs(data[tostring(chat)]['owners']) do
					data[tostring(chat)]['owners'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
				if not lang then
				return "_All_ *owners* _has been demoted_"
				else
				return "تمامی مالکان گروه تنزیل مقام شدند"
				end
			end
     end
if ((matches[1]:lower() == "setname" and not lang) or (matches[1] == 'تنظیم نام' and lang)) and matches[2] and is_mod(msg) then
local gp_name = matches[2]
tdcli.changeChatTitle(chat, gp_name, dl_cb, nil)
end
  if ((matches[1]:lower() == "setabout" and not lang) or (matches[1] == 'تنظیم درباره' and lang)) and matches[2] and is_mod(msg) then
     if msg.to.type == "channel" then
   tdcli.changeChannelAbout(chat, matches[2], dl_cb, nil)
    elseif msg.to.type == "chat" then
    data[tostring(chat)]['about'] = matches[2]
	  save_data(_config.moderation.data, data)
     end
     if not lang then
    return "*Group description* _has been set_"
    else
     return "پیام مبنی بر درباره گروه ثبت شد"
      end
  end
  if ((matches[1]:lower() == "about" and not lang) or (matches[1] == 'درباره' and lang)) and msg.to.type == "chat" then
 if not data[tostring(chat)]['about'] then
     if not lang then
     about = "_No_ *description* _available_"
      elseif lang then
      about = "پیامی مبنی بر درباره گروه ثبت نشده است"
       end
        else
     about = "*Group Description :*\n"..data[tostring(chat)]['about']
      end
    return about
  end
  if ((matches[1]:lower() == 'filter' and not lang) or (matches[1] == 'فیلتر' and lang))and is_mod(msg) then
    return filter_word(msg, matches[2])
  end
  if ((matches[1]:lower() == 'unfilter' and not lang) or (matches[1] == 'حذف فیلتر' and lang))and is_mod(msg) then
    return unfilter_word(msg, matches[2])
  end
  if ((matches[1]:lower() == 'config' and not lang) or (matches[1] == 'پیکربندی' and lang)) and is_admin(msg) then
tdcli.getChannelMembers(msg.to.id, 0, 'Administrators', 200, config_cb, {chat_id=msg.to.id})
  end
  if ((matches[1]:lower() == 'filterlist' and not lang) or (matches[1] == 'لیست فیلتر' and lang)) and is_mod(msg) then
    return filter_list(msg)
  end
if (matches[1]:lower() == "modlist" and not lang) or (matches[1] == 'لیست مدیران' and lang) then
return modlist(msg)
end
if ((matches[1]:lower() == "whitelist" and not lang) or (matches[1] == 'لیست سفید' and lang)) and not matches[2] then
return whitelist(msg.to.id)
end
if ((matches[1]:lower() == "ownerlist" and not lang) or (matches[1] == 'لیست مالکان' and lang)) and is_owner(msg) then
return ownerlist(msg)
end
if ((matches[1]:lower() == "option" and not lang) or (matches[1] == 'تنظیمات کلی' and lang)) and is_mod(msg) then
local function inline_query_cb(arg, data)
      if data.results_ and data.results_[0] then
tdcli.sendInlineQueryResultMessage(msg.to.id, 0, 0, 1, data.inline_query_id_, data.results_[0].id_, dl_cb, nil)
    else
    if not lang then
    text = "*Helper is offline*\n\n"
        elseif lang then
    text = "_ربات هلپر خاموش است_\n\n"
    end
  return tdcli.sendMessage(msg.to.id, msg.id, 0, text, 0, "md")
   end
end
tdcli.getInlineQueryResults(helper_id, msg.to.id, 0, 0, msg.to.id, 0, inline_query_cb, nil)
end
if ((matches[1]:lower() == "help" and not lang) or (matches[1] == 'راهنما' and lang)) and is_mod(msg) then
return '`🔖 برای دریافت راهنما لطفا از دستور زیر استفاده کنید :`\n*"option"\n"تنظیمات کلی"*'
end
end
if ((matches[1]:lower() == "settings" and not lang) or (matches[1] == 'تنظیمات' and lang)) and is_mod(msg) then
return group_settings(msg, target)
end
if (matches[1]:lower() == "setlang") and is_owner(msg) then
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if matches[2] == "fa" then
redis:set(hash, true)
return "*زبان گروه تنظیم شد به : فارسی*"
end
end
if (matches[1] == 'زبان انگلیسی') and is_owner(msg) then
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 redis:del(hash)
return "_Group Language Set To:_ EN"
end
if ((matches[1]:lower() == 'setwarn' and not lang) or (matches[1] == "حداکثر اخطار" and lang)) and is_owner(msg) then
			if tonumber(matches[2]) < 1 or tonumber(matches[2]) > 20 then
     if not lang then
				return "`Wroɴɢ ɴυмвer, rαɴɢe ιѕ` *[1-20]*"
    else
				return "`لطفا عددی بین` *[1-20]* `را انتخاب کنید`"
      end
    end
			local warn_max = matches[2]
   redis:set('max_warn:'..msg.to.id, warn_max)
    if not lang then
     return "*Wαrɴ Mαхιмυм* `Hαѕ Beeɴ Seт To :` *[*`"..matches[2].."`*]*"
   else
     return "`حداکثر اخطار تنظیم شد به :` *[*`"..matches[2].."`*]*"
		end
end
 if ((matches[1]:lower() == 'mutetime' and not lang) or (matches[1] == 'زمان بیصدا' and lang)) and is_mod(msg) then
local hash = 'muteall:'..msg.to.id
local hour = tonumber(matches[2])
local num1 = (tonumber(hour) * 3600)
local minutes = tonumber(matches[3])
local num2 = (tonumber(minutes) * 60)
local second = tonumber(matches[4])
local num3 = tonumber(second) 
local num4 = tonumber(num1 + num2 + num3)
redis:setex(hash, num4, true)
if not lang then
 return "_Mute all has been enabled for_ \n⏺ *hours :* `"..matches[2].."`\n⏺ *minutes :* `"..matches[3].."`\n⏺ *seconds :* `"..matches[4].."`"..MaTaDoRpm
 elseif lang then
 return "بی صدا کردن فعال شد 🤖✅\nدر \n⏺ ساعت : "..matches[2].."\n⏺ دقیقه : "..matches[3].."\n⏺ ثانیه : "..matches[4]..MaTaDoRpm
 end
 end
 if ((matches[1]:lower() == 'mutehours' and not lang) or (matches[1]== 'ساعت بیصدا' and lang)) and is_mod(msg) then
       local hash = 'muteall:'..msg.to.id
local hour = matches[2]
local num1 = tonumber(hour) * 3600
local num4 = tonumber(num1)
redis:setex(hash, num4, true)
if not lang then
 return "Mute all has been enabled for \n⏺ hours : "..matches[2]..MaTaDoRpm
 elseif lang then
 return "بی صدا کردن فعال شد 🤖✅\nدر \n⏺ ساعت : "..matches[2]..MaTaDoRpm
 end
 end
  if ((matches[1]:lower() == 'muteminutes' and not lang) or (matches[1]== 'دقیقه بیصدا' and lang))  and is_mod(msg) then
 local hash = 'muteall:'..msg.to.id
local minutes = matches[2]
local num2 = tonumber(minutes) * 60
local num4 = tonumber(num2)
redis:setex(hash, num4, true)
if not lang then
 return "Mute all has been enabled for \n⏺ minutes : "..matches[2]..MaTaDoRpm
 elseif lang then
 return "بی صدا کردن فعال شد 🤖✅\nدر \n⏺ دقیقه : "..matches[2]..MaTaDoRpm
 end
 end
  if ((matches[1]:lower() == 'muteseconds' and not lang) or (matches[1] == 'ثانیه بیصدا' and lang))  and is_mod(msg) then
       local hash = 'muteall:'..msg.to.id
local second = matches[2]
local num3 = tonumber(second) 
local num4 = tonumber(num3)
redis:setex(hash, num3, true)
if not lang then
 return "Mute all has been enabled for \n⏺ seconds : "..matches[2]..MaTaDoRpm
 elseif lang then
 return "بی صدا کردن فعال شد 🤖✅\nدر \n⏺ ثانیه : "..matches[2]..MaTaDoRpm
 end
 end
 if ((matches[1]:lower() == 'muteall' and not lang) or (matches[1] == 'موقعیت' and lang)) and ((matches[2]:lower() == 'status' and not lang) or (matches[2] == 'بیصدا' and not lang)) and is_mod(msg) then
         local hash = 'muteall:'..msg.to.id
      local mute_time = redis:ttl(hash)
		
		if tonumber(mute_time) < 0 then
		if not lang then
		return '_Mute All is Disable._'
		else
		return '_بیصدا بودن گروه غیر فعال است  ♻️⚠️._'
		end
		else
		if not lang then
          return mute_time.." Sec"
		  elseif lang then
		  return mute_time.."ثانیه"
		end
		end
  end
--------------------------------
    if ((matches[1]:lower() == 'rmsg' and not lang) or (matches[1] == 'پاکسازی' and lang)) and is_mod(msg) then
       if tostring(msg.to.id):match("^-100") then 
            if tonumber(matches[2]) > 1000 or tonumber(matches[2]) < 1 then
                return  '🚫 *1000*> _تعداد پیام های قابل پاک سازی در هر دفعه_ >*1* 🚫'
            else
			if not lang then  
				tdcli.getChatHistory(msg.to.id, msg.id,0 , 100, delmsg, {msgs=matches[2]})
				return "`"..matches[2].." `A recent message was cleared"
				else
				tdcli.getChatHistory(msg.to.id, msg.id,0 , 100, delmsg, {msgs=matches[2]})
				return "`"..matches[2].." `*پیام اخیر پاکسازی شد*"
				end
            end
        else
            return '⚠️ _این قابلیت فقط در سوپرگروه ممکن است_ ⚠️'
			
        end
    end
--------------------------------
	if ((matches[1]:lower() == "calc" and not lang) or (matches[1] == "حساب کن" and lang)) and matches[2] then 
		if msg.to.type == "pv" then 
			return 
       end
		return calc(matches[2])
	end
--------------------------------
	if (matches[1]:lower() == 'praytime' and not lang) or (matches[1]:lower() == 'azan' and lang) or (matches[1] == 'ساعات شرعی' and lang) or (matches[1] == 'اذان' and lang) then
		if matches[2] then
			city = matches[2]
		elseif not matches[2] then
			city = 'Tehran'
		end
		local lat,lng,url	= get_staticmap(city)
		local dumptime = run_bash('date +%s')
		local code = http.request('http://api.aladhan.com/timings/'..dumptime..'?latitude='..lat..'&longitude='..lng..'&timezonestring=Asia/Tehran&method=7')
		local jdat = json:decode(code)
		local data = jdat.data.timings
		local text = 'شهر: '..city
		text = text..'\nاذان صبح: '..data.Fajr
		text = text..'\nطلوع آفتاب: '..data.Sunrise
		text = text..'\nاذان ظهر: '..data.Dhuhr
		text = text..'\nغروب آفتاب: '..data.Sunset
		text = text..'\nاذان مغرب: '..data.Maghrib
		text = text..'\nعشاء : '..data.Isha
		return tdcli.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
	end
--------------------------------
	if (matches[1]:lower() == 'weather' and not lang) or (matches[1] == "اب و هوا" and lang) then
		city = matches[2]
		local wtext = get_weather(city)
		if not wtext then
			wtext = 'مکان وارد شده صحیح نیست'
		end
		return wtext
	end
--------------------------------
	if (matches[1]:lower() == 'time' and not lang) or (matches[1] == "ساعت" and lang) then
	local url , res = http.request('http://probot.000webhostapp.com/api/time.php/')
if res ~= 200 then return "No connection" end

local jdat = json:decode(url)
local text = '*Ir Time:* _'..jdat.FAtime..'_\n*Ir Data:* _'..jdat.FAdate..'_\n------------\n*En Time:* _'..jdat.ENtime..'_\n *En Data:* _'..jdat.ENdate.. '_\n'
  tdcli.sendMessage(msg.chat_id_, 0, 1, text, 1, 'md')
end
--------------------------------
if (matches[1]:lower() == 'voice' and not lang) or (matches[1] == "تبدیل به صدا" and lang) then
 local text = matches[2]
    textc = text:gsub(' ','.')
    
  if msg.to.type == 'pv' then 
      return nil
      else
  local url = "http://tts.baidu.com/text2audio?lan=en&ie=UTF-8&text="..textc
  local file = download_to_file(url,'MR-</TeaM>.mp3')
 				tdcli.sendDocument(msg.to.id, 0, 0, 1, nil, file, '', dl_cb, nil)
   end
end

 --------------------------------
	if (matches[1]:lower() == "tr" and not lang) or (matches[1] == "ترجمه" and lang) then 
		url = https.request('https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20160119T111342Z.fd6bf13b3590838f.6ce9d8cca4672f0ed24f649c1b502789c9f4687a&format=plain&lang='..URL.escape(matches[2])..'&text='..URL.escape(matches[3]))
		data = json:decode(url)
		return 'زبان : '..data.lang..'\nترجمه : '..data.text[1]..''
	end
--------------------------------
if (matches[1]:lower() == 'short' and not lang) or (matches[1]:lower() == 'لینک کوتاه' and lang) then
		if matches[2]:match("[Hh][Tt][Tt][Pp][Ss]://") then
			shortlink = matches[2]
		elseif not matches[2]:match("[Hh][Tt][Tt][Pp][Ss]://") then
			shortlink = "https://"..matches[2]
		end
		local yon = http.request('http://api.yon.ir/?url='..URL.escape(shortlink))
		local jdat = json:decode(yon)
		local bitly = https.request('https://api-ssl.bitly.com/v3/shorten?access_token=f2d0b4eabb524aaaf22fbc51ca620ae0fa16753d&longUrl='..URL.escape(shortlink))
		local data = json:decode(bitly)
		local u2s = http.request('http://u2s.ir/?api=1&return_text=1&url='..URL.escape(shortlink))
		local llink = http.request('http://llink.ir/yourls-api.php?signature=a13360d6d8&action=shorturl&url='..URL.escape(shortlink)..'&format=simple')
		local text = ' 🌐لینک اصلی :\n'..check_markdown(data.data.long_url)..'\n\nلینکهای کوتاه شده با 4 سایت کوتاه ساز لینک : \n》کوتاه شده با bitly :\n___________________________\n'..(check_markdown(data.data.url) or '---')..'\n___________________________\n》کوتاه شده با u2s :\n'..(check_markdown(u2s) or '---')..'\n___________________________\n》کوتاه شده با llink : \n'..(check_markdown(llink) or '---')..'\n___________________________\n》لینک کوتاه شده با yon : \nyon.ir/'..(check_markdown(jdat.output) or '---')..''
		return tdcli.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
		end
--------------------------------
	if (matches[1]:lower() == "sticker" and not lang) or (matches[1] == "استیکر" and lang) then 
local logo = {'comics-logo','water-logo','3d-logo','blackbird-logo','runner-logo','graffiti-burn-logo','electric','standing3d-logo','style-logo','steel-logo','fluffy-logo','surfboard-logo','orlando-logo','fire-logo','clan-logo','chrominium-logo','harry-potter-logo','amped-logo','inferno-logo','uprise-logo','winner-logo','star-wars-logo','silver-logo','Design-Dance'} 
local text = URL.escape(matches[2])
local url = 'http://www.flamingtext.com/net-fu/image_output.cgi?_comBuyRedirect=false&script='..logo[math.random(#logo)]..'&text='..text..'&symbol_tagname=popular&fontsize=100&fontname=futura_poster&fontname_tagname=cool&textBorder=15&growSize=0&antialias=on&hinting=on&justify=2&letterSpacing=0&lineSpacing=0&textSlant=0&textVerticalSlant=0&textAngle=0&textOutline=off&textOutline=false&textOutlineSize=2&textColor=%230000CC&angle=0&blueFlame=on&blueFlame=false&framerate=100&frames=5&pframes=5&oframes=4&distance=2&transparent=off&transparent=false&extAnim=gif&animLoop=on&animLoop=false&defaultFrameRate=75&doScale=off&scaleWidth=400&scaleHeight=200&&_=1469943010141' 
local title , res = http.request(url) 
local jdat = json:decode(title) 
local sticker = jdat.src 
local file = download_to_file(sticker,'byroo.webp') 
     tdcli.sendDocument(msg.chat_id_, 0, 0, 1, nil, file, '', dl_cb, nil) 
end
if (matches[1]:lower() == "gif" and not lang) or (matches[1] == "گیف" and lang) then
        local modes = {'memories-anim-logo','alien-glow-anim-logo','flash-anim-logo','flaming-logo','whirl-anim-logo','highlight-anim-logo','burn-in-anim-logo','shake-anim-logo','inner-fire-anim-logo','jump-anim-logo'}
        local text = URL.escape(matches[2]) 
        local url2 = 'http://www.flamingtext.com/net-fu/image_output.cgi?_comBuyRedirect=false&script='..modes[math.random(#modes)]..'&text='..text..'&symbol_tagname=popular&fontsize=70&fontname=futura_poster&fontname_tagname=cool&textBorder=15&growSize=0&antialias=on&hinting=on&justify=2&letterSpacing=0&lineSpacing=0&textSlant=0&textVerticalSlant=0&textAngle=0&textOutline=off&textOutline=false&textOutlineSize=2&textColor=%230000CC&angle=0&blueFlame=on&blueFlame=false&framerate=75&frames=5&pframes=5&oframes=4&distance=2&transparent=off&transparent=false&extAnim=gif&animLoop=on&animLoop=false&defaultFrameRate=75&doScale=off&scaleWidth=240&scaleHeight=120&&_=1469943010141'
        local title , res = http.request(url2)
        local jdat = json:decode(title)
        local gif = jdat.src
        local file = download_to_file(gif,'byroo.gif')
        tdcli.sendDocument(msg.chat_id_, 0, 0, 1, nil, file, '', dl_cb, nil)
      end
--------------------------------
if (matches[1]:lower() == "write" and not lang) or (matches[1] == "نوشتن" and lang) then

	if #matches < 2 then
		return "بعد از این دستور، با قید یک فاصله کلمه یا جمله ی مورد نظر را جهت زیبا نویسی وارد کنید"
	end
	if string.len(matches[2]) > 20 then
		 tdcli.sendMessage(msg.chat_id_, 0, 1, "حداکثر حروف مجاز 20 کاراکتر انگلیسی و عدد است", 1, 'html')
	end
	local font_base = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,9,8,7,6,5,4,3,2,1,.,_"
	local font_hash = "z,y,x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,Z,Y,X,W,V,U,T,S,R,Q,P,O,N,M,L,K,J,I,H,G,F,E,D,C,B,A,0,1,2,3,4,5,6,7,8,9,.,_"
	local fonts = {
		"ⓐ,ⓑ,ⓒ,ⓓ,ⓔ,ⓕ,ⓖ,ⓗ,ⓘ,ⓙ,ⓚ,ⓛ,ⓜ,ⓝ,ⓞ,ⓟ,ⓠ,ⓡ,ⓢ,ⓣ,ⓤ,ⓥ,ⓦ,ⓧ,ⓨ,ⓩ,ⓐ,ⓑ,ⓒ,ⓓ,ⓔ,ⓕ,ⓖ,ⓗ,ⓘ,ⓙ,ⓚ,ⓛ,ⓜ,ⓝ,ⓞ,ⓟ,ⓠ,ⓡ,ⓢ,ⓣ,ⓤ,ⓥ,ⓦ,ⓧ,ⓨ,ⓩ,⓪,➈,➇,➆,➅,➄,➃,➂,➁,➀,●,_",
		"⒜,⒝,⒞,⒟,⒠,⒡,⒢,⒣,⒤,⒥,⒦,⒧,⒨,⒩,⒪,⒫,⒬,⒭,⒮,⒯,⒰,⒱,⒲,⒳,⒴,⒵,⒜,⒝,⒞,⒟,⒠,⒡,⒢,⒣,⒤,⒥,⒦,⒧,⒨,⒩,⒪,⒫,⒬,⒭,⒮,⒯,⒰,⒱,⒲,⒳,⒴,⒵,⓪,⑼,⑻,⑺,⑹,⑸,⑷,⑶,⑵,⑴,.,_",
		"α,в,c,∂,є,ƒ,g,н,ι,נ,к,ℓ,м,η,σ,ρ,q,я,ѕ,т,υ,ν,ω,χ,у,z,α,в,c,∂,є,ƒ,g,н,ι,נ,к,ℓ,м,η,σ,ρ,q,я,ѕ,т,υ,ν,ω,χ,у,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"α,в,c,d,e,ғ,ɢ,н,ι,j,ĸ,l,м,ɴ,o,p,q,r,ѕ,т,υ,v,w,х,y,z,α,в,c,d,e,ғ,ɢ,н,ι,j,ĸ,l,м,ɴ,o,p,q,r,ѕ,т,υ,v,w,х,y,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"α,в,¢,đ,e,f,g,ħ,ı,נ,κ,ł,м,и,ø,ρ,q,я,š,т,υ,ν,ω,χ,ч,z,α,в,¢,đ,e,f,g,ħ,ı,נ,κ,ł,м,и,ø,ρ,q,я,š,т,υ,ν,ω,χ,ч,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ą,ҍ,ç,ժ,ҽ,ƒ,ց,հ,ì,ʝ,ҟ,Ӏ,ʍ,ղ,օ,ք,զ,ɾ,ʂ,է,մ,ѵ,ա,×,վ,Հ,ą,ҍ,ç,ժ,ҽ,ƒ,ց,հ,ì,ʝ,ҟ,Ӏ,ʍ,ղ,օ,ք,զ,ɾ,ʂ,է,մ,ѵ,ա,×,վ,Հ,⊘,९,𝟠,7,Ϭ,Ƽ,५,Ӡ,ϩ,𝟙,.,_",		"ค,ც,८,ძ,૯,Բ,૭,Һ,ɿ,ʆ,қ,Ն,ɱ,Ո,૦,ƿ,ҩ,Ր,ς,੮,υ,౮,ω,૪,ע,ઽ,ค,ც,८,ძ,૯,Բ,૭,Һ,ɿ,ʆ,қ,Ն,ɱ,Ո,૦,ƿ,ҩ,Ր,ς,੮,υ,౮,ω,૪,ע,ઽ,0,9,8,7,6,5,4,3,2,1,.,_",
		"α,ß,ς,d,ε,ƒ,g,h,ï,յ,κ,ﾚ,m,η,⊕,p,Ω,r,š,†,u,∀,ω,x,ψ,z,α,ß,ς,d,ε,ƒ,g,h,ï,յ,κ,ﾚ,m,η,⊕,p,Ω,r,š,†,u,∀,ω,x,ψ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ค,๒,ς,๔,є,Ŧ,ɠ,ђ,เ,ן,к,l,๓,ภ,๏,թ,ợ,г,ร,t,ย,v,ฬ,x,ץ,z,ค,๒,ς,๔,є,Ŧ,ɠ,ђ,เ,ן,к,l,๓,ภ,๏,թ,ợ,г,ร,t,ย,v,ฬ,x,ץ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ﾑ,乃,ζ,Ð,乇,ｷ,Ǥ,ん,ﾉ,ﾌ,ズ,ﾚ,ᄊ,刀,Ծ,ｱ,Q,尺,ㄎ,ｲ,Ц,Џ,Щ,ﾒ,ﾘ,乙,ﾑ,乃,ζ,Ð,乇,ｷ,Ǥ,ん,ﾉ,ﾌ,ズ,ﾚ,ᄊ,刀,Ծ,ｱ,q,尺,ㄎ,ｲ,Ц,Џ,Щ,ﾒ,ﾘ,乙,ᅙ,9,8,ᆨ,6,5,4,3,ᆯ,1,.,_",
		"α,β,c,δ,ε,Ŧ,ĝ,h,ι,j,κ,l,ʍ,π,ø,ρ,φ,Ʀ,$,†,u,υ,ω,χ,ψ,z,α,β,c,δ,ε,Ŧ,ĝ,h,ι,j,κ,l,ʍ,π,ø,ρ,φ,Ʀ,$,†,u,υ,ω,χ,ψ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ձ,ъ,ƈ,ժ,ε,բ,ց,հ,ﻨ,յ,ĸ,l,ო,ռ,օ,թ,զ,г,ร,է,ս,ν,ա,×,ყ,২,ձ,ъ,ƈ,ժ,ε,բ,ց,հ,ﻨ,յ,ĸ,l,ო,ռ,օ,թ,զ,г,ร,է,ս,ν,ա,×,ყ,২,0,9,8,7,6,5,4,3,2,1,.,_",
		"Λ,ɓ,¢,Ɗ,£,ƒ,ɢ,ɦ,ĩ,ʝ,Қ,Ł,ɱ,ה,ø,Ṗ,Ҩ,Ŕ,Ş,Ŧ,Ū,Ɣ,ω,Ж,¥,Ẑ,Λ,ɓ,¢,Ɗ,£,ƒ,ɢ,ɦ,ĩ,ʝ,Қ,Ł,ɱ,ה,ø,Ṗ,Ҩ,Ŕ,Ş,Ŧ,Ū,Ɣ,ω,Ж,¥,Ẑ,0,9,8,7,6,5,4,3,2,1,.,_",
		"Λ,Б,Ͼ,Ð,Ξ,Ŧ,G,H,ł,J,К,Ł,M,Л,Ф,P,Ǫ,Я,S,T,U,V,Ш,Ж,Џ,Z,Λ,Б,Ͼ,Ð,Ξ,Ŧ,g,h,ł,j,К,Ł,m,Л,Ф,p,Ǫ,Я,s,t,u,v,Ш,Ж,Џ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ɐ,q,ɔ,p,ǝ,ɟ,ɓ,ɥ,ı,ſ,ʞ,ๅ,ɯ,u,o,d,b,ɹ,s,ʇ,n,ʌ,ʍ,x,ʎ,z,ɐ,q,ɔ,p,ǝ,ɟ,ɓ,ɥ,ı,ſ,ʞ,ๅ,ɯ,u,o,d,b,ɹ,s,ʇ,n,ʌ,ʍ,x,ʎ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ɒ,d,ɔ,b,ɘ,ʇ,ϱ,н,i,į,ʞ,l,м,и,o,q,p,я,ƨ,т,υ,v,w,x,γ,z,ɒ,d,ɔ,b,ɘ,ʇ,ϱ,н,i,į,ʞ,l,м,и,o,q,p,я,ƨ,т,υ,v,w,x,γ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"A̴,̴B̴,̴C̴,̴D̴,̴E̴,̴F̴,̴G̴,̴H̴,̴I̴,̴J̴,̴K̴,̴L̴,̴M̴,̴N̴,̴O̴,̴P̴,̴Q̴,̴R̴,̴S̴,̴T̴,̴U̴,̴V̴,̴W̴,̴X̴,̴Y̴,̴Z̴,̴a̴,̴b̴,̴c̴,̴d̴,̴e̴,̴f̴,̴g̴,̴h̴,̴i̴,̴j̴,̴k̴,̴l̴,̴m̴,̴n̴,̴o̴,̴p̴,̴q̴,̴r̴,̴s̴,̴t̴,̴u̴,̴v̴,̴w̴,̴x̴,̴y̴,̴z̴,̴0̴,̴9̴,̴8̴,̴7̴,̴6̴,̴5̴,̴4̴,̴3̴,̴2̴,̴1̴,̴.̴,̴_̴",
		"ⓐ,ⓑ,ⓒ,ⓓ,ⓔ,ⓕ,ⓖ,ⓗ,ⓘ,ⓙ,ⓚ,ⓛ,ⓜ,ⓝ,ⓞ,ⓟ,ⓠ,ⓡ,ⓢ,ⓣ,ⓤ,ⓥ,ⓦ,ⓧ,ⓨ,ⓩ,ⓐ,ⓑ,ⓒ,ⓓ,ⓔ,ⓕ,ⓖ,ⓗ,ⓘ,ⓙ,ⓚ,ⓛ,ⓜ,ⓝ,ⓞ,ⓟ,ⓠ,ⓡ,ⓢ,ⓣ,ⓤ,ⓥ,ⓦ,ⓧ,ⓨ,ⓩ,⓪,➈,➇,➆,➅,➄,➃,➂,➁,➀,●,_",
		"⒜,⒝,⒞,⒟,⒠,⒡,⒢,⒣,⒤,⒥,⒦,⒧,⒨,⒩,⒪,⒫,⒬,⒭,⒮,⒯,⒰,⒱,⒲,⒳,⒴,⒵,⒜,⒝,⒞,⒟,⒠,⒡,⒢,⒣,⒤,⒥,⒦,⒧,⒨,⒩,⒪,⒫,⒬,⒭,⒮,⒯,⒰,⒱,⒲,⒳,⒴,⒵,⓪,⑼,⑻,⑺,⑹,⑸,⑷,⑶,⑵,⑴,.,_",
		"α,в,c,∂,є,ƒ,g,н,ι,נ,к,ℓ,м,η,σ,ρ,q,я,ѕ,т,υ,ν,ω,χ,у,z,α,в,c,∂,є,ƒ,g,н,ι,נ,к,ℓ,м,η,σ,ρ,q,я,ѕ,т,υ,ν,ω,χ,у,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"α,в,c,ɗ,є,f,g,н,ι,נ,к,Ɩ,м,η,σ,ρ,q,я,ѕ,т,υ,ν,ω,x,у,z,α,в,c,ɗ,є,f,g,н,ι,נ,к,Ɩ,м,η,σ,ρ,q,я,ѕ,т,υ,ν,ω,x,у,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"α,в,c,d,e,ғ,ɢ,н,ι,j,ĸ,l,м,ɴ,o,p,q,r,ѕ,т,υ,v,w,х,y,z,α,в,c,d,e,ғ,ɢ,н,ι,j,ĸ,l,м,ɴ,o,p,q,r,ѕ,т,υ,v,w,х,y,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"α,Ⴆ,ƈ,ԃ,ҽ,ϝ,ɠ,ԋ,ι,ʝ,ƙ,ʅ,ɱ,ɳ,σ,ρ,ϙ,ɾ,ʂ,ƚ,υ,ʋ,ɯ,x,ყ,ȥ,α,Ⴆ,ƈ,ԃ,ҽ,ϝ,ɠ,ԋ,ι,ʝ,ƙ,ʅ,ɱ,ɳ,σ,ρ,ϙ,ɾ,ʂ,ƚ,υ,ʋ,ɯ,x,ყ,ȥ,0,9,8,7,6,5,4,3,2,1,.,_",
		"α,в,¢,đ,e,f,g,ħ,ı,נ,κ,ł,м,и,ø,ρ,q,я,š,т,υ,ν,ω,χ,ч,z,α,в,¢,đ,e,f,g,ħ,ı,נ,κ,ł,м,и,ø,ρ,q,я,š,т,υ,ν,ω,χ,ч,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ą,ɓ,ƈ,đ,ε,∱,ɠ,ɧ,ï,ʆ,ҡ,ℓ,ɱ,ŋ,σ,þ,ҩ,ŗ,ş,ŧ,ų,√,щ,х,γ,ẕ,ą,ɓ,ƈ,đ,ε,∱,ɠ,ɧ,ï,ʆ,ҡ,ℓ,ɱ,ŋ,σ,þ,ҩ,ŗ,ş,ŧ,ų,√,щ,х,γ,ẕ,0,9,8,7,6,5,4,3,2,1,.,_",
		"ą,ҍ,ç,ժ,ҽ,ƒ,ց,հ,ì,ʝ,ҟ,Ӏ,ʍ,ղ,օ,ք,զ,ɾ,ʂ,է,մ,ѵ,ա,×,վ,Հ,ą,ҍ,ç,ժ,ҽ,ƒ,ց,հ,ì,ʝ,ҟ,Ӏ,ʍ,ղ,օ,ք,զ,ɾ,ʂ,է,մ,ѵ,ա,×,վ,Հ,⊘,९,𝟠,7,Ϭ,Ƽ,५,Ӡ,ϩ,𝟙,.,_",
		"მ,ჩ,ƈ,ძ,ε,բ,ց,հ,ἶ,ʝ,ƙ,l,ო,ղ,օ,ր,գ,ɾ,ʂ,է,մ,ν,ω,ჯ,ყ,z,მ,ჩ,ƈ,ძ,ε,բ,ց,հ,ἶ,ʝ,ƙ,l,ო,ղ,օ,ր,գ,ɾ,ʂ,է,մ,ν,ω,ჯ,ყ,z,0,Գ,Ց,Դ,6,5,Վ,Յ,Զ,1,.,_",
		"ค,ც,८,ძ,૯,Բ,૭,Һ,ɿ,ʆ,қ,Ն,ɱ,Ո,૦,ƿ,ҩ,Ր,ς,੮,υ,౮,ω,૪,ע,ઽ,ค,ც,८,ძ,૯,Բ,૭,Һ,ɿ,ʆ,қ,Ն,ɱ,Ո,૦,ƿ,ҩ,Ր,ς,੮,υ,౮,ω,૪,ע,ઽ,0,9,8,7,6,5,4,3,2,1,.,_",
		"α,ß,ς,d,ε,ƒ,g,h,ï,յ,κ,ﾚ,m,η,⊕,p,Ω,r,š,†,u,∀,ω,x,ψ,z,α,ß,ς,d,ε,ƒ,g,h,ï,յ,κ,ﾚ,m,η,⊕,p,Ω,r,š,†,u,∀,ω,x,ψ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ª,b,¢,Þ,È,F,૬,ɧ,Î,j,Κ,Ļ,м,η,◊,Ƿ,ƍ,r,S,⊥,µ,√,w,×,ý,z,ª,b,¢,Þ,È,F,૬,ɧ,Î,j,Κ,Ļ,м,η,◊,Ƿ,ƍ,r,S,⊥,µ,√,w,×,ý,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"Δ,Ɓ,C,D,Σ,F,G,H,I,J,Ƙ,L,Μ,∏,Θ,Ƥ,Ⴓ,Γ,Ѕ,Ƭ,Ʊ,Ʋ,Ш,Ж,Ψ,Z,λ,ϐ,ς,d,ε,ғ,ɢ,н,ι,ϳ,κ,l,ϻ,π,σ,ρ,φ,г,s,τ,υ,v,ш,ϰ,ψ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ค,๒,ς,๔,є,Ŧ,ɠ,ђ,เ,ן,к,l,๓,ภ,๏,թ,ợ,г,ร,t,ย,v,ฬ,x,ץ,z,ค,๒,ς,๔,є,Ŧ,ɠ,ђ,เ,ן,к,l,๓,ภ,๏,թ,ợ,г,ร,t,ย,v,ฬ,x,ץ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"Λ,ß,Ƈ,D,Ɛ,F,Ɠ,Ĥ,Ī,Ĵ,Ҡ,Ŀ,M,И,♡,Ṗ,Ҩ,Ŕ,S,Ƭ,Ʊ,Ѵ,Ѡ,Ӿ,Y,Z,Λ,ß,Ƈ,D,Ɛ,F,Ɠ,Ĥ,Ī,Ĵ,Ҡ,Ŀ,M,И,♡,Ṗ,Ҩ,Ŕ,S,Ƭ,Ʊ,Ѵ,Ѡ,Ӿ,Y,Z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ﾑ,乃,ζ,Ð,乇,ｷ,Ǥ,ん,ﾉ,ﾌ,ズ,ﾚ,ᄊ,刀,Ծ,ｱ,Q,尺,ㄎ,ｲ,Ц,Џ,Щ,ﾒ,ﾘ,乙,ﾑ,乃,ζ,Ð,乇,ｷ,Ǥ,ん,ﾉ,ﾌ,ズ,ﾚ,ᄊ,刀,Ծ,ｱ,q,尺,ㄎ,ｲ,Ц,Џ,Щ,ﾒ,ﾘ,乙,ᅙ,9,8,ᆨ,6,5,4,3,ᆯ,1,.,_",
		"α,β,c,δ,ε,Ŧ,ĝ,h,ι,j,κ,l,ʍ,π,ø,ρ,φ,Ʀ,$,†,u,υ,ω,χ,ψ,z,α,β,c,δ,ε,Ŧ,ĝ,h,ι,j,κ,l,ʍ,π,ø,ρ,φ,Ʀ,$,†,u,υ,ω,χ,ψ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ค,๖,¢,໓,ē,f,ງ,h,i,ว,k,l,๓,ຖ,໐,p,๑,r,Ş,t,น,ง,ຟ,x,ฯ,ຊ,ค,๖,¢,໓,ē,f,ງ,h,i,ว,k,l,๓,ຖ,໐,p,๑,r,Ş,t,น,ง,ຟ,x,ฯ,ຊ,0,9,8,7,6,5,4,3,2,1,.,_",
		"ձ,ъ,ƈ,ժ,ε,բ,ց,հ,ﻨ,յ,ĸ,l,ო,ռ,օ,թ,զ,г,ร,է,ս,ν,ա,×,ყ,২,ձ,ъ,ƈ,ժ,ε,բ,ց,հ,ﻨ,յ,ĸ,l,ო,ռ,օ,թ,զ,г,ร,է,ս,ν,ա,×,ყ,২,0,9,8,7,6,5,4,3,2,1,.,_",
		"Â,ß,Ĉ,Ð,Є,Ŧ,Ǥ,Ħ,Ī,ʖ,Қ,Ŀ,♏,И,Ø,P,Ҩ,R,$,ƚ,Ц,V,Щ,X,￥,Ẕ,Â,ß,Ĉ,Ð,Є,Ŧ,Ǥ,Ħ,Ī,ʖ,Қ,Ŀ,♏,И,Ø,P,Ҩ,R,$,ƚ,Ц,V,Щ,X,￥,Ẕ,0,9,8,7,6,5,4,3,2,1,.,_",
		"Λ,ɓ,¢,Ɗ,£,ƒ,ɢ,ɦ,ĩ,ʝ,Қ,Ł,ɱ,ה,ø,Ṗ,Ҩ,Ŕ,Ş,Ŧ,Ū,Ɣ,ω,Ж,¥,Ẑ,Λ,ɓ,¢,Ɗ,£,ƒ,ɢ,ɦ,ĩ,ʝ,Қ,Ł,ɱ,ה,ø,Ṗ,Ҩ,Ŕ,Ş,Ŧ,Ū,Ɣ,ω,Ж,¥,Ẑ,0,9,8,7,6,5,4,3,2,1,.,_",
		"Λ,Б,Ͼ,Ð,Ξ,Ŧ,G,H,ł,J,К,Ł,M,Л,Ф,P,Ǫ,Я,S,T,U,V,Ш,Ж,Џ,Z,Λ,Б,Ͼ,Ð,Ξ,Ŧ,g,h,ł,j,К,Ł,m,Л,Ф,p,Ǫ,Я,s,t,u,v,Ш,Ж,Џ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"Թ,Յ,Շ,Ժ,ȝ,Բ,Գ,ɧ,ɿ,ʝ,ƙ,ʅ,ʍ,Ռ,Ծ,ρ,φ,Ր,Տ,Ե,Մ,ע,ա,Ճ,Վ,Հ,Թ,Յ,Շ,Ժ,ȝ,Բ,Գ,ɧ,ɿ,ʝ,ƙ,ʅ,ʍ,Ռ,Ծ,ρ,φ,Ր,Տ,Ե,Մ,ע,ա,Ճ,Վ,Հ,0,9,8,7,6,5,4,3,2,1,.,_",
		"Æ,þ,©,Ð,E,F,ζ,Ħ,Ї,¿,ズ,ᄂ,M,Ñ,Θ,Ƿ,Ø,Ґ,Š,τ,υ,¥,w,χ,y,շ,Æ,þ,©,Ð,E,F,ζ,Ħ,Ї,¿,ズ,ᄂ,M,Ñ,Θ,Ƿ,Ø,Ґ,Š,τ,υ,¥,w,χ,y,շ,0,9,8,7,6,5,4,3,2,1,.,_",
		"ɐ,q,ɔ,p,ǝ,ɟ,ɓ,ɥ,ı,ſ,ʞ,ๅ,ɯ,u,o,d,b,ɹ,s,ʇ,n,ʌ,ʍ,x,ʎ,z,ɐ,q,ɔ,p,ǝ,ɟ,ɓ,ɥ,ı,ſ,ʞ,ๅ,ɯ,u,o,d,b,ɹ,s,ʇ,n,ʌ,ʍ,x,ʎ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ɒ,d,ɔ,b,ɘ,ʇ,ϱ,н,i,į,ʞ,l,м,и,o,q,p,я,ƨ,т,υ,v,w,x,γ,z,ɒ,d,ɔ,b,ɘ,ʇ,ϱ,н,i,į,ʞ,l,м,и,o,q,p,я,ƨ,т,υ,v,w,x,γ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"4,8,C,D,3,F,9,H,!,J,K,1,M,N,0,P,Q,R,5,7,U,V,W,X,Y,2,4,8,C,D,3,F,9,H,!,J,K,1,M,N,0,P,Q,R,5,7,U,V,W,X,Y,2,0,9,8,7,6,5,4,3,2,1,.,_",
		"Λ,M,X,ʎ,Z,ɐ,q,ɔ,p,ǝ,ɟ,ƃ,ɥ,ı,ɾ,ʞ,l,ա,u,o,d,b,ɹ,s,ʇ,n,ʌ,ʍ,x,ʎ,z,Λ,M,X,ʎ,Z,ɐ,q,ɔ,p,ǝ,ɟ,ƃ,ɥ,ı,ɾ,ʞ,l,ա,u,o,d,b,ɹ,s,ʇ,n,ʌ,ʍ,x,ʎ,z,0,9,8,7,6,5,4,3,2,1,.,‾",
		"A̴,̴B̴,̴C̴,̴D̴,̴E̴,̴F̴,̴G̴,̴H̴,̴I̴,̴J̴,̴K̴,̴L̴,̴M̴,̴N̴,̴O̴,̴P̴,̴Q̴,̴R̴,̴S̴,̴T̴,̴U̴,̴V̴,̴W̴,̴X̴,̴Y̴,̴Z̴,̴a̴,̴b̴,̴c̴,̴d̴,̴e̴,̴f̴,̴g̴,̴h̴,̴i̴,̴j̴,̴k̴,̴l̴,̴m̴,̴n̴,̴o̴,̴p̴,̴q̴,̴r̴,̴s̴,̴t̴,̴u̴,̴v̴,̴w̴,̴x̴,̴y̴,̴z̴,̴0̴,̴9̴,̴8̴,̴7̴,̴6̴,̴5̴,̴4̴,̴3̴,̴2̴,̴1̴,̴.̴,̴_̴",
		"A̱,̱Ḇ,̱C̱,̱Ḏ,̱E̱,̱F̱,̱G̱,̱H̱,̱I̱,̱J̱,̱Ḵ,̱Ḻ,̱M̱,̱Ṉ,̱O̱,̱P̱,̱Q̱,̱Ṟ,̱S̱,̱Ṯ,̱U̱,̱V̱,̱W̱,̱X̱,̱Y̱,̱Ẕ,̱a̱,̱ḇ,̱c̱,̱ḏ,̱e̱,̱f̱,̱g̱,̱ẖ,̱i̱,̱j̱,̱ḵ,̱ḻ,̱m̱,̱ṉ,̱o̱,̱p̱,̱q̱,̱ṟ,̱s̱,̱ṯ,̱u̱,̱v̱,̱w̱,̱x̱,̱y̱,̱ẕ,̱0̱,̱9̱,̱8̱,̱7̱,̱6̱,̱5̱,̱4̱,̱3̱,̱2̱,̱1̱,̱.̱,̱_̱",
		"A̲,̲B̲,̲C̲,̲D̲,̲E̲,̲F̲,̲G̲,̲H̲,̲I̲,̲J̲,̲K̲,̲L̲,̲M̲,̲N̲,̲O̲,̲P̲,̲Q̲,̲R̲,̲S̲,̲T̲,̲U̲,̲V̲,̲W̲,̲X̲,̲Y̲,̲Z̲,̲a̲,̲b̲,̲c̲,̲d̲,̲e̲,̲f̲,̲g̲,̲h̲,̲i̲,̲j̲,̲k̲,̲l̲,̲m̲,̲n̲,̲o̲,̲p̲,̲q̲,̲r̲,̲s̲,̲t̲,̲u̲,̲v̲,̲w̲,̲x̲,̲y̲,̲z̲,̲0̲,̲9̲,̲8̲,̲7̲,̲6̲,̲5̲,̲4̲,̲3̲,̲2̲,̲1̲,̲.̲,̲_̲",
		"Ā,̄B̄,̄C̄,̄D̄,̄Ē,̄F̄,̄Ḡ,̄H̄,̄Ī,̄J̄,̄K̄,̄L̄,̄M̄,̄N̄,̄Ō,̄P̄,̄Q̄,̄R̄,̄S̄,̄T̄,̄Ū,̄V̄,̄W̄,̄X̄,̄Ȳ,̄Z̄,̄ā,̄b̄,̄c̄,̄d̄,̄ē,̄f̄,̄ḡ,̄h̄,̄ī,̄j̄,̄k̄,̄l̄,̄m̄,̄n̄,̄ō,̄p̄,̄q̄,̄r̄,̄s̄,̄t̄,̄ū,̄v̄,̄w̄,̄x̄,̄ȳ,̄z̄,̄0̄,̄9̄,̄8̄,̄7̄,̄6̄,̄5̄,̄4̄,̄3̄,̄2̄,̄1̄,̄.̄,̄_̄",
		"A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,0,9,8,7,6,5,4,3,2,1,.,_",
		"a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"@,♭,ḉ,ⓓ,℮,ƒ,ℊ,ⓗ,ⓘ,נ,ⓚ,ℓ,ⓜ,η,ø,℘,ⓠ,ⓡ,﹩,т,ⓤ,√,ω,ж,૪,ℨ,@,♭,ḉ,ⓓ,℮,ƒ,ℊ,ⓗ,ⓘ,נ,ⓚ,ℓ,ⓜ,η,ø,℘,ⓠ,ⓡ,﹩,т,ⓤ,√,ω,ж,૪,ℨ,0,➈,➑,➐,➅,➄,➃,➌,➁,➊,.,_",
		"@,♭,¢,ⅾ,ε,ƒ,ℊ,ℌ,ї,נ,к,ℓ,м,п,ø,ρ,ⓠ,ґ,﹩,⊥,ü,√,ω,ϰ,૪,ℨ,@,♭,¢,ⅾ,ε,ƒ,ℊ,ℌ,ї,נ,к,ℓ,м,п,ø,ρ,ⓠ,ґ,﹩,⊥,ü,√,ω,ϰ,૪,ℨ,0,9,8,7,6,5,4,3,2,1,.,_",
		"α,♭,ḉ,∂,ℯ,ƒ,ℊ,ℌ,ї,ʝ,ḱ,ℓ,м,η,ø,℘,ⓠ,я,﹩,⊥,ц,ṽ,ω,ჯ,૪,ẕ,α,♭,ḉ,∂,ℯ,ƒ,ℊ,ℌ,ї,ʝ,ḱ,ℓ,м,η,ø,℘,ⓠ,я,﹩,⊥,ц,ṽ,ω,ჯ,૪,ẕ,0,9,8,7,6,5,4,3,2,1,.,_",
		"@,ß,¢,ḓ,℮,ƒ,ℊ,ℌ,ї,נ,ḱ,ʟ,м,п,◎,℘,ⓠ,я,﹩,т,ʊ,♥️,ẘ,✄,૪,ℨ,@,ß,¢,ḓ,℮,ƒ,ℊ,ℌ,ї,נ,ḱ,ʟ,м,п,◎,℘,ⓠ,я,﹩,т,ʊ,♥️,ẘ,✄,૪,ℨ,0,9,8,7,6,5,4,3,2,1,.,_",
        "@,ß,¢,ḓ,℮,ƒ,ℊ,н,ḯ,נ,к,ℓμ,п,☺️,℘,ⓠ,я,﹩,⊥,υ,ṽ,ω,✄,૪,ℨ,@,ß,¢,ḓ,℮,ƒ,ℊ,н,ḯ,נ,к,ℓμ,п,☺️,℘,ⓠ,я,﹩,⊥,υ,ṽ,ω,✄,૪,ℨ,0,9,8,7,6,5,4,3,2,1,.,_",
        "@,ß,ḉ,ḓ,є,ƒ,ℊ,ℌ,ї,נ,ḱ,ʟ,ღ,η,◎,℘,ⓠ,я,﹩,⊥,ʊ,♥️,ω,ϰ,૪,ẕ,@,ß,ḉ,ḓ,є,ƒ,ℊ,ℌ,ї,נ,ḱ,ʟ,ღ,η,◎,℘,ⓠ,я,﹩,⊥,ʊ,♥️,ω,ϰ,૪,ẕ,0,9,8,7,6,5,4,3,2,1,.,_",
        "@,ß,ḉ,∂,ε,ƒ,ℊ,ℌ,ї,נ,ḱ,ł,ღ,и,ø,℘,ⓠ,я,﹩,т,υ,√,ω,ჯ,૪,ẕ,@,ß,ḉ,∂,ε,ƒ,ℊ,ℌ,ї,נ,ḱ,ł,ღ,и,ø,℘,ⓠ,я,﹩,т,υ,√,ω,ჯ,૪,ẕ,0,9,8,7,6,5,4,3,2,1,.,_",
        "α,♭,¢,∂,ε,ƒ,❡,н,ḯ,ʝ,ḱ,ʟ,μ,п,ø,ρ,ⓠ,ґ,﹩,т,υ,ṽ,ω,ж,૪,ẕ,α,♭,¢,∂,ε,ƒ,❡,н,ḯ,ʝ,ḱ,ʟ,μ,п,ø,ρ,ⓠ,ґ,﹩,т,υ,ṽ,ω,ж,૪,ẕ,0,9,8,7,6,5,4,3,2,1,.,_",
        "α,♭,ḉ,∂,℮,ⓕ,ⓖ,н,ḯ,ʝ,ḱ,ℓ,м,п,ø,ⓟ,ⓠ,я,ⓢ,ⓣ,ⓤ,♥️,ⓦ,✄,ⓨ,ⓩ,α,♭,ḉ,∂,℮,ⓕ,ⓖ,н,ḯ,ʝ,ḱ,ℓ,м,п,ø,ⓟ,ⓠ,я,ⓢ,ⓣ,ⓤ,♥️,ⓦ,✄,ⓨ,ⓩ,0,➒,➑,➐,➏,➄,➍,➂,➁,➀,.,_",
        "@,♭,ḉ,ḓ,є,ƒ,ⓖ,ℌ,ⓘ,נ,к,ⓛ,м,ⓝ,ø,℘,ⓠ,я,﹩,ⓣ,ʊ,√,ω,ჯ,૪,ⓩ,@,♭,ḉ,ḓ,є,ƒ,ⓖ,ℌ,ⓘ,נ,к,ⓛ,м,ⓝ,ø,℘,ⓠ,я,﹩,ⓣ,ʊ,√,ω,ჯ,૪,ⓩ,0,➒,➇,➆,➅,➄,➍,➌,➋,➀,.,_",
        "α,♭,ⓒ,∂,є,ⓕ,ⓖ,ℌ,ḯ,ⓙ,ḱ,ł,ⓜ,и,ⓞ,ⓟ,ⓠ,ⓡ,ⓢ,⊥,ʊ,ⓥ,ⓦ,ж,ⓨ,ⓩ,α,♭,ⓒ,∂,є,ⓕ,ⓖ,ℌ,ḯ,ⓙ,ḱ,ł,ⓜ,и,ⓞ,ⓟ,ⓠ,ⓡ,ⓢ,⊥,ʊ,ⓥ,ⓦ,ж,ⓨ,ⓩ,0,➒,➑,➆,➅,➎,➍,➌,➁,➀,.,_",
		"ⓐ,ß,ḉ,∂,℮,ⓕ,❡,ⓗ,ї,נ,ḱ,ł,μ,η,ø,ρ,ⓠ,я,﹩,ⓣ,ц,√,ⓦ,✖️,૪,ℨ,ⓐ,ß,ḉ,∂,℮,ⓕ,❡,ⓗ,ї,נ,ḱ,ł,μ,η,ø,ρ,ⓠ,я,﹩,ⓣ,ц,√,ⓦ,✖️,૪,ℨ,0,➒,➑,➐,➅,➄,➍,➂,➁,➊,.,_",
        "α,ß,ⓒ,ⅾ,ℯ,ƒ,ℊ,ⓗ,ї,ʝ,к,ʟ,ⓜ,η,ⓞ,℘,ⓠ,ґ,﹩,т,υ,ⓥ,ⓦ,ж,ⓨ,ẕ,α,ß,ⓒ,ⅾ,ℯ,ƒ,ℊ,ⓗ,ї,ʝ,к,ʟ,ⓜ,η,ⓞ,℘,ⓠ,ґ,﹩,т,υ,ⓥ,ⓦ,ж,ⓨ,ẕ,0,➈,➇,➐,➅,➎,➍,➌,➁,➊,.,_",
        "@,♭,ḉ,ⅾ,є,ⓕ,❡,н,ḯ,נ,ⓚ,ⓛ,м,ⓝ,☺️,ⓟ,ⓠ,я,ⓢ,⊥,υ,♥️,ẘ,ϰ,૪,ⓩ,@,♭,ḉ,ⅾ,є,ⓕ,❡,н,ḯ,נ,ⓚ,ⓛ,м,ⓝ,☺️,ⓟ,ⓠ,я,ⓢ,⊥,υ,♥️,ẘ,ϰ,૪,ⓩ,0,➒,➑,➆,➅,➄,➃,➂,➁,➀,.,_",
        "ⓐ,♭,ḉ,ⅾ,є,ƒ,ℊ,ℌ,ḯ,ʝ,ḱ,ł,μ,η,ø,ⓟ,ⓠ,ґ,ⓢ,т,ⓤ,√,ⓦ,✖️,ⓨ,ẕ,ⓐ,♭,ḉ,ⅾ,є,ƒ,ℊ,ℌ,ḯ,ʝ,ḱ,ł,μ,η,ø,ⓟ,ⓠ,ґ,ⓢ,т,ⓤ,√,ⓦ,✖️,ⓨ,ẕ,0,➈,➇,➐,➅,➄,➃,➂,➁,➀,.,_",
		"ձ,ъƈ,ժ,ε,բ,ց,հ,ﻨ,յ,ĸ,l,ო,ռ,օ,թ,զ,г,ร,է,ս,ν,ա,×,ყ,২,ձ,ъƈ,ժ,ε,բ,ց,հ,ﻨ,յ,ĸ,l,ო,ռ,օ,թ,զ,г,ร,է,ս,ν,ա,×,ყ,২,0,9,8,7,6,5,4,3,2,1,.,_",
"λ,ϐ,ς,d,ε,ғ,ϑ,ɢ,н,ι,ϳ,κ,l,ϻ,π,σ,ρ,φ,г,s,τ,υ,v,ш,ϰ,ψ,z,λ,ϐ,ς,d,ε,ғ,ϑ,ɢ,н,ι,ϳ,κ,l,ϻ,π,σ,ρ,φ,г,s,τ,υ,v,ш,ϰ,ψ,z,0,9,8,7,6,5,4,3,2,1,.,_",
"ค,๒,ς,๔,є,Ŧ,ɠ,ђ,เ,ן,к,l,๓,ภ,๏,թ,ợ,г,ร,t,ย,v,ฬ,x,ץ,z,ค,๒,ς,๔,є,Ŧ,ɠ,ђ,เ,ן,к,l,๓,ภ,๏,թ,ợ,г,ร,t,ย,v,ฬ,x,ץ,z,0,9,8,7,6,5,4,3,2,1,.,_",
"მ,ჩ,ƈძ,ε,բ,ց,հ,ἶ,ʝ,ƙ,l,ო,ղ,օ,ր,գ,ɾ,ʂ,է,մ,ν,ω,ჯ,ყ,z,მ,ჩ,ƈძ,ε,բ,ց,հ,ἶ,ʝ,ƙ,l,ო,ղ,օ,ր,գ,ɾ,ʂ,է,մ,ν,ω,ჯ,ყ,z,0,Գ,Ց,Դ,6,5,Վ,Յ,Զ,1,.,_",
"ค,ც,८,ძ,૯,Բ,૭,Һ,ɿ,ʆ,қ,Ն,ɱ,Ո,૦,ƿ,ҩ,Ր,ς,੮,υ,౮,ω,૪,ע,ઽ,ค,ც,८,ძ,૯,Բ,૭,Һ,ɿ,ʆ,қ,Ն,ɱ,Ո,૦,ƿ,ҩ,Ր,ς,੮,υ,౮,ω,૪,ע,ઽ,0,9,8,7,6,5,4,3,2,1,.,_",
"Λ,Б,Ͼ,Ð,Ξ,Ŧ,g,h,ł,j,К,Ł,m,Л,Ф,p,Ǫ,Я,s,t,u,v,Ш,Ж,Џ,z,Λ,Б,Ͼ,Ð,Ξ,Ŧ,g,h,ł,j,К,Ł,m,Л,Ф,p,Ǫ,Я,s,t,u,v,Ш,Ж,Џ,z,0,9,8,7,6,5,4,3,2,1,.,_",
"λ,ß,Ȼ,ɖ,ε,ʃ,Ģ,ħ,ί,ĵ,κ,ι,ɱ,ɴ,Θ,ρ,ƣ,ર,Ș,τ,Ʋ,ν,ώ,Χ,ϓ,Հ,λ,ß,Ȼ,ɖ,ε,ʃ,Ģ,ħ,ί,ĵ,κ,ι,ɱ,ɴ,Θ,ρ,ƣ,ર,Ș,τ,Ʋ,ν,ώ,Χ,ϓ,Հ,0,9,8,7,6,5,4,3,2,1,.,_",
"ª,b,¢,Þ,È,F,૬,ɧ,Î,j,Κ,Ļ,м,η,◊,Ƿ,ƍ,r,S,⊥,µ,√,w,×,ý,z,ª,b,¢,Þ,È,F,૬,ɧ,Î,j,Κ,Ļ,м,η,◊,Ƿ,ƍ,r,S,⊥,µ,√,w,×,ý,z,0,9,8,7,6,5,4,3,2,1,.,_",
"Թ,Յ,Շ,Ժ,ȝ,Բ,Գ,ɧ,ɿ,ʝ,ƙ,ʅ,ʍ,Ռ,Ծ,ρ,φ,Ր,Տ,Ե,Մ,ע,ա,Ճ,Վ,Հ,Թ,Յ,Շ,Ժ,ȝ,Բ,Գ,ɧ,ɿ,ʝ,ƙ,ʅ,ʍ,Ռ,Ծ,ρ,φ,Ր,Տ,Ե,Մ,ע,ա,Ճ,Վ,Հ,0,9,8,7,6,5,4,3,2,1,.,_",
"Λ,Ϧ,ㄈ,Ð,Ɛ,F,Ɠ,н,ɪ,ﾌ,Қ,Ł,௱,Л,Ø,þ,Ҩ,尺,ら,Ť,Ц,Ɣ,Ɯ,χ,Ϥ,Ẕ,Λ,Ϧ,ㄈ,Ð,Ɛ,F,Ɠ,н,ɪ,ﾌ,Қ,Ł,௱,Л,Ø,þ,Ҩ,尺,ら,Ť,Ц,Ɣ,Ɯ,χ,Ϥ,Ẕ,0,9,8,7,6,5,4,3,2,1,.,_",
"Ǟ,в,ट,D,ę,բ,g,৸,i,j,κ,l,ɱ,П,Φ,Р,q,Я,s,Ʈ,Ц,v,Щ,ж,ყ,ւ,Ǟ,в,ट,D,ę,բ,g,৸,i,j,κ,l,ɱ,П,Φ,Р,q,Я,s,Ʈ,Ц,v,Щ,ж,ყ,ւ,0,9,8,7,6,5,4,3,2,1,.,_",
"ɒ,d,ɔ,b,ɘ,ʇ,ϱ,н,i,į,ʞ,l,м,и,o,q,p,я,ƨ,т,υ,v,w,x,γ,z,ɒ,d,ɔ,b,ɘ,ʇ,ϱ,н,i,į,ʞ,l,м,и,o,q,p,я,ƨ,т,υ,v,w,x,γ,z,0,9,8,7,6,5,4,3,2,1,.,_",
"Æ,þ,©,Ð,E,F,ζ,Ħ,Ї,¿,ズ,ᄂ,M,Ñ,Θ,Ƿ,Ø,Ґ,Š,τ,υ,¥,w,χ,y,շ,Æ,þ,©,Ð,E,F,ζ,Ħ,Ї,¿,ズ,ᄂ,M,Ñ,Θ,Ƿ,Ø,Ґ,Š,τ,υ,¥,w,χ,y,շ,0,9,8,7,6,5,4,3,2,1,.,_",
"ª,ß,¢,ð,€,f,g,h,¡,j,k,|,m,ñ,¤,Þ,q,®,$,t,µ,v,w,×,ÿ,z,ª,ß,¢,ð,€,f,g,h,¡,j,k,|,m,ñ,¤,Þ,q,®,$,t,µ,v,w,×,ÿ,z,0,9,8,7,6,5,4,3,2,1,.,_",
"ɐ,q,ɔ,p,ǝ,ɟ,ɓ,ɥ,ı,ſ,ʞ,ๅ,ɯ,u,o,d,b,ɹ,s,ʇ,n,ʌ,ʍ,x,ʎ,z,ɐ,q,ɔ,p,ǝ,ɟ,ɓ,ɥ,ı,ſ,ʞ,ๅ,ɯ,u,o,d,b,ɹ,s,ʇ,n,ʌ,ʍ,x,ʎ,z,0,9,8,7,6,5,4,3,2,1,.,_",
"⒜,⒝,⒞,⒟,⒠,⒡,⒢,⒣,⒤,⒥,⒦,⒧,⒨,⒩,⒪,⒫,⒬,⒭,⒮,⒯,⒰,⒱,⒲,⒳,⒴,⒵,⒜,⒝,⒞,⒟,⒠,⒡,⒢,⒣,⒤,⒥,⒦,⒧,⒨,⒩,⒪,⒫,⒬,⒭,⒮,⒯,⒰,⒱,⒲,⒳,⒴,⒵,⒪,⑼,⑻,⑺,⑹,⑸,⑷,⑶,⑵,⑴,.,_",
"ɑ,ʙ,c,ᴅ,є,ɻ,მ,ʜ,ι,ɿ,ĸ,г,w,и,o,ƅϭ,ʁ,ƨ,⊥,n,ʌ,ʍ,x,⑃,z,ɑ,ʙ,c,ᴅ,є,ɻ,მ,ʜ,ι,ɿ,ĸ,г,w,и,o,ƅϭ,ʁ,ƨ,⊥,n,ʌ,ʍ,x,⑃,z,0,9,8,7,6,5,4,3,2,1,.,_",
"4,8,C,D,3,F,9,H,!,J,K,1,M,N,0,P,Q,R,5,7,U,V,W,X,Y,2,4,8,C,D,3,F,9,H,!,J,K,1,M,N,0,P,Q,R,5,7,U,V,W,X,Y,2,0,9,8,7,6,5,4,3,2,1,.,_",
"Λ,ßƇ,D,Ɛ,F,Ɠ,Ĥ,Ī,Ĵ,Ҡ,Ŀ,M,И,♡,Ṗ,Ҩ,Ŕ,S,Ƭ,Ʊ,Ѵ,Ѡ,Ӿ,Y,Z,Λ,ßƇ,D,Ɛ,F,Ɠ,Ĥ,Ī,Ĵ,Ҡ,Ŀ,M,И,♡,Ṗ,Ҩ,Ŕ,S,Ƭ,Ʊ,Ѵ,Ѡ,Ӿ,Y,Z,0,9,8,7,6,5,4,3,2,1,.,_",
"α,в,¢,đ,e,f,g,ħ,ı,נ,κ,ł,м,и,ø,ρ,q,я,š,т,υ,ν,ω,χ,ч,z,α,в,¢,đ,e,f,g,ħ,ı,נ,κ,ł,м,и,ø,ρ,q,я,š,т,υ,ν,ω,χ,ч,z,0,9,8,7,6,5,4,3,2,1,.,_",
"α,в,c,ɔ,ε,ғ,ɢ,н,ı,נ,κ,ʟ,м,п,σ,ρ,ǫ,я,ƨ,т,υ,ν,ш,х,ч,z,α,в,c,ɔ,ε,ғ,ɢ,н,ı,נ,κ,ʟ,м,п,σ,ρ,ǫ,я,ƨ,т,υ,ν,ш,х,ч,z,0,9,8,7,6,5,4,3,2,1,.,_",
"【a】,【b】,【c】,【d】,【e】,【f】,【g】,【h】,【i】,【j】,【k】,【l】,【m】,【n】,【o】,【p】,【q】,【r】,【s】,【t】,【u】,【v】,【w】,【x】,【y】,【z】,【a】,【b】,【c】,【d】,【e】,【f】,【g】,【h】,【i】,【j】,【k】,【l】,【m】,【n】,【o】,【p】,【q】,【r】,【s】,【t】,【u】,【v】,【w】,【x】,【y】,【z】,【0】,【9】,【8】,【7】,【6】,【5】,【4】,【3】,【2】,【1】,.,_",
"[̲̲̅̅a̲̅,̲̅b̲̲̅,̅c̲̅,̲̅d̲̲̅,̅e̲̲̅,̅f̲̲̅,̅g̲̅,̲̅h̲̲̅,̅i̲̲̅,̅j̲̲̅,̅k̲̅,̲̅l̲̲̅,̅m̲̅,̲̅n̲̅,̲̅o̲̲̅,̅p̲̅,̲̅q̲̅,̲̅r̲̲̅,̅s̲̅,̲̅t̲̲̅,̅u̲̅,̲̅v̲̅,̲̅w̲̅,̲̅x̲̅,̲̅y̲̅,̲̅z̲̅,[̲̲̅̅a̲̅,̲̅b̲̲̅,̅c̲̅,̲̅d̲̲̅,̅e̲̲̅,̅f̲̲̅,̅g̲̅,̲̅h̲̲̅,̅i̲̲̅,̅j̲̲̅,̅k̲̅,̲̅l̲̲̅,̅m̲̅,̲̅n̲̅,̲̅o̲̲̅,̅p̲̅,̲̅q̲̅,̲̅r̲̲̅,̅s̲̅,̲̅t̲̲̅,̅u̲̅,̲̅v̲̅,̲̅w̲̅,̲̅x̲̅,̲̅y̲̅,̲̅z̲̅,̲̅0̲̅,̲̅9̲̲̅,̅8̲̅,̲̅7̲̅,̲̅6̲̅,̲̅5̲̅,̲̅4̲̅,̲̅3̲̲̅,̅2̲̲̅,̅1̲̲̅̅],.,_",
"[̺͆a̺͆͆,̺b̺͆͆,̺c̺͆,̺͆d̺͆,̺͆e̺͆,̺͆f̺͆͆,̺g̺͆,̺͆h̺͆,̺͆i̺͆,̺͆j̺͆,̺͆k̺͆,̺l̺͆͆,̺m̺͆͆,̺n̺͆͆,̺o̺͆,̺͆p̺͆͆,̺q̺͆͆,̺r̺͆͆,̺s̺͆͆,̺t̺͆͆,̺u̺͆͆,̺v̺͆͆,̺w̺͆,̺͆x̺͆,̺͆y̺͆,̺͆z̺,[̺͆a̺͆͆,̺b̺͆͆,̺c̺͆,̺͆d̺͆,̺͆e̺͆,̺͆f̺͆͆,̺g̺͆,̺͆h̺͆,̺͆i̺͆,̺͆j̺͆,̺͆k̺͆,̺l̺͆͆,̺m̺͆͆,̺n̺͆͆,̺o̺͆,̺͆p̺͆͆,̺q̺͆͆,̺r̺͆͆,̺s̺͆͆,̺t̺͆͆,̺u̺͆͆,̺v̺͆͆,̺w̺͆,̺͆x̺͆,̺͆y̺͆,̺͆z̺,̺͆͆0̺͆,̺͆9̺͆,̺͆8̺̺͆͆7̺͆,̺͆6̺͆,̺͆5̺͆,̺͆4̺͆,̺͆3̺͆,̺͆2̺͆,̺͆1̺͆],.,_",
"̛̭̰̃ã̛̰̭,̛̭̰̃b̛̰̭̃̃,̛̭̰c̛̛̰̭̃̃,̭̰d̛̰̭̃,̛̭̰̃ḛ̛̭̃̃,̛̭̰f̛̰̭̃̃,̛̭̰g̛̰̭̃̃,̛̭̰h̛̰̭̃,̛̭̰̃ḭ̛̛̭̃̃,̭̰j̛̰̭̃̃,̛̭̰k̛̰̭̃̃,̛̭̰l̛̰̭,̛̭̰̃m̛̰̭̃̃,̛̭̰ñ̛̛̰̭̃,̭̰ỡ̰̭̃,̛̭̰p̛̰̭̃,̛̭̰̃q̛̰̭̃̃,̛̭̰r̛̛̰̭̃̃,̭̰s̛̰̭,̛̭̰̃̃t̛̰̭̃,̛̭̰̃ữ̰̭̃,̛̭̰ṽ̛̰̭̃,̛̭̰w̛̛̰̭̃̃,̭̰x̛̰̭̃,̛̭̰̃ỹ̛̰̭̃,̛̭̰z̛̰̭̃̃,̛̛̭̰ã̛̰̭,̛̭̰̃b̛̰̭̃̃,̛̭̰c̛̛̰̭̃̃,̭̰d̛̰̭̃,̛̭̰̃ḛ̛̭̃̃,̛̭̰f̛̰̭̃̃,̛̭̰g̛̰̭̃̃,̛̭̰h̛̰̭̃,̛̭̰̃ḭ̛̛̭̃̃,̭̰j̛̰̭̃̃,̛̭̰k̛̰̭̃̃,̛̭̰l̛̰̭,̛̭̰̃m̛̰̭̃̃,̛̭̰ñ̛̛̰̭̃,̭̰ỡ̰̭̃,̛̭̰p̛̰̭̃,̛̭̰̃q̛̰̭̃̃,̛̭̰r̛̛̰̭̃̃,̭̰s̛̰̭,̛̭̰̃̃t̛̰̭̃,̛̭̰̃ữ̰̭̃,̛̭̰ṽ̛̰̭̃,̛̭̰w̛̛̰̭̃̃,̭̰x̛̰̭̃,̛̭̰̃ỹ̛̰̭̃,̛̭̰z̛̰̭̃̃,̛̭̰0̛̛̰̭̃̃,̭̰9̛̰̭̃̃,̛̭̰8̛̛̰̭̃̃,̭̰7̛̰̭̃̃,̛̭̰6̛̰̭̃̃,̛̭̰5̛̰̭̃,̛̭̰̃4̛̰̭̃,̛̭̰̃3̛̰̭̃̃,̛̭̰2̛̰̭̃̃,̛̭̰1̛̰̭̃,.,_",
"a,ะb,ะc,ะd,ะe,ะf,ะg,ะh,ะi,ะj,ะk,ะl,ะm,ะn,ะo,ะp,ะq,ะr,ะs,ะt,ะu,ะv,ะw,ะx,ะy,ะz,a,ะb,ะc,ะd,ะe,ะf,ะg,ะh,ะi,ะj,ะk,ะl,ะm,ะn,ะo,ะp,ะq,ะr,ะs,ะt,ะu,ะv,ะw,ะx,ะy,ะz,ะ0,ะ9,ะ8,ะ7,ะ6,ะ5,ะ4,ะ3,ะ2,ะ1ะ,.,_",
"̑ȃ,̑b̑,̑c̑,̑d̑,̑ȇ,̑f̑,̑g̑,̑h̑,̑ȋ,̑j̑,̑k̑,̑l̑,̑m̑,̑n̑,̑ȏ,̑p̑,̑q̑,̑ȓ,̑s̑,̑t̑,̑ȗ,̑v̑,̑w̑,̑x̑,̑y̑,̑z̑,̑ȃ,̑b̑,̑c̑,̑d̑,̑ȇ,̑f̑,̑g̑,̑h̑,̑ȋ,̑j̑,̑k̑,̑l̑,̑m̑,̑n̑,̑ȏ,̑p̑,̑q̑,̑ȓ,̑s̑,̑t̑,̑ȗ,̑v̑,̑w̑,̑x̑,̑y̑,̑z̑,̑0̑,̑9̑,̑8̑,̑7̑,̑6̑,̑5̑,̑4̑,̑3̑,̑2̑,̑1̑,.,_",
"~a,͜͝b,͜͝c,͜͝d,͜͝e,͜͝f,͜͝g,͜͝h,͜͝i,͜͝j,͜͝k,͜͝l,͜͝m,͜͝n,͜͝o,͜͝p,͜͝q,͜͝r,͜͝s,͜͝t,͜͝u,͜͝v,͜͝w,͜͝x,͜͝y,͜͝z,~a,͜͝b,͜͝c,͜͝d,͜͝e,͜͝f,͜͝g,͜͝h,͜͝i,͜͝j,͜͝k,͜͝l,͜͝m,͜͝n,͜͝o,͜͝p,͜͝q,͜͝r,͜͝s,͜͝t,͜͝u,͜͝v,͜͝w,͜͝x,͜͝y,͜͝z,͜͝0,͜͝9,͜͝8,͜͝7,͜͝6,͜͝5,͜͝4,͜͝3,͜͝2͜,͝1͜͝~,.,_",
"̤̈ä̤,̤̈b̤̈,̤̈c̤̈̈,̤d̤̈,̤̈ë̤,̤̈f̤̈,̤̈g̤̈̈,̤ḧ̤̈,̤ï̤̈,̤j̤̈,̤̈k̤̈̈,̤l̤̈,̤̈m̤̈,̤̈n̤̈,̤̈ö̤,̤̈p̤̈,̤̈q̤̈,̤̈r̤̈,̤̈s̤̈̈,̤ẗ̤̈,̤ṳ̈,̤̈v̤̈,̤̈ẅ̤,̤̈ẍ̤,̤̈ÿ̤,̤̈z̤̈,̤̈ä̤,̤̈b̤̈,̤̈c̤̈̈,̤d̤̈,̤̈ë̤,̤̈f̤̈,̤̈g̤̈̈,̤ḧ̤̈,̤ï̤̈,̤j̤̈,̤̈k̤̈̈,̤l̤̈,̤̈m̤̈,̤̈n̤̈,̤̈ö̤,̤̈p̤̈,̤̈q̤̈,̤̈r̤̈,̤̈s̤̈̈,̤ẗ̤̈,̤ṳ̈,̤̈v̤̈,̤̈ẅ̤,̤̈ẍ̤,̤̈ÿ̤,̤̈z̤̈,̤̈0̤̈,̤̈9̤̈,̤̈8̤̈,̤̈7̤̈,̤̈6̤̈,̤̈5̤̈,̤̈4̤̈,̤̈3̤̈,̤̈2̤̈̈,̤1̤̈,.,_",
"≋̮̑ȃ̮,̮̑b̮̑,̮̑c̮̑,̮̑d̮̑,̮̑ȇ̮,̮̑f̮̑,̮̑g̮̑,̮̑ḫ̑,̮̑ȋ̮,̮̑j̮̑,̮̑k̮̑,̮̑l̮̑,̮̑m̮̑,̮̑n̮̑,̮̑ȏ̮,̮̑p̮̑,̮̑q̮̑,̮̑r̮,̮̑̑s̮,̮̑̑t̮,̮̑̑u̮,̮̑̑v̮̑,̮̑w̮̑,̮̑x̮̑,̮̑y̮̑,̮̑z̮̑,≋̮̑ȃ̮,̮̑b̮̑,̮̑c̮̑,̮̑d̮̑,̮̑ȇ̮,̮̑f̮̑,̮̑g̮̑,̮̑ḫ̑,̮̑ȋ̮,̮̑j̮̑,̮̑k̮̑,̮̑l̮̑,̮̑m̮̑,̮̑n̮̑,̮̑ȏ̮,̮̑p̮̑,̮̑q̮̑,̮̑r̮,̮̑̑s̮,̮̑̑t̮,̮̑̑u̮,̮̑̑v̮̑,̮̑w̮̑,̮̑x̮̑,̮̑y̮̑,̮̑z̮̑,̮̑0̮̑,̮̑9̮̑,̮̑8̮̑,̮̑7̮̑,̮̑6̮̑,̮̑5̮̑,̮̑4̮̑,̮̑3̮̑,̮̑2̮̑,̮̑1̮̑≋,.,_",
"a̮,̮b̮̮,c̮̮,d̮̮,e̮̮,f̮̮,g̮̮,ḫ̮,i̮,j̮̮,k̮̮,l̮,̮m̮,̮n̮̮,o̮,̮p̮̮,q̮̮,r̮̮,s̮,̮t̮̮,u̮̮,v̮̮,w̮̮,x̮̮,y̮̮,z̮̮,a̮,̮b̮̮,c̮̮,d̮̮,e̮̮,f̮̮,g̮̮,ḫ̮i,̮̮,j̮̮,k̮̮,l̮,̮m̮,̮n̮̮,o̮,̮p̮̮,q̮̮,r̮̮,s̮,̮t̮̮,u̮̮,v̮̮,w̮̮,x̮̮,y̮̮,z̮̮,0̮̮,9̮̮,8̮̮,7̮̮,6̮̮,5̮̮,4̮̮,3̮̮,2̮̮,1̮,.,_",
"A̲,̲B̲,̲C̲,̲D̲,̲E̲,̲F̲,̲G̲,̲H̲,̲I̲,̲J̲,̲K̲,̲L̲,̲M̲,̲N̲,̲O̲,̲P̲,̲Q̲,̲R̲,̲S̲,̲T̲,̲U̲,̲V̲,̲W̲,̲X̲,̲Y̲,̲Z̲,̲a̲,̲b̲,̲c̲,̲d̲,̲e̲,̲f̲,̲g̲,̲h̲,̲i̲,̲j̲,̲k̲,̲l̲,̲m̲,̲n̲,̲o̲,̲p̲,̲q̲,̲r̲,̲s̲,̲t̲,̲u̲,̲v̲,̲w̲,̲x̲,̲y̲,̲z̲,̲0̲,̲9̲,̲8̲,̲7̲,̲6̲,̲5̲,̲4̲,̲3̲,̲2̲,̲1̲,̲.̲,̲_̲",
"Â,ß,Ĉ,Ð,Є,Ŧ,Ǥ,Ħ,Ī,ʖ,Қ,Ŀ,♏,И,Ø,P,Ҩ,R,$,ƚ,Ц,V,Щ,X,￥,Ẕ,Â,ß,Ĉ,Ð,Є,Ŧ,Ǥ,Ħ,Ī,ʖ,Қ,Ŀ,♏,И,Ø,P,Ҩ,R,$,ƚ,Ц,V,Щ,X,￥,Ẕ,0,9,8,7,6,5,4,3,2,1,.,_",
	}
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local result = {}
	i=0
	for k=1,#fonts do
		i=i+1
		local tar_font = fonts[i]:split(",")
		local text = matches[2]
		local text = text:gsub("A",tar_font[1])
		local text = text:gsub("B",tar_font[2])
		local text = text:gsub("C",tar_font[3])
		local text = text:gsub("D",tar_font[4])
		local text = text:gsub("E",tar_font[5])
		local text = text:gsub("F",tar_font[6])
		local text = text:gsub("G",tar_font[7])
		local text = text:gsub("H",tar_font[8])
		local text = text:gsub("I",tar_font[9])
		local text = text:gsub("J",tar_font[10])
		local text = text:gsub("K",tar_font[11])
		local text = text:gsub("L",tar_font[12])
		local text = text:gsub("M",tar_font[13])
		local text = text:gsub("N",tar_font[14])
		local text = text:gsub("O",tar_font[15])
		local text = text:gsub("P",tar_font[16])
		local text = text:gsub("Q",tar_font[17])
		local text = text:gsub("R",tar_font[18])
		local text = text:gsub("S",tar_font[19])
		local text = text:gsub("T",tar_font[20])
		local text = text:gsub("U",tar_font[21])
		local text = text:gsub("V",tar_font[22])
		local text = text:gsub("W",tar_font[23])
		local text = text:gsub("X",tar_font[24])
		local text = text:gsub("Y",tar_font[25])
		local text = text:gsub("Z",tar_font[26])
		local text = text:gsub("a",tar_font[27])
		local text = text:gsub("b",tar_font[28])
		local text = text:gsub("c",tar_font[29])
		local text = text:gsub("d",tar_font[30])
		local text = text:gsub("e",tar_font[31])
		local text = text:gsub("f",tar_font[32])
		local text = text:gsub("g",tar_font[33])
		local text = text:gsub("h",tar_font[34])
		local text = text:gsub("i",tar_font[35])
		local text = text:gsub("j",tar_font[36])
		local text = text:gsub("k",tar_font[37])
		local text = text:gsub("l",tar_font[38])
		local text = text:gsub("m",tar_font[39])
		local text = text:gsub("n",tar_font[40])
		local text = text:gsub("o",tar_font[41])
		local text = text:gsub("p",tar_font[42])
		local text = text:gsub("q",tar_font[43])
		local text = text:gsub("r",tar_font[44])
		local text = text:gsub("s",tar_font[45])
		local text = text:gsub("t",tar_font[46])
		local text = text:gsub("u",tar_font[47])
		local text = text:gsub("v",tar_font[48])
		local text = text:gsub("w",tar_font[49])
		local text = text:gsub("x",tar_font[50])
		local text = text:gsub("y",tar_font[51])
		local text = text:gsub("z",tar_font[52])
		local text = text:gsub("0",tar_font[53])
		local text = text:gsub("9",tar_font[54])
		local text = text:gsub("8",tar_font[55])
		local text = text:gsub("7",tar_font[56])
		local text = text:gsub("6",tar_font[57])
		local text = text:gsub("5",tar_font[58])
		local text = text:gsub("4",tar_font[59])
		local text = text:gsub("3",tar_font[60])
		local text = text:gsub("2",tar_font[61])
		local text = text:gsub("1",tar_font[62])

		table.insert(result, text)
	end
	local result_text = "کلمه ی اولیه: "..matches[2].."\nطراحی با "..tostring(#fonts).." فونت:\n ________________________\n\n "
	a=0
	for v=1,#result do
		a=a+1
		result_text = result_text..a.."- "..result[a].."\n\n"
	end
	tdcli.sendMessage(msg.chat_id_, 0, 1, result_text, 1, 'html')
end
--------------------------------
	if (matches[1]:lower() == "photo" and not lang) or (matches[1] == "عکس" and lang) then 
local logo = {'comics-logo','water-logo','3d-logo','blackbird-logo','runner-logo','graffiti-burn-logo','electric','standing3d-logo','style-logo','steel-logo','fluffy-logo','surfboard-logo','orlando-logo','fire-logo','clan-logo','chrominium-logo','harry-potter-logo','amped-logo','inferno-logo','uprise-logo','winner-logo','star-wars-logo','silver-logo','Design-Dance'} 
local text = URL.escape(matches[2])
local url = 'http://www.flamingtext.com/net-fu/image_output.cgi?_comBuyRedirect=false&script='..logo[math.random(#logo)]..'&text='..text..'&symbol_tagname=popular&fontsize=100&fontname=futura_poster&fontname_tagname=cool&textBorder=15&growSize=0&antialias=on&hinting=on&justify=2&letterSpacing=0&lineSpacing=0&textSlant=0&textVerticalSlant=0&textAngle=0&textOutline=off&textOutline=false&textOutlineSize=2&textColor=%230000CC&angle=0&blueFlame=on&blueFlame=false&framerate=100&frames=5&pframes=5&oframes=4&distance=2&transparent=off&transparent=false&extAnim=gif&animLoop=on&animLoop=false&defaultFrameRate=75&doScale=off&scaleWidth=400&scaleHeight=200&&_=1469943010141' 
local title , res = http.request(url) 
local jdat = json:decode(title) 
local sticker = jdat.src 
local file = download_to_file(sticker,'byroo.jpg') 
    tdcli.sendPhoto(msg.to.id, 0, 0, 1, nil, file, "", dl_cb, nil)
end
	if (matches[1]:lower() == "info" and not lang) or (matches[1] == "اطلاعات ایدی" and lang) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, info_by_reply, {chat_id=msg.chat_id_})
  end
  if matches[2] and string.match(matches[2], '^%d+$') and tonumber(msg.reply_to_message_id_) == 0 then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, info_by_id, {chat_id=msg.chat_id_,user_id=matches[2],msgid=msg.id_})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') and tonumber(msg.reply_to_message_id_) == 0 then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, info_by_username, {chat_id=msg.chat_id_,username=matches[2],msgid=msg.id_})
      end
  if not matches[2] and tonumber(msg.reply_to_message_id_) == 0 then
local function info2_cb(arg, data)
      if tonumber(data.id_) then
    if data.username_ then
  username = "@"..check_markdown(data.username_)
    else
  username = ""
  end
    if data.first_name_ then
  firstname = check_markdown(data.first_name_)
    else
  firstname = ""
  end
    if data.last_name_ then
  lastname = check_markdown(data.last_name_)
    else
  lastname = ""
  end
	local hash = 'rank:'..arg.chat_id..':variables'
   local text = "_First name :_ *"..firstname.."*\n_Last name :_ *"..lastname.."*\n_Username :_ "..username.."\n_ID :_ *"..data.id_.."*\n\n"
		    if data.id_ == tonumber(SUDO) then
		       text = text..'_Rank :_ *Executive Admin*\n\n'
			   elseif is_sudo1(data.id_) then
	           text = text..'_Rank :_ *Full Access Admin*\n\n'
		     elseif is_admin1(data.id_) then
		       text = text..'_Rank :_ *Bot Admin*\n\n'
		     elseif is_owner1(arg.chat_id, data.id_) then
		       text = text..'_Rank :_ *Group Owner*\n\n'
		     elseif is_mod1(arg.chat_id, data.id_) then
		       text = text..'_Rank :_ *Group Moderator*\n\n'
		 else
		       text = text..'_Rank :_ *Group Member*\n\n'
		 end
         local user_info = {} 
  local uhash = 'user:'..data.id_
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..data.id_..':'..arg.chat_id
  user_info_msgs = tonumber(redis:get(um_hash) or 0)
  text = text..'Total messages : '..user_info_msgs..'\n'
  text = text..MaTaDoRpm
  tdcli.sendMessage(arg.chat_id, arg.msgid, 0, text, 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = msg.from.id,
  }, info_by_id, {chat_id=msg.chat_id_,user_id=msg.from.id,msgid=msg.id_})
      end
   end
if ((matches[1]:lower() == "del" and not lang) or (matches[1] == "حذف" and lang))  and msg.reply_to_message_id_ ~= 0 and is_mod(msg) then
        tdcli.deleteMessages(msg.to.id,{[0] = tonumber(msg.reply_id),msg.id})
end
if (matches[1]:lower() == 'mydel' and not lang) or (matches[1] == 'پاکسازی پیام های من' and lang) then  
tdcli.deleteMessagesFromUser(msg.to.id, msg.sender_user_id_, dl_cb, cmd)
     if not lang then   
           tdcli.sendMessage(msg.chat_id_, msg.id_, 1, '*Done :)*', 1, 'md')
		   else
		   tdcli.sendMessage(msg.chat_id_, msg.id_, 1, '_انجام شد :)_', 1, 'md')
	 end
end
if matches[1] == "test" then
            local utf8 = dofile('./data/MenTion.lua')
local id = matches[2]
tdcli_function ({ID="SendMessage", chat_id_=msg.to.id, reply_to_message_id_=msg.id, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=matches[3], disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=utf8.len(matches[3]), user_id_=id}}}}, dl_cb, nil)
end
if (matches[1]:lower() == 'ping' and not lang) or (matches[1] == 'انلاینی' and lang) then
if not lang then
return "*PonG 🤖✅* `>["..(msg.from.username or ':|').."]<`"
   else
return "*آنلاینم 🤖✅* `>["..(msg.from.username or ':|').."]<`" 
   end
end
--------------------- Welcome -----------------------
	if ((matches[1]:lower() == "welcome" and not lang) or (matches[1] == 'خوشآمد' and lang)) and is_mod(msg) then
		if matches[2]:lower() == "enable" or matches[2] == "فعال" then
			welcome = data[tostring(chat)]['settings']['welcome']
			if welcome == "yes" then
			if not lang then
				return "_Group_ *welcome* `Iѕ AƖяєαɗу ƐηαвƖєɗ` ♻️⚠️"
				else
				return "_خوشآمد گویی از قبل فعال بود_"
				end
			else
		data[tostring(chat)]['settings']['welcome'] = "yes"
	    save_data(_config.moderation.data, data)
		if not lang then
				return "_Group_ *welcome* `Hαѕ Ɓєєη ƐηαвƖєɗ` 🤖🔇\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
				else
			    return "_خوشآمد گویی فعال شد 🤖✅\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]_"
				end
			end
		end
		
		if matches[2]:lower() == "disable" then
			welcome = data[tostring(chat)]['settings']['welcome']
			if welcome == "no" then
			if not lang then
				return "_Group_ *Welcome* `Iѕ AƖяєαɗу ƊιѕαвƖєɗ` ❌🔐"
				else
				return "_خوشآمد گویی از قبل فعال نبود_"
				end
			else
		data[tostring(chat)]['settings']['welcome'] = "no"
	    save_data(_config.moderation.data, data)
		if not lang then
				return "_Group_ *welcome* `Hαѕ Ɓєєη ƊιѕαвƖєɗ` 🤖🔊\n*OяɗєяƁу :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]"
				else
				return "_خوشآمد گویی غیرفعال شد 🤖✅\n*سفارش توسط :* [@"..check_markdown(msg.from.username or '').."*|*`"..msg.from.id.."`]_"
				end
			end
		end
	end
	if ((matches[1]:lower() == "setwelcome" and not lang) or (matches[1] == 'تنظیم خوشآمد' and lang)) and matches[2] and is_mod(msg) then
		data[tostring(chat)]['setwelcome'] = matches[2]
	    save_data(_config.moderation.data, data)
       if not lang then
		return "_Welcome Message Has Been Set To :_\n*"..matches[2].."*\n\n*You can use :*\n_{gpname} Group Name_\n_{rules} ➣ Show Group Rules_\n_{time} ➣ Show time english _\n_{date} ➣ Show date english _\n_{timefa} ➣ Show time persian _\n_{name} ➣ New Member First Name_\n_{username} ➣ New Member Username_"
       else
		return "_پیام خوشآمد گویی تنظیم شد به :_\n*"..matches[2].."*\n\n*شما میتوانید از*\n_{gpname} نام گروه_\n_{rules} ➣ نمایش قوانین گروه_\n_{time} ➣ ساعت به زبان انگلیسی _\n_{date} ➣ تاریخ به زبان انگلیسی _\n_{timefa} ➣ ساعت به زبان فارسی _\n_{datefa} ➣ تاریخ به زبان فارسی _\n_{name} ➣ نام کاربر جدید_\n_{username} ➣ نام کاربری کاربر جدید_\n_استفاده کنید_"
        end
     end 
end
------------------Invite---------------------
function getMessage(chat_id, message_id,cb)
  tdcli_function ({
    ID = "GetMessage",
    chat_id_ = chat_id,
    message_id_ = message_id
  }, cb, nil)
end
-------------------------------------------------------------------------------------------------------------------
function from_username(msg)
  function gfrom_user(extra,result,success)
    if result.username_ then
      F = result.username_
    else
      F = 'nil'
    end
    return F
  end
  local username = getUser(msg.sender_user_id_,gfrom_user)
  return username
end
 --Start Function
  if ((matches[1]:lower() == "invite" and not lang) or (matches[1] == "افزودن" and lang)) and matches[2] and is_owner(msg) then
if string.match(matches[2], '^%d+$') then
tdcli.addChatMember(msg.to.id, matches[2], 0)
end
end
------------------------Username------------------------------------------------------------------------------------
if ((matches[1]:lower() == "invite" and not lang) or (matches[1] == "افزودن" and lang)) and matches[2] and is_owner(msg) then
if string.match(matches[2], '^.*$') then
function invite_by_username(extra, result, success)
if result.id_ then
tdcli.addChatMember(msg.to.id, result.id_, 5)
end
end
resolve_username(matches[2],invite_by_username)
end
end
------------------------Reply---------------------------------------------------------------------------------------
if ((matches[1]:lower() == "invite" and not lang) or (matches[1] == "افزودن" and lang)) and msg.reply_to_message_id_ ~= 0 and is_owner(msg) then
function inv_reply(extra, result, success)
tdcli.addChatMember(msg.to.id, result.sender_user_id_, 5)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,inv_reply)
end
-----------------------------------------
	 if tonumber(msg.from.id) == SUDO then
if (matches[1]:lower() == "sudoset" and not lang) or (matches[1] == "افزودن سودو" and lang) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="visudo"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="visudo"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="visudo"})
      end
   end
if (matches[1]:lower() == "sudodem" and not lang) or (matches[1] == "حذف سودو" and lang) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="desudo"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="desudo"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="desudo"})
      end
   end
	if ((matches[1]:lower() == "sendfile" and not lang) or (matches[1] == 'ارسال فایل' and lang)) and matches[2] and matches[3] then
		local send_file = "./"..matches[2].."/"..matches[3]
		tdcli.sendDocument(msg.chat_id_, msg.id_,0, 1, nil, send_file, '@MaFia_cs', dl_cb, nil)
	end
	if ((matches[1]:lower() == "sendplug" and not lang) or (matches[1] == 'ارسال پلاگین' and lang)) and matches[2] then
	    local plug = "./plugins/"..matches[2]..".lua"
		tdcli.sendDocument(msg.chat_id_, msg.id_,0, 1, nil, plug, '@MaFia_cs', dl_cb, nil)
    end
   if (matches[1]:lower() == 'pl' and not lang) or (matches[1] == 'پلاگین' and lang) then
  if matches[2] == '+' and matches[4] == 'chat' or matches[4] == 'گروه' then
      if is_mod(msg) then
    local receiver = msg.chat_id_
    local plugin = matches[3]
    print("enable "..plugin..' on this chat')
    return reenable_plugin_on_chat(receiver, plugin, msg)
  end
    end

  if matches[2] == '+' and is_sudo(msg) then 
    local plugin_name = matches[3]
    print("enable: "..matches[3])
    return enable_plugin(plugin_name, msg)
  end
  if matches[2] == '-' and matches[4] == 'chat' or matches[4] == 'گروه' then
      if is_mod(msg) then
    local plugin = matches[3]
    local receiver = msg.chat_id_
    print("disable "..plugin..' on this chat')
    return disable_plugin_on_chat(receiver, plugin, msg)
  end
    end
  if matches[2] == '-' and is_sudo(msg) then 
    if matches[3] == 'plugins' then
		return 'This plugin can\'t be disabled'
    end
    print("disable: "..matches[3])
    return disable_plugin(matches[3], msg)
  end

  if matches[2] == '*' and is_sudo(msg) then
    return reload_plugins(true, msg)
  end
  end
if (matches[1]:lower() == "setend") or (matches[1] == "تنظیم پایان") then
redis:set("setend",matches[2])
return "Doɴe!\nSeтeɴd To :\n"..matches[2]
end
if (matches[1]:lower() == "delend") or (matches[1] == "حذف پایان") then
redis:del("setend")
return "Doɴe!\nEɴd мѕɢ Deleтed"
end
if (matches[1]:lower() == 'reset') or (matches[1]:lower() == 'ریست') then
redis:del("allmsg")
redis:del("su")
redis:del("gp")
redis:del("user")
return "Hαѕ Beeɴ Reѕeт"
end
----------------------------------------
end
if is_sudo(msg) then
if msg.to.type ~= 'pv' then
		if ((matches[1]:lower() == 'gid' and not lang) or (matches[1] == 'گروه ایدی' and lang)) and is_admin(msg) then
			tdcli.sendMessage(msg.to.id, msg.id_, 1, '`'..msg.to.id..'`', 1,'md')
		end
end
		if ((matches[1]:lower() == 'leave' and not lang) or (matches[1] == 'خروج' and lang)) and matches[2] and is_admin(msg) then
			if lang then
				tdcli.sendMessage(matches[2], 0, 1, 'ربات با دستور سودو از گروه خارج شد.\nبرای اطلاعات بیشتر با سودو تماس بگیرید.', 1, 'md')
				tdcli.changeChatMemberStatus(matches[2], our_id, 'Left', dl_cb, nil)
				tdcli.sendMessage(SUDO, msg.id_, 1, 'ربات با موفقیت از گروه '..matches[2]..' خارج شد.', 1,'md')
			else
				tdcli.sendMessage(matches[2], 0, 1, '`Rσвσт Ɩєfт тнє gяσυρ.`\n*Ƒσя мσяє ιηfσямαтιση cσηтαcт Ƭнє SUƊO.*', 1, 'md')
				tdcli.changeChatMemberStatus(matches[2], our_id, 'Left', dl_cb, nil)
				tdcli.sendMessage(SUDO, msg.id_, 1, '*Robot left from under group successfully:*\n\n`'..matches[2]..'`', 1,'md')
			end
		end
		if ((matches[1]:lower() == 'charge' and not lang) or (matches[1] == "شارژ" and lang)) and matches[2] and matches[3] and is_admin(msg) then
		if string.match(matches[2], '^.*$') then
			if tonumber(matches[3]) > 0 and tonumber(matches[3]) < 1001 then
				local extime = (tonumber(matches[3]) * 86400)
				redis:setex('ExpireDate:'..matches[2], extime, true)
				if not redis:get('CheckExpire::'..msg.to.id) then
					redis:set('CheckExpire::'..msg.to.id,true)
				end
				local linkgp = data[tostring(chat)]['settings']['linkgp']
                if not linkgp then
                  return '`لطفا قبل از شارژ گروه لینک گروه را تنظیم کنید 🌹`\n*"تنظیم لینک [لینک]"\n"setlink [link]"*'
                end
				local data = load_data(_config.moderation.data)
                local i = 1
                 if next(data[tostring(msg.to.id)]['owners']) == nil then 
                 return '`لطفا قبل از شارژ گروه مالک گروه را تنظیم کنید 🌹`\n_یا میتوانید از دستور زیر استفاده کنید_\n*"Config"*\n*"پیکربندی"*'
                 end
                 message = '\n'
                 for k,v in pairs(data[tostring(msg.to.id)]['owners']) do
                 message = message ..i.. '- '..v..' [' ..k.. '] \n'
                 i = i + 1
                 end
                 if next(data[tostring(msg.to.id)]['mods']) == nil then 
                 return '`لطفا قبل از شارژ گروه مدیر گروه را تنظیم کنید 🌹`\n_یا میتوانید از دستور زیر استفاده کنید_\n*"Config"*\n*"پیکربندی"*'
                 end
                 message2 = '\n'
                 for k,v in pairs(data[tostring(msg.to.id)]['mods']) do
                 message2 = message2 ..i.. '- '..v..' [' ..k.. '] \n'
                 i = i + 1
                 end
					tdcli.sendMessage(SUDO, msg.id_, 1, "*♨️ گزارش \nگروهی به لیست گروه ای مدیریتی ربات اضافه شد ➕*\n\n🔺 *مشخصات شخص اضافه کننده :*\n\n_>نام ؛_ "..check_markdown(msg.from.first_name or "").."\n_>نام کاربری ؛_ @"..check_markdown(msg.from.username or "").."\n_>شناسه کاربری ؛_ `"..msg.from.id.."`\n\n🔺 *مشخصات گروه اضافه شده :*\n\n_>نام گروه ؛_ "..check_markdown(msg.to.title).."\n_>شناسه گروه ؛_ `"..matches[2].."`\n>_مقدار شارژ انجام داده ؛_ `"..matches[3].."`\n_>لینک گروه ؛_\n"..linkgp.."\n_>لیست مالک گروه ؛_ "..message.."\n_>لیست مدیران گروه؛_ "..message2.."\n\n🔺* دستور های پیشفرض برای گروه :*\n\n_برای وارد شدن به گروه ؛_\n/join `"..matches[2].."`\n_حذف گروه از گروه های ربات ؛_\n/rem `"..matches[2].."`\n_خارج شدن ربات از گروه ؛_\n/leave `"..matches[2].."`", 1, 'md')
					tdcli.sendMessage(matches[2], 0, 1, '*Rσвσт яєcнαяgєɗ* `'..matches[3]..'` *ɗαу(ѕ)*\n*Ƒσя cнєcкιηg єxριяє ɗαтє, ѕєηɗ* `/cнєcкєxριяє`',1 , 'md')
			else
				if lang then
					tdcli.sendMessage(msg.to.id, msg.id_, 1, '`تعداد روزها باید عددی از` *1* `تا` *1000* `باشد.`', 1, 'md')
				else
					tdcli.sendMessage(msg.to.id, msg.id_, 1, '`Ɛxριяє ɗαуѕ мυѕт вє вєтωєєη` *1 - 1000*', 1, 'md')
				end
			end
		end
		end
		if (matches[1]:lower() == 'plan' and not lang) or (matches[1] == 'پلن' and lang) then
		        local linkgp = data[tostring(chat)]['settings']['linkgp']
                if not linkgp then
                  return '`لطفا قبل از شارژ گروه لینک گروه را تنظیم کنید 🌹`\n*"تنظیم لینک [لینک]"\n"setlink [link]"*'
                end
				local data = load_data(_config.moderation.data)
                local i = 1
                 if next(data[tostring(msg.to.id)]['owners']) == nil then 
                 return '`لطفا قبل از شارژ گروه مالک گروه را تنظیم کنید 🌹`\n_یا میتوانید از دستور زیر استفاده کنید_\n*"Config"*\n*"پیکربندی"*'
                 end
                 message = '\n'
                 for k,v in pairs(data[tostring(msg.to.id)]['owners']) do
                 message = message ..i.. '- '..v..' [' ..k.. '] \n'
                 i = i + 1
                 end
                 if next(data[tostring(msg.to.id)]['mods']) == nil then 
                 return '`لطفا قبل از شارژ گروه مدیر گروه را تنظیم کنید 🌹`\n_یا میتوانید از دستور زیر استفاده کنید_\n*"Config"*\n*"پیکربندی"*'
                 end
                 message2 = '\n'
                 for k,v in pairs(data[tostring(msg.to.id)]['mods']) do
                 message2 = message2 ..i.. '- '..v..' [' ..k.. '] \n'
                 i = i + 1
                 end
		if matches[2] == '1' and matches[3] and is_admin(msg) then
		if string.match(matches[3], '^.*$') then
			local timeplan1 = 2592000
			redis:setex('ExpireDate:'..matches[3], timeplan1, true)
			if not redis:get('CheckExpire::'..msg.to.id) then
				redis:set('CheckExpire::'..msg.to.id,true)
			end
				tdcli.sendMessage(SUDO, msg.id_, 1, "*♨️ گزارش \nگروهی به لیست گروه ای مدیریتی ربات اضافه شد ➕*\n\n🔺 *مشخصات شخص اضافه کننده :*\n\n_>نام ؛_ "..check_markdown(msg.from.first_name or "").."\n_>نام کاربری ؛_ @"..check_markdown(msg.from.username or "").."\n_>شناسه کاربری ؛_ `"..msg.from.id.."`\n\n🔺 *مشخصات گروه اضافه شده :*\n\n_>نام گروه ؛_ "..check_markdown(msg.to.title).."\n_>شناسه گروه ؛_ `"..msg.to.id.."`\n>_مقدار شارژ انجام داده ؛_ `30`\n_>لینک گروه ؛_\n"..linkgp.."\n_>لیست مالک گروه ؛_ "..message.."\n_>لیست مدیران گروه؛_ "..message2.."\n\n🔺* دستور های پیشفرض برای گروه :*\n\n_برای وارد شدن به گروه ؛_\n/join `"..msg.to.id.."`\n_حذف گروه از گروه های ربات ؛_\n/rem `"..msg.to.id.."`\n_خارج شدن ربات از گروه ؛_\n/leave `"..msg.to.id.."`", 1, 'md')
				tdcli.sendMessage(matches[3], 0, 1, '*Sυccєѕѕƒυℓℓу яєcнαяgє∂*\n*Ɛχριяє Ɗαтє:* `30` *Ɗαуѕ (1 Mσηтн)*', 1, 'md')
		end
		end
		if matches[2] == '2' and matches[3] and is_admin(msg) then
		if string.match(matches[3], '^.*$') then
			local timeplan2 = 7776000
			redis:setex('ExpireDate:'..matches[3],timeplan2,true)
			if not redis:get('CheckExpire::'..msg.to.id) then
				redis:set('CheckExpire::'..msg.to.id,true)
			end
				tdcli.sendMessage(SUDO, msg.id_, 1, "*♨️ گزارش \nگروهی به لیست گروه ای مدیریتی ربات اضافه شد ➕*\n\n🔺 *مشخصات شخص اضافه کننده :*\n\n_>نام ؛_ "..check_markdown(msg.from.first_name or "").."\n_>نام کاربری ؛_ @"..check_markdown(msg.from.username or "").."\n_>شناسه کاربری ؛_ `"..msg.from.id.."`\n\n🔺 *مشخصات گروه اضافه شده :*\n\n_>نام گروه ؛_ "..check_markdown(msg.to.title).."\n_>شناسه گروه ؛_ `"..msg.to.id.."`\n>_مقدار شارژ انجام داده ؛_ `60`\n_>لینک گروه ؛_\n"..linkgp.."\n_>لیست مالک گروه ؛_ "..message.."\n_>لیست مدیران گروه؛_ "..message2.."\n\n🔺* دستور های پیشفرض برای گروه :*\n\n_برای وارد شدن به گروه ؛_\n/join `"..msg.to.id.."`\n_حذف گروه از گروه های ربات ؛_\n/rem `"..msg.to.id.."`\n_خارج شدن ربات از گروه ؛_\n/leave `"..msg.to.id.."`", 1, 'md')
				tdcli.sendMessage(matches[3], 0, 1, '*Sυccєѕѕƒυℓℓу яєcнαяgє∂*\n*Ɛχριяє Ɗαтє:* `90` *Ɗαуѕ (3 Mσηтнѕ)*', 1, 'md')
		end
		end
		if matches[2] == '3' and matches[3] and is_admin(msg) then
		if string.match(matches[3], '^.*$') then
			redis:set('ExpireDate:'..matches[3],true)
			if not redis:get('CheckExpire::'..msg.to.id) then
				redis:set('CheckExpire::'..msg.to.id,true)
			end
				tdcli.sendMessage(SUDO, msg.id_, 1, "*♨️ گزارش \nگروهی به لیست گروه ای مدیریتی ربات اضافه شد ➕*\n\n🔺 *مشخصات شخص اضافه کننده :*\n\n_>نام ؛_ "..check_markdown(msg.from.first_name or "").."\n_>نام کاربری ؛_ @"..check_markdown(msg.from.username or "").."\n_>شناسه کاربری ؛_ `"..msg.from.id.."`\n\n🔺 *مشخصات گروه اضافه شده :*\n\n_>نام گروه ؛_ "..check_markdown(msg.to.title).."\n_>شناسه گروه ؛_ `"..msg.to.id.."`\n>_مقدار شارژ انجام داده ؛_ `نامحدود !`\n_>لینک گروه ؛_\n"..linkgp.."\n_>لیست مالک گروه ؛_ "..message.."\n_>لیست مدیران گروه؛_ "..message2.."\n\n🔺* دستور های پیشفرض برای گروه :*\n\n_برای وارد شدن به گروه ؛_\n/join `"..msg.to.id.."`\n_حذف گروه از گروه های ربات ؛_\n/rem `"..msg.to.id.."`\n_خارج شدن ربات از گروه ؛_\n/leave `"..msg.to.id.."`", 1, 'md')
				tdcli.sendMessage(matches[3], 0, 1, '*Sυccєѕѕƒυℓℓу яєcнαяgє∂*\n*Ɛχριяє Ɗαтє:* `Uηℓιмιтє∂`', 1, 'md')
		end
		end
		end
		if ((matches[1]:lower() == 'jointo' and not lang) or (matches[1] == 'ورود به' and lang)) and matches[2] and is_admin(msg) then
		if string.match(matches[2], '^.*$') then
			if lang then
				tdcli.sendMessage(SUDO, msg.id_, 1, 'با موفقیت تورو به گروه '..matches[2]..' اضافه کردم.', 1, 'md')
				tdcli.addChatMember(matches[2], SUDO, 0, dl_cb, nil)
				tdcli.sendMessage(matches[2], 0, 1, '_سودو به گروه اضافه شد._', 1, 'md')
			else
				tdcli.sendMessage(SUDO, msg.id_, 1, '*I α∂∂є∂ уσυ тσ тнιѕ gяσυρ:*\n\n`'..matches[2]..'`', 1, 'md')
				tdcli.addChatMember(matches[2], SUDO, 0, dl_cb, nil)
				tdcli.sendMessage(matches[2], 0, 1, 'A∂мιη Jσιηє∂!', 1, 'md')
			end
		end
		end
end
	if msg.to.type == 'channel' or msg.to.type == 'chat' then
		if ((matches[1]:lower() == 'charge' and not lang) or (matches[1] == 'شارژ' and lang)) and matches[2] and not matches[3] and is_sudo(msg) then
			if tonumber(matches[2]) > 0 and tonumber(matches[2]) < 1001 then
				local extime = (tonumber(matches[2]) * 86400)
				redis:setex('ExpireDate:'..msg.to.id, extime, true)
				if not redis:get('CheckExpire::'..msg.to.id) then
					redis:set('CheckExpire::'..msg.to.id)
				end
				local linkgp = data[tostring(chat)]['settings']['linkgp']
                if not linkgp then
                  return '`لطفا قبل از شارژ گروه لینک گروه را تنظیم کنید 🌹`\n*"تنظیم لینک [لینک]"\n"setlink [link]"*'
                end
				local data = load_data(_config.moderation.data)
                local i = 1
                 if next(data[tostring(msg.to.id)]['owners']) == nil then 
                 return '`لطفا قبل از شارژ گروه مالک گروه را تنظیم کنید 🌹`\n_یا میتوانید از دستور زیر استفاده کنید_\n*"Config"*\n*"پیکربندی"*'
                 end
                 message = '\n'
                 for k,v in pairs(data[tostring(msg.to.id)]['owners']) do
                 message = message ..i.. '- '..v..' [' ..k.. '] \n'
                 i = i + 1
                 end
                 if next(data[tostring(msg.to.id)]['mods']) == nil then 
                 return '`لطفا قبل از شارژ گروه مدیر گروه را تنظیم کنید 🌹`\n_یا میتوانید از دستور زیر استفاده کنید_\n*"Config"*\n*"پیکربندی"*'
                 end
                 message2 = '\n'
                 for k,v in pairs(data[tostring(msg.to.id)]['mods']) do
                 message2 = message2 ..i.. '- '..v..' [' ..k.. '] \n'
                 i = i + 1
                 end                        
					tdcli.sendMessage(SUDO, msg.id_, 1, "*♨️ گزارش \nگروهی به لیست گروه ای مدیریتی ربات اضافه شد ➕*\n\n🔺 *مشخصات شخص اضافه کننده :*\n\n_>نام ؛_ "..check_markdown(msg.from.first_name or "").."\n_>نام کاربری ؛_ @"..check_markdown(msg.from.username or "").."\n_>شناسه کاربری ؛_ `"..msg.from.id.."`\n\n🔺 *مشخصات گروه اضافه شده :*\n\n_>نام گروه ؛_ "..check_markdown(msg.to.title).."\n_>شناسه گروه ؛_ `"..msg.to.id.."`\n>_مقدار شارژ انجام داده ؛_ `"..matches[2].."`\n_>لینک گروه ؛_\n"..linkgp.."\n_>لیست مالک گروه ؛_ "..message.."\n_>لیست مدیران گروه؛_ "..message2.."\n\n🔺* دستور های پیشفرض برای گروه :*\n\n_برای وارد شدن به گروه ؛_\n/join `"..msg.to.id.."`\n_حذف گروه از گروه های ربات ؛_\n/rem `"..msg.to.id.."`\n_خارج شدن ربات از گروه ؛_\n/leave `"..msg.to.id.."`", 1, 'md')
			        tdcli.sendMessage(msg.to.id, msg.id_, 1, 'Ɗσηє\nƓяσυρ Ƈнαяgє : '..matches[2]..'', 1, 'md')
			else
				if lang then
					tdcli.sendMessage(msg.to.id, msg.id_, 1, '`تعداد روزها باید عددی از` *1* `تا` *1000* `باشد.`', 1, 'md')
				else
					tdcli.sendMessage(msg.to.id, msg.id_, 1, '`Ɛxριяє ɗαуѕ мυѕт вє вєтωєєη` *1 - 1000*', 1, 'md')
				end
			end
		end
		if ((matches[1]:lower() == 'checkexpire' and not lang) or (matches[1] == 'اعتبار' and lang)) and is_mod(msg) and not matches[2] and is_owner(msg) then
local check_time = redis:ttl('ExpireDate:'..msg.to.id)
			year = math.floor(check_time / 31536000)
			byear = check_time % 31536000
			month = math.floor(byear / 2592000)
			bmonth = byear % 2592000
			day = math.floor(bmonth / 86400)
			bday = bmonth % 86400
			hours = math.floor( bday / 3600)
			bhours = bday % 3600
			min = math.floor(bhours / 60)
			sec = math.floor(bhours % 60)
			if not lang then
				if check_time == -1 then
					remained_expire = '_Unlimited Charging!_'
				elseif tonumber(check_time) > 1 and check_time < 60 then
					remained_expire = '_Expire until_ *'..sec..'* _sec_'
				elseif tonumber(check_time) > 60 and check_time < 3600 then
					remained_expire = '_Expire until_ '..min..' _min_ *'..sec..'* _sec_'
				elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
					remained_expire = '_Expire until_ *'..hours..'* _hour_ *'..min..'* _min_ *'..sec..'* _sec_'
				elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
					remained_expire = '_Expire until_ *'..day..'* _day_ *'..hours..'* _hour_ *'..min..'* _min_ *'..sec..'* _sec_'
				elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
					remained_expire = '_Expire until_ *'..month..'* _month_ *'..day..'* _day_ *'..hours..'* _hour_ *'..min..'* _min_ *'..sec..'* _sec_'
				elseif tonumber(check_time) > 31536000 then
					remained_expire = '_Expire until_ *'..year..'* _year_ *'..month..'* _month_ *'..day..'* _day_ *'..hours..'* _hour_ *'..min..'* _min_ *'..sec..'* _sec_'
				end
				tdcli.sendMessage(msg.to.id, msg.id_, 1, remained_expire, 1, 'md')
			else
				if check_time == -1 then
					remained_expire = '_گروه به صورت نامحدود شارژ میباشد!_'
				elseif tonumber(check_time) > 1 and check_time < 60 then
					remained_expire = '_گروه به مدت_ *'..sec..'* _ثانیه شارژ میباشد_'
				elseif tonumber(check_time) > 60 and check_time < 3600 then
					remained_expire = '_گروه به مدت_ *'..min..'* _دقیقه و_ *'..sec..'* _ثانیه شارژ میباشد_'
				elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
					remained_expire = '_گروه به مدت_ *'..hours..'* _ساعت و_ *'..min..'* _دقیقه و_ *'..sec..'* _ثانیه شارژ میباشد_'
				elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
					remained_expire = '_گروه به مدت_ *'..day..'* _روز و_ *'..hours..'* _ساعت و_ *'..min..'* _دقیقه و_ *'..sec..'* _ثانیه شارژ میباشد_'
				elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
					remained_expire = '_گروه به مدت_ *'..month..'* _ماه_ *'..day..'* _روز و_ *'..hours..'* _ساعت و_ *'..min..'* _دقیقه و_ *'..sec..'* _ثانیه شارژ میباشد_'
				elseif tonumber(check_time) > 31536000 then
					remained_expire = '_گروه به مدت_ *'..year..'* _سال_ *'..month..'* _ماه_ *'..day..'* _روز و_ *'..hours..'* _ساعت و_ *'..min..'* _دقیقه و_ *'..sec..'* _ثانیه شارژ میباشد_'
				end
				tdcli.sendMessage(msg.to.id, msg.id_, 1, remained_expire, 1, 'md')
			end
		end
		end
		if ((matches[1]:lower() == 'checkexpire' and not lang) or (matches[1] == 'اعتبار' and lang)) and is_mod(msg) and matches[2] and is_admin(msg) then
if string.match(matches[2], '^-%d+$') then
			local check_time = redis:ttl('ExpireDate:'..matches[2])
			year = math.floor(check_time / 31536000)
			byear = check_time % 31536000
			month = math.floor(byear / 2592000)
			bmonth = byear % 2592000
			day = math.floor(bmonth / 86400)
			bday = bmonth % 86400
			hours = math.floor( bday / 3600)
			bhours = bday % 3600
			min = math.floor(bhours / 60)
			sec = math.floor(bhours % 60)
			if not lang then
				if check_time == -1 then
					remained_expire = '_Unlimited Charging!_'
				elseif tonumber(check_time) > 1 and check_time < 60 then
					remained_expire = '_Expire until_ *'..sec..'* _sec_'
				elseif tonumber(check_time) > 60 and check_time < 3600 then
					remained_expire = '_Expire until_ '..min..' _min_ *'..sec..'* _sec_'
				elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
					remained_expire = '_Expire until_ *'..hours..'* _hour_ *'..min..'* _min_ *'..sec..'* _sec_'
				elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
					remained_expire = '_Expire until_ *'..day..'* _day_ *'..hours..'* _hour_ *'..min..'* _min_ *'..sec..'* _sec_'
				elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
					remained_expire = '_Expire until_ *'..month..'* _month_ *'..day..'* _day_ *'..hours..'* _hour_ *'..min..'* _min_ *'..sec..'* _sec_'
				elseif tonumber(check_time) > 31536000 then
					remained_expire = '_Expire until_ *'..year..'* _year_ *'..month..'* _month_ *'..day..'* _day_ *'..hours..'* _hour_ *'..min..'* _min_ *'..sec..'* _sec_'
				end
				tdcli.sendMessage(msg.to.id, msg.id_, 1, remained_expire, 1, 'md')
			else
				if check_time == -1 then
					remained_expire = '_گروه به صورت نامحدود شارژ میباشد!_'
				elseif tonumber(check_time) > 1 and check_time < 60 then
					remained_expire = '_گروه به مدت_ *'..sec..'* _ثانیه شارژ میباشد_'
				elseif tonumber(check_time) > 60 and check_time < 3600 then
					remained_expire = '_گروه به مدت_ *'..min..'* _دقیقه و_ *'..sec..'* _ثانیه شارژ میباشد_'
				elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
					remained_expire = '_گروه به مدت_ *'..hours..'* _ساعت و_ *'..min..'* _دقیقه و_ *'..sec..'* _ثانیه شارژ میباشد_'
				elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
					remained_expire = '_گروه به مدت_ *'..day..'* _روز و_ *'..hours..'* _ساعت و_ *'..min..'* _دقیقه و_ *'..sec..'* _ثانیه شارژ میباشد_'
				elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
					remained_expire = '_گروه به مدت_ *'..month..'* _ماه_ *'..day..'* _روز و_ *'..hours..'* _ساعت و_ *'..min..'* _دقیقه و_ *'..sec..'* _ثانیه شارژ میباشد_'
				elseif tonumber(check_time) > 31536000 then
					remained_expire = '_گروه به مدت_ *'..year..'* _سال_ *'..month..'* _ماه_ *'..day..'* _روز و_ *'..hours..'* _ساعت و_ *'..min..'* _دقیقه و_ *'..sec..'* _ثانیه شارژ میباشد_'
				end
				tdcli.sendMessage(msg.to.id, msg.id_, 1, remained_expire, 1, 'md')
			end
		end
	end
if ((matches[1]:lower() == "adminset" and not lang) or (matches[1] == "افزودن ادمین" and lang)) and is_sudo(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="adminprom"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="adminprom"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="adminprom"})
      end
   end
if ((matches[1]:lower() == "admindem" and not lang) or (matches[1] == "حذف ادمین" and lang)) and is_sudo(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.to.id,cmd="admindem"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="admindem"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="admindem"})
      end
   end

if ((matches[1]:lower() == 'creategroup' and not lang) or (matches[1] == 'ساخت گروه' and lang)) and is_admin(msg) then
local text = matches[2]
tdcli.createNewGroupChat({[0] = msg.from.id}, text, dl_cb, nil)
  if not lang then
return '_Ɠяσυρ Hαѕ Ɓєєη Ƈяєαтєɗ!_'
  else
return '_گروه ساخته شد!_'
   end
end

if ((matches[1]:lower() == 'createsuper' and not lang) or (matches[1] == 'ساخت سوپر گروه' and lang)) and is_admin(msg) then
local text = matches[2]
tdcli.createNewChannelChat(text, 1, '', (function(b, d) tdcli.addChatMember(d.id_, msg.from.id, 0, dl_cb, nil) end), nil)
   if not lang then 
return '_SυρєяƓяσυρ Hαѕ Ɓєєη Ƈяєαтєɗ αηɗ_ [`'..msg.from.id..'`] _Jσιηєɗ Ƭσ Ƭнιѕ SυρєяƓяσυρ._'
  else
return '_سوپرگروه ساخته شد و_ [`'..msg.from.id..'`] _به گروه اضافه شد._'
   end
end

if ((matches[1]:lower() == 'tosuper' and not lang) or (matches[1] == 'تبدیل به سوپر' and lang)) and is_admin(msg) then
local id = msg.to.id
tdcli.migrateGroupChatToChannelChat(id, dl_cb, nil)
  if not lang then
return '_Ɠяσυρ Hαѕ Ɓєєη Ƈнαηgєɗ Ƭσ SυρєяƓяσυρ!_'
  else
return '_گروه به سوپر گروه تبدیل شد!_'
   end
end

if ((matches[1]:lower() == 'import' and not lang) or (matches[1] == 'ورود لینک' and lang)) and is_admin(msg) then
if matches[2]:match("^([https?://w]*.?telegram.me/joinchat/.*)$") or matches[2]:match("^([https?://w]*.?t.me/joinchat/.*)$") then
local link = matches[2]
if link:match('t.me') then
link = string.gsub(link, 't.me', 'telegram.me')
end
tdcli.importChatInviteLink(link, dl_cb, nil)
   if not lang then
return '*Ɗσηє!*'
  else
return '*انجام شد!*'
  end
  end
end

if ((matches[1]:lower() == 'setbotname' and not lang) or (matches[1] == 'تغییر نام ربات' and lang)) and is_sudo(msg) then
tdcli.changeName(matches[2])
   if not lang then
return '_Ɓσт Ɲαмє Ƈнαηgєɗ Ƭσ:_ *'..matches[2]..'*'
  else
return '_اسم ربات تغییر کرد به:_ \n*'..matches[2]..'*'
   end
end

if ((matches[1]:lower() == 'setbotusername' and not lang) or (matches[1] == 'تغییر یوزرنیم ربات' and lang)) and is_sudo(msg) then
tdcli.changeUsername(matches[2])
   if not lang then
return '_Ɓσт Uѕєяηαмє Ƈнαηgєɗ Ƭσ:_ @'..matches[2]
  else
return '_یوزرنیم ربات تغییر کرد به:_ \n@'..matches[2]..''
   end
end

if ((matches[1]:lower() == 'delbotusername' and not lang) or (matches[1] == 'حذف یوزرنیم ربات' and lang)) and is_sudo(msg) then
tdcli.changeUsername('')
   if not lang then
return '*Ɗσηє!*'
  else
return '*انجام شد!*'
  end
end

if ((matches[1]:lower() == 'markread' and not lang) or (matches[1] == 'تیک دوم' and lang)) and is_sudo(msg) then
if matches[2]:lower() == 'on' or matches[2] == 'فعال' then
redis:set('markread','on')
   if not lang then
return '_Mαякяєαɗ >_ *OƝ*'
else
return '_تیک دوم >_ *روشن*'
   end
end
if matches[2]:lower() == 'off' or matches[2] == 'غیرفعال' then
redis:set('markread','off')
  if not lang then
return '_Mαякяєαɗ >_ *OƑƑ*'
   else
return '_تیک دوم >_ *خاموش*'
      end
   end
end

if ((matches[1]:lower() == 'bc' and not lang) or (matches[1] == 'ارسال' and lang)) and is_admin(msg) then
		local text = matches[2]
tdcli.sendMessage(matches[3], 0, 0, text, 0)	
end

if ((matches[1]:lower() == 'broadcast' and not lang) or (matches[1] == 'ارسال به همه' and lang)) and is_sudo(msg) then		
local data = load_data(_config.moderation.data)		
local bc = matches[2]			
for k,v in pairs(data) do				
tdcli.sendMessage(k, 0, 0, bc, 0)			
end	
end

if ((matches[1]:lower() == 'sudolist' and not lang) or  (matches[1] == 'لیست سودو' and lang)) and is_sudo(msg) then
return sudolist(msg)
    end
if ((matches[1]:lower() == 'chats' and not lang) or (matches[1] == 'لیست گروه ها' and lang)) and is_admin(msg) then
return chat_list(msg)
    end
   if ((matches[1]:lower() == 'join' and not lang) or (matches[1] == 'افزودن' and lang)) and matches[2] and is_admin(msg) and matches[2] then
	   tdcli.sendMessage(msg.to.id, msg.id, 1, 'I Iηνιтє уσυ ιη '..matches[2]..'', 1, 'html')
	   tdcli.sendMessage(matches[2], 0, 1, "Aɗмιη Jσιηєɗ! :)", 1, 'html')
    tdcli.addChatMember(matches[2], msg.from.id, 0, dl_cb, nil)
  end
		if ((matches[1]:lower() == 'rem' and not lang) or (matches[1] == 'لغو نصب' and lang)) and matches[2] and is_admin(msg) then
    local data = load_data(_config.moderation.data)
			-- Group configuration removal
			data[tostring(matches[2])] = nil
			save_data(_config.moderation.data, data)
			local groups = 'groups'
			if not data[tostring(groups)] then
				data[tostring(groups)] = nil
				save_data(_config.moderation.data, data)
			end
			data[tostring(groups)][tostring(matches[2])] = nil
			save_data(_config.moderation.data, data)
	   tdcli.sendMessage(matches[2], 0, 1, "Ɠяσυρ нαѕ вєєη яємσνєɗ ву αɗмιη cσммαηɗ", 1, 'html')
    return '`Ɠяσυρ` *'..matches[2]..'* `яємσνєɗ`'
		end
if ((matches[1]:lower() == 'adminlist' and not lang) or (matches[1] == 'لیست ادمین' and lang)) and is_admin(msg) then
return adminlist(msg)
    end
     if ((matches[1]:lower() == 'leave' and not lang) or (matches[1] == 'خروج' and lang)) and is_admin(msg) then
  tdcli.changeChatMemberStatus(msg.to.id, our_id, 'Left', dl_cb, nil)
   end
     if ((matches[1]:lower() == 'autoleave' and not lang) or (matches[1] == 'خروج خودکار' and lang)) and is_admin(msg) then
local hash = 'auto_leave_bot'
--Enable Auto Leave
     if matches[2] == 'on' or matches[2] == 'فعال' then
    redis:del(hash)
   return 'Aυтσ Ɩєανє нαѕ вєєη єηαвƖєɗ'
--Disable Auto Leave
     elseif matches[2] == 'off' or matches[2] == 'غیرفعال' then
    redis:set(hash, true)
   return 'Aυтσ Ɩєανє нαѕ вєєη ɗιѕαвƖєɗ'
--Auto Leave Status
      elseif matches[2] == 'status' or  matches[2] == 'موقعیت' then
      if not redis:get(hash) then
   return 'Aυтσ Ɩєανє ιѕ єηαвƖє'
       else
   return 'Aυтσ Ɩєανє ιѕ ɗιѕαвƖє'
         end
      end
   end
   if msg.to.type ~= 'pv' then
 if ((matches[1]:lower() == "kick" and not lang) or (matches[1] == "اخراج" and lang)) and is_mod(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="kick"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.to.id, userid) then
   if not lang then
     tdcli.sendMessage(msg.to.id, "", 0, "_You can't kick mods,owners or bot admins_", 0, "md")
   elseif lang then
     tdcli.sendMessage(msg.to.id, "", 0, "*شما نمیتوانید مدیران،صاحبان گروه و ادمین های ربات رو اخراج کنید*", 0, "md")
         end
     else
kick_user(matches[2], msg.to.id)
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="kick"})
         end
      end
 if ((matches[1]:lower() == "delall" and not lang) or (matches[1] == "حذف پیام" and lang)) and is_mod(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="delall"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.to.id, userid) then
   if not lang then
   return tdcli.sendMessage(msg.to.id, "", 0, "_You can't delete messages mods,owners or bot admins_", 0, "md")
     elseif lang then
   return tdcli.sendMessage(msg.to.id, "", 0, "*شما نمیتوانید پیام های مدیران،صاحبان گروه و ادمین های ربات رو پاک کنید*", 0, "md")
   end
     else
tdcli.deleteMessagesFromUser(msg.to.id, matches[2], dl_cb, nil)
    if not lang then
  return tdcli.sendMessage(msg.to.id, "", 0, "_AƖƖ_ *мєѕѕαgєѕ* _σf_ *[ "..matches[2].." ]* _нαѕ вєєη_ *ɗєƖєтєɗ*", 0, "md")
   elseif lang then
  return tdcli.sendMessage(msg.to.id, "", 0, "*تمامی پیام های* *[ "..matches[2].." ]* *پاک شد*", 0, "md")
         end
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="delall"})
         end
      end
   end
 if ((matches[1]:lower() == "banall" and not lang) or (matches[1] == "سوپر بن" and lang)) and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="banall"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_admin1(userid) then
   if not lang then
    return tdcli.sendMessage(msg.to.id, "", 0, "_You can't globally ban other admins_", 0, "md")
else
    return tdcli.sendMessage(msg.to.id, "", 0, "*شما نمیتوانید ادمین های ربات رو از گروه های ربات محروم کنید*", 0, "md")
        end
     end
   if is_gbanned(matches[2]) then
   if not lang then
  return tdcli.sendMessage(msg.to.id, "", 0, "*User "..matches[2].." is already globally banned*", 0, "md")
    else
  return tdcli.sendMessage(msg.to.id, "", 0, "*کاربر "..matches[2].." از گروه های ربات محروم بود*", 0, "md")
        end
     end
  data['gban_users'][tostring(matches[2])] = ""
    save_data(_config.moderation.data, data)
kick_user(matches[2], msg.to.id)
   if not lang then
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "*User "..matches[2].." has been globally banned*", 0, "md")
    else
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "*کاربر "..matches[2].." از تمام گروه هار ربات محروم شد*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="banall"})
      end
   end
 if ((matches[1]:lower() == "unbanall" and not lang) or (matches[1] == "حذف سوپر بن" and lang)) and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="unbanall"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if not is_gbanned(matches[2]) then
     if not lang then
   return tdcli.sendMessage(msg.to.id, "", 0, "*User "..matches[2].." is not globally banned*", 0, "md")
    else
   return tdcli.sendMessage(msg.to.id, "", 0, "*کاربر "..matches[2].." از گروه های ربات محروم نبود*", 0, "md")
        end
     end
  data['gban_users'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
   if not lang then
return tdcli.sendMessage(msg.to.id, msg.id, 0, "*User "..matches[2].." has been globally unbanned*", 0, "md")
   else
return tdcli.sendMessage(msg.to.id, msg.id, 0, "*کاربر "..matches[2].." از محرومیت گروه های ربات خارج شد*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="unbanall"})
      end
   end
   if msg.to.type ~= 'pv' then
 if ((matches[1]:lower() == "ban" and not lang) or (matches[1] == "مسدود" and lang)) and is_mod(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="ban"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.to.id, userid) then
     if not lang then
    return tdcli.sendMessage(msg.to.id, "", 0, "_You can't ban mods,owners or bot admins_", 0, "md")
    else
    return tdcli.sendMessage(msg.to.id, "", 0, "*شما نمیتوانید مدیران،صاحبان گروه و ادمین های ربات رو از گروه محروم کنید*", 0, "md")
        end
     end
   if is_banned(matches[2], msg.to.id) then
   if not lang then
  return tdcli.sendMessage(msg.to.id, "", 0, "_User "..matches[2].." is already banned_", 0, "md")
  else
  return tdcli.sendMessage(msg.to.id, "", 0, "*کاربر "..matches[2].." از گروه محروم بود*", 0, "md")
        end
     end
data[tostring(chat)]['banned'][tostring(matches[2])] = ""
    save_data(_config.moderation.data, data)
kick_user(matches[2], msg.to.id)
   if not lang then
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "_User "..matches[2].." has been banned_", 0, "md")
  else
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "*کاربر "..matches[2].." از گروه محروم شد*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
     tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="ban"})
      end
   end
 if ((matches[1]:lower() == "unban" and not lang) or (matches[1] == "حذف بن" and lang)) and is_mod(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="unban"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if not is_banned(matches[2], msg.to.id) then
   if not lang then
   return tdcli.sendMessage(msg.to.id, "", 0, "_User "..matches[2].." is not banned_", 0, "md")
  else
   return tdcli.sendMessage(msg.to.id, "", 0, "*کاربر "..matches[2].." از گروه محروم نبود*", 0, "md")
        end
     end
data[tostring(chat)]['banned'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
   if not lang then
return tdcli.sendMessage(msg.to.id, msg.id, 0, "_User "..matches[2].." has been unbanned_", 0, "md")
   else
return tdcli.sendMessage(msg.to.id, msg.id, 0, "*کاربر "..matches[2].." از محرومیت گروه خارج شد*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="unban"})
      end
   end
 if ((matches[1]:lower() == "silent" and not lang) or (matches[1] == "سکوت" and lang)) and is_mod(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="silent"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.to.id, userid) then
   if not lang then
   return tdcli.sendMessage(msg.to.id, "", 0, "_You can't silent mods,leaders or bot admins_", 0, "md")
 else
   return tdcli.sendMessage(msg.to.id, "", 0, "*شما نمیتوانید توانایی چت کردن رو از مدیران،صاحبان گروه و ادمین های ربات بگیرید*", 0, "md")
        end
     end
   if is_silent_user(matches[2], chat) then
   if not lang then
   return tdcli.sendMessage(msg.to.id, "", 0, "_User "..matches[2].." is already silent_", 0, "md")
   else
   return tdcli.sendMessage(msg.to.id, "", 0, "*کاربر "..matches[2].." از قبل توانایی چت کردن رو نداشت*", 0, "md")
        end
     end
data[tostring(chat)]['is_silent_users'][tostring(matches[2])] = ""
    save_data(_config.moderation.data, data)
    if not lang then
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "_User "..matches[2].." added to silent users list_", 0, "md")
  else
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "*کاربر "..matches[2].." توانایی چت کردن رو از دست داد*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="silent"})
      end
   end
 if ((matches[1]:lower() == "unsilent" and not lang) or (matches[1] == "حذف سکوت" and lang)) and is_mod(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="unsilent"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if not is_silent_user(matches[2], chat) then
     if not lang then
     return tdcli.sendMessage(msg.to.id, "", 0, "_User "..matches[2].." is not silent_", 0, "md")
   else
     return tdcli.sendMessage(msg.to.id, "", 0, "*کاربر "..matches[2].." از قبل توانایی چت کردن رو داشت*", 0, "md")
        end
     end
data[tostring(chat)]['is_silent_users'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
   if not lang then
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "_User "..matches[2].." removed from silent users list_", 0, "md")
  else
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "*کاربر "..matches[2].." توانایی چت کردن رو به دست آورد*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="unsilent"})
      end
end
end
		if ((matches[1]:lower() == 'clean' and not lang) or (matches[1]:lower() == 'پاک کردن' and lang)) and is_sudo(msg) then
		
			if matches[2]:lower() == 'gbans' or matches[2] == 'لیست سوپر بن' then
				if next(data['gban_users']) == nil then
				if not lang then
					return "_No_ *globally banned* _users available_"
					else
					return "*هیچ کاربری از گروه های ربات محروم نشده*"
					end
				end
				for k,v in pairs(data['gban_users']) do
					data['gban_users'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
				if not lang then
				return "_All_ *globally banned* _users has been unbanned_"
				else
				return "*تمام کاربرانی که از گروه های ربات محروم بودند از محرومیت خارج شدند*"
				end
			end
     end
if ((matches[1]:lower() == "gbanlist" and not lang) or (matches[1] == "لیست سوپر بن" and lang)) and is_admin(msg) then
  return gbanned_list(msg)
 end
   if msg.to.type ~= 'pv' then
if ((matches[1]:lower() == "silentlist" and not lang) or (matches[1] == "لیست سکوت" and lang)) and is_mod(msg) then
  return silent_users_list(chat)
 end
if ((matches[1]:lower() == "banlist" and not lang) or (matches[1] == "لیست بن" and lang)) and is_mod(msg) then
  return banned_list(chat)
     end
  end
  if ((matches[1]:lower() == 'plist' and not lang) or (matches[1] == 'لیست پلاگین' and lang)) and is_sudo(msg) then
    return list_all_plugins(false, msg)
  end
    if ((matches[1]:lower() == 'reload' and not lang) or (matches[1] == 'بارگذاری' and lang)) and is_sudo(msg) then
    return reload_plugins(true, msg)
  end
if matches[1]:lower() == 'matador' or matches[1] == 'ماتادور' then
return tdcli.sendMessage(msg.to.id, msg.id, 1, _config.info_text, 1, 'md')
end
redis:incr("allmsg")
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match('-100(%d+)') then
if not redis:sismember("su",msg.chat_id_) then
redis:sadd("su",msg.chat_id_)
end
elseif id:match('-(%d+)') then
if not redis:sismember("gp",msg.chat_id_) then
redis:sadd("gp",msg.chat_id_)
end
elseif id:match('') then
if not redis:sismember("user",msg.chat_id_) then
redis:sadd("user",msg.chat_id_)
end
end
end
if ((matches[1]:lower() == 'stats'and not lang) or (matches[1] == 'موقیت گپ'and lang)) and is_sudo(msg) then
-------------------------------------------------
local allmsg = redis:get("allmsg")
-------------------------------------------------
local gps = redis:scard("su")
-------------------------------------------------
local gp = redis:scard("gp")
-------------------------------------------------
local user = redis:scard("user")
-------------------------------------------------
       return '>گزارش ربات: \n\n> تمام پیام های دریافتی : '..allmsg..'\n\n> تعداد سوپر گروه ها : '..gps..'\n\n> تعداد گروه ها : '..gp..'\n\n> کاربران پیوی: '..user..'\n'
end
if ((matches[1]:lower() == "open"and not lang) or(matches[1] == "باز گپ"and lang)) and is_sudo(msg) then 
  local text = matches[2]
  tdcli.openChat(text)
  tdcli.sendMessage(msg.chat_id_, msg.id_, 1,"*Done!\nGroup* `"..text.."` *has Been Reloaded*", 1, 'md')     
end
if ((matches[1]:lower() == "openchat"and not lang) or(matches[1] == "باز گپ ها"and lang)) and is_sudo(msg) then 
local chat = redis:smembers('su')
  for i=1, #chat do
  tdcli.openChat(chat[i])
  end
  tdcli.sendMessage(msg.chat_id_, msg.id_, 1,"*Reloaded Chat*", 1, 'md')     
end
if matches[1]:lower() == "nerkh" or matches[1] == 'نرخ' then
text = [[
*💵 نرخ فروش گروه با ربات*
_⚜  ᴹᵃ̶ᵀ̶ᵃ̶ᴰ̶ᵒ̶ᴿ̶ ̶ᴮ̶ᵒ̶ᵀ ⚜_

*✳️برای تمام گروه ها‌*
 
`➰1 ماهه  8 هزار تومان 
➰2 ماهه  14 هزار تومان
➰3 ماهه  20 هزار تومان
➰4 ماهه  25 هزار تومان`

*🔰 نکات قابل ذکر :*

1⃣ `توجه داشته باشید ربات به مدت ۲۴ الی ۴۸ ساعت برای تست در گروه نصب میشود و بعد تست و رضایت کامل اعمالات صورت میگیرد

2⃣ همچنین باید قبل از پایان مهلت تست رضایت کامل هزینه پرداخت شود درغیر این صورت ربات خارج میشود

3⃣ لازم به ذکره اولویت بصورت پرداخت کارت به کارت میباشد

4⃣ ربات داعمی نداریم به علت کیفیت و کارای بالای ربات`

*برای خرید به ایدی زیر‌ مراجعه کنید‌ :*
🆔 : @MahDiRoO

*در صورت ریپورت بودن به ایدی زیر مراجعه کنید :*
🆔 : @MahDiRoO\_Bot
]]
return text
end
end
----------------------------------------
local checkmod = true
local function pre_processw(msg)
local chat = msg.to.id
local user = msg.from.id
local hash = "gp_lang:"..chat
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
 if checkmod and msg.text and msg.to.type == 'channel' then
 	checkmod = false
	tdcli.getChannelMembers(msg.to.id, 0, 'Administrators', 200, function(a, b)
	local secchk = true
		for k,v in pairs(b.members_) do
			if v.user_id_ == tonumber(our_id) then
				secchk = false
			end
		end
		if secchk then
			checkmod = false
			if not lang then
				return tdcli.sendMessage(msg.to.id, 0, 1, '_Robot isn\'t Administrator, Please promote to Admin!_', 1, "md")
			else
				return tdcli.sendMessage(msg.to.id, 0, 1, '_لطفا برای کارکرد کامل دستورات، ربات را به مدیر گروه ارتقا دهید._', 1, "md")
			end
		end
	end, nil)
 end
	local function welcome_cb(arg, data)
	local url , res = http.request('http://probot.000webhostapp.com/api/time.php/')
          if res ~= 200 then return "No connection" end
      local jdat = json:decode(url)
		administration = load_data(_config.moderation.data)
    if administration[arg.chat_id]['setwelcome'] then
     welcome = administration[arg.chat_id]['setwelcome']
      else
     if not lang then
     welcome = "*Welcome Dude*"
    elseif lang then
     welcome = "_خوش آمدید_"
        end
     end
 if administration[tostring(arg.chat_id)]['rules'] then
rules = administration[arg.chat_id]['rules']
else
   if not lang then
     rules = "ℹ️ The Default Rules :\n1⃣ No Flood.\n2⃣ No Spam.\n3⃣ No Advertising.\n4⃣ Try to stay on topic.\n5⃣ Forbidden any racist, sexual, homophobic or gore content.\n➡️ Repeated failure to comply with these rules will cause ban.\n@BeyondTeam"
    elseif lang then
       rules = "ℹ️ قوانین پپیشفرض:\n1⃣ ارسال پیام مکرر ممنوع.\n2⃣ اسپم ممنوع.\n3⃣ تبلیغ ممنوع.\n4⃣ سعی کنید از موضوع خارج نشید.\n5⃣ هرنوع نژاد پرستی, شاخ بازی و پورنوگرافی ممنوع .\n➡️ از قوانین پیروی کنید, در صورت عدم رعایت قوانین اول اخطار و در صورت تکرار مسدود.\n@BeyondTeam"
 end
end
if data.username_ then
user_name = "@"..check_markdown(data.username_)
else
user_name = ""
end
		local welcome = welcome:gsub("{rules}", rules)
		local welcome = welcome:gsub("{name}", check_markdown(data.first_name_..' '..(data.last_name_ or '')))
		local welcome = welcome:gsub("{username}", user_name)
		local welcome = welcome:gsub("{time}", jdat.ENtime)
		local welcome = welcome:gsub("{date}", jdat.ENdate)
		local welcome = welcome:gsub("{timefa}", jdat.FAtime)
		local welcome = welcome:gsub("{datefa}", jdat.FAdate)
		local welcome = welcome:gsub("{gpname}", arg.gp_name)
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, welcome, 0, "md")
	end
	if data[tostring(chat)] and data[tostring(chat)]['settings'] then
	if msg.adduser then
		welcome = data[tostring(msg.to.id)]['settings']['welcome']
		if welcome == "yes" then
			tdcli.getUser(msg.adduser, welcome_cb, {chat_id=chat,msg_id=msg.id_,gp_name=msg.to.title})
		else
			return false
		end
	end
	if msg.joinuser then
		welcome = data[tostring(msg.to.id)]['settings']['welcome']
		if welcome == "yes" then
			tdcli.getUser(msg.sender_user_id_, welcome_cb, {chat_id=chat,msg_id=msg.id_,gp_name=msg.to.title})
		else
			return false
        end
		end
	end

 end
----------------------------------------
return {
patterns ={
"^[#!/](.*)$",
"^(.*)$",
"^[#!/]([Ii][Dd]) (.*)$",
"^([Ii][Dd]) (.*)$",
"^(ایدی) (.*)$",
"^[#!/]([Rr][Ee][Mm]) (.*)$",
"^([Rr][Ee][Mm]) (.*)$",
"^(لغو نصب) (.*)$",
"^[#!/]([Ss][Ee][Tt][Mm][Aa][Nn][Aa][Gg][Ee][Rr]) (.*)$",
"^([Ss][Ee][Tt][Mm][Aa][Nn][Aa][Gg][Ee][Rr]) (.*)$",
"^(ادمین گروه) (.*)$",
"^[#!/]([Rr][Ee][Mm][Mm][Aa][Nn][Aa][Gg][Ee][Rr]) (.*)$",
"^([Rr][Ee][Mm][Mm][Aa][Nn][Aa][Gg][Ee][Rr]) (.*)$",
"^(حذف ادمین گروه) (.*)$",
"^[#!/]([Ww][Hh][Ii][Tt][Ee][Ll][Ii][Ss][Tt]) ([+-])$",
"^([Ww][Hh][Ii][Tt][Ee][Ll][Ii][Ss][Tt]) ([+-])$",
"^[#!/]([Ww][Hh][Ii][Tt][Ee][Ll][Ii][Ss][Tt]) ([+-]) (.*)$",
"^([Ww][Hh][Ii][Tt][Ee][Ll][Ii][Ss][Tt]) ([+-]) (.*)$",
"^(لیست سفید) ([+-])$",
"^(لیست سفید) ([+-]) (.*)$",
"^[#!/]([Ss][Ee][Tt][Oo][Ww][Nn][Ee][Rr]) (.*)$",
"^([Ss][Ee][Tt][Oo][Ww][Nn][Ee][Rr]) (.*)$",
"^(مالک) (.*)$",
"^[#!/]([Rr][Ee][Mm][Oo][Ww][Nn][Ee][Rr]) (.*)$",
"^([Rr][Ee][Mm][Oo][Ww][Nn][Ee][Rr]) (.*)$",
"^(حذف مالک) (.*)$",
"^[#!/]([Pp][Rr][Oo][Mm][Oo][Tt][Ee]) (.*)$",
"^([Pp][Rr][Oo][Mm][Oo][Tt][Ee]) (.*)$",
"^(مدیر) (.*)$",
"^[#!/]([Dd][Ee][Mm][Oo][Tt][Ee]) (.*)$",
"^([Dd][Ee][Mm][Oo][Tt][Ee]) (.*)$",
"^(حذف مدیر) (.*)$",
"^[#!/]([Ll][Oo][Cc][Kk]) (.*)$",
"^([Ll][Oo][Cc][Kk]) (.*)$",
"^[#!/]([Un][Nn][Ll][Oo][Cc][Kk]) (.*)$",
"^([Uu][Nn][Ll][Oo][Cc][Kk]) (.*)$",
"^(قفل) (.*)$",
"^(بازکردن) (.*)$",
"^[!/#]([Pp][Hh][Oo][Tt][Oo]) (.*)$",
"^([Pp][Hh][Oo][Tt][Oo]) (.*)$",
"^(عکس) (.*)$",
"^[!/#]([Dd][Oo][Cc][Uu][Mm][Ee][Nn][Tt]) (.*)$",
"^([Dd][Oo][Cc][Uu][Mm][Ee][Nn][Tt]) (.*)$",
"^(فایل) (.*)$",
"^[!/#]([Ss][Tt][Ii][Cc][Kk][Ee][Rr]) (.*)$",
"^([Ss][Tt][Ii][Cc][Kk][Ee][Rr]) (.*)$",
"^(استیکر) (.*)$",
"^[!/#]([Kk][Ee][Yy][Bb][Oo][Aa][Rr][Dd]) (.*)$",
"^([Kk][Ee][Yy][Bb][Oo][Aa][Rr][Dd]) (.*)$",
"^(صفحه کلید) (.*)$",
"^[!/#]([Vv][Ii][Dd][Ee][Oo]) (.*)$",
"^([Vv][Ii][Dd][Ee][Oo]) (.*)$",
"^(فیلم) (.*)$",
"^[!/#]([Tt][Ee][Xx][Tt]) (.*)$",
"^([Tt][Ee][Xx][Tt]) (.*)$",
"^(متن) (.*)$",
"^[!/#]([Ff][Oo][Rr][Ww][Aa][Rr][Dd]) (.*)$",
"^([Ff][Oo][Rr][Ww][Aa][Rr][Dd]) (.*)$",
"^(فوروارد) (.*)$",
"^[!/#]([Ll][Oo][Cc][Aa][Tt][Ii][Oo][Nn]) (.*)$",
"^([Ll][Oo][Cc][Aa][Tt][Ii][Oo][Nn]) (.*)$",
"^(مکان) (.*)$",
"^[!/#]([Aa][Uu][Dd][Ii][Oo]) (.*)$",
"^([Aa][Uu][Dd][Ii][Oo]) (.*)$",
"^(اهنگ) (.*)$",
"^[!/#]([Vv][Oo][Ii][Cc][Ee]) (.*)$",
"^([Vv][Oo][Ii][Cc][Ee]) (.*)$",
"^(ویس) (.*)$",
"^[!/#]([Cc][Oo][Nn][Tt][Aa][Cc][Tt]) (.*)$",
"^([Cc][Oo][Nn][Tt][Aa][Cc][Tt]) (.*)$",
"^(مخاطب) (.*)$",
"^[!/#]([Ii][Nn][Ll][Ii][Nn][Ee]) (.*)$",
"^([Ii][Nn][Ll][Ii][Nn][Ee]) (.*)$",
"^(کیبورد شیشه ای) (.*)$",
"^[!/#]([Gg][Aa][Mm][Ee]) (.*)$",
"^([Gg][Aa][Mm][Ee]) (.*)$",
"^(بازی) (.*)$",
"^[!/#]([Ll][Ii][Nn][Kk]) (.*)$",
"^([Ll][Ii][Nn][Kk]) (.*)$",
"^(لینک) (.*)$",
"^[!/#]([Ee][Dd][Ii][Tt]) (.*)$",
"^([Ee][Dd][Ii][Tt]) (.*)$",
"^(ویرایش) (.*)$",
"^[!/#]([Tt][Aa][Gg]) (.*)$",
"^([Tt][Aa][Gg]) (.*)$",
"^(تگ) (.*)$",
"^[!/#]([Uu][Ss][Ee][Rr][Nn][Aa][Mm][Ee]) (.*)$",
"^([Uu][Ss][Ee][Rr][Nn][Aa][Mm][Ee]) (.*)$",
"^(نام کاربری) (.*)$",
"^[!/#]([Aa][Rr][Aa][Bb][Ii][Cc]) (.*)$",
"^([Aa][Rr][Aa][Bb][Ii][Cc]) (.*)$",
"^(عربی) (.*)$",
"^[!/#]([Ww][Ee][Bb][Pp][Aa][Gg][Ee]) (.*)$",
"^([Ww][Ee][Bb][Pp][Aa][Gg][Ee]) (.*)$",
"^(وب) (.*)$",
"^[!/#]([Mm][Aa][Rr][Kk][Dd][Oo][Ww][Nn]) (.*)$",
"^([Mm][Aa][Rr][Kk][Dd][Oo][Ww][Nn]) (.*)$",
"^(فراخوانی) (.*)$",
"^[!/#]([Mm][Ee][Nn][Tt][Ii][Oo][Nn]) (.*)$",
"^([Mm][Ee][Nn][Tt][Ii][Oo][Nn]) (.*)$",
"^(فونت) (.*)$",
"^[!/#]([Ee][Nn][Gg][Ll][Ii][Ss][Hh]) (.*)$",
"^([Ee][Nn][Gg][Ll][Ii][Ss][Hh]) (.*)$",
"^(انگلیسی) (.*)$",
"^[#!/]([Ss][Ee][Tt][Ll][Ii][Nn][Kk]) ([https?://w]*.?telegram.me/joinchat/%S+)$",
"^([Ss][Ee][Tt][Ll][Ii][Nn][Kk]) ([https?://w]*.?telegram.me/joinchat/%S+)$",
"^[#!/]([Ss][Ee][Tt][Ll][Ii][Nn][Kk]) ([https?://w]*.?t.me/joinchat/%S+)$",
"^([Ss][Ee][Tt][Ll][Ii][Nn][Kk]) ([https?://w]*.?t.me/joinchat/%S+)$",
"^(تنظیم لینک) ([https?://w]*.?telegram.me/joinchat/%S+)$",
"^(تنظیم لینک) ([https?://w]*.?t.me/joinchat/%S+)$",
"^[#!/]([Bb][Aa][Nn]) (.*)$",
"^([Bb][Aa][Nn]) (.*)$",
"^(بن) (.*)$",
"^[#!/]([Uu][Nn][Bb][Aa][Nn]) (.*)$",
"^([Uu][Nn][Bb][Aa][Nn]) (.*)$",
"^(حذف بن) (.*)$",
"^[#!/]([Mm][Uu][Tt][Ee][Aa][Ll][Ll]) ([Ss][Tt][Aa][Tt][Uu][Ss])$",
"^([Mm][Uu][Tt][Ee][Aa][Ll][Ll]) ([Ss][Tt][Aa][Tt][Uu][Ss])$",
"^[#!/]([Mm][Uu][Tt][Ee][Tt][Ii][Mm][Ee]) (%d+) (%d+) (%d+)$",
"^([Mm][Uu][Tt][Ee][Tt][Ii][Mm][Ee]) (%d+) (%d+) (%d+)$",
"^[#!/]([Mm][Uu][Tt][Ee][Hh][Oo][Uu][Rr][Ss]) (%d+)$",
"^([Mm][Uu][Tt][Ee][Hh][Oo][Uu][Rr][Ss]) (%d+)$",
"^[#!/]([Mm][Uu][Tt][Ee][Mm][Ii][Nn][Uu][Tt][Ee][Ss]) (%d+)$",
"^([Mm][Uu][Tt][Ee][Mm][Ii][Nn][Uu][Tt][Ee][Ss]) (%d+)$",
"^[#!/]([Mm][Uu][Tt][Ee][Ss][Ee][Cc][Oo][Nn][Dd][Ss]) (%d+)$",
"^([Mm][Uu][Tt][Ee][Ss][Ee][Cc][Oo][Nn][Dd][Ss]) (%d+)$",
"^(بیصدا) (موقعیت)$",
"^(زمان بیصدا) (%d+) (%d+) (%d+)$",
"^(ساعت بیصدا) (%d+)$",
"^(دقیقه بیصدا) (%d+)$",
"^(ثانیه بیصدا) (%d+)$",
"^[#!/]([Pp][Ll]) (+) ([%w_%.%-]+)$",
"^([Pp][Ll]) (+) ([%w_%.%-]+)$",
"^[#!/]([Pp][Ll]) (-) ([%w_%.%-]+)$",
"^([Pp][Ll]) (-) ([%w_%.%-]+)$",
"^[#!/]([Pp][Ll]) (+) ([%w_%.%-]+) ([Cc][Hh][Aa][Tt])$",
"^([Pp][Ll]) (+) ([%w_%.%-]+) ([Cc][Hh][Aa][Tt])$",
"^[#!/]([Pp][Ll]) (-) ([%w_%.%-]+) ([Cc][Hh][Aa][Tt])$",
"^([Pp][Ll]) (-) ([%w_%.%-]+) ([Cc][Hh][Aa][Tt])$",
"^[#!/]([Pp][Ll]) (*)$",
"^([Pp][Ll]) (*)$",
"^(پلاگین) (+) ([%w_%.%-]+)$",
"^(پلاگین) (-) ([%w_%.%-]+)$",
"^(پلاگین) (+) ([%w_%.%-]+) ([Cc][Hh][Aa][Tt])$",
"^(پلاگین) (-) ([%w_%.%-]+) ([Cc][Hh][Aa][Tt])$",
"^(پلاگین) (*)$",
"^[#!/]([Ss][Uu][Dd][Oo][Ss][Ee][Tt]) (.*)$",
"^([Ss][Uu][Dd][Oo][Ss][Ee][Tt]) (.*)$",
"^(افزودن سودو) (.*)$",
"^[#!/]([Ss][Uu][Dd][Oo][Dd][Ee][Mm]) (.*)$",
"^([Ss][Uu][Dd][Oo][Dd][Ee][Mm]) (.*)$",
"^(حذف سودو)$",
"^(حذف سودو) (.*)$",
"^[#!/]([Aa][Dd][Mm][Ii][Nn][Ss][Ee][Tt]) (.*)$",
"^([Aa][Dd][Mm][Ii][Nn][Ss][Ee][Tt]) (.*)$",
"^(افزودن ادمین)$",
"^(افزودن ادمین) (.*)$",
"^[#!/]([Aa][Dd][Mm][Ii][Nn][Dd][Ee][Mm]) (.*)$",
"^([Aa][Dd][Mm][Ii][Nn][Dd][Ee][Mm]) (.*)$",
"^(حذف ادمین)$",
"^(حذف ادمین) (.*)$",
"^[#!/]([Cc][Hh][Ee][Cc][Kk][Ee][Xx][Pp][Ii][Rr][Ee]) (.*)$",
"^([Cc][Hh][Ee][Cc][Kk][Ee][Xx][Pp][Ii][Rr][Ee]) (.*)$",
"^[#!/]([Cc][Hh][Aa][Rr][Gg][Ee]) (.*) (%d+)$",
"^([Cc][Hh][Aa][Rr][Gg][Ee]) (.*) (%d+)$",
"^[#!/]([Cc][Hh][Aa][Rr][Gg][Ee]) (%d+)$",
"^([Cc][Hh][Aa][Rr][Gg][Ee]) (%d+)$",
"^(اعتبار) (.*)$",
"^(شارژ) (.*) (%d+)$",
"^(شارژ) (%d+)$",
"^[#!/]([Ss][Ee][Tt][Rr][Uu][Ll][Ee][Ss]) (.*)$",
"^([Ss][Ee][Tt][Rr][Uu][Ll][Ee][Ss]) (.*)$",
"^(تنظیم قوانین) (.*)$",
"^[#!/]([Ss][Ee][Tt][Aa][Bb][Oo][Uu][Tt]) (.*)$",
"^([Ss][Ee][Tt][Aa][Bb][Oo][Uu][Tt]) (.*)$",
"^(تنظیم درباره) (.*)$",
"^[#!/]([Ss][Ee][Tt][Nn][Aa][Mm][Ee]) (.*)$",
"^([Ss][Ee][Tt][Nn][Aa][Mm][Ee]) (.*)$",
"^(تنظیم نام) (.*)$",
"^[#!/]([Cc][Ll][Ee][Aa][Nn]) (.*)$",
"^([Cc][Ll][Ee][Aa][Nn]) (.*)$",
"^(پاک کردن) (.*)$",
"^[#!/]([Ss][Ee][Tt][Ff][Ll][Oo][Oo][Dd]) (%d+)$",
"^([Ss][Ee][Tt][Ff][Ll][Oo][Oo][Dd]) (%d+)$",
"^[#!/]([Ss][Ee][Tt][Cc][Hh][Aa][Rr]) (%d+)$",
"^([Ss][Ee][Tt][Cc][Hh][Aa][Rr]) (%d+)$",
"^[#!/]([Ss][Ee][Tt][Ff][Ll][Oo][Oo][Dd][Tt][Ii][Mm][Ee]) (%d+)$",
"^([Ss][Ee][Tt][Ff][Ll][Oo][Oo][Dd][Tt][Ii][Mm][Ee]) (%d+)$",
"^(تنظیم پیام مکرر) (%d+)$",
"^(حداکثر حروف مجاز) (%d+)$",
"^(تنظیم زمان بررسی) (%d+)$",
"^[#!/]([Rr][Ee][Ss]) (.*)$",
"^([Rr][Ee][Ss]) (.*)$",
"^[#!/]([Ww][Hh][Oo][Ii][Ss]) (%d+)$",
"^([Ww][Hh][Oo][Ii][Ss]) (%d+)$",
"^(کاربری) (.*)$",
"^(شناسه) (%d+)$",
"^[#!/]([Cc][Mm][Dd][Ss]) (.*)$",
"^([Cc][Mm][Dd][Ss]) (.*)$",
"^(دستورات) (.*)$",
"^[#!/]([Ss][Ee][Tt][Ll][Aa][Nn][Gg]) ([Ff][Aa])$",
"^([Ss][Ee][Tt][Ll][Aa][Nn][Gg]) ([Ff][Aa])$",
"^[#!/]([Ss][Ee][Tt][Cc][Mm][Dd]) ([Ff][Aa])$",
"^([Ss][Ee][Tt][Cc][Mm][Dd]) ([Ff][Aa])$",
"^[#!/]([Ff][Ii][Ll][Tt][Ee][Rr]) (.*)$",
"^([Ff][Ii][Ll][Tt][Ee][Rr]) (.*)$",
"^(فیلتر) (.*)$",
"^[#!/]([Uu][Nn][Ff][Ii][Ll][Tt][Ee][Rr]) (.*)$",
"^([Uu][Nn][Ff][Ii][Ll][Tt][Ee][Rr]) (.*)$",
"^(حذف فیلتر) (.*)$",
"^[#!/]([Ss][Ee][Tt][Ww][Ee][Ll][Cc][Oo][Mm][Ee]) (.*)$",
"^([Ss][Ee][Tt][Ww][Ee][Ll][Cc][Oo][Mm][Ee]) (.*)$",
"^[#!/]([Ww][Ee][Ll][Cc][Oo][Mm][Ee]) (.*)$",
"^([Ww][Ee][Ll][Cc][Oo][Mm][Ee]) (.*)$",
"^(تنظیم خوشآمد) (.*)$",
"^(خوشآمد) (.*)$",
"^[#!/]([Ww][Ee][Aa][Tt][Hh][Ee][Rr]) (.*)$",
"^([Ww][Ee][Aa][Tt][Hh][Ee][Rr]) (.*)$",
"^[#!/]([Aa][Zz][Aa][Nn]) (.*)$",
"^([Aa][Zz][Aa][Nn]) (.*)$",
"^[#!/]([Cc][Aa][Ll][Cc]) (.*)$",
"^([Cc][Aa][Ll][Cc]) (.*)$",
"^[#!/]([Tt][Rr]) ([^%s]+) (.*)$",
"^([Tt][Rr]) ([^%s]+) (.*)$",
"^[#!/]([Ss][Hh][Oo][Rr][Tt]) (.*)$",
"^([Ss][Hh][Oo][Rr][Tt]) (.*)$",
"^[#!/]([Gg][Ii][Ff]) (.*)$",
"^([Gg][Ii][Ff]) (.*)$",
"^(گیف) (.*)$",
"^[#!/]([Ss][Tt][Ii][Cc][Kk][Ee][Rr]) (.+)$",
"^(اب و هوا) (.*)$",
"^(اذان) (.*)$",
"^(حساب کن) (.*)$",
"^(ترجمه) ([^%s]+) (.*)$",
"^(لینک کوتاه) (.*)$",
"^[#!/]([Dd][Ee][Ll][Aa][Ll][Ll]) (.*)$",
"^([Dd][Ee][Ll][Aa][Ll][Ll]) (.*)$",
"^[#!/]([Rr][Mm][Ss][Gg]) (%d*)$",
"^([Rr][Mm][Ss][Gg]) (%d*)$",
"^(پاکسازی) (%d*)$",
"^(حذف پیام) (.*)$",
"^[#!/]([Ll][Ee][Aa][Vv][Ee]) (.*)$",
"^([Ll][Ee][Aa][Vv][Ee]) (.*)$",
"^(خروج) (.*)$",
"^[#!/]([Ww][Rr][Ii][Tt][Ee]) (.*)$",
"^([Ww][Rr][Ii][Tt][Ee]) (.*)$",
"^(نوشتن) (.*)$",
"^[#!/]([Aa][Uu][Tt][Oo][Ll][Ee][Aa][Vv][Ee]) (.*)$",
"^([Aa][Uu][Tt][Oo][Ll][Ee][Aa][Vv][Ee]) (.*)$",
"^(خروج خودکار) (.*)$",
"^[#!/]([Cc][Rr][Ee][Aa][Tt][Ee][Gg][Rr][Oo][Uu][Pp]) (.*)$",
"^([Cc][Rr][Ee][Aa][Tt][Ee][Gg][Rr][Oo][Uu][Pp]) (.*)$",
"^[#!/]([Cc][Rr][Ee][Aa][Tt][Ee][Ss][Uu][Pp][Ee][Rr]) (.*)$",
"^([Cc][Rr][Ee][Aa][Tt][Ee][Ss][Uu][Pp][Ee][Rr]) (.*)$",
"^(ساخت گروه) (.*)$",
"^(ساخت سوپر گروه) (.*)$",
"^[#!/]([Jj][Oo][Ii][Nn]) (.*)$",
"^([Jj][Oo][Ii][Nn]) (.*)$",
"^[#!/]([Jj][Oo][Ii][Nn][Tt][Oo]) (.*)$",
"^([Jj][Oo][Ii][Nn][Tt][Oo]) (.*)$",
"^(ورود به) (.*)$",
"^(ورود) (.*)$",
"^[#!/]([Ss][Ee][Tt][Bb][Oo][Tt][Nn][Aa][Mm][Ee]) (.*)$",
"^([Ss][Ee][Tt][Bb][Oo][Tt][Nn][Aa][Mm][Ee]) (.*)$",
"^[#!/]([Ss][Ee][Tt][Bb][Oo][Tt][Uu][Ss][Ee][Rr][Nn][Aa][Mm][Ee]) (.*)$",
"^([Ss][Ee][Tt][Bb][Oo][Tt][Uu][Ss][Ee][Rr][Nn][Aa][Mm][Ee]) (.*)$",
"^[#!/]([Dd][Ee][Ll][Bb][Oo][Tt][Uu][Ss][Ee][Rr][Nn][Aa][Mm][Ee]) (.*)$",
"^([Dd][Ee][Ll][Bb][Oo][Tt][Uu][Ss][Ee][Rr][Nn][Aa][Mm][Ee]) (.*)$",
"^(حذف یوزرنیم ربات) (.*)$",
"^(تغییر یوزرنیم ربات) (.*)$",
"^(تغییر نام ربات) (.*)$",
"^[#!/]([Bb][Aa][Nn][Aa][Ll][Ll]) (.*)$",
"^([Bb][Aa][Nn][Aa][Ll][Ll]) (.*)$",
"^[#!/]([Uu][Nn][Bb][Aa][Nn][Aa][Ll][Ll]) (.*)$",
"^([Uu][Nn][Bb][Aa][Nn][Aa][Ll][Ll]) (.*)$",
"^[#!/]([Ss][Ii][Ll][Ee][Nn][Tt]) (.*)$",
"^([Ss][Ii][Ll][Ee][Nn][Tt]) (.*)$",
"^[#!/]([Uu][Nn][Ss][Ii][Ll][Ee][Nn][Tt]) (.*)$",
"^([Uu][Nn][Ss][Ii][Ll][Ee][Nn][Tt]) (.*)$",
"^(سوپر بن) (.*)$",
"^(حذف سوپر بن)$",
"^(حذف سوپر بن) (.*)$",
"^(سکوت) (.*)$",
"^(حذف سکوت)$",
"^(حذف سکوت) (.*)$",
"^[#!/]([Kk][Ii][Cc][Kk]) (.*)$",
"^([Kk][Ii][Cc][Kk]) (.*)$",
"^(اخراج) (.*)$",
"^[#!/]([Ii][Nn][Ff][Oo]) (.*)$",
"^([Ii][Nn][Ff][Oo]) (.*)$",
"^(اطلاعات ایدی) (.*)$",
"^[#!/]([Ii][Mm][Pp][Oo][Rr][Tt]) (.*)$",
"^([Ii][Mm][Pp][Oo][Rr][Tt]) (.*)$",
"^[#!/]([Mm][Aa][Rr][Kk][Rr][Ee][Aa][Dd]) (.*)$",
"^([Mm][Aa][Rr][Kk][Rr][Ee][Aa][Dd]) (.*)$",
"^[#!/]([Bb][Cc]) +(.*) (.*)$",
"^([Bb][Cc]) +(.*) (.*)$",
"^[#!/]([Bb][Rr][Oo][Aa][Dd][Cc][Aa][Ss][Tt]) (.*)$",
"^([Bb][Rr][Oo][Aa][Dd][Cc][Aa][Ss][Tt]) (.*)$",
"^[#!/]([Ss][Ee][Nn][Dd][Ff][Ii][Ll][Ee]) (.*) (.*)$",
"^([Ss][Ee][Nn][Dd][Ff][Ii][Ll][Ee]) (.*) (.*)$",
"^[#!/]([Ss][Ee][Nn][Dd][Pp][Ll][Uu][Gg]) (.*)$",
"^([Ss][Ee][Nn][Dd][Pp][Ll][Uu][Gg]) (.*)$",
"^[#!/]([Pp][Ll][Aa][Nn]) ([123]) (.*)$",
"^([Pp][Ll][Aa][Nn]) ([123]) (.*)$",
"^(ارسال فایل) (.*)$",
"^(ارسال به همه) (.*)$",
"^(ارسال پلاگین) (.*)$",
"^(پلن) ([123]) (.*)$",
"^(تیک دوم) (.*)$",
"^(ارسال) +(.*) (.*)$",
"^(ورود لینک (.*)$",
"^[!/#]([Ss][Ee][Tt][Ww][Aa][Rr][Nn]) (%d+)$",
"^([Ss][Ee][Tt][Ww][Aa][Rr][Nn]) (%d+)$",
"^(حداکثر اخطار) (%d+)$",
"^[!/#]([Ss][Ee][Tt][Ee][Nn][Dd]) (.*)$",
"^([Ss][Ee][Tt][Ee][Nn][Dd]) (.*)$",
"^(تنظیم پایان) (.*)$",
"^[!/#]([Oo][Pp][Ee][Nn]) (.*)$",
"^([Oo][Pp][Ee][Nn]) (.*)$",
"^(باز گپ) (.*)$",
"^[!/#](joinch) (.*)$",
"^([https?://w]*.?telegram.me/joinchat/%S+)$",
"^([https?://w]*.?t.me/joinchat/%S+)$"
},
run=run,
pre_process = pre_process,
pre_processb = pre_processb,
pre_processw = pre_processw,
pre_processt = pre_processt
}

