require_relative 'request'
require_relative 'components'

photos = request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=Kee6du35ozDbCfEt7H3nan2U7Zlptps3eL1yyHlz')

File.write('./index.html', template(photos))