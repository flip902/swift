import Kitura
import HeliumLogger

HeliumLogger.use()

let router = Router()

router.get("/") {
  request, response, next in
  response.send("Hello, Clearice")
  next()
}


Kitura.addHTTPServer(onPort: 8080, with: router)


Kitura.run()
