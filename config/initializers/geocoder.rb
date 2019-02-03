Geocoder.configure(
  lookup: :google,

  # IP address geocoding service (default :ipinfo_io)
  ip_lookup: :maxmind,
  
  # to use an API key:
  api_key: "AIzaSyCU9DDAnQryabSkK_satFrGNxt2HVIGYPw",

  # geocoding service request timeout, in seconds (default 3):
  timeout: 5,

  # set default units to kilometers:
  units: :km
)