Geocoder.configure(
  lookup: :google,

  # IP address geocoding service (default :ipinfo_io)
  ip_lookup: :maxmind,
  
  # to use an API key:
  api_key: "AIzaSyDQVCnjxXu6rQ_6IGIiXflj4XD3LTes8Jw",
  :use_https => true,
  # geocoding service request timeout, in seconds (default 3):
  timeout: 5,

  # set default units to kilometers:
  units: :km
)