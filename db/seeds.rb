require "open-uri"

puts "Cleanig DB"
WalkLandmark.destroy_all
Walk.destroy_all
Landmark.destroy_all
User.destroy_all

puts "Creating Walks and Users"

user1 = User.new
user1.username = 'SallyS'
# user1.last_name = 'Secret'
user1.email = 'Sally.Secret@walkingstick.com'
user1.password = '123456'
# user1.password_confirmation = '123456'
# user1.encrypted_password = '123456'
user1.save
# file = File.open('app/assets/images/sally.jpg')
# user1.photo.attach(io: file, filename: 'sally.jpg', content_type: 'image/jpg')

category = Category.new
category.name = 'nature'
category.save

walk = Walk.new(
  creator: user1,
  title: 'Retiro Park',
  description: 'This must see tour through one of Madrids most emblematic parks begins at the Puerta de la Independencia del Retiro.',
  category: category,
  location: 'Madrid, Spain, España',
  rating: 5
)
file = File.open('app/assets/images/retiro.jpg')
walk.photo.attach(io: file, filename: 'retiro.jpg', content_type: 'image/img')
walk.distance = 2390
walk.creator = user1
walk.save
puts walk.title

landmark = Landmark.new
landmark.creator = user1
landmark.title = 'Puerta de la Independencia'
landmark.latitude = '40.41980219794448'
landmark.longitude = '-3.68813812508112'
landmark.description = 'The main entrance to Retiro Park built by the architect José Urioste y Velada.'
file = File.open('app/assets/images/puerta_retiro.png')
landmark.photo.attach(io: file, filename: 'puerta_retiro.png', content_type: 'image/png')
landmark.creator = user1
landmark.save
puts "photo saved"
audio = File.open('app/assets/images/Puerta_De_la_Independencia.mp3')
landmark.audio.attach(io: audio, filename: "Puerta_De_la_Independencia.mp3", content_type: "video/mp3")
prearrival_audio = File.open('app/assets/images/Intro_Retiro.mp3')
landmark.prearrival_audio.attach(io: prearrival_audio, filename: "Intro_Retiro.mp3", content_type: "video/mp3")
landmark.save
puts landmark.title

wl = WalkLandmark.new
wl.walk = walk
wl.landmark = landmark
wl.landmark_order_no = 1
wl.save
puts "Landmark Linked To Walk"

landmark = Landmark.new
landmark.creator = user1
landmark.title = 'Alfonso XII Monument'
landmark.latitude = '40.417440504018366'
landmark.longitude = '-3.683049973659502'
landmark.description = 'This is the largest monument in Retiro and was commissioned in 1875 by María Cristina as a tribute to her late husband, Alfonso XII. The monument represents peace, freedom and progress.'
file = File.open('app/assets/images/alfonsoXII.jpg')
landmark.photo.attach(io: file, filename: 'alfonsoXII.jpg', content_type: 'image/jpg')
landmark.creator = user1
landmark.save
puts "photo saved"
audio = File.open('app/assets/images/test.mp3')
landmark.audio.attach(io: audio, filename: "audio.mp3", content_type: "video/mp3")
prearrival_audio = File.open('app/assets/images/test.mp3')
landmark.prearrival_audio.attach(io: prearrival_audio, filename: "audio.mp3", content_type: "video/mp3")
landmark.save
puts landmark.title

wl = WalkLandmark.new
wl.walk = walk
wl.landmark = landmark
wl.landmark_order_no = 3
wl.save

landmark = Landmark.new
landmark.creator = user1
landmark.title = 'La Rosaleda'
landmark.latitude = '40.410904446810775'
landmark.longitude = '-3.6803869755084424'
landmark.description = 'An elliptical rose garden designed by Cecilio Rodriguez. He was inspired by the Gardens of Bologna in Paris.'
file = File.open('app/assets/images/rosaleda.png')
landmark.photo.attach(io: file, filename: 'rosaleda.png', content_type: 'image/png')
landmark.creator = user1
landmark.save
puts "photo saved"
audio = File.open('app/assets/images/LA_Rosaleda.mp3')
landmark.audio.attach(io: audio, filename: "LA_Rosaleda.mp3", content_type: "video/mp3")
# prearrival_audio = File.open('app/assets/images/test.mp3')
# landmark.prearrival_audio.attach(io: prearrival_audio, filename: "audio.mp3", content_type: "video/mp3")
landmark.save
puts landmark.title

wl = WalkLandmark.new
wl.walk = walk
wl.landmark = landmark
wl.landmark_order_no = 5
wl.save

landmark = Landmark.new
landmark.creator = user1
landmark.title = 'Casita del Pescador'
landmark.latitude = '40.420711165978'
landmark.longitude = '-3.6809420448805135'
landmark.description = 'A small house located in the northwest of Retiro. It was built for the king to enjoy fishing in a relaxed environment.'
file = File.open('app/assets/images/casapescador.png')
landmark.photo.attach(io: file, filename: 'casapescador.png', content_type: 'image/png')
landmark.creator = user1
landmark.save
puts "photo saved"
audio = File.open('app/assets/images/Casita_Del_Pescador.mp3')
landmark.audio.attach(io: audio, filename: "Casita_Del_Pescador.mp3", content_type: "video/mp3")
# prearrival_audio = File.open('app/assets/images/test.mp3')
# landmark.prearrival_audio.attach(io: prearrival_audio, filename: "audio.mp3", content_type: "video/mp3")
landmark.save
puts landmark.title

wl = WalkLandmark.new
wl.walk = walk
wl.landmark = landmark
wl.landmark_order_no = 2
wl.save

landmark = Landmark.new
landmark.creator = user1
landmark.title = 'Estatua del Angel Caido'
landmark.latitude = '40.41115997729375'
landmark.longitude = '-3.6825368025521836'
landmark.description = 'Designed in 1877 by the renowned Madrid sculptors Ricardo Bellver and Francisco Jareño. It is located on top of a Chinese porcelain pedestal, which was destroyed after the Independence War. The statue represents the expulsion of the angel Lucifer to hell.'
file = File.open('app/assets/images/angel.png')
landmark.photo.attach(io: file, filename: 'angel.png', content_type: 'image/png')
landmark.creator = user1
landmark.save
puts "photo saved"
audio = File.open('app/assets/images/test.mp3')
landmark.audio.attach(io: audio, filename: "audio.mp3", content_type: "video/mp3")
prearrival_audio = File.open('app/assets/images/test.mp3')
landmark.prearrival_audio.attach(io: prearrival_audio, filename: "audio.mp3", content_type: "video/mp3")
landmark.save
puts landmark.title

category = Category.new
category.name = 'art'
category.save

wl = WalkLandmark.new
wl.walk = walk
wl.landmark = landmark
wl.landmark_order_no = 4
wl.save

walk = Walk.create!(
  creator: user1,
  title: 'Palacio Real',
  description: 'A tour through the emblematic and majestic royal palace',
  category: category,
  location: 'Madrid, Spain, España',
  rating: rand(4..5))
file = File.open('app/assets/images/palacio.png')
walk.photo.attach(io: file, filename: 'palacio.png', content_type: 'image/png')
walk.creator = user1
walk.distance = 2600
walk.save
puts walk.title

landmark = Landmark.new
landmark.creator = user1
landmark.title = 'Teatro Real'
landmark.latitude = '40.418985125155395'
landmark.longitude = '-3.710492169317648'
landmark.description = 'Majestic first stop on the tour is the never dissapointing view of the main entrance of the Teatro Real de Madrid.'
file = File.open('app/assets/images/opera.png')
landmark.photo.attach(io: file, filename: 'opera.png', content_type: 'image/png')
landmark.creator = user1
landmark.save
puts "photo saved"
audio = File.open('app/assets/images/test.mp3')
landmark.audio.attach(io: audio, filename: "audio.mp3", content_type: "video/mp3")
prearrival_audio = File.open('app/assets/images/test.mp3')
landmark.prearrival_audio.attach(io: prearrival_audio, filename: "audio.mp3", content_type: "video/mp3")
landmark.save
puts landmark.title

wl = WalkLandmark.new
wl.walk = walk
wl.landmark = landmark
wl.landmark_order_no = 1
wl.save

category = Category.new
category.name = 'food'
category.save

walk = Walk.create!(
  creator: user1,
  title: 'Tapas Walk',
  description: 'A tour with some the best tapas offered in Madrid',
  category: category,
  location: 'Madrid, Spain, España',
  rating: rand(4..5))
file = File.open('app/assets/images/tapas.png')
walk.photo.attach(io: file, filename: 'tapas.png', content_type: 'image/png')
walk.creator = user1
walk.distance = 2100
walk.save
puts walk.title

landmark = Landmark.new
landmark.creator = user1
landmark.title = 'Tapas & Mas'
landmark.latitude = '40.415912962717464'
landmark.longitude = '-3.7022579539580915'
landmark.description = 'Looking for a different kind of experience? Tapas & Mas will give you a chance to try some of the highest rated tapas in Madrid.'
file = File.open('app/assets/images/tapasbar.png')
landmark.photo.attach(io: file, filename: 'tapasbar.png', content_type: 'image/png')
landmark.creator = user1
landmark.save
puts "photo saved"
audio = File.open('app/assets/images/test.mp3')
landmark.audio.attach(io: audio, filename: "audio.mp3", content_type: "video/mp3")
prearrival_audio = File.open('app/assets/images/test.mp3')
landmark.prearrival_audio.attach(io: prearrival_audio, filename: "audio.mp3", content_type: "video/mp3")
landmark.save
puts landmark.title

category = Category.new
category.name = 'religion'
category.save

wl = WalkLandmark.new
wl.walk = walk
wl.landmark = landmark
wl.landmark_order_no = 1
wl.save

walk = Walk.create!(
  creator: user1,
  title: 'La Almudena Cathedral',
  description: 'A tour around one of the most beautiful of the Spanish capitals cathedrals',
  category: category,
  location: 'Madrid, Spain, España',
  rating: rand(4..5))
file = File.open('app/assets/images/almudena.jpg')
walk.photo.attach(io: file, filename: 'almudena.jpg', content_type: 'image/jpg')
walk.creator = user1
walk.distance = 2500
walk.save
puts walk.title

landmark = Landmark.new
landmark.creator = user1
landmark.title = 'Entrada a la Catedral'
landmark.latitude = '40.41614110939957'
landmark.longitude = '-3.7144661693176473'
landmark.description = 'Almudena Cathedral is a Catholic church in Madrid, Spain. It is the seat of the Roman Catholic Archdiocese of Madrid. The cathedral was consecrated by Pope John Paul II in 1993.'
file = File.open('app/assets/images/almudenagate.jpg')
landmark.photo.attach(io: file, filename: 'almudena.jpg', content_type: 'image/jpg')
landmark.creator = user1
landmark.save
puts "photo saved"
audio = File.open('app/assets/images/test.mp3')
landmark.audio.attach(io: audio, filename: "audio.mp3", content_type: "video/mp3")
prearrival_audio = File.open('app/assets/images/test.mp3')
landmark.prearrival_audio.attach(io: prearrival_audio, filename: "audio.mp3", content_type: "video/mp3")
landmark.save
puts landmark.title

category = Category.new
category.name = 'art'
category.save

wl = WalkLandmark.new
wl.walk = walk
wl.landmark = landmark
wl.landmark_order_no = 1
wl.save

walk = Walk.create!(
  creator: user1,
  title: 'El Prado Museum',
  description: 'The Prado Museum, officially known as Museo Nacional del Prado, is the main Spanish national art museum, located in central Madrid.',
  category: category,
  location: 'Madrid, Spain, España',
  rating: rand(4..5))
file = File.open('app/assets/images/prado.png')
walk.photo.attach(io: file, filename: 'prado.png', content_type: 'image/png')
walk.creator = user1
walk.distance = 1800
walk.save
puts walk.title

landmark = Landmark.new
landmark.creator = user1
landmark.title = 'Entrada el Prado'
landmark.latitude = '40.41614110939957'
landmark.longitude = '-3.7144661693176473'
landmark.description = 'A prime view of the old entrance to the museum is where we begin our amazing walk through...'
file = File.open('app/assets/images/elprado.png')
landmark.photo.attach(io: file, filename: 'elprado.png', content_type: 'image/jpg')
landmark.creator = user1
landmark.save
puts "photo saved"
audio = File.open('app/assets/images/test.mp3')
landmark.audio.attach(io: audio, filename: "audio.mp3", content_type: "video/mp3")
prearrival_audio = File.open('app/assets/images/test.mp3')
landmark.prearrival_audio.attach(io: prearrival_audio, filename: "audio.mp3", content_type: "video/mp3")
landmark.save
puts landmark.title

wl = WalkLandmark.new
wl.walk = walk
wl.landmark = landmark
wl.landmark_order_no =
wl.save
