Geocoder.configure(
  lookup: :google,

  # IP address geocoding service (default :ipinfo_io)
  ip_lookup: :maxmind,
  
  # to use an API key:
  api_key: "AIzaSyDQ_XDH5KeIvNnllI_k0hoiehctXrz7M-w",

  # geocoding service request timeout, in seconds (default 3):
  timeout: 5,

  # set default units to kilometers:
  units: :km
)