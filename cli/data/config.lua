do local _ = {
  admins = {},
  disabled_channels = {},
  enabled_plugins = {
    "MRCore"
  },
  info_text = "》MaTaDoR Cli v7.2\nAn advanced administration bot based on https://valtman.name/telegram-cli\n\n》https://github.com/MaTaDoRTeaM/MaTaDoR\n\n》Admins :\n》@MahDiRoO ➣ Founder & Developer《\n\n》Special thanks to :\n》@Solidev\n\n》Our channel :\n》@MaTaDoRTeaM《\n",
  moderation = {
    data = "./data/moderation.json"
  },
  sudo_users = {
    sudouserid,
    useridapihelper
  }
}
return _
end