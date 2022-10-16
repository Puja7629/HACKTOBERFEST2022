import pyqrcode
import png
link = "https://www.linkedin.com/in/ritika-kumari-53487b212/"
qr_code = pyqrcode.create(link)
qr_code.png("instagram.png", scale=5)
