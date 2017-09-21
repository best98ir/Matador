--Begin Core.lua By #MaTaDoRTeaM
local function getindex(t,id) 
	for i,v in pairs(t) do 
		if v == id then 
			return i 
		end 
	end 
	return nil 
end 

local function reload_plugins( ) 
	plugins = {} 
	load_plugins() 
end

local function plugin_enabled( name )
  for k,v in pairs(_config.enabled_plugins) do
    if name == v then
      return k
    end
  end
  return false
end

local function plugin_exists( name )
  for k,v in pairs(plugins_names()) do
    if name..'.lua' == v then
      return true
    end
  end
  return false
end

local function list_all_plugins(only_enabled)
  local tmp = '\n\n[MaTaDoRTeaM](Telegram.Me/MaTaDoRTeaM)'
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
      text = text..nsum..'.'..status..' '..check_markdown(v)..' \n'
    end
  end
  local text = text..'\n\n'..nsum..' *📂plugins installed*\n\n'..nact..' _✔️plugins enabled_\n\n'..nsum-nact..' _❌plugins disabled_'..tmp
  return text
end

local function list_plugins(only_enabled)
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
  local text = text.."\n_🔃All Plugins Reloaded_\n\n"..nact.." *✔️Plugins Enabled*\n"..nsum.." *📂Plugins Installed*\n\n[MaTaDoRTeaM](Telegram.Me/MaTaDoRTeaM)"
return text
end

local function reload_plugins( )
   bot_run()
  plugins = {}
  load_plugins()
  return list_plugins(true)
end


local function enable_plugin( plugin_name )
  print('checking if '..plugin_name..' exists')
  if plugin_enabled(plugin_name) then
    return ''..plugin_name..' _is enabled_'
  end
  if plugin_exists(plugin_name) then
    table.insert(_config.enabled_plugins, plugin_name)
    print(plugin_name..' added to _config table')
    save_config()
    return reload_plugins( )
  else
    return ''..plugin_name..' _does not exists_'
  end
end

local function disable_plugin( name, chat )
  if not plugin_exists(name) then
    return ' '..name..' _does not exists_'
  end
  local k = plugin_enabled(name)
  if not k then
    return ' '..name..' _not enabled_'
  end
  table.remove(_config.enabled_plugins, k)
  save_config( )
  return reload_plugins(true)    
end

local function disable_plugin_on_chat(receiver, plugin)
  if not plugin_exists(plugin) then
    return "_Plugin doesn't exists_"
  end

  if not _config.disabled_plugin_on_chat then
    _config.disabled_plugin_on_chat = {}
  end

  if not _config.disabled_plugin_on_chat[receiver] then
    _config.disabled_plugin_on_chat[receiver] = {}
  end

  _config.disabled_plugin_on_chat[receiver][plugin] = true

  save_config()
  return ' '..plugin..' _disabled on this chat_'
end

local function reenable_plugin_on_chat(receiver, plugin)
  if not _config.disabled_plugin_on_chat then
    return 'There aren\'t any disabled plugins'
  end

  if not _config.disabled_plugin_on_chat[receiver] then
    return 'There aren\'t any disabled plugins for this chat'
  end

  if not _config.disabled_plugin_on_chat[receiver][plugin] then
    return '_This plugin is not disabled_'
  end

  _config.disabled_plugin_on_chat[receiver][plugin] = false
  save_config()
  return ' '..plugin..' is enabled again'
end

local function already_sudo(user_id)
	for k,v in pairs(_config.sudo_users) do
		if user_id == v then
			return k
		end
	end
	-- If not found
	return false
end


local function sudolist(msg)
	local sudo_users = _config.sudo_users
	local text = "Sudo Users :\n"
	for i=1,#sudo_users do
		text = text..i.." - "..sudo_users[i].."\n"
	end
	return text
end

local function helps(msg, GP_id)
local hash = "gp_lang:"..GP_id
local lang = redis:get(hash) 
     if not lang then
	 text = [[
	 *💢 Please check your desired option, select :*
	 ]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> Iηѕтαℓℓ Ɓσт ✔️", callback_data="/help1:"..GP_id},
			{text = '> A∂Mιη Hєℓρ 👑', callback_data = '/help2:'..GP_id}
		},
		{
			{text = '> Ɓυуєя нєℓρ 💶', callback_data = '/help3:'..GP_id},
			{text = '> Lσcк нєℓρ 🔐', callback_data = '/help4:'..GP_id}
		},
		{
			{text = '> Ƭσσℓѕ нєℓρ ⚙', callback_data = '/help5:'..GP_id},
			{text = '> Ƒυη нєℓρ 🤣', callback_data = '/help6:'..GP_id}
		},
		{
			{text= '> Ɓαcк 🔙' ,callback_data = '/helpp:'..GP_id}
		}				
	}
  elseif lang then
	 text = [[
	 *💢 لطفا گزینه مورد نظر خود را انتخاب کنید :*
	 ]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> نصب ربات ✔️", callback_data="/help1:"..GP_id},
			{text = '> راهنمای ادمین 👑', callback_data = '/help2:'..GP_id}
		},
		{
			{text = '> راهنمای خریدار 💶', callback_data = '/help3:'..GP_id},
			{text = '> راهنمای قفلی 🔐', callback_data = '/help4:'..GP_id}
		},
		{
			{text = '> راهنمای ابزار ⚙', callback_data = '/help5:'..GP_id},
			{text = '> راهنمای سرگرمی 🤣', callback_data = '/help6:'..GP_id}
		},
		{
			{text= '> بازگشت 🔙' ,callback_data = '/helpp:'..GP_id}
		}				
	}
  end
    edit_inline(msg.message_id, text, keyboard)
end

local function options(msg, GP_id)
local hash = "gp_lang:"..GP_id
local lang = redis:get(hash) 
     if not lang then
	 text = '`Welcome To` *Group Option* 🤖\nPlease Option Select The Desired .. !'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> Sєттιηgѕ Ƥяσ ⚙", callback_data="/settingsp:"..GP_id},
			{text = "> Sєттιηgѕ ⚙", callback_data="/settings:"..GP_id}
		},
		{
			{text = '> Mσяє 🗞', callback_data = '/more:'..GP_id}
		},
		{
			{text = '> Aвσυт Uѕ 👑', callback_data = '/matador:'..GP_id}
		},
		{
			{text= '> Ɓαcк 🔙' ,callback_data = '/lang:'..GP_id}
		}				
	}
  elseif lang then
	 text = '*به تنظیمات کلی خوشآمدید* 🤖\nلطفا گزینه مورد نظر را انتخاب کنید ..!'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> تنظیمات پیشرفته ⚙", callback_data="/settingsp:"..GP_id},
			{text = "> تنظیمات معمولی ⚙", callback_data="/settings:"..GP_id}
		},
		{
			{text = '> قابلیت های بیشتر 🗞', callback_data = '/more:'..GP_id}
		},
		{
			{text = '> درباره ما 👑', callback_data = '/matador:'..GP_id}
		},
		{
			{text= '> بازگشت 🔙' ,callback_data = '/lang:'..GP_id}
		}				
	}
  end
    edit_inline(msg.message_id, text, keyboard)
end

function moresettingp(msg, data, GP_id)
local hash = "gp_lang:"..GP_id
local lang = redis:get(hash) 
local settings = data[tostring(GP_id)]["settings"]
   if not lang then
 text = '`Welcome To` *Flood Settings* 🤖'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = '> Ƒℓσσ∂ Sєηѕιтινιту ♻️', callback_data = 'MaTaDoRTeaM'}
		},
		{
			{text = "➕", callback_data='/floodup:'..GP_id}, 
			{text = tostring(settings.num_msg_max), callback_data="MaTaDoRTeaM"},
			{text = "➖", callback_data='/flooddown:'..GP_id}
		},
		{
			{text = '> Ƈнαяαcтєя Sєηѕιтινιту 📜', callback_data = 'MaTaDoRTeaM'}
		},
		{
			{text = "➕", callback_data='/charup:'..GP_id}, 
			{text = tostring(settings.set_char), callback_data="MaTaDoRTeaM"},
			{text = "➖", callback_data='/chardown:'..GP_id}
		},
		{
			{text = '> Ƒℓσσ∂ Ƈнєcк Ƭιмє 🎴', callback_data = 'MaTaDoRTeaM'}
		},
		{
			{text = "➕", callback_data='/floodtimeup:'..GP_id}, 
			{text = tostring(settings.time_check), callback_data="MaTaDoRTeaM"},
			{text = "➖", callback_data='/floodtimedown:'..GP_id}
		},
		{
			{text = '> Ɓαcк 🔙', callback_data = '/mutelistp:'..GP_id}
		}				
	}
   elseif lang then
 text = '*به تنظیمات پیام های مکرر خوشآمدید* 🤖'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = '> حداکثر پیام های مکرر ♻️', callback_data = 'MaTaDoRTeaM'}
		},
		{
			{text = "➕", callback_data='/floodup:'..GP_id}, 
			{text = tostring(settings.num_msg_max), callback_data="MaTaDoRTeaM"},
			{text = "➖", callback_data='/flooddown:'..GP_id}
		},
		{
			{text = '> حداکثر حروف مجاز 📜', callback_data = 'MaTaDoRTeaM'}
		},
		{
			{text = "➕", callback_data='/charup:'..GP_id}, 
			{text = tostring(settings.set_char), callback_data="MaTaDoRTeaM"},
			{text = "➖", callback_data='/chardown:'..GP_id}
		},
		{
			{text = '> زمان بررسی پیام های مکرر 🎴', callback_data = 'MaTaDoRTeaM'}
		},
		{
			{text = "➕", callback_data='/floodtimeup:'..GP_id}, 
			{text = tostring(settings.time_check), callback_data="MaTaDoRTeaM"},
			{text = "➖", callback_data='/floodtimedown:'..GP_id}
		},
		{
			{text = '> Ɓαcк 🔙', callback_data = '/mutelistp:'..GP_id}
		}				
	}
   end
    edit_inline(msg.message_id, text, keyboard)
end

function moresetting(msg, data, GP_id)
local hash = "gp_lang:"..GP_id
local lang = redis:get(hash) 
local settings = data[tostring(GP_id)]["settings"]
   if not lang then
 text = '`Welcome To` *Flood Settings* 🤖'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = '> Ƒℓσσ∂ Sєηѕιтινιту ♻️', callback_data = 'MaTaDoRTeaM'}
		},
		{
			{text = "➕", callback_data='/floodup:'..GP_id}, 
			{text = tostring(settings.num_msg_max), callback_data="MaTaDoRTeaM"},
			{text = "➖", callback_data='/flooddown:'..GP_id}
		},
		{
			{text = '> Ƈнαяαcтєя Sєηѕιтινιту 📜', callback_data = 'MaTaDoRTeaM'}
		},
		{
			{text = "➕", callback_data='/charup:'..GP_id}, 
			{text = tostring(settings.set_char), callback_data="MaTaDoRTeaM"},
			{text = "➖", callback_data='/chardown:'..GP_id}
		},
		{
			{text = '> Ƒℓσσ∂ Ƈнєcк Ƭιмє 🎴', callback_data = 'MaTaDoRTeaM'}
		},
		{
			{text = "➕", callback_data='/floodtimeup:'..GP_id}, 
			{text = tostring(settings.time_check), callback_data="MaTaDoRTeaM"},
			{text = "➖", callback_data='/floodtimedown:'..GP_id}
		},
		{
			{text = '> Ɓαcк 🔙', callback_data = '/mutelist:'..GP_id}
		}				
	}
   elseif lang then
 text = '*به تنظیمات پیام های مکرر خوشآمدید* 🤖'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = '> حداکثر پیام های مکرر ♻️', callback_data = 'MaTaDoRTeaM'}
		},
		{
			{text = "➕", callback_data='/floodup:'..GP_id}, 
			{text = tostring(settings.num_msg_max), callback_data="MaTaDoRTeaM"},
			{text = "➖", callback_data='/flooddown:'..GP_id}
		},
		{
			{text = '> حداکثر حروف مجاز 📜', callback_data = 'MaTaDoRTeaM'}
		},
		{
			{text = "➕", callback_data='/charup:'..GP_id}, 
			{text = tostring(settings.set_char), callback_data="MaTaDoRTeaM"},
			{text = "➖", callback_data='/chardown:'..GP_id}
		},
		{
			{text = '> زمان بررسی پیام های مکرر 🎴', callback_data = 'MaTaDoRTeaM'}
		},
		{
			{text = "➕", callback_data='/floodtimeup:'..GP_id}, 
			{text = tostring(settings.time_check), callback_data="MaTaDoRTeaM"},
			{text = "➖", callback_data='/floodtimedown:'..GP_id}
		},
		{
			{text = '> Ɓαcк 🔙', callback_data = '/mutelist:'..GP_id}
		}				
	}
   end
    edit_inline(msg.message_id, text, keyboard)
end

function setting(msg, data, GP_id)
local hash = "gp_lang:"..GP_id
local lang = redis:get(hash) 
	if data[tostring(GP_id)] and data[tostring(GP_id)]['settings'] then
		settings = data[tostring(GP_id)]['settings']
	else
		return
	end
	if settings.lock_link then
		lock_link = settings.lock_link
	else
		lock_link = 'unlock'
	end
	if settings.lock_join then
		lock_join = settings.lock_join
	else
		lock_join = 'unlock'
	end
	if settings.lock_tag then
		lock_tag = settings.lock_tag
	else
		lock_tag = 'unlock'
	end
	if settings.lock_username then
		lock_username = settings.lock_username
	else
		lock_username = 'unlock'
	end
	if settings.lock_pin then
		lock_pin = settings.lock_pin
	else
		lock_pin = 'unlock'
	end
	if settings.lock_arabic then
		lock_arabic = settings.lock_arabic
	else
		lock_arabic = 'unlock'
	end
	if settings.lock_english then
		lock_english = settings.lock_english
	else
		lock_english = 'unlock'
	end
	if settings.lock_mention then
		lock_mention = settings.lock_mention
	else
		lock_mention = 'unlock'
	end
		if settings.lock_edit then
		lock_edit = settings.lock_edit
	else
		lock_edit = 'unlock'
	end
		if settings.lock_spam then
		lock_spam = settings.lock_spam
	else
		lock_spam = 'unlock'
	end
	if settings.lock_flood then
		lock_flood = settings.lock_flood
	else
		lock_flood = 'unlock'
	end
	if settings.lock_markdown then
		lock_markdown = settings.lock_markdown
	else
		lock_markdown = 'unlock'
	end
	if settings.lock_webpage then
		lock_webpage = settings.lock_webpage
	else
		lock_webpage = 'unlock'
	end
	if settings.lock_bots then
		lock_bots = settings.lock_bots
	else
		lock_bots = 'unlock'
	end
	if settings.welcome then
		group_welcone = settings.welcome
	else
		group_welcone = 'no'
	end
    if not lang then
 text = '`Welcome To` *Group Lock Settings* 🤖'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> Edit 🚫", callback_data='MaTaDoRTeaM'}, 
			{text = lock_edit, callback_data="/lockedit:"..GP_id}
		},
		{
			{text = "> Link 📎", callback_data='MaTaDoRTeaM'}, 
			{text = lock_link, callback_data="/locklink:"..GP_id}
		},
		{
			{text = "> Tags #️⃣ ", callback_data='MaTaDoRTeaM'}, 
			{text = lock_tag, callback_data="/locktags:"..GP_id}
		},
		{
			{text = "> UserName #️⃣ ", callback_data='MaTaDoRTeaM'}, 
			{text = lock_username, callback_data="/lockusername:"..GP_id}
		},
		{
			{text = "> Join ⚡️", callback_data='MaTaDoRTeaM'}, 
			{text = lock_join, callback_data="/lockjoinn:"..GP_id}
		},
		{
			{text = "> Flood 💥", callback_data='MaTaDoRTeaM'}, 
			{text = lock_flood, callback_data="/lockfloodn:"..GP_id}
		},
		{
			{text = "> Spam ☢️", callback_data='MaTaDoRTeaM'}, 
			{text = lock_spam, callback_data="/lockspamn:"..GP_id}
		},
		{
			{text = "> Mention ⚠️", callback_data='MaTaDoRTeaM'}, 
			{text = lock_mention, callback_data="/lockmention:"..GP_id}
		},
		{
			{text = "> Arabic 🔠", callback_data='MaTaDoRTeaM'}, 
			{text = lock_arabic, callback_data="/lockarabic:"..GP_id}
		},
		{
			{text = "> English 🔠", callback_data='MaTaDoRTeaM'}, 
			{text = lock_english, callback_data="/lockenglish:"..GP_id}
		},
		{
			{text = "> Webpage 🌐", callback_data='MaTaDoRTeaM'}, 
			{text = lock_webpage, callback_data="/lockwebpage:"..GP_id}
		},
		{
			{text = "> Markdown 💱", callback_data='MaTaDoRTeaM'}, 
			{text = lock_markdown, callback_data="/lockmarkdown:"..GP_id}
		},
		{
			{text = "> Pin 📌", callback_data='MaTaDoRTeaM'}, 
			{text = lock_pin, callback_data="/lockpinn:"..GP_id}
		},
		{
			{text = "> Bots ☯️", callback_data='MaTaDoRTeaM'}, 
			{text = lock_bots, callback_data="/lockbotsn:"..GP_id}
		},
		{
			{text = "> Group Welcome ☄️", callback_data='MaTaDoRTeaM'}, 
			{text = group_welcone, callback_data="/welcome:"..GP_id}
		},
		{
			{text = '> More Settings ♨️', callback_data = '/mutelist:'..GP_id}
		},
		{
			{text = '> Back 🔙', callback_data = '/option:'..GP_id}
		}				
	}
     elseif lang then
 text = '*به تنظیمات قفلی گروه خوش آمدید* 🤖'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> ویرایش 🚫", callback_data='MaTaDoRTeaM'}, 
			{text = lock_edit, callback_data="/lockedit:"..GP_id}
		},
		{
			{text = "> لینک 📎", callback_data='MaTaDoRTeaM'}, 
			{text = lock_link, callback_data="/locklink:"..GP_id}
		},
		{
			{text = "> تگ #️⃣ ", callback_data='MaTaDoRTeaM'}, 
			{text = lock_tag, callback_data="/locktags:"..GP_id}
		},
		{
			{text = "> نام کاربری #️⃣ ", callback_data='MaTaDoRTeaM'}, 
			{text = lock_username, callback_data="/lockusername:"..GP_id}
		},
		{
			{text = "> ورود ⚡️", callback_data='MaTaDoRTeaM'}, 
			{text = lock_join, callback_data="/lockjoinn:"..GP_id}
		},
		{
			{text = "> پیام های مکرر 💥", callback_data='MaTaDoRTeaM'}, 
			{text = lock_flood, callback_data="/lockfloodn:"..GP_id}
		},
		{
			{text = "> هرزنامه ☢️", callback_data='MaTaDoRTeaM'}, 
			{text = lock_spam, callback_data="/lockspamn:"..GP_id}
		},
		{
			{text = "> فراخوانی ⚠️", callback_data='MaTaDoRTeaM'}, 
			{text = lock_mention, callback_data="/lockmention:"..GP_id}
		},
		{
			{text = "> عربی 🔠", callback_data='MaTaDoRTeaM'}, 
			{text = lock_arabic, callback_data="/lockarabic:"..GP_id}
		},
		{
			{text = "> انگلیسی 🔠", callback_data='MaTaDoRTeaM'}, 
			{text = lock_english, callback_data="/lockenglish:"..GP_id}
		},
		{
			{text = "> صفحات وب 🌐", callback_data='MaTaDoRTeaM'}, 
			{text = lock_webpage, callback_data="/lockwebpage:"..GP_id}
		},
		{
			{text = "> فونت 💱", callback_data='MaTaDoRTeaM'}, 
			{text = lock_markdown, callback_data="/lockmarkdown:"..GP_id}
		},
		{
			{text = "> سنجاق کردن 📌", callback_data='MaTaDoRTeaM'}, 
			{text = lock_pin, callback_data="/lockpinn:"..GP_id}
		},
		{
			{text = "> ربات ها ☯️", callback_data='MaTaDoRTeaM'}, 
			{text = lock_bots, callback_data="/lockbotsn:"..GP_id}
		},
		{
			{text = "> خوشآمد گویی ☄️", callback_data='MaTaDoRTeaM'}, 
			{text = group_welcone, callback_data="/welcome:"..GP_id}
		},
		{
			{text = '> تنظیمات بیشتر ♨️', callback_data = '/mutelist:'..GP_id}
		},
		{
			{text = '> بازگشت 🔙', callback_data = '/option:'..GP_id}
		}				
	}
  end
    edit_inline(msg.message_id, text, keyboard)
end

function settingp(msg, data, GP_id)
local hash = "gp_lang:"..GP_id
local lang = redis:get(hash) 
	if data[tostring(GP_id)] and data[tostring(GP_id)]['mutes'] then
		mutes = data[tostring(GP_id)]['mutes']
	else
		return
	end
	if data[tostring(GP_id)] and data[tostring(GP_id)]['settings'] then
		settings = data[tostring(GP_id)]['settings']
	else
		return
	end
	if mutes.mute_text then
		mute_text = mutes.mute_text
	else
		mute_text = 'no'
	end
	if mutes.mute_inline then
		mute_inline = mutes.mute_inline
	else
		mute_inline = 'no'
	end
	if mutes.mute_gif then
		mute_gif = mutes.mute_gif
	else
		mute_gif = 'no'
	end
	if settings.lock_link then
		lock_link = settings.lock_link
	else
		lock_link = 'no'
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
	if settings.lock_username then
		lock_username = settings.lock_username
	else
		lock_username = 'no'
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
	if settings.lock_english then
		lock_english = settings.lock_english
	else
		lock_english = 'no'
	end
	if settings.lock_mention then
		lock_mention = settings.lock_mention
	else
		lock_mention = 'no'
	end
		if settings.lock_edit then
		lock_edit = settings.lock_edit
	else
		lock_edit = 'no'
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
	if settings.lock_webpage then
		lock_webpage = settings.lock_webpage
	else
		lock_webpage = 'no'
	end
	if settings.lock_bots then
		lock_bots = settings.lock_bots
	else
		lock_bots = 'no'
	end
	if settings.welcome then
		group_welcone = settings.welcome
	else
		group_welcone = 'no'
	end
   if mutes.mute_photo then
		mute_photo = mutes.mute_photo
	else
		mute_photo = 'no'
	end
	if mutes.mute_sticker then
		mute_sticker = mutes.mute_sticker
	else
		mute_sticker = 'no'
	end
	if mutes.mute_contact then
		mute_contact = mutes.mute_contact
	else
		mute_contact = 'no'
	end
	if mutes.mute_game then
		mute_game = mutes.mute_game
	else
		mute_game = 'no'
	end
	if mutes.mute_keyboard then
		mute_keyboard = mutes.mute_keyboard
	else
		mute_keyboard = 'no'
	end
	if mutes.mute_forward then
		mute_forward = mutes.mute_forward
	else
		mute_forward = 'no'
	end
	if mutes.mute_location then
		mute_location = mutes.mute_location
	else
		mute_location = 'no'
	end
   if mutes.mute_document then
		mute_document = mutes.mute_document
	else
		mute_document = 'no'
	end
	if mutes.mute_voice then
		mute_voice = mutes.mute_voice
	else
		mute_voice = 'no'
	end
	if mutes.mute_audio then
		mute_audio = mutes.mute_audio
	else
		mute_audio = 'no'
	end
	if mutes.mute_video then
		mute_video = mutes.mute_video
	else
		mute_video = 'no'
	end
	if mutes.mute_tgservice then
		mute_tgservice = mutes.mute_tgservice
	else
		mute_tgservice = 'no'
	end
    if not lang then
 text = '`Welcome To` *Group Lock Settings* 🤖'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> Edit 🚫: "..lock_edit.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "Ban", callback_data="/lockeditb:"..GP_id},
		{text = "Kick", callback_data="/lockeditk:"..GP_id},
		{text = "Warn", callback_data="/lockeditw:"..GP_id},
		{text = "Del", callback_data="/lockeditd:"..GP_id},
		{text = "Ok", callback_data="/lockedito:"..GP_id}
		},
		{
			{text = "> Link 📎: "..lock_link.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "Ban", callback_data="/locklinkb:"..GP_id},
		{text = "Kick", callback_data="/locklinkk:"..GP_id},
		{text = "Warn", callback_data="/locklinkw:"..GP_id},
		{text = "Del", callback_data="/locklinkd:"..GP_id},
		{text = "Ok", callback_data="/locklinko:"..GP_id}
		},
		{
			{text = "> Tags #️⃣ : "..lock_tag.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "Ban", callback_data="/locktagsb:"..GP_id},
		{text = "Kick", callback_data="/locktagsk:"..GP_id},
		{text = "Warn", callback_data="/locktagsw:"..GP_id},
		{text = "Del", callback_data="/locktagsd:"..GP_id},
		{text = "Ok", callback_data="/locktagso:"..GP_id}
		},
		{
			{text = "> UserName #️⃣ : "..lock_username.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "Ban", callback_data="/lockusernameb:"..GP_id},
		{text = "Kick", callback_data="/lockusernamek:"..GP_id},
		{text = "Warn", callback_data="/lockusernamew:"..GP_id},
		{text = "Del", callback_data="/lockusernamed:"..GP_id},
		{text = "Ok", callback_data="/lockusernameo:"..GP_id}
		},
		{
			{text = "> Mention ⚠️: "..lock_mention.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "Ban", callback_data="/lockmentionb:"..GP_id},
		{text = "Kick", callback_data="/lockmentionk:"..GP_id},
		{text = "Warn", callback_data="/lockmentionw:"..GP_id},
		{text = "Del", callback_data="/lockmentiond:"..GP_id},
		{text = "Ok", callback_data="/lockmentiono:"..GP_id}
		},
		{
			{text = "> Arabic 🔠: "..lock_arabic.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "Ban", callback_data="/lockarabicb:"..GP_id},
		{text = "Kick", callback_data="/lockarabick:"..GP_id},
		{text = "Warn", callback_data="/lockarabicw:"..GP_id},
		{text = "Del", callback_data="/lockarabicd:"..GP_id},
		{text = "Ok", callback_data="/lockarabico:"..GP_id}
		},
		{
			{text = "> English 🔠: "..lock_english.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "Ban", callback_data="/lockenglishb:"..GP_id},
		{text = "Kick", callback_data="/lockenglishk:"..GP_id},
		{text = "Warn", callback_data="/lockenglishw:"..GP_id},
		{text = "Del", callback_data="/lockenglishd:"..GP_id},
		{text = "Ok", callback_data="/lockenglisho:"..GP_id}
		},
		{
			{text = "> Webpage 🌐: "..lock_webpage.."", callback_data='MaTaDoRTeaM'}, 
		},
		{
		{text = "Ban", callback_data="/lockwebpageb:"..GP_id},
		{text = "Kick", callback_data="/lockwebpagek:"..GP_id},
		{text = "Warn", callback_data="/lockwebpagew:"..GP_id},
		{text = "Del", callback_data="/lockwebpaged:"..GP_id},
		{text = "Ok", callback_data="/lockwebpageo:"..GP_id}
		},
		{
			{text = "> Markdown 💱: "..lock_markdown.."", callback_data='MaTaDoRTeaM'}, 
		},
		{
		{text = "Ban", callback_data="/lockmarkdownb:"..GP_id},
		{text = "Kick", callback_data="/lockmarkdownk:"..GP_id},
		{text = "Warn", callback_data="/lockmarkdownw:"..GP_id},
		{text = "Del", callback_data="/lockmarkdownd:"..GP_id},
		{text = "Ok", callback_data="/lockmarkdowno:"..GP_id}
		},
		{
			{text = "> Gifs 🎇: "..mute_gif.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "Ban", callback_data="/mutegifb:"..GP_id},
		{text = "Kick", callback_data="/mutegifk:"..GP_id},
		{text = "Warn", callback_data="/mutegifw:"..GP_id},
		{text = "Del", callback_data="/mutegifd:"..GP_id},
		{text = "Ok", callback_data="/mutegifo:"..GP_id}
		},
		{
			{text = "> Text 🔤: "..mute_text.."", callback_data='MaTaDoRTeaM'}  
		},
		{
		{text = "Ban", callback_data="/mutetextb:"..GP_id},
		{text = "Kick", callback_data="/mutetextk:"..GP_id},
		{text = "Warn", callback_data="/mutetextw:"..GP_id},
		{text = "Del", callback_data="/mutetextd:"..GP_id},
		{text = "Ok", callback_data="/mutetexto:"..GP_id}
		},
		{
			{text = "> Inline ✨: "..mute_inline.."", callback_data='MaTaDoRTeaM'}, 
		},
		{
		{text = "Ban", callback_data="/muteinlineb:"..GP_id},
		{text = "Kick", callback_data="/muteinlinek:"..GP_id},
		{text = "Warn", callback_data="/muteinlinew:"..GP_id},
		{text = "Del", callback_data="/muteinlined:"..GP_id},
		{text = "Ok", callback_data="/muteinlineo:"..GP_id}
		},
		{
			{text = "> Game 🎮: "..mute_game.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "Ban", callback_data="/mutegameb:"..GP_id},
		{text = "Kick", callback_data="/mutegamek:"..GP_id},
		{text = "Warn", callback_data="/mutegamew:"..GP_id},
		{text = "Del", callback_data="/mutegamed:"..GP_id},
		{text = "Ok", callback_data="/mutegameo:"..GP_id}
		},
		{
			{text = "> Photo 🌄: "..mute_photo.."", callback_data='MaTaDoRTeaM'}  
		},
		{
		{text = "Ban", callback_data="/mutephotob:"..GP_id},
		{text = "Kick", callback_data="/mutephotok:"..GP_id},
		{text = "Warn", callback_data="/mutephotow:"..GP_id},
		{text = "Del", callback_data="/mutephotod:"..GP_id},
		{text = "Ok", callback_data="/mutephotoo:"..GP_id}
		},
		{
			{text = "> Group Welcome ☄️", callback_data='MaTaDoRTeaM'},
			{text = group_welcone, callback_data="/welcome:"..GP_id}
		},
		{
			{text = '> More Settings ♨️', callback_data = '/mutelistp:'..GP_id}
		},
		{
			{text = '> Ɓαcк 🔙', callback_data = '/option:'..GP_id}
		}				
	}
     elseif lang then
 text = '*به تنظیمات قفلی گروه خوش آمدید* 🤖'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> ویرایش 🚫: "..lock_edit.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "مسدود", callback_data="/lockeditb:"..GP_id},
		{text = "اخراج", callback_data="/lockeditk:"..GP_id},
		},{
		{text = "اخطار", callback_data="/lockeditw:"..GP_id},
		{text = "حذف", callback_data="/lockeditd:"..GP_id},
		{text = "اوکی", callback_data="/lockedito:"..GP_id}
		},
		{
			{text = "> لینک 📎: "..lock_link.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "مسدود", callback_data="/locklinkb:"..GP_id},
		{text = "اخراج", callback_data="/locklinkk:"..GP_id},
		},{
		{text = "اخطار", callback_data="/locklinkw:"..GP_id},
		{text = "حذف", callback_data="/locklinkd:"..GP_id},
		{text = "اوکی", callback_data="/locklinko:"..GP_id}
		},
		{
			{text = "> تگ #️⃣ : "..lock_tag.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "مسدود", callback_data="/locktagsb:"..GP_id},
		{text = "اخراج", callback_data="/locktagsk:"..GP_id},
		},{
		{text = "اخطار", callback_data="/locktagsw:"..GP_id},
		{text = "حذف", callback_data="/locktagsd:"..GP_id},
		{text = "اوکی", callback_data="/locktagso:"..GP_id}
		},
		{
			{text = "> نام کاربری #️⃣ : "..lock_username.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "مسدود", callback_data="/lockusernameb:"..GP_id},
		{text = "اخراج", callback_data="/lockusernamek:"..GP_id},
		},{
		{text = "اخطار", callback_data="/lockusernamew:"..GP_id},
		{text = "حذف", callback_data="/lockusernamed:"..GP_id},
		{text = "اوکی", callback_data="/lockusernameo:"..GP_id}
		},
		{
			{text = "> فراخوانی ⚠️: "..lock_mention.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "مسدود", callback_data="/lockmentionb:"..GP_id},
		{text = "اخراج", callback_data="/lockmentionk:"..GP_id},
		},{
		{text = "اخطار", callback_data="/lockmentionw:"..GP_id},
		{text = "حذف", callback_data="/lockmentiond:"..GP_id},
		{text = "اوکی", callback_data="/lockmentiono:"..GP_id}
		},
		{
			{text = "> عربی 🔠: "..lock_arabic.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "مسدود", callback_data="/lockarabicb:"..GP_id},
		{text = "اخراج", callback_data="/lockarabick:"..GP_id},
		},{
		{text = "اخطار", callback_data="/lockarabicw:"..GP_id},
		{text = "حذف", callback_data="/lockarabicd:"..GP_id},
		{text = "اوکی", callback_data="/lockarabico:"..GP_id}
		},
		{
			{text = "> انگلیسی 🔠: "..lock_english.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "مسدود", callback_data="/lockenglishb:"..GP_id},
		{text = "اخراج", callback_data="/lockenglishk:"..GP_id},
		},{
		{text = "اخطار", callback_data="/lockenglishw:"..GP_id},
		{text = "حذف", callback_data="/lockenglishd:"..GP_id},
		{text = "اوکی", callback_data="/lockenglisho:"..GP_id}
		},
		{
			{text = "> صفحات وب 🌐: "..lock_webpage.."", callback_data='MaTaDoRTeaM'}, 
		},
		{
		{text = "مسدود", callback_data="/lockwebpageb:"..GP_id},
		{text = "اخراج", callback_data="/lockwebpagek:"..GP_id},
		},{
		{text = "اخطار", callback_data="/lockwebpagew:"..GP_id},
		{text = "حذف", callback_data="/lockwebpaged:"..GP_id},
		{text = "اوکی", callback_data="/lockwebpageo:"..GP_id}
		},
		{
			{text = "> فونت 💱: "..lock_markdown.."", callback_data='MaTaDoRTeaM'}, 
		},
		{
		{text = "مسدود", callback_data="/lockmarkdownb:"..GP_id},
		{text = "اخراج", callback_data="/lockmarkdownk:"..GP_id},
		},{
		{text = "اخطار", callback_data="/lockmarkdownw:"..GP_id},
		{text = "حذف", callback_data="/lockmarkdownd:"..GP_id},
		{text = "اوکی", callback_data="/lockmarkdowno:"..GP_id}
		},
		{
			{text = "> تصاویر متحرک 🎇: "..mute_gif.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "مسدود", callback_data="/mutegifb:"..GP_id},
		{text = "اخراج", callback_data="/mutegifk:"..GP_id},
		},{
		{text = "اخطار", callback_data="/mutegifw:"..GP_id},
		{text = "حذف", callback_data="/mutegifd:"..GP_id},
		{text = "اوکی", callback_data="/mutegifo:"..GP_id}
		},
		{
			{text = "> متن 🔤: "..mute_text.."", callback_data='MaTaDoRTeaM'}  
		},
		{
		{text = "مسدود", callback_data="/mutetextb:"..GP_id},
		{text = "اخراج", callback_data="/mutetextk:"..GP_id},
		},{
		{text = "اخطار", callback_data="/mutetextw:"..GP_id},
		{text = "حذف", callback_data="/mutetextd:"..GP_id},
		{text = "اوکی", callback_data="/mutetexto:"..GP_id}
		},
		{
			{text = "> اینلاین ✨: "..mute_inline.."", callback_data='MaTaDoRTeaM'}, 
		},
		{
		{text = "مسدود", callback_data="/muteinlineb:"..GP_id},
		{text = "اخراج", callback_data="/muteinlinek:"..GP_id},
		},{
		{text = "اخطار", callback_data="/muteinlinew:"..GP_id},
		{text = "حذف", callback_data="/muteinlined:"..GP_id},
		{text = "اوکی", callback_data="/muteinlineo:"..GP_id}
		},
		{
			{text = "> بازی 🎮: "..mute_game.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "مسدود", callback_data="/mutegameb:"..GP_id},
		{text = "اخراج", callback_data="/mutegamek:"..GP_id},
		},{
		{text = "اخطار", callback_data="/mutegamew:"..GP_id},
		{text = "حذف", callback_data="/mutegamed:"..GP_id},
		{text = "اوکی", callback_data="/mutegameo:"..GP_id}
		},
		{
			{text = "> عکس 🌄: "..mute_photo.."", callback_data='MaTaDoRTeaM'}  
		},
		{
		{text = "مسدود", callback_data="/mutephotob:"..GP_id},
		{text = "اخراج", callback_data="/mutephotاوکی:"..GP_id},
		},{
		{text = "اخطار", callback_data="/mutephotow:"..GP_id},
		{text = "حذف", callback_data="/mutephotod:"..GP_id},
		{text = "اوکی", callback_data="/mutephotoo:"..GP_id}
		},
		{
			{text = "> خوشآمد گویی ☄️", callback_data='MaTaDoRTeaM'},
			{text = group_welcone, callback_data="/welcome:"..GP_id}
		},
		{
			{text = '> تنظیمات بیشتر ♨️', callback_data = '/mutelistp:'..GP_id}
		},
		{
			{text = '> بازگشت 🔙', callback_data = '/option:'..GP_id}
		}				
	}
  end
    edit_inline(msg.message_id, text, keyboard)
end

function mutelists(msg, data, GP_id)
local hash = "gp_lang:"..GP_id
local lang = redis:get(hash) 
    if data[tostring(GP_id)] and data[tostring(GP_id)]['mutes'] then
		mutes = data[tostring(GP_id)]['mutes']
	else
		return
	end
	if mutes.mute_gif then
		mute_gif = mutes.mute_gif
	else
		mute_gif = 'unmute'
	end
   if mutes.mute_photo then
		mute_photo = mutes.mute_photo
	else
		mute_photo = 'unmute'
	end
	if mutes.mute_sticker then
		mute_sticker = mutes.mute_sticker
	else
		mute_sticker = 'unmute'
	end
	if mutes.mute_contact then
		mute_contact = mutes.mute_contact
	else
		mute_contact = 'unmute'
	end
	if mutes.mute_inline then
		mute_inline = mutes.mute_inline
	else
		mute_inline = 'unmute'
	end
	if mutes.mute_game then
		mute_game = mutes.mute_game
	else
		mute_game = 'unmute'
	end
	if mutes.mute_text then
		mute_text = mutes.mute_text
	else
		mute_text = 'unmute'
	end
	if mutes.mute_keyboard then
		mute_keyboard = mutes.mute_keyboard
	else
		mute_keyboard = 'unmute'
	end
	if mutes.mute_forward then
		mute_forward = mutes.mute_forward
	else
		mute_forward = 'unmute'
	end
	if mutes.mute_location then
		mute_location = mutes.mute_location
	else
		mute_location = 'unmute'
	end
   if mutes.mute_document then
		mute_document = mutes.mute_document
	else
		mute_document = 'unmute'
	end
	if mutes.mute_voice then
		mute_voice = mutes.mute_voice
	else
		mute_voice = 'unmute'
	end
	if mutes.mute_audio then
		mute_audio = mutes.mute_audio
	else
		mute_audio = 'unmute'
	end
	if mutes.mute_video then
		mute_video = mutes.mute_video
	else
		mute_video = 'unmute'
	end
	if mutes.mute_tgservice then
		mute_tgservice = mutes.mute_tgservice
	else
		mute_tgservice = 'unmute'
	end
   if not lang then
	 text = '`Welcome To` *Group Mute Settings* 🤖'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> Gifs 🎇", callback_data='MaTaDoRTeaM'}, 
			{text = mute_gif, callback_data="/mutegif:"..GP_id}
		},
		{
			{text = "> Text 🔤", callback_data='MaTaDoRTeaM'}, 
			{text = mute_text, callback_data="/mutetext:"..GP_id}
		},
		{
			{text = "> Inline ✨", callback_data='MaTaDoRTeaM'}, 
			{text = mute_inline, callback_data="/muteinline:"..GP_id}
		},
		{
			{text = "> Game 🎮", callback_data='MaTaDoRTeaM'}, 
			{text = mute_game, callback_data="/mutegame:"..GP_id}
		},
		{
			{text = "> Photo 🌄", callback_data='MaTaDoRTeaM'}, 
			{text = mute_photo, callback_data="/mutephoto:"..GP_id}
		},
		{
			{text = "> Video 🎞", callback_data='MaTaDoRTeaM'}, 
			{text = mute_video, callback_data="/mutevideo:"..GP_id}
		},
		{
			{text = "> Audio 🎵", callback_data='MaTaDoRTeaM'}, 
			{text = mute_audio, callback_data="/muteaudio:"..GP_id}
		},
		{
			{text = "> Voice 🎙", callback_data='MaTaDoRTeaM'}, 
			{text = mute_voice, callback_data="/mutevoice:"..GP_id}
		},
		{
			{text = "> Sticker 🔰", callback_data='MaTaDoRTeaM'}, 
			{text = mute_sticker, callback_data="/mutesticker:"..GP_id}
		},
		{
			{text = "> Contact 📞", callback_data='MaTaDoRTeaM'}, 
			{text = mute_contact, callback_data="/mutecontact:"..GP_id}
		},
		{
			{text = "> Forward 🔗", callback_data='MaTaDoRTeaM'}, 
			{text = mute_forward, callback_data="/muteforward:"..GP_id}
		},
		{
			{text = "> Location 📡", callback_data='MaTaDoRTeaM'}, 
			{text = mute_location, callback_data="/mutelocation:"..GP_id}
		},
		{
			{text = "> Document 📂", callback_data='MaTaDoRTeaM'}, 
			{text = mute_document, callback_data="/mutedocument:"..GP_id}
		},
		{
			{text = "> TgService 📡", callback_data='MaTaDoRTeaM'}, 
			{text = mute_tgservice, callback_data="/mutetgservice:"..GP_id}
		},
		{
			{text = "> Keyboard 🎹", callback_data='MaTaDoRTeaM'}, 
			{text = mute_keyboard, callback_data="/mutekeyboard:"..GP_id}
		},
		{
			{text = '> More Settings ♨️', callback_data = '/moresettings:'..GP_id}
		},
		{
			{text = '> Back 🔙', callback_data = '/settings:'..GP_id}
		}				
	}
   elseif lang then
	 text = '*به تنظیمات بیصدا گروه خوش آمدید* 🤖'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> تصاویر متحرک 🎇", callback_data='MaTaDoRTeaM'}, 
			{text = mute_gif, callback_data="/mutegif:"..GP_id}
		},
		{
			{text = "> متن 🔤", callback_data='MaTaDoRTeaM'}, 
			{text = mute_text, callback_data="/mutetext:"..GP_id}
		},
		{
			{text = "> اینلاین ✨", callback_data='MaTaDoRTeaM'}, 
			{text = mute_inline, callback_data="/muteinline:"..GP_id}
		},
		{
			{text = "> بازی 🎮", callback_data='MaTaDoRTeaM'}, 
			{text = mute_game, callback_data="/mutegame:"..GP_id}
		},
		{
			{text = "> عکس 🌄", callback_data='MaTaDoRTeaM'}, 
			{text = mute_photo, callback_data="/mutephoto:"..GP_id}
		},
		{
			{text = "> فیلم 🎞", callback_data='MaTaDoRTeaM'}, 
			{text = mute_video, callback_data="/mutevideo:"..GP_id}
		},
		{
			{text = "> آهنگ 🎵", callback_data='MaTaDoRTeaM'}, 
			{text = mute_audio, callback_data="/muteaudio:"..GP_id}
		},
		{
			{text = "> صدا 🎙", callback_data='MaTaDoRTeaM'}, 
			{text = mute_voice, callback_data="/mutevoice:"..GP_id}
		},
		{
			{text = "> استیکر 🔰", callback_data='MaTaDoRTeaM'}, 
			{text = mute_sticker, callback_data="/mutesticker:"..GP_id}
		},
		{
			{text = "> مخاطب 📞", callback_data='MaTaDoRTeaM'}, 
			{text = mute_contact, callback_data="/mutecontact:"..GP_id}
		},
		{
			{text = "> نقل و قول 🔗", callback_data='MaTaDoRTeaM'}, 
			{text = mutes.mute_forward, callback_data="/muteforward:"..GP_id}
		},
		{
			{text = "> موقعیت 📡", callback_data='MaTaDoRTeaM'}, 
			{text = mute_location, callback_data="/mutelocation:"..GP_id}
		},
		{
			{text = "> فایل 📂", callback_data='MaTaDoRTeaM'}, 
			{text = mute_document, callback_data="/mutedocument:"..GP_id}
		},
		{
			{text = "> خدمات تلگرام 📡", callback_data='MaTaDoRTeaM'}, 
			{text = mute_tgservice, callback_data="/mutetgservice:"..GP_id}
		},
		{
			{text = "> کیبورد 🎹", callback_data='MaTaDoRTeaM'}, 
			{text = mute_keyboard, callback_data="/mutekeyboard:"..GP_id}
		},
		{
			{text = '> تنظیمات بیشتر ♨️', callback_data = '/moresettings:'..GP_id}
		},
		{
			{text = '> بازگشت 🔙', callback_data = '/settings:'..GP_id}
		}				
	}
  end
    edit_inline(msg.message_id, text, keyboard)
end

function mutelistsp(msg, data, GP_id)
local hash = "gp_lang:"..GP_id
local lang = redis:get(hash) 
    if data[tostring(GP_id)] and data[tostring(GP_id)]['mutes'] then
		mutes = data[tostring(GP_id)]['mutes']
	else
		return
	end
	if data[tostring(GP_id)] and data[tostring(GP_id)]['settings'] then
		settings = data[tostring(GP_id)]['settings']
	else
		return
	end
	if mutes.mute_text then
		mute_text = mutes.mute_text
	else
		mute_text = 'no'
	end
	if mutes.mute_inline then
		mute_inline = mutes.mute_inline
	else
		mute_inline = 'no'
	end
	if mutes.mute_gif then
		mute_gif = mutes.mute_gif
	else
		mute_gif = 'no'
	end
	if settings.lock_link then
		lock_link = settings.lock_link
	else
		lock_link = 'no'
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
	if settings.lock_username then
		lock_username = settings.lock_username
	else
		lock_username = 'no'
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
	if settings.lock_english then
		lock_english = settings.lock_english
	else
		lock_english = 'no'
	end
	if settings.lock_mention then
		lock_mention = settings.lock_mention
	else
		lock_mention = 'no'
	end
		if settings.lock_edit then
		lock_edit = settings.lock_edit
	else
		lock_edit = 'no'
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
	if settings.lock_webpage then
		lock_webpage = settings.lock_webpage
	else
		lock_webpage = 'no'
	end
	if settings.lock_bots then
		lock_bots = settings.lock_bots
	else
		lock_bots = 'no'
	end
	if settings.welcome then
		group_welcone = settings.welcome
	else
		group_welcone = 'no'
	end
   if mutes.mute_photo then
		mute_photo = mutes.mute_photo
	else
		mute_photo = 'no'
	end
	if mutes.mute_sticker then
		mute_sticker = mutes.mute_sticker
	else
		mute_sticker = 'no'
	end
	if mutes.mute_contact then
		mute_contact = mutes.mute_contact
	else
		mute_contact = 'no'
	end
	if mutes.mute_game then
		mute_game = mutes.mute_game
	else
		mute_game = 'no'
	end
	if mutes.mute_keyboard then
		mute_keyboard = mutes.mute_keyboard
	else
		mute_keyboard = 'no'
	end
	if mutes.mute_forward then
		mute_forward = mutes.mute_forward
	else
		mute_forward = 'no'
	end
	if mutes.mute_location then
		mute_location = mutes.mute_location
	else
		mute_location = 'no'
	end
   if mutes.mute_document then
		mute_document = mutes.mute_document
	else
		mute_document = 'no'
	end
	if mutes.mute_voice then
		mute_voice = mutes.mute_voice
	else
		mute_voice = 'no'
	end
	if mutes.mute_audio then
		mute_audio = mutes.mute_audio
	else
		mute_audio = 'no'
	end
	if mutes.mute_video then
		mute_video = mutes.mute_video
	else
		mute_video = 'no'
	end
	if mutes.mute_tgservice then
		mute_tgservice = mutes.mute_tgservice
	else
		mute_tgservice = 'no'
	end
   if not lang then
	 text = '`Welcome To` *Group Mute Settings* 🤖'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> Video 🎞: "..mute_video.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "Ban", callback_data="/mutevideob:"..GP_id},
		{text = "Kick", callback_data="/mutevideok:"..GP_id},
		{text = "Warn", callback_data="/mutevideow:"..GP_id},
		{text = "Del", callback_data="/mutevideod:"..GP_id},
		{text = "Ok", callback_data="/mutevideoo:"..GP_id}
		},
		{
			{text = "> Audio 🎵: "..mute_audio.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "Ban", callback_data="/muteaudiob:"..GP_id},
		{text = "Kick", callback_data="/muteaudiok:"..GP_id},
		{text = "Warn", callback_data="/muteaudiow:"..GP_id},
		{text = "Del", callback_data="/muteaudiod:"..GP_id},
		{text = "Ok", callback_data="/muteaudioo:"..GP_id}
		},
		{
			{text = "> Voice 🎙: "..mute_voice.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "Ban", callback_data="/mutevoiceb:"..GP_id},
		{text = "Kick", callback_data="/mutevoicek:"..GP_id},
		{text = "Warn", callback_data="/mutevoicew:"..GP_id},
		{text = "Del", callback_data="/mutevoiced:"..GP_id},
		{text = "Ok", callback_data="/mutevoiceo:"..GP_id}
		},
		{
			{text = "> Sticker 🔰: "..mute_sticker.."", callback_data='MaTaDoRTeaM'}
		},
		{
		{text = "Ban", callback_data="/mutestickerb:"..GP_id},
		{text = "Kick", callback_data="/mutestickerk:"..GP_id},
		{text = "Warn", callback_data="/mutestickerw:"..GP_id},
		{text = "Del", callback_data="/mutestickerd:"..GP_id},
		{text = "Ok", callback_data="/mutestickero:"..GP_id}
		},
		{
			{text = "> Contact 📞: "..mute_contact.."", callback_data='MaTaDoRTeaM'}
		},
		{
		{text = "Ban", callback_data="/mutecontactb:"..GP_id},
		{text = "Kick", callback_data="/mutecontactk:"..GP_id},
		{text = "Warn", callback_data="/mutecontactw:"..GP_id},
		{text = "Del", callback_data="/mutecontactd:"..GP_id},
		{text = "Ok", callback_data="/mutecontacto:"..GP_id}
		},
		{
			{text = "> Forward 🔗: "..mute_forward.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "Ban", callback_data="/muteforwardb:"..GP_id},
		{text = "Kick", callback_data="/muteforwardk:"..GP_id},
		{text = "Warn", callback_data="/muteforwardw:"..GP_id},
		{text = "Del", callback_data="/muteforwardd:"..GP_id},
		{text = "Ok", callback_data="/muteforwardo:"..GP_id}
		},
		{
			{text = "> Location 📡: "..mute_location.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "Ban", callback_data="/mutelocationb:"..GP_id},
		{text = "Kick", callback_data="/mutelocationk:"..GP_id},
		{text = "Warn", callback_data="/mutelocationw:"..GP_id},
		{text = "Del", callback_data="/mutelocationd:"..GP_id},
		{text = "Ok", callback_data="/mutelocationo:"..GP_id}
		},
		{
			{text = "> Document 📂: "..mute_document.."", callback_data='MaTaDoRTeaM'}  
		},
		{
		{text = "Ban", callback_data="/mutedocumentb:"..GP_id},
		{text = "Kick", callback_data="/mutedocumentk:"..GP_id},
		{text = "Warn", callback_data="/mutedocumentw:"..GP_id},
		{text = "Del", callback_data="/mutedocumentd:"..GP_id},
		{text = "Ok", callback_data="/mutedocumento:"..GP_id}
		},
		{
			{text = "> Keyboard 🎹: "..mute_keyboard.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "Ban", callback_data="/mutekeyboardb:"..GP_id},
		{text = "Kick", callback_data="/mutekeyboardk:"..GP_id},
		{text = "Warn", callback_data="/mutekeyboardw:"..GP_id},
		{text = "Del", callback_data="/mutekeyboardd:"..GP_id},
		{text = "Ok", callback_data="/mutekeyboardo:"..GP_id}
		},
		{
			{text = "> TgService 📡", callback_data='MaTaDoRTeaM'}, 
			{text = mute_tgservice, callback_data="/mutetgservice:"..GP_id}
		},
		{
			{text = "> Pin 📌", callback_data='MaTaDoRTeaM'}, 
			{text = lock_pin, callback_data="/lockpin:"..GP_id}
		},
		{
			{text = "> Bots ☯️", callback_data='MaTaDoRTeaM'}, 
			{text = lock_bots, callback_data="/lockbots:"..GP_id}
		},
		{
			{text = "> Join ⚡️", callback_data='MaTaDoRTeaM'}, 
			{text = lock_join, callback_data="/lockjoin:"..GP_id}
		},
		{
			{text = "> Flood 💥", callback_data='MaTaDoRTeaM'}, 
			{text = lock_flood, callback_data="/lockflood:"..GP_id}
		},
		{
			{text = "> Spam ☢️", callback_data='MaTaDoRTeaM'}, 
			{text = lock_spam, callback_data="/lockspam:"..GP_id}
		},
		{
			{text = '> More Settings ♨️', callback_data = '/moresettingsp:'..GP_id}
		},
		{
			{text = '> Ɓαcк 🔙', callback_data = '/settingsp:'..GP_id}
		}				
	}
   elseif lang then
	 text = '*به تنظیمات بیصدا گروه خوش آمدید* 🤖'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> ویدیو 🎞: "..mute_video.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "مسدود", callback_data="/mutevideob:"..GP_id},
		{text = "اخراج", callback_data="/mutevideاوکی:"..GP_id},
		},{
		{text = "اخطار", callback_data="/mutevideow:"..GP_id},
		{text = "حذف", callback_data="/mutevideod:"..GP_id},
		{text = "اوکی", callback_data="/mutevideoo:"..GP_id}
		},
		{
			{text = "> آهنگ 🎵: "..mute_audio.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "مسدود", callback_data="/muteaudiob:"..GP_id},
		{text = "اخراج", callback_data="/muteaudiاوکی:"..GP_id},
		},{
		{text = "اخطار", callback_data="/muteaudiow:"..GP_id},
		{text = "حذف", callback_data="/muteaudiod:"..GP_id},
		{text = "اوکی", callback_data="/muteaudioo:"..GP_id}
		},
		{
			{text = "> ویس 🎙: "..mute_voice.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "مسدود", callback_data="/mutevoiceb:"..GP_id},
		{text = "اخراج", callback_data="/mutevoicek:"..GP_id},
		},{
		{text = "اخطار", callback_data="/mutevoicew:"..GP_id},
		{text = "حذف", callback_data="/mutevoiced:"..GP_id},
		{text = "اوکی", callback_data="/mutevoiceo:"..GP_id}
		},
		{
			{text = "> استیکر 🔰: "..mute_sticker.."", callback_data='MaTaDoRTeaM'}
		},
		{
		{text = "مسدود", callback_data="/mutestickerb:"..GP_id},
		{text = "اخراج", callback_data="/mutestickerk:"..GP_id},
		},{
		{text = "اخطار", callback_data="/mutestickerw:"..GP_id},
		{text = "حذف", callback_data="/mutestickerd:"..GP_id},
		{text = "اوکی", callback_data="/mutestickero:"..GP_id}
		},
		{
			{text = "> مخاطب 📞: "..mute_contact.."", callback_data='MaTaDoRTeaM'}
		},
		{
		{text = "مسدود", callback_data="/mutecontactb:"..GP_id},
		{text = "اخراج", callback_data="/mutecontactk:"..GP_id},
		},{
		{text = "اخطار", callback_data="/mutecontactw:"..GP_id},
		{text = "حذف", callback_data="/mutecontactd:"..GP_id},
		{text = "اوکی", callback_data="/mutecontacto:"..GP_id}
		},
		{
			{text = "> نقل قول 🔗: "..mute_forward.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "مسدود", callback_data="/muteforwardb:"..GP_id},
		{text = "اخراج", callback_data="/muteforwardk:"..GP_id},
		},{
		{text = "اخطار", callback_data="/muteforwardw:"..GP_id},
		{text = "حذف", callback_data="/muteforwardd:"..GP_id},
		{text = "اوکی", callback_data="/muteforwardo:"..GP_id}
		},
		{
			{text = "> مکان 📡: "..mute_location.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "مسدود", callback_data="/mutelocationb:"..GP_id},
		{text = "اخراج", callback_data="/mutelocationk:"..GP_id},
		},{
		{text = "اخطار", callback_data="/mutelocationw:"..GP_id},
		{text = "حذف", callback_data="/mutelocationd:"..GP_id},
		{text = "اوکی", callback_data="/mutelocationo:"..GP_id}
		},
		{
			{text = "> فایل 📂: "..mute_document.."", callback_data='MaTaDoRTeaM'}  
		},
		{
		{text = "مسدود", callback_data="/mutedocumentb:"..GP_id},
		{text = "اخراج", callback_data="/mutedocumentk:"..GP_id},
		},{
		{text = "اخطار", callback_data="/mutedocumentw:"..GP_id},
		{text = "حذف", callback_data="/mutedocumentd:"..GP_id},
		{text = "اوکی", callback_data="/mutedocumento:"..GP_id}
		},
		{
			{text = "> کیبورد 🎹: "..mute_keyboard.."", callback_data='MaTaDoRTeaM'} 
		},
		{
		{text = "مسدود", callback_data="/mutekeyboardb:"..GP_id},
		{text = "اخراج", callback_data="/mutekeyboardk:"..GP_id},
		},{
		{text = "اخطار", callback_data="/mutekeyboardw:"..GP_id},
		{text = "حذف", callback_data="/mutekeyboardd:"..GP_id},
		{text = "اوکی", callback_data="/mutekeyboardo:"..GP_id}
		},
		{
			{text = "> سرویس تلگرام 📡", callback_data='MaTaDoRTeaM'}, 
			{text = mute_tgservice, callback_data="/mutetgservice:"..GP_id}
		},
		{
			{text = "> سنجاق 📌", callback_data='MaTaDoRTeaM'}, 
			{text = lock_pin, callback_data="/lockpin:"..GP_id}
		},
		{
			{text = "> ربات ها ☯️", callback_data='MaTaDoRTeaM'}, 
			{text = lock_bots, callback_data="/lockbots:"..GP_id}
		},
		{
			{text = "> ورود ⚡️", callback_data='MaTaDoRTeaM'}, 
			{text = lock_join, callback_data="/lockjoin:"..GP_id}
		},
		{
			{text = "> پیام مکرر 💥", callback_data='MaTaDoRTeaM'}, 
			{text = lock_flood, callback_data="/lockflood:"..GP_id}
		},
		{
			{text = "> هرزنامه ☢️", callback_data='MaTaDoRTeaM'}, 
			{text = lock_spam, callback_data="/lockspam:"..GP_id}
		},
		{
			{text = '> تنظیمات بیشتر ♨️', callback_data = '/moresettingsp:'..GP_id}
		},
		{
			{text = '> بازگشت 🔙', callback_data = '/settingsp:'..GP_id}
		}				
	}
  end
    edit_inline(msg.message_id, text, keyboard)
end

local function run(msg, matches)
	local data = load_data(_config.moderation.data)
--------------Begin Msg Matches---------------
	if matches[1] == "sudolist" and is_sudo(msg) then
		return sudolist(msg)
	end
	if tonumber(msg.from.id) == SUDO then
		if matches[1]:lower() == "setsudo" then
			if matches[2] and not msg.reply_to_message then
				local user_id = matches[2]
				if already_sudo(tonumber(user_id)) then
					return 'User '..user_id..' is already sudo users'
				else
					table.insert(_config.sudo_users, tonumber(user_id)) 
					print(user_id..' added to sudo users') 
					save_config() 
					reload_plugins(true) 
					return "User "..user_id.." added to sudo users" 
				end
		elseif not matches[2] and msg.reply_to_message then
			local user_id = msg.reply_to_message.from.id
			if already_sudo(tonumber(user_id)) then
				return 'User '..user_id..' is already sudo users'
			else
				table.insert(_config.sudo_users, tonumber(user_id)) 
				print(user_id..' added to sudo users') 
				save_config() 
				reload_plugins(true) 
				return "User "..user_id.." added to sudo users" 
			end
		end
	end
	if matches[1]:lower() == "remsudo" then
	if matches[2] and not msg.reply_to_message then
		local user_id = tonumber(matches[2]) 
		if not already_sudo(user_id) then
			return 'User '..user_id..' is not sudo users'
		else
			table.remove(_config.sudo_users, getindex( _config.sudo_users, k)) 
			print(user_id..' removed from sudo users') 
			save_config() 
			reload_plugins(true) 
			return "User "..user_id.." removed from sudo users"
		end
	elseif not matches[2] and msg.reply_to_message then
		local user_id = tonumber(msg.reply_to_message.from.id) 
		if not already_sudo(user_id) then
			return 'User '..user_id..' is not sudo users'
		else
			table.remove(_config.sudo_users, getindex( _config.sudo_users, k)) 
			print(user_id..' removed from sudo users') 
			save_config() 
			reload_plugins(true) 
			return "User "..user_id.." removed from sudo users"
		end
	end
	end
	end
	if is_sudo(msg) then
  if matches[1]:lower() == '!plist' or matches[1]:lower() == '/plist' or matches[1]:lower() == '#plist' then --after changed to moderator mode, set only sudo
    return list_all_plugins()
  end
end
   if matches[1] == 'pl' then
  if matches[2] == '+' and matches[4] == 'chat' then
      if is_momod(msg) then
    local receiver = msg.chat_id_
    local plugin = matches[3]
    print("enable "..plugin..' on this chat')
    return reenable_plugin_on_chat(receiver, plugin)
  end
    end

  if matches[2] == '+' and is_sudo(msg) then 
      if is_mod(msg) then
    local plugin_name = matches[3]
    print("enable: "..matches[3])
    return enable_plugin(plugin_name)
  end
    end
  if matches[2] == '-' and matches[4] == 'chat' then
      if is_mod(msg) then
    local plugin = matches[3]
    local receiver = msg.chat_id_
    print("disable "..plugin..' on this chat')
    return disable_plugin_on_chat(receiver, plugin)
  end
    end
  if matches[2] == '-' and is_sudo(msg) then
    if matches[3] == 'plugins' then
    	return 'This plugin can\'t be disabled'
    end
    print("disable: "..matches[3])
    return disable_plugin(matches[3])
  end
end
  if matches[1] == '*' and is_sudo(msg) then
    return reload_plugins(true)
  end
  if matches[1]:lower() == 'reload' and is_sudo(msg) then
    return reload_plugins(true)
  end
--------------End Msg Matches---------------

--------------Begin Inline Query---------------
if msg.query and msg.query:match("-%d+") and is_sudo(msg) then
local chatid = "-"..msg.query:match("%d+")
	keyboard = {}
	keyboard.inline_keyboard = {
		{
			{text = '💎 >[ Sєттιηg | تنظیمات ]< 💎', callback_data = '/lang:'..chatid}
		},
		{
			{text = '🔖 >[ Hєℓρ | راهنما ]< 🔖', callback_data = '/helpp:'..chatid}
		},
		{
			{text= '🔚 >[ Ɛχιт | خروج ]< 🔚' ,callback_data = '/exit:'..chatid}
		}					
	}
	send_inline(msg.id,'settings','Group Option','Tap Here','💠 گزینه مورد نظر خود را انتخاب کنید 💠',keyboard)
end
if msg.cb then
local hash = "gp_lang:"..matches[2]
local lang = redis:get(hash) 
	if matches[1] == '/lang' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
    elseif not data[tostring(matches[2])] then
     if not lang then
		edit_inline(msg.message_id, "`Group Is Not Added`")
   elseif lang then
		edit_inline(msg.message_id, "_گروه به لیست مدیریتی ربات اضافه نشده_")
   end
	else
	local text = '🌐 *لطفا زبان مورد نظر خود را انتخاب کنید* 🌐\n➖➖➖➖➖➖➖➖➖➖➖➖➖➖\n🔻`در غیر این صورت روی دکمه (Exit) کلیک کنید.🔺`'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> Ɛηgℓιѕн 🇦🇺", callback_data="/english:"..matches[2]},
			{text = '> فارسی 🇮🇷', callback_data = '/persian:'..matches[2]}
		},
		{
			{text = '🔖 >[ Hєℓρ | راهنما ]< 🔖', callback_data = '/helpp:'..matches[2]}
		},
		{
			{text= '🔚 >[ Ɛχιт | خروج ]< 🔚' ,callback_data = '/exit:'..matches[2]}
		}				
	}
    edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/helpp' then
if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
	local text = [[
`به بخش راهنمای ربات ماتادور خوش آمدید`🤖🌹

*💠 لطفا زبان مورد نظر خود را انتخاب کنید :*

▪️`اگر ربات درگروه شما فارسی دستور میگیرد روی گزینه "> فارسی 🇮🇷" کلیک کنید.`

▫️`اگر ربات درگروه شما انگلیسی دستور میگیرد روی گزینه "> English 🇦🇺" کلیک کنید.`

`(در غیر این صورت روی گزینه "🔚 >[ Ɛχιт | خروج ]< 🔚" کلیک کنید)`


🔖درصورت داشت هر گونه مشکلی به آیدی های زیر مراجعه کنید :
🆔 : [MahDiRoO](Telegram.Me/mahdiroo)
🆔 : [MahDiRoO Pv](Telegram.Me/mahdiroo_bot)
	]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> Ɛηgℓιѕн 🇦🇺", callback_data="/englishh:"..matches[2]},
			{text = '> فارسی 🇮🇷', callback_data = '/persianh:'..matches[2]}
		},
		{
			{text = '💎 >[ Sєттιηg | تنظیمات ]< 💎', callback_data = '/lang:'..matches[2]}
		},
		{
			{text = '💰 >[ Ɲєякн | نرخ ]< 💰', callback_data = '/nerkh:'..matches[2]}
		},
		{
			{text= '🔚 >[ Ɛχιт | خروج ]< 🔚' ,callback_data = '/exit:'..matches[2]}
		}
	}
    edit_inline(msg.message_id, text, keyboard)
end
end
if matches[1] == '/help1' then
if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
else	
if not lang then
    text = [[[♨️ MαTαDσR BσT V 7.1](Telegram.me/mahdiroo)

*🔅 Help Install BoT :*

▫️*Add*
`اضافه کردن ربات به گروه (با هر باز زدن add شارژ 0 میشود)`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Charge* _X_
`برای شارژ کردن گروه (جای X عدد قرار دهید)`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Config*
`برای مالک کردن سازند گروه و مدیر کردن ادمین‌های گروه` 
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Rem*
`حذف کردن ربات از گروه `
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Leave*
`خارج کردن ربات از گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Setowner* _[reply|id|username]_
`انتخاب مالک‌ برای گروه `
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Checkexpire*
`نمایش تاریخ انقضای ربات `
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Join* _[Gp id]_
`اضافه کردن شما به گروه خاصی‌ (از طریق پیوی ربات)`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Rem* _[Gid]_
`حذف گروه ربات از طریق پیوی ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Leave* _[Gid]_
`خارج شدن ربات از طریق پیوی`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Charge* _[Gid] X_
`شارژ گروه از‌طریق پیوی (جای x عدد قرار دهید)`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Checkexpire* _[Gid]_
`نمایش شارژ گروه از طریق پیوی ربات `
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Gid*
`برای دریافت ایدی گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Openchat*
`حل مشکل پاسخ ندادن ربات (همه گروه ها)`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Open* _[Gid]_
`حل مشکل پاسخ ندادن ربات (در گروه خاصی )`
_=-=-=-=-=-=-=-=-=-=-=-=_
]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text= '> Ɓαcк 🔙' ,callback_data = '/englishh:'..matches[2]}
		}				
	}
	elseif lang then
	text = [[[♨️ ماتادور ورژن 7.1](Telegram.me/mahdiroo)

*🔅 راهنمای نصب ربات :*

▫️*نصب*
`اضافه کردن ربات به گروه (با هر باز زدن نصب شارژ 0 میشود)`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*شارژ* _X_
`برای شارژ کردن گروه (جای X عدد قرار دهید)`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*پیکربندی*
`برای مالک کردن سازند گروه و مدیر کردن ادمین‌های گروه` 
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*لغو نصب*
`حذف کردن ربات از گروه `
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*خروج*
`خارج کردن ربات از گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*مالک* _[reply|id|username]_
`انتخاب مالک‌ برای گروه `
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*اعتبار*
`نمایش تاریخ انقضای ربات `
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*ورود* _[Gp id]_
`اضافه کردن شما به گروه خاصی‌ (از طریق پیوی ربات)`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*لغو نصب* _[Gid]_
`حذف گروه ربات از طریق پیوی ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*خروج* _[Gid]_
`خارج شدن ربات از طریق پیوی`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*شارژ* _[Gid] X_
`شارژ گروه از‌طریق پیوی (جای x عدد قرار دهید)`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*اعتبار* _[Gid]_
`نمایش شارژ گروه از طریق پیوی ربات `
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*گروه ایدی*
`برای دریافت ایدی گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*باز گپ ها*
`حل مشکل پاسخ ندادن ربات (همه گروه ها)`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*باز گپ* _[Gid]_
`حل مشکل پاسخ ندادن ربات (در گروه خاصی )`
_=-=-=-=-=-=-=-=-=-=-=-=_]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text= '> بازگشت 🔙' ,callback_data = '/persianh:'..matches[2]}
		}				
	}
	end
    edit_inline(msg.message_id, text, keyboard)
end
end
if matches[1] == '/help2' then
if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
else	
if not lang then
    text = [[[♨️ MαTαDσR BσT V 7.1](Telegram.me/mahdiroo)

*🔅 Help Admin BoT*

▫️*Sudoset* _[username|id|reply]_
`اضافه کردن سودو به ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Sudodem* _[username|id|reply]_
`حذف کردن سودو از ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Sudolist*
`لیست سودو های ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Adminset* _[username|id|reply]_
`اضافه کردن ادمین به ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Admindem* _[username|id|reply]_
`حذف کردن ادمین از ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Adminlist*
`لیست ادمین های ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Chats*
`لیست گروه های ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Stats*
`آمار ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Sendfile* _[folder]_ _[file]_
`ارسال فایل مورد نظر از سورس`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Sendplug* _[plug]_
`ارسال پلاگین مورد نظراز سورس`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Autoleave* _[off/on]_
`فعال و غیر فعال کردن خروج خودکار`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Reload*
`بارگذاری ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Pl +* _[nameplug]_
`فعال کردن پلاگین`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Pl -* _[nameplug]_
`غیر فعال کردن پلاگین`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Plist*
`لیست پلاگین های سورس`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Banall* _[username|id|reply]_
`گلوبال کردن از همه گروه های ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text= '> Ɓαcк 🔙' ,callback_data = '/englishh:'..matches[2]}
		}				
	}
	elseif lang then
	text = [[[♨️ ماتادور ورژن 7.1](Telegram.me/mahdiroo)

*🔅 راهنمای ادمین ربات*

▫️*افزودن سودو* _[username|id|reply]_
`اضافه کردن سودو به ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*حذف سودو* _[username|id|reply]_
`حذف کردن سودو از ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*لیست سودو*
`لیست سودو های ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*افزودن ادمین* _[username|id|reply]_
`اضافه کردن ادمین به ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*حذف ادمین* _[username|id|reply]_
`حذف کردن ادمین از ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*لیست ادمین*
`لیست ادمین های ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*امار*
`لیست گروه های ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*امار*
`آمار ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*ارسال فایل* _[folder]_ _[file]_
`ارسال فایل مورد نظر از سورس`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*ارسال پلاگین* _[plug]_
`ارسال پلاگین مورد نظراز سورس`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*خروج خودکار* _[غیر فعال/فعال]_
`فعال و غیر فعال کردن خروج خودکار`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*بارگذاری*
`بارگذاری ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*پلاگین +* _[nameplug]_
`فعال کردن پلاگین`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*پلاگین -* _[nameplug]_
`غیر فعال کردن پلاگین`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*لیست پلاگین*
`لیست پلاگین های سورس`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*سوپر بن* _[username|id|reply]_
`گلوبال کردن از همه گروه های ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text= '> بازگشت 🔙' ,callback_data = '/persianh:'..matches[2]}
		}				
	}
	end
    edit_inline(msg.message_id, text, keyboard)
end
end
if matches[1] == '/help3' then
if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
else	
if not lang then
    text = [[[♨️ MαTαDσR BσT V 7.1](Telegram.me/mahdiroo)

*🔅 Help Buyer BoT*

▫️*Setmanager* _[username|id|reply]_
`افزودن ادمین گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Remmanager* _[username|id|reply]_
`حذف ادمین گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Promote* _[username|id|reply]_
`ارتقا به مقام مدیر گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Demote* _[username|id|reply]_
`تنزل از مقام مدیر گرره`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Setflood* _[2-50]_
`تنظیم تعداد پیام مکرر`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Setfloodtime* _[2-10]_
`تنظیم زمان پیام مکرر`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Setchar* _[2-X]_
`تنظیم تعداد کارکتر`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Silent* _[username|id|reply]_
`سکوت کردن کاربر`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Unsilent* _[username|id|reply]_
`حذف سکوت کاربر`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Kick* _[username|id|reply]_
`اخراج کاربر`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Ban* _[username|id|reply]_
`مسدود کردن کاربر`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Unban* _[username|id|reply]_
`حذف مسدود کاربر`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Res* _[username]_
`مشخصات کاربر با یوزنیم`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Whois* _[id]_
`مشخصات کاربر با ایدی`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Clean*  _[bans | mods | rules | about | silentlist | filtelist | welcome | bot | blacklist]_
`پاک کردن موارد بالا`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Filter* _[word]_
`فیلتر کلمه `
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Unfilter* _[word]_
`حذف فیلتر کلمه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Pin* _[reply]_
`سنجاق کردن پیام`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Unpin*
`حذف سنجاق پیام`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Welcome* _[enable/disable]_
`تنظیم خوشآمد`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Settings* 
`تنظیمات گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Cmds* _[members | moderators | owners ]_
`تعیین سطح جواب ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Whitelist* _[ +  |  - ]_
`افزودن به لیست سفید`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Silentlist*
`لیست کاربران سکوت شده`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Filterlist*
`لیست کلمات فیلتر شده`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Banlist*
`لیست افراد مسدود شده`
_=-=-=-=-=-=-=-=-=-=-=-=_
]]
	keyboard = {} 
	keyboard.inline_keyboard = {
	    {
			{text= '>  More ' ,callback_data = '/help3a:'..matches[2]}
		},
		{
			{text= '> Ɓαcк 🔙' ,callback_data = '/englishh:'..matches[2]}
		}				
	}
	elseif lang then
	text = [[[♨️ ماتادور ورژن 7.1](Telegram.me/mahdiroo)

*🔅 راهنمای خریدار ربات*

▫️*ادمین گروه* _[username|id|reply]_
`افزودن ادمین گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*حذف ادمین گروه* _[username|id|reply]_
`حذف ادمین گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*مدیر* _[username|id|reply]_
`ارتقا به مقام مدیر گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*حذف مدیر* _[username|id|reply]_
`تنزل از مقام مدیر گرره`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*تنظیم پیام مکرر* _[2-50]_
`تنظیم تعداد پیام مکرر`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*تنظیم زمان بررسی* _[2-10]_
`تنظیم زمان پیام مکرر`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*حداکثر حروف مجاز* _[2-X]_
`تنظیم تعداد کارکتر`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*سکوت* _[username|id|reply]_
`سکوت کردن کاربر`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*حذف سکوت* _[username|id|reply]_
`حذف سکوت کاربر`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*اخراج* _[username|id|reply]_
`اخراج کاربر`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*بن* _[username|id|reply]_
`مسدود کردن کاربر`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*حذف بن* _[username|id|reply]_
`حذف مسدود کاربر`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*کاربری* _[username]_
`مشخصات کاربر با یوزنیم`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*شناسه* _[id]_
`مشخصات کاربر با ایدی`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*پاک کردن*  _[قوانین | نام | لینک | درباره | خوشآمد | ربات | لیست سیاه]_
`پاک کردن موارد بالا`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*فیلتر* _[word]_
`فیلتر کلمه `
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*حذف فیلتر* _[word]_
`حذف فیلتر کلمه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*سنجاق* _[reply]_
`سنجاق کردن پیام`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*حذف سنجاق*
`حذف سنجاق پیام`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*خوشآمد* _[فعال/غیر فعال]_
`تنظیم خوشآمد`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*تنظیمات* 
`تنظیمات گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*دستورات* _[کاربر | مدیر | مالک]_
`تعیین سطح جواب ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*لیست سفید* _[ +  |  - ]_
`افزودن به لیست سفید`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*لیست سکوت*
`لیست کاربران سکوت شده`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*لیست فیلتر*
`لیست کلمات فیلتر شده`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*لیست بن*
`لیست افراد مسدود شده`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*لیست مالکان*
`لیست مالکان گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*لیست سفید*
`لیست افراد لیست سفید`
_=-=-=-=-=-=-=-=-=-=-=-=_]]
	keyboard = {} 
	keyboard.inline_keyboard = {
	    {
			{text= '>  ادامه ' ,callback_data = '/help3a:'..matches[2]}
		},
		{
			{text= '> بازگشت 🔙' ,callback_data = '/persianh:'..matches[2]}
		}				
	}
	end
    edit_inline(msg.message_id, text, keyboard)
end
end
if matches[1] == '/help3a' then
if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
else	
if not lang then
    text = [[[♨️ MαTαDσR BσT V 7.1](Telegram.me/mahdiroo)

*🔅 Help Buyer BoT*

▫️*Ownerlist*
`لیست مالکان گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Whitelist*
`لیست افراد لیست سفید`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Modlist*
`لیست مدیران گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Rules*
`قوانین گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*About*
`اطلاعات گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Rmsg* _[1-1000]_
`پاک کردن پیام با تعداد خاص`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Del*
`پاک کردن پیام با ریپلای`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Gpinfo*
`اطلاعات گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Newlink*
`لینک جدید`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Link*
`لینک گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Setlink* _[link]_
`تنظیم لینک گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Setwelcome* _[text]_
`تنظیم پیام خوشآمد`
_=-=-=-=-=-=-=-=-=-=-=-=_
]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text= '> Ɓαcк 🔙' ,callback_data = '/help3:'..matches[2]}
		}				
	}
	elseif lang then
	text = [[[♨️ ماتادور ورژن 7.1](Telegram.me/mahdiroo)

*🔅 راهنمای خریدار ربات*

▫️*لیست مالکان*
`لیست مالکان گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*لیست سفید*
`لیست افراد لیست سفید`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*لیست مدیران*
`لیست مدیران گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*قوانین*
`قوانین گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*درباره*
`اطلاعات گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*پاکسازی* _[1-1000]_
`پاک کردن پیام با تعداد خاص`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*حذف*
`پاک کردن پیام با ریپلای`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*اطلاعات گروه*
`اطلاعات گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*لینک جدید*
`لینک جدید`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*لینک*
`لینک گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*تنظیم لینک* _[link]_
`تنظیم لینک گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*تنظیم خوشآمد* _[text]_
`تنظیم پیام خوشآمد`
_=-=-=-=-=-=-=-=-=-=-=-=_]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text= '> بازگشت 🔙' ,callback_data = '/help3:'..matches[2]}
		}				
	}
	end
    edit_inline(msg.message_id, text, keyboard)
end
end
if matches[1] == '/help4' then
if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
else	
if not lang then
    text = '`💢 Please check your desired option, select :`'
	keyboard = {} 
	keyboard.inline_keyboard = {
	    {
			{text= '> Lock Pro ' ,callback_data = '/help4p:'..matches[2]},
			{text= '> Lock Normal ' ,callback_data = '/help4n:'..matches[2]}
		},
		{
			{text= '> Ɓαcк 🔙' ,callback_data = '/englishh:'..matches[2]}
		}				
	}
	elseif lang then
	text = '*💢 لطفا گزینه مورد نظر خود را انتخاب کنید :*'
	keyboard = {} 
	keyboard.inline_keyboard = {
	    {
			{text= '> قفل پیشرفته ' ,callback_data = '/help4p:'..matches[2]},
			{text= '> قفل نرمال ' ,callback_data = '/help4n:'..matches[2]}
		},
		{
			{text= '> بازگشت 🔙' ,callback_data = '/persianh:'..matches[2]}
		}				
	}
	end
    edit_inline(msg.message_id, text, keyboard)
end
end
if matches[1] == '/help4n' then
if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
else	
if not lang then
    text = [[[♨️ MαTαDσR BσT V 7.1](Telegram.me/mahdiroo)

*🔅 Help Lock BoT*

▫️*Lock*
[`link ~ join ~ tag ~ username ~ edit ~ arabic ~ webpage ~ bots ~ spam ~ flood ~ markdown ~ mention ~ pin ~ cmds  ~ username ~ english ~ gif ~ photo ~ document ~ sticker ~ keyboard ~ video ~ text ~ forward ~ location ~ audio ~ voice ~ contact ~ all`]
`قفل موارد بالا به صورت معمولی`
▪️*Unlock*
[`link ~ join ~ tag ~ username ~ edit ~ arabic ~ webpage ~ bots ~ spam ~ flood ~ markdown ~ mention ~ pin ~ cmds  ~ username ~ english ~ gif ~ photo ~ document ~ sticker ~ keyboard ~ video ~ text ~ forward ~ location ~ audio ~ voice ~ contact ~ all`]
`باز کردن قفل موارد بالا`
]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text= '> Ɓαcк 🔙' ,callback_data = '/help4:'..matches[2]}
		}				
	}
	elseif lang then
	text = [[[♨️ ماتادور ورژن 7.1](Telegram.me/mahdiroo)

*🔅 راهنمای قفلی ربات*

▫️*قفل*
[`لینک ~ ویرایش ~ تگ ~ نام کاربری ~ عربی ~ وب ~ ربات ~ هرزنامه ~ پیام مکرر ~ فراخوانی ~ سنجاق ~ دستورات ~ ورود ~ فونت ~ انگلیسی ~ گیف ~ عکس ~ فایل ~ استیکر ~ صفحه کلید ~ فیلم ~ متن ~ فوروارد ~ مکان ~ اهنگ ~ ویس ~ مخاطب ~ کیبورد شیشه ای ~ بازی ~ خدمات تلگرام`]
`قفل موارد بالا به صورت معمولی`
▪️*بازکردن*
[`لینک ~ ویرایش ~ تگ ~ نام کاربری ~ عربی ~ وب ~ ربات ~ هرزنامه ~ پیام مکرر ~ فراخوانی ~ سنجاق ~ دستورات ~ ورود ~ فونت ~ انگلیسی ~ گیف ~ عکس ~ فایل ~ استیکر ~ صفحه کلید ~ فیلم ~ متن ~ فوروارد ~ مکان ~ اهنگ ~ ویس ~ مخاطب ~ کیبورد شیشه ای ~ بازی ~ خدمات تلگرام`]
`باز کردن قفل موارد بالا`
]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text= '> بازگشت 🔙' ,callback_data = '/help4:'..matches[2]}
		}				
	}
	end
    edit_inline(msg.message_id, text, keyboard)
end
end
if matches[1] == '/help4p' then
if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
else	
if not lang then
    text = [[[♨️ MαTαDσR BσT V 7.1](Telegram.me/mahdiroo)

*🔅 Help Lock BoT*

▫️*Tag* _[kick|warn|ban|del|ok]_
`قفل هشتگ 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Username* _[kick|warn|ban|del|ok]_
`قفل نام کاربری 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Edit* _[kick|warn|ban|del|ok]_
`قفل ویرایش پیام 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Arabic* _[kick|warn|ban|del|ok]_
`قفل عربی 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*English* _[kick|warn|ban|del|ok]_
`قفل انگلیسی 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Webpage* _[kick|warn|ban|del|ok]_
`قفل صفحات وب 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Markdown* _[kick|warn|ban|del|ok]_
`قفل فراخوانی 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Mention* _[kick|warn|ban|del|ok]_
`قفل فونت 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Gif* _[kick|warn|ban|del|ok]_
`قفل گیف 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Photo* _[kick|warn|ban|del|ok]_
`قفل عکس 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Document* _[kick|warn|ban|del|ok]_
`قفل فایل 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Sticker* _[kick|warn|ban|del|ok]_
`قفل استیکر 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Keyboard* _[kick|warn|ban|del|ok]_
`قفل کیبورد شیشه ای 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Video* _[kick|warn|ban|del|ok]_
`قفل فیلم 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Text* _[kick|warn|ban|del|ok]_
`قفل متن 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Forward* _[kick|warn|ban|del|ok]_
`قفل فوروارد 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Location* _[kick|warn|ban|del|ok]_
`قفل مکان 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Audio* _[kick|warn|ban|del|ok]_
`قفل آهنگ 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Voice* _[kick|warn|ban|del|ok]_
`قفل ویس 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Contact* _[kick|warn|ban|del|ok]_
`قفل مخاطب 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Inline* _[kick|warn|ban|del|ok]_
`قفل دکمه شیشه ای 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_]]
	keyboard = {} 
	keyboard.inline_keyboard = {
	    {
			{text= '> More ' ,callback_data = '/help4a:'..matches[2]}
		},
		{
			{text= '> Ɓαcк 🔙' ,callback_data = '/help4:'..matches[2]}
		}				
	}
	elseif lang then
	text = [[[♨️ ماتادور ورژن 7.1](Telegram.me/mahdiroo)

*🔅 راهنمای قفلی ربات*

▫️*تگ* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل هشتگ 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*نام کاربری* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل نام کاربری 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*ویرایش* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل ویرایش پیام 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*عربی* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل عربی 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*انگلیسی* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل انگلیسی 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*وب* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل صفحات وب 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*فرخوانی* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل فراخوانی 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*فونت* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل فونت 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*گیف* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل گیف 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*عکس* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل عکس 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*فایل* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل فایل 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*استیکر* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل استیکر 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*صفحه کلید* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل کیبورد شیشه ای 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*فیلم* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل فیلم 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*متن* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل متن 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*فوروارد* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل فوروارد 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*مکان* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل مکان 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*اهنگ* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل آهنگ 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*ویس* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل ویس 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*مخاطب* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل مخاطب 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*کیبورد شیشه ای* _[اخراج|اخطار|مسدود|حذف|اوکی]_
`قفل دکمه شیشه ای 4 حالته`
_=-=-=-=-=-=-=-=-=-=-=-=_
]]
	keyboard = {} 
	keyboard.inline_keyboard = {
	    {
			{text= '> ادامه ' ,callback_data = '/help4a:'..matches[2]}
		},
		{
			{text= '> بازگشت 🔙' ,callback_data = '/help4:'..matches[2]}
		}				
	}
	end
    edit_inline(msg.message_id, text, keyboard)
end
end
if matches[1] == '/help4a' then
if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
else	
if not lang then
    text = [[[♨️ MαTαDσR BσT V 7.1](Telegram.me/mahdiroo)

*🔅 Help Lock BoT*

▫️*Mutetime* _[hour minute seconds]_

`> بیصدا کردن گروه با ساعت و دقیقه و ثانیه <`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Mutehours* _[hour]_

`> بیصدا کردن گروه در ساعت <`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Muteminutes* _[minute]_

`> بیصدا کردن گروه در دقیقه <`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Muteseconds* _[seconds]_

`> بیصدا کردن گروه در ثانیه <`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Unlock mutetime*

`بازکردن زمان بیصدا زود تر از زمانش`
_=-=-=-=-=-=-=-=-=-=-=-=_
]]
	keyboard = {} 
	keyboard.inline_keyboard = {
	    {
			{text= '> Leran ' ,callback_data = '/help4b:'..matches[2]}
		},
		{
			{text= '> Ɓαcк 🔙' ,callback_data = '/help4p:'..matches[2]}
		}				
	}
	elseif lang then
	text = [[[♨️ ماتادور ورژن 7.1](Telegram.me/mahdiroo)

*🔅 راهنمای قفلی ربات*

▫️*زمان بیصدا* _[hour minute seconds]_

`> بیصدا کردن گروه با ساعت و دقیقه و ثانیه <`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*ساعت بیصدا* _[hour]_

`> بیصدا کردن گروه در ساعت <`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*دقیقه بیصدا* _[minute]_

`> بیصدا کردن گروه در دقیقه <`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*ثانیه بیصدا* _[seconds]_

`> بیصدا کردن گروه در ثانیه <`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*بازکردن زمان بیصدا*

`بازکردن زمان بیصدا زود تر از زمانش`
_=-=-=-=-=-=-=-=-=-=-=-=_
]]
	keyboard = {} 
	keyboard.inline_keyboard = {
	    {
			{text= '> یادگیری ' ,callback_data = '/help4b:'..matches[2]}
		},
		{
			{text= '> بازگشت 🔙' ,callback_data = '/help4p:'..matches[2]}
		}				
	}
	end
    edit_inline(msg.message_id, text, keyboard)
end
end
if matches[1] == '/help4b' then
if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
else	
if not lang then
    text = [[[♨️ MαTαDσR BσT V 7.1](Telegram.me/mahdiroo)

*آموزش قفل 4 حالته*

*Warn*
`
اگر قفل در این حالت باشه 
ابتدا 5 اخطار میده به شخص
سپس شخص را مسدود میکند
`
*Kick*
`
اگر قفل در این حالت باشه 
شخص اخراج میشود ولی 
لیست سیاه نمیرود
`
*Ban*
`
اگر قفل در این حالت باشه 
شخص مسدود میشود 
و دیگر نمتواند وارد گروه شود
`
*Del*
`
اگر قفل در این حالت باشه 
فقط پیام شخص پاک میشود
`
*Ok*
`
اگر قفل در این حالت باشه 
ربات به ان شخص کاری ندارد 
`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Setwarn* _[1-20]_
`تنظیم اخطار`
_=-=-=-=-=-=-=-=-=-=-=-=_
]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text= '> Ɓαcк 🔙' ,callback_data = '/help4a:'..matches[2]}
		}				
	}
	elseif lang then
	text = [[[♨️ ماتادور ورژن 7.1](Telegram.me/mahdiroo)

*آموزش قفل 4 حالته*

*اخطار*
`
اگر قفل در این حالت باشه 
ابتدا 5 اخطار میده به شخص
سپس شخص را مسدود میکند
`
*اخراج*
`
اگر قفل در این حالت باشه 
شخص اخراج میشود ولی 
لیست سیاه نمیرود
`
*مسدود*
`
اگر قفل در این حالت باشه 
شخص مسدود میشود 
و دیگر نمتواند وارد گروه شود
`
*حذف*
`
اگر قفل در این حالت باشه 
فقط پیام شخص پاک میشود
`
*اوکی*
`
اگر قفل در این حالت باشه 
ربات به ان شخص کاری ندارد 
`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*حداکثر اخطار* _[1-20]_
`تنظیم اخطار`
_=-=-=-=-=-=-=-=-=-=-=-=_]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text= '> بازگشت 🔙' ,callback_data = '/help4a:'..matches[2]}
		}				
	}
	end
    edit_inline(msg.message_id, text, keyboard)
end
end
if matches[1] == '/help5' then
if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
else	
if not lang then
    text = [[[♨️ MαTαDσR BσT V 7.1](Telegram.me/mahdiroo)

*🔅 Help Tools BoT*

▫️*Creategroup* _[text]_
`ساخت گروه جدید`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Createsuper* _[text]_
`ساخت سوپر گروه جدید`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Tosuper*
`تبدیل گروه به سوپر گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Broadcast* _[text]_
`ارسال به همه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Import* _[link]_
`ورود ربات توصت لینک`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Setbotname* _[text]_
`تنظیم نام ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Setbotusername* _[text]_
`تنظیم نام کاربری ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Delbotusername*
`حذف نام کاربری ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Markread* _[off/on]_
`روشن و خاموش کردن تیک دوم`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Bc* _[text] [gpid]_
`ارسال پیام به گروه خاصی`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Setmonshi* _[text]_
`تنظیم پیام منشی`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Monshi* _[on/off]_
`خاموش و روشن کردن منشی`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Pmmonshi*
`نمایش متن منشی`
_=-=-=-=-=-=-=-=-=-=-=-=_]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text= '> Ɓαcк 🔙' ,callback_data = '/englishh:'..matches[2]}
		}				
	}
	elseif lang then
	text = [[[♨️ ماتادور ورژن 7.1](Telegram.me/mahdiroo)

*🔅 راهنمای قفلی ربات*

▫️*ساخت گروه* _[text]_
`ساخت گروه جدید`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*ساخت سوپر گروه* _[text]_
`ساخت سوپر گروه جدید`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*تبدیل به سوپر*
`تبدیل گروه به سوپر گروه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*ارسال به همه* _[text]_
`ارسال به همه`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*ورود لینک* _[link]_
`ورود ربات توصت لینک`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*تغییر نام ربات* _[text]_
`تنظیم نام ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*تغییر یوزنیم ربات* _[text]_
`تنظیم نام کاربری ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*حذف یوزنیم ربات*
`حذف نام کاربری ربات`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*تیک دوم* _[غیرفعال/فعال]_
`روشن و خاموش کردن تیک دوم`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*ارسال* _[text] [gpid]_
`ارسال پیام به گروه خاصی`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*تنظیم منشی* _[text]_
`تنظیم پیام منشی`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*منشی* _[روشن/خاموش]_
`خاموش و روشن کردن منشی`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*پیام منشی*
`نمایش متن منشی`
_=-=-=-=-=-=-=-=-=-=-=-=_]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text= '> بازگشت 🔙' ,callback_data = '/persianh:'..matches[2]}
		}				
	}
	end
    edit_inline(msg.message_id, text, keyboard)
end
end
if matches[1] == '/help6' then
if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
else	
if not lang then
    text = [[[♨️ MαTαDσR BσT V 7.1](Telegram.me/mahdiroo)

*🔅 Help Fun BoT*

▫️*Time*
`نمایش ساعت فعلی`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Short* _[link]_
`کوتاه کردن لینک `
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Tr* _[lang] [word]_
`مترجم متن فارسی و انگلیسی`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Sticker* _[word]_
`استیکر ساز 30 طرح`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Photo* _[word]_
`عکس ساز 30 طرح`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Gif* _[word]_
`گیف ساز 30 طرح`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Azan* _[city]_
`اذان`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Calc* _[number]_
`ماشین حساب`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*Weather* _[city]_
`اب و هوا`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*Write* _[word]_
`نوشتن با 100 فونت مختلف`
_=-=-=-=-=-=-=-=-=-=-=-=_]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text= '> Ɓαcк 🔙' ,callback_data = '/englishh:'..matches[2]}
		}				
	}
	elseif lang then
	text = [[[♨️ ماتادور ورژن 7.1](Telegram.me/mahdiroo)

*🔅 راهنمای سرگرمی ربات*

▫️*ساعت*
`نمایش ساعت فعلی`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*لینک کوتاه* _[link]_
`کوتاه کردن لینک `
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*ترجمه* _[lang] [word]_
`مترجم متن فارسی و انگلیسی`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*استیکر* _[word]_
`استیکر ساز 30 طرح`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*عکس* _[word]_
`عکس ساز 30 طرح`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*گیف* _[word]_
`گیف ساز 30 طرح`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*اذان* _[city]_
`اذان`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*حساب کن* _[number]_
`ماشین حساب`
_=-=-=-=-=-=-=-=-=-=-=-=_
▫️*اب و هوا* _[city]_
`اب و هوا`
_=-=-=-=-=-=-=-=-=-=-=-=_
▪️*نوشتن* _[word]_
`نوشتن با 100 فونت مختلف`
_=-=-=-=-=-=-=-=-=-=-=-=_]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text= '> بازگشت 🔙' ,callback_data = '/persianh:'..matches[2]}
		}				
	}
	end
    edit_inline(msg.message_id, text, keyboard)
end
end
if matches[1] == '/nerkh' then
if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
else
	local text = [[
*💵 نرخ فروش گروه با ربات*
*⚜  ᴹᵃ̶ᵀ̶ᵃ̶ᴰ̶ᵒ̶ᴿ̶ ̶ᴮ̶ᵒ̶ᵀ ⚜*

*✳️برای تمام گروه ها‌*
 
*➰1 ماهه  8 هزار تومان 
➰2 ماهه  14 هزار تومان
➰3 ماهه  20 هزار تومان
➰4 ماهه  25 هزار تومان*

_🔰 نکات قابل ذکر :_

`1⃣ توجه داشته باشید ربات به مدت ۲۴ الی ۴۸ ساعت برای تست در گروه نصب میشود و بعد تست و رضایت کامل اعمالات صورت میگیرد

2⃣ همچنین باید قبل از پایان مهلت تست رضایت کامل هزینه پرداخت شود درغیر این صورت ربات خارج میشود

3⃣ لازم به ذکره اولویت بصورت پرداخت کارت به کارت میباشد

4⃣ ربات داعمی نداریم به علت کیفیت و کارای بالای ربات`

*برای خرید به ایدی زیر‌ مراجعه کنید‌ :*
🆔 : [MahDiRoO](Telegram.Me/mahdiroo)

*در صورت ریپورت بودن به ایدی زیر مراجعه کنید :*
🆔 : [MahDiRoO Pv](Telegram.Me/mahdiroo_bot)
	]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text= '> بازگشت 🔙' ,callback_data = '/helpp:'..matches[2]}
		}				
	}
    edit_inline(msg.message_id, text, keyboard)
end
end
	if matches[1] == '/englishh' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
    redis:del(hash)
   sleep(1)
	helps(msg, matches[2])
	end
end
	if matches[1] == '/persianh' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
    redis:set(hash, true)
   sleep(1)
	helps(msg, matches[2])
	end
end
	if matches[1] == '/english' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
    redis:del(hash)
   sleep(1)
	options(msg, matches[2])
	end
end
	if matches[1] == '/persian' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
    redis:set(hash, true)
   sleep(1)
	options(msg, matches[2])
	end
end
	if matches[1] == '/option' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
	options(msg, matches[2])
	end
end
if matches[1] == '/settingsp' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		settingp(msg, data, matches[2])
	end
end
if matches[1] == '/mutelistp' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		mutelistsp(msg, data, matches[2])
	end
end
if matches[1] == '/settings' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutelist' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/moresettingsp' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		moresettingp(msg, data, matches[2])
	end
end
if matches[1] == '/moresettings' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		moresetting(msg, data, matches[2])
	end
end

          -- ####################### Settings ####################### --
if matches[1] == '/locklinkd' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local locklink = data[tostring(matches[2])]["settings"]["lock_link"]
   if not lang then
			text = 'Lock Link : Del'
   elseif lang then
			text = 'حذف لینک فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_link"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/locklinkw' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local locklink = data[tostring(matches[2])]["settings"]["lock_link"]
   if not lang then
			text = 'Lock Link : Warn'
   elseif lang then
			text = 'اخطار لینک فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_link"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/locklinkb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local locklink = data[tostring(matches[2])]["settings"]["lock_link"]
   if not lang then
			text = 'Lock Link : Ban'
   elseif lang then
			text = 'مسدود لینک فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_link"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/locklinkk' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local locklink = data[tostring(matches[2])]["settings"]["lock_link"]
   if not lang then
			text = 'Lock Link : Kick'
   elseif lang then
			text = 'اخراج لینک فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_link"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/locklinko' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local locklink = data[tostring(matches[2])]["settings"]["lock_link"]
   if not lang then
			text = 'Lock Link : Ok'
   elseif lang then
			text = 'اوکی لینک فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_link"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockeditd' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockedit = data[tostring(matches[2])]["settings"]["lock_edit"]
   if not lang then
			text = 'Lock Edit : Del'
   elseif lang then
			text = 'حذف ویرایش فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_edit"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockeditw' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockedit = data[tostring(matches[2])]["settings"]["lock_edit"]
   if not lang then
			text = 'Lock Edit : Warn'
   elseif lang then
			text = 'اخطار ویرایش فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_edit"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockeditb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockedit = data[tostring(matches[2])]["settings"]["lock_edit"]
   if not lang then
			text = 'Lock Edit : Ban'
   elseif lang then
			text = 'مسدود ویرایش فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_edit"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockeditk' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockedit = data[tostring(matches[2])]["settings"]["lock_edit"]
   if not lang then
			text = 'Lock Edit : Kick'
   elseif lang then
			text = 'اخراج ویرایش فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_edit"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockedito' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockedit = data[tostring(matches[2])]["settings"]["lock_edit"]
   if not lang then
			text = 'Lock Edit : Ok'
   elseif lang then
			text = 'اوکی ویرایش فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_edit"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/locktagsd' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local locktags = data[tostring(matches[2])]["settings"]["lock_tag"]
   if not lang then
			text = 'Lock Tag : Del'
   elseif lang then
			text = 'حذف تگ فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_tag"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/locktagsw' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local locktags = data[tostring(matches[2])]["settings"]["lock_tag"]
   if not lang then
			text = 'Lock Tag : Warn'
   elseif lang then
			text = 'اخطار تگ فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_tag"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/locktagsb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local locktags = data[tostring(matches[2])]["settings"]["lock_tag"]
   if not lang then
			text = 'Lock Tag : Ban'
   elseif lang then
			text = 'مسدود تگ فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_tag"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/locktagsk' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local locktags = data[tostring(matches[2])]["settings"]["lock_tag"]
   if not lang then
			text = 'Lock Tag : Kick'
   elseif lang then
			text = 'اخراج تگ فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_tag"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/locktagso' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local locktags = data[tostring(matches[2])]["settings"]["lock_tag"]
   if not lang then
			text = 'Lock Tag : Ok'
   elseif lang then
			text = 'اوکی تگ فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_tag"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockusernamed' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockusername = data[tostring(matches[2])]["settings"]["lock_username"]
   if not lang then
			text = 'Lock Username : Del'
   elseif lang then
			text = 'حذف نام کاربری فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_username"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockusernamew' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockusername = data[tostring(matches[2])]["settings"]["lock_username"]
   if not lang then
			text = 'Lock Username : Warn'
   elseif lang then
			text = 'اخطار نام کاربری فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_username"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockusernameb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockusername = data[tostring(matches[2])]["settings"]["lock_username"]
   if not lang then
			text = 'Lock Username : Ban'
   elseif lang then
			text = 'مسدود نام کاربری فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_username"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockusernamek' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockusername = data[tostring(matches[2])]["settings"]["lock_username"]
   if not lang then
			text = 'Lock Username : Kick'
   elseif lang then
			text = 'اخراج نام کاربری فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_username"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockusernameo' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockusername = data[tostring(matches[2])]["settings"]["lock_username"]
   if not lang then
			text = 'Lock Username : Ok'
   elseif lang then
			text = 'اوکی نام کاربری فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_username"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockjoin' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_join"]
		if chklock == "no" then
   if not lang then
			text = 'Join Has Been Locked'
   elseif lang then
			text = 'قفل ورود فعال شد'
    end
            data[tostring(matches[2])]["settings"]["lock_join"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Join Has Been Unlocked'
   elseif lang then
			text = 'قفل ورود غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_join"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/lockjoinn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_join"]
		if chklock == "no" then
   if not lang then
			text = 'Join Has Been Locked'
   elseif lang then
			text = 'قفل ورود فعال شد'
    end
            data[tostring(matches[2])]["settings"]["lock_join"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Join Has Been Unlocked'
   elseif lang then
			text = 'قفل ورود غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_join"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/lockflood' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_flood"]
		if chklock == "no" then
   if not lang then
			text = 'Flood Has Been Locked'
   elseif lang then
			text = 'قفل پیام های مکرر فعال شد'
    end
            data[tostring(matches[2])]["settings"]["lock_flood"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Flood Has Been Unlocked'
   elseif lang then
			text = 'قفل پیام های مکرر غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_flood"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/lockfloodn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_flood"]
		if chklock == "no" then
   if not lang then
			text = 'Flood Has Been Locked'
   elseif lang then
			text = 'قفل پیام های مکرر فعال شد'
    end
            data[tostring(matches[2])]["settings"]["lock_flood"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Flood Has Been Unlocked'
   elseif lang then
			text = 'قفل پیام های مکرر غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_flood"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/lockspamn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_spam"]
		if chklock == "no" then
   if not lang then
			text = 'Spam Has Been Locked'
   elseif lang then
			text = 'قفل هرزنامه فعال شد'
    end
            data[tostring(matches[2])]["settings"]["lock_spam"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Spam Has Been Unlocked'
   elseif lang then
			text = 'قفل هرزنامه غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_spam"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/lockspam' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_spam"]
		if chklock == "no" then
   if not lang then
			text = 'Spam Has Been Locked'
   elseif lang then
			text = 'قفل هرزنامه فعال شد'
    end
            data[tostring(matches[2])]["settings"]["lock_spam"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Spam Has Been Unlocked'
   elseif lang then
			text = 'قفل هرزنامه غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_spam"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/lockmentiond' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockmention = data[tostring(matches[2])]["settings"]["lock_mention"]
   if not lang then
			text = 'Lock Mention : Del'
   elseif lang then
			text = 'حذف فراخوانی فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_mention"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockmentionw' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockmention = data[tostring(matches[2])]["settings"]["lock_mention"]
   if not lang then
			text = 'Lock Mention : Warn'
   elseif lang then
			text = 'اخطار فراخوانی فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_mention"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockmentionb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockmention = data[tostring(matches[2])]["settings"]["lock_mention"]
   if not lang then
			text = 'Lock Mention : Ban'
   elseif lang then
			text = 'مسدود فراخوانی فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_mention"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockmentionk' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockmention = data[tostring(matches[2])]["settings"]["lock_mention"]
   if not lang then
			text = 'Lock Mention : Kick'
   elseif lang then
			text = 'اخراج فراخوانی فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_mention"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockmentiono' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockmention = data[tostring(matches[2])]["settings"]["lock_mention"]
   if not lang then
			text = 'Lock Mention : Ok'
   elseif lang then
			text = 'اوکی فراخوانی فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_mention"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockarabicd' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockarabic = data[tostring(matches[2])]["settings"]["lock_arabic"]
   if not lang then
			text = 'Lock Arabic : Del'
   elseif lang then
			text = 'حذف فارسی فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_arabic"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockarabicw' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockarabic = data[tostring(matches[2])]["settings"]["lock_arabic"]
   if not lang then
			text = 'Lock Arabic : Warn'
   elseif lang then
			text = 'اخطار فارسی فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_arabic"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockarabicb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockarabic = data[tostring(matches[2])]["settings"]["lock_arabic"]
   if not lang then
			text = 'Lock Arabic : Ban'
   elseif lang then
			text = 'مسدود فارسی فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_arabic"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockarabick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockarabic = data[tostring(matches[2])]["settings"]["lock_arabic"]
   if not lang then
			text = 'Lock Arabic : Kick'
   elseif lang then
			text = 'اخراج فارسی فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_arabic"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockarabico' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockarabic = data[tostring(matches[2])]["settings"]["lock_arabic"]
   if not lang then
			text = 'Lock Arabic : Ok'
   elseif lang then
			text = 'اوکی فارسی فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_arabic"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockenglishd' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockenglish = data[tostring(matches[2])]["settings"]["lock_english"]
   if not lang then
			text = 'Lock English : Del'
   elseif lang then
			text = 'حذف انگلیسی فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_english"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockenglishw' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockenglish = data[tostring(matches[2])]["settings"]["lock_english"]
   if not lang then
			text = 'Lock English : Warn'
   elseif lang then
			text = 'اخطار انگلیسی فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_english"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockenglishb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockenglish = data[tostring(matches[2])]["settings"]["lock_english"]
   if not lang then
			text = 'Lock English : Ban'
   elseif lang then
			text = 'مسدود انگلیسی فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_english"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockenglishk' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockenglish = data[tostring(matches[2])]["settings"]["lock_english"]
   if not lang then
			text = 'Lock English : Kick'
   elseif lang then
			text = 'اخراج انگلیسی فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_english"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockenglisho' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockenglish = data[tostring(matches[2])]["settings"]["lock_english"]
   if not lang then
			text = 'Lock English : Ok'
   elseif lang then
			text = 'اوکی انگلیسی فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_english"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockwebpaged' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockwebpage = data[tostring(matches[2])]["settings"]["lock_webpage"]
   if not lang then
			text = 'Lock Webpage : Del'
   elseif lang then
			text = 'حذف وب فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_webpage"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockwebpagew' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockwebpage = data[tostring(matches[2])]["settings"]["lock_webpage"]
   if not lang then
			text = 'Lock Webpage : Warn'
   elseif lang then
			text = 'اخطار وب فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_webpage"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockwebpageb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockwebpage = data[tostring(matches[2])]["settings"]["lock_webpage"]
   if not lang then
			text = 'Lock Webpage : Ban'
   elseif lang then
			text = 'مسدود وب فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_webpage"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockwebpagek' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockwebpage = data[tostring(matches[2])]["settings"]["lock_webpage"]
   if not lang then
			text = 'Lock Webpage : Kick'
   elseif lang then
			text = 'اخراج وب فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_webpage"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockwebpageo' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockwebpage = data[tostring(matches[2])]["settings"]["lock_webpage"]
   if not lang then
			text = 'Lock Webpage : Ok'
   elseif lang then
			text = 'اوکی وب فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_webpage"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockmarkdownd' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockmarkdown = data[tostring(matches[2])]["settings"]["lock_markdown"]
   if not lang then
			text = 'Lock Markdown : Del'
   elseif lang then
			text = 'حذف فونت فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_markdown"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockmarkdownw' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockmarkdown = data[tostring(matches[2])]["settings"]["lock_markdown"]
   if not lang then
			text = 'Lock Markdown : Warn'
   elseif lang then
			text = 'اخطار فونت فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_markdown"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockmarkdownb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockmarkdown = data[tostring(matches[2])]["settings"]["lock_markdown"]
   if not lang then
			text = 'Lock Markdown : Ban'
   elseif lang then
			text = 'مسدود فونت فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_markdown"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockmarkdownk' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockmarkdown = data[tostring(matches[2])]["settings"]["lock_markdown"]
   if not lang then
			text = 'Lock Markdown : Kick'
   elseif lang then
			text = 'اخراج فونت فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_markdown"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockmarkdowno' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local lockmarkdown = data[tostring(matches[2])]["settings"]["lock_markdown"]
   if not lang then
			text = 'Lock Markdown : Ok'
   elseif lang then
			text = 'اوکی فونت فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_markdown"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockpin' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_pin"]
		if chklock == "no" then
   if not lang then
			text = 'Pin Has Been Locked'
   elseif lang then
			text = 'قفل سنجاق کردن فعال شد'
    end
            data[tostring(matches[2])]["settings"]["lock_pin"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Pin Has Been Unlocked'
   elseif lang then
			text = 'قفل سنجاق کردن غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_pin"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/lockpinn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_pin"]
		if chklock == "no" then
   if not lang then
			text = 'Pin Has Been Locked'
   elseif lang then
			text = 'قفل سنجاق کردن فعال شد'
    end
            data[tostring(matches[2])]["settings"]["lock_pin"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Pin Has Been Unlocked'
   elseif lang then
			text = 'قفل سنجاق کردن غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_pin"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/lockbots' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_bots"]
		if chklock == "no" then
   if not lang then
			text = 'Bots Has Been Locked'
   elseif lang then
			text = 'قفل ربات ها فعال شد'
    end
            data[tostring(matches[2])]["settings"]["lock_bots"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Bots Has Been Unlocked'
   elseif lang then
			text = 'قفل ربات ها غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_bots"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/lockbotsn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_bots"]
		if chklock == "no" then
   if not lang then
			text = 'Bots Has Been Locked'
   elseif lang then
			text = 'قفل ربات ها فعال شد'
    end
            data[tostring(matches[2])]["settings"]["lock_bots"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Bots Has Been Unlocked'
   elseif lang then
			text = 'قفل ربات ها غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_bots"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/welcome' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["welcome"]
		if chklock == "no" then
   if not lang then
			text = 'Welcome Has Been Enabled'
   elseif lang then
			text = 'خوش آمد گویی فعال شد'
    end
            data[tostring(matches[2])]["settings"]["welcome"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Welcome Has Been Disabled'
   elseif lang then
			text = 'خوش آمد گویی غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["welcome"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/floodup' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local flood_max = 5
        if data[tostring(matches[2])] then
			if data[tostring(matches[2])]['settings']['num_msg_max'] then
				flood_max = data[tostring(matches[2])]['settings']['num_msg_max']
			end
		end
		if tonumber(flood_max) < 30 then
			flood_max = tonumber(flood_max) + 1
			data[tostring(matches[2])]['settings']['num_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
   if not lang then
			text = "Flood Sensitivity Has Been Set To : "..flood_max
   elseif lang then
			text = "حساسیت پیام های مکرر تنظیم شد به : "..flood_max
    end
			get_alert(msg.cb_id, text)
		end 
		moresetting(msg, data, matches[2])
	end
end
if matches[1] == '/flooddown' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local flood_max = 5
        if data[tostring(matches[2])] then
			if data[tostring(matches[2])]['settings']['num_msg_max'] then
				flood_max = data[tostring(matches[2])]['settings']['num_msg_max']
			end
		end
		if tonumber(flood_max) > 2 then
			flood_max = tonumber(flood_max) - 1
			data[tostring(matches[2])]['settings']['num_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
   if not lang then
			text = "Flood Sensitivity Has Been Set To : "..flood_max
   elseif lang then
			text = "حساسیت پیام های مکرر تنظیم شد به : "..flood_max
    end
			get_alert(msg.cb_id, text)
		end 
		moresetting(msg, data, matches[2])
	end
end
if matches[1] == '/charup' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local char_max = 5
        if data[tostring(matches[2])] then
			if data[tostring(matches[2])]['settings']['set_char'] then
				char_max = data[tostring(matches[2])]['settings']['set_char']
			end
		end
		if tonumber(char_max) < 1000 then
			char_max = tonumber(char_max) + 1
			data[tostring(matches[2])]['settings']['set_char'] = char_max
			save_data(_config.moderation.data, data)
   if not lang then
			text = "Character Sensitivity Has Been Set To : "..char_max
   elseif lang then
			text = "تعداد حروف مجاز تنظیم شد به : "..char_max
    end
			get_alert(msg.cb_id, text)
		end 
		moresetting(msg, data, matches[2])
	end
end
if matches[1] == '/chardown' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local char_max = 5
        if data[tostring(matches[2])] then
			if data[tostring(matches[2])]['settings']['set_char'] then
				char_max = data[tostring(matches[2])]['settings']['set_char']
			end
		end
		if tonumber(char_max) > 2 then
			char_max = tonumber(char_max) - 1
			data[tostring(matches[2])]['settings']['set_char'] = char_max
			save_data(_config.moderation.data, data)
   if not lang then
			text = "Character Sensitivity Has Been Set To : "..char_max
   elseif lang then
			text = "تعداد حروف مجاز تنظیم شد به : "..char_max
    end
			get_alert(msg.cb_id, text)
		end 
		moresetting(msg, data, matches[2])
	end
end
if matches[1] == '/floodtimeup' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local check_time = 5
        if data[tostring(matches[2])] then
			if data[tostring(matches[2])]['settings']['time_check'] then
				check_time = data[tostring(matches[2])]['settings']['time_check']
			end
		end
		if tonumber(check_time) < 10 then
			check_time = tonumber(check_time) + 1
			data[tostring(matches[2])]['settings']['time_check'] = check_time
			save_data(_config.moderation.data, data)
   if not lang then
			text = "Flood Check Time Has Been Set To : "..check_time
   elseif lang then
			text = "زمان بررسی پیام های مکرر تنظیم شد به : "..check_time
    end
			get_alert(msg.cb_id, text)
		end 
		moresetting(msg, data, matches[2])
	end
end
if matches[1] == '/floodtimedown' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local check_time = 5
        if data[tostring(matches[2])] then
			if data[tostring(matches[2])]['settings']['time_check'] then
				check_time = data[tostring(matches[2])]['settings']['time_check']
			end
		end
		if tonumber(check_time) > 2 then
			check_time = tonumber(check_time) - 1
			data[tostring(matches[2])]['settings']['time_check'] = check_time
			save_data(_config.moderation.data, data)
   if not lang then
			text = "Flood Check Time Has Been Set To : "..check_time
   elseif lang then
			text = "زمان بررسی پیام های مکرر تنظیم شد به : "..check_time
    end
			get_alert(msg.cb_id, text)
		end 
		moresetting(msg, data, matches[2])
	end
end

			-- ###################### Mute ###################### --
			
if matches[1] == '/mutegifd' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutegif = data[tostring(matches[2])]["mutes"]["mute_gif"]
   if not lang then
			text = 'Lock Gif : Del'
   elseif lang then
			text = 'حذف گیف فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_gif"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutegifw' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutegif = data[tostring(matches[2])]["mutes"]["mute_gif"]
   if not lang then
			text = 'Lock Gif : Warn'
   elseif lang then
			text = 'اخطار گیف فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_gif"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutegifb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutegif = data[tostring(matches[2])]["mutes"]["mute_gif"]
   if not lang then
			text = 'Lock Gif : Ban'
   elseif lang then
			text = 'مسدود گیف فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_gif"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutegifk' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutegif = data[tostring(matches[2])]["mutes"]["mute_gif"]
   if not lang then
			text = 'Lock Gif : Kick'
   elseif lang then
			text = 'اخراج گیف فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_gif"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutegifo' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutegif = data[tostring(matches[2])]["mutes"]["mute_gif"]
   if not lang then
			text = 'Lock Gif : Ok'
   elseif lang then
			text = 'اوکی گیف فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_gif"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutetextd' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutetext = data[tostring(matches[2])]["mutes"]["mute_text"]
   if not lang then
			text = 'Lock Text : Del'
   elseif lang then
			text = 'حذف متن فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_text"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutetextw' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutetext = data[tostring(matches[2])]["mutes"]["mute_text"]
   if not lang then
			text = 'Lock Text : Warn'
   elseif lang then
			text = 'اخطار متن فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_text"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutetextb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutetext = data[tostring(matches[2])]["mutes"]["mute_text"]
   if not lang then
			text = 'Lock Text : Ban'
   elseif lang then
			text = 'مسدود متن فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_text"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutetextk' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutetext = data[tostring(matches[2])]["mutes"]["mute_text"]
   if not lang then
			text = 'Lock Text : Kick'
   elseif lang then
			text = 'اخراج متن فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_text"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutetexto' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutetext = data[tostring(matches[2])]["mutes"]["mute_text"]
   if not lang then
			text = 'Lock Text : Ok'
   elseif lang then
			text = 'اوکی متن فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_text"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/muteinlined' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local muteinline = data[tostring(matches[2])]["mutes"]["mute_inline"]
   if not lang then
			text = 'Lock Inline : Del'
   elseif lang then
			text = 'حذف دکمه شیشه ای فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_inline"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/muteinlinew' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local muteinline = data[tostring(matches[2])]["mutes"]["mute_inline"]
   if not lang then
			text = 'Lock Inline : Warn'
   elseif lang then
			text = 'اخطار دکمه شیشه ای فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_inline"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/muteinlineb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local muteinline = data[tostring(matches[2])]["mutes"]["mute_inline"]
   if not lang then
			text = 'Lock Inline : Ban'
   elseif lang then
			text = 'مسدود دکمه شیشه ای فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_inline"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/muteinlinek' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local muteinline = data[tostring(matches[2])]["mutes"]["mute_inline"]
   if not lang then
			text = 'Lock Inline : Kick'
   elseif lang then
			text = 'اخراج دکمه شیشه ای فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_inline"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/muteinlineo' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local muteinline = data[tostring(matches[2])]["mutes"]["mute_inline"]
   if not lang then
			text = 'Lock Inline : Ok'
   elseif lang then
			text = 'اوکی دکمه شیشه ای فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_inline"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutegamed' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutegame = data[tostring(matches[2])]["mutes"]["mute_game"]
   if not lang then
			text = 'Lock Game : Del'
   elseif lang then
			text = 'حذف بازی فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_game"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutegamew' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutegame = data[tostring(matches[2])]["mutes"]["mute_game"]
   if not lang then
			text = 'Lock Game : Warn'
   elseif lang then
			text = 'اخطار بازی فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_game"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutegameb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutegame = data[tostring(matches[2])]["mutes"]["mute_game"]
   if not lang then
			text = 'Lock Game : Ban'
   elseif lang then
			text = 'مسدود بازی فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_game"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutegamek' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutegame = data[tostring(matches[2])]["mutes"]["mute_game"]
   if not lang then
			text = 'Lock Game : Kick'
   elseif lang then
			text = 'اخراج بازی فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_game"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutegameo' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutegame = data[tostring(matches[2])]["mutes"]["mute_game"]
   if not lang then
			text = 'Lock Game : Ok'
   elseif lang then
			text = 'اوکی بازی فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_game"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutephotod' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutephoto = data[tostring(matches[2])]["mutes"]["mute_photo"]
   if not lang then
			text = 'Lock Photo : Del'
   elseif lang then
			text = 'حذف عکس فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_photo"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutephotow' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutephoto = data[tostring(matches[2])]["mutes"]["mute_photo"]
   if not lang then
			text = 'Lock Photo : Warn'
   elseif lang then
			text = 'اخطار عکس فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_photo"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutephotob' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutephoto = data[tostring(matches[2])]["mutes"]["mute_photo"]
   if not lang then
			text = 'Lock Photo : Ban'
   elseif lang then
			text = 'مسدود عکس فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_photo"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutephotok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutephoto = data[tostring(matches[2])]["mutes"]["mute_photo"]
   if not lang then
			text = 'Lock Photo : Kick'
   elseif lang then
			text = 'اخراج عکس فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_photo"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutephotoo' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutephoto = data[tostring(matches[2])]["mutes"]["mute_photo"]
   if not lang then
			text = 'Lock Photo : Ok'
   elseif lang then
			text = 'اوکی عکس فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_photo"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mutevideod' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutevideo = data[tostring(matches[2])]["mutes"]["mute_video"]
   if not lang then
			text = 'Lock Video : Del'
   elseif lang then
			text = 'حذف فیلم فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_video"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutevideow' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutevideo = data[tostring(matches[2])]["mutes"]["mute_video"]
   if not lang then
			text = 'Lock Video : Warn'
   elseif lang then
			text = 'اخطار فیلم فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_video"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutevideob' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutevideo = data[tostring(matches[2])]["mutes"]["mute_video"]
   if not lang then
			text = 'Lock Video : Ban'
   elseif lang then
			text = 'مسدود فیلم فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_video"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutevideok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutevideo = data[tostring(matches[2])]["mutes"]["mute_video"]
   if not lang then
			text = 'Lock Video : Kick'
   elseif lang then
			text = 'اخراج فیلم فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_video"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutevideoo' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutevideo = data[tostring(matches[2])]["mutes"]["mute_video"]
   if not lang then
			text = 'Lock Video : Ok'
   elseif lang then
			text = 'اوکی فیلم فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_video"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/muteaudiod' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local muteaudio = data[tostring(matches[2])]["mutes"]["mute_audio"]
   if not lang then
			text = 'Lock Audio : Del'
   elseif lang then
			text = 'حذف آهنگ فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_audio"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/muteaudiow' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local muteaudio = data[tostring(matches[2])]["mutes"]["mute_audio"]
   if not lang then
			text = 'Lock Audio : Warn'
   elseif lang then
			text = 'اخطار آهنگ فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_audio"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/muteaudiob' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local muteaudio = data[tostring(matches[2])]["mutes"]["mute_audio"]
   if not lang then
			text = 'Lock Audio : Ban'
   elseif lang then
			text = 'مسدود آهنگ فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_audio"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/muteaudiok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local muteaudio = data[tostring(matches[2])]["mutes"]["mute_audio"]
   if not lang then
			text = 'Lock Audio : Kick'
   elseif lang then
			text = 'اخراج آهنگ فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_audio"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/muteaudioo' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local muteaudio = data[tostring(matches[2])]["mutes"]["mute_audio"]
   if not lang then
			text = 'Lock Audio : Ok'
   elseif lang then
			text = 'اوکی آهنگ فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_audio"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutevoiced' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutevoice = data[tostring(matches[2])]["mutes"]["mute_voice"]
   if not lang then
			text = 'Lock Voice : Del'
   elseif lang then
			text = 'حذف ویس فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_voice"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutevoicew' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutevoice = data[tostring(matches[2])]["mutes"]["mute_voice"]
   if not lang then
			text = 'Lock Voice : Warn'
   elseif lang then
			text = 'اخطار ویس فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_voice"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutevoiceb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutevoice = data[tostring(matches[2])]["mutes"]["mute_voice"]
   if not lang then
			text = 'Lock Voice : Ban'
   elseif lang then
			text = 'مسدود ویس فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_voice"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutevoicek' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutevoice = data[tostring(matches[2])]["mutes"]["mute_voice"]
   if not lang then
			text = 'Lock Voice : Kick'
   elseif lang then
			text = 'اخراج ویس فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_voice"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutevoiceo' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutevoice = data[tostring(matches[2])]["mutes"]["mute_voice"]
   if not lang then
			text = 'Lock Voice : Ok'
   elseif lang then
			text = 'اوکی ویس فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_voice"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutestickerd' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutesticker = data[tostring(matches[2])]["mutes"]["mute_sticker"]
   if not lang then
			text = 'Lock Sticker : Del'
   elseif lang then
			text = 'حذف استیکر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_sticker"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutestickerw' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutesticker = data[tostring(matches[2])]["mutes"]["mute_sticker"]
   if not lang then
			text = 'Lock Sticker : Warn'
   elseif lang then
			text = 'اخطار استیکر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_sticker"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutestickerb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutesticker = data[tostring(matches[2])]["mutes"]["mute_sticker"]
   if not lang then
			text = 'Lock Sticker : Ban'
   elseif lang then
			text = 'مسدود استیکر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_sticker"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutestickerk' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutesticker = data[tostring(matches[2])]["mutes"]["mute_sticker"]
   if not lang then
			text = 'Lock Sticker : Kick'
   elseif lang then
			text = 'اخراج استیکر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_sticker"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutestickero' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutesticker = data[tostring(matches[2])]["mutes"]["mute_sticker"]
   if not lang then
			text = 'Lock Sticker : Ok'
   elseif lang then
			text = 'اوکی استیکر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_sticker"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutecontactd' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutecontact = data[tostring(matches[2])]["mutes"]["mute_contact"]
   if not lang then
			text = 'Lock Contact : Del'
   elseif lang then
			text = 'حذف مخاطب فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_contact"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutecontactw' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutecontact = data[tostring(matches[2])]["mutes"]["mute_contact"]
   if not lang then
			text = 'Lock Contact : Warn'
   elseif lang then
			text = 'اخطار مخاطب فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_contact"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutecontactb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutecontact = data[tostring(matches[2])]["mutes"]["mute_contact"]
   if not lang then
			text = 'Lock Contact : Ban'
   elseif lang then
			text = 'مسدود مخاطب فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_contact"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutecontactk' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutecontact = data[tostring(matches[2])]["mutes"]["mute_contact"]
   if not lang then
			text = 'Lock Contact : Kick'
   elseif lang then
			text = 'اخراج مخاطب فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_contact"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutecontacto' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutecontact = data[tostring(matches[2])]["mutes"]["mute_contact"]
   if not lang then
			text = 'Lock Contact : Ok'
   elseif lang then
			text = 'اوکی مخاطب فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_contact"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/muteforwardd' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local muteforward = data[tostring(matches[2])]["mutes"]["mute_forward"]
   if not lang then
			text = 'Lock Forward : Del'
   elseif lang then
			text = 'حذف نقل قول فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_forward"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/muteforwardw' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local muteforward = data[tostring(matches[2])]["mutes"]["mute_forward"]
   if not lang then
			text = 'Lock Forward : Warn'
   elseif lang then
			text = 'اخطار نقل قول فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_forward"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/muteforwardb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local muteforward = data[tostring(matches[2])]["mutes"]["mute_forward"]
   if not lang then
			text = 'Lock Forward : Ban'
   elseif lang then
			text = 'مسدود نقل قول فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_forward"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/muteforwardk' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local muteforward = data[tostring(matches[2])]["mutes"]["mute_forward"]
   if not lang then
			text = 'Lock Forward : Kick'
   elseif lang then
			text = 'اخراج نقل قول فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_forward"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/muteforwardo' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local muteforward = data[tostring(matches[2])]["mutes"]["mute_forward"]
   if not lang then
			text = 'Lock Forward : Ok'
   elseif lang then
			text = 'اوکی نقل قول فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_forward"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutelocationd' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutelocation = data[tostring(matches[2])]["mutes"]["mute_location"]
   if not lang then
			text = 'Lock Location : Del'
   elseif lang then
			text = 'حذف موقعیت فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_location"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutelocationw' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutelocation = data[tostring(matches[2])]["mutes"]["mute_location"]
   if not lang then
			text = 'Lock Location : Warn'
   elseif lang then
			text = 'اخطار موقعیت فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_location"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutelocationb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutelocation = data[tostring(matches[2])]["mutes"]["mute_location"]
   if not lang then
			text = 'Lock Location : Ban'
   elseif lang then
			text = 'مسدود موقعیت فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_location"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutelocationk' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutelocation = data[tostring(matches[2])]["mutes"]["mute_location"]
   if not lang then
			text = 'Lock Location : Kick'
   elseif lang then
			text = 'اخراج موقعیت فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_location"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutelocationo' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutelocation = data[tostring(matches[2])]["mutes"]["mute_location"]
   if not lang then
			text = 'Lock Location : Ok'
   elseif lang then
			text = 'اوکی موقعیت فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_location"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutedocumentd' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutedocument = data[tostring(matches[2])]["mutes"]["mute_document"]
   if not lang then
			text = 'Lock Document : Del'
   elseif lang then
			text = 'حذف فایل فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_document"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutedocumentw' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutedocument = data[tostring(matches[2])]["mutes"]["mute_document"]
   if not lang then
			text = 'Lock Document : Warn'
   elseif lang then
			text = 'اخطار فایل فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_document"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutedocumentb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutedocument = data[tostring(matches[2])]["mutes"]["mute_document"]
   if not lang then
			text = 'Lock Document : Ban'
   elseif lang then
			text = 'مسدود فایل فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_document"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutedocumentk' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutedocument = data[tostring(matches[2])]["mutes"]["mute_document"]
   if not lang then
			text = 'Lock Document : Kick'
   elseif lang then
			text = 'اخراج فایل فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_document"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutedocumento' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutedocument = data[tostring(matches[2])]["mutes"]["mute_document"]
   if not lang then
			text = 'Lock Document : Ok'
   elseif lang then
			text = 'اوکی فایل فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_document"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutekeyboardd' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutekeyboard = data[tostring(matches[2])]["mutes"]["mute_keyboard"]
   if not lang then
			text = 'Lock Keyboard : Del'
   elseif lang then
			text = 'حذف کیبورد شیشه ای فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_keyboard"] = "yes"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutekeyboardw' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutekeyboard = data[tostring(matches[2])]["mutes"]["mute_keyboard"]
   if not lang then
			text = 'Lock Keyboard : Warn'
   elseif lang then
			text = 'اخطار کیبورد شیشه ای فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_keyboard"] = "warn"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutekeyboardb' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutekeyboard = data[tostring(matches[2])]["mutes"]["mute_keyboard"]
   if not lang then
			text = 'Lock Keyboard : Ban'
   elseif lang then
			text = 'مسدود کیبورد شیشه ای فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_keyboard"] = "ban"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutekeyboardk' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutekeyboard = data[tostring(matches[2])]["mutes"]["mute_keyboard"]
   if not lang then
			text = 'Lock Keyboard : Kick'
   elseif lang then
			text = 'اخراج کیبورد شیشه ای فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_keyboard"] = "kick"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutekeyboardo' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local mutekeyboard = data[tostring(matches[2])]["mutes"]["mute_keyboard"]
   if not lang then
			text = 'Lock Keyboard : Ok'
   elseif lang then
			text = 'اوکی کیبورد شیشه ای فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_keyboard"] = "no"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutetgservice' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_tgservice"]
		if chkmute == "no" then
    if not lang then
			text = 'TgService Has Been Muted'
    elseif lang then
        text = 'بیصدا کردن خدمات تلگرام فعال شد'
    end
            data[tostring(matches[2])]["mutes"]["mute_tgservice"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
    if not lang then
			text = 'TgService Has Been Unmuted'
    elseif lang then
        text = 'بیصدا کردن خدمات تلگرام غیر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_tgservice"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
          -- ####################### Settings normal ####################### --
if matches[1] == '/locklink' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local locklink = data[tostring(matches[2])]["settings"]["lock_link"]
		if locklink == "no" then
   if not lang then
			text = 'Link Has Been Locked'
   elseif lang then
			text = 'قفل لینک فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_link"] = "yes"
			save_data(_config.moderation.data, data)
		elseif locklink == "yes" then
   if not lang then
			text = 'Link Has Been Unlocked'
   elseif lang then
			text = 'قفل لینک غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_link"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockedit' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local lockedit = data[tostring(matches[2])]["settings"]["lock_edit"]
		if lockedit == "no" then
   if not lang then
			text = 'Edit Has Been Locked'
   elseif lang then
			text = 'قفل ویرایش فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_edit"] = "yes"
			save_data(_config.moderation.data, data)
		elseif lockedit == "yes" then
   if not lang then
			text = 'Edit Has Been Unlocked'
   elseif lang then
			text = 'قفل ویرایش غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_edit"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/locktags' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_tag"]
		if chklock == "no" then
   if not lang then
			text = 'Tags Has Been Locked'
   elseif lang then
			text = 'قفل تگ فعال شد'
    end
            data[tostring(matches[2])]["settings"]["lock_tag"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Tags Has Been Unlocked'
   elseif lang then
			text = 'قفل تگ غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_tag"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockusername' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_username"]
		if chklock == "no" then
   if not lang then
			text = 'UserName Has Been Locked'
   elseif lang then
			text = 'قفل نام کاربری فعال شد'
    end
            data[tostring(matches[2])]["settings"]["lock_username"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'UserName Has Been Unlocked'
   elseif lang then
			text = 'قفل نام کاربری غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_username"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockjoin' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_join"]
		if chklock == "no" then
   if not lang then
			text = 'Join Has Been Locked'
   elseif lang then
			text = 'قفل ورود فعال شد'
    end
            data[tostring(matches[2])]["settings"]["lock_join"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Join Has Been Unlocked'
   elseif lang then
			text = 'قفل ورود غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_join"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockmention' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_mention"]
		if chklock == "no" then
   if not lang then
			text = 'Mention Has Been Locked'
   elseif lang then
			text = 'قفل فراخوانی فعال شد'
    end
            data[tostring(matches[2])]["settings"]["lock_mention"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Mention Has Been Unlocked'
   elseif lang then
			text = 'قفل فراخوانی غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_mention"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockarabic' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_arabic"]
		if chklock == "no" then
   if not lang then
			text = 'Arabic Has Been Locked'
   elseif lang then
			text = 'قفل عربی فعال شد'
    end
            data[tostring(matches[2])]["settings"]["lock_arabic"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Arabic Has Been Unlocked'
   elseif lang then
			text = 'قفل عربی غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_arabic"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockenglish' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_english"]
		if chklock == "no" then
   if not lang then
			text = 'English Has Been Locked'
   elseif lang then
			text = 'قفل انگلیسی فعال شد'
    end
            data[tostring(matches[2])]["settings"]["lock_english"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'English Has Been Unlocked'
   elseif lang then
			text = 'قفل انگلیسی غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_english"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockwebpage' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_webpage"]
		if chklock == "no" then
   if not lang then
			text = 'Webpage Has Been Locked'
   elseif lang then
			text = 'قفل صفحات وب فعال شد'
    end
            data[tostring(matches[2])]["settings"]["lock_webpage"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Webpage Has Been Unlocked'
   elseif lang then
			text = 'قفل صفحات وب غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_webpage"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockmarkdown' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_markdown"]
		if chklock == "no" then
   if not lang then
			text = 'Markdown Has Been Locked'
   elseif lang then
			text = 'قفل فونت فعال شد'
    end
            data[tostring(matches[2])]["settings"]["lock_markdown"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Markdown Has Been Unlocked'
   elseif lang then
			text = 'قفل فونت غیر فعال شد'
    end
			data[tostring(matches[2])]["settings"]["lock_markdown"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
			-- ###################### Mute Normal ###################### --
			
if matches[1] == '/mutegif' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_gif"]
		if chkmute == "no" then
    if not lang then
			text = 'Gifs Has Been Muted'
    elseif lang then
        text = 'بیصدا کردن تصاویر متحرک فعال شد'
    end
            data[tostring(matches[2])]["mutes"]["mute_gif"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
    if not lang then
			text = 'Gifs Has Been Unmuted'
    elseif lang then
        text = 'بیصدا کردن تصاویر متحرک غیر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_gif"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutetext' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_text"]
		if chkmute == "no" then
    if not lang then
			text = 'Text Has Been Muted'
    elseif lang then
        text = 'بیصدا کردن متن فعال شد'
    end
            data[tostring(matches[2])]["mutes"]["mute_text"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
    if not lang then
			text = 'Text Has Been Unmuted'
    elseif lang then
        text = 'بیصدا کردن متن غیر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_text"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/muteinline' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_inline"]
		if chkmute == "no" then
    if not lang then
			text = 'Inline Has Been Muted'
    elseif lang then
        text = 'بیصدا کردن اینلاین فعال شد'
    end
            data[tostring(matches[2])]["mutes"]["mute_inline"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
    if not lang then
			text = 'Inline Has Been Unmuted'
    elseif lang then
        text = 'بیصدا کردن اینلاین غیر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_inline"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutegame' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_game"]
		if chkmute == "no" then
    if not lang then
			text = 'Game Has Been Muted'
    elseif lang then
        text = 'بیصدا کردن بازی فعال شد'
    end
            data[tostring(matches[2])]["mutes"]["mute_game"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
    if not lang then
			text = 'Game Has Been Unmuted'
    elseif lang then
        text = 'بیصدا کردن بازی غیر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_game"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutephoto' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_photo"]
		if chkmute == "no" then
    if not lang then
			text = 'Photo Has Been Muted'
    elseif lang then
        text = 'بیصدا کردن عکس فعال شد'
    end
            data[tostring(matches[2])]["mutes"]["mute_photo"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
    if not lang then
			text = 'Photo Has Been Unmuted'
    elseif lang then
        text = 'بیصدا کردن عکس غیر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_photo"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutevideo' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_video"]
		if chkmute == "no" then
    if not lang then
			text = 'Video Has Been Muted'
    elseif lang then
        text = 'بیصدا کردن فیلم فعال شد'
    end
            data[tostring(matches[2])]["mutes"]["mute_video"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
    if not lang then
			text = 'Video Has Been Unmuted'
    elseif lang then
        text = 'بیصدا کردن فیلم غیر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_video"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/muteaudio' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_audio"]
		if chkmute == "no" then
    if not lang then
			text = 'Audio Has Been Muted'
    elseif lang then
        text = 'بیصدا کردن آهنگ فعال شد'
    end
            data[tostring(matches[2])]["mutes"]["mute_audio"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
    if not lang then
			text = 'Audio Has Been Unmuted'
    elseif lang then
        text = 'بیصدا کردن آهنگ غیر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_audio"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutevoice' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_voice"]
		if chkmute == "no" then
    if not lang then
			text = 'Voice Has Been Muted'
    elseif lang then
        text = 'بیصدا کردن صدا فعال شد'
    end
            data[tostring(matches[2])]["mutes"]["mute_voice"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
    if not lang then
			text = 'Voice Has Been Unmuted'
    elseif lang then
        text = 'بیصدا کردن صدا غیر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_voice"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutesticker' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_sticker"]
		if chkmute == "no" then
    if not lang then
			text = 'Sticker Has Been Muted'
    elseif lang then
        text = 'بیصدا کردن استیکر فعال شد'
    end
            data[tostring(matches[2])]["mutes"]["mute_sticker"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
    if not lang then
			text = 'Sticker Has Been Unmuted'
    elseif lang then
        text = 'بیصدا کردن استیکر غیر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_sticker"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutecontact' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_contact"]
		if chkmute == "no" then
    if not lang then
			text = 'Contact Has Been Muted'
    elseif lang then
        text = 'بیصدا کردن مخاطب فعال شد'
    end
            data[tostring(matches[2])]["mutes"]["mute_contact"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
    if not lang then
			text = 'Contact Has Been Unmuted'
    elseif lang then
        text = 'بیصدا کردن مخاطب غیر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_contact"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/muteforward' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_forward"]
		if chkmute == "no" then
    if not lang then
			text = 'Forward Has Been Muted'
    elseif lang then
        text = 'بیصدا کردن نقل و قول فعال شد'
    end
            data[tostring(matches[2])]["mutes"]["mute_forward"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
    if not lang then
			text = 'Forward Has Been Unmuted'
    elseif lang then
        text = 'بیصدا کردن نقل و قول غیر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_forward"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutelocation' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_location"]
		if chkmute == "no" then
    if not lang then
			text = 'Location Has Been Muted'
    elseif lang then
        text = 'بیصدا کردن موقعیت فعال شد'
    end
            data[tostring(matches[2])]["mutes"]["mute_location"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
    if not lang then
			text = 'Location Has Been Unmuted'
    elseif lang then
        text = 'بیصدا کردن موقعیت غیر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_location"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutedocument' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_document"]
		if chkmute == "no" then
    if not lang then
			text = 'Document Has Been Muted'
    elseif lang then
        text = 'بیصدا کردن فایل فعال شد'
    end
            data[tostring(matches[2])]["mutes"]["mute_document"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
    if not lang then
			text = 'Document Has Been Unmuted'
    elseif lang then
        text = 'بیصدا کردن فایل غیر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_document"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutekeyboard' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید")
   end
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_keyboard"]
		if chkmute == "no" then
    if not lang then
			text = 'Keyboard Has Been Muted'
    elseif lang then
        text = 'بیصدا کردن کیبورد شیشه ای فعال شد'
    end
            data[tostring(matches[2])]["mutes"]["mute_keyboard"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
    if not lang then
			text = 'Keyboard Has Been uted'
    elseif lang then
        text = 'بیصدا کردن کیبورد شیشه ای غیر فعال شد'
    end
			data[tostring(matches[2])]["mutes"]["mute_keyboard"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
            -- ####################### More #######################--
			
if matches[1] == '/more' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
    if not lang then
		text = '`Welcome To` *More Option* 🤖'
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> OωηєяLιѕт 👥", callback_data="/ownerlist:"..matches[2]},
				{text = "> Mσ∂Lιѕт 👮🏻", callback_data="/modlist:"..matches[2]}
			},
			{
				{text = "> SιℓℓєηтLιѕт 🚷", callback_data="/silentlist:"..matches[2]},
				{text = "> ƑιℓтєяLιѕт 📝", callback_data="/filterlist:"..matches[2]}
			},
			{
				{text = "> ƁαηLιѕт 🚫", callback_data="/bans:"..matches[2]},
				{text = "> ƜнιтєLιѕт 🛡", callback_data="/whitelists:"..matches[2]}
        },
			{
				{text = "> Ɠяσυρ Lιηк 🏷", callback_data="/link:"..matches[2]},
				{text = "> Ɠяσυρ Rυℓєѕ 🔮", callback_data="/rules:"..matches[2]}
			},
			{
				{text = "> Sнσω Ɯєℓcσмє 🔖", callback_data="/showwlc:"..matches[2]},
			},
			{ 
				{text = "> Ɓαcк 🔙", callback_data="/option:"..matches[2]}
			}
		}
   elseif lang then
        text = '*به ادامه تنظیمات کلی خوشآمدید* 🤖'
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> لیست مالکین 👥", callback_data="/ownerlist:"..matches[2]},
				{text = "> لیست مدیران 👮🏻", callback_data="/modlist:"..matches[2]}
			},
			{
				{text = "> لیست سایلنت 🚷", callback_data="/silentlist:"..matches[2]},
				{text = "> لیست فیلتر 📝", callback_data="/filterlist:"..matches[2]}
			},
			{
				{text = "> لیست بن 🚫", callback_data="/bans:"..matches[2]},
				{text = "> لیست سفید 🛡", callback_data="/whitelists:"..matches[2]}
        },
			{
				{text = "> لینک گروه 🏷", callback_data="/link:"..matches[2]},
				{text = "> قوانین گروه 🔮", callback_data="/rules:"..matches[2]}
			},
			{
				{text = "> پیام خوشامد 🔖", callback_data="/showwlc:"..matches[2]},
			},
			{ 
				{text = "> بازگشت 🔙", callback_data="/option:"..matches[2]}
			}
		}
  end
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/ownerlist' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local i = 1
		if next(data[tostring(matches[2])]['owners']) == nil then --fix way
     if not lang then
			text = "_No_ *owner* _in this group_"
   elseif lang then
			text = "_هیچ مالکی برای گروه تعیین نشده_"
   end
		else
     if not lang then
			text = "*List Of Group Owners :*\n"
   elseif lang then
			text = "_لیست مالکین گروه :_\n"
   end
			for k,v in pairs(data[tostring(matches[2])]['owners']) do
				text = text ..i.. '- '..v..' [' ..k.. '] \n'
				i = i + 1
			end
		end
     if not lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Demote All Owners", callback_data="/cleanowners:"..matches[2]}
			},
			{ 
				{text = "> Ɓαcк 🔙", callback_data="/more:"..matches[2]}
			}
		}
   elseif lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> برکناری تمام مالکین", callback_data="/cleanowners:"..matches[2]}
			},
			{ 
				{text = "> بازگشت 🔙", callback_data="/more:"..matches[2]}
			}
		}
  end
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/cleanowners' then
	if not is_admin1(msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Bot Admin")
   elseif lang then
		get_alert(msg.cb_id, "شما ادمین ربات نیستید")
   end
	else
		if next(data[tostring(matches[2])]['owners']) == nil then
     if not lang then
			text = "_No_ *owner* _in this group_"
   elseif lang then
			text = "_هیچ مالکی برای گروه تعیین نشده_"
   end
		else
     if not lang then
			text = "_All_ *Group Owners* _Has Been_ *Demoted*"
   elseif lang then
			text = "_تمام مالکین از مقام خود برکنار شدند_"
   end
			for k,v in pairs(data[tostring(matches[2])]['owners']) do
				data[tostring(matches[2])]['owners'][tostring(k)] = nil
				save_data(_config.moderation.data, data)
			end
		end
    if not lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Ɓαcк 🔙", callback_data="/ownerlist:"..matches[2]}
			}
		}
   elseif lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> بازگشت 🔙", callback_data="/ownerlist:"..matches[2]}
			}
		}
   end
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/filterlist' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		if next(data[tostring(matches[2])]['filterlist']) == nil then --fix way
   if not lang then
			text = "*Filter List* _Is Empty_"
     elseif lang then
			text = "_لیست کلمات فیلتر شده خالی است_"
     end
		else 
			local i = 1
   if not lang then
			text = '*List Of Filtered Words List :*\n'
     elseif lang then
			text = '_لیست کلمات فیلتر شده :_\n'
    end
			for k,v in pairs(data[tostring(matches[2])]['filterlist']) do
				text = text..''..i..' - '..check_markdown(k)..'\n'
				i = i + 1
			end
		end
    if not lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Clean", callback_data="/cleanfilterlist:"..matches[2]}
			},
			{ 
				{text = "> Ɓαcк 🔙", callback_data="/more:"..matches[2]}
			}
		}
   elseif lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> پاک کردن", callback_data="/cleanfilterlist:"..matches[2]}
			},
			{ 
				{text = "> بازگشت 🔙", callback_data="/more:"..matches[2]}
			}
		}
  end
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/cleanfilterlist' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		if next(data[tostring(matches[2])]['filterlist']) == nil then
   if not lang then
			text = "*Filter List* _Is Empty_"
     elseif lang then
			text = "_لیست کلمات فیلتر شده خالی است_"
     end
		else
   if not lang then
			text = "*Filter List* _Has Been_ *Cleaned*"
     elseif lang then
			text = "_لیست کلمات فیلتر پاک شد_"
     end
			for k,v in pairs(data[tostring(matches[2])]['filterlist']) do
				data[tostring(matches[2])]['filterlist'][tostring(k)] = nil
				save_data(_config.moderation.data, data)
			end
		end
   if not lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Ɓαcк 🔙", callback_data="/filterlist:"..matches[2]}
			}
		}
     elseif lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> بازگشت 🔙", callback_data="/filterlist:"..matches[2]}
			}
		}
  end
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/modlist' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local i = 1
		if next(data[tostring(matches[2])]['mods']) == nil then --fix way
     if not lang then
			text = "_No_ *moderator* _in this group_"
   elseif lang then
			text = "_هیچ مدیری برای گروه تعیین نشده_"
   end
		else
     if not lang then
			text = "*List Of Moderators :*\n"
   elseif lang then
			text = "_لیست مدیران گروه :_\n"
   end
			for k,v in pairs(data[tostring(matches[2])]['mods']) do
				text = text ..i.. '- '..v..' [' ..k.. '] \n'
				i = i + 1
			end
		end
     if not lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Demote All Moderators", callback_data="/cleanmods:"..matches[2]}
			},
			{ 
				{text = "> Ɓαcк 🔙", callback_data="/more:"..matches[2]}
			}
		}
   elseif lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> برکناری تمام مدیران", callback_data="/cleanmods:"..matches[2]}
			},
			{ 
				{text = "> بازگشت 🔙", callback_data="/more:"..matches[2]}
			}
		}
  end
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/cleanmods' then
	if not is_owner1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Group Owner")
   elseif lang then
		get_alert(msg.cb_id, "شما صاحب گروه نیستید")
   end
	else
		if next(data[tostring(matches[2])]['mods']) == nil then
     if not lang then
			text = "_No_ *moderator* _in this group_"
   elseif lang then
			text = "_هیچ مدیری برای گروه تعیین نشده_"
   end
		else
     if not lang then
			text = "_All_ *Moderators* _Has Been_ *Demoted*"
   elseif lang then
			text = "_تمام مدیران از مقام خود برکنار شدند_"
   end
			for k,v in pairs(data[tostring(matches[2])]['mods']) do
				data[tostring(matches[2])]['mods'][tostring(k)] = nil
				save_data(_config.moderation.data, data)
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Ɓαcк 🔙", callback_data="/modlist:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/bans' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local i = 1
		if next(data[tostring(matches[2])]['banned']) == nil then --fix way
     if not lang then
			text = "_No_ *banned users* _in this group_"
   elseif lang then
			text = "_هیچ فردی از این گروه محروم نشده_"
   end
		else
     if not lang then
			text = "*List Of Banned Users :*\n"
   elseif lang then
			text = "_لیست افراد محروم شده از گروه :_\n"
   end
			for k,v in pairs(data[tostring(matches[2])]['banned']) do
				text = text ..i.. '- '..v..' [' ..k.. '] \n'
				i = i + 1
			end
		end
   if not lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Unban All Banned Users", callback_data="/cleanbans:"..matches[2]}
			},
			{ 
				{text = "> Ɓαcк 🔙", callback_data="/more:"..matches[2]}
			}
		}
  elseif lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> پاک کردن لیست بن ", callback_data="/cleanbans:"..matches[2]}
			},
			{ 
				{text = "> بازگشت 🔙", callback_data="/more:"..matches[2]}
			}
		}
  end
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/silentlist' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local i = 1
		if next(data[tostring(matches[2])]['is_silent_users']) == nil then --fix way
     if not lang then
			text = "_No_ *silent users* _in this group_"
   elseif lang then
			text = "_هیچ فردی در این گروه سایلنت نشده_"
   end
		else
     if not lang then
			text = "*List Of Silent Users :*\n"
   elseif lang then
			text = "_لیست افراد سایلنت شده :_\n"
   end
			for k,v in pairs(data[tostring(matches[2])]['is_silent_users']) do
				text = text ..i.. '- '..v..' [' ..k.. '] \n'
				i = i + 1
			end
		end
  if not lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Unsilent All Silent Users", callback_data="/cleansilentlist:"..matches[2]}
			},
			{ 
				{text = "> Ɓαcк 🔙", callback_data="/more:"..matches[2]}
			}
		}
  elseif lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> پاک کردن لیست سایلنت", callback_data="/cleansilentlist:"..matches[2]}
			},
			{ 
				{text = "> بازگشت 🔙", callback_data="/more:"..matches[2]}
			}
		}
  end
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/cleansilentlist' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		if next(data[tostring(matches[2])]['is_silent_users']) == nil then
     if not lang then
			text = "_No_ *silent users* _in this group_"
   elseif lang then
			text = "_هیچ فردی در این گروه سایلنت نشده"
   end
		else
     if not lang then
			text = "_All_ *Silent Users* _Has Been_ *Unsilent*"
   elseif lang then
			text = "_تمام افراد سایلنت شده از سایلنت خارج شدند_"
   end
			for k,v in pairs(data[tostring(matches[2])]['is_silent_users']) do
				data[tostring(matches[2])]['is_silent_users'][tostring(k)] = nil
				save_data(_config.moderation.data, data)
			end
		end
  if not lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Ɓαcк 🔙", callback_data="/silentlist:"..matches[2]}
			}
		}
  elseif lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> بازگشت 🔙", callback_data="/silentlist:"..matches[2]}
			}
		}
  end
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/cleanbans' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		if next(data[tostring(matches[2])]['banned']) == nil then
     if not lang then
			text = "_No_ *banned users* _in this group_"
   elseif lang then
			text = "_هیچ فردی از این گروه محروم نشده"
   end
		else
     if not lang then
			text = "_All_ *Banned Users* _Has Been_ *Unbanned*"
   elseif lang then
			text = "_تمام افراد محروم شده از محرومیت این گروه خارج شدند_"
   end
			for k,v in pairs(data[tostring(matches[2])]['banned']) do
				data[tostring(matches[2])]['banned'][tostring(k)] = nil
				save_data(_config.moderation.data, data)
			end
		end
  if not lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Ɓαcк 🔙", callback_data="/bans:"..matches[2]}
			}
		}
  elseif lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> بازگشت 🔙", callback_data="/bans:"..matches[2]}
			}
		}
  end
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/link' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local linkgp = data[tostring(matches[2])]['settings']['linkgp']
		if not linkgp then
   if not lang then
			text = "_First set a_ *link* _for group with using_ /setlink"
    elseif lang then
			text = "_ابتدا با دستور_ setlink/ _لینک جدیدی برای گروه تعیین کنید_"
  end
		else
   if not lang then
			text = "[Group Link Is Here]("..linkgp..")"
    elseif lang then
			text = "[لینک گروه اینجاست]("..linkgp..")"
        end
		end
  if not lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Ɓαcк 🔙", callback_data="/more:"..matches[2]}
			}
		}
  elseif lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> بازگشت 🔙", callback_data="/more:"..matches[2]}
			}
		}
  end
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/rules' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local rules = data[tostring(matches[2])]['rules']
		if not rules then
   if not lang then
     text = "ℹ️ The Default Rules :\n1⃣ No Flood.\n2⃣ No Spam.\n3⃣ No Advertising.\n4⃣ Try to stay on topic.\n5⃣ Forbidden any racist, sexual, homophobic or gore content.\n➡️ Repeated failure to comply with these rules will cause ban.\n@MaTaDoRTeaM"
    elseif lang then
       text = "ℹ️ قوانین پپیشفرض:\n1⃣ ارسال پیام مکرر ممنوع.\n2⃣ اسپم ممنوع.\n3⃣ تبلیغ ممنوع.\n4⃣ سعی کنید از موضوع خارج نشید.\n5⃣ هرنوع نژاد پرستی, شاخ بازی و پورنوگرافی ممنوع .\n➡️ از قوانین پیروی کنید, در صورت عدم رعایت قوانین اول اخطار و در صورت تکرار مسدود.\n@MaTaDoRTeaM"
 end
		elseif rules then
     if not lang then
			text = '*Group Rules :*\n'..rules
   elseif lang then
			text = '_قوانین گروه :_\n'..rules
       end
		end
   if not lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Clean", callback_data="/cleanrules:"..matches[2]}
			},
			{ 
				{text = "> Ɓαcк 🔙", callback_data="/more:"..matches[2]}
			}
		}
  elseif lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> پاک کردن", callback_data="/cleanrules:"..matches[2]}
			},
			{ 
				{text = "> بازگشت 🔙", callback_data="/more:"..matches[2]}
			}
		}
  end
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/cleanrules' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local rules = data[tostring(matches[2])]['rules']
		if not rules then
    if not lang then
			text = "`No Rules Available`"
   elseif lang then
			text = "_قوانین گروه ثبت نشده_"
   end
		else
    if not lang then
			text = "*Group Rules* _Has Been_ *Cleaned*"
   elseif lang then
			text = "_قوانین گروه پاک شد_"
  end
			data[tostring(matches[2])]['rules'] = nil
			save_data(_config.moderation.data, data)
		end
  if not lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Ɓαcк 🔙", callback_data="/rules:"..matches[2]}
			}
		}
  elseif lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> بازگشت 🔙", callback_data="/rules:"..matches[2]}
			}
		}
  end
		edit_inline(msg.message_id, text, keyboard)
	end
end
		if matches[1] == '/whitelists' then
			if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		if next(data[tostring(matches[2])]['whitelist']) == nil then
			if not lang then
				text = "_White List is Empty._"
			else
				text = "_لیست سفید خالی می باشد._"
			end
		else 
			local i = 1
			if not lang then
				text = '_> White List:_ \n'
			else
				text = '_> لیست سفید:_ \n'
			end
			for k,v in pairs(data[tostring(matches[2])]['whitelist']) do
				text = text..''..i..' - '..check_markdown(v)..' ' ..k.. ' \n'
				i = i + 1
			end
		end
		local keyboard = {}
		if not lang then
		keyboard.inline_keyboard = {
			{
				{text = "> Clean White List", callback_data="/cleanwhitelists:"..matches[2]}
			},
			{ 
				{text = "> Ɓαcк 🔙", callback_data="/more:"..matches[2]}
			}
		}
		else
		keyboard.inline_keyboard = {
			{
				{text = "> حذف لیست سفید", callback_data="/cleanwhitelists:"..matches[2]}
			},
			{ 
				{text = "> بازگشت 🔙", callback_data="/more:"..matches[2]}
			}
		}
		end
		edit_inline(msg.message_id, text, keyboard)
end
end

if matches[1] == '/cleanwhitelists' then
			if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		if next(data[tostring(matches[2])]['whitelist']) == nil then
			if not lang then
				text = "_White List is Empty._"
			else
				text = "_لیست سفید خالی می باشد._"
			end
		else
			if not lang then
				text = "_White List Was Cleared._"
			else
				text = "_لیست سفید حذف شد._"
			end
			for k,v in pairs(data[tostring(matches[2])]['whitelist']) do
				data[tostring(matches[2])]['whitelist'][tostring(k)] = nil
				save_data(_config.moderation.data, data)
			end
		end
		local keyboard = {} 
		if not lang then
		keyboard.inline_keyboard = {

			{ 
				{text = "> Ɓαcк 🔙", callback_data="/more:"..matches[2]}
			}
		}
		else
				keyboard.inline_keyboard = {

			{ 
				{text = "> بازگشت 🔙", callback_data="/more:"..matches[2]}
			}
		}
		end
		edit_inline(msg.message_id, text, keyboard)
		end
end
if matches[1] == '/showwlc' then
local text = ''
if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
		local wlc = data[tostring(matches[2])]['setwelcome']
		if not wlc then
		if not lang then
				text = "_Welcome Message Not Set._\n*Default Message :* _Welcome Dude_"
			else
				text = "_پیام خوشامد تنظیم نشده است._"
			end
		else
		if not lang then
			text = '_Welcome Message:_\n'..wlc
		else
			text = '_پیام خوشامد:_\n'..wlc
		end
		end
		local keyboard = {} 
		if not lang then
		keyboard.inline_keyboard = {
			{ 
				{text = "> Clean Welcome Message", callback_data="/cleanwlcmsg:"..matches[2]}
			},
			{ 
				{text = "> Ɓαcк 🔙", callback_data="/more:"..matches[2]}
			}
		}
		else
		keyboard.inline_keyboard = {
			{ 
				{text = "> حذف پیام خوشامد", callback_data="/cleanwlcmsg:"..matches[2]}
			},
			{ 
				{text = "> بازگشت 🔙", callback_data="/more:"..matches[2]}
			}
		}
		end
		edit_inline(msg.message_id, text, keyboard)
end
end
if matches[1] == '/cleanwlcmsg' then
local text = ''
if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
local wlc = data[tostring(matches[2])]['setwelcome']
		if not wlc then
		if not lang then
				text = "_Welcome Message Not Set._"
			else
				text = "_پیام خوشامد تنظیم نشده است._"
			end
		else
		if not lang then
			text = '_Welcome Message Was Cleaned._'
		else
			text = '_پیام خوشامد حذف شد._'
		end
		data[tostring(matches[2])]['setwelcome'] = nil
		save_data(_config.moderation.data, data)
end
local keyboard = {} 
		if not lang then
		keyboard.inline_keyboard = {

			{ 
				{text = "> Ɓαcк 🔙", callback_data="/more:"..matches[2]}
			}
		}
		else
				keyboard.inline_keyboard = {

			{ 
				{text = "> بازگشت 🔙", callback_data="/more:"..matches[2]}
			}
		}
		end
		edit_inline(msg.message_id, text, keyboard)
end
end
         -- ####################### About Us ####################### --
if matches[1] == '/matador' then
	local text = _config.info_text
    if not lang then
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> MahDiRoO", callback_data="/mahdiroo:"..matches[2]}
		},
		{
			{text = '> Our GitHub ', url = 'https://www.github.com/MRMahDiRoO'}
		},
		{
			{text= '> Ɓαcк 🔙' ,callback_data = '/option:'..matches[2]}
		}				
	}
   elseif lang then
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> مهدی", callback_data="/mahdiroo:"..matches[2]}
		},
		{
			{text = '> گیت هاب تیم ', url = 'https://www.github.com/MRMahDiRoO'}
		},
		{
			{text= '> بازگشت 🔙' ,callback_data = '/option:'..matches[2]}
		}				
	}
   end
    edit_inline(msg.message_id, text, keyboard)
end

if matches[1] == '/mahdiroo' then
local text = [[
*》MahDiRoO Information《*
_》Age :_ *18*
_》Name :_ *MahDi Mohseni*
_》City :_ *Malayer - Hamedan*
*-------------------------*
*》GitHub :《*
》[SoLiD021](Github.Com/mahdiroo)
*-------------------------*
*》Bridges :《*
_》Pv : _[MahDiRoO](Telegram.Me/mahdiroo)
_》PvResan : _[MahDiRoO Pv](Telegram.Me/mahdiroo_Bot)
*-------------------------*
*》Expertise :《*
_》_*Lua*, *Cli* `and` *Api* _Bots_
*-------------------------*
]]
  if not lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Ɓαcк 🔙", callback_data="/matador:"..matches[2]}
			}
		}
  elseif lang then
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> بازگشت 🔙", callback_data="/matador:"..matches[2]}
			}
		}
  end
    edit_inline(msg.message_id, text, keyboard)
end
if matches[1] == '/exit' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "Ƴσυ Aяє Ɲσт Mσ∂єяαтσя 🤖🚷")
   elseif lang then
		get_alert(msg.cb_id, "شما مدیر نیستید 🤖🚷")
   end
	else
    if not lang then
		 text = '*Ɗσηє*\n`Ɠяσυρ Oρтιση Ƈℓσѕє∂` ✅\n"Cmd En"'
   elseif lang then
		 text = '*انجام شد*\n`منو شیشه ای بسته شد` ✅\n"دستورات فارسی"'
   end
		edit_inline(msg.message_id, text)
	end
end

end
--------------End Inline Query---------------
end

local function pre_process(msg)
-- print(serpent.block(msg), {comment=false})
--leave_group(msg.chat.id)
end

return {
	patterns ={
		"^-(%d+)$",
		"^(Help)$",
		"^###cb:(%d+)$",
		"^[/](sudolist)$",
		"^[/](setsudo)$",
		"^[/](remsudo)$",
		"^[/](setsudo) (%d+)$",
		"^[/](remsudo) (%d+)$",
		"^[!/#]plist$",
        "^[!/#](pl) (+) ([%w_%.%-]+)$",
        "^[!/#](pl) (-) ([%w_%.%-]+)$",
        "^[!/#](pl) (+) ([%w_%.%-]+) (chat)",
        "^[!/#](pl) (-) ([%w_%.%-]+) (chat)",
        "^!pl? (*)$",
        "^[!/](reload)$",
		"^###cb:(/nerkh):(.*)$",
		"^###cb:(/helpp):(.*)$",
		"^###cb:(/help1):(.*)$",
		"^###cb:(/help2):(.*)$",
		"^###cb:(/help3):(.*)$",
		"^###cb:(/help3a):(.*)$",
		"^###cb:(/help4):(.*)$",
		"^###cb:(/help4p):(.*)$",
		"^###cb:(/help4n):(.*)$",
		"^###cb:(/help4a):(.*)$",
		"^###cb:(/help4b):(.*)$",
		"^###cb:(/help5):(.*)$",
		"^###cb:(/help6):(.*)$",
		"^###cb:(/persianh):(.*)$",
		"^###cb:(/englishh):(.*)$",
		"^###cb:(/option):(.*)$",
		"^###cb:(/lang):(.*)$",
		"^###cb:(/persian):(.*)$",
		"^###cb:(/english):(.*)$",
		"^###cb:(/settingsp):(.*)$",
		"^###cb:(/mutelistp):(.*)$",
		"^###cb:(/settings):(.*)$",
		"^###cb:(/mutelist):(.*)$",
		"^###cb:(/lockusernamek):(.*)$",
		"^###cb:(/lockusernameb):(.*)$",
		"^###cb:(/lockusernamew):(.*)$",
		"^###cb:(/lockusernamed):(.*)$",
		"^###cb:(/lockusernameo):(.*)$",
		"^###cb:(/lockenglishk):(.*)$",
		"^###cb:(/lockenglishw):(.*)$",
		"^###cb:(/lockenglishd):(.*)$",
		"^###cb:(/lockenglishb):(.*)$",
		"^###cb:(/lockenglisho):(.*)$",
		"^###cb:(/locklink):(.*)$",
		"^###cb:(/lockeditd):(.*)$",
		"^###cb:(/lockeditb):(.*)$",
		"^###cb:(/lockedit):(.*)$",
		"^###cb:(/lockeditw):(.*)$",
		"^###cb:(/lockeditk):(.*)$",
		"^###cb:(/lockedito):(.*)$",
		"^###cb:(/locktags):(.*)$",
		"^###cb:(/lockjoin):(.*)$",
		"^###cb:(/lockpin):(.*)$",
		"^###cb:(/lockjoinn):(.*)$",
		"^###cb:(/lockpinn):(.*)$",
		"^###cb:(/lockmarkdown):(.*)$",
		"^###cb:(/lockmention):(.*)$",
		"^###cb:(/lockarabic):(.*)$",
		"^###cb:(/lockwebpage):(.*)$",
		"^###cb:(/lockbots):(.*)$",
		"^###cb:(/lockspam):(.*)$",
		"^###cb:(/lockflood):(.*)$",
		"^###cb:(/lockbotsn):(.*)$",
		"^###cb:(/lockspamn):(.*)$",
		"^###cb:(/lockfloodn):(.*)$",
		"^###cb:(/welcome):(.*)$",
		"^###cb:(/muteall):(.*)$",
		"^###cb:(/mutegif):(.*)$",
		"^###cb:(/mutegame):(.*)$",
		"^###cb:(/mutevideo):(.*)$",
		"^###cb:(/mutevoice):(.*)$",
		"^###cb:(/muteinline):(.*)$",
		"^###cb:(/mutesticker):(.*)$",
		"^###cb:(/mutelocation):(.*)$",
		"^###cb:(/mutedocument):(.*)$",
		"^###cb:(/muteaudio):(.*)$",
		"^###cb:(/mutephoto):(.*)$",
		"^###cb:(/mutetext):(.*)$",
		"^###cb:(/mutetgservice):(.*)$",
		"^###cb:(/mutekeyboard):(.*)$",
		"^###cb:(/mutecontact):(.*)$",
		"^###cb:(/muteforward):(.*)$",
		"^###cb:(/locklinkb):(.*)$",
		"^###cb:(/locktagsb):(.*)$",
		"^###cb:(/lockmarkdownb):(.*)$",
		"^###cb:(/lockmentionb):(.*)$",
		"^###cb:(/lockarabicb):(.*)$",
		"^###cb:(/lockwebpageb):(.*)$",
		"^###cb:(/mutegifb):(.*)$",
		"^###cb:(/mutegameb):(.*)$",
		"^###cb:(/mutevideob):(.*)$",
		"^###cb:(/mutevoiceb):(.*)$",
		"^###cb:(/muteinlineb):(.*)$",
		"^###cb:(/mutestickerb):(.*)$",
		"^###cb:(/mutelocationb):(.*)$",
		"^###cb:(/mutedocumentb):(.*)$",
		"^###cb:(/muteaudiob):(.*)$",
		"^###cb:(/mutephotob):(.*)$",
		"^###cb:(/mutetextb):(.*)$",
		"^###cb:(/mutekeyboardb):(.*)$",
		"^###cb:(/mutecontactb):(.*)$",
		"^###cb:(/muteforwardb):(.*)$",
		"^###cb:(/locklinkk):(.*)$",
		"^###cb:(/locktagsk):(.*)$",
		"^###cb:(/lockmarkdownk):(.*)$",
		"^###cb:(/lockmentionk):(.*)$",
		"^###cb:(/lockarabick):(.*)$",
		"^###cb:(/lockwebpagek):(.*)$",
		"^###cb:(/mutegifk):(.*)$",
		"^###cb:(/mutegamek):(.*)$",
		"^###cb:(/mutevideok):(.*)$",
		"^###cb:(/mutevoicek):(.*)$",
		"^###cb:(/muteinlinek):(.*)$",
		"^###cb:(/mutestickerk):(.*)$",
		"^###cb:(/mutelocationk):(.*)$",
		"^###cb:(/mutedocumentk):(.*)$",
		"^###cb:(/muteaudiok):(.*)$",
		"^###cb:(/mutephotok):(.*)$",
		"^###cb:(/mutetextk):(.*)$",
		"^###cb:(/mutekeyboardk):(.*)$",
		"^###cb:(/mutecontactk):(.*)$",
		"^###cb:(/muteforwardk):(.*)$",
		"^###cb:(/locklinkw):(.*)$",
		"^###cb:(/locktagsw):(.*)$",
		"^###cb:(/lockmarkdownw):(.*)$",
		"^###cb:(/lockmentionw):(.*)$",
		"^###cb:(/lockarabicw):(.*)$",
		"^###cb:(/lockwebpagew):(.*)$",
		"^###cb:(/mutegifw):(.*)$",
		"^###cb:(/mutegamew):(.*)$",
		"^###cb:(/mutevideow):(.*)$",
		"^###cb:(/mutevoicew):(.*)$",
		"^###cb:(/muteinlinew):(.*)$",
		"^###cb:(/mutestickerw):(.*)$",
		"^###cb:(/mutelocationw):(.*)$",
		"^###cb:(/mutedocumentw):(.*)$",
		"^###cb:(/muteaudiow):(.*)$",
		"^###cb:(/mutephotow):(.*)$",
		"^###cb:(/mutetextw):(.*)$",
		"^###cb:(/mutekeyboardw):(.*)$",
		"^###cb:(/mutecontactw):(.*)$",
		"^###cb:(/muteforwardw):(.*)$",
		"^###cb:(/locklinkd):(.*)$",
		"^###cb:(/locktagsd):(.*)$",
		"^###cb:(/lockmarkdownd):(.*)$",
		"^###cb:(/lockmentiond):(.*)$",
		"^###cb:(/lockarabicd):(.*)$",
		"^###cb:(/lockwebpaged):(.*)$",
		"^###cb:(/mutegifd):(.*)$",
		"^###cb:(/mutegamed):(.*)$",
		"^###cb:(/mutevideod):(.*)$",
		"^###cb:(/mutevoiced):(.*)$",
		"^###cb:(/muteinlined):(.*)$",
		"^###cb:(/mutestickerd):(.*)$",
		"^###cb:(/mutelocationd):(.*)$",
		"^###cb:(/mutedocumentd):(.*)$",
		"^###cb:(/muteaudiod):(.*)$",
		"^###cb:(/mutephotod):(.*)$",
		"^###cb:(/mutetextd):(.*)$",
		"^###cb:(/mutekeyboardd):(.*)$",
		"^###cb:(/mutecontactd):(.*)$",
		"^###cb:(/muteforwardd):(.*)$",
		"^###cb:(/locklinko):(.*)$",
		"^###cb:(/locktagso):(.*)$",
		"^###cb:(/lockmarkdowno):(.*)$",
		"^###cb:(/lockmentiono):(.*)$",
		"^###cb:(/lockarabico):(.*)$",
		"^###cb:(/lockwebpageo):(.*)$",
		"^###cb:(/mutegifo):(.*)$",
		"^###cb:(/mutegameo):(.*)$",
		"^###cb:(/mutevideoo):(.*)$",
		"^###cb:(/mutevoiceo):(.*)$",
		"^###cb:(/muteinlineo):(.*)$",
		"^###cb:(/mutestickero):(.*)$",
		"^###cb:(/mutelocationo):(.*)$",
		"^###cb:(/mutedocumento):(.*)$",
		"^###cb:(/muteaudioo):(.*)$",
		"^###cb:(/mutephotoo):(.*)$",
		"^###cb:(/mutetexto):(.*)$",
		"^###cb:(/mutekeyboardo):(.*)$",
		"^###cb:(/mutecontacto):(.*)$",
		"^###cb:(/muteforwardo):(.*)$",
		"^###cb:(/setflood):(.*)$",
		"^###cb:(/floodup):(.*)$",
		"^###cb:(/flooddown):(.*)$",
		"^###cb:(/charup):(.*)$",
		"^###cb:(/chardown):(.*)$",
		"^###cb:(/floodtimeup):(.*)$",
		"^###cb:(/floodtimedown):(.*)$",
		"^###cb:(/moresettings):(.*)$",
		"^###cb:(/more):(.*)$",
		"^###cb:(/ownerlist):(.*)$",
		"^###cb:(/cleanowners):(.*)$",
		"^###cb:(/modlist):(.*)$",
		"^###cb:(/cleanmods):(.*)$",
		"^###cb:(/bans):(.*)$",
		"^###cb:(/matador):(.*)$",
		"^###cb:(/cleanbans):(.*)$",
		"^###cb:(/filterlist):(.*)$",
		"^###cb:(/cleanfilterlist):(.*)$",
		"^###cb:(/whitelist):(.*)$",
		"^###cb:(/cleanwhitelist):(.*)$",
		"^###cb:(/silentlist):(.*)$",
		"^###cb:(/mahdiroo):(.*)$",
		"^###cb:(/cleansilentlist):(.*)$",
		"^###cb:(/link):(.*)$",
		"^###cb:(/rules):(.*)$",
		"^###cb:(/cleanrules):(.*)$",
		"^###cb:(/exit):(.*)$",
		"^###cb:(/whitelists):(.*)$",
		"^###cb:(/cleanwhitelists):(.*)$",
		"^###cb:(/showwlc):(.*)$",
		"^###cb:(/cleanwlcmsg):(.*)$",

	},
	run=run,
	pre_process=pre_process
}
