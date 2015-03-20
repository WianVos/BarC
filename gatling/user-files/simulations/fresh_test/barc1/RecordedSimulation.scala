package barc1

import scala.concurrent.duration._

import io.gatling.core.Predef._
import io.gatling.http.Predef._
import io.gatling.jdbc.Predef._

class RecordedSimulation extends Simulation {

	val httpProtocol = http
		.baseURL("http://ec2-54-92-231-114.compute-1.amazonaws.com:8080")
		.inferHtmlResources(BlackList(""".*\.js""", """.*\.css""", """.*\.gif""", """.*\.jpeg""", """.*\.jpg""", """.*\.ico""", """.*\.woff""", """.*\.(t|o)tf""", """.*\.png"""), WhiteList())
		.acceptHeader("text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
		.acceptEncodingHeader("gzip, deflate, sdch")
		.acceptLanguageHeader("en-US,en;q=0.8,nl;q=0.6")
		.contentTypeHeader("application/x-www-form-urlencoded")
		.userAgentHeader("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36")

	val headers_1 = Map("Accept" -> "*/*")

	val headers_2 = Map(
		"Accept-Encoding" -> "gzip, deflate",
		"Origin" -> "http://ec2-54-92-231-114.compute-1.amazonaws.com:8080")

    val uri1 = System.getProperty("uri")

	val scn = scenario("RecordedSimulation")
		.exec(http("request_0")
			.get("/JSPWiki/Edit.jsp?page=New1")
			.headers(headers_1))
		.pause(25)
		.exec(http("request_2")
			.post("/JSPWiki/Edit.jsp?page=New1")
			.headers(headers_2)
			.formParam("page", "New1")
			.formParam("action", "save")
			.formParam("encodingcheck", "ぁ")
			.formParam("uuyslq", "-1427091641170")
			.formParam("ok", "Save")
			.formParam("submit_auth", "")
			.formParam("changenote", "")
			.formParam("tbFIND", "")
			.formParam("tbREPLACE", "")
			.formParam("tbGLOBAL", "on")
			.formParam("_editedtext", "test")
			.check(status.is(302)))

	setUp(scn.inject(atOnceUsers(1))).protocols(httpProtocol)
}